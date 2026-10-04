extends MiniGame
## Veri: nesneleri sayıp sürükleyerek çetele, sıklık tablosu, nesne ya da nokta grafiği kurma,
## sonra grafikle ilgili soruları yanıtlama (spec §3.7 #16; MAT.1.4.1, MAT.2.4.1, MAT.3.4.1).
## Kurma evresi: soldaki tepside karışık duran her nesne, sağdaki grafikte kendi kategorisinin
##   satırına (çetele, tablo) ya da sütununa (nesne, nokta) sürüklenir. Bırakma alanı satırın /
##   sütunun tamamıdır. Doğru bırakmada nesne tepsiden çıkar, grafik bir artar.
## Soru evresi: tepsinin yerinde soru seçenekleri belirir, soru sesi okunur. "En çok / en az"
##   sorularında seçenekler kategori ikonlarıdır, diğerlerinde sayılar.
## Kategori kimliği her zaman ikondur; çetele ve noktalar şekildir (renk tek başına anlam taşımaz).

const Widgets: GDScript = preload("res://scenes/games/game_widgets.gd")
const ASSET_IMAGE: PackedScene = preload("res://scenes/components/asset_image.tscn")
const KINDS: PackedStringArray = ["tally", "table", "object", "dot"]
## Satır düzenli türler (çetele, tablo); diğerleri sütun düzenlidir.
const ROW_KINDS: PackedStringArray = ["tally", "table"]
const ASKS: PackedStringArray = ["most", "least", "count", "diff", "total"]
## İkon seçenekli sorular (seçenekler bütün kategorilerdir).
const ICON_ASKS: PackedStringArray = ["most", "least"]
const MIN_CATEGORIES: int = 2
const MAX_CATEGORIES: int = 4
const MIN_COUNT: int = 1
const MAX_COUNT: int = 8
const MIN_TOTAL: int = 3
const MAX_TOTAL: int = 15
const MIN_QUESTIONS: int = 1
const MAX_QUESTIONS: int = 3
const MIN_CHOICES: int = 2
const MAX_CHOICES: int = 4
const MAX_VOICED_COUNT: int = 20

# --- Tepsi ve grafik alanları (1920×1080 taban; altta altyazı payı) ---
const TRAY_RECT: Rect2 = Rect2(56, 176, 712, 696)
const TRAY_PAD: float = 28.0
const CHART_RECT: Rect2 = Rect2(808, 176, 1056, 696)
const CHART_PAD: float = 20.0
const LANE_GAP: float = 16.0
const ROW_MAX_H: float = 200.0
const COLUMN_MAX_W: float = 260.0
const LANE_PAD: float = 16.0
const LANE_FILL: Color = ClayStyle.IVORY
const LANE_EDGE: Color = Color(0.85, 0.74, 0.56)
## Tepsideki nesneler (dokunma hedefi; en az 128 px).
const ITEM_MAX: float = 180.0
const ITEM_FILL: float = 0.86
const ITEM_JITTER: float = 0.5
## Kategori başlığı ikonu.
const HEAD_MAX: float = 136.0
## Canlı sayaç (zorluk 1) ve tablo sayı hücresi.
const COUNTER_SIDE: float = 96.0
const COUNTER_FONT: int = 60
const TABLE_CELL_W: float = 200.0
const TABLE_FONT: int = 84
const COUNTER_COLOR: Color = ClayStyle.BUTTER
# --- Çetele çizgileri: dört dik çizgi + beşinci çapraz ---
const TALLY_GROUP: int = 5
const STROKE_W: float = 16.0
const STROKE_GAP: float = 34.0
const GROUP_PITCH: float = 200.0
const DIAGONAL_OVERHANG: float = 20.0
const TALLY_COLOR: Color = ClayStyle.COCOA
# --- Sütun yığını (nesne / nokta) ---
const STACK_FILL: float = 0.88
const DOT_COLOR: Color = ClayStyle.TEAL
# --- Soru seçenekleri ---
const CHOICE_MAX: float = 260.0
const CHOICE_GAP: float = 28.0
const CHOICE_FONT: int = 104
const CHOICE_ICON_PAD: float = 0.14
const CHOICE_COLOR: Color = ClayStyle.APRICOT
const CHOICE_ICON_COLOR: Color = ClayStyle.IVORY
# --- Zamanlama ---
const POP_IN_SECONDS: float = 0.18
const HINT_STEP_SECONDS: float = 0.9
const AUTO_STEP_SECONDS: float = 0.3

