extends MiniGame
## Balon patlat: üst plakette işlem (a + b = ?), altta cevap taşıyan kil balonlar.
## İşlemler: + ve − (Faz 3a), × ve ÷ (Faz 3e, MAT.3.2.3–3.2.6; ÷ yalnızca kalansız bölme).
## Balonlar yerinde hafifçe salınır; kaçmaz, kaybolmaz, zamanlayıcı yoktur (spec §3.5).
## Doğru balon yumuşakça patlar; yanlış balon hafifçe sallanır ve yerinde kalır.

const Widgets: GDScript = preload("res://scenes/games/game_widgets.gd")
const MAX_VALUE: int = 1000
const MIN_CHOICES: int = 2
const MAX_CHOICES: int = 6
## Zorluğa göre görünen en çok balon.
const VISIBLE_BY_DIFFICULTY: Dictionary = {1: 3, 2: 4, 3: 6}
const OPS: PackedStringArray = ["+", "-", "×", "÷"]
## Ekranda gösterilen işlem işaretleri (matematik sembolü; metin değil).
const OP_GLYPH: Dictionary = {"+": "+", "-": "−", "×": "×", "÷": "÷"}
## Somut model ipucu olan işlemler (toplama ve çıkarma).
const MODEL_OPS: PackedStringArray = ["+", "-"]
## Somut model yalnızca küçük sayılarda (spec §2 somuttan soyuta).
const MODEL_MAX: int = 20

const PLAQUE_Y: float = 180.0
const PLAQUE_H: float = 160.0
const PLAQUE_FONT: int = 96
const PLAQUE_GAP: float = 22.0
const MODEL_RECT: Rect2 = Rect2(160, 372, 1600, 110)
const BALLOON_SIZE: Vector2 = Vector2(200, 330)
const BODY_H: float = 240.0
const BALLOON_GAP: float = 56.0
const BALLOON_Y: float = 520.0
const STAGGER: float = 36.0
const BOB_AMPLITUDE: float = 10.0
const NUMBER_FONT: int = 76
const BALLOON_COLORS: Array[Color] = [
	Color(0.95, 0.45, 0.42), Color(0.42, 0.66, 0.93), Color(1.0, 0.8, 0.32),
	Color(0.5, 0.8, 0.5), Color(0.75, 0.55, 0.9), Color(0.98, 0.62, 0.3),
]

var _answer: int = 0
var _a: int = 0
var _b: int = 0
var _op: String = "+"
var _values: Array[int] = []
var _balloons: Array[Control] = []
var _base_y: Array[float] = []
var _phase: Array[float] = []
var _popped: Array[bool] = []
var _faded: Dictionary = {}
var _model: Control = null
var _time: float = 0.0

func setup(params: Dictionary, difficulty_value: int, context: RoundContext) -> void:
	_init_round(difficulty_value, context)
	_a = int(params["a"])
	_b = int(params["b"])
	_op = str(params["op"])
	_answer = result_of(_a, _op, _b)
	var others: Array[int] = []
	for c: Variant in params["choices"] as Array:
		if int(c) != _answer:
			others.append(int(c))
	var k: int = int(VISIBLE_BY_DIFFICULTY.get(clampi(difficulty, 1, 3), MAX_CHOICES))
	var vals: Array = [_answer]
	for i: int in mini(k - 1, others.size()):
		vals.append(others[i])
	Widgets.shuffle(vals, ctx.rng)
	for v: Variant in vals:
		_values.append(int(v))
	_build_plaque()
	_build_balloons()

## ÷ için b 0 ya da kalan varsa -1 döner (geçersiz işlem).
static func result_of(a: int, op: String, b: int) -> int:
	match op:
		"+":
			return a + b
		"×":
			return a * b
		"÷":
			return a / b if b >= 1 and a % b == 0 else -1
	return a - b

