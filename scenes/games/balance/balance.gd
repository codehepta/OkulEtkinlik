extends MiniGame
## Terazi ve sayı doğrusu.
## scale/compare: iki kefedeki değerleri karşılaştır (<, =, >). Kefeler destek takozlarıyla düz
##   durur; doğru cevapta takozlar çekilir ve terazi ağır yana eğilir. 1. sınıfta seçenekler sembol
##   yerine "daha az / eşit / daha çok" sözcük kartıdır, üstlerinde ağır kefeyi gösteren minik terazi
##   ikonu vardır (Faz 3b, S1). `item` gruplarında ipucu bire bir eşleme çizgileridir (MAT.1.1.4).
## scale/missing: bir kefedeki eksik değeri ("?") bul; doğru sayı konunca terazi dengelenir.
## number_line/find: işaretçinin durduğu çentiğin sayısını seç.
## number_line/place: verilen sayının çentiğine dokun.

const Widgets: GDScript = preload("res://scenes/games/game_widgets.gd")
const ASSET_IMAGE: PackedScene = preload("res://scenes/components/asset_image.tscn")
const MODES: PackedStringArray = ["scale", "number_line"]
const SCALE_ASKS: PackedStringArray = ["compare", "missing"]
const LINE_ASKS: PackedStringArray = ["find", "place"]
const MAX_VALUE: int = 1000
const MAX_SIDE: int = 3
const MAX_ITEM_COUNT: int = 10
const MIN_INTERVALS: int = 2
const MAX_INTERVALS: int = 10
const MIN_CHOICES: int = 2
const MAX_CHOICES: int = 4
## Karşılaştırma seçenekleri (sol ? sağ), sabit sırada.
const RELATIONS: Array[String] = ["<", "=", ">"]
## 1. sınıf sözcük kartları (RELATIONS ile aynı sıra: sol daha az / eşit / sol daha çok).
const RELATION_WORD_KEYS: Array[String] = ["bal.word.less", "bal.word.equal", "bal.word.more"]
## Sembol yerine sözcük kartı kullanan en yüksek sınıf.
const WORD_GRADE_MAX: int = 1
const WORD_CHOICE_SIZE: Vector2 = Vector2(320, 200)
const WORD_FONT: int = 54
const WORD_ICON_H: float = 74.0
const PAIR_LINE_COLOR: Color = ClayStyle.COCOA

# --- Terazi ölçüleri ---
const PIVOT: Vector2 = Vector2(960, 330)
const ARM: float = 500.0
const HANG: float = 200.0
const PAN_SIZE: Vector2 = Vector2(460, 210)
const DISH_H: float = 26.0
const FLOOR_Y: float = 690.0
const MAX_TILT: float = 0.21
const BLOCK_SIZE: Vector2 = Vector2(136, 128)
const BLOCK_GAP: float = 8.0
const ITEM_SIDE: float = 72.0
const ITEMS_PER_ROW: int = 5
const BEAM_COLOR: Color = ClayStyle.CARAMEL
const POST_COLOR: Color = ClayStyle.CLAY_EDGE
const DISH_COLOR: Color = ClayStyle.SAND
const SUPPORT_COLOR: Color = ClayStyle.SKY
const TILT_SECONDS: float = 0.6
# --- Seçenek karoları ---
const CHOICE_SIZE: Vector2 = Vector2(210, 170)
const CHOICE_GAP: float = 60.0
const CHOICE_Y: float = 760.0
const CHOICE_FONT: int = 96
# --- Sayı doğrusu ölçüleri ---
const LINE_LEFT: float = 160.0
const LINE_RIGHT: float = 1760.0
const LINE_Y: float = 560.0
const TICK_H: float = 44.0
const LABEL_FONT: int = 60
const TARGET_RECT: Rect2 = Rect2(835, 170, 250, 180)
const COLUMN_TOP: float = 400.0
const COLUMN_H: float = 300.0
const MARKER_SIZE: Vector2 = Vector2(96, 120)
const MARKER_COLOR: Color = ClayStyle.TEAL
const LABEL_EVERY: int = 5

