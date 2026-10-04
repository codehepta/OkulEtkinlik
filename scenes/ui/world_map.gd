extends Control
## Dünya haritası: ada görseli ekrana sığdırılır (hiçbir yeri kırpılmaz); her bölgenin
## üstüne küçük kil rozet (ikon + ad) oturur, ortada ağaç ev rozeti. Bölgenin kendisi de
## dokunulabilir alandır. Keşif Laboratuvarı 1–2. sınıfta soluk ve kilitlidir.

const NarrationWait: GDScript = preload("res://scripts/ui/narration_wait.gd")

const SUBJECTS: Array[String] = ["matematik", "turkce", "hayat_bilgisi", "fen"]
## map.island görselinin piksel boyutu; rozet konumları bu orana göre hesaplanır.
const ISLAND_SIZE: Vector2 = Vector2(2000, 1116)
## Rozet merkezleri (görsel içinde 0–1 oranı): her bölgenin açık kum alanı.
const BADGE_ANCHOR: Dictionary = {
	"matematik": Vector2(0.30, 0.345),
	"turkce": Vector2(0.70, 0.335),
	"hayat_bilgisi": Vector2(0.26, 0.72),
	"fen": Vector2(0.66, 0.735),
}
const TREE_ANCHOR: Vector2 = Vector2(0.505, 0.575)
## Bölgelerin dokunma alanları (görsel içinde 0–1 oranı: x, y, genişlik, yükseklik).
const ZONE_RECT: Dictionary = {
	"matematik": Rect2(0.12, 0.06, 0.36, 0.42),
	"turkce": Rect2(0.52, 0.06, 0.36, 0.42),
	"hayat_bilgisi": Rect2(0.11, 0.48, 0.38, 0.40),
	"fen": Rect2(0.51, 0.48, 0.39, 0.40),
}
const TREE_ZONE: Rect2 = Rect2(0.41, 0.18, 0.18, 0.40)
const TEXT_COLOR: Color = ClayStyle.INK
const BADGE_FONT_SIZE: int = 36
const BADGE_ICON: float = 88.0
const BADGE_MIN_HEIGHT: float = 128.0
const LOCK_SIZE: Vector2 = Vector2(72, 96)
const LOCKED_TINT: Color = Color(0.82, 0.82, 0.82, 0.78)
## Kilitli lab'ın üstündeki sisin alanı (adanın içinde kalır).
const FOG_RECT: Rect2 = Rect2(0.54, 0.50, 0.32, 0.36)
const FOG_COLOR: Color = Color(1, 1, 1, 0.28)
const FEN_MIN_GRADE: int = 3

var app: Node = AppState

var _grade: int = 1
var _buttons: Dictionary = {}
var _zones: Dictionary = {}
var _tree_button: Button = null
var _tree_zone: Button = null
var _album_button: Button = null
var _avatar_button: Button = null
var _island: Control = null
var _fog: Panel = null
var _busy: bool = false