var _kind: String = "tally"
var _categories: Array[String] = []
var _counts: Array[int] = []
var _questions: Array[Dictionary] = []
var _phase: String = "build"
var _question_index: int = 0

## Tepsideki nesneler (karışık sıra) ve kategorileri.
var _items: Array[Control] = []
var _item_cat: Array[int] = []
var _item_home: Array[Vector2] = []
var _placed: Array[bool] = []
var _drag_index: int = -1
var _drag_offset: Vector2 = Vector2.ZERO

## Grafik: kategori başına satır / sütun (bırakma alanı), içindeki işaretler ve sayaçlar.
var _lanes: Array[Control] = []
var _chart: Array[int] = []
var _entries: Array = []
var _count_cells: Array[Control] = []
var _count_labels: Array[Label] = []
var _lane_size: Vector2 = Vector2.ZERO
var _head_side: float = 0.0
var _stack_slot: float = 0.0
var _stack_bottom: float = 0.0
var _tally_h: float = 0.0
var _content_x: float = 0.0

## Soru evresi seçenekleri: ikon sorularında kategori indeksleri, diğerlerinde sayılar.
var _choice_tiles: Array[Control] = []
var _choice_values: Array[int] = []
var _hint_gen: int = 0

func setup(params: Dictionary, difficulty_value: int, context: RoundContext) -> void:
	_init_round(difficulty_value, context)
	_kind = str(params["kind"])
	_categories.clear()
	for c: Variant in params["categories"] as Array:
		_categories.append(str(c))
	_counts.clear()
	for c: Variant in params["counts"] as Array:
		_counts.append(int(c))
	_questions.clear()
	for q: Variant in params["questions"] as Array:
		_questions.append(q as Dictionary)
	_phase = "build"
	_question_index = 0
	add_child(ClayStyle.make_panel(ClayStyle.tray_box(0.8), TRAY_RECT))
	add_child(ClayStyle.make_panel(ClayStyle.tray_box(0.72), CHART_RECT))
	_build_chart()
	_build_items()

func _is_rows() -> bool:
	return ROW_KINDS.has(_kind)

## Zorluk 1'de (çetele, nesne, nokta) başlıkta canlı sayaç; tabloda sayı hücresi her zaman.
func _shows_counter() -> bool:
	return _kind == "table" or difficulty <= 1

# --- Kurulum ---

func _build_chart() -> void:
	var n: int = _categories.size()
	var inner: Rect2 = CHART_RECT.grow(-CHART_PAD)
	for c: int in n:
		_chart.append(0)
		_entries.append([] as Array[Control])
	if _is_rows():
		var h: float = minf((inner.size.y - (n - 1) * LANE_GAP) / n, ROW_MAX_H)
		_lane_size = Vector2(inner.size.x, h)
		_head_side = minf(h - LANE_PAD * 1.5, HEAD_MAX)
		_content_x = LANE_PAD + _head_side + LANE_PAD * 2.5
		_tally_h = clampf(h * 0.6, 60.0, 110.0)
	else:
		var w: float = minf((inner.size.x - (n - 1) * LANE_GAP) / n, COLUMN_MAX_W)
		_lane_size = Vector2(w, inner.size.y)
		_head_side = minf(w - LANE_PAD * 2.5, HEAD_MAX)
		var top: float = LANE_PAD + COUNTER_SIDE + LANE_PAD
		_stack_bottom = _lane_size.y - _head_side - LANE_PAD * 2.0
		_stack_slot = (_stack_bottom - top) / MAX_COUNT
	var block: Vector2 = _lane_size
	if _is_rows():
		block.y = n * _lane_size.y + (n - 1) * LANE_GAP
	else:
		block.x = n * _lane_size.x + (n - 1) * LANE_GAP
	var origin: Vector2 = inner.position + (inner.size - block) / 2.0
	for c: int in n:
		var pos: Vector2 = origin
		if _is_rows():
			pos.y += c * (_lane_size.y + LANE_GAP)
		else:
			pos.x += c * (_lane_size.x + LANE_GAP)
		_lanes.append(_make_lane(c, Rect2(pos, _lane_size)))