var _mode: String = "scale"
var _ask: String = "compare"
var _left: Array = []
var _right: Array = []
var _item: String = ""
var _answer: int = 0
var _correct: int = -1
var _choice_values: Array[int] = []
var _choice_views: Array[Control] = []
# Terazi
var _angle: float = 0.0
var _rig: Control = null
var _pans: Array[Control] = []
var _supports: Array[Control] = []
var _missing_tile: Control = null
var _missing_side: int = -1
var _hint_total: int = -1
var _tilt_tween: Tween = null
var _item_count: int = 0
## Kefe başına nesne görüntüleri (bire bir eşleme ipucu için).
var _item_views: Array = [[], []]
var _pairs_view: Control = null
var _word_choices: bool = false
# Sayı doğrusu
var _min: int = 0
var _max: int = 10
var _tick: int = 1
var _value: int = 0
var _labels: Dictionary = {}
var _line: Control = null
var _marker: Control = null
var _columns: Array[Control] = []
var _label_views: Dictionary = {}

func setup(params: Dictionary, difficulty_value: int, context: RoundContext) -> void:
	_init_round(difficulty_value, context)
	_mode = str(params["mode"])
	_ask = str(params["ask"])
	if _mode == "scale":
		_setup_scale(params)
	else:
		_setup_line(params)

# ================= Terazi =================

func _setup_scale(params: Dictionary) -> void:
	_left = (params["left"] as Array).duplicate()
	_right = (params["right"] as Array).duplicate()
	_item = str(params.get("item", ""))
	_rig = Control.new()
	_rig.name = "Rig"
	_rig.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_rig.size = BASE_SIZE
	_rig.draw.connect(_draw_rig)
	add_child(_rig)
	for side: int in 2:
		var values: Array = _left if side == 0 else _right
		if _ask == "compare":
			_supports.append(_make_support(side))
		_pans.append(_make_pan(values, side))
	if _ask == "compare":
		var l: int = _sum(_left)
		var r: int = _sum(_right)
		_correct = 0 if l < r else (1 if l == r else 2)
		_word_choices = ctx.grade <= WORD_GRADE_MAX
		if _word_choices:
			var words: Array[String] = []
			for k: String in RELATION_WORD_KEYS:
				words.append(Strings.t(k))
			_build_choices(words, WORD_CHOICE_SIZE, WORD_FONT)
			for i: int in _choice_views.size():
				_add_relation_icon(_choice_views[i], i)
		else:
			_build_choices(RELATIONS)
		_set_angle(0.0)
	else:
		_missing_side = 0 if _left.has(null) else 1
		var known_same: int = _sum(_left if _missing_side == 0 else _right)
		var other: int = _sum(_right if _missing_side == 0 else _left)
		_answer = other - known_same
		var labels: Array[String] = []
		for c: Variant in params["choices"] as Array:
			_choice_values.append(int(c))
			labels.append(str(int(c)))
		_correct = _choice_values.find(_answer)
		_build_choices(labels)
		_set_angle(_tilt_for(_sum(_left), _sum(_right)))

static func _sum(values: Array) -> int:
	var s: int = 0
	for v: Variant in values:
		if v != null:
			s += int(v)
	return s

## Ağır yana eğim (radyan): sağ ağırsa pozitif (sağ kefe aşağı).
static func _tilt_for(left_sum: int, right_sum: int) -> float:
	return signf(float(right_sum - left_sum)) * MAX_TILT

func _end_of(side: int) -> Vector2:
	var dir: float = -1.0 if side == 0 else 1.0
	return PIVOT + Vector2(dir * ARM, 0).rotated(_angle)

