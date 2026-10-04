extends MiniGame
## Kutulara ayır: üstte karışık öğeler, altta 2–3 kutu. Kutular şekil simgesi + renkle ayrılır
## (renk tek başına anlam taşımaz) ve üstlerinde ne topladıklarını gösteren bir etiket vardır.
## Öğe doğru kutuya bırakılınca kutunun içine oturur; yanlış kutuya bırakılınca geri seker.
## Bütün öğeler yerleşince tur biter. Kutuya dokunmak etiketin sesini okutur (cevap sayılmaz).

const Widgets: GDScript = preload("res://scenes/games/game_widgets.gd")
const TOKEN_VIEW: PackedScene = preload("res://scenes/games/token_view.tscn")
const MIN_BINS: int = 2
const MAX_BINS: int = 3
const MIN_ITEMS: int = 4
const MAX_ITEMS: int = 9
## Renk verilmezse kutu sırasıyla kullanılan renkler.
const DEFAULT_COLORS: PackedStringArray = ["orange", "blue", "green"]

## Öğe sayısına göre üst tepsideki kart boyu.
const SIDE_BY_COUNT: Dictionary = {4: 180.0, 5: 180.0, 6: 170.0, 7: 170.0, 8: 150.0, 9: 150.0}
const ITEM_Y: float = 172.0
const ITEM_GAP: float = 24.0
const TRAY_MARGIN: float = 30.0
const BIN_Y: float = 410.0
const BIN_H: float = 470.0
const BIN_W_BY_COUNT: Dictionary = {2: 600.0, 3: 520.0}
const BIN_GAP_BY_COUNT: Dictionary = {2: 120.0, 3: 60.0}
const BIN_PAD: float = 24.0
const BADGE_SIDE: float = 104.0
## Etiket kartı: görselin 128 px alt sınırı kartın iç boşluğuna sığacak kadar büyük.
const LABEL_SIDE: float = 172.0
const HEADER_H: float = 196.0
const THUMB: float = 100.0
const THUMB_GAP: float = 12.0
const ITEM_COLOR: Color = ClayStyle.PEACH
const EXAMPLE_COLOR: Color = ClayStyle.IVORY
const AUTO_STEP_SECONDS: float = 0.35

var _bins: Array = []
var _items: Array = []
var _side: float = 170.0
var _bin_w: float = 600.0
var _bin_views: Array[Control] = []
var _item_views: Array[Control] = []
var _item_home: Array[Vector2] = []
var _target: Array[int] = []
var _placed: Array[bool] = []
## Kutu -> içine yerleşen öğeler (yerleşme sırasıyla).
var _contents: Array = []
## Tepsideki soldan sağa sıra (ipucu bu sırayı izler).
var _tray_order: Array[int] = []
var _drag_index: int = -1
var _drag_offset: Vector2 = Vector2.ZERO

func setup(params: Dictionary, difficulty_value: int, context: RoundContext) -> void:
	_init_round(difficulty_value, context)
	_bins = params["bins"] as Array
	_items = params["items"] as Array
	var n: int = _items.size()
	_side = float(SIDE_BY_COUNT.get(clampi(n, MIN_ITEMS, MAX_ITEMS), 150.0))
	for i: int in n:
		_target.append(int((_items[i] as Dictionary)["bin"]))
		_placed.append(false)
	for b: int in _bins.size():
		_contents.append([])
	_build_bins()
	var examples: Array[int] = examples_for(_target, _bins.size(), difficulty)
	var free: Array = []
	for i: int in n:
		if not examples.has(i):
			free.append(i)
	var order: Array = free.duplicate()
	Widgets.shuffle(order, ctx.rng)
	for i: Variant in order:
		_tray_order.append(int(i))
	var tray_w: float = order.size() * _side + maxi(order.size() - 1, 0) * ITEM_GAP
	var x0: float = (BASE_SIZE.x - tray_w) / 2.0
	add_child(ClayStyle.make_panel(ClayStyle.tray_box(0.6),
		Rect2(x0 - TRAY_MARGIN, ITEM_Y - TRAY_MARGIN, tray_w + TRAY_MARGIN * 2.0, _side + TRAY_MARGIN * 2.0)))
	_item_home.resize(n)
	_item_views.resize(n)
	for i: int in n:
		var k: int = order.find(i)
		var home: Vector2 = Vector2(x0 + maxi(k, 0) * (_side + ITEM_GAP), ITEM_Y)
		_item_home[i] = home
		var token: Dictionary = (_items[i] as Dictionary)["token"] as Dictionary
		var v: Control = _make_item(token, home, EXAMPLE_COLOR if examples.has(i) else ITEM_COLOR)
		v.name = "Item%d" % i
		v.gui_input.connect(_on_item_input.bind(i))
		_item_views[i] = v
	for i: int in examples:
		_place(i, false)