## Kategori satırı / sütunu: açık kil şerit + başlık ikonu (+ sayaç).
func _make_lane(c: int, rect: Rect2) -> Control:
	var lane: Panel = ClayStyle.make_panel(ClayStyle.plaque_box(LANE_FILL, LANE_EDGE, 32, 4, 4, 0), rect)
	lane.name = "Lane%d" % c
	add_child(lane)
	lane.pivot_offset = rect.size / 2.0
	var head: Control = _make_image(lane, _categories[c], _head_side)
	if _is_rows():
		head.position = Vector2(LANE_PAD, (rect.size.y - _head_side) / 2.0)
	else:
		head.position = Vector2((rect.size.x - _head_side) / 2.0, rect.size.y - _head_side - LANE_PAD)
	if _shows_counter():
		var cell: Rect2
		var font: int = COUNTER_FONT
		if _kind == "table":
			var ch: float = rect.size.y - LANE_PAD * 1.5
			cell = Rect2(_content_x, (rect.size.y - ch) / 2.0, TABLE_CELL_W, ch)
			font = TABLE_FONT
		elif _is_rows():
			var side: float = minf(COUNTER_SIDE, rect.size.y - LANE_PAD * 2.0)
			cell = Rect2(rect.size.x - side - LANE_PAD, (rect.size.y - side) / 2.0, side, side)
		else:
			cell = Rect2((rect.size.x - COUNTER_SIDE) / 2.0, LANE_PAD, COUNTER_SIDE, COUNTER_SIDE)
		_make_count_cell(lane, cell, font)
	return lane

func _make_image(parent: Control, key: String, side: float) -> Control:
	var img: Control = ASSET_IMAGE.instantiate() as Control
	img.set("key", key)
	img.set("min_side", 0.0)
	img.mouse_filter = Control.MOUSE_FILTER_IGNORE
	parent.add_child(img)
	img.custom_minimum_size = Vector2(side, side)
	img.size = Vector2(side, side)
	img.pivot_offset = img.size / 2.0
	return img

## Sayı hücresi: kabarık kil kutu + Andika rakam (yalnızca rakam; metin yok).
func _make_count_cell(parent: Control, rect: Rect2, font_size: int) -> void:
	var cell: Panel = ClayStyle.make_panel(ClayStyle.card_box(COUNTER_COLOR, 24), rect)
	parent.add_child(cell)
	cell.pivot_offset = rect.size / 2.0
	var label: Label = Label.new()
	label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	ClayStyle.use_bold(label)
	label.add_theme_font_size_override("font_size", font_size)
	label.add_theme_color_override("font_color", ClayStyle.INK)
	cell.add_child(label)
	label.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	label.offset_bottom = -8.0
	label.text = "0"
	_count_cells.append(cell)
	_count_labels.append(label)

## Bütün nesneler tepside ızgara hücrelerine dağılır (her nesne kendi hücresinde, çakışmaz).
func _build_items() -> void:
	var cats: Array = []
	for c: int in _counts.size():
		for k: int in _counts[c]:
			cats.append(c)
	Widgets.shuffle(cats, ctx.rng)
	var n: int = cats.size()
	var inner: Rect2 = TRAY_RECT.grow(-TRAY_PAD)
	var cols: int = ceili(sqrt(float(n)))
	var rows: int = ceili(float(n) / cols)
	var cell: Vector2 = Vector2(inner.size.x / cols, inner.size.y / rows)
	var side: float = clampf(minf(cell.x, cell.y) * ITEM_FILL, ClayStyle.MIN_TOUCH, ITEM_MAX)
	var slots: Array = []
	for s: int in cols * rows:
		slots.append(s)
	Widgets.shuffle(slots, ctx.rng)
	var jitter: Vector2 = ((cell - Vector2(side, side)) / 2.0).max(Vector2.ZERO) * ITEM_JITTER
	for i: int in n:
		var s: int = int(slots[i])
		var center: Vector2 = inner.position + Vector2((s % cols) + 0.5, (s / cols) + 0.5) * cell
		center += Vector2(ctx.rng.randf_range(-1.0, 1.0) * jitter.x, ctx.rng.randf_range(-1.0, 1.0) * jitter.y)
		var img: Control = _make_image(self, _categories[int(cats[i])], side)
		img.name = "Item%d" % i
		img.mouse_filter = Control.MOUSE_FILTER_STOP
		img.position = center - img.size / 2.0
		img.gui_input.connect(_on_item_input.bind(i))
		_items.append(img)
		_item_cat.append(int(cats[i]))
		_item_home.append(img.position)
		_placed.append(false)

