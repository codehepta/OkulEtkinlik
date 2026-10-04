extends MiniGame
## Örüntüyü tamamla: üstte bir sıra hücre, sondaki boş hücreler ("?") soldan sağa doldurulur.
## repeat: şekil (şekil + renk) ya da görsel hücrelerden yinelenen birim.
## number: sabit adımla artan / azalan sayılar.

const Widgets: GDScript = preload("res://scenes/games/game_widgets.gd")
const TOKEN_VIEW: PackedScene = preload("res://scenes/games/token_view.tscn")
const KINDS: PackedStringArray = ["repeat", "number"]
const MIN_UNIT: int = 2
const MAX_UNIT: int = 4
const MAX_REPEAT_LENGTH: int = 12
const MIN_NUMBER_LENGTH: int = 4
const MAX_NUMBER_LENGTH: int = 10
const MAX_VALUE: int = 1000
const MAX_STEP: int = 100
## number türünde görünür kalacak en az terim.
const MIN_VISIBLE_NUMBERS: int = 3
const NUMBER_CHOICES: int = 3

const ROW_Y: float = 190.0
const ROW_WIDTH: float = 1760.0
const CELL_MAX: float = 170.0
const CELL_GAP: float = 14.0
const CHOICE_SIZE: Vector2 = Vector2(210, 210)
const CHOICE_GAP: float = 56.0
const CHOICE_Y: float = 640.0
const CELL_COLOR: Color = ClayStyle.IVORY
const CHOICE_COLOR: Color = ClayStyle.PEACH
const STEP_TILE: Vector2 = Vector2(128, 128)
const AUTO_STEP_SECONDS: float = 0.45

var _kind: String = "repeat"
## Bütün dizinin hücreleri (repeat: hücre sözlüğü; number: {"n": değer}).
var _seq: Array[Dictionary] = []
var _unit_size: int = 0
var _first_blank: int = 0
var _cur: int = 0
var _cell_size: float = 150.0
var _cell_views: Array[Control] = []
var _choices: Array[Dictionary] = []
var _choice_views: Array[Control] = []
var _unit_mark: Control = null
var _step_labels: Array[String] = []

func setup(params: Dictionary, difficulty_value: int, context: RoundContext) -> void:
	_init_round(difficulty_value, context)
	_kind = str(params["kind"])
	var length: int = int(params["length"])
	if _kind == "repeat":
		var unit: Array = params["unit"] as Array
		_unit_size = unit.size()
		for i: int in length:
			_seq.append((unit[i % _unit_size] as Dictionary).duplicate())
	else:
		var start: int = int(params["start"])
		var step: int = int(params["step"])
		for i: int in length:
			_seq.append({"n": start + i * step})
	var blanks: int = blanks_for(_kind, length, _unit_size, difficulty)
	_first_blank = length - blanks
	_cur = _first_blank
	_build_row()
	_build_choices()

## Boş hücre sayısı: zorluk kadar; repeat'te iki tam birim, number'da 3 terim görünür kalır.
static func blanks_for(kind: String, length: int, unit_size: int, difficulty_value: int) -> int:
	var visible_min: int = unit_size * 2 if kind == "repeat" else MIN_VISIBLE_NUMBERS
	return clampi(difficulty_value, 1, maxi(1, length - visible_min))

func _build_row() -> void:
	var n: int = _seq.size()
	_cell_size = minf(CELL_MAX, (ROW_WIDTH - (n - 1) * CELL_GAP) / n)
	var total: float = n * _cell_size + (n - 1) * CELL_GAP
	var x0: float = (BASE_SIZE.x - total) / 2.0
	add_child(ClayStyle.make_panel(ClayStyle.tray_box(0.75), Rect2(x0 - 30.0, ROW_Y - 30.0, total + 60.0, _cell_size + 60.0)))
	for i: int in n:
		var rect: Rect2 = Rect2(x0 + i * (_cell_size + CELL_GAP), ROW_Y, _cell_size, _cell_size)
		var holder: Control = Control.new()
		holder.mouse_filter = Control.MOUSE_FILTER_IGNORE
		holder.position = rect.position
		holder.size = rect.size
		holder.pivot_offset = rect.size / 2.0
		add_child(holder)
		if i >= _first_blank:
			holder.draw.connect(func() -> void: Widgets.draw_well(holder, Rect2(Vector2(4, 4), holder.size - Vector2(8, 8))))
		else:
			_fill_view(holder, _seq[i], CELL_COLOR)
		_cell_views.append(holder)

