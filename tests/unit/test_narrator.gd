extends GutTest
## Narrator testleri: ses dosyası > TTS > sessiz yol. TTS asla gerçekten çağrılmaz.

const NARRATOR_SCRIPT: String = "res://autoload/narrator.gd"
const LINE_ID: String = "vo.genel.aferin_1"
const LINE_TEXT: String = "Aferin!"

var _n: Node = null
var _tts_calls: Array = []
var _subtitles: Array[String] = []
var _finished: Array[String] = []

func before_each() -> void:
	_tts_calls = []
	_subtitles = []
	_finished = []
	_n = load(NARRATOR_SCRIPT).new()
	add_child_autofree(_n)
	_n.tts_backend = func(text: String, voice_id: String) -> void: _tts_calls.append([text, voice_id])
	_n.tts_stop_backend = func() -> void: pass
	_n.tts_voice_lookup = func() -> PackedStringArray: return PackedStringArray(["tr-voice"])
	_n.audio_lookup = func(_key: String) -> AudioStream: return null
	_n.duration_scale = 0.01
	_n.subtitle_requested.connect(func(t: String) -> void: _subtitles.append(t))
	_n.line_finished.connect(func(id: String) -> void: _finished.append(id))

func test_audio_file_preferred_over_tts() -> void:
	var stream: AudioStreamWAV = AudioStreamWAV.new()
	stream.format = AudioStreamWAV.FORMAT_8_BITS
	stream.mix_rate = 8000
	stream.data = PackedByteArray([128, 128, 128, 128])
	_n.audio_lookup = func(_key: String) -> AudioStream: return stream
	_n.say(LINE_ID)
	assert_eq(_tts_calls.size(), 0)
	assert_eq(_subtitles, [LINE_TEXT] as Array[String])
	await wait_for_signal(_n.line_finished, 3.0)
	assert_eq(_finished, [LINE_ID] as Array[String])
	assert_eq(_tts_calls.size(), 0)

func test_falls_back_to_tts_when_no_file() -> void:
	_n.say(LINE_ID)
	assert_eq(_tts_calls.size(), 1)
	assert_eq(_tts_calls[0][0], LINE_TEXT)
	assert_eq(_tts_calls[0][1], "tr-voice")
	await wait_for_signal(_n.line_finished, 3.0)
	assert_eq(_finished, [LINE_ID] as Array[String])
	assert_false(_n.last_line_silent)

func test_no_turkish_voice_emits_subtitle() -> void:
	_n.tts_voice_lookup = func() -> PackedStringArray: return PackedStringArray()
	_n.say(LINE_ID)
	assert_eq(_tts_calls.size(), 0)
	assert_eq(_subtitles, [LINE_TEXT] as Array[String])
	assert_true(_n.last_line_silent)
	await wait_for_signal(_n.line_finished, 3.0)
	assert_eq(_finished, [LINE_ID] as Array[String])

func test_unknown_line_id_does_not_crash() -> void:
	_n.say("vo.yok.yok")
	assert_eq(_tts_calls.size(), 0)
	assert_eq(_subtitles.size(), 0)

func test_unknown_line_id_still_emits_line_finished() -> void:
	_n.say("vo.yok.yok")
	await wait_for_signal(_n.line_finished, 2.0)
	assert_eq(_finished, ["vo.yok.yok"] as Array[String])

func test_estimated_duration() -> void:
	assert_eq(_n.estimate_duration("abc"), 1.0)
	assert_almost_eq(_n.estimate_duration("a".repeat(100)), 7.0, 0.001)

func test_replay_last_repeats_line() -> void:
	_n.say(LINE_ID)
	_n.replay_last()
	assert_eq(_tts_calls.size(), 2)
	_n.stop()