# --- Kurma evresi ---

func _on_item_input(event: InputEvent, index: int) -> void:
	var view: Control = _items[index]
	if is_press(event):
		if _placed[index] or _phase != "build" or not _can_input():
			return
		_drag_index = index
		_drag_offset = view.get_global_mouse_position() - view.global_position
		view.move_to_front()
		_tap_feedback(view)
	elif event is InputEventMouseMotion and _drag_index == index:
		view.global_position = view.get_global_mouse_position() - _drag_offset
	elif event is InputEventMouseButton and _drag_index == index and not (event as InputEventMouseButton).pressed:
		_drag_index = -1
		var mouse: Vector2 = view.get_global_mouse_position()
		var hit: int = -1
		for c: int in _lanes.size():
			if _lanes[c].get_global_rect().has_point(mouse):
				hit = c
		_drop(index, hit)

## category: bırakılan satır / sütun (-1: hedef dışı, nesne yalnızca geri döner, cevap sayılmaz).
func _drop(item: int, category: int) -> void:
	if not _can_input() or _phase != "build" or item < 0 or item >= _items.size() or _placed[item]:
		return
	if category < 0 or category >= _lanes.size():
		_move_home(item)
		return
	if _item_cat[item] == category:
		var all_done: bool = _accept(item)
		_submit_answer(true, false)
		if all_done:
			_enter_questions()
	else:
		_move_home(item)
		_submit_answer(false, false)

## Nesne tepsiden çıkar, grafik bir artar. Hepsi yerleştiyse true.
func _accept(item: int) -> bool:
	_placed[item] = true
	var view: Control = _items[item]
	view.visible = false
	view.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_increment(_item_cat[item])
	return not _placed.has(false)

func _move_home(item: int) -> void:
	var view: Control = _items[item]
	var home: Vector2 = _item_home[item]
	if _reduce_motion() or not is_inside_tree():
		view.position = home
		return
	var tw: Tween = view.create_tween()
	tw.tween_property(view, "position", home, 0.25).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)

## Kategorinin grafiğine bir işaret ekler (çetele çizgisi, tablo sayısı, mini nesne, nokta).
func _increment(c: int) -> void:
	var k: int = _chart[c]
	_chart[c] = k + 1
	if c < _count_labels.size():
		_count_labels[c].text = str(_chart[c])
	var lane: Control = _lanes[c]
	var entry: Control = null
	match _kind:
		"tally":
			entry = _make_tally_mark(lane, k)
		"object":
			entry = _make_image(lane, _categories[c], _stack_slot * STACK_FILL)
			entry.position = _stack_center(k) - entry.size / 2.0
		"dot":
			entry = _make_dot(lane, k)
	if entry == null:
		return
	(_entries[c] as Array[Control]).append(entry)
	if not _reduce_motion() and is_inside_tree():
		entry.scale = Vector2(0.2, 0.2)
		var tw: Tween = entry.create_tween()
		tw.tween_property(entry, "scale", Vector2.ONE, POP_IN_SECONDS).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)

func _stack_center(k: int) -> Vector2:
	return Vector2(_lane_size.x / 2.0, _stack_bottom - (k + 0.5) * _stack_slot)

