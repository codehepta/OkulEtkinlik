extends Control
## Profil oluşturma, 3 adım: (1) avatar, (2) sınıf, (3) isteğe bağlı takma ad.

const AVATARS: Array[String] = [
	"avatar.tavsan", "avatar.kedi", "avatar.ayi", "avatar.tilki", "avatar.penguen", "avatar.kaplumbaga",
]
const GRADES: Array[int] = [1, 2, 3]
const MAX_NICKNAME: int = 12
const CARD_COLOR: Color = Color(0.96, 0.78, 0.55)

var app: Node = AppState

var _step: int = 1
var _avatar: String = ""
var _grade: int = 0
var _pages: Array[Control] = []
var _edit: LineEdit = null
var _navigating: bool = false

func _ready() -> void:
	var bg: ColorRect = ColorRect.new()
	bg.color = Color(0.31, 0.7, 0.53)
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(bg)
	_pages = [_build_avatar_page(), _build_grade_page(), _build_nickname_page()]
	for page: Control in _pages:
		page.set_anchors_preset(Control.PRESET_FULL_RECT)
		add_child(page)
	var replay: Button = (load("res://scenes/components/replay_voice_button.tscn") as PackedScene).instantiate() as Button
	replay.position = Vector2(24, 24)
	add_child(replay)
	_show_step(1)

func step() -> int:
	return _step

func nickname_edit() -> LineEdit:
	return _edit

func pick_avatar(key: String) -> void:
	_avatar = key
	_show_step(2)

func pick_grade(grade: int) -> void:
	_grade = grade
	_show_step(3)

## Profili oluşturur ve etkinleştirir; takma ad alanı boşsa takma ad verilmez.
func confirm() -> void:
	if _avatar == "" or _grade == 0 or _navigating:
		return
	_navigating = true
	var id: String = app.progress.create_profile(_avatar, _edit.text.strip_edges(), _grade)
	if id == "":
		app.goto("profile_select")
		return
	app.select_profile(id)
	app.enter_after_profile()

func _show_step(n: int) -> void:
	_step = n
	for i: int in _pages.size():
		_pages[i].visible = (i == n - 1)
	var line: String = ["vo.genel.avatar_sec", "vo.genel.sinif_sec", "vo.genel.takma_ad"][n - 1]
	app.narrator.say(line)

func _centered(content: Control) -> Control:
	var c: CenterContainer = CenterContainer.new()
	c.add_child(content)
	return c

func _style(btn: Button) -> void:
	btn.focus_mode = Control.FOCUS_NONE
	for state: String in ["normal", "hover", "pressed", "focus"]:
		var box: StyleBoxFlat = StyleBoxFlat.new()
		box.bg_color = CARD_COLOR
		box.set_corner_radius_all(24)
		box.border_color = CARD_COLOR.darkened(0.2)
		box.set_border_width_all(4)
		btn.add_theme_stylebox_override(state, box)

func _build_avatar_page() -> Control:
	var grid: GridContainer = GridContainer.new()
	grid.columns = 3
	grid.add_theme_constant_override("h_separation", 40)
	grid.add_theme_constant_override("v_separation", 40)
	for key: String in AVATARS:
		var b: Button = Button.new()
		b.custom_minimum_size = Vector2(256, 256)
		_style(b)
		var img: Control = (load("res://scenes/components/asset_image.tscn") as PackedScene).instantiate() as Control
		img.set("key", key)
		img.set_anchors_preset(Control.PRESET_FULL_RECT)
		img.offset_left = 16.0
		img.offset_top = 16.0
		img.offset_right = -16.0
		img.offset_bottom = -16.0
		img.mouse_filter = Control.MOUSE_FILTER_IGNORE
		b.add_child(img)
		b.pressed.connect(pick_avatar.bind(key))
		grid.add_child(b)
	return _centered(grid)

func _build_grade_page() -> Control:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 64)
	for g: int in GRADES:
		var b: Button = Button.new()
		b.custom_minimum_size = Vector2(300, 300)
		_style(b)
		var tile: Control = (load("res://scenes/components/clay_tile.tscn") as PackedScene).instantiate() as Control
		tile.set("text", str(g))
		tile.set_anchors_preset(Control.PRESET_FULL_RECT)
		tile.mouse_filter = Control.MOUSE_FILTER_IGNORE
		b.add_child(tile)
		b.pressed.connect(pick_grade.bind(g))
		row.add_child(b)
	return _centered(row)

func _build_nickname_page() -> Control:
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 32)
	col.custom_minimum_size = Vector2(1000, 0)
	var hint: Label = Label.new()
	hint.text = Strings.t("profile.step3_hint")
	hint.add_theme_font_size_override("font_size", 56)
	hint.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(hint)
	_edit = LineEdit.new()
	_edit.max_length = MAX_NICKNAME
	_edit.placeholder_text = Strings.t("profile.nickname_placeholder")
	_edit.virtual_keyboard_type = LineEdit.KEYBOARD_TYPE_DEFAULT
	_edit.custom_minimum_size = Vector2(0, 128)
	_edit.add_theme_font_size_override("font_size", 64)
	col.add_child(_edit)
	var row: HBoxContainer = HBoxContainer.new()
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.add_theme_constant_override("separation", 48)
	var skip: Button = (load("res://scenes/components/big_button.tscn") as PackedScene).instantiate() as Button
	skip.set("text_key", "profile.skip")
	skip.custom_minimum_size = Vector2(320, 128)
	skip.pressed.connect(func() -> void:
		_edit.text = ""
		confirm())
	var ok: Button = (load("res://scenes/components/big_button.tscn") as PackedScene).instantiate() as Button
	ok.set("text_key", "profile.confirm")
	ok.set("clay_color", Color(0.55, 0.85, 0.6))
	ok.custom_minimum_size = Vector2(320, 128)
	ok.pressed.connect(confirm)
	row.add_child(skip)
	row.add_child(ok)
	col.add_child(row)
	return _centered(col)
