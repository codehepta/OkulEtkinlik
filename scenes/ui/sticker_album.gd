extends Control
## Çıkartma albümü: ders başına bir sekme, content/stickers.json sırasıyla ızgara.
## Kazanılmamış çıkartmalar boş yuva (ui.sticker_frame) olarak görünür.

const BG_TOP: Color = Color(1.0, 0.95, 0.82)
const BG_BOTTOM: Color = Color(0.98, 0.84, 0.64)
const CELL_SIZE: Vector2 = Vector2(264, 264)
const GRID_COLUMNS: int = 3
## Boş derste sayfa boş kalmasın diye gösterilen süs yuvası sayısı (sayılmaz, _slots'a girmez).
const EMPTY_PAGE_SLOTS: int = 6
const TAB_ON: Color = Color(0.55, 0.85, 0.6)
const TAB_OFF: Color = Color(0.96, 0.78, 0.55)
const SELECTED_SCALE: float = 1.12
const FRAME_KEY: String = "ui.sticker_frame"
const TITLE_FONT: String = "res://assets/fonts/Andika-Bold.ttf"
const PLAQUE_COLOR: Color = Color(0.99, 0.84, 0.55)
const PLAQUE_BORDER: Color = Color(0.82, 0.52, 0.27)
const TEXT_COLOR: Color = Color(0.42, 0.22, 0.1)
const PAGE_COLOR: Color = Color(1.0, 0.98, 0.92)
const PAGE_BORDER: Color = Color(0.86, 0.68, 0.46)
const EARNED_CARD: Color = Color(1.0, 1.0, 1.0)
const EARNED_BORDER: Color = Color(0.95, 0.66, 0.3)
const EMPTY_CARD: Color = Color(0.93, 0.87, 0.77)
const EMPTY_BORDER: Color = Color(0.83, 0.74, 0.62)
const EMPTY_ALPHA: float = 0.45
const GRID_GAP: float = 32.0

var app: Node = AppState

var _data: Dictionary = {}
var _earned: PackedStringArray = PackedStringArray()
var _subjects: PackedStringArray = PackedStringArray()
var _subject: String = ""
var _tabs: Dictionary = {}
var _grid: GridContainer = null
var _slots: Array[Dictionary] = []
var _back: Button = null
var _title_plaque: PanelContainer = null
var _title_label: Label = null

func _ready() -> void:
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(app.stickers_path))
	_data = parsed if parsed is Dictionary else {}
	_earned = app.progress.stickers(app.profile_id)
	_subjects = app.content.subjects_for_grade(app.current_grade())

	add_child(_make_backdrop())

	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_preset(Control.PRESET_FULL_RECT)
	col.offset_top = 28.0
	col.offset_bottom = -28.0
	col.add_theme_constant_override("separation", 22)
	add_child(col)

	# Başlık plaketi: albüm simgesi + "Çıkartma Albümüm".
	var title_holder: CenterContainer = CenterContainer.new()
	col.add_child(title_holder)
	_title_plaque = PanelContainer.new()
	_title_plaque.name = "TitlePlaque"
	_title_plaque.add_theme_stylebox_override("panel", _clay_box(PLAQUE_COLOR, PLAQUE_BORDER, 40, 8, 28.0, 8.0))
	title_holder.add_child(_title_plaque)
	var title_row: HBoxContainer = HBoxContainer.new()
	title_row.add_theme_constant_override("separation", 20)
	_title_plaque.add_child(title_row)
	var title_icon: Control = (load("res://scenes/components/asset_image.tscn") as PackedScene).instantiate() as Control
	title_icon.set("key", "ui.album")
	title_row.add_child(title_icon)
	title_icon.custom_minimum_size = Vector2(96, 96)
	title_icon.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_title_label = Label.new()
	_title_label.text = Strings.t("album.title")
	_title_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_title_label.add_theme_font_size_override("font_size", 64)
	_title_label.add_theme_color_override("font_color", TEXT_COLOR)
	if ResourceLoader.exists(TITLE_FONT):
		_title_label.add_theme_font_override("font", load(TITLE_FONT) as Font)
	title_row.add_child(_title_label)

	var tab_row: HBoxContainer = HBoxContainer.new()
	tab_row.alignment = BoxContainer.ALIGNMENT_CENTER
	tab_row.add_theme_constant_override("separation", 32)
	tab_row.custom_minimum_size = Vector2(0, 150)
	col.add_child(tab_row)
	# Kap, sıralamada çocukların ölçeğini sıfırlar: seçili sekme büyütmesi sıralamadan sonra yeniden uygulanır.
	tab_row.sort_children.connect(_apply_tab_scales)
	for s: String in _subjects:
		var tab: Button = (load("res://scenes/components/big_button.tscn") as PackedScene).instantiate() as Button
		tab.set("text_key", "subject." + s)
		tab.custom_minimum_size = Vector2(380, 132)
		tab.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		tab.pressed.connect(select_subject.bind(s))
		tab_row.add_child(tab)
		_tabs[s] = tab

	# Albüm sayfası: ortalı kil sayfa, içinde 3 sütunlu büyük yuva ızgarası (fazlası kayar).
	var page_holder: CenterContainer = CenterContainer.new()
	page_holder.size_flags_vertical = Control.SIZE_EXPAND_FILL
	col.add_child(page_holder)
	var page: PanelContainer = PanelContainer.new()
	page.name = "AlbumPage"
	page.add_theme_stylebox_override("panel", _clay_box(PAGE_COLOR, PAGE_BORDER, 44, 8, 36.0, 32.0))
	page_holder.add_child(page)
	var scroll: ScrollContainer = ScrollContainer.new()
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	scroll.custom_minimum_size = Vector2(
		GRID_COLUMNS * CELL_SIZE.x + (GRID_COLUMNS - 1) * GRID_GAP + 8.0,
		2.0 * CELL_SIZE.y + GRID_GAP)
	page.add_child(scroll)
	var center: CenterContainer = CenterContainer.new()
	center.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	center.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.add_child(center)
	_grid = GridContainer.new()
	_grid.columns = GRID_COLUMNS
	_grid.add_theme_constant_override("h_separation", int(GRID_GAP))
	_grid.add_theme_constant_override("v_separation", int(GRID_GAP))
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
	_apply_tab_scales()
	for c: Node in _grid.get_children():
		_grid.remove_child(c)
		c.free()  # hemen serbest bırak: yetim düğüm kalmasın
	_slots.clear()
	var keys: Array = _data.get(subject, []) as Array
	for key_v: Variant in keys:
		var key: String = str(key_v)
		var earned: bool = _earned.has(key)
		var img: Control = _add_cell(key if earned else FRAME_KEY, earned)
		_slots.append({"key": key, "earned": earned, "image": img})
	if keys.is_empty():
		# Henüz çıkartması olmayan ders: sayfa boş görünmesin, sayılmayan süs yuvaları.
		for i: int in EMPTY_PAGE_SLOTS:
			_add_cell(FRAME_KEY, false)

