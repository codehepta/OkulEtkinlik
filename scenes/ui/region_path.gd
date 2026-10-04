extends Control
## Bölge patikası: dersin bütün durakları yatay kaydırılabilir kıvrımlı, kalın kil bir yolda
## dizilir. Her durağın üstünde numaralı kil rozet vardır; açık durak hafifçe nabız atar.
## Ekrana sığmayan duraklar için kenarlarda kaydırma okları görünür. Dersin vadesi gelen
## çıktıları varsa sağ üstte Tekrar Bulutu durağı belirir (spec §3.4).

const NarrationWait: GDScript = preload("res://scripts/ui/narration_wait.gd")

const MARGIN: float = 260.0
const SPACING: float = 380.0
const STOP_SIZE: float = 200.0
const BASE_Y: float = 520.0
const AMPLITUDE: float = 200.0
const WAVE: float = 1.1
const CANVAS: Vector2 = Vector2(1920, 1080)
const STAR_SIZE: float = 68.0
## Yıldızlar durağın altında küçük bir yay çizer; durağın kendi genişliğinde kalır,
## komşu durağa ve halesine hiç taşmaz.
const STAR_STEP: float = 72.0
const STAR_ARC: float = 14.0
## Hale dahil bir durağın kapladığı kare.
const FOOTPRINT: float = STOP_SIZE + 60.0
## Kil patika katmanları (alttan üste): gölge, koyu kenar, gövde, üst parlaklık.
const PATH_SHADOW: Color = ClayStyle.SHADOW
const PATH_EDGE: Color = ClayStyle.CLAY_EDGE
const PATH_BODY: Color = ClayStyle.SAND
const PATH_SHINE: Color = Color(ClayStyle.IVORY, 0.85)
const PATH_WIDTH: float = 70.0
const PATH_EDGE_WIDTH: float = 10.0
const PATH_SHADOW_OFFSET: Vector2 = Vector2(0, 14)
const PATH_SHINE_OFFSET: Vector2 = Vector2(0, -14)
const PATH_SHINE_WIDTH: float = 14.0
## Numara rozeti.
const NUMBER_SIZE: float = 84.0
const NUMBER_FONT_SIZE: int = 52
const NUMBER_FILL: Color = ClayStyle.IVORY
const NUMBER_EDGE: Color = ClayStyle.CLAY_EDGE
const NUMBER_TEXT: Color = ClayStyle.INK
## Açık durağın nabzı.
const PULSE_SCALE: float = 1.07
const PULSE_SECONDS: float = 0.9
## Kaydırma okları.
const ARROW_SIZE: float = 136.0
const ARROW_MARGIN: float = 24.0
const ARROW_FILL: Color = ClayStyle.APRICOT
const ARROW_INK: Color = ClayStyle.TITLE_INK
const ARROW_STEP: float = 760.0
const ARROW_SCROLL_SECONDS: float = 0.45
const GLOW_COLOR: Color = ClayStyle.GLOW
const SHAKE_PIXELS: float = 14.0
## Tekrar Bulutu durağı: ev düğmesinin solunda, durakların üstündeki şeritte.
const CLOUD_SIZE: Vector2 = Vector2(224, 176)
const CLOUD_RIGHT: float = 176.0
const CLOUD_TOP: float = 16.0

var app: Node = AppState
var args: Dictionary = {}
var subject: String = ""

var _region: String = ""
var _ids: Array[String] = []
var _states: Dictionary = {}
var _buttons: Dictionary = {}
var _highlight: String = ""
var _scroll: ScrollContainer = null
var _pulsing: Dictionary = {}
var _stars: Dictionary = {}
var _centers: Dictionary = {}
var _arrow_left: Button = null
var _arrow_right: Button = null
var _navigating: bool = false
var _review_button: Button = null

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
	app.narrator.say("vo.genel.tekrar_bulutu" if _review_button != null else "vo.genel.durak_sec")

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