## Kefe: değer blokları (ya da nesne grubu) + altında kil tabak. Kefe ip ucundan dik sarkar.
func _make_pan(values: Array, side: int) -> Control:
	var pan: Control = Control.new()
	pan.name = "Pan%d" % side
	pan.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pan.size = PAN_SIZE
	pan.draw.connect(func() -> void:
		var dish: Rect2 = Rect2(Vector2(0, PAN_SIZE.y - DISH_H), Vector2(PAN_SIZE.x, DISH_H))
		pan.draw_style_box(ClayStyle.plaque_box(DISH_COLOR, DISH_COLOR.darkened(0.3), 14, 4, 6, 8), dish))
	add_child(pan)
	var top_y: float = PAN_SIZE.y - DISH_H - 4.0
	if _item != "":
		var n: int = int(values[0])
		_item_count += n
		for k: int in n:
			var row: int = k / ITEMS_PER_ROW
			var in_row: int = mini(ITEMS_PER_ROW, n - row * ITEMS_PER_ROW)
			var col: int = k % ITEMS_PER_ROW
			var img: Control = ASSET_IMAGE.instantiate() as Control
			img.set("key", _item)
			img.set("min_side", 0.0)
			img.mouse_filter = Control.MOUSE_FILTER_IGNORE
			pan.add_child(img)
			img.custom_minimum_size = Vector2(ITEM_SIDE, ITEM_SIDE)
			img.size = Vector2(ITEM_SIDE, ITEM_SIDE)
			var x0: float = (PAN_SIZE.x - in_row * ITEM_SIDE) / 2.0
			img.position = Vector2(x0 + col * ITEM_SIDE, top_y - (row + 1) * ITEM_SIDE)
			(_item_views[side] as Array).append(img)
	else:
		var w: float = values.size() * BLOCK_SIZE.x + (values.size() - 1) * BLOCK_GAP
		var x: float = (PAN_SIZE.x - w) / 2.0
		for v: Variant in values:
			var rect: Rect2 = Rect2(Vector2(x, top_y - BLOCK_SIZE.y), BLOCK_SIZE)
			var font: int = 72 if v == null or int(v) < 100 else (60 if int(v) < 1000 else 48)
			if v == null:
				var well: Control = Control.new()
				well.mouse_filter = Control.MOUSE_FILTER_IGNORE
				well.position = rect.position
				well.size = rect.size
				well.draw.connect(func() -> void: Widgets.draw_well(well, Rect2(Vector2(4, 4), well.size - Vector2(8, 8))))
				pan.add_child(well)
				_missing_tile = Widgets.make_tile(pan, "?", rect, font, ClayStyle.IVORY)
				_missing_tile.mouse_filter = Control.MOUSE_FILTER_IGNORE
				_missing_tile.modulate.a = 0.55
			else:
				var t: Control = Widgets.make_tile(pan, str(int(v)), rect, font, ClayStyle.APRICOT)
				t.mouse_filter = Control.MOUSE_FILTER_IGNORE
			x += BLOCK_SIZE.x + BLOCK_GAP
	return pan

## Destek takozu: kefe tabağının altından zemine uzanan kil sütun.
func _make_support(side: int) -> Control:
	var s: Control = Control.new()
	s.name = "Support%d" % side
	s.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var dish_bottom: float = PIVOT.y + HANG
	var x: float = PIVOT.x + (-ARM if side == 0 else ARM)
	s.position = Vector2(x - 60.0, dish_bottom + 4.0)
	s.size = Vector2(120, FLOOR_Y - dish_bottom - 4.0)
	s.draw.connect(func() -> void:
		var pts: PackedVector2Array = PackedVector2Array([Vector2(26, 0), Vector2(94, 0), Vector2(120, s.size.y), Vector2(0, s.size.y)])
		s.draw_colored_polygon(pts, SUPPORT_COLOR)
		s.draw_polyline(pts + PackedVector2Array([pts[0]]), SUPPORT_COLOR.darkened(0.3), 5.0, true))
	add_child(s)
	return s