## Zorluğa göre baştan kutusunda duran örnek öğeler: 1 → en az iki öğesi olan her kutunun
## ilk öğesi; 2 → yalnızca ilk kutunun (en az iki öğesi varsa); 3 → hiçbiri.
## Tek öğeli kutudan örnek alınmaz, her kutuda sıralanacak öğe kalır.
static func examples_for(targets: Array[int], bin_count: int, difficulty_value: int) -> Array[int]:
	var res: Array[int] = []
	if difficulty_value >= 3:
		return res
	var last_bin: int = 0 if difficulty_value == 2 else bin_count - 1
	for b: int in range(0, last_bin + 1):
		var members: Array[int] = []
		for i: int in targets.size():
			if targets[i] == b:
				members.append(i)
		if members.size() >= 2:
			res.append(members[0])
	res.sort()
	return res

func _build_bins() -> void:
	var count: int = _bins.size()
	_bin_w = float(BIN_W_BY_COUNT.get(count, 520.0))
	var gap: float = float(BIN_GAP_BY_COUNT.get(count, 60.0))
	var total: float = count * _bin_w + (count - 1) * gap
	var x0: float = (BASE_SIZE.x - total) / 2.0
	for b: int in count:
		var bin: Dictionary = _bins[b] as Dictionary
		var color: Color = Widgets.COLORS[color_name_of(bin, b)] as Color
		var shape: String = str(bin["shape"])
		var view: Control = Control.new()
		view.name = "Bin%d" % b
		view.position = Vector2(x0 + b * (_bin_w + gap), BIN_Y)
		view.size = Vector2(_bin_w, BIN_H)
		view.pivot_offset = view.size / 2.0
		view.draw.connect(_draw_bin.bind(view, color, shape))
		view.gui_input.connect(_on_bin_input.bind(b))
		add_child(view)
		var label: Control = TOKEN_VIEW.instantiate() as Control
		label.set("framed", true)
		label.set("card_color", ClayStyle.IVORY)
		view.add_child(label)
		label.call("set_token", bin["label"] as Dictionary)
		label.mouse_filter = Control.MOUSE_FILTER_IGNORE
		label.custom_minimum_size = Vector2(LABEL_SIDE, LABEL_SIDE)
		label.size = Vector2(LABEL_SIDE, LABEL_SIDE)
		label.position = Vector2(BIN_PAD + BADGE_SIDE + 20.0, 12.0)
		_bin_views.append(view)

static func color_name_of(bin: Dictionary, index: int) -> String:
	var c: Variant = bin.get("color")
	if c is String and Widgets.COLORS.has(c as String):
		return c as String
	return DEFAULT_COLORS[index % DEFAULT_COLORS.size()]

## Kil kutu: renkli gövde, açık iç bölme (yerleşen öğeler), köşede şekil rozeti.
func _draw_bin(view: Control, color: Color, shape: String) -> void:
	var r: Rect2 = Rect2(Vector2.ZERO, view.size)
	view.draw_style_box(ClayStyle.plaque_box(color.lightened(0.25), color.darkened(0.25), 44, 6, 10, 12, 0.0, 0.0), r)
	var inner: Rect2 = Rect2(Vector2(BIN_PAD - 8.0, HEADER_H), Vector2(view.size.x - (BIN_PAD - 8.0) * 2.0, view.size.y - HEADER_H - 24.0))
	view.draw_style_box(ClayStyle.soft_box(Color(ClayStyle.IVORY, 0.7), 30), inner)
	var badge: Rect2 = Rect2(Vector2(BIN_PAD, (HEADER_H - BADGE_SIDE) / 2.0), Vector2(BADGE_SIDE, BADGE_SIDE))
	view.draw_circle(badge.get_center(), BADGE_SIDE / 2.0, ClayStyle.IVORY, true, -1.0, true)
	Widgets.draw_shape(view, shape, badge.grow(-10.0), color)