## Durağın rozetindeki numara (1'den başlar).
func stop_number(node_id: String) -> int:
	return _ids.find(node_id) + 1

## Durak nabız atıyor mu (yalnızca açık durak, hareket azaltılmamışsa).
func stop_pulsing(node_id: String) -> bool:
	return bool(_pulsing.get(node_id, false))

## Kilitliyse hafifçe sallanır; açık ya da tamamsa dersi başlatır.
func tap_stop(node_id: String) -> void:
	if _navigating or not _states.has(node_id):
		return
	if _states[node_id] == "locked":
		_shake(_buttons[node_id] as Button)
		return
	_navigating = true
	app.goto("lesson", {"node_id": node_id})

## Tekrar Bulutu durağı (vadesi gelen çıktı yoksa null).
func review_button() -> Button:
	return _review_button

## Tekrar Bulutu oturumunu başlatır.
func tap_review() -> void:
	if _navigating or _review_button == null:
		return
	_navigating = true
	app.goto("lesson", {"review": subject})

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
	# İnce varsayılan kaydırma çubuğu gizli; sürükleyerek ya da oklarla kaydırılır.
	_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_SHOW_NEVER
	_scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	add_child(_scroll)
	var content: Control = Control.new()
	content.custom_minimum_size = Vector2(MARGIN * 2.0 + (_ids.size() - 1) * SPACING, CANVAS.y)
	_scroll.add_child(content)

	var points: PackedVector2Array = _path_points()
	content.add_child(_path_line(points, PATH_SHADOW, PATH_WIDTH + PATH_EDGE_WIDTH * 2.0, PATH_SHADOW_OFFSET))
	content.add_child(_path_line(points, PATH_EDGE, PATH_WIDTH + PATH_EDGE_WIDTH * 2.0, Vector2.ZERO))
	content.add_child(_path_line(points, PATH_BODY, PATH_WIDTH, Vector2.ZERO))
	content.add_child(_path_line(points, PATH_SHINE, PATH_SHINE_WIDTH, PATH_SHINE_OFFSET))

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
		b.add_child(_number_badge(i + 1))
		if state == "open":
			_pulsing[id] = _pulse(b)
		if state != "locked":
			var row: Control = _star_row(c, int(app.progress.best_stars(app.profile_id, id)))
			content.add_child(row)
			_stars[id] = row
		_centers[id] = c
	if focus_x >= 0.0:
		_center_on.call_deferred(focus_x)

	_scroll.get_h_scroll_bar().value_changed.connect(func(_v: float) -> void: _update_arrows())
	_scroll.get_h_scroll_bar().changed.connect(_update_arrows)
	_arrow_left = _arrow_button(-1)
	_arrow_right = _arrow_button(1)
	add_child(_arrow_left)
	add_child(_arrow_right)
	_update_arrows.call_deferred()

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
	if not app.progress.review_codes(app.profile_id, subject).is_empty():
		_review_button = _cloud_button()
		add_child(_review_button)

## Tekrar Bulutu: hafifçe süzülen kil bulut; hareket azaltılmışsa sabit durur.
func _cloud_button() -> Button:
	var b: Button = Button.new()
	b.name = "ReviewCloud"
	b.focus_mode = Control.FOCUS_NONE
	for st: String in ["normal", "hover", "pressed", "focus"]:
		b.add_theme_stylebox_override(st, StyleBoxEmpty.new())
	b.set_anchors_preset(Control.PRESET_TOP_RIGHT)
	b.offset_left = -CLOUD_RIGHT - CLOUD_SIZE.x
	b.offset_right = -CLOUD_RIGHT
	b.offset_top = CLOUD_TOP
	b.offset_bottom = CLOUD_TOP + CLOUD_SIZE.y
	var img: Control = _image("map.stop_review")
	img.set_anchors_preset(Control.PRESET_FULL_RECT)
	img.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(img)
	img.set("stretch_mode", TextureRect.STRETCH_KEEP_ASPECT_CENTERED)
	b.pressed.connect(tap_review)
	_pulse(b)
	return b