func _ready() -> void:
	_grade = app.current_grade()
	# Arka katman ekranı doldurur (deniz); ön katman adayı kırpmadan sığdırır.
	var sea: Control = _image("map.island")
	sea.set_anchors_preset(Control.PRESET_FULL_RECT)
	sea.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(sea)
	sea.set("stretch_mode", TextureRect.STRETCH_KEEP_ASPECT_COVERED)
	_island = _image("map.island")
	_island.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_island)
	_island.set("stretch_mode", TextureRect.STRETCH_SCALE)

	for subject: String in SUBJECTS:
		var zone: Button = _zone_button()
		zone.pressed.connect(func() -> void: tap_region(subject))
		add_child(zone)
		_zones[subject] = zone
	_tree_zone = _zone_button()
	_tree_zone.pressed.connect(tap_tree_house)
	add_child(_tree_zone)

	if region_locked("fen"):
		_fog = _fog_panel()
		add_child(_fog)

	for subject: String in SUBJECTS:
		var region: String = app.content.SUBJECT_REGION[subject]
		var b: Button = _badge(region)
		b.pressed.connect(func() -> void: tap_region(subject))
		if region_locked(subject):
			(b.get_child(0) as Control).modulate = LOCKED_TINT
			var lock: Control = _image("ui.lock")
			b.add_child(lock)
			lock.mouse_filter = Control.MOUSE_FILTER_IGNORE
			lock.custom_minimum_size = LOCK_SIZE
			lock.size = LOCK_SIZE
		add_child(b)
		_buttons[subject] = b

	_tree_button = _badge("agac_ev")
	_tree_button.pressed.connect(tap_tree_house)
	add_child(_tree_button)

	var replay: Button = (load("res://scenes/components/replay_voice_button.tscn") as PackedScene).instantiate() as Button
	replay.position = Vector2(24, 24)
	add_child(replay)

	_album_button = _corner_button()
	_album_button.set("icon_key", "ui.album")
	_album_button.offset_left = -304.0
	_album_button.offset_right = -176.0
	_album_button.pressed.connect(open_album)
	add_child(_album_button)

	_avatar_button = _corner_button()
	_avatar_button.set("icon_key", _avatar_key())
	_avatar_button.pressed.connect(func() -> void: app.goto("profile_select"))
	add_child(_avatar_button)

	resized.connect(_layout)
	_layout()
	_layout.call_deferred()

	app.session_timer.limit_reached.connect(_on_limit_reached)
	app.audio.play_music("music.menu")
	app.narrator.say("vo.genel.harita_giris")

func _exit_tree() -> void:
	if app != null and app.session_timer.limit_reached.is_connected(_on_limit_reached):
		app.session_timer.limit_reached.disconnect(_on_limit_reached)

## Altyazı balonu üstte, kartların arasındaki şeritte.
func subtitle_placement() -> String:
	return "top"

func region_locked(subject: String) -> bool:
	return subject == "fen" and _grade < FEN_MIN_GRADE

func region_button(subject: String) -> Button:
	return _buttons[subject] as Button

func tree_button() -> Button:
	return _tree_button

## Rozette kilit ikonu var mı (çocuk 0 plaket, çocuk 1 kilit).
func region_shows_lock(subject: String) -> bool:
	return region_button(subject).get_child_count() > 1

## Ada görselinin ekrandaki dikdörtgeni (sığdırılmış, ortalanmış).
func island_rect() -> Rect2:
	var view: Vector2 = size if size.x > 0.0 and size.y > 0.0 else get_viewport_rect().size
	var s: float = minf(view.x / ISLAND_SIZE.x, view.y / ISLAND_SIZE.y)
	var shown: Vector2 = ISLAND_SIZE * s
	return Rect2((view - shown) / 2.0, shown)

## Bölge adını okutur; açıksa patikaya geçer, kilitliyse kilit sesini okutur.
func tap_region(subject: String) -> void:
	if _busy:
		return
	_busy = true
	if region_locked(subject):
		await NarrationWait.say(self, app.narrator, "vo.bolge.kilitli_lab")
		_busy = false
		return
	var region: String = app.content.SUBJECT_REGION[subject]
	await NarrationWait.say(self, app.narrator, "vo.bolge.%s" % region)
	if is_inside_tree():
		app.goto("region_path", {"subject": subject})

func tap_tree_house() -> void:
	app.narrator.say("vo.genel.yakinda")

func open_album() -> void:
	app.goto("album")

func _on_limit_reached() -> void:
	app.goto("session_end")

func _avatar_key() -> String:
	for p: Dictionary in app.progress.profiles():
		if str(p["id"]) == app.profile_id:
			return str(p["avatar"])
	return ""

## Ada ve rozetleri ekran boyutuna göre yerleştirir.
func _layout() -> void:
	var r: Rect2 = island_rect()
	_island.position = r.position
	_island.size = r.size
	for subject: String in SUBJECTS:
		_place_zone(_zones[subject] as Button, ZONE_RECT[subject], r)
		_place_badge(_buttons[subject] as Button, BADGE_ANCHOR[subject], r)
	_place_zone(_tree_zone, TREE_ZONE, r)
	_place_badge(_tree_button, TREE_ANCHOR, r)
	if _fog != null:
		_place_zone(_fog, FOG_RECT, r)