## Çetele: beşli gruplarda dört dik çizgi, beşinci çizgi grubu çapraz keser.
func _make_tally_mark(lane: Control, k: int) -> Control:
	var group: int = k / TALLY_GROUP
	var pos_in: int = k % TALLY_GROUP
	var x0: float = _content_x + STROKE_W + group * GROUP_PITCH
	var top: float = (_lane_size.y - _tally_h) / 2.0
	var mark: Control = Control.new()
	mark.mouse_filter = Control.MOUSE_FILTER_IGNORE
	lane.add_child(mark)
	if pos_in < TALLY_GROUP - 1:
		mark.position = Vector2(x0 + pos_in * STROKE_GAP - STROKE_W, top)
		mark.size = Vector2(STROKE_W * 2.0, _tally_h)
		mark.draw.connect(func() -> void:
			_draw_capsule(mark, Vector2(STROKE_W, STROKE_W / 2.0), Vector2(STROKE_W, _tally_h - STROKE_W / 2.0), STROKE_W, TALLY_COLOR))
	else:
		var w: float = (TALLY_GROUP - 2) * STROKE_GAP + DIAGONAL_OVERHANG * 2.0
		mark.position = Vector2(x0 - DIAGONAL_OVERHANG, top)
		mark.size = Vector2(w, _tally_h)
		mark.draw.connect(func() -> void:
			_draw_capsule(mark, Vector2(STROKE_W / 2.0, _tally_h - STROKE_W / 2.0), Vector2(w - STROKE_W / 2.0, STROKE_W / 2.0), STROKE_W, TALLY_COLOR))
	mark.pivot_offset = mark.size / 2.0
	return mark

## Kil nokta: gölge + gövde + ışık lekesi.
func _make_dot(lane: Control, k: int) -> Control:
	var side: float = _stack_slot * STACK_FILL
	var dot: Control = Control.new()
	dot.mouse_filter = Control.MOUSE_FILTER_IGNORE
	lane.add_child(dot)
	dot.size = Vector2(side, side)
	dot.position = _stack_center(k) - dot.size / 2.0
	dot.pivot_offset = dot.size / 2.0
	dot.draw.connect(func() -> void:
		var c: Vector2 = dot.size / 2.0
		var r: float = side * 0.46
		dot.draw_circle(c + Vector2(0, side * 0.05), r, ClayStyle.SHADOW, true, -1.0, true)
		dot.draw_circle(c, r, DOT_COLOR, true, -1.0, true)
		dot.draw_circle(c, r, DOT_COLOR.darkened(0.3), false, maxf(2.0, side * 0.05), true)
		dot.draw_circle(c + Vector2(-0.16, -0.16) * side, side * 0.1, Color(1, 1, 1, 0.4), true, -1.0, true))
	return dot

## Kalın, uçları yuvarlak kil çizgi: gölge + gövde + açık ışık çizgisi.
static func _draw_capsule(ci: CanvasItem, a: Vector2, b: Vector2, w: float, color: Color) -> void:
	var shadow: Vector2 = Vector2(0, 4)
	for pass_color: Color in [ClayStyle.SHADOW, color]:
		var off: Vector2 = shadow if pass_color == ClayStyle.SHADOW else Vector2.ZERO
		ci.draw_line(a + off, b + off, pass_color, w, true)
		ci.draw_circle(a + off, w / 2.0, pass_color, true, -1.0, true)
		ci.draw_circle(b + off, w / 2.0, pass_color, true, -1.0, true)
	ci.draw_line(a.lerp(b, 0.15) + Vector2(-w * 0.18, 0), a.lerp(b, 0.7) + Vector2(-w * 0.18, 0), color.lightened(0.35), w * 0.28, true)

# --- Soru evresi ---

func _enter_questions() -> void:
	_phase = "questions"
	_drag_index = -1
	_question_index = 0
	_show_question()

