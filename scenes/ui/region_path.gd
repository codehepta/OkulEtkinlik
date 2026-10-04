extends Control
## Bölge patikası: dersin bütün durakları yatay kaydırılabilir kıvrımlı bir yolda dizilir.

const NarrationWait: GDScript = preload("res://scripts/ui/narration_wait.gd")

const MARGIN: float = 260.0
const SPACING: float = 380.0
const STOP_SIZE: float = 200.0
const BASE_Y: float = 520.0
const AMPLITUDE: float = 200.0
const WAVE: float = 1.1
const CANVAS: Vector2 = Vector2(1920, 1080)
const STAR_SIZE: float = 90.0
const PATH_COLOR: Color = Color(0.85, 0.7, 0.45)
const GLOW_COLOR: Color = Color(1.0, 0.9, 0.3, 0.85)
const SHAKE_PIXELS: float = 14.0

var app: Node = AppState
var args: Dictionary = {}
var subject: String = ""

var _region: String = ""
var _ids: Array[String] = []
var _states: Dictionary = {}
var _buttons: Dictionary = {}
var _highlight: String = ""
var _scroll: ScrollContainer = null
var _navigating: bool = false

func _ready() -> void:
	app.session_timer.limit_reached.connect(_on_limit_reached)

func _exit_tree() -> void:
	if app != null and app.session_timer.limit_reached.is_connected(_on_limit_reached):
		app.session_timer.limit_reached.disconnect(_on_limit_reached)

func enter(a: Dictionary) -> void:
	args = a
	subject = str(a.get("subject", ""))
	_region = str(app.content.SUBJECT_REGION.get(subject, ""))
	for u: Dictionary in app.content.units(app.current_grade(), subject):
		for n: Dictionary in u["nodes"]:
			if n.has("id"):
				_ids.append(str(n["id"]))
	if _ids.is_empty():
		_coming_soon()
		return
	var highlight: String = str(a.get("highlight", ""))
	_highlight = highlight if _ids.has(highlight) else ""
	_build()
	app.audio.play_music("music." + _region)
	app.narrator.say("vo.genel.durak_sec")

## İçeriği olmayan ders: Bilge "yakında" der, harita açılır.
func _coming_soon() -> void:
	await NarrationWait.say(self, app.narrator, "vo.genel.yakinda")
	if is_inside_tree():
		app.goto("world_map")

func stop_ids() -> Array[String]:
	return _ids

func stop_state(node_id: String) -> String:
	return str(_states.get(node_id, ""))

## Parlayan (yeni açılan) durak; yoksa "".
func highlighted() -> String:
	return _highlight

func stop_button(node_id: String) -> Button:
	return _buttons[node_id] as Button

## Kilitliyse hafifçe sallanır; açık ya da tamamsa dersi başlatır.
func tap_stop(node_id: String) -> void:
	if _navigating or not _states.has(node_id):
		return
	if _states[node_id] == "locked":
		_shake(_buttons[node_id] as Button)
		return
	_navigating = true
	app.goto("lesson", {"node_id": node_id})

func _on_limit_reached() -> void:
	app.goto("session_end")

func _stop_center(i: int) -> Vector2:
	return Vector2(MARGIN + i * SPACING, BASE_Y + sin(i * WAVE) * AMPLITUDE)

