extends MiniGame
## Say ve seç: ekranda `count` adet nesne vardır, çocuk doğru sayıyı seçer.

const CLAY_TILE: PackedScene = preload("res://scenes/components/clay_tile.tscn")
const ASSET_IMAGE: PackedScene = preload("res://scenes/components/asset_image.tscn")
const ITEM_AREA: Rect2 = Rect2(160, 100, 1600, 520)
const ITEM_SIZE: Vector2 = Vector2(128, 128)
const CHOICE_SIZE: Vector2 = Vector2(240, 180)
const CHOICE_GAP: float = 60.0
const CHOICE_Y: float = 760.0
const HINT_STEP_SECONDS: float = 0.9
const MAX_VOICED_COUNT: int = 20

var _count: int = 0
var _choices: Array[int] = []
var _items: Array[Control] = []
var _tiles: Array[Control] = []
var _hint_gen: int = 0

func setup(params: Dictionary, difficulty_value: int, context: RoundContext) -> void:
	_init_round(difficulty_value, context)
	_count = int(params["count"])
	_choices.clear()
	for c: Variant in params["choices"] as Array:
		_choices.append(int(c))
	_build_items(str(params["item"]))
	_build_choices()

## Nesneleri ızgara hücrelerine rng ile dağıtır; her nesne kendi hücresinde olduğu için çakışmaz.
func _build_items(item_key: String) -> void:
	var cols: int = ceili(sqrt(float(_count) * ITEM_AREA.size.x / ITEM_AREA.size.y))
	var rows: int = ceili(float(_count) / float(cols))
	var cell: Vector2 = Vector2(ITEM_AREA.size.x / cols, ITEM_AREA.size.y / rows)
	var slots: Array[int] = []
	for i: int in cols * rows:
		slots.append(i)
	_shuffle(slots)
	var jitter: Vector2 = ((cell - ITEM_SIZE) / 2.0).max(Vector2.ZERO)
	for n: int in _count:
		var slot: int = slots[n]
		var center: Vector2 = ITEM_AREA.position + Vector2((slot % cols) + 0.5, (slot / cols) + 0.5) * cell
		center += Vector2(ctx.rng.randf_range(-1.0, 1.0) * jitter.x, ctx.rng.randf_range(-1.0, 1.0) * jitter.y)
		var img: Control = ASSET_IMAGE.instantiate() as Control
		img.set("key", item_key)
		img.mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(img)
		img.size = ITEM_SIZE
		img.position = center - ITEM_SIZE / 2.0
		img.pivot_offset = ITEM_SIZE / 2.0
		_items.append(img)

func _build_choices() -> void:
	var total_w: float = _choices.size() * CHOICE_SIZE.x + (_choices.size() - 1) * CHOICE_GAP
	var x: float = (BASE_SIZE.x - total_w) / 2.0
	for i: int in _choices.size():
		var tile: Control = CLAY_TILE.instantiate() as Control
		tile.set("text", str(_choices[i]))
		add_child(tile)
		tile.size = CHOICE_SIZE
		tile.position = Vector2(x + i * (CHOICE_SIZE.x + CHOICE_GAP), CHOICE_Y)
		tile.pivot_offset = CHOICE_SIZE / 2.0
		tile.gui_input.connect(_on_tile_input.bind(i))
		_tiles.append(tile)

func _shuffle(a: Array[int]) -> void:
	for i: int in range(a.size() - 1, 0, -1):
		var j: int = ctx.rng.randi_range(0, i)
		var t: int = a[i]
		a[i] = a[j]
		a[j] = t

func _on_tile_input(event: InputEvent, index: int) -> void:
	if is_press(event):
		_choose(index)

## Test için: gerçek dokunmayla aynı kod yolu.
func _debug_choose(index: int) -> void:
	_choose(index)

func _choose(index: int) -> void:
	if not _can_input() or index < 0 or index >= _choices.size():
		return
	_tap_feedback(_tiles[index])
	_submit_answer(_choices[index] == _count)

func show_hint(level: int) -> void:
	if _done or _busy:
		return
	if level == 1:
		_hint_count_aloud()
	elif level >= 2:
		_solve()

## İpucu 1: nesneler sırayla zıplar, vo.sayi.<n> okunur.
func _hint_count_aloud() -> void:
	_hint_gen += 1
	var gen: int = _hint_gen
	for i: int in _items.size():
		if gen != _hint_gen or _done:
			return
		if not _reduce_motion():
			var tw: Tween = _items[i].create_tween()
			tw.tween_property(_items[i], "scale", Vector2(1.25, 1.25), 0.2)
			tw.tween_property(_items[i], "scale", Vector2.ONE, 0.2)
		if i + 1 <= MAX_VOICED_COUNT:
			narrator.say("vo.sayi.%d" % (i + 1))
		await _wait(HINT_STEP_SECONDS)

## İpucu 2: doğru seçenek parlar ve otomatik seçilir.
func _solve() -> void:
	_hint_gen += 1
	_busy = true
	helped = true
	var idx: int = _choices.find(_count)
	_glow(_tiles[idx])
	await _wait(0.6)
	_busy = false
	if _done:
		return
	_submit_answer(true)

static func validate_params(p: Dictionary) -> Array[String]:
	var errs: Array[String] = []
	if not (p.get("item") is String) or (p["item"] as String).is_empty():
		errs.append(ContentValidator.msg("err.params.item"))
	var count_ok: bool = ContentValidator.is_int_like(p.get("count")) and int(p["count"]) >= 1 and int(p["count"]) <= 20
	if not count_ok:
		errs.append(ContentValidator.msg("err.params.count"))
	var choices: Variant = p.get("choices")
	var choices_ok: bool = choices is Array and (choices as Array).size() >= 2 and (choices as Array).size() <= 4
	if choices_ok:
		for c: Variant in choices:
			if not ContentValidator.is_int_like(c):
				choices_ok = false
	if not choices_ok:
		errs.append(ContentValidator.msg("err.params.choices"))
		return errs
	var seen: Dictionary = {}
	for c: Variant in choices:
		if seen.has(int(c)):
			errs.append(ContentValidator.msg("err.params.choices_dup"))
			break
		seen[int(c)] = true
	if count_ok and not seen.has(int(p["count"])):
		errs.append(ContentValidator.msg("err.params.choices_missing_count"))
	return errs