## Hücre içeriğini (şekil, görsel ya da sayı) verilen kutuya çizer.
func _fill_view(holder: Control, cell: Dictionary, color: Color) -> void:
	for c: Node in holder.get_children():
		c.queue_free()
	var side: Vector2 = holder.size
	if cell.has("n"):
		var t: Control = Widgets.make_tile(holder, str(int(cell["n"])), Rect2(Vector2.ZERO, side), int(side.y * (0.42 if int(cell["n"]) >= 100 else 0.5)), color)
		t.mouse_filter = Control.MOUSE_FILTER_IGNORE
	elif cell.has("shape"):
		var t2: Control = Widgets.make_tile(holder, "", Rect2(Vector2.ZERO, side), 40, color)
		t2.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var art: Control = Control.new()
		art.mouse_filter = Control.MOUSE_FILTER_IGNORE
		art.size = side
		var shape: String = str(cell["shape"])
		var fill: Color = Widgets.COLORS.get(str(cell["color"]), ClayStyle.TEAL)
		art.draw.connect(func() -> void: Widgets.draw_shape(art, shape, Rect2(side * 0.1, side * 0.75), fill))
		holder.add_child(art)
	else:
		var v: Control = TOKEN_VIEW.instantiate() as Control
		v.set("framed", true)
		v.set("card_color", color)
		v.mouse_filter = Control.MOUSE_FILTER_IGNORE
		holder.add_child(v)
		v.call("set_token", cell)
		v.custom_minimum_size = side
		v.size = side

static func cell_key(cell: Dictionary) -> String:
	if cell.has("n"):
		return "n:%d" % int(cell["n"])
	if cell.has("shape"):
		return "s:%s:%s" % [cell["shape"], cell["color"]]
	return "i:%s" % str(cell.get("value", ""))

func _build_choices() -> void:
	for v: Control in _choice_views:
		v.queue_free()
	_choice_views.clear()
	_choices.clear()
	if _cur >= _seq.size():
		return
	if _kind == "repeat":
		var seen: Dictionary = {}
		for i: int in _unit_size:
			var key: String = cell_key(_seq[i])
			if not seen.has(key):
				seen[key] = true
				_choices.append(_seq[i])
	else:
		for n: int in number_choices(int(_seq[_cur]["n"]), int(_seq[1]["n"]) - int(_seq[0]["n"])):
			_choices.append({"n": n})
	var shuffled: Array = _choices.duplicate()
	Widgets.shuffle(shuffled, ctx.rng)
	_choices.assign(shuffled)
	var total: float = _choices.size() * CHOICE_SIZE.x + (_choices.size() - 1) * CHOICE_GAP
	var x0: float = (BASE_SIZE.x - total) / 2.0
	for i: int in _choices.size():
		var holder: Control = Control.new()
		holder.name = "Choice%d" % i
		holder.position = Vector2(x0 + i * (CHOICE_SIZE.x + CHOICE_GAP), CHOICE_Y)
		holder.size = CHOICE_SIZE
		holder.pivot_offset = CHOICE_SIZE / 2.0
		add_child(holder)
		_fill_view(holder, _choices[i], CHOICE_COLOR)
		holder.gui_input.connect(_on_choice_input.bind(i))
		_choice_views.append(holder)