func _draw_rig() -> void:
	# Zemin, direk ve ayak.
	_rig.draw_style_box(ClayStyle.plaque_box(POST_COLOR.lightened(0.2), POST_COLOR, 20, 4, 8, 10), Rect2(PIVOT.x - 170, FLOOR_Y - 10, 340, 46))
	_rig.draw_style_box(ClayStyle.plaque_box(POST_COLOR.lightened(0.3), POST_COLOR, 18, 4, 0, 0), Rect2(PIVOT.x - 26, PIVOT.y, 52, FLOOR_Y - PIVOT.y))
	# İpler: kol ucundan tabağın iki köşesine.
	for side: int in 2:
		var e: Vector2 = _end_of(side)
		var dish_y: float = e.y + HANG - DISH_H
		_rig.draw_line(e, Vector2(e.x - PAN_SIZE.x / 2.0 + 20.0, dish_y), ClayStyle.COCOA, 5.0, true)
		_rig.draw_line(e, Vector2(e.x + PAN_SIZE.x / 2.0 - 20.0, dish_y), ClayStyle.COCOA, 5.0, true)
	# Kol (döndürülmüş kil çubuk) ve mil.
	_rig.draw_set_transform(PIVOT, _angle, Vector2.ONE)
	_rig.draw_style_box(ClayStyle.plaque_box(BEAM_COLOR.lightened(0.15), BEAM_COLOR.darkened(0.2), 18, 4, 6, 8), Rect2(-ARM - 20.0, -18.0, ARM * 2.0 + 40.0, 40.0))
	_rig.draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)
	_rig.draw_circle(PIVOT, 26.0, ClayStyle.HONEY, true, -1.0, true)
	_rig.draw_circle(PIVOT, 26.0, ClayStyle.HONEY.darkened(0.3), false, 5.0, true)

func _set_angle(a: float) -> void:
	_angle = a
	for side: int in _pans.size():
		var e: Vector2 = _end_of(side)
		_pans[side].position = Vector2(e.x - PAN_SIZE.x / 2.0, e.y + HANG - PAN_SIZE.y)
	if _rig != null:
		_rig.queue_redraw()
	if _pairs_view != null:
		_pairs_view.queue_redraw()

func _tilt_to(a: float) -> void:
	if _tilt_tween != null and _tilt_tween.is_valid():
		_tilt_tween.kill()
	if _reduce_motion() or not is_inside_tree():
		_set_angle(a)
		return
	_tilt_tween = create_tween()
	_tilt_tween.tween_method(_set_angle, _angle, a, TILT_SECONDS).set_trans(Tween.TRANS_SINE)

## Takozları verilen orana kadar indirir (1: tamamen çekilir).
func _lower_supports(ratio: float) -> void:
	for s: Control in _supports:
		var drop: float = s.size.y * ratio
		var y: float = PIVOT.y + HANG + 4.0 + drop
		if _reduce_motion() or not is_inside_tree():
			s.position.y = y
			s.modulate.a = 1.0 - ratio
		else:
			var tw: Tween = s.create_tween().set_parallel(true)
			tw.tween_property(s, "position:y", y, TILT_SECONDS)
			tw.tween_property(s, "modulate:a", 1.0 - ratio * 0.9, TILT_SECONDS)

# ================= Sayı doğrusu =================

func _setup_line(params: Dictionary) -> void:
	_min = int(params["min"])
	_max = int(params["max"])
	_tick = int(params["tick"])
	_value = int(params["value"])
	var count: int = tick_count()
	var target: int = (_value - _min) / _tick
	for i: int in count:
		if i != target and _label_visible(i, count):
			_labels[i] = true
	add_child(ClayStyle.make_panel(ClayStyle.tray_box(0.75), Rect2(LINE_LEFT - 80.0, LINE_Y - 150.0, LINE_RIGHT - LINE_LEFT + 160.0, 300.0)))
	_line = Control.new()
	_line.name = "Line"
	_line.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_line.size = BASE_SIZE
	_line.draw.connect(_draw_line)
	add_child(_line)
	_marker = Control.new()
	_marker.name = "Marker"
	_marker.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_marker.size = MARKER_SIZE
	_marker.pivot_offset = Vector2(MARKER_SIZE.x / 2.0, MARKER_SIZE.y)
	_marker.draw.connect(_draw_marker)
	add_child(_marker)
	_refresh_labels()
	if _ask == "find":
		_place_marker(target)
		var labels: Array[String] = []
		for c: Variant in params["choices"] as Array:
			_choice_values.append(int(c))
			labels.append(str(int(c)))
		_correct = _choice_values.find(_value)
		_build_choices(labels)
	else:
		_marker.visible = false
		_correct = target
		var t: Control = Widgets.make_tile(self, str(_value), TARGET_RECT, 96, ClayStyle.BUTTER)
		t.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var spacing: float = _spacing()
		for i: int in count:
			var col: Control = Control.new()
			col.name = "Tick%d" % i
			col.position = Vector2(tick_x(i) - spacing / 2.0, COLUMN_TOP)
			col.size = Vector2(spacing, COLUMN_H)
			col.gui_input.connect(_on_column_input.bind(i))
			add_child(col)
			_columns.append(col)

