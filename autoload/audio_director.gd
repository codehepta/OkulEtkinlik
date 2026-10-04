extends Node
## Ses yönetimi: Master/Voice/Music/SFX kanalları, müzik, efekt, ducking.

const DUCK_DB: float = -12.0
const SFX_POLYPHONY: int = 4

var _music_player: AudioStreamPlayer
var _sfx_players: Array[AudioStreamPlayer] = []
var _vol_music: float = 1.0
var _ducked: bool = false
var _music_key: String = ""

func _ready() -> void:
	_music_player = AudioStreamPlayer.new()
	_music_player.bus = &"Music"
	add_child(_music_player)
	for i: int in SFX_POLYPHONY:
		var p: AudioStreamPlayer = AudioStreamPlayer.new()
		p.bus = &"SFX"
		add_child(p)
		_sfx_players.append(p)

## Müziği çalar (aynı anahtar zaten çalıyorsa dokunmaz). Dosya yoksa sessiz kalır.
func play_music(key: String) -> void:
	if key == _music_key and _music_player.playing:
		return
	_music_key = key
	var stream: AudioStream = AssetRegistry.audio(key)
	if stream == null:
		_music_player.stop()
		return
	if stream is AudioStreamOggVorbis:
		(stream as AudioStreamOggVorbis).loop = true
	elif stream is AudioStreamMP3:
		(stream as AudioStreamMP3).loop = true
	_music_player.stream = stream
	_music_player.play()

func play_sfx(key: String) -> void:
	var stream: AudioStream = AssetRegistry.audio(key)
	if stream == null:
		return
	for p: AudioStreamPlayer in _sfx_players:
		if not p.playing:
			p.stream = stream
			p.play()
			return
	_sfx_players[0].stream = stream
	_sfx_players[0].play()

## Anlatım sırasında müziği −12 dB kısar.
func set_ducked(on: bool) -> void:
	_ducked = on
	_apply_music()

## settings: {vol_voice, vol_music, vol_sfx} doğrusal 0–1.
func apply_volumes(settings: Dictionary) -> void:
	_set_bus_linear("Voice", float(settings.get("vol_voice", 1.0)))
	_set_bus_linear("SFX", float(settings.get("vol_sfx", 1.0)))
	_vol_music = float(settings.get("vol_music", 1.0))
	_apply_music()

func _apply_music() -> void:
	_set_bus_linear("Music", _vol_music, DUCK_DB if _ducked else 0.0)

func _set_bus_linear(bus_name: String, linear: float, offset_db: float = 0.0) -> void:
	var idx: int = AudioServer.get_bus_index(bus_name)
	if idx == -1:
		return
	var v: float = clampf(linear, 0.0, 1.0)
	AudioServer.set_bus_mute(idx, v <= 0.0)
	if v > 0.0:
		AudioServer.set_bus_volume_db(idx, linear_to_db(v) + offset_db)
