extends Control
## Profil seçimi: en fazla 4 avatar kartı, "+" kartı (4 profilde gizli), sağ altta veli dişlisi.

const CARD_SIZE: Vector2 = Vector2(320, 400)
const AVATAR_SIZE: Vector2 = Vector2(256, 256)
const CARD_COLOR: Color = Color(0.96, 0.78, 0.55)

var app: Node = AppState

var _cards: Array[Button] = []
var _plus: Button = null

func _ready() -> void:
	var bg: ColorRect = ColorRect.new()
	bg.color = Color(0.31, 0.7, 0.53)
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(bg)

	var row: HBoxContainer = HBoxContainer.new()
	row.set_anchors_preset(Control.PRESET_FULL_RECT)
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.add_theme_constant_override("separation", 48)
	add_child(row)

	var profiles: Array[Dictionary] = app.progress.profiles()
	for p: Dictionary in profiles:
		var card: Button = _make_card(str(p["avatar"]), _display_name(p))
		var id: String = str(p["id"])
		card.pressed.connect(select.bind(id))
		row.add_child(card)
		_cards.append(card)

	_plus = _make_card("", Strings.t("profile.add"))
	_plus.pressed.connect(func() -> void: app.goto("profile_create"))
	_plus.visible = profiles.size() < app.progress.MAX_PROFILES
	row.add_child(_plus)

	var replay: Button = (load("res://scenes/components/replay_voice_button.tscn") as PackedScene).instantiate() as Button
	replay.position = Vector2(24, 24)
	add_child(replay)

	var gear: Button = (load("res://scenes/components/big_button.tscn") as PackedScene).instantiate() as Button
	gear.set("icon_key", "ui.parent")
	gear.set("clay_color", Color(0.7, 0.78, 0.86))
	gear.set_anchors_preset(Control.PRESET_BOTTOM_RIGHT)
	gear.offset_left = -152.0
	gear.offset_top = -152.0
	gear.offset_right = -24.0
	gear.offset_bottom = -24.0
	gear.pressed.connect(open_parent_gate)
	add_child(gear)

	app.narrator.say("vo.genel.profil_sec")

func profile_cards() -> Array[Button]:
	return _cards

func plus_card() -> Button:
	return _plus

func select(id: String) -> void:
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
	var card: Button = Button.new()
	card.custom_minimum_size = CARD_SIZE
	card.focus_mode = Control.FOCUS_NONE
	for state: String in ["normal", "hover", "pressed", "focus"]:
		var box: StyleBoxFlat = StyleBoxFlat.new()
		box.bg_color = CARD_COLOR
		box.set_corner_radius_all(24)
		box.border_color = CARD_COLOR.darkened(0.2)
		box.set_border_width_all(4)
		card.add_theme_stylebox_override(state, box)
	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_preset(Control.PRESET_FULL_RECT)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	card.add_child(col)
	if avatar_key != "":
		var img: Control = (load("res://scenes/components/asset_image.tscn") as PackedScene).instantiate() as Control
		img.set("key", avatar_key)
		img.custom_minimum_size = AVATAR_SIZE
		img.mouse_filter = Control.MOUSE_FILTER_IGNORE
		col.add_child(img)
	var label: Label = Label.new()
	label.text = caption
	label.add_theme_font_size_override("font_size", 72 if avatar_key == "" else 48)
	label.add_theme_color_override("font_color", Color(0.25, 0.15, 0.08))
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(label)
	return card
