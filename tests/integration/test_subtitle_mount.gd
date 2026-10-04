extends GutTest
## Altyazı balonu: uygulama genelinde tek balon takılı; TTS sesi yokken metin görünür,
## stop() ve satır bitişi (kısa bekleme sonrası) balonu gizler.

const BUBBLE_SCENE: String = "res://scenes/components/subtitle_bubble.tscn"
const NARRATOR_SCRIPT: String = "res://autoload/narrator.gd"
const LINE_ID: String = "vo.genel.aferin_1"
const LINE_TEXT: String = "Aferin!"

var _n: Node = null
var _bubble: Control = null

func before_each() -> void:
	_n = load(NARRATOR_SCRIPT).new()
	_n.tts_backend = func(_text: String, _voice_id: String) -> void: pass
	_n.tts_stop_backend = func() -> void: pass
	_n.tts_voice_lookup = func() -> PackedStringArray: return PackedStringArray()
	_n.audio_lookup = func(_key: String) -> AudioStream: return null
	_n.duration_scale = 0.05
	add_child_autofree(_n)
	_bubble = (load(BUBBLE_SCENE) as PackedScene).instantiate() as Control
	_bubble.set("narrator", _n)
	_bubble.set("grade_provider", func() -> int: return 1)
	_bubble.set("linger_seconds", 0.2)
	add_child_autofree(_bubble)

func _label_text() -> String:
	return (_bubble.get_node("Label") as Label).text

func test_app_state_mounts_one_bubble_above_screens() -> void:
	var app: Node = get_tree().root.get_node("AppState")
	var layer: CanvasLayer = app.get_node_or_null("SubtitleLayer") as CanvasLayer
	assert_not_null(layer, "AppState altyazı katmanını takar")
	if layer == null:
		return
	assert_gt(layer.layer, 0, "ekranların üstünde")
	assert_not_null(layer.get_node_or_null("SubtitleBubble"))
	var b: Control = layer.get_node("SubtitleBubble") as Control
	assert_eq(b.mouse_filter, Control.MOUSE_FILTER_IGNORE, "dokunmaları engellemez")

func test_no_tts_voice_shows_text_even_for_grade_1() -> void:
	_n.say(LINE_ID)
	assert_true(_bubble.visible, "Türkçe ses yokken yönerge yazıyla görünür")
	assert_eq(_label_text(), LINE_TEXT)

func test_stop_hides_bubble() -> void:
	_n.say(LINE_ID)
	assert_true(_bubble.visible)
	_n.stop()
	assert_false(_bubble.visible, "anlatım kesilince balon gizlenir")

func test_line_finished_hides_after_linger() -> void:
	_n.say(LINE_ID)
	await wait_for_signal(_n.line_finished, 2.0)
	assert_true(_bubble.visible, "bitişten hemen sonra kısa süre kalır")
	await wait_seconds(0.4)
	assert_false(_bubble.visible, "bekleme sonrası gizlenir")

func test_new_line_during_linger_stays_visible() -> void:
	_n.say(LINE_ID)
	await wait_for_signal(_n.line_finished, 2.0)
	_n.duration_scale = 10.0
	_n.say(LINE_ID)
	await wait_seconds(0.4)
	assert_true(_bubble.visible, "yeni satır eski gizleme zamanlayıcısını iptal eder")
	_n.stop()

func test_hidden_placement_hides_bubble() -> void:
	_bubble.set("placement_provider", func() -> String: return "hidden")
	_n.say(LINE_ID)
	assert_false(_bubble.visible, "veli ekranında balon gösterilmez")

func test_top_placement_anchors_to_top() -> void:
	_bubble.set("placement_provider", func() -> String: return "top")
	_n.say(LINE_ID)
	assert_true(_bubble.visible)
	assert_eq(_bubble.anchor_top, 0.0)
	assert_eq(_bubble.call("placement"), "top")
	await wait_process_frames(2)
	assert_lt(_bubble.position.y, 100.0, "üst şeritte")

func test_bubble_sizes_to_text() -> void:
	_bubble.set("placement_provider", func() -> String: return "bottom")
	_n.say(LINE_ID)
	await wait_process_frames(3)
	var max_w: float = float(_bubble.get("MAX_TEXT_WIDTH"))
	assert_lt(_bubble.size.x, max_w / 2.0, "kısa metin: dar balon")
	assert_lt(_bubble.size.y, 140.0, "tek satır: alçak balon")
	var vp: Vector2 = _bubble.get_viewport_rect().size
	assert_almost_eq(_bubble.position.y + _bubble.size.y, vp.y - 24.0, 2.0, "alt kenardan 24 px yukarıda")

func test_long_text_wraps_within_max_width() -> void:
	var long: String = "İstersen kendine bir takma ad yazabilirsin. Bir büyüğünden yardım iste. İstemezsen Geç düğmesine dokun."
	var w: float = float(_bubble.call("text_width", long))
	assert_lte(w, float(_bubble.get("MAX_TEXT_WIDTH")))
	assert_gt(w, 400.0)
