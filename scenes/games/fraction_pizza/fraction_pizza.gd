extends MiniGame
## Kesir pizzası (3. sınıf kesirler).
## split: üstte parça sayısı; seçeneklerden "eş parçalara bölünmüş" pizzayı bul.
## select: üstte kesir (pay / payda); eş dilimli pizzadan pay kadar dilim seç, onayla.
## Seçili dilim dışa kayar, kenarı kalınlaşır ve üstüne onay işareti çizilir (renk tek başına değil).

const Widgets: GDScript = preload("res://scenes/games/game_widgets.gd")
const ASKS: PackedStringArray = ["split", "select"]
const SPLIT_MIN: int = 2
const SPLIT_MAX: int = 8
const SELECT_MAX: int = 12
const PIZZA_KEY: String = "item.yiyecek.pizza"
const MAX_VOICED_COUNT: int = 20
## Eşit olmayan bölmelerin genliği: belirgin ve hafif.
const UNEQUAL_STRONG: float = 0.55
const UNEQUAL_MILD: float = 0.28

const CRUST: Color = Color(0.86, 0.6, 0.32)
const CHEESE: Color = Color(1.0, 0.84, 0.42)
const SAUCE_EDGE: Color = Color(0.9, 0.42, 0.28)
const PEPPERONI: Color = Color(0.8, 0.26, 0.22)
const CUT_LINE: Color = Color(0.55, 0.32, 0.14)
## Peperoni: her dilimde aynı desen (eş dilimler aynı görünsün).
const TOPPING_RADIUS: float = 0.075
const WIDE_SLICE: float = 1.0

# split düzeni
const NUMBER_RECT: Rect2 = Rect2(835, 140, 250, 170)
const OPTION_SIDE: float = 330.0
const OPTION_GAP: float = 50.0
const OPTION_Y: float = 400.0
# select düzeni
const SELECT_CENTER: Vector2 = Vector2(960, 540)
const SELECT_RADIUS: float = 300.0
const SLICE_PULL: float = 26.0
const FRACTION_X: float = 230.0
const FRACTION_TILE: Vector2 = Vector2(200, 160)
const COUNTER_RECT: Rect2 = Rect2(1520, 230, 200, 160)
const CHECK_RECT: Rect2 = Rect2(1510, 640, 220, 160)
const HINT_STEP_SECONDS: float = 0.6

var _ask: String = "split"
var _parts: int = 4
var _take: int = 1
# split
var _options: Array[Dictionary] = []
var _option_views: Array[Control] = []
var _correct: int = -1
var _faded: Dictionary = {}
# select
var _pizza: Control = null
var _selected: Array[bool] = []
var _rotation: float = 0.0
var _pulse: int = -1
var _numerator: Control = null
var _counter: Control = null
var _check: Control = null
var _hint_gen: int = 0

func setup(params: Dictionary, difficulty_value: int, context: RoundContext) -> void:
	_init_round(difficulty_value, context)
	_ask = str(params["ask"])
	_parts = int(params["parts"])
	if _ask == "split":
		_setup_split()
	else:
		_take = int(params["take"])
		_setup_select()

## Dilim açıları (radyan, toplam TAU). amp 0 → eş parçalar.
static func slice_angles(parts: int, amp: float) -> Array[float]:
	var raw: Array[float] = []
	var total: float = 0.0
	for i: int in parts:
		var w: float = 1.0 + amp * cos(TAU * i / parts + 0.7)
		raw.append(w)
		total += w
	var res: Array[float] = []
	for w: float in raw:
		res.append(TAU * w / total)
	return res

# ================= split =================