func _place_zone(c: Control, z: Rect2, r: Rect2) -> void:
	c.position = r.position + z.position * r.size
	c.size = z.size * r.size

func _place_badge(b: Button, anchor: Vector2, r: Rect2) -> void:
	var plaque: Control = b.get_child(0) as Control
	var s: Vector2 = plaque.get_combined_minimum_size()
	s.y = maxf(s.y, BADGE_MIN_HEIGHT)
	b.custom_minimum_size = s
	b.size = s
	plaque.position = Vector2.ZERO
	plaque.size = s
	b.position = r.position + anchor * r.size - s / 2.0
	if b.get_child_count() > 1:
		# Kilit ikonu rozetin sağ üst köşesine, kenarın biraz dışına taşar.
		var lock: Control = b.get_child(1) as Control
		lock.position = Vector2(s.x - LOCK_SIZE.x * 0.6, -LOCK_SIZE.y * 0.35)

func _image(key: String) -> Control:
	var img: Control = (load("res://scenes/components/asset_image.tscn") as PackedScene).instantiate() as Control
	img.set("key", key)
	return img

func _corner_button() -> Button:
	var b: Button = (load("res://scenes/components/big_button.tscn") as PackedScene).instantiate() as Button
	b.set_anchors_preset(Control.PRESET_TOP_RIGHT)
	b.offset_left = -152.0
	b.offset_top = 24.0
	b.offset_right = -24.0
	b.offset_bottom = 152.0
	return b

## Görselin bölge parçası üstündeki görünmez dokunma alanı.
func _zone_button() -> Button:
	var b: Button = Button.new()
	b.focus_mode = Control.FOCUS_NONE
	b.flat = true
	for state: String in ["normal", "hover", "pressed", "focus", "disabled"]:
		b.add_theme_stylebox_override(state, StyleBoxEmpty.new())
	return b

## Kilitli bölgenin üstüne yumuşak kenarlı açık bir sis (solukluk).
func _fog_panel() -> Panel:
	var p: Panel = Panel.new()
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_theme_stylebox_override("panel", ClayStyle.soft_box(FOG_COLOR, 220, 40))
	return p

## Rozet plaketi: ikon sola yaslı, yazının sağında biraz daha boşluk.
func _clay_box(fill: Color, edge: Color) -> StyleBoxFlat:
	var box: StyleBoxFlat = ClayStyle.plaque_box(fill, edge, 48, 6, 6, 10, 12.0, 10.0)
	box.content_margin_right = 26.0
	box.content_margin_bottom = 14.0
	return box

## Kil plaket rozet: bölge ikonu + bölge adı. Çocuk 0 her zaman plakettir.
func _badge(region: String) -> Button:
	var colors: Array = ClayStyle.REGION_BADGE[region]
	var fill: Color = colors[0]
	var edge: Color = colors[1]
	var b: Button = Button.new()
	b.focus_mode = Control.FOCUS_NONE
	b.flat = true
	for state: String in ["normal", "hover", "pressed", "focus", "disabled"]:
		b.add_theme_stylebox_override(state, StyleBoxEmpty.new())
	var plaque: PanelContainer = PanelContainer.new()
	plaque.mouse_filter = Control.MOUSE_FILTER_IGNORE
	plaque.add_theme_stylebox_override("panel", _clay_box(fill, edge))
	b.add_child(plaque)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 10)
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	plaque.add_child(row)
	var icon: Control = _image("region.%s.icon" % region)
	row.add_child(icon)
	icon.custom_minimum_size = Vector2(BADGE_ICON, BADGE_ICON)
	icon.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var label: Label = Label.new()
	label.text = Strings.t("region.%s" % region)
	label.add_theme_font_size_override("font_size", BADGE_FONT_SIZE)
	label.add_theme_color_override("font_color", TEXT_COLOR)
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(label)
	b.button_down.connect(func() -> void: plaque.scale = Vector2(0.96, 0.96))
	b.button_up.connect(func() -> void: plaque.scale = Vector2.ONE)
	plaque.resized.connect(func() -> void: plaque.pivot_offset = plaque.size / 2.0)
	return b