## Izgaraya bir yuva kartı ekler; kazanılan çıkartma beyaz kartta tam renkli, boş yuva soluk.
func _add_cell(image_key: String, earned: bool) -> Control:
	var card: PanelContainer = PanelContainer.new()
	card.custom_minimum_size = CELL_SIZE
	card.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if earned:
		card.add_theme_stylebox_override("panel", _clay_box(EARNED_CARD, EARNED_BORDER, 36, 8, 14.0, 14.0))
	else:
		var flat: StyleBoxFlat = _clay_box(EMPTY_CARD, EMPTY_BORDER, 36, 4, 22.0, 22.0)
		flat.shadow_size = 0
		card.add_theme_stylebox_override("panel", flat)
	_grid.add_child(card)
	var img: Control = (load("res://scenes/components/asset_image.tscn") as PackedScene).instantiate() as Control
	img.set("key", image_key)
	card.add_child(img)
	img.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if not earned:
		img.modulate = Color(1, 1, 1, EMPTY_ALPHA)
	return img

func _clay_box(color: Color, border: Color, radius: int, border_w: int, pad_x: float, pad_y: float) -> StyleBoxFlat:
	var style: StyleBoxFlat = StyleBoxFlat.new()
	style.bg_color = color
	style.set_corner_radius_all(radius)
	style.border_color = border
	style.set_border_width_all(border_w)
	style.border_width_bottom = border_w + 6  # kil kalınlığı
	style.shadow_color = Color(0.35, 0.2, 0.05, 0.22)
	style.shadow_size = 12
	style.shadow_offset = Vector2(0, 8)
	style.content_margin_left = pad_x
	style.content_margin_right = pad_x
	style.content_margin_top = pad_y
	style.content_margin_bottom = pad_y
	style.anti_aliasing = true
	return style

## Sıcak dikey gradyan zemin + hafif benek deseni.
func _make_backdrop() -> TextureRect:
	var g: Gradient = Gradient.new()
	g.set_color(0, BG_TOP)
	g.set_color(1, BG_BOTTOM)
	var tex: GradientTexture2D = GradientTexture2D.new()
	tex.gradient = g
	tex.fill_from = Vector2(0.5, 0.0)
	tex.fill_to = Vector2(0.5, 1.0)
	tex.width = 64
	tex.height = 256
	var bg: TextureRect = TextureRect.new()
	bg.name = "Backdrop"
	bg.texture = tex
	bg.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	bg.stretch_mode = TextureRect.STRETCH_SCALE
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	bg.draw.connect(_draw_dots.bind(bg))
	return bg

func _draw_dots(bg: TextureRect) -> void:
	var step: float = 96.0
	var y: float = 48.0
	var row: int = 0
	while y < bg.size.y:
		var x: float = 48.0 + (step / 2.0 if row % 2 == 1 else 0.0)
		while x < bg.size.x:
			bg.draw_circle(Vector2(x, y), 7.0, Color(1, 1, 1, 0.28))
			x += step
		y += step
		row += 1

func title_plaque() -> PanelContainer:
	return _title_plaque

func title_text() -> String:
	return _title_label.text if _title_label != null else ""

## Renk dışında şekil ipucu: seçili sekme büyük durur.
func _apply_tab_scales() -> void:
	for s: String in _tabs:
		var tab: Button = _tabs[s] as Button
		tab.pivot_offset = (tab.size if tab.size != Vector2.ZERO else tab.custom_minimum_size) / 2.0
		tab.scale = Vector2(SELECTED_SCALE, SELECTED_SCALE) if s == _subject else Vector2.ONE

## Seçili sekmedeki çıkartma anahtarları, dosyadaki sırayla.
func slot_keys() -> PackedStringArray:
	var out: PackedStringArray = PackedStringArray()
	for s: Dictionary in _slots:
		out.append(str(s["key"]))
	return out

func grid_columns() -> int:
	return _grid.columns

## Yuvadaki görsel düğümü (yoksa null).
func slot_image(key: String) -> Control:
	for s: Dictionary in _slots:
		if str(s["key"]) == key:
			return s["image"] as Control
	return null

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