func _setup_split() -> void:
	var t: Control = Widgets.make_tile(self, str(_parts), NUMBER_RECT, 110, ClayStyle.BUTTER)
	t.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var other: int = _parts + 1 if _parts < SPLIT_MAX else _parts - 1
	var list: Array = [{"parts": _parts, "amp": 0.0}, {"parts": _parts, "amp": UNEQUAL_STRONG}]
	if difficulty >= 2:
		list.append({"parts": other, "amp": 0.0})
	if difficulty >= 3:
		list.append({"parts": _parts, "amp": UNEQUAL_MILD})
	var correct_opt: Dictionary = list[0]
	Widgets.shuffle(list, ctx.rng)
	_correct = list.find(correct_opt)
	var total: float = list.size() * OPTION_SIDE + (list.size() - 1) * OPTION_GAP
	var x0: float = (BASE_SIZE.x - total) / 2.0
	for i: int in list.size():
		var opt: Dictionary = list[i]
		_options.append(opt)
		var v: Control = Control.new()
		v.name = "Option%d" % i
		v.position = Vector2(x0 + i * (OPTION_SIDE + OPTION_GAP), OPTION_Y)
		v.size = Vector2(OPTION_SIDE, OPTION_SIDE)
		v.pivot_offset = v.size / 2.0
		var angles: Array[float] = slice_angles(int(opt["parts"]), float(opt["amp"]))
		v.draw.connect(func() -> void:
			v.draw_style_box(ClayStyle.card_box(ClayStyle.IVORY, 40), Rect2(Vector2.ZERO, v.size))
			_draw_pizza(v, v.size / 2.0, OPTION_SIDE * 0.42, angles, 0.0, [], -1))
		v.gui_input.connect(_on_option_input.bind(i))
		add_child(v)
		_option_views.append(v)

func _on_option_input(event: InputEvent, index: int) -> void:
	if is_press(event):
		_choose(index)

func _choose(index: int) -> void:
	if not _can_input() or index < 0 or index >= _option_views.size():
		return
	_tap_feedback(_option_views[index])
	_submit_answer(index == _correct)

# ================= select =================

func _setup_select() -> void:
	_rotation = PI / _parts if difficulty >= 3 else 0.0
	for i: int in _parts:
		_selected.append(false)
	_build_fraction()
	_pizza = Control.new()
	_pizza.name = "Pizza"
	var side: float = (SELECT_RADIUS + SLICE_PULL + 20.0) * 2.0
	_pizza.size = Vector2(side, side)
	_pizza.position = SELECT_CENTER - _pizza.size / 2.0
	_pizza.draw.connect(func() -> void:
		_draw_pizza(_pizza, _pizza.size / 2.0, SELECT_RADIUS, slice_angles(_parts, 0.0), _rotation, _selected, _pulse))
	_pizza.gui_input.connect(_on_pizza_input)
	add_child(_pizza)
	if difficulty <= 1:
		_counter = Widgets.make_tile(self, "0", COUNTER_RECT, 96, ClayStyle.IVORY)
		_counter.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_check = Widgets.make_check_button(self, CHECK_RECT)
	_check.gui_input.connect(_on_check_input)

## Kesir: pay karosu, kalın kesir çizgisi, payda karosu (yazı tipiyle).
func _build_fraction() -> void:
	var top: float = SELECT_CENTER.y - FRACTION_TILE.y - 30.0
	_numerator = Widgets.make_tile(self, str(_take), Rect2(Vector2(FRACTION_X, top), FRACTION_TILE), 100, ClayStyle.BUTTER)
	_numerator.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var bar: Control = Control.new()
	bar.mouse_filter = Control.MOUSE_FILTER_IGNORE
	bar.position = Vector2(FRACTION_X - 20.0, SELECT_CENTER.y - 12.0)
	bar.size = Vector2(FRACTION_TILE.x + 40.0, 24.0)
	bar.draw.connect(func() -> void:
		bar.draw_line(Vector2(12, 12), Vector2(bar.size.x - 12.0, 12), ClayStyle.INK, 14.0, true))
	add_child(bar)
	var den: Control = Widgets.make_tile(self, str(_parts), Rect2(Vector2(FRACTION_X, SELECT_CENTER.y + 30.0), FRACTION_TILE), 100, ClayStyle.APRICOT)
	den.mouse_filter = Control.MOUSE_FILTER_IGNORE

func pizza_radius() -> float:
	return SELECT_RADIUS

## Pizza merkezine göre yerel noktadaki dilim (-1: pizza dışı). Açı saat 12'den saat yönünde.
func slice_at(local: Vector2) -> int:
	if local.length() > SELECT_RADIUS + SLICE_PULL:
		return -1
	var theta: float = fposmod(atan2(local.x, -local.y) - _rotation, TAU)
	return mini(int(theta / (TAU / _parts)), _parts - 1)