func _build_plaque() -> void:
	var parts: Array[String] = [str(_a), str(OP_GLYPH.get(_op, _op)), str(_b), "=", "?"]
	var widths: Array[float] = []
	var total: float = 0.0
	for s: String in parts:
		var w: float = maxf(150.0, s.length() * 58.0 + 70.0) if s.length() > 1 else 150.0
		widths.append(w)
		total += w
	total += PLAQUE_GAP * (parts.size() - 1)
	var x: float = (BASE_SIZE.x - total) / 2.0
	add_child(ClayStyle.make_panel(ClayStyle.tray_box(0.8), Rect2(x - 34.0, PLAQUE_Y - 26.0, total + 68.0, PLAQUE_H + 52.0)))
	for i: int in parts.size():
		var rect: Rect2 = Rect2(x, PLAQUE_Y, widths[i], PLAQUE_H)
		if i == parts.size() - 1:
			var well: Control = Control.new()
			well.mouse_filter = Control.MOUSE_FILTER_IGNORE
			well.position = rect.position
			well.size = rect.size
			well.draw.connect(func() -> void: Widgets.draw_well(well, Rect2(Vector2(4, 4), well.size - Vector2(8, 8))))
			add_child(well)
			var q: Control = Widgets.make_tile(self, "?", rect, PLAQUE_FONT, ClayStyle.IVORY)
			q.mouse_filter = Control.MOUSE_FILTER_IGNORE
			q.modulate.a = 0.55
		else:
			var color: Color = ClayStyle.CREAM if i % 2 == 1 else ClayStyle.APRICOT
			var t: Control = Widgets.make_tile(self, parts[i], rect, PLAQUE_FONT, color)
			t.mouse_filter = Control.MOUSE_FILTER_IGNORE
		x += widths[i] + PLAQUE_GAP

func _build_balloons() -> void:
	var n: int = _values.size()
	var total: float = n * BALLOON_SIZE.x + (n - 1) * BALLOON_GAP
	var x0: float = (BASE_SIZE.x - total) / 2.0
	for i: int in n:
		var b: Control = Control.new()
		b.name = "Balloon%d" % i
		b.size = BALLOON_SIZE
		var y: float = BALLOON_Y + (STAGGER if i % 2 == 1 else 0.0)
		b.position = Vector2(x0 + i * (BALLOON_SIZE.x + BALLOON_GAP), y)
		b.pivot_offset = Vector2(BALLOON_SIZE.x / 2.0, BODY_H)
		var color: Color = BALLOON_COLORS[i % BALLOON_COLORS.size()]
		b.draw.connect(_draw_balloon.bind(b, color))
		add_child(b)
		var disc: Control = Widgets.make_tile(b, str(_values[i]), Rect2(Vector2(BALLOON_SIZE.x / 2.0 - 75.0, BODY_H / 2.0 - 78.0), Vector2(150, 140)),
			NUMBER_FONT if _values[i] < 1000 else NUMBER_FONT - 16, ClayStyle.IVORY)
		disc.mouse_filter = Control.MOUSE_FILTER_IGNORE
		b.gui_input.connect(_on_balloon_input.bind(i))
		_balloons.append(b)
		_base_y.append(y)
		_phase.append(ctx.rng.randf_range(0.0, TAU))
		_popped.append(false)

## Kil balon: gövde (elips), parlak leke, düğüm ve kıvrımlı ip.
func _draw_balloon(b: Control, color: Color) -> void:
	var c: Vector2 = Vector2(BALLOON_SIZE.x / 2.0, BODY_H / 2.0)
	var rx: float = BALLOON_SIZE.x / 2.0 - 6.0
	var ry: float = BODY_H / 2.0 - 4.0
	var body: PackedVector2Array = PackedVector2Array()
	var shadow: PackedVector2Array = PackedVector2Array()
	for k: int in 48:
		var a: float = TAU * k / 48.0
		var p: Vector2 = c + Vector2(cos(a) * rx, sin(a) * ry * (1.0 + 0.08 * sin(a)))
		body.append(p)
		shadow.append(p + Vector2(0, 7))
	b.draw_colored_polygon(shadow, ClayStyle.SHADOW)
	b.draw_colored_polygon(body, color)
	b.draw_polyline(body + PackedVector2Array([body[0]]), color.darkened(0.28), 5.0, true)
	b.draw_circle(c + Vector2(-rx * 0.45, -ry * 0.5), rx * 0.16, Color(1, 1, 1, 0.4), true, -1.0, true)
	var knot_top: Vector2 = Vector2(c.x, BODY_H - 2.0)
	var knot: PackedVector2Array = PackedVector2Array([knot_top + Vector2(-12, 14), knot_top + Vector2(12, 14), knot_top + Vector2(0, -2)])
	b.draw_colored_polygon(knot, color.darkened(0.2))
	var string: PackedVector2Array = PackedVector2Array()
	for k: int in 12:
		var t: float = k / 11.0
		string.append(Vector2(c.x + sin(t * PI * 2.0) * 10.0, BODY_H + 14.0 + t * (BALLOON_SIZE.y - BODY_H - 18.0)))
	b.draw_polyline(string, ClayStyle.CLAY_EDGE, 4.0, true)

