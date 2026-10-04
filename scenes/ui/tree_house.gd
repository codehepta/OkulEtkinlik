extends Control
## Bilge'nin Ağaç Evi (spec §3.5): yıldız eşiklerinde açılan süs eşyaları alttaki rafta
## durur; çocuk onları sürükleyip odaya yerleştirir, odadan rafa geri sürükleyebilir.
## Konumlar profilde 0–1 oranıyla saklanır. Sıradaki süsün yerinde kilit ve yıldız
## sayacı görünür; kilide dokununca Bilge biraz daha yıldız toplamayı önerir.

const ITEM_SIZE: Vector2 = Vector2(200, 200)
const SHELF_HEIGHT: float = 272.0
const SHELF_GAP: float = 24.0
const SHELF_PAD: float = 36.0
const TOP_BAR: float = 176.0
const SHELF_COLOR: Color = ClayStyle.CARAMEL
const SHELF_EDGE: Color = ClayStyle.COCOA
const COUNTER_FONT_SIZE: int = 40
const COUNTER_STAR: float = 56.0
const DRAG_SCALE: float = 1.1

var app: Node = AppState

var _pid: String = ""
var _layer: Control = null
var _shelf: Panel = null
var _items: Dictionary = {}
var _lock_slot: Button = null
var _counter: Label = null
## Sürüklenen süs: anahtar ve parmakla süsün sol üstü arasındaki fark.
var _drag_key: String = ""
var _drag_offset: Vector2 = Vector2.ZERO

func _ready() -> void:
	_pid = app.profile_id
	var bg: Control = _image("region.agac_ev.bg")
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(bg)
	bg.set("stretch_mode", TextureRect.STRETCH_KEEP_ASPECT_COVERED)

	_shelf = Panel.new()
	_shelf.name = "Shelf"
	_shelf.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_shelf.add_theme_stylebox_override("panel", ClayStyle.plaque_box(SHELF_COLOR, SHELF_EDGE, 40))
	add_child(_shelf)

	_layer = Control.new()
	_layer.set_anchors_preset(Control.PRESET_FULL_RECT)
	_layer.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_layer)
	for key: String in app.progress.decor_unlocked(_pid):
		var item: Control = _image(key)
		item.name = "Decor_" + key.get_slice(".", 1)
		item.mouse_filter = Control.MOUSE_FILTER_STOP
		item.custom_minimum_size = ITEM_SIZE
		item.size = ITEM_SIZE
		item.pivot_offset = ITEM_SIZE / 2.0
		item.gui_input.connect(_on_item_input.bind(key))
		_layer.add_child(item)
		_items[key] = item
	if app.progress.next_decor_threshold(_pid) > 0:
		_lock_slot = _make_lock_slot()
		_layer.add_child(_lock_slot)

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

	resized.connect(_layout)
	_layout()
	_layout.call_deferred()

	app.session_timer.limit_reached.connect(_on_limit_reached)
	app.audio.play_music("music.agac_ev")
	app.narrator.say("vo.genel.agac_ev_giris" if not _items.is_empty() else "vo.genel.agac_ev_bos")

func _exit_tree() -> void:
	if app != null and app.session_timer.limit_reached.is_connected(_on_limit_reached):
		app.session_timer.limit_reached.disconnect(_on_limit_reached)

## Altyazı balonu üstte: raf ve sürükleme alanı altta.
func subtitle_placement() -> String:
	return "top"

# --- Sorgular (testler) ---

func unlocked_items() -> PackedStringArray:
	return PackedStringArray(_items.keys())

## Odaya yerleştirilmiş süsler.
func placed_items() -> PackedStringArray:
	return PackedStringArray(app.progress.decor_layout(_pid).keys())

## Rafta bekleyen süsler (açılma sırasıyla).
func shelf_items() -> PackedStringArray:
	var layout: Dictionary = app.progress.decor_layout(_pid)
	var res: PackedStringArray = PackedStringArray()
	for key: String in app.progress.decor_unlocked(_pid):
		if not layout.has(key):
			res.append(key)
	return res

func item_control(key: String) -> Control:
	return _items.get(key, null) as Control

func lock_slot() -> Button:
	return _lock_slot

## Kilit yuvasındaki "toplam / sıradaki eşik" sayacı.
func counter_text() -> String:
	return _counter.text if _counter != null else ""

## Süslerin yerleştirilebildiği oda (ekran koordinatı, rafın üstü).
func room_rect() -> Rect2:
	var view: Vector2 = _view_size()
	return Rect2(Vector2(0, TOP_BAR), Vector2(view.x, view.y - SHELF_HEIGHT - TOP_BAR))