## Patika eğrisi: ilk duraktan son durağa yumuşak sinüs.
func _path_points() -> PackedVector2Array:
	var pts: PackedVector2Array = PackedVector2Array()
	var samples: int = maxi((_ids.size() - 1) * 12, 1)
	var last: float = float(_ids.size() - 1)
	for s: int in samples + 1:
		var t: float = last * float(s) / float(samples)
		pts.append(Vector2(MARGIN + t * SPACING, BASE_Y + sin(t * WAVE) * AMPLITUDE))
	return pts

func _path_line(points: PackedVector2Array, color: Color, width: float, offset: Vector2) -> Line2D:
	var line: Line2D = Line2D.new()
	line.points = points
	line.position = offset
	line.width = width
	line.default_color = color
	line.joint_mode = Line2D.LINE_JOINT_ROUND
	line.begin_cap_mode = Line2D.LINE_CAP_ROUND
	line.end_cap_mode = Line2D.LINE_CAP_ROUND
	line.antialiased = true
	return line

## Durağın üst ortasına taşan kil numara rozeti (rakam).
func _number_badge(n: int) -> Control:
	var badge: Panel = Panel.new()
	badge.mouse_filter = Control.MOUSE_FILTER_IGNORE
	badge.size = Vector2(NUMBER_SIZE, NUMBER_SIZE)
	badge.position = Vector2((STOP_SIZE - NUMBER_SIZE) / 2.0, -NUMBER_SIZE * 0.55)
	badge.add_theme_stylebox_override("panel", ClayStyle.plaque_box(NUMBER_FILL, NUMBER_EDGE, int(NUMBER_SIZE / 2.0), 5, 4, 6, 0.0, 0.0))
	var label: Label = Label.new()
	label.text = str(n)
	label.set_anchors_preset(Control.PRESET_FULL_RECT)
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.add_theme_font_size_override("font_size", NUMBER_FONT_SIZE)
	label.add_theme_color_override("font_color", NUMBER_TEXT)
	label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	badge.add_child(label)
	return badge

## Açık durak yavaşça büyüyüp küçülür; hareket azaltılmışsa sabit durur.
func _pulse(b: Button) -> bool:
	if app.reduce_motion():
		return false
	b.pivot_offset = b.size / 2.0
	var tw: Tween = b.create_tween().set_loops()
	tw.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tw.tween_property(b, "scale", Vector2(PULSE_SCALE, PULSE_SCALE), PULSE_SECONDS)
	tw.tween_property(b, "scale", Vector2.ONE, PULSE_SECONDS)
	return true

## Kenardaki kaydırma oku (yön: -1 sol, 1 sağ); ok şekli çizilir, metin yoktur.
func _arrow_button(dir: int) -> Button:
	var b: Button = Button.new()
	b.focus_mode = Control.FOCUS_NONE
	b.custom_minimum_size = Vector2(ARROW_SIZE, ARROW_SIZE)
	# Alt köşelerde: durakların ve yıldız sıralarının altında kalır.
	var preset: Control.LayoutPreset = Control.PRESET_BOTTOM_RIGHT if dir > 0 else Control.PRESET_BOTTOM_LEFT
	b.set_anchors_preset(preset)
	b.offset_top = -ARROW_SIZE - ARROW_MARGIN
	b.offset_bottom = -ARROW_MARGIN
	if dir > 0:
		b.offset_left = -ARROW_SIZE - ARROW_MARGIN
		b.offset_right = -ARROW_MARGIN
	else:
		b.offset_left = ARROW_MARGIN
		b.offset_right = ARROW_SIZE + ARROW_MARGIN
	ClayStyle.style_button(b, ARROW_FILL, int(ARROW_SIZE / 2.0))
	b.draw.connect(func() -> void:
		var c: Vector2 = b.size / 2.0 + Vector2(6.0 * dir, -2.0)
		var w: float = ARROW_SIZE * 0.22
		var tri: PackedVector2Array = PackedVector2Array([
			c + Vector2(w * dir, 0), c + Vector2(-w * 0.8 * dir, -w), c + Vector2(-w * 0.8 * dir, w)])
		b.draw_colored_polygon(tri, ARROW_INK))
	b.pressed.connect(func() -> void: _scroll_by(ARROW_STEP * dir))
	return b