func tick_count() -> int:
	return (_max - _min) / _tick + 1

func _spacing() -> float:
	return (LINE_RIGHT - LINE_LEFT) / float(tick_count() - 1)

func tick_x(i: int) -> float:
	return LINE_LEFT + i * _spacing()

## Zorluk: 1 → bütün çentikler; 2 → uçlar + her 5. çentik; 3 → yalnızca uçlar.
func _label_visible(i: int, count: int) -> bool:
	if i == 0 or i == count - 1 or difficulty <= 1:
		return true
	return difficulty == 2 and i % LABEL_EVERY == 0

func _draw_line() -> void:
	var y: float = LINE_Y
	_line.draw_line(Vector2(LINE_LEFT - 40.0, y + 5.0), Vector2(LINE_RIGHT + 40.0, y + 5.0), ClayStyle.SHADOW, 16.0, true)
	_line.draw_line(Vector2(LINE_LEFT - 40.0, y), Vector2(LINE_RIGHT + 40.0, y), ClayStyle.COCOA, 14.0, true)
	for i: int in tick_count():
		var x: float = tick_x(i)
		_line.draw_line(Vector2(x, y - TICK_H / 2.0), Vector2(x, y + TICK_H / 2.0), ClayStyle.COCOA, 10.0, true)

## Etiketli çentiklerin altına sayı yazar (Andika, kalın).
func _refresh_labels() -> void:
	for k: Variant in _labels:
		var i: int = int(k)
		if _label_views.has(i):
			continue
		var l: Label = Label.new()
		l.name = "TickLabel%d" % i
		l.mouse_filter = Control.MOUSE_FILTER_IGNORE
		l.text = str(_min + i * _tick)
		l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		l.add_theme_font_size_override("font_size", LABEL_FONT)
		l.add_theme_color_override("font_color", ClayStyle.INK)
		ClayStyle.use_bold(l)
		l.size = Vector2(200, LABEL_FONT + 20.0)
		l.position = Vector2(tick_x(i) - 100.0, LINE_Y + TICK_H / 2.0 + 2.0)
		add_child(l)
		_label_views[i] = l

## İşaretçi: aşağıyı gösteren kil damla.
func _draw_marker() -> void:
	var w: float = MARKER_SIZE.x
	var c: Vector2 = Vector2(w / 2.0, w / 2.0)
	var pts: PackedVector2Array = PackedVector2Array()
	for k: int in 25:
		var a: float = PI * 0.8 + (PI * 1.4) * k / 24.0
		pts.append(c + Vector2(cos(a), sin(a)) * (w / 2.0 - 4.0))
	pts.append(Vector2(w / 2.0, MARKER_SIZE.y - 4.0))
	_marker.draw_colored_polygon(pts, MARKER_COLOR)
	_marker.draw_polyline(pts + PackedVector2Array([pts[0]]), MARKER_COLOR.darkened(0.3), 5.0, true)
	_marker.draw_circle(c, w * 0.16, ClayStyle.IVORY, true, -1.0, true)

func _place_marker(i: int) -> void:
	_marker.visible = true
	_marker.position = Vector2(tick_x(i) - MARKER_SIZE.x / 2.0, LINE_Y - TICK_H / 2.0 - MARKER_SIZE.y - 6.0)

func _on_column_input(event: InputEvent, index: int) -> void:
	if is_press(event):
		_choose(index)

# ================= Ortak seçim =================

func _build_choices(labels: Array[String], tile_size: Vector2 = CHOICE_SIZE, font: int = -1) -> void:
	var total: float = labels.size() * tile_size.x + (labels.size() - 1) * CHOICE_GAP
	var x0: float = (BASE_SIZE.x - total) / 2.0
	var y: float = CHOICE_Y - (tile_size.y - CHOICE_SIZE.y) / 2.0
	for i: int in labels.size():
		var fs: int = font if font > 0 else (CHOICE_FONT if labels[i].length() < 4 else CHOICE_FONT - 24)
		var t: Control = Widgets.make_tile(self, labels[i], Rect2(Vector2(x0 + i * (tile_size.x + CHOICE_GAP), y), tile_size), fs, ClayStyle.PEACH)
		t.name = "Choice%d" % i
		t.gui_input.connect(_on_choice_input.bind(i))
		_choice_views.append(t)