## Geçerli sorunun seçeneklerini tepsiye dizer ve soru sesini okur.
func _show_question() -> void:
	for t: Control in _choice_tiles:
		t.queue_free()
	_choice_tiles.clear()
	_choice_values.clear()
	var q: Dictionary = _questions[_question_index]
	var icons: bool = ICON_ASKS.has(str(q["ask"]))
	if icons:
		for c: int in _categories.size():
			_choice_values.append(c)
	else:
		for v: Variant in q["choices"] as Array:
			_choice_values.append(int(v))
	var n: int = _choice_values.size()
	var cols: int = 3 if n == 3 else 2
	var rows: int = ceili(float(n) / cols)
	var inner: Rect2 = TRAY_RECT.grow(-TRAY_PAD)
	var side: float = minf(CHOICE_MAX, minf((inner.size.x - (cols - 1) * CHOICE_GAP) / cols, (inner.size.y - (rows - 1) * CHOICE_GAP) / rows))
	var block: Vector2 = Vector2(cols * side + (cols - 1) * CHOICE_GAP, rows * side + (rows - 1) * CHOICE_GAP)
	var origin: Vector2 = inner.position + (inner.size - block) / 2.0
	for i: int in n:
		var row: int = i / cols
		var in_row: int = mini(cols, n - row * cols)
		# Eksik son satır ortalanır.
		var row_x: float = origin.x + (block.x - (in_row * side + (in_row - 1) * CHOICE_GAP)) / 2.0
		var rect: Rect2 = Rect2(Vector2(row_x + (i % cols) * (side + CHOICE_GAP), origin.y + row * (side + CHOICE_GAP)), Vector2(side, side))
		var tile: Control
		if icons:
			tile = Widgets.make_tile(self, "", rect, CHOICE_FONT, CHOICE_ICON_COLOR)
			var pad: float = side * CHOICE_ICON_PAD
			var img: Control = _make_image(tile, _categories[_choice_values[i]], side - pad * 2.0)
			img.position = Vector2(pad, pad * 0.7)
		else:
			tile = Widgets.make_tile(self, str(_choice_values[i]), rect, CHOICE_FONT, CHOICE_COLOR)
		tile.name = "Choice%d" % i
		tile.gui_input.connect(_on_choice_input.bind(i))
		_choice_tiles.append(tile)
	narrator.say(str(q["voice"]))

func _on_choice_input(event: InputEvent, index: int) -> void:
	if is_press(event):
		_choose(index)

func _choose(index: int) -> void:
	if not _can_input() or _phase != "questions" or index < 0 or index >= _choice_tiles.size():
		return
	_tap_feedback(_choice_tiles[index])
	if index == _correct_index():
		_answer_correct()
	else:
		_sway(_choice_tiles[index])
		_submit_answer(false, false)

## Doğru cevap: son soruda tur biter, öncekilerde sıradaki soruya geçilir.
func _answer_correct() -> void:
	var last: bool = _question_index >= _questions.size() - 1
	_submit_answer(true, last)
	if not last:
		_question_index += 1
		_show_question()

## Sorunun cevabı (sayı) ya da en çok / en az kategorinin indeksi.
func _answer_value(q: Dictionary) -> int:
	match str(q["ask"]):
		"most":
			return _counts.find(_counts.max())
		"least":
			return _counts.find(_counts.min())
		"count":
			return _counts[int(q["category"])]
		"diff":
			return _counts[int(q["a"])] - _counts[int(q["b"])]
		"total":
			return _total()
	return -1

func _correct_index() -> int:
	if _phase != "questions":
		return -1
	return _choice_values.find(_answer_value(_questions[_question_index]))

func _total() -> int:
	var s: int = 0
	for c: int in _counts:
		s += c
	return s

func _sway(c: Control) -> void:
	if _reduce_motion():
		return
	var tw: Tween = c.create_tween()
	for deg: float in [8.0, -8.0, 4.0, 0.0]:
		tw.tween_property(c, "rotation_degrees", deg, 0.1)

# --- İpuçları ---

func _is_multi_step() -> bool:
	return true

func show_hint(level: int) -> void:
	if _done or _busy:
		return
	if level == 1:
		if _phase == "build":
			_hint_build()
		else:
			_hint_question()
	elif level >= 2:
		_auto_complete()

## İpucu 1 (kurma): sıradaki nesne ve onun satırı / sütunu parlar.
func _hint_build() -> void:
	var i: int = _placed.find(false)
	if i < 0:
		return
	_glow(_items[i])
	_glow(_lanes[_item_cat[i]])