func _make_item(token: Dictionary, pos: Vector2, color: Color) -> Control:
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

func _on_item_input(event: InputEvent, index: int) -> void:
	var v: Control = _item_views[index]
	if is_press(event):
		if _placed[index] or not _can_input():
			return
		_drag_index = index
		_drag_offset = v.get_global_mouse_position() - v.global_position
		v.move_to_front()
		_tap_feedback(v)
	elif event is InputEventMouseMotion and _drag_index == index:
		v.global_position = v.get_global_mouse_position() - _drag_offset
	elif event is InputEventMouseButton and _drag_index == index and not (event as InputEventMouseButton).pressed:
		_drag_index = -1
		var mouse: Vector2 = v.get_global_mouse_position()
		var hit: int = -1
		for b: int in _bin_views.size():
			if _bin_views[b].get_global_rect().has_point(mouse):
				hit = b
		_drop(index, hit)

func _on_bin_input(event: InputEvent, bin: int) -> void:
	if is_press(event) and _drag_index < 0:
		_tap_bin(bin)

## Kutuya dokunma: etiketin sesi (varsa) okunur; cevap sayılmaz.
func _tap_bin(bin: int) -> void:
	if not _can_input() or bin < 0 or bin >= _bins.size():
		return
	_tap_feedback(_bin_views[bin])
	var voice: String = Token.voice_of((_bins[bin] as Dictionary)["label"] as Dictionary)
	if voice != "":
		narrator.say(voice)

## bin: bırakılan kutu (-1: kutu dışı; öğe yalnızca geri döner, cevap sayılmaz).
func _drop(item: int, bin: int) -> void:
	if not _can_input() or item < 0 or item >= _item_views.size() or _placed[item]:
		return
	if bin < 0 or bin >= _bin_views.size():
		_move_to(_item_views[item], _item_home[item])
		return
	if bin == _target[item]:
		_place(item)
		audio.play_sfx("sfx.drop")
		_submit_answer(true, open_items().is_empty())
	else:
		_move_to(_item_views[item], _item_home[item])
		_submit_answer(false, false)

## Öğeyi kutusunun iç bölmesinde sıradaki küçük yere taşır.
func _place(item: int, animate: bool = true) -> void:
	var bin: int = _target[item]
	_placed[item] = true
	var slot: int = (_contents[bin] as Array).size()
	(_contents[bin] as Array).append(item)
	var v: Control = _item_views[item]
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	# Boyut yerine ölçek küçülür: görsel yer tutucunun 128 px alt sınırı kartı taşırmasın.
	v.pivot_offset = Vector2.ZERO
	var k: float = THUMB / _side
	var cols: int = maxi(1, int((_bin_w - BIN_PAD * 2.0 + THUMB_GAP) / (THUMB + THUMB_GAP)))
	var row_w: float = cols * THUMB + (cols - 1) * THUMB_GAP
	var origin: Vector2 = _bin_views[bin].position + Vector2((_bin_w - row_w) / 2.0, HEADER_H + 12.0)
	var pos: Vector2 = origin + Vector2((slot % cols) * (THUMB + THUMB_GAP), (slot / cols) * (THUMB + THUMB_GAP))
	if animate and not _reduce_motion() and is_inside_tree():
		var tw: Tween = v.create_tween().set_parallel(true)
		tw.tween_property(v, "position", pos, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		tw.tween_property(v, "scale", Vector2(k, k), 0.15)
	else:
		v.position = pos
		v.scale = Vector2(k, k)

func _move_to(view: Control, pos: Vector2, seconds: float = 0.25) -> void:
	if _reduce_motion() or not is_inside_tree():
		view.position = pos
		return
	var tw: Tween = view.create_tween()
	tw.tween_property(view, "position", pos, seconds).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)

## Henüz yerleşmemiş öğeler (dizin sırasıyla).
func open_items() -> Array[int]:
	var res: Array[int] = []
	for i: int in _placed.size():
		if not _placed[i]:
			res.append(i)
	return res

## Tepsideki soldan sağa sıradaki ilk yerleşmemiş öğe (yoksa -1).
func _next_item() -> int:
	for i: int in _tray_order:
		if not _placed[i]:
			return i
	return -1

func bin_contents(bin: int) -> Array[int]:
	var res: Array[int] = []
	res.assign(_contents[bin] as Array)
	return res

func bin_views() -> Array[Control]:
	return _bin_views.duplicate()