## Sözcük kartının üstüne minik terazi ikonu: ağır kefe aşağıda ve içinde ağırlık topu var
## (sözcük okunamasa da ilişki şekilden anlaşılır; renk tek başına anlam taşımaz).
func _add_relation_icon(tile: Control, relation: int) -> void:
	var label: Control = tile.get_node_or_null("Label") as Control
	if label != null:
		label.offset_top = WORD_ICON_H
	var icon: Control = Control.new()
	icon.name = "RelationIcon"
	icon.mouse_filter = Control.MOUSE_FILTER_IGNORE
	icon.position = Vector2(0, 14)
	icon.size = Vector2(tile.size.x, WORD_ICON_H)
	# 0: sağ ağır (sol daha az), 1: denge, 2: sol ağır.
	var tilt: float = [0.32, 0.0, -0.32][relation]
	icon.draw.connect(func() -> void:
		var c: Vector2 = Vector2(icon.size.x / 2.0, 22.0)
		var arm: float = 92.0
		var d: Vector2 = Vector2(arm, 0).rotated(tilt)
		icon.draw_line(c - d, c + d, ClayStyle.COCOA, 8.0, true)
		icon.draw_line(c, c + Vector2(0, 46), ClayStyle.COCOA, 8.0, true)
		icon.draw_circle(c, 9.0, ClayStyle.HONEY, true, -1.0, true)
		for k: int in 2:
			var e: Vector2 = c - d if k == 0 else c + d
			var heavy: bool = (k == 0 and relation == 2) or (k == 1 and relation == 0)
			icon.draw_arc(e + Vector2(0, 10), 26.0, 0.0, PI, 16, ClayStyle.COCOA, 6.0, true)
			if heavy or relation == 1:
				icon.draw_circle(e + Vector2(0, 18), 11.0, ClayStyle.CLAY_EDGE, true, -1.0, true))
	tile.add_child(icon)

func _on_choice_input(event: InputEvent, index: int) -> void:
	if is_press(event):
		_choose(index)

func _choose(index: int) -> void:
	var n: int = _columns.size() if _is_place() else _choice_views.size()
	if not _can_input() or index < 0 or index >= n:
		return
	if _is_place():
		_place_marker(index)
		_tap_feedback(_columns[index])
	else:
		_tap_feedback(_choice_views[index])
	if index == _correct:
		_resolve()
		_submit_answer(true)
	else:
		if _is_place():
			_sway(_marker)
		_submit_answer(false)

func _is_place() -> bool:
	return _mode == "number_line" and _ask == "place"

## Doğru cevabın görsel sonucu: terazi eğilir / dengelenir, çentik etiketi görünür.
func _resolve() -> void:
	if _mode == "scale":
		if _ask == "compare":
			_lower_supports(1.0)
			_tilt_to(_tilt_for(_sum(_left), _sum(_right)))
		else:
			_missing_tile.set("text", str(_answer))
			_missing_tile.set("clay_color", ClayStyle.MINT)
			_missing_tile.modulate.a = 1.0
			_tilt_to(0.0)
	else:
		_labels[(_value - _min) / _tick] = true
		_place_marker((_value - _min) / _tick)
		_refresh_labels()

func _sway(c: Control) -> void:
	if _reduce_motion():
		return
	var tw: Tween = c.create_tween()
	for deg: float in [8.0, -8.0, 4.0, 0.0]:
		tw.tween_property(c, "rotation_degrees", deg, 0.1)

func show_hint(level: int) -> void:
	if _done or _busy:
		return
	if level == 1:
		_hint_one()
	elif level >= 2:
		_solve()