func shelf_rect() -> Rect2:
	var view: Vector2 = _view_size()
	return Rect2(Vector2(0, view.y - SHELF_HEIGHT), Vector2(view.x, SHELF_HEIGHT))

# --- Eylemler ---

## Süsü merkezi `center` (ekran koordinatı) olacak biçimde bırakır: rafa bırakılırsa
## odadan kalkar, odaya bırakılırsa konumu kaydedilir.
func drop_item(key: String, center: Vector2) -> void:
	if not _items.has(key):
		return
	if shelf_rect().has_point(center) or center.y > room_rect().end.y:
		app.progress.store_decor(_pid, key)
	else:
		var room: Rect2 = room_rect()
		var span: Vector2 = (room.size - ITEM_SIZE).max(Vector2.ONE)
		app.progress.place_decor(_pid, key, (center - room.position - ITEM_SIZE / 2.0) / span)
	app.audio.play_sfx("sfx.drop")
	_layout()

func tap_lock() -> void:
	app.narrator.say("vo.genel.agac_ev_kilitli")

func _on_limit_reached() -> void:
	app.goto("session_end")

# --- Sürükleme ---

func _on_item_input(event: InputEvent, key: String) -> void:
	var item: Control = _items[key] as Control
	if event is InputEventMouseButton and (event as InputEventMouseButton).button_index == MOUSE_BUTTON_LEFT:
		if (event as InputEventMouseButton).pressed:
			_drag_key = key
			app.audio.play_sfx("sfx.pickup")
			_drag_offset = (event as InputEventMouseButton).position
			item.move_to_front()
			if not app.reduce_motion():
				item.scale = Vector2(DRAG_SCALE, DRAG_SCALE)
		elif _drag_key == key:
			_drag_key = ""
			item.scale = Vector2.ONE
			drop_item(key, item.position + ITEM_SIZE / 2.0)
		item.accept_event()
	elif event is InputEventMouseMotion and _drag_key == key:
		item.position += (event as InputEventMouseMotion).position - _drag_offset
		item.accept_event()

# --- Yerleşim ---

func _layout() -> void:
	var shelf: Rect2 = shelf_rect()
	_shelf.position = shelf.position + Vector2(SHELF_GAP, 0)
	_shelf.size = shelf.size - Vector2(SHELF_GAP * 2.0, SHELF_GAP)
	var room: Rect2 = room_rect()
	var span: Vector2 = (room.size - ITEM_SIZE).max(Vector2.ZERO)
	var layout: Dictionary = app.progress.decor_layout(_pid)
	var x: float = SHELF_GAP + SHELF_PAD
	var y: float = shelf.position.y + (shelf.size.y - SHELF_GAP - ITEM_SIZE.y) / 2.0
	for key: String in app.progress.decor_unlocked(_pid):
		var item: Control = _items[key] as Control
		if layout.has(key):
			item.position = room.position + (layout[key] as Vector2) * span
		else:
			item.position = Vector2(x, y)
			x += ITEM_SIZE.x + SHELF_GAP
	if _lock_slot != null:
		_lock_slot.position = Vector2(x, y)

func _view_size() -> Vector2:
	return size if size.x > 0.0 and size.y > 0.0 else get_viewport_rect().size

## Sıradaki süsün yeri: kilit + yıldız sayacı (toplam / eşik).
func _make_lock_slot() -> Button:
	var b: Button = Button.new()
	b.name = "LockSlot"
	b.focus_mode = Control.FOCUS_NONE
	b.custom_minimum_size = ITEM_SIZE
	b.size = ITEM_SIZE
	ClayStyle.style_button(b, ClayStyle.CREAM)
	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_preset(Control.PRESET_FULL_RECT)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(col)
	var lock: Control = _image("ui.lock")
	lock.set("min_side", 0.0)
	lock.custom_minimum_size = Vector2(96, 96)
	lock.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(lock)
	var row: HBoxContainer = HBoxContainer.new()
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(row)
	var star: Control = _image("ui.star")
	star.set("min_side", 0.0)
	star.custom_minimum_size = Vector2(COUNTER_STAR, COUNTER_STAR)
	star.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(star)
	_counter = Label.new()
	_counter.text = "%d / %d" % [app.progress.total_stars(_pid), app.progress.next_decor_threshold(_pid)]
	_counter.add_theme_font_size_override("font_size", COUNTER_FONT_SIZE)
	_counter.add_theme_color_override("font_color", ClayStyle.INK)
	_counter.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(_counter)
	b.pressed.connect(tap_lock)
	return b

func _image(key: String) -> Control:
	var img: Control = (load("res://scenes/components/asset_image.tscn") as PackedScene).instantiate() as Control
	img.set("key", key)
	return img