func _on_pizza_input(event: InputEvent) -> void:
	if is_press(event):
		var local: Vector2 = _pizza.get_local_mouse_position() - _pizza.size / 2.0
		var i: int = slice_at(local)
		if i >= 0:
			_toggle(i)

func _toggle(i: int) -> void:
	if not _can_input() or i < 0 or i >= _parts:
		return
	_selected[i] = not _selected[i]
	audio.play_sfx("sfx.tap")
	_refresh_select()

func _refresh_select() -> void:
	_pizza.queue_redraw()
	if _counter != null:
		_counter.set("text", str(selected_count()))

func selected_count() -> int:
	return _selected.count(true)

func _on_check_input(event: InputEvent) -> void:
	if is_press(event):
		_check_answer()

func _check_answer() -> void:
	if not _can_input():
		return
	_tap_feedback(_check)
	_submit_answer(selected_count() == _take)

# ================= Çizim =================

## Pizza: her dilim kendi çokgeni (kabuk + peynir + peperoni). Seçili dilim dışa kayar,
## kalın kenar ve onay işareti alır. `item.yiyecek.pizza` varsa dilimler dokudan kesilir.
func _draw_pizza(ci: CanvasItem, c: Vector2, r: float, angles: Array[float], rot: float, selected: Array, pulse: int) -> void:
	var tex: Texture2D = AssetRegistry.texture(PIZZA_KEY)
	ci.draw_circle(c + Vector2(0, r * 0.04), r, ClayStyle.SHADOW, true, -1.0, true)
	var a0: float = rot
	for i: int in angles.size():
		var a1: float = a0 + angles[i]
		var sel: bool = i < selected.size() and bool(selected[i])
		var mid: float = (a0 + a1) / 2.0
		var off: Vector2 = _dir(mid) * (SLICE_PULL if sel else 0.0)
		var outer: PackedVector2Array = _wedge(c + off, r, a0, a1)
		if tex != null:
			var uvs: PackedVector2Array = PackedVector2Array()
			for p: Vector2 in outer:
				uvs.append((p - off - c) / (2.0 * r) + Vector2(0.5, 0.5))
			ci.draw_colored_polygon(outer, Color.WHITE, uvs, tex)
		else:
			ci.draw_colored_polygon(outer, CRUST)
			ci.draw_colored_polygon(_wedge(c + off, r * 0.86, a0, a1, r * 0.04), SAUCE_EDGE)
			ci.draw_colored_polygon(_wedge(c + off, r * 0.82, a0, a1, r * 0.05), CHEESE)
			for t: Vector2 in _toppings(a1 - a0):
				ci.draw_circle(c + off + _dir(mid + t.x) * r * t.y, r * TOPPING_RADIUS, PEPPERONI, true, -1.0, true)
		var line_w: float = 9.0 if sel else 4.0
		ci.draw_polyline(outer + PackedVector2Array([outer[0]]), CUT_LINE if not sel else ClayStyle.INK, line_w, true)
		if i == pulse:
			ci.draw_colored_polygon(outer, Color(1, 1, 1, 0.35))
		if sel:
			var cpos: Vector2 = c + off + _dir(mid) * r * 0.55
			ci.draw_circle(cpos, r * 0.14, ClayStyle.IVORY, true, -1.0, true)
			Widgets.draw_check(ci, Rect2(cpos - Vector2(r, r) * 0.12, Vector2(r, r) * 0.24))
		a0 = a1

## Saat 12'den saat yönünde açıya göre birim yön.
static func _dir(a: float) -> Vector2:
	return Vector2(sin(a), -cos(a))

## Dilim çokgeni: merkez (+ isteğe bağlı iç pay) ve yay noktaları.
static func _wedge(c: Vector2, r: float, a0: float, a1: float, inset: float = 0.0) -> PackedVector2Array:
	var pts: PackedVector2Array = PackedVector2Array()
	var mid: float = (a0 + a1) / 2.0
	pts.append(c + _dir(mid) * inset)
	var steps: int = maxi(4, int((a1 - a0) / 0.08))
	for k: int in steps + 1:
		pts.append(c + _dir(lerpf(a0, a1, float(k) / steps)) * r)
	return pts