func _hint_one() -> void:
	if _mode == "scale" and _ask == "compare" and _item != "":
		_show_pairs()
	elif _mode == "scale" and _ask == "compare":
		# Takozlar yarıya iner, terazi son açısının yarısı kadar eğilir.
		_lower_supports(0.5)
		_tilt_to(_tilt_for(_sum(_left), _sum(_right)) * 0.5)
	elif _mode == "scale":
		if _hint_total >= 0:
			return
		var full_side: int = 1 - _missing_side
		_hint_total = _sum(_left if full_side == 0 else _right)
		var pan: Control = _pans[full_side]
		var t: Control = Widgets.make_tile(pan, str(_hint_total), Rect2(Vector2((PAN_SIZE.x - 170.0) / 2.0 + (-110.0 if full_side == 0 else 110.0), -150.0), Vector2(170, 130)), 72, ClayStyle.BUTTER)
		t.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_glow(t)
	else:
		var target: int = (_value - _min) / _tick
		for i: int in [target - 1, target + 1]:
			if i >= 0 and i < tick_count():
				_labels[i] = true
		_refresh_labels()
		for i: int in [target - 1, target + 1]:
			if _label_views.has(i):
				_glow(_label_views[i])

## Nesne gruplarında ipucu 1: iki kefedeki nesneler bire bir çizgiyle eşlenir, eşi olmayanlar
## parlar (hangi grubun daha çok olduğu sayı bilmeden görülür).
func _show_pairs() -> void:
	if _pairs_view != null:
		return
	_pairs_view = Control.new()
	_pairs_view.name = "Pairs"
	_pairs_view.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_pairs_view.size = BASE_SIZE
	_pairs_view.draw.connect(_draw_pairs)
	add_child(_pairs_view)
	var left: Array = _item_views[0]
	var right: Array = _item_views[1]
	var n: int = mini(left.size(), right.size())
	for side: Array in [left, right]:
		for k: int in range(n, side.size()):
			_glow(side[k] as Control)

func _draw_pairs() -> void:
	var left: Array = _item_views[0]
	var right: Array = _item_views[1]
	for k: int in pair_count():
		var a: Control = left[k] as Control
		var b: Control = right[k] as Control
		var pa: Vector2 = a.global_position - global_position + a.size / 2.0
		var pb: Vector2 = b.global_position - global_position + b.size / 2.0
		_pairs_view.draw_line(pa, pb, Color(PAIR_LINE_COLOR, 0.7), 6.0, true)
		_pairs_view.draw_circle(pa, 9.0, PAIR_LINE_COLOR, true, -1.0, true)
		_pairs_view.draw_circle(pb, 9.0, PAIR_LINE_COLOR, true, -1.0, true)

## Bire bir eşleme ipucunda çizilen çizgi sayısı (ipucu yoksa 0).
func pair_count() -> int:
	if _pairs_view == null:
		return 0
	return mini((_item_views[0] as Array).size(), (_item_views[1] as Array).size())

func choice_labels() -> Array[String]:
	var res: Array[String] = []
	for v: Control in _choice_views:
		res.append(str(v.get("text")))
	return res

func has_relation_icons() -> bool:
	return not _choice_views.is_empty() and _choice_views[0].get_node_or_null("RelationIcon") != null

## İpucu 2: doğru seçenek / çentik parlar ve seçilir.
func _solve() -> void:
	_busy = true
	helped = true
	var view: Control = _columns[_correct] if _is_place() else _choice_views[_correct]
	_glow(view)
	await _wait(0.6)
	_busy = false
	if _done:
		return
	_resolve()
	_submit_answer(true)

# --- Test kancaları ---

func _debug_choose(index: int) -> void:
	_choose(index)

func _debug_correct_index() -> int:
	return _correct

func _debug_answer(correct: bool) -> void:
	_choose(_correct if correct else (0 if _correct != 0 else 1))

func beam_angle() -> float:
	return _angle

func choice_values() -> Array[int]:
	return _choice_values.duplicate()

func item_count() -> int:
	return _item_count

func hint_total() -> int:
	return _hint_total

func labeled_ticks() -> Array[int]:
	var res: Array[int] = []
	for k: Variant in _labels:
		res.append(_min + int(k) * _tick)
	res.sort()
	return res

func touch_targets() -> Array[Control]:
	return _columns.duplicate() if _is_place() else _choice_views.duplicate()

# ================= Doğrulama =================

