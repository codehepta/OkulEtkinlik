extends MiniGame
## Sıraya diz: üstte boş yuvalar (aralarında yön okları), altta karışık kartlar.
## Kart doğru yuvaya bırakılınca oturur; yanlış yuvaya bırakılınca geri seker.
## Bütün yuvalar dolunca tur biter. `items` doğru sırayla verilir.

const Widgets: GDScript = preload("res://scenes/games/game_widgets.gd")
const TOKEN_VIEW: PackedScene = preload("res://scenes/games/token_view.tscn")
## Öğe sayısına göre kart boyu.
const SIDE_BY_COUNT: Dictionary = {3: 240.0, 4: 220.0, 5: 200.0, 6: 180.0}
const SLOT_GAP: float = 72.0
const SLOT_Y: float = 210.0
const CARD_Y: float = 600.0
const CARD_GAP: float = 48.0
const TRAY_MARGIN: float = 34.0
const MIN_ITEMS: int = 3
const MAX_ITEMS: int = 6
const CARD_COLOR: Color = ClayStyle.PEACH
const ANCHOR_COLOR: Color = ClayStyle.IVORY
const ARROW_COLOR: Color = ClayStyle.CLAY_EDGE
const AUTO_STEP_SECONDS: float = 0.35

var _items: Array = []
var _side: float = 200.0
## Kart i'nin doğru yuvası i'dir.
var _cards: Array[Control] = []
var _slots: Array[Control] = []
var _card_home: Array[Vector2] = []
var _placed: Array[bool] = []
var _drag_index: int = -1
var _drag_offset: Vector2 = Vector2.ZERO

func setup(params: Dictionary, difficulty_value: int, context: RoundContext) -> void:
	_init_round(difficulty_value, context)
	_items = params["items"] as Array
	var n: int = _items.size()
	_side = float(SIDE_BY_COUNT.get(clampi(n, MIN_ITEMS, MAX_ITEMS), 200.0))
	var anchors: Array[int] = anchors_for(n, difficulty)
	var slot_w: float = n * _side + (n - 1) * SLOT_GAP
	var x0: float = (BASE_SIZE.x - slot_w) / 2.0
	add_child(ClayStyle.make_panel(ClayStyle.tray_box(0.72),
		Rect2(x0 - TRAY_MARGIN, SLOT_Y - TRAY_MARGIN, slot_w + TRAY_MARGIN * 2.0, _side + TRAY_MARGIN * 2.0)))
	for i: int in n:
		var pos: Vector2 = Vector2(x0 + i * (_side + SLOT_GAP), SLOT_Y)
		_slots.append(_make_slot(pos))
		if i < n - 1:
			_make_arrow(Vector2(pos.x + _side, SLOT_Y), SLOT_GAP)
	# Ön yerleşmeyen kartlar alt tepside karışık dizilir.
	var free: Array = []
	for i: int in n:
		_placed.append(anchors.has(i))
		if not anchors.has(i):
			free.append(i)
	var order: Array = free.duplicate()
	Widgets.shuffle(order, ctx.rng)
	if order == free and order.size() > 1:
		order.push_back(order.pop_front())
	var card_w: float = order.size() * _side + maxi(order.size() - 1, 0) * CARD_GAP
	var cx0: float = (BASE_SIZE.x - card_w) / 2.0
	if not order.is_empty():
		add_child(ClayStyle.make_panel(ClayStyle.tray_box(0.6),
			Rect2(cx0 - TRAY_MARGIN, CARD_Y - TRAY_MARGIN, card_w + TRAY_MARGIN * 2.0, _side + TRAY_MARGIN * 2.0)))
	_card_home.resize(n)
	_cards.resize(n)
	for i: int in n:
		var home: Vector2 = _slots[i].position
		var k: int = order.find(i)
		if k >= 0:
			home = Vector2(cx0 + k * (_side + CARD_GAP), CARD_Y)
		_card_home[i] = home
		var color: Color = ANCHOR_COLOR if anchors.has(i) else CARD_COLOR
		var card: Control = _make_card(_items[i] as Dictionary, home, color)
		if anchors.has(i):
			card.mouse_filter = Control.MOUSE_FILTER_IGNORE
		else:
			card.gui_input.connect(_on_card_input.bind(i))
		_cards[i] = card

## Zorluğa göre baştan yerinde duran kartlar: 1 → ilk ve (n ≥ 4) son; 2 → ilk; 3 → hiçbiri.
static func anchors_for(n: int, difficulty_value: int) -> Array[int]:
	var res: Array[int] = []
	if difficulty_value <= 2:
		res.append(0)
	if difficulty_value <= 1 and n >= 4:
		res.append(n - 1)
	return res

func _make_slot(pos: Vector2) -> Control:
	var slot: Control = Control.new()
	slot.mouse_filter = Control.MOUSE_FILTER_IGNORE
	slot.position = pos
	slot.size = Vector2(_side, _side)
	slot.pivot_offset = slot.size / 2.0
	slot.draw.connect(func() -> void: Widgets.draw_well(slot, Rect2(Vector2(6, 6), slot.size - Vector2(12, 12))))
	add_child(slot)
	return slot