## Dilim ortasına göre peperoni konumları (açı farkı, yarıçap oranı); geniş dilimde üç tane.
static func _toppings(width: float) -> Array[Vector2]:
	var res: Array[Vector2] = [Vector2(0.0, 0.6)]
	if width > WIDE_SLICE:
		res.append(Vector2(-width * 0.22, 0.4))
		res.append(Vector2(width * 0.22, 0.4))
	return res

# ================= İpuçları =================

func show_hint(level: int) -> void:
	if _done or _busy:
		return
	if level == 1:
		if _ask == "split":
			_fade_one_wrong()
		else:
			_count_slices()
	elif level >= 2:
		_solve()

func _fade_one_wrong() -> void:
	for i: int in _option_views.size():
		if i != _correct and not _faded.has(i):
			_faded[i] = true
			_option_views[i].create_tween().tween_property(_option_views[i], "modulate:a", 0.3, 0.4)
			return

## İpucu 1 (select): dilimler sırayla vurgulanıp sayılır, sonra pay parlar.
func _count_slices() -> void:
	_hint_gen += 1
	var gen: int = _hint_gen
	for i: int in _parts:
		if gen != _hint_gen or _done:
			return
		_pulse = i
		_pizza.queue_redraw()
		if i + 1 <= MAX_VOICED_COUNT:
			narrator.say("vo.sayi.%d" % (i + 1))
		await _wait(HINT_STEP_SECONDS)
	if gen != _hint_gen or _done:
		return
	_pulse = -1
	_pizza.queue_redraw()
	_glow(_numerator)

## İpucu 2: doğru seçenek seçilir / tam `take` dilim seçili hale getirilip onaylanır.
func _solve() -> void:
	_hint_gen += 1
	_busy = true
	helped = true
	if _ask == "split":
		_glow(_option_views[_correct])
	else:
		_pulse = -1
		for i: int in _parts:
			_selected[i] = i < _take
		_refresh_select()
		_glow(_check)
	await _wait(0.6)
	_busy = false
	if _done:
		return
	_submit_answer(true)

# --- Test kancaları ---

func _debug_choose(index: int) -> void:
	_choose(index)

func _debug_correct_index() -> int:
	return _correct

func _debug_toggle(i: int) -> void:
	_toggle(i)

func _debug_check() -> void:
	_check_answer()

func _debug_answer(correct: bool) -> void:
	if _ask == "split":
		_choose(_correct if correct else (0 if _correct != 0 else 1))
		return
	if correct:
		for i: int in _parts:
			if _selected[i] != (i < _take):
				_toggle(i)
	elif selected_count() == _take:
		_toggle(0)
	_check_answer()

func option_count() -> int:
	return _options.size()

func option_parts(i: int) -> int:
	return int(_options[i]["parts"])

func option_is_equal(i: int) -> bool:
	return is_zero_approx(float(_options[i]["amp"]))

func faded_count() -> int:
	return _faded.size()

func is_counter_shown() -> bool:
	return _counter != null

func touch_targets() -> Array[Control]:
	if _ask == "split":
		return _option_views.duplicate()
	return [_pizza, _check] as Array[Control]

static func validate_params(p: Dictionary) -> Array[String]:
	var errs: Array[String] = []
	var ask: Variant = p.get("ask")
	if not (ask is String) or not ASKS.has(ask as String):
		errs.append(ContentValidator.msg("err.params.fp_ask"))
		return errs
	var parts: Variant = p.get("parts")
	var hi: int = SPLIT_MAX if ask == "split" else SELECT_MAX
	if not ContentValidator.is_int_like(parts) or int(parts) < SPLIT_MIN or int(parts) > hi:
		errs.append(ContentValidator.msg("err.params.fp_parts_split" if ask == "split" else "err.params.fp_parts"))
		return errs
	if ask == "select":
		var take: Variant = p.get("take")
		if not ContentValidator.is_int_like(take) or int(take) < 1 or int(take) > int(parts):
			errs.append(ContentValidator.msg("err.params.fp_take"))
	return errs