static func validate_params(p: Dictionary) -> Array[String]:
	var errs: Array[String] = []
	var mode: Variant = p.get("mode")
	if not (mode is String) or not MODES.has(mode as String):
		errs.append(ContentValidator.msg("err.params.bal_mode"))
		return errs
	var ask: Variant = p.get("ask")
	var asks: PackedStringArray = SCALE_ASKS if mode == "scale" else LINE_ASKS
	if not (ask is String) or not asks.has(ask as String):
		errs.append(ContentValidator.msg("err.params.bal_ask"))
		return errs
	if mode == "scale":
		return _validate_scale(p, ask as String)
	return _validate_line(p, ask as String)

static func _in_range(v: Variant) -> bool:
	return ContentValidator.is_int_like(v) and int(v) >= 0 and int(v) <= MAX_VALUE

static func _validate_scale(p: Dictionary, ask: String) -> Array[String]:
	var errs: Array[String] = []
	var nulls: int = 0
	for key: String in ["left", "right"]:
		var side: Variant = p.get(key)
		if not (side is Array) or (side as Array).is_empty() or (side as Array).size() > MAX_SIDE:
			errs.append(ContentValidator.msg("err.params.bal_sides"))
			return errs
		for v: Variant in side as Array:
			if v == null and ask == "missing":
				nulls += 1
			elif not _in_range(v):
				errs.append(ContentValidator.msg("err.params.bal_sides"))
				return errs
	var left: Array = p["left"] as Array
	var right: Array = p["right"] as Array
	if ask == "compare":
		if p.has("item"):
			var item: Variant = p["item"]
			var ok: bool = item is String and not (item as String).is_empty() and left.size() == 1 and right.size() == 1
			if ok:
				for v: Variant in [left[0], right[0]]:
					ok = ok and int(v) >= 1 and int(v) <= MAX_ITEM_COUNT
			if not ok:
				errs.append(ContentValidator.msg("err.params.bal_item"))
		return errs
	if nulls != 1:
		errs.append(ContentValidator.msg("err.params.bal_missing_one"))
		return errs
	var on_left: bool = left.has(null)
	var answer: int = _sum(right if on_left else left) - _sum(left if on_left else right)
	var answer_ok: bool = answer >= 0 and answer <= MAX_VALUE
	if not answer_ok:
		errs.append(ContentValidator.msg("err.params.bal_missing_range"))
	errs.append_array(_validate_choices(p.get("choices"), answer if answer_ok else -1))
	return errs

static func _validate_line(p: Dictionary, ask: String) -> Array[String]:
	var errs: Array[String] = []
	var mn: Variant = p.get("min")
	var mx: Variant = p.get("max")
	var tk: Variant = p.get("tick")
	var ok: bool = _in_range(mn) and _in_range(mx) and ContentValidator.is_int_like(tk) and int(tk) >= 1
	if ok:
		var span: int = int(mx) - int(mn)
		ok = span > 0 and span % int(tk) == 0 and span / int(tk) >= MIN_INTERVALS and span / int(tk) <= MAX_INTERVALS
	if not ok:
		errs.append(ContentValidator.msg("err.params.nl_range"))
		return errs
	var v: Variant = p.get("value")
	var value_ok: bool = ContentValidator.is_int_like(v) and int(v) > int(mn) and int(v) < int(mx) and (int(v) - int(mn)) % int(tk) == 0
	if not value_ok:
		errs.append(ContentValidator.msg("err.params.nl_value"))
	if ask == "find":
		errs.append_array(_validate_choices(p.get("choices"), int(v) if value_ok else -1))
	return errs

## Seçenekler: 2–4 tekrarsız tam sayı (0–1000); answer ≥ 0 ise onu içermeli.
static func _validate_choices(choices: Variant, answer: int) -> Array[String]:
	var errs: Array[String] = []
	var ok: bool = choices is Array and (choices as Array).size() >= MIN_CHOICES and (choices as Array).size() <= MAX_CHOICES
	var seen: Dictionary = {}
	if ok:
		for c: Variant in choices as Array:
			if not _in_range(c) or seen.has(int(c)):
				ok = false
				break
			seen[int(c)] = true
	if not ok:
		errs.append(ContentValidator.msg("err.params.bal_choices"))
	elif answer >= 0 and not seen.has(answer):
		errs.append(ContentValidator.msg("err.params.bal_choices_missing"))
	return errs
