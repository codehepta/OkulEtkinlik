extends Control
## Profil seçimi: en fazla 4 avatar kartı, "+" kartı (4 profilde gizli), sağ altta veli dişlisi.

const CARD_SIZE: Vector2 = Vector2(340, 440)
const AVATAR_SIZE: Vector2 = Vector2(280, 280)
const CARD_COLOR: Color = ClayStyle.APRICOT
const PLUS_COLOR: Color = ClayStyle.MINT
const PLUS_DISC: Vector2 = Vector2(220, 220)
const PLUS_LIFT: float = 22.0

var app: Node = AppState

var _cards: Array[Button] = []
var _plus: Button = null
var _navigating: bool = false

func _ready() -> void:
	var bg: ColorRect = ColorRect.new()
	bg.color = ClayStyle.MEADOW
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(bg)

	# Kartlar ortada, kendi boylarında; altta altyazı şeridi boş kalır.
	var center: CenterContainer = CenterContainer.new()
	center.set_anchors_preset(Control.PRESET_FULL_RECT)
	center.offset_bottom = -ClayStyle.SUBTITLE_BAND / 2.0
	add_child(center)
	var row: HBoxContainer = HBoxContainer.new()
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.add_theme_constant_override("separation", 48)
	center.add_child(row)

	var profiles: Array[Dictionary] = app.progress.profiles()
	for p: Dictionary in profiles:
		var card: Button = _make_card(str(p["avatar"]), _display_name(p))
		var id: String = str(p["id"])
		card.pressed.connect(select.bind(id))
		row.add_child(card)
		_cards.append(card)

	_plus = _make_plus_card()
	_plus.pressed.connect(func() -> void: app.goto("profile_create"))
	_plus.visible = profiles.size() < app.progress.MAX_PROFILES
	row.add_child(_plus)

	var replay: Button = (load("res://scenes/components/replay_voice_button.tscn") as PackedScene).instantiate() as Button
	replay.position = Vector2(24, 24)
	add_child(replay)

	var gear: Button = (load("res://scenes/components/big_button.tscn") as PackedScene).instantiate() as Button
	gear.set("icon_key", "ui.parent")
	gear.set("clay_color", ClayStyle.SKY)
	gear.set_anchors_preset(Control.PRESET_BOTTOM_RIGHT)
	gear.offset_left = -152.0
	gear.offset_top = -152.0
	gear.offset_right = -24.0
	gear.offset_bottom = -24.0
	gear.pressed.connect(open_parent_gate)
	add_child(gear)

	app.narrator.say("vo.genel.profil_sec")

## Altyazı balonu altta: kartlar ortada, dişli sağ altta (balon onlara değmez).
func subtitle_placement() -> String:
	return "bottom"

func profile_cards() -> Array[Button]:
	return _cards

func plus_card() -> Button:
	return _plus

func select(id: String) -> void:
	if _navigating:
		return
	_navigating = true
	app.select_profile(id)
	app.enter_after_profile()

func open_parent_gate() -> void:
	app.goto("parent_gate", {"next": {"scene": "parent_panel", "args": {}}})

func _display_name(p: Dictionary) -> String:
	var nick: String = str(p.get("nickname", ""))
	if nick != "":
		return nick
	var key: String = "label." + str(p["avatar"])
	return Strings.t(key) if Strings.has(key) else ""

func _make_card(avatar_key: String, caption: String) -> Button:
	var card: Button = _card_button(CARD_COLOR)
	var col: VBoxContainer = _card_column(card)
	var img: Control = (load("res://scenes/components/asset_image.tscn") as PackedScene).instantiate() as Control
	img.set("key", avatar_key)
	img.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(img)
	img.custom_minimum_size = AVATAR_SIZE
	var label: Label = Label.new()
	label.text = caption
	label.add_theme_font_size_override("font_size", 48)
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	label.custom_minimum_size = Vector2(CARD_SIZE.x - 48.0, 0)
	label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(label)
	return card

## "+" kartı: nane yeşili kart üstünde kabarık bej kil disk ve büyük artı.
func _make_plus_card() -> Button:
	var card: Button = _card_button(PLUS_COLOR)
	var col: VBoxContainer = _card_column(card)
	var holder: CenterContainer = CenterContainer.new()
	holder.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(holder)
	var disc: Panel = Panel.new()
	disc.custom_minimum_size = PLUS_DISC
	disc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	disc.add_theme_stylebox_override("panel", ClayStyle.box(ClayStyle.CREAM, int(PLUS_DISC.x / 2.0)))
	holder.add_child(disc)
	var plus: Label = Label.new()
	plus.text = Strings.t("profile.add")
	plus.add_theme_font_size_override("font_size", 160)
	plus.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	plus.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	plus.set_anchors_preset(Control.PRESET_FULL_RECT)
	# Andika'da "+" yazı çizgisinin altında durur: diskin ortasına gelsin diye biraz yukarı.
	plus.offset_top = -PLUS_LIFT
	plus.offset_bottom = -float(ClayStyle.DEPTH) - PLUS_LIFT
	plus.mouse_filter = Control.MOUSE_FILTER_IGNORE
	disc.add_child(plus)
	return card

func _card_button(color: Color) -> Button:
	var card: Button = Button.new()
	card.custom_minimum_size = CARD_SIZE
	card.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	card.focus_mode = Control.FOCUS_NONE
	ClayStyle.style_button(card, color, 36)
	return card

func _card_column(card: Button) -> VBoxContainer:
	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_preset(Control.PRESET_FULL_RECT)
	col.offset_bottom = -float(ClayStyle.DEPTH)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 8)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	card.add_child(col)
	return col