## number seçenekleri: doğru terim + sonraki terim + bir fazlası / eksiği (0–1000, tekrarsız).
static func number_choices(v: int, step: int) -> Array[int]:
	var res: Array[int] = []
	for c: int in [v, v + step, v + 1, v - 1, v + 2, v - 2]:
		if c >= 0 and c <= MAX_VALUE and not res.has(c):
			res.append(c)
		if res.size() == NUMBER_CHOICES:
			break
	return res

func _on_choice_input(event: InputEvent, index: int) -> void:
	if is_press(event):
		_choose(index)

func _choose(index: int) -> void:
	if not _can_input() or index < 0 or index >= _choices.size() or _cur >= _seq.size():
		return
	_tap_feedback(_choice_views[index])
	if cell_key(_choices[index]) == cell_key(_seq[_cur]):
		_fill_current()
	else:
		_submit_answer(false, false)

## Sıradaki boşluğu doldurur; son boşluksa tur biter, değilse yeni seçenekler kurulur.
func _fill_current() -> void:
	_fill_view(_cell_views[_cur], _seq[_cur], CELL_COLOR)
	_cell_views[_cur].queue_redraw()
	_cur += 1
	var last: bool = _cur >= _seq.size()
	if not last and _kind == "number":
		_build_choices()
	_submit_answer(true, last)

func _correct_index() -> int:
	if _cur >= _seq.size():
		return -1
	for i: int in _choices.size():
		if cell_key(_choices[i]) == cell_key(_seq[_cur]):
			return i
	return -1

func _is_multi_step() -> bool:
	return true

func show_hint(level: int) -> void:
	if _done or _busy:
		return
	if level == 1:
		if _kind == "repeat":
			_mark_unit()
		else:
			_show_steps()
	elif level >= 2:
		_auto_fill()

## İpucu 1 (repeat): ilk birim parlar ve altına birim çerçevesi çizilir.
func _mark_unit() -> void:
	for i: int in _unit_size:
		_glow(_cell_views[i])
	if _unit_mark != null:
		return
	var first: Control = _cell_views[0]
	var last: Control = _cell_views[_unit_size - 1]
	_unit_mark = Control.new()
	_unit_mark.name = "UnitMark"
	_unit_mark.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_unit_mark.position = first.position - Vector2(10, 10)
	_unit_mark.size = Vector2(last.position.x + last.size.x - first.position.x + 20.0, first.size.y + 20.0)
	_unit_mark.draw.connect(func() -> void:
		var r: Rect2 = Rect2(Vector2(3, 3), _unit_mark.size - Vector2(6, 6))
		var box: StyleBoxFlat = ClayStyle.soft_box(Color(0, 0, 0, 0), 30)
		box.draw_center = false
		box.border_color = ClayStyle.EMBER
		box.set_border_width_all(8)
		_unit_mark.draw_style_box(box, r))
	add_child(_unit_mark)

## İpucu 1 (number): görünen terimler arasına adım karoları ("+5", "−10").
func _show_steps() -> void:
	if not _step_labels.is_empty():
		return
	var step: int = int(_seq[1]["n"]) - int(_seq[0]["n"])
	var label: String = ("+%d" % step) if step > 0 else ("−%d" % absi(step))
	for i: int in range(1, _first_blank):
		var a: Control = _cell_views[i - 1]
		var b: Control = _cell_views[i]
		var cx: float = (a.position.x + a.size.x + b.position.x) / 2.0
		var rect: Rect2 = Rect2(Vector2(cx - STEP_TILE.x / 2.0, ROW_Y + _cell_size + 40.0), STEP_TILE)
		var t: Control = Widgets.make_tile(self, label, rect, 48, ClayStyle.BUTTER)
		t.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_step_labels.append(label)

## İpucu 2: kalan boşluklar sırayla dolar.
func _auto_fill() -> void:
	_busy = true
	helped = true
	while not _done and _cur < _seq.size():
		var idx: int = _correct_index()
		if idx >= 0:
			_glow(_choice_views[idx])
		await _wait(AUTO_STEP_SECONDS)
		if _done:
			return
		_fill_current()
		await _wait(AUTO_STEP_SECONDS)
	_busy = false

