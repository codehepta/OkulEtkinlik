extends Control
## Oturum sonu: süre dolduğunda sakin gece zemininde büyük, uykulu Bilge; tekrar dinle ve
## tek düğme "Bir büyüğünü çağır" (veli kapısı -> panel). Çocuğu bir yetişkine yönlendirir.
## Oyun ekranı değildir; AppState kilit koruması burayı yönlendirmez.

const NIGHT_KEY: String = "ui.bg_night"
const CALL_ICON_KEY: String = "ui.call_grownup"
const BILGE_KEY: String = "char.bilge.sleepy"
## sleepy.png 799×1024: yükseklik 660 px.
const BILGE_SIZE: Vector2 = Vector2(516, 660)
const BUTTON_SIZE: Vector2 = Vector2(760, 200)
const BUTTON_COLOR: Color = ClayStyle.BUTTER
const BUTTON_TEXT_COLOR: Color = ClayStyle.INK
const BUTTON_FONT_SIZE: int = 52
const SKY_TOP: Color = ClayStyle.NIGHT_TOP
const SKY_MID: Color = ClayStyle.NIGHT_MID
const SKY_BOTTOM: Color = ClayStyle.NIGHT_BOTTOM
const BREATH_SECONDS: float = 2.6

var app: Node = AppState
var args: Dictionary = {}

var _parent_button: Button = null
var _bilge: Control = null
var _night: Control = null

func _ready() -> void:
	_night = _make_backdrop()
	add_child(_night)

	var row: HBoxContainer = HBoxContainer.new()
	row.set_anchors_preset(Control.PRESET_FULL_RECT)
	row.offset_left = 120.0
	row.offset_right = -120.0
	row.offset_top = 80.0
	row.offset_bottom = -80.0
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.add_theme_constant_override("separation", 96)
	add_child(row)

	_bilge = (load("res://scenes/components/asset_image.tscn") as PackedScene).instantiate() as Control
	_bilge.name = "SleepyBilge"
	_bilge.set("key", BILGE_KEY)
	row.add_child(_bilge)
	_bilge.custom_minimum_size = BILGE_SIZE
	_bilge.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_bilge.mouse_filter = Control.MOUSE_FILTER_IGNORE

	var holder: CenterContainer = CenterContainer.new()
	row.add_child(holder)
	_parent_button = _make_call_button()
	holder.add_child(_parent_button)

	# Her yönerge tekrar dinlenebilir: sol üstte "tekrar dinle".
	var replay: Button = (load("res://scenes/components/replay_voice_button.tscn") as PackedScene).instantiate() as Button
	replay.set("narrator", app.narrator)
	replay.position = Vector2(24, 24)
	add_child(replay)

	app.narrator.say("vo.genel.uyku_zamani")
	_start_breathing.call_deferred()

func enter(a: Dictionary) -> void:
	args = a

func parent_button() -> Button:
	return _parent_button

func bilge_view() -> Control:
	return _bilge

func open_parent_gate() -> void:
	app.goto("parent_gate", {"next": {"scene": "parent_panel", "args": {}}, "back": "profile_select"})

## Büyük kil düğme: solda "büyüğünü çağır" simgesi, sağda strings'ten gelen metin.
func _make_call_button() -> Button:
	var btn: Button = (load("res://scenes/components/big_button.tscn") as PackedScene).instantiate() as Button
	btn.name = "CallGrownupButton"
	btn.set("clay_color", BUTTON_COLOR)
	btn.custom_minimum_size = BUTTON_SIZE
	btn.tooltip_text = ""
	btn.pressed.connect(open_parent_gate)
	var box: HBoxContainer = HBoxContainer.new()
	box.set_anchors_preset(Control.PRESET_FULL_RECT)
	box.offset_left = 28.0
	box.offset_right = -36.0
	box.alignment = BoxContainer.ALIGNMENT_CENTER
	box.add_theme_constant_override("separation", 24)
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	btn.add_child(box)
	var icon_tex: Texture2D = AssetRegistry.texture(CALL_ICON_KEY)
	var icon: Control
	if icon_tex != null:
		var rect: TextureRect = TextureRect.new()
		rect.texture = icon_tex
		rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		icon = rect
	else:
		icon = GrownupIcon.new()
	icon.name = "CallIcon"
	icon.custom_minimum_size = Vector2(150, 150)
	icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	icon.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(icon)
	var label: Label = Label.new()
	label.name = "CallLabel"
	label.text = Strings.t("session_end.call_grownup")
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	label.add_theme_font_size_override("font_size", BUTTON_FONT_SIZE)
	label.add_theme_color_override("font_color", BUTTON_TEXT_COLOR)
	ClayStyle.use_bold(label)
	label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(label)
	return btn

## Gece zemini: görsel varsa o; yoksa gece gradyanı + ay + yıldızlar + kil tepeler (sabit, yanıp sönmez).
func _make_backdrop() -> Control:
	var tex: Texture2D = AssetRegistry.texture(NIGHT_KEY)
	if tex != null:
		var rect: TextureRect = TextureRect.new()
		rect.texture = tex
		rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
		rect.set_anchors_preset(Control.PRESET_FULL_RECT)
		rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
		rect.name = "NightBackdrop"
		return rect
	var sky: NightSky = NightSky.new()
	sky.name = "NightBackdrop"
	sky.set_anchors_preset(Control.PRESET_FULL_RECT)
	sky.mouse_filter = Control.MOUSE_FILTER_IGNORE
	sky.top = SKY_TOP
	sky.mid = SKY_MID
	sky.bottom = SKY_BOTTOM
	return sky

