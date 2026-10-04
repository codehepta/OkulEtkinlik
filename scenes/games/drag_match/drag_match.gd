extends MiniGame
## Sürükle ve eşleştir: sol raftaki kabarık kartlar sağdaki doğru yuvaya sürüklenir.
## Sağdaki her yuva: kesik kenarlı boş bırakma çukuru + yanında düz hedef kartı.

const TOKEN_VIEW: PackedScene = preload("res://scenes/games/token_view.tscn")
## Çift sayısına göre kart boyu (2–3 çift büyük, 4 çift sığacak kadar).
const VIEW_SIDE_BY_COUNT: Dictionary = {2: 210.0, 3: 196.0, 4: 160.0}
const ROW_GAP: float = 28.0
## Satırların dikey olarak ortalandığı alan (üst çubuk ve alttaki altyazı payı dışında).
const AREA_TOP: float = 180.0
const AREA_BOTTOM: float = 900.0
const LEFT_X: float = 530.0
## Bırakma çukuru ile hedef kartın sol kenarları.
const WELL_X: float = 1010.0
const TARGET_GAP: float = 30.0
const TRAY_MARGIN: float = 34.0
const DRAG_COLOR: Color = ClayStyle.PEACH
const TARGET_COLOR: Color = ClayStyle.IVORY
const WELL_LINE: Color = Color(ClayStyle.CLAY_EDGE, 0.9)
const WELL_FILL: Color = Color(ClayStyle.COCOA, 0.12)
const AUTO_STEP_SECONDS: float = 0.35

var _pairs: Array = []
var _left_views: Array[Control] = []
var _right_views: Array[Control] = []
## Sağ yuva -> çift indeksi (karıştırılmış sıra).
var _slot_pair: Array[int] = []
var _left_home: Array[Vector2] = []
var _matched: Array[bool] = []
var _drag_index: int = -1
var _drag_offset: Vector2 = Vector2.ZERO
var _view_size: Vector2 = Vector2(200, 200)

func setup(params: Dictionary, difficulty_value: int, context: RoundContext) -> void:
	_init_round(difficulty_value, context)
	_pairs = params["pairs"] as Array
	var n: int = _pairs.size()
	_slot_pair.clear()
	for i: int in n:
		_slot_pair.append(i)
	for i: int in range(n - 1, 0, -1):
		var j: int = ctx.rng.randi_range(0, i)
		var t: int = _slot_pair[i]
		_slot_pair[i] = _slot_pair[j]
		_slot_pair[j] = t
	var side: float = float(VIEW_SIDE_BY_COUNT.get(clampi(n, 2, 4), 200.0))
	_view_size = Vector2(side, side)
	var block_h: float = n * side + (n - 1) * ROW_GAP
	var top: float = AREA_TOP + (AREA_BOTTOM - AREA_TOP - block_h) / 2.0
	var shelf: Rect2 = Rect2(LEFT_X - TRAY_MARGIN, top - TRAY_MARGIN, side + TRAY_MARGIN * 2.0, block_h + TRAY_MARGIN * 2.0)
	add_child(ClayStyle.make_panel(ClayStyle.tray_box(0.6), shelf))
	var board_w: float = side * 2.0 + TARGET_GAP + TRAY_MARGIN * 2.0
	var board: Rect2 = Rect2(WELL_X - TRAY_MARGIN, top - TRAY_MARGIN, board_w, block_h + TRAY_MARGIN * 2.0)
	add_child(ClayStyle.make_panel(ClayStyle.tray_box(0.72), board))
	for i: int in n:
		_matched.append(false)
		var y: float = top + i * (side + ROW_GAP)
		var home: Vector2 = Vector2(LEFT_X, y)
		_left_home.append(home)
		var rv: Control = _make_slot((_pairs[_slot_pair[i]] as Dictionary)["right"] as Dictionary, Vector2(WELL_X, y))
		_right_views.append(rv)
	for i: int in n:
		var lv: Control = _make_view((_pairs[i] as Dictionary)["left"] as Dictionary, _left_home[i], DRAG_COLOR)
		lv.gui_input.connect(_on_left_input.bind(i))
		_left_views.append(lv)
	# Sol öğeler hedeflerin üstünde çizilsin.
	for lv: Control in _left_views:
		move_child(lv, -1)

func _make_view(token: Dictionary, pos: Vector2, color: Color) -> Control:
	var v: Control = TOKEN_VIEW.instantiate() as Control
	v.set("framed", true)
	v.set("card_color", color)
	add_child(v)
	v.call("set_token", token)
	v.custom_minimum_size = _view_size
	v.size = _view_size
	v.position = pos
	v.pivot_offset = _view_size / 2.0
	return v