func _build() -> void:
	var bg: Control = _image("region.%s.bg" % _region)
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(bg)
	bg.set("stretch_mode", TextureRect.STRETCH_KEEP_ASPECT_COVERED)

	_scroll = ScrollContainer.new()
	_scroll.set_anchors_preset(Control.PRESET_FULL_RECT)
	_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_AUTO
	_scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	add_child(_scroll)
	var content: Control = Control.new()
	content.custom_minimum_size = Vector2(MARGIN * 2.0 + (_ids.size() - 1) * SPACING, CANVAS.y)
	_scroll.add_child(content)

	var line: Line2D = Line2D.new()
	line.width = 28.0
	line.default_color = PATH_COLOR
	line.begin_cap_mode = Line2D.LINE_CAP_ROUND
	line.end_cap_mode = Line2D.LINE_CAP_ROUND
	var samples: int = (_ids.size() - 1) * 8
	for s: int in samples + 1:
		var t: float = float(s) / 8.0
		line.add_point(Vector2(MARGIN + t * SPACING, BASE_Y + sin(t * WAVE) * AMPLITUDE))
	content.add_child(line)

	var focus_x: float = -1.0
	for i: int in _ids.size():
		var id: String = _ids[i]
		var state: String = app.progress.node_state(app.profile_id, id)
		_states[id] = state
		var c: Vector2 = _stop_center(i)
		if id == _highlight:
			content.add_child(_glow(c))
		if focus_x < 0.0 and (id == _highlight or (_highlight == "" and state == "open")):
			focus_x = c.x
		var b: Button = _stop_button(state)
		b.position = c - b.size / 2.0
		b.pressed.connect(tap_stop.bind(id))
		content.add_child(b)
		_buttons[id] = b
		if state != "locked":
			content.add_child(_star_row(c, int(app.progress.best_stars(app.profile_id, id))))
	if focus_x >= 0.0:
		_center_on.call_deferred(focus_x)

	var replay: Button = (load("res://scenes/components/replay_voice_button.tscn") as PackedScene).instantiate() as Button
	replay.position = Vector2(24, 24)
	add_child(replay)
	var home: Button = (load("res://scenes/components/big_button.tscn") as PackedScene).instantiate() as Button
	home.set("icon_key", "ui.home")
	home.set_anchors_preset(Control.PRESET_TOP_RIGHT)
	home.offset_left = -152.0
	home.offset_top = 24.0
	home.offset_right = -24.0
	home.offset_bottom = 152.0
	home.pressed.connect(func() -> void: app.goto("world_map"))
	add_child(home)

func _center_on(x: float) -> void:
	_scroll.scroll_horizontal = int(x - CANVAS.x / 2.0)

func _stop_button(state: String) -> Button:
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(STOP_SIZE, STOP_SIZE)
	b.size = Vector2(STOP_SIZE, STOP_SIZE)
	b.focus_mode = Control.FOCUS_NONE
	for st: String in ["normal", "hover", "pressed", "focus"]:
		b.add_theme_stylebox_override(st, StyleBoxEmpty.new())
	var img: Control = _image("map.stop_" + state)
	img.set_anchors_preset(Control.PRESET_FULL_RECT)
	img.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(img)
	img.set("stretch_mode", TextureRect.STRETCH_KEEP_ASPECT_CENTERED)
	return b

func _star_row(center: Vector2, stars: int) -> Control:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 8)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for n: int in 3:
		var s: Control = _image("ui.star" if n < stars else "ui.star_empty")
		row.add_child(s)
		s.custom_minimum_size = Vector2(STAR_SIZE, STAR_SIZE)
		s.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.position = Vector2(center.x - (3.0 * STAR_SIZE + 16.0) / 2.0, center.y + STOP_SIZE / 2.0 + 8.0)
	return row

## Yeni açılan durağın halesi; hareket azaltılmışsa sabit durur.
func _glow(center: Vector2) -> Control:
	var ring: Panel = Panel.new()
	var size_px: float = STOP_SIZE + 60.0
	ring.size = Vector2(size_px, size_px)
	ring.position = center - ring.size / 2.0
	ring.pivot_offset = ring.size / 2.0
	ring.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var box: StyleBoxFlat = StyleBoxFlat.new()
	box.bg_color = GLOW_COLOR
	box.set_corner_radius_all(int(size_px / 2.0))
	ring.add_theme_stylebox_override("panel", box)
	if not app.reduce_motion():
		var tw: Tween = ring.create_tween().set_loops()
		tw.tween_property(ring, "scale", Vector2(1.12, 1.12), 0.6)
		tw.tween_property(ring, "scale", Vector2.ONE, 0.6)
	return ring

func _shake(b: Button) -> void:
	if app.reduce_motion():
		return
	var x: float = b.position.x
	var tw: Tween = b.create_tween()
	tw.tween_property(b, "position:x", x - SHAKE_PIXELS, 0.05)
	tw.tween_property(b, "position:x", x + SHAKE_PIXELS, 0.1)
	tw.tween_property(b, "position:x", x, 0.05)

func _image(key: String) -> Control:
	var img: Control = (load("res://scenes/components/asset_image.tscn") as PackedScene).instantiate() as Control
	img.set("key", key)
	return img