## Uykulu Bilge yavaşça nefes alır; "hareketi azalt" açıkken durağan.
func _start_breathing() -> void:
	if not is_inside_tree() or app.reduce_motion():
		return
	_bilge.pivot_offset = Vector2(_bilge.size.x / 2.0, _bilge.size.y)
	var tw: Tween = create_tween().set_loops()
	tw.tween_property(_bilge, "scale", Vector2(1.015, 1.03), BREATH_SECONDS).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tw.tween_property(_bilge, "scale", Vector2.ONE, BREATH_SECONDS).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

## Yer tutucu gece gökyüzü (ui.bg_night gelene kadar).
class NightSky:
	extends Control
	const STAR_COUNT: int = 46
	const STAR_SEED: int = 20261004
	var top: Color = Color.BLACK
	var mid: Color = Color.BLACK
	var bottom: Color = Color.BLACK

	func _notification(what: int) -> void:
		if what == NOTIFICATION_RESIZED:
			queue_redraw()

	func _draw() -> void:
		var w: float = size.x
		var h: float = size.y
		# Dikey gradyan: şeritlerle yumuşak geçiş.
		var bands: int = 48
		for i: int in bands:
			var t: float = float(i) / float(bands - 1)
			var c: Color = top.lerp(mid, t * 2.0) if t < 0.5 else mid.lerp(bottom, (t - 0.5) * 2.0)
			draw_rect(Rect2(0, h * i / bands, w, h / bands + 1.0), c)
		# Yıldızlar: sabit konumlar, yumuşak hale.
		var rng: RandomNumberGenerator = RandomNumberGenerator.new()
		rng.seed = STAR_SEED
		for i: int in STAR_COUNT:
			var p: Vector2 = Vector2(rng.randf() * w, rng.randf() * h * 0.62)
			var r: float = rng.randf_range(2.5, 6.0)
			draw_circle(p, r * 2.6, Color(1, 0.95, 0.75, 0.10))
			draw_circle(p, r, Color(1, 0.96, 0.8, 0.9))
		# Ay: hale + dolgun kil disk + krater benekleri.
		var moon: Vector2 = Vector2(w * 0.84, h * 0.2)
		for k: int in 4:
			draw_circle(moon, 110.0 + k * 34.0, Color(1, 0.95, 0.7, 0.07))
		draw_circle(moon, 96.0, Color(1, 0.93, 0.68))
		draw_circle(moon + Vector2(-26, -18), 18.0, Color(0.95, 0.85, 0.58))
		draw_circle(moon + Vector2(30, 24), 13.0, Color(0.95, 0.85, 0.58))
		draw_circle(moon + Vector2(8, -44), 9.0, Color(0.95, 0.85, 0.58))
		# Kil tepeler: üst üste yuvarlak tümsekler.
		var far: Color = Color(0.24, 0.24, 0.5)
		var near: Color = Color(0.17, 0.2, 0.4)
		draw_circle(Vector2(w * 0.12, h * 1.12), w * 0.3, far)
		draw_circle(Vector2(w * 0.55, h * 1.2), w * 0.34, far)
		draw_circle(Vector2(w * 0.95, h * 1.1), w * 0.26, far)
		draw_circle(Vector2(w * 0.32, h * 1.3), w * 0.32, near)
		draw_circle(Vector2(w * 0.8, h * 1.32), w * 0.3, near)

## Yer tutucu "büyüğünü çağır" simgesi (ui.call_grownup gelene kadar): el ele büyük ve küçük figür.
class GrownupIcon:
	extends Control
	const ADULT: Color = Color(0.36, 0.55, 0.85)
	const CHILD: Color = Color(0.98, 0.55, 0.42)
	const SKIN: Color = Color(0.98, 0.8, 0.62)
	const OUTLINE: Color = Color(0.3, 0.17, 0.08, 0.35)

	func _draw() -> void:
		var s: float = minf(size.x, size.y) / 150.0
		var o: Vector2 = (size - Vector2(150, 150) * s) / 2.0
		# Büyük figür (solda).
		_body(o + Vector2(20, 64) * s, Vector2(56, 82) * s, ADULT)
		_head(o + Vector2(48, 38) * s, 24.0 * s)
		# Küçük figür (sağda).
		_body(o + Vector2(92, 96) * s, Vector2(40, 52) * s, CHILD)
		_head(o + Vector2(112, 76) * s, 18.0 * s)
		# El ele: iki gövde arasında kalın yuvarlak kol.
		draw_line(o + Vector2(72, 104) * s, o + Vector2(96, 112) * s, SKIN, 10.0 * s, true)
		draw_circle(o + Vector2(84, 108) * s, 7.0 * s, SKIN)

	func _body(pos: Vector2, sz: Vector2, color: Color) -> void:
		var box: StyleBoxFlat = ClayStyle.plaque_box(color, color.darkened(0.25), int(sz.x / 2.0), 3, 0, 0, 0.0, 0.0)
		draw_style_box(box, Rect2(pos, sz))

	func _head(center: Vector2, r: float) -> void:
		draw_circle(center, r + 3.0, OUTLINE)
		draw_circle(center, r, SKIN)