func item_views() -> Array[Control]:
	return _item_views.duplicate()

func bin_shapes() -> Array[String]:
	var res: Array[String] = []
	for b: Variant in _bins:
		res.append(str((b as Dictionary)["shape"]))
	return res

## Dokunulabilir (sürüklenebilir) öğeler.
func touch_targets() -> Array[Control]:
	var res: Array[Control] = []
	for i: int in _item_views.size():
		if not _placed[i]:
			res.append(_item_views[i])
	return res

func show_hint(level: int) -> void:
	if _done or _busy:
		return
	var next: int = _next_item()
	if next < 0:
		return
	if level == 1:
		_glow(_item_views[next])
		_glow(_bin_views[_target[next]])
	elif level >= 2:
		_auto_complete()

## İpucu 2: kalan öğeler tepsideki sırayla kutularına yerleşir.
func _auto_complete() -> void:
	_busy = true
	helped = true
	while not _done:
		var i: int = _next_item()
		if i < 0:
			break
		_glow(_bin_views[_target[i]])
		await _wait(AUTO_STEP_SECONDS)
		if _done:
			return
		_place(i)
		_submit_answer(true, open_items().is_empty())
		await _wait(AUTO_STEP_SECONDS)
	_busy = false

# --- Test kancaları ---

## Gerçek bırakmayla aynı kod yolu.
func _debug_drop(item: int, bin: int) -> void:
	_drop(item, bin)

func _debug_bin_of(item: int) -> int:
	return _target[item]

## Tepsideki sıradaki öğe (ipucunun gösterdiği).
func _debug_next_item() -> int:
	return _next_item()

func _debug_tap_bin(bin: int) -> void:
	_tap_bin(bin)

## Sıradaki öğeyi doğru ya da yanlış kutuya bırakır.
func _debug_answer(correct: bool) -> void:
	var i: int = _next_item()
	if i < 0:
		return
	_drop(i, _target[i] if correct else (_target[i] + 1) % _bins.size())

static func validate_params(p: Dictionary) -> Array[String]:
	var errs: Array[String] = []
	var bins: Variant = p.get("bins")
	if not (bins is Array) or (bins as Array).size() < MIN_BINS or (bins as Array).size() > MAX_BINS:
		errs.append(ContentValidator.msg("err.params.sb_bins"))
		return errs
	var shapes: Dictionary = {}
	for b: Variant in bins as Array:
		if not (b is Dictionary) or not Token.is_valid((b as Dictionary).get("label")):
			errs.append(ContentValidator.msg("err.params.sb_bins"))
			return errs
		var bin: Dictionary = b as Dictionary
		var shape: Variant = bin.get("shape")
		if not (shape is String) or not Widgets.SHAPES.has(shape as String) or shapes.has(shape):
			errs.append(ContentValidator.msg("err.params.sb_bin_shape"))
			return errs
		shapes[shape] = true
		if bin.has("color") and not (bin["color"] is String and Widgets.COLORS.has(bin["color"] as String)):
			errs.append(ContentValidator.msg("err.params.sb_bin_color"))
			return errs
	var items: Variant = p.get("items")
	if not (items is Array) or (items as Array).size() < MIN_ITEMS or (items as Array).size() > MAX_ITEMS:
		errs.append(ContentValidator.msg("err.params.sb_items"))
		return errs
	var list: Array = items as Array
	var used: Dictionary = {}
	for it: Variant in list:
		if not (it is Dictionary) or not Token.is_valid((it as Dictionary).get("token")):
			errs.append(ContentValidator.msg("err.params.token", {"field": "items"}))
			return errs
		var bin_index: Variant = (it as Dictionary).get("bin")
		if not ContentValidator.is_int_like(bin_index) or int(bin_index) < 0 or int(bin_index) >= (bins as Array).size():
			errs.append(ContentValidator.msg("err.params.sb_item_bin"))
			return errs
		used[int(bin_index)] = true
	for i: int in list.size():
		for j: int in range(i + 1, list.size()):
			if Token.same((list[i] as Dictionary)["token"] as Dictionary, (list[j] as Dictionary)["token"] as Dictionary):
				errs.append(ContentValidator.msg("err.params.sb_items_dup"))
				return errs
	if used.size() < (bins as Array).size():
		errs.append(ContentValidator.msg("err.params.sb_bin_empty"))
	return errs
