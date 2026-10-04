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

## Müzik kısma çağrılarını kaydeden sahte AudioDirector.
class FakeAudio:
	extends Node
	var ducks: Array[bool] = []
	func set_ducked(on: bool) -> void:
		ducks.append(on)

func test_stop_calls_tts_stop_even_after_estimate_elapsed() -> void:
	var stops: Array[int] = []
	_n.tts_stop_backend = func() -> void: stops.append(1)
	_n.say(LINE_ID)
	await wait_for_signal(_n.line_finished, 3.0)
	stops.clear()
	_n.stop()
	assert_eq(stops.size(), 1, "tahmini süre bitse de TTS hâlâ konuşuyor olabilir: kesilmeli")

func test_tts_line_ducks_music_and_restores() -> void:
	var fa: FakeAudio = FakeAudio.new()
	add_child_autofree(fa)
	_n.audio = fa
	_n.say(LINE_ID)
	assert_true(fa.ducks.has(true), "TTS sırasında müzik kısılır")
	await wait_for_signal(_n.line_finished, 3.0)
	assert_false(fa.ducks[fa.ducks.size() - 1], "satır bitince müzik geri gelir")

func test_silent_line_does_not_duck() -> void:
	var fa: FakeAudio = FakeAudio.new()
	add_child_autofree(fa)
	_n.audio = fa
	_n.tts_voice_lookup = func() -> PackedStringArray: return PackedStringArray()
	_n.say(LINE_ID)
	assert_false(fa.ducks.has(true))
	await wait_for_signal(_n.line_finished, 3.0)

func test_utterance_end_finishes_line_once() -> void:
	_n.duration_scale = 0.1
	_n.say(LINE_ID)
	var uid: int = _n.current_utterance_id()
	_n._on_tts_utterance_event(uid + 1000)
	assert_eq(_finished.size(), 0, "başka satırın bitişi yok sayılır")
	_n._on_tts_utterance_event(uid)
	assert_eq(_finished, [LINE_ID] as Array[String], "TTS bitişi satırı hemen bitirir")
	await wait_seconds(0.3)
	assert_eq(_finished.size(), 1, "tahmini süre ikinci kez bitirmez")

func test_utterance_events_extend_fallback_timeout() -> void:
	_n.tts_events_available = true
	_n.duration_scale = 0.05
	_n.say(LINE_ID)
	await wait_seconds(0.2)
	assert_eq(_finished.size(), 0, "TTS bitiş olayı varken tahmin yalnızca geniş bir yedek süredir")
	_n._on_tts_utterance_event(_n.current_utterance_id())
	assert_eq(_finished, [LINE_ID] as Array[String])
