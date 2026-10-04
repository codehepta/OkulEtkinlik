extends Node
## Anlatıcı: ses dosyası varsa çalar, yoksa cihazın Türkçe TTS'ini kullanır, o da yoksa sessiz geçer.
## Her durumda subtitle_requested ve sonunda line_finished yayılır.

signal subtitle_requested(text: String)
signal line_finished(id: String)
## stop() ile anlatım kesildi (line_finished yayılmaz); altyazı balonu gizlenir.
signal line_stopped

const LINES_PATH: String = "res://content/voice_lines.tr.json"
const SECONDS_PER_CHAR: float = 0.07
const MIN_SECONDS: float = 1.0
## TTS bitiş olayları varken tahmini süre yalnızca yedektir: tahmin × çarpan + pay.
const TTS_FALLBACK_FACTOR: float = 3.0
const TTS_FALLBACK_PAD_S: float = 2.0
const TTS_VOLUME: int = 100

## (text: String, voice_id: String) -> void. Varsayılan: önceki konuşmayı keserek okur
## (interrupt = true), utterance kimliği = current_utterance_id().
var tts_backend: Callable = func(text: String, voice_id: String) -> void:
	DisplayServer.tts_speak(text, voice_id, TTS_VOLUME, 1.0, 1.0, _token, true)
## () -> void
var tts_stop_backend: Callable = func() -> void:
	DisplayServer.tts_stop()
## () -> bool; TTS bitiş/iptal olaylarını kaydeder, kaydedebildiyse true. Testlerde değiştirilir.
var tts_events_register: Callable = func() -> bool:
	if not DisplayServer.has_feature(DisplayServer.FEATURE_TEXT_TO_SPEECH):
		return false
	DisplayServer.tts_set_utterance_callback(DisplayServer.TTS_UTTERANCE_ENDED, _on_tts_utterance_event_deferred)
	DisplayServer.tts_set_utterance_callback(DisplayServer.TTS_UTTERANCE_CANCELED, _on_tts_utterance_event_deferred)
	return true
## Cihaz TTS bitiş olaylarını bildiriyor mu? (_ready'de belirlenir)
var tts_events_available: bool = false
## Müzik kısma için ses yöneticisi; testlerde sahte düğümle değiştirilir.
var audio: Node = AudioDirector
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
## TTS/sessiz yolda bitmesi beklenen satırın kimliği.
var _pending_id: String = ""
## Bir TTS satırı başlatıldı ve henüz stop() ile kesilmedi: konuşuyor olabilir.
var _tts_may_speak: bool = false
## line_finished yayılmış son satırın jetonu (bir satıra tek bitiş).
var _finished_token: int = -1

func _ready() -> void:
	_ensure_player()
	tts_events_available = bool(tts_events_register.call())

func say(id: String) -> void:
	_ensure_loaded()
	if not _lines.has(id):
		# Bekleyen ekranlar takılmasın: satır yoksa da bitti sinyali gelir.
		push_warning("Narrator: bilinmeyen ses satırı: " + id)
		line_finished.emit.call_deferred(id)
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
		audio.set_ducked(true)
		_player.finished.connect(_on_player_finished.bind(id, token), CONNECT_ONE_SHOT)
		return
	var voices: PackedStringArray = tts_voice_lookup.call() as PackedStringArray
	var seconds: float = estimate_duration(text) * duration_scale
	if voices.is_empty():
		last_line_silent = true
	else:
		last_line_silent = false
		_tts_may_speak = true
		audio.set_ducked(true)
		tts_backend.call(text, voices[0])
		if tts_events_available:
			seconds = seconds * TTS_FALLBACK_FACTOR + TTS_FALLBACK_PAD_S
	subtitle_requested.emit(text)
	_wait_then_finish(id, token, seconds)

func replay_last() -> void:
	if _last_id != "":
		say(_last_id)

## Sürmekte olan anlatımı keser (line_finished yayılmaz, line_stopped yayılır).
func stop() -> void:
	_token += 1
	if _player != null:
		for c: Dictionary in _player.finished.get_connections():
			_player.finished.disconnect(c["callable"] as Callable)
		_player.stop()
	# Tahmini süre dolmuş olsa da cihaz hâlâ okuyor olabilir: her zaman kes.
	if _tts_may_speak:
		_tts_may_speak = false
		tts_stop_backend.call()
	audio.set_ducked(false)
	line_stopped.emit()

## Son say() çağrısının TTS utterance kimliği.
func current_utterance_id() -> int:
	return _token

## TTS/sessiz yolda tahmini süre (sn).
func estimate_duration(text: String) -> float:
	return maxf(MIN_SECONDS, text.length() * SECONDS_PER_CHAR)

func _wait_then_finish(id: String, token: int, seconds: float) -> void:
	_pending_id = id
	await get_tree().create_timer(seconds).timeout
	_finish_line(id, token)

## Satırı bir kez bitirir (TTS olayı, tahmini süre ya da dosya bitişi; hangisi önce gelirse).
func _finish_line(id: String, token: int) -> void:
	if token != _token or _finished_token == token:
		return
	_finished_token = token
	audio.set_ducked(false)
	line_finished.emit(id)

## DisplayServer TTS bitiş/iptal olayı (ana iş parçacığına ertelenir).
func _on_tts_utterance_event_deferred(utterance_id: int) -> void:
	_on_tts_utterance_event.call_deferred(utterance_id)

func _on_tts_utterance_event(utterance_id: int) -> void:
	if utterance_id != _token:
		return
	_finish_line(_pending_id, utterance_id)

func _on_player_finished(id: String, token: int) -> void:
	_finish_line(id, token)

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
