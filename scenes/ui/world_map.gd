extends Control
## Dünya haritası: 4 bölge, ortada ağaç ev, üst köşede albüm ve avatar.
## Keşif Laboratuvarı 1–2. sınıfta soluk ve kilitlidir.

const NarrationWait: GDScript = preload("res://scripts/ui/narration_wait.gd")

const SUBJECTS: Array[String] = ["matematik", "turkce", "hayat_bilgisi", "fen"]
const REGION_SIZE: Vector2 = Vector2(360, 360)
const REGION_POS: Dictionary = {
	"matematik": Vector2(200, 200),
	"turkce": Vector2(1360, 200),
	"hayat_bilgisi": Vector2(200, 620),
	"fen": Vector2(1360, 620),
}
const TREE_SIZE: Vector2 = Vector2(400, 320)
const TREE_POS: Vector2 = Vector2(760, 410)
const CARD_COLOR: Color = ClayStyle.APRICOT
## Kart iç boşluğu: yazı ve simge kenara yapışmaz.
const CARD_PADDING: float = 24.0
const LABEL_FONT_SIZE: int = 40
const LOCKED_ALPHA: float = 0.45
const FEN_MIN_GRADE: int = 3

var app: Node = AppState

var _grade: int = 1
var _buttons: Dictionary = {}
var _tree_button: Button = null
var _album_button: Button = null
var _avatar_button: Button = null
var _busy: bool = false

func _ready() -> void:
	_grade = app.current_grade()
	var bg: Control = _image("map.island")
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(bg)
	bg.set("stretch_mode", TextureRect.STRETCH_KEEP_ASPECT_COVERED)

	for subject: String in SUBJECTS:
		var region: String = app.content.SUBJECT_REGION[subject]
		var b: Button = _card(REGION_SIZE, "region.%s.icon" % region, Strings.t("region.%s" % region))
		b.position = REGION_POS[subject]
		b.pressed.connect(func() -> void: tap_region(subject))
		if region_locked(subject):
			b.modulate = Color(1, 1, 1, LOCKED_ALPHA)
			var lock: Control = _image("ui.lock")
			b.add_child(lock)
			lock.custom_minimum_size = Vector2(96, 96)
			lock.size = Vector2(96, 96)
			lock.position = Vector2(REGION_SIZE.x - 112.0, 16.0)
			lock.mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(b)
		_buttons[subject] = b

	_tree_button = _card(TREE_SIZE, "region.agac_ev.icon", Strings.t("region.agac_ev"))
	_tree_button.position = TREE_POS
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

func _card(card_size: Vector2, icon_key: String, caption: String) -> Button:
	var card: Button = Button.new()
	card.custom_minimum_size = card_size
	card.size = card_size
	card.focus_mode = Control.FOCUS_NONE
	ClayStyle.style_button(card, CARD_COLOR, 32)
	var pad: MarginContainer = MarginContainer.new()
	pad.set_anchors_preset(Control.PRESET_FULL_RECT)
	pad.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for side: String in ["left", "right", "top"]:
		pad.add_theme_constant_override("margin_" + side, int(CARD_PADDING))
	pad.add_theme_constant_override("margin_bottom", int(CARD_PADDING) + ClayStyle.DEPTH)
	card.add_child(pad)
	var col: VBoxContainer = VBoxContainer.new()
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 8)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pad.add_child(col)
	var img: Control = _image(icon_key)
	img.mouse_filter = Control.MOUSE_FILTER_IGNORE
	img.size_flags_vertical = Control.SIZE_EXPAND_FILL
	col.add_child(img)
	var label: Label = Label.new()
	label.text = caption
	label.add_theme_font_size_override("font_size", LABEL_FONT_SIZE)
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	label.custom_minimum_size = Vector2(card_size.x - CARD_PADDING * 2.0, 0)
	label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(label)
	return card