func _scroll_by(dx: float) -> void:
	var bar: HScrollBar = _scroll.get_h_scroll_bar()
	var target: float = clampf(bar.value + dx, 0.0, maxf(bar.max_value - bar.page, 0.0))
	if app.reduce_motion():
		_scroll.scroll_horizontal = int(target)
		return
	var tw: Tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tw.tween_property(_scroll, "scroll_horizontal", int(target), ARROW_SCROLL_SECONDS)

## Okları yalnızca o yönde görünmeyen durak kaldıysa gösterir.
func _update_arrows() -> void:
	if _scroll == null or _arrow_left == null:
		return
	var bar: HScrollBar = _scroll.get_h_scroll_bar()
	var max_scroll: float = maxf(bar.max_value - bar.page, 0.0)
	_arrow_left.visible = bar.value > 1.0
	_arrow_right.visible = bar.value < max_scroll - 1.0

func _center_on(x: float) -> void:
	# ScrollContainer yerleşimi bir kare sonra hazır olur.
	await get_tree().process_frame
	if not is_inside_tree():
		return
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

## Üç yıldız durağın alt kenarında yay biçiminde (ortadaki biraz aşağıda).
func _star_row(center: Vector2, stars: int) -> Control:
	var row: Control = Control.new()
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.position = Vector2(center.x, center.y + STOP_SIZE / 2.0 - STAR_SIZE * 0.35)
	for n: int in 3:
		var s: Control = _image("ui.star" if n < stars else "ui.star_empty")
		s.set("min_side", 0.0)
		s.mouse_filter = Control.MOUSE_FILTER_IGNORE
		row.add_child(s)
		s.custom_minimum_size = Vector2(STAR_SIZE, STAR_SIZE)
		s.size = Vector2(STAR_SIZE, STAR_SIZE)
		var dx: float = (n - 1) * STAR_STEP
		var dy: float = STAR_ARC if n == 1 else 0.0
		s.position = Vector2(dx - STAR_SIZE / 2.0, dy)
	return row

## Durağın yıldızlarının patika içeriğindeki dikdörtgenleri (kilitli durakta boş).
func star_rects(node_id: String) -> Array[Rect2]:
	var out: Array[Rect2] = []
	var row: Control = _stars.get(node_id, null) as Control
	if row == null:
		return out
	for c: Node in row.get_children():
		var s: Control = c as Control
		out.append(Rect2(row.position + s.position, s.size))
	return out

## Durağın hale dahil kapladığı alan (patika içeriğinde); numara rozeti de bunun içindedir.
func stop_footprint(node_id: String) -> Rect2:
	var c: Vector2 = _centers.get(node_id, Vector2.ZERO)
	return Rect2(c - Vector2(FOOTPRINT, FOOTPRINT) / 2.0, Vector2(FOOTPRINT, FOOTPRINT))

## Yeni açılan durağın halesi; hareket azaltılmışsa sabit durur.
func _glow(center: Vector2) -> Control:
	var ring: Panel = Panel.new()
	var size_px: float = STOP_SIZE + 60.0
	ring.size = Vector2(size_px, size_px)
	ring.position = center - ring.size / 2.0
	ring.pivot_offset = ring.size / 2.0
	ring.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ring.add_theme_stylebox_override("panel", ClayStyle.soft_box(GLOW_COLOR, int(size_px / 2.0)))
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