## Yuvalar arasında soldan sağa yön oku (sıranın yönü).
func _make_arrow(pos: Vector2, width: float) -> void:
	var a: Control = Control.new()
	a.mouse_filter = Control.MOUSE_FILTER_IGNORE
	a.position = pos
	a.size = Vector2(width, _side)
	a.draw.connect(func() -> void:
		var c: Vector2 = a.size / 2.0
		var w: float = width * 0.28
		var pts: PackedVector2Array = PackedVector2Array([c + Vector2(-w * 0.6, -w), c + Vector2(w * 0.6, 0), c + Vector2(-w * 0.6, w)])
		a.draw_polyline(pts, ARROW_COLOR, 10.0, true)
		for p: Vector2 in pts:
			a.draw_circle(p, 5.0, ARROW_COLOR, true, -1.0, true))
	add_child(a)

func _make_card(token: Dictionary, pos: Vector2, color: Color) -> Control:
	var v: Control = TOKEN_VIEW.instantiate() as Control
	v.set("framed", true)
	v.set("card_color", color)
	add_child(v)
	v.call("set_token", token)
	v.custom_minimum_size = Vector2(_side, _side)
	v.size = Vector2(_side, _side)
	v.position = pos
	v.pivot_offset = v.size / 2.0
	return v

func _on_card_input(event: InputEvent, index: int) -> void:
	var card: Control = _cards[index]
	if is_press(event):
		if _placed[index] or not _can_input():
			return
		_drag_index = index
		_drag_offset = card.get_global_mouse_position() - card.global_position
		card.move_to_front()
		_tap_feedback(card)
	elif event is InputEventMouseMotion and _drag_index == index:
		card.global_position = card.get_global_mouse_position() - _drag_offset
	elif event is InputEventMouseButton and _drag_index == index and not (event as InputEventMouseButton).pressed:
		_drag_index = -1
		var mouse: Vector2 = card.get_global_mouse_position()
		var hit: int = -1
		for s: int in _slots.size():
			if _slots[s].get_global_rect().has_point(mouse):
				hit = s
		_drop(index, hit)

## slot: bırakılan yuva (-1: yuva dışı, kart yalnızca geri döner, cevap sayılmaz).
func _drop(card: int, slot: int) -> void:
	if not _can_input() or card < 0 or card >= _cards.size() or _placed[card]:
		return
	if slot < 0 or slot >= _slots.size() or _placed[slot]:
		_move_to(_cards[card], _card_home[card])
		return
	if slot == card:
		_place(card)
		audio.play_sfx("sfx.drop")
		_submit_answer(true, open_slots().is_empty())
	else:
		_move_to(_cards[card], _card_home[card])
		_submit_answer(false, false)

func _place(card: int) -> void:
	_placed[card] = true
	_cards[card].mouse_filter = Control.MOUSE_FILTER_IGNORE
	_move_to(_cards[card], _slots[card].position, 0.15)

func _move_to(view: Control, pos: Vector2, seconds: float = 0.25) -> void:
	if _reduce_motion() or not is_inside_tree():
		view.position = pos
		return
	var tw: Tween = view.create_tween()
	tw.tween_property(view, "position", pos, seconds).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)

## Henüz dolmamış yuvalar (soldan sağa).
func open_slots() -> Array[int]:
	var res: Array[int] = []
	for i: int in _placed.size():
		if not _placed[i]:
			res.append(i)
	return res

func slot_views() -> Array[Control]:
	return _slots.duplicate()

## Dokunulabilir (sürüklenebilir) kartlar.
func touch_targets() -> Array[Control]:
	var res: Array[Control] = []
	for i: int in _cards.size():
		if not _placed[i]:
			res.append(_cards[i])
	return res

## Test için: gerçek bırakmayla aynı kod yolu.
func _debug_drop(card: int, slot: int) -> void:
	_drop(card, slot)

## Test için: yuvaya ait kart (kart i'nin yuvası i).
func _debug_card_for_slot(slot: int) -> int:
	return slot

## Test için: ilk boş yuvaya doğru kartı ya da başka bir boş kartı bırakır.
func _debug_answer(correct: bool) -> void:
	var open: Array[int] = open_slots()
	if open.is_empty():
		return
	var slot: int = open[0]
	if correct:
		_drop(slot, slot)
	elif open.size() > 1:
		_drop(open[1], slot)

func show_hint(level: int) -> void:
	if _done or _busy:
		return
	var open: Array[int] = open_slots()
	if open.is_empty():
		return
	if level == 1:
		_glow(_slots[open[0]])
		_glow(_cards[open[0]])
	elif level >= 2:
		_auto_complete()

## İpucu 2: kalan kartlar soldan sağa sırayla yerine oturur.
func _auto_complete() -> void:
	_busy = true
	helped = true
	while not _done:
		var open: Array[int] = open_slots()
		if open.is_empty():
			break
		var i: int = open[0]
		_glow(_slots[i])
		await _wait(AUTO_STEP_SECONDS)
		if _done:
			return
		_place(i)
		_submit_answer(true, open_slots().is_empty())
		await _wait(AUTO_STEP_SECONDS)
	_busy = false

static func validate_params(p: Dictionary) -> Array[String]:
	var errs: Array[String] = []
	var items: Variant = p.get("items")
	if not (items is Array) or (items as Array).size() < MIN_ITEMS or (items as Array).size() > MAX_ITEMS:
		errs.append(ContentValidator.msg("err.params.seq_items"))
		return errs
	var list: Array = items as Array
	for t: Variant in list:
		if not Token.is_valid(t):
			errs.append(ContentValidator.msg("err.params.token", {"field": "items"}))
			return errs
	for i: int in list.size():
		for j: int in range(i + 1, list.size()):
			if Token.same(list[i] as Dictionary, list[j] as Dictionary):
				errs.append(ContentValidator.msg("err.params.seq_items_dup"))
				return errs
	return errs