## İpucu 1 (soru): ilgili satır / sütunlar parlar; sayı sorularında işaretler sesli sayılır.
func _hint_question() -> void:
	_hint_gen += 1
	var gen: int = _hint_gen
	var q: Dictionary = _questions[_question_index]
	var groups: Array = []
	match str(q["ask"]):
		"count":
			groups = [[int(q["category"])]]
		"diff":
			groups = [[int(q["a"])], [int(q["b"])]]
		"total":
			var all: Array = []
			for c: int in _categories.size():
				all.append(c)
			groups = [all]
	var lit: Dictionary = {}
	if groups.is_empty():
		for c: int in _categories.size():
			lit[c] = true
	for g: Variant in groups:
		for c: Variant in g as Array:
			lit[int(c)] = true
	for c: Variant in lit:
		_glow(_lanes[int(c)])
	for g: Variant in groups:
		var n: int = 0
		for c: Variant in g as Array:
			for k: int in _chart[int(c)]:
				if gen != _hint_gen or _done:
					return
				n += 1
				_bounce(_count_target(int(c), k))
				if n <= MAX_VOICED_COUNT:
					narrator.say("vo.sayi.%d" % n)
				await _wait(HINT_STEP_SECONDS)

## Sesli saymada zıplayan öğe: işaretin kendisi, tabloda sayı hücresi.
func _count_target(c: int, k: int) -> Control:
	var list: Array[Control] = _entries[c] as Array[Control]
	if k < list.size():
		return list[k]
	if c < _count_cells.size():
		return _count_cells[c]
	return _lanes[c]

func _bounce(c: Control) -> void:
	if _reduce_motion() or not is_inside_tree():
		return
	c.pivot_offset = c.size / 2.0
	var tw: Tween = c.create_tween()
	tw.tween_property(c, "scale", Vector2(1.25, 1.25), 0.2)
	tw.tween_property(c, "scale", Vector2.ONE, 0.2)

## İpucu 2: kalan bırakmalar ve sorular sırayla doğru tamamlanır; yardım sürerken girdi kapalıdır.
func _auto_complete() -> void:
	_hint_gen += 1
	_busy = true
	helped = true
	if _drag_index >= 0:
		_move_home(_drag_index)
		_drag_index = -1
	while _phase == "build" and not _done:
		var i: int = _placed.find(false)
		if i < 0:
			break
		_glow(_lanes[_item_cat[i]])
		await _wait(AUTO_STEP_SECONDS)
		if _done:
			return
		var all_done: bool = _accept(i)
		_submit_answer(true, false)
		if all_done:
			_enter_questions()
		await _wait(AUTO_STEP_SECONDS)
	while _phase == "questions" and not _done:
		var idx: int = _correct_index()
		_glow(_choice_tiles[idx])
		await _wait(AUTO_STEP_SECONDS * 2.0)
		if _done:
			return
		_answer_correct()
		await _wait(AUTO_STEP_SECONDS)
	_busy = false

# --- Test kancaları (gerçek girdiyle aynı kod yolu) ---

## Sıradaki adım için doğru ya da yanlış cevap: kurmada bırakma, soruda seçim.
func _debug_answer(correct: bool) -> void:
	if _phase == "build":
		var i: int = _placed.find(false)
		if i < 0:
			return
		var c: int = _item_cat[i]
		_drop(i, c if correct else (c + 1) % _categories.size())
	else:
		var right: int = _correct_index()
		if correct:
			_choose(right)
		else:
			_choose(0 if right != 0 else 1)

func _debug_drop(item_index: int, category: int) -> void:
	_drop(item_index, category)

func _debug_choose(i: int) -> void:
	_choose(i)

func _debug_correct_index() -> int:
	return _correct_index()

func remaining_items() -> int:
	return _placed.count(false)

func chart_counts() -> Array[int]:
	return _chart.duplicate()

func phase() -> String:
	return _phase

func question_index() -> int:
	return _question_index

## Tepsideki nesnelerin kategorileri (nesne indeksi sırasıyla).
func item_categories() -> Array[int]:
	return _item_cat.duplicate()

## Kategori satırları / sütunları (bırakma alanları).
func chart_targets() -> Array[Control]:
	return _lanes.duplicate()

## Görünen sayaç / tablo hücresi yazıları (gizliyse boş).
func counter_texts() -> Array[String]:
	var out: Array[String] = []
	for l: Label in _count_labels:
		out.append(l.text)
	return out

func touch_targets() -> Array[Control]:
	var res: Array[Control] = []
	if _phase == "build":
		for i: int in _items.size():
			if not _placed[i]:
				res.append(_items[i])
	else:
		res.assign(_choice_tiles)
	return res

# --- Doğrulama ---

