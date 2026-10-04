extends Control
## Çıkartma albümü: ders başına bir sekme, content/stickers.json sırasıyla ızgara.
## Kazanılmamış çıkartmalar boş yuva (ui.sticker_frame) olarak görünür.

const BG_COLOR: Color = Color(0.99, 0.93, 0.78)
const CELL_SIZE: Vector2 = Vector2(200, 200)
const GRID_COLUMNS: int = 7
const TAB_ON: Color = ClayStyle.MINT
const TAB_OFF: Color = ClayStyle.APRICOT
const SELECTED_SCALE: float = 1.12
const FRAME_KEY: String = "ui.sticker_frame"

var app: Node = AppState

var _data: Dictionary = {}
var _earned: PackedStringArray = PackedStringArray()
var _subjects: PackedStringArray = PackedStringArray()
var _subject: String = ""
var _tabs: Dictionary = {}
var _grid: GridContainer = null
var _slots: Array[Dictionary] = []
var _back: Button = null

func _ready() -> void:
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(app.stickers_path))
	_data = parsed if parsed is Dictionary else {}
	_earned = app.progress.stickers(app.profile_id)
	_subjects = app.content.subjects_for_grade(app.current_grade())

	var bg: ColorRect = ColorRect.new()
	bg.color = BG_COLOR
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(bg)

	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_preset(Control.PRESET_FULL_RECT)
	col.offset_top = 24.0
	col.offset_bottom = -24.0
	col.add_theme_constant_override("separation", 24)
	add_child(col)
	var tab_row: HBoxContainer = HBoxContainer.new()
	tab_row.alignment = BoxContainer.ALIGNMENT_CENTER
	tab_row.add_theme_constant_override("separation", 24)
	tab_row.custom_minimum_size = Vector2(0, 160)
	col.add_child(tab_row)
	for s: String in _subjects:
		var tab: Button = (load("res://scenes/components/big_button.tscn") as PackedScene).instantiate() as Button
		tab.set("text_key", "subject." + s)
		tab.custom_minimum_size = Vector2(380, 140)
		tab.pressed.connect(select_subject.bind(s))
		tab_row.add_child(tab)
		_tabs[s] = tab
	var scroll: ScrollContainer = ScrollContainer.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	col.add_child(scroll)
	var center: CenterContainer = CenterContainer.new()
	center.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	scroll.add_child(center)
	_grid = GridContainer.new()
	_grid.columns = GRID_COLUMNS
	_grid.add_theme_constant_override("h_separation", 24)
	_grid.add_theme_constant_override("v_separation", 24)
	center.add_child(_grid)

	var replay: Button = (load("res://scenes/components/replay_voice_button.tscn") as PackedScene).instantiate() as Button
	replay.position = Vector2(24, 24)
	add_child(replay)
	_back = (load("res://scenes/components/big_button.tscn") as PackedScene).instantiate() as Button
	_back.set("icon_key", "ui.back")
	_back.set_anchors_preset(Control.PRESET_BOTTOM_RIGHT)
	_back.offset_left = -152.0
	_back.offset_top = -152.0
	_back.offset_right = -24.0
	_back.offset_bottom = -24.0
	_back.pressed.connect(func() -> void: app.goto("world_map"))
	add_child(_back)

	if not _subjects.is_empty():
		select_subject(_subjects[0])
	app.session_timer.limit_reached.connect(_on_limit_reached)
	app.audio.play_music("music.menu")
	app.narrator.say("vo.genel.album")

func _exit_tree() -> void:
	if app != null and app.session_timer.limit_reached.is_connected(_on_limit_reached):
		app.session_timer.limit_reached.disconnect(_on_limit_reached)

func _on_limit_reached() -> void:
	app.goto("session_end")

func tab_selected(subject: String) -> bool:
	return subject == _subject

func tab_scale(subject: String) -> float:
	return (_tabs[subject] as Button).scale.x

func tab_subjects() -> PackedStringArray:
	return _subjects

func back_button() -> Button:
	return _back

func select_subject(subject: String) -> void:
	_subject = subject
	for s: String in _tabs:
		var tab: Button = _tabs[s] as Button
		tab.set("clay_color", TAB_ON if s == subject else TAB_OFF)
		# Renk dışında şekil ipucu: seçili sekme büyük ve yukarıda durur.
		tab.pivot_offset = tab.custom_minimum_size / 2.0
		tab.scale = Vector2(SELECTED_SCALE, SELECTED_SCALE) if s == subject else Vector2.ONE
	for c: Node in _grid.get_children():
		_grid.remove_child(c)
		c.free()  # hemen serbest bırak: yetim düğüm kalmasın
	_slots.clear()
	for key_v: Variant in _data.get(subject, []):
		var key: String = str(key_v)
		var earned: bool = _earned.has(key)
		var img: Control = (load("res://scenes/components/asset_image.tscn") as PackedScene).instantiate() as Control
		img.set("key", key if earned else FRAME_KEY)
		_grid.add_child(img)
		img.custom_minimum_size = CELL_SIZE
		img.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_slots.append({"key": key, "earned": earned, "image": img})

## Seçili sekmedeki çıkartma anahtarları, dosyadaki sırayla.
func slot_keys() -> PackedStringArray:
	var out: PackedStringArray = PackedStringArray()
	for s: Dictionary in _slots:
		out.append(str(s["key"]))
	return out

func slot_earned(key: String) -> bool:
	for s: Dictionary in _slots:
		if str(s["key"]) == key:
			return bool(s["earned"])
	return false

## Yuvada gösterilen görselin anahtarı (kazanıldıysa çıkartma, değilse boş yuva).
func slot_image_key(key: String) -> String:
	for s: Dictionary in _slots:
		if str(s["key"]) == key:
			return str((s["image"] as Control).get("key"))
	return ""