func _process(delta: float) -> void:
	if _reduce_motion():
		return
	_time += delta
	for i: int in _balloons.size():
		if not _popped[i]:
			_balloons[i].position.y = _base_y[i] + sin(_time * 1.6 + _phase[i]) * BOB_AMPLITUDE

func _on_balloon_input(event: InputEvent, index: int) -> void:
	if is_press(event):
		_choose(index)

func _choose(index: int) -> void:
	if not _can_input() or index < 0 or index >= _values.size() or _popped[index]:
		return
	if _values[index] == _answer:
		_pop(index)
		_submit_answer(true)
	else:
		_sway(_balloons[index])
		audio.play_sfx("sfx.tap")
		_submit_answer(false)

## Yumuşak patlama: hafif büyüme + saydamlaşma (yanıp sönme yok).
func _pop(index: int) -> void:
	_popped[index] = true
	audio.play_sfx("sfx.balloon_pop")
	var b: Control = _balloons[index]
	b.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if _reduce_motion() or not is_inside_tree():
		b.modulate.a = 0.0
		return
	var tw: Tween = b.create_tween().set_parallel(true)
	tw.tween_property(b, "scale", Vector2(1.2, 1.2), 0.25)
	tw.tween_property(b, "modulate:a", 0.0, 0.25)

func _sway(c: Control) -> void:
	if _reduce_motion():
		return
	var tw: Tween = c.create_tween()
	for deg: float in [6.0, -6.0, 3.0, 0.0]:
		tw.tween_property(c, "rotation_degrees", deg, 0.1)

func _correct_index() -> int:
	return _values.find(_answer)

func show_hint(level: int) -> void:
	if _done or _busy:
		return
	if level == 1:
		if MODEL_OPS.has(_op) and _a <= MODEL_MAX and _b <= MODEL_MAX:
			_show_model()
		else:
			_fade_half_wrong()
	elif level >= 2:
		_solve()

## İpucu 1 (küçük sayılar): toplama → a daire + b kare; çıkarma → a daire, son b tanesi çizili.
func _show_model() -> void:
	if _model != null:
		return
	_model = Control.new()
	_model.name = "Model"
	_model.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_model.position = MODEL_RECT.position
	_model.size = MODEL_RECT.size
	_model.draw.connect(_draw_model)
	add_child(_model)
	_model.modulate.a = 0.0
	_model.create_tween().tween_property(_model, "modulate:a", 1.0, 0.4)

func _draw_model() -> void:
	var count: int = _a + (_b if _op == "+" else 0)
	var gap_extra: float = 40.0 if _op == "+" else 0.0
	var cell: float = minf(64.0, (MODEL_RECT.size.x - gap_extra) / float(maxi(count, 1)))
	var total: float = cell * count + gap_extra
	var x: float = (MODEL_RECT.size.x - total) / 2.0
	var y: float = MODEL_RECT.size.y / 2.0
	_model.draw_style_box(ClayStyle.tray_box(0.6, 40), Rect2(Vector2(x - 20.0, 0), Vector2(total + 40.0, MODEL_RECT.size.y)))
	for i: int in count:
		var second: bool = _op == "+" and i >= _a
		var cx: float = x + cell * (i + 0.5) + (gap_extra if second else 0.0)
		var r: Rect2 = Rect2(Vector2(cx - cell * 0.45, y - cell * 0.45), Vector2(cell * 0.9, cell * 0.9))
		Widgets.draw_shape(_model, "square" if second else "circle", r, ClayStyle.TANGERINE if not second else ClayStyle.TEAL)
		if _op == "-" and i >= _a - _b:
			var d: float = cell * 0.4
			_model.draw_line(Vector2(cx - d, y - d), Vector2(cx + d, y + d), ClayStyle.INK, 6.0, true)
			_model.draw_line(Vector2(cx - d, y + d), Vector2(cx + d, y - d), ClayStyle.INK, 6.0, true)

