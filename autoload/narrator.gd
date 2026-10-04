extends Node
## Anlatıcı: ses dosyası varsa çalar, yoksa cihazın Türkçe TTS'ini kullanır, o da yoksa sessiz geçer.
## Her durumda subtitle_requested ve sonunda line_finished yayılır.

signal subtitle_requested(text: String)
signal line_finished(id: String)

const LINES_PATH: String = "res://content/voice_lines.tr.json"
const SECONDS_PER_CHAR: float = 0.07
const MIN_SECONDS: float = 1.0

## (text: String, voice_id: String) -> void
var tts_backend: Callable = func(text: String, voice_id: String) -> void:
	DisplayServer.tts_speak(text, voice_id)
## () -> void
var tts_stop_backend: Callable = func() -> void:
	DisplayServer.tts_stop()
## () -> PackedStringArray
var tts_voice_lookup: Callable = func() -> PackedStringArray:
	return DisplayServer.tts_get_voices_for_language("tr")
## (key: String) -> AudioStream
var audio_lookup: Callable = func(key: String) -> AudioStream:
	return AssetRegistry.audio(key)
## Tahmini süre çarpanı (testlerde kısaltmak için).
var duration_scale: float = 1.0
## Son satır sessiz yolda (ses dosyası da TTS de yok) mı geçti? Altyazı bunu okur.
var last_line_silent: bool = false

var _lines: Dictionary = {}
var _loaded: bool = false
var _last_id: String = ""
var _token: int = 0
var _player: AudioStreamPlayer
var _tts_active: bool = false

func _ready() -> void:
	_ensure_player()

func say(id: String) -> void:
	_ensure_loaded()
	if not _lines.has(id):
		return
	stop()
	_last_id = id
	var text: String = str((_lines[id] as Dictionary).get("text", ""))
	_token += 1
	var token: int = _token
	var stream: AudioStream = audio_lookup.call(id) as AudioStream
	if stream != null:
		last_line_silent = false
		subtitle_requested.emit(text)
		_ensure_player()
		_player.stream = stream
		_player.play()
		AudioDirector.set_ducked(true)
		_player.finished.connect(_on_player_finished.bind(id, token), CONNECT_ONE_SHOT)
		return
	var voices: PackedStringArray = tts_voice_lookup.call() as PackedStringArray
	if voices.is_empty():
		last_line_silent = true
	else:
		last_line_silent = false
		_tts_active = true
		tts_backend.call(text, voices[0])
	subtitle_requested.emit(text)
	_wait_then_finish(id, token, estimate_duration(text) * duration_scale)

func replay_last() -> void:
	if _last_id != "":
		say(_last_id)

## Sürmekte olan anlatımı keser (line_finished yayılmaz).
func stop() -> void:
	_token += 1
	if _player != null:
		for c: Dictionary in _player.finished.get_connections():
			_player.finished.disconnect(c["callable"] as Callable)
		_player.stop()
	if _tts_active:
		_tts_active = false
		tts_stop_backend.call()
	AudioDirector.set_ducked(false)

## TTS/sessiz yolda tahmini süre (sn).
func estimate_duration(text: String) -> float:
	return maxf(MIN_SECONDS, text.length() * SECONDS_PER_CHAR)

func _wait_then_finish(id: String, token: int, seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
	if token == _token:
		_tts_active = false
		line_finished.emit(id)

func _on_player_finished(id: String, token: int) -> void:
	if token != _token:
		return
	AudioDirector.set_ducked(false)
	line_finished.emit(id)

func _ensure_player() -> void:
	if _player != null:
		return
	_player = AudioStreamPlayer.new()
	_player.bus = &"Voice"
	add_child(_player)

func _ensure_loaded() -> void:
	if _loaded:
		return
	_loaded = true
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(LINES_PATH))
	if parsed is Dictionary:
		_lines = parsed
	else:
		push_error("voice_lines.tr.json okunamadı: " + LINES_PATH)