## Sağ yuva: [kesik kenarlı boş çukur][hedef kartı]; bırakma alanı ikisini birden kapsar.
func _make_slot(token: Dictionary, pos: Vector2) -> Control:
	var slot: Control = Control.new()
	slot.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(slot)
	slot.position = pos
	slot.size = Vector2(_view_size.x * 2.0 + TARGET_GAP, _view_size.y)
	slot.pivot_offset = slot.size / 2.0
	var well: Control = Control.new()
	well.mouse_filter = Control.MOUSE_FILTER_IGNORE
	well.size = _view_size
	well.draw.connect(func() -> void:
		var r: Rect2 = Rect2(Vector2(6, 6), _view_size - Vector2(12, 12))
		well.draw_style_box(ClayStyle.soft_box(WELL_FILL, 26), r)
		ClayStyle.draw_dashed_round_rect(well, r, 26.0, WELL_LINE, 7.0, 14.0))
	slot.add_child(well)
	var target: Control = TOKEN_VIEW.instantiate() as Control
	target.set("framed", true)
	target.set("card_color", TARGET_COLOR)
	target.mouse_filter = Control.MOUSE_FILTER_IGNORE
	slot.add_child(target)
	target.call("set_token", token)
	target.custom_minimum_size = _view_size
	target.size = _view_size
	target.position = Vector2(_view_size.x + TARGET_GAP, 0)
	return slot

func _on_left_input(event: InputEvent, index: int) -> void:
	var view: Control = _left_views[index]
	if is_press(event):
		if _matched[index] or not _can_input():
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
		for s: int in _right_views.size():
			if _right_views[s].get_global_rect().has_point(mouse):
				hit = s
		_drop(index, hit)

## Test için: gerçek bırakmayla aynı kod yolu.
func _debug_drop(left_index: int, right_index: int) -> void:
	_drop(left_index, right_index)

## Test için: sağ yuva i'de duran çiftin indeksi (sol indeksiyle aynı numara).
func _debug_right_slots() -> Array[int]:
	return _slot_pair.duplicate()

## right_slot: bırakılan sağ yuva (-1: hedef dışı, öğe yalnızca geri döner).
func _drop(left_index: int, right_slot: int) -> void:
	if not _can_input() or left_index < 0 or left_index >= _pairs.size() or _matched[left_index]:
		return
	if right_slot < 0 or right_slot >= _right_views.size():
		_move_to(_left_views[left_index], _left_home[left_index])
		return
	if _slot_pair[right_slot] == left_index:
		_place(left_index, right_slot)
		_submit_answer(true, _all_matched())
	else:
		_move_to(_left_views[left_index], _left_home[left_index])
		_submit_answer(false, false)

func _place(left_index: int, right_slot: int) -> void:
	_matched[left_index] = true
	var view: Control = _left_views[left_index]
	view.mouse_filter = Control.MOUSE_FILTER_IGNORE
	# Kart, yuvanın boş çukuruna (sol yarısına) oturur.
	_move_to(view, _right_views[right_slot].position, 0.15)

func _all_matched() -> bool:
	return not _matched.has(false)

func _slot_of(pair_index: int) -> int:
	return _slot_pair.find(pair_index)

## Öğeyi (global konum) hedefe taşır; yanlış bırakmada geri sekme de budur.
func _move_to(view: Control, pos: Vector2, seconds: float = 0.25) -> void:
	if _reduce_motion() or not is_inside_tree():
		view.position = pos
		return
	var tw: Tween = view.create_tween()
	tw.tween_property(view, "position", pos, seconds).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)

func _first_unmatched() -> int:
	return _matched.find(false)

func show_hint(level: int) -> void:
	if _done or _busy:
		return
	var i: int = _first_unmatched()
	if i < 0:
		return
	if level == 1:
		_glow(_right_views[_slot_of(i)])
	elif level >= 2:
		_auto_complete()

## İpucu 2: eşleşmemiş çiftler sırayla otomatik eşleşir, yardım bitene kadar girdi kapalıdır.
func _auto_complete() -> void:
	_busy = true
	helped = true
	while not _done:
		var i: int = _first_unmatched()
		if i < 0:
			break
		_glow(_right_views[_slot_of(i)])
		await _wait(AUTO_STEP_SECONDS)
		if _done:
			return
		_place(i, _slot_of(i))
		_submit_answer(true, _all_matched())
		await _wait(AUTO_STEP_SECONDS)
	_busy = false

static func validate_params(p: Dictionary) -> Array[String]:
	var errs: Array[String] = []
	var pairs: Variant = p.get("pairs")
	if not (pairs is Array) or (pairs as Array).size() < 2 or (pairs as Array).size() > 4:
		errs.append(ContentValidator.msg("err.params.pairs"))
		return errs
	var lefts: Array = []
	var rights: Array = []
	for pr: Variant in pairs as Array:
		var ok: bool = pr is Dictionary and Token.is_valid((pr as Dictionary).get("left")) and Token.is_valid((pr as Dictionary).get("right"))
		if not ok:
			errs.append(ContentValidator.msg("err.params.pairs"))
			return errs
		lefts.append((pr as Dictionary)["left"])
		rights.append((pr as Dictionary)["right"])
	if _has_dup(lefts) or _has_dup(rights):
		errs.append(ContentValidator.msg("err.params.pairs_dup"))
	return errs

static func _has_dup(tokens: Array) -> bool:
	for i: int in tokens.size():
		for j: int in range(i + 1, tokens.size()):
			if Token.same(tokens[i] as Dictionary, tokens[j] as Dictionary):
				return true
	return false