# --- Test kancaları ---

func _debug_choose(index: int) -> void:
	_choose(index)

func _debug_correct_index() -> int:
	return _correct_index()

func _debug_answer(correct: bool) -> void:
	var idx: int = _correct_index()
	_choose(idx if correct else (0 if idx != 0 else 1))

func blank_count() -> int:
	return _seq.size() - _cur

func choice_count() -> int:
	return _choices.size()

func choice_values() -> Array[int]:
	var res: Array[int] = []
	for c: Dictionary in _choices:
		res.append(int(c.get("n", -1)))
	return res

func is_unit_marked() -> bool:
	return _unit_mark != null

func step_labels() -> Array[String]:
	return _step_labels.duplicate()

func touch_targets() -> Array[Control]:
	return _choice_views.duplicate()

static func validate_params(p: Dictionary) -> Array[String]:
	var errs: Array[String] = []
	var kind: Variant = p.get("kind")
	if not (kind is String) or not KINDS.has(kind as String):
		errs.append(ContentValidator.msg("err.params.pat_kind"))
		return errs
	if kind == "number":
		return _validate_number(p)
	var unit: Variant = p.get("unit")
	if not (unit is Array) or (unit as Array).size() < MIN_UNIT or (unit as Array).size() > MAX_UNIT:
		errs.append(ContentValidator.msg("err.params.pat_unit"))
		return errs
	var cells: Array = unit as Array
	for c: Variant in cells:
		if not _is_cell(c):
			errs.append(ContentValidator.msg("err.params.pat_unit"))
			return errs
	var distinct: Dictionary = {}
	for c: Variant in cells:
		distinct[cell_key(c as Dictionary)] = c
	if distinct.size() < 2:
		errs.append(ContentValidator.msg("err.params.pat_unit_same"))
	var keys: Array = distinct.keys()
	var color_only: bool = false
	for i: int in keys.size():
		for j: int in range(i + 1, keys.size()):
			var a: Dictionary = distinct[keys[i]]
			var b: Dictionary = distinct[keys[j]]
			if a.has("shape") and b.has("shape") and a["shape"] == b["shape"]:
				color_only = true
	if color_only:
		errs.append(ContentValidator.msg("err.params.pat_color_only"))
	var length: Variant = p.get("length")
	if not ContentValidator.is_int_like(length) or int(length) < cells.size() * 2 + 1 or int(length) > MAX_REPEAT_LENGTH:
		errs.append(ContentValidator.msg("err.params.pat_length"))
	return errs

static func _is_cell(c: Variant) -> bool:
	if not (c is Dictionary):
		return false
	var d: Dictionary = c as Dictionary
	if d.has("shape"):
		return d.size() == 2 and d["shape"] is String and Widgets.SHAPES.has(d["shape"] as String) \
			and d.get("color") is String and Widgets.COLORS.has(d["color"] as String)
	return Token.is_valid(d) and d.get("type") == "item"

static func _validate_number(p: Dictionary) -> Array[String]:
	var errs: Array[String] = []
	var start: Variant = p.get("start")
	var step: Variant = p.get("step")
	var length: Variant = p.get("length")
	var ok: bool = ContentValidator.is_int_like(start) and int(start) >= 0 and int(start) <= MAX_VALUE \
		and ContentValidator.is_int_like(step) and int(step) != 0 and absi(int(step)) <= MAX_STEP \
		and ContentValidator.is_int_like(length) and int(length) >= MIN_NUMBER_LENGTH and int(length) <= MAX_NUMBER_LENGTH
	if not ok:
		errs.append(ContentValidator.msg("err.params.pat_number"))
		return errs
	var last: int = int(start) + (int(length) - 1) * int(step)
	if last < 0 or last > MAX_VALUE:
		errs.append(ContentValidator.msg("err.params.pat_number_range"))
	return errs