static func validate_params(p: Dictionary) -> Array[String]:
	var errs: Array[String] = []
	var kind: Variant = p.get("kind")
	if not (kind is String and KINDS.has(kind)):
		errs.append(ContentValidator.msg("err.params.chart_kind"))
	var cats: Variant = p.get("categories")
	var cats_ok: bool = cats is Array and (cats as Array).size() >= MIN_CATEGORIES and (cats as Array).size() <= MAX_CATEGORIES
	if cats_ok:
		var seen: Dictionary = {}
		for c: Variant in cats as Array:
			if not (c is String) or (c as String).is_empty() or seen.has(c):
				cats_ok = false
				break
			seen[c] = true
	if not cats_ok:
		errs.append(ContentValidator.msg("err.params.chart_categories"))
		return errs
	var raw_counts: Variant = p.get("counts")
	var counts: Array[int] = []
	var counts_ok: bool = raw_counts is Array and (raw_counts as Array).size() == (cats as Array).size()
	if counts_ok:
		for v: Variant in raw_counts as Array:
			if not ContentValidator.is_int_like(v) or int(v) < MIN_COUNT or int(v) > MAX_COUNT:
				counts_ok = false
				break
			counts.append(int(v))
	if not counts_ok:
		errs.append(ContentValidator.msg("err.params.chart_counts"))
		return errs
	var total: int = 0
	for c: int in counts:
		total += c
	if total < MIN_TOTAL or total > MAX_TOTAL:
		errs.append(ContentValidator.msg("err.params.chart_total"))
	var qs: Variant = p.get("questions")
	if not (qs is Array) or (qs as Array).size() < MIN_QUESTIONS or (qs as Array).size() > MAX_QUESTIONS:
		errs.append(ContentValidator.msg("err.params.chart_questions"))
		return errs
	for q: Variant in qs as Array:
		if not (q is Dictionary):
			errs.append(ContentValidator.msg("err.params.chart_questions"))
			continue
		_validate_question(q as Dictionary, counts, total, errs)
	return errs

static func _validate_question(q: Dictionary, counts: Array[int], total: int, errs: Array[String]) -> void:
	var voice: Variant = q.get("voice")
	if not (voice is String) or (voice as String).is_empty():
		errs.append(ContentValidator.msg("err.params.chart_voice"))
	var ask: Variant = q.get("ask")
	if not (ask is String and ASKS.has(ask)):
		errs.append(ContentValidator.msg("err.params.chart_ask"))
		return
	match ask as String:
		"most":
			if counts.count(counts.max()) != 1:
				errs.append(ContentValidator.msg("err.params.chart_unique"))
		"least":
			if counts.count(counts.min()) != 1:
				errs.append(ContentValidator.msg("err.params.chart_unique"))
		"count":
			if not _is_index(q.get("category"), counts.size()):
				errs.append(ContentValidator.msg("err.params.chart_index"))
				return
			_validate_choices(q.get("choices"), counts[int(q["category"])], errs)
		"diff":
			if not _is_index(q.get("a"), counts.size()) or not _is_index(q.get("b"), counts.size()):
				errs.append(ContentValidator.msg("err.params.chart_index"))
				return
			var d: int = counts[int(q["a"])] - counts[int(q["b"])]
			if d <= 0:
				errs.append(ContentValidator.msg("err.params.chart_diff"))
				return
			_validate_choices(q.get("choices"), d, errs)
		"total":
			_validate_choices(q.get("choices"), total, errs)

static func _is_index(v: Variant, n: int) -> bool:
	return ContentValidator.is_int_like(v) and int(v) >= 0 and int(v) < n

static func _validate_choices(choices: Variant, answer: int, errs: Array[String]) -> void:
	var ok: bool = choices is Array and (choices as Array).size() >= MIN_CHOICES and (choices as Array).size() <= MAX_CHOICES
	var seen: Dictionary = {}
	if ok:
		for c: Variant in choices as Array:
			if not ContentValidator.is_int_like(c) or seen.has(int(c)):
				ok = false
				break
			seen[int(c)] = true
	if not ok:
		errs.append(ContentValidator.msg("err.params.chart_choices"))
		return
	if not seen.has(answer):
		errs.append(ContentValidator.msg("err.params.chart_choices_missing"))