## İpucu 1 (büyük sayılar): yanlış balonların yarısı (yukarı yuvarlanır) soluklaşır.
func _fade_half_wrong() -> void:
	var wrong: Array[int] = []
	for i: int in _values.size():
		if _values[i] != _answer and not _faded.has(i) and not _popped[i]:
			wrong.append(i)
	for k: int in ceili(wrong.size() / 2.0):
		var i: int = wrong[k]
		_faded[i] = true
		_balloons[i].create_tween().tween_property(_balloons[i], "modulate:a", 0.35, 0.4)

## İpucu 2: doğru balon parlar ve patlar.
func _solve() -> void:
	_busy = true
	helped = true
	var idx: int = _correct_index()
	_glow(_balloons[idx])
	await _wait(0.6)
	_busy = false
	if _done:
		return
	_pop(idx)
	_submit_answer(true)

# --- Test kancaları ---

func _debug_choose(index: int) -> void:
	_choose(index)

func _debug_correct_index() -> int:
	return _correct_index()

func _debug_answer(correct: bool) -> void:
	var idx: int = _correct_index()
	_choose(idx if correct else (0 if idx != 0 else 1))

func balloon_values() -> Array[int]:
	return _values.duplicate()

func balloon_rects() -> Array[Rect2]:
	var res: Array[Rect2] = []
	for b: Control in _balloons:
		res.append(Rect2(b.position, b.size))
	return res

func is_balloon_visible(index: int) -> bool:
	return not _popped[index] and _balloons[index].visible and _balloons[index].modulate.a > 0.0

func is_model_shown() -> bool:
	return _model != null

func faded_count() -> int:
	return _faded.size()

func touch_targets() -> Array[Control]:
	var res: Array[Control] = []
	for i: int in _balloons.size():
		if not _popped[i]:
			res.append(_balloons[i])
	return res

static func validate_params(p: Dictionary) -> Array[String]:
	var errs: Array[String] = []
	var a_ok: bool = _in_range(p.get("a"))
	var b_ok: bool = _in_range(p.get("b"))
	if not (a_ok and b_ok):
		errs.append(ContentValidator.msg("err.params.bp_operands"))
	var op: Variant = p.get("op")
	var op_ok: bool = op is String and OPS.has(op as String)
	if not op_ok:
		errs.append(ContentValidator.msg("err.params.bp_op"))
	var result_ok: bool = false
	var result: int = 0
	if a_ok and b_ok and op_ok:
		result = result_of(int(p["a"]), op as String, int(p["b"]))
		result_ok = result >= 0 and result <= MAX_VALUE
		if op == "÷" and result < 0:
			errs.append(ContentValidator.msg("err.params.bp_division"))
		elif not result_ok:
			errs.append(ContentValidator.msg("err.params.bp_result"))
	var choices: Variant = p.get("choices")
	var choices_ok: bool = choices is Array and (choices as Array).size() >= MIN_CHOICES and (choices as Array).size() <= MAX_CHOICES
	var seen: Dictionary = {}
	if choices_ok:
		for c: Variant in choices as Array:
			if not _in_range(c) or seen.has(int(c)):
				choices_ok = false
				break
			seen[int(c)] = true
	if not choices_ok:
		errs.append(ContentValidator.msg("err.params.bp_choices"))
	elif result_ok and not seen.has(result):
		errs.append(ContentValidator.msg("err.params.bp_choices_missing"))
	return errs

static func _in_range(v: Variant) -> bool:
	return ContentValidator.is_int_like(v) and int(v) >= 0 and int(v) <= MAX_VALUE
