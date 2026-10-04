extends MiniGame
## Say ve seç: ekranda `count` adet nesne vardır, çocuk doğru sayıyı seçer.

const CLAY_TILE: PackedScene = preload("res://scenes/components/clay_tile.tscn")
const ASSET_IMAGE: PackedScene = preload("res://scenes/components/asset_image.tscn")
## Sayma tepsisi: nesneler bunun içinde düzenli-dağınık durur.
const TRAY_RECT: Rect2 = Rect2(300, 172, 1320, 508)
const ITEM_AREA: Rect2 = Rect2(336, 208, 1248, 436)
## Nesne boyu sayıya göre küçülür; az nesne büyük ve ortada toplu durur.
const ITEM_SIZES: Array[Vector2i] = [Vector2i(5, 230), Vector2i(8, 195), Vector2i(12, 165), Vector2i(15, 145)]
const ITEM_SIZE_MIN: float = 128.0
## Hücre, nesne boyunun en çok bu katı olur (az nesnede ızgara ortada toplanır).
const CELL_MAX_RATIO: float = 1.45
const JITTER_RATIO: float = 0.6
const CHOICE_SIZE: Vector2 = Vector2(240, 180)
const CHOICE_GAP: float = 60.0
const CHOICE_Y: float = 716.0
const CHOICE_FONT_SIZE: int = 108
const HINT_STEP_SECONDS: float = 0.9
const MAX_VOICED_COUNT: int = 20
## 10'dan çok nesne onluk + birlik olarak dizilir (MAT.1.1.2): üstte 10'luk sıra, altında kalanlar.
const GROUP_SIZE: int = 10
## Onluk / birlik şeritleri: tepsi içinde iki ayrı açık kil şerit.
const GROUP_ROW_GAP: float = 52.0
const GROUP_STRIP_PAD: float = 14.0
const GROUP_ITEM_RATIO: float = 0.92
## Onluk şeridi tepsinin neredeyse tam genişliğini kullanır (nesneler büyük kalsın).
const GROUP_AREA: Rect2 = Rect2(320, 208, 1280, 436)

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
	add_child(ClayStyle.make_panel(ClayStyle.tray_box(0.8), TRAY_RECT))
	if is_grouped_by_ten():
		_build_ten_groups(str(params["item"]))
	else:
		_build_items(str(params["item"]))
	_build_choices()

static func item_size_for(count: int) -> Vector2:
	for step: Vector2i in ITEM_SIZES:
		if count <= step.x:
			return Vector2(step.y, step.y)
	return Vector2(ITEM_SIZE_MIN, ITEM_SIZE_MIN)

## 11–20 nesne onluk ve birlik bloklarına ayrılır; daha azı tepside düzenli-dağınık durur.
func is_grouped_by_ten() -> bool:
	return _count > GROUP_SIZE

## Nesnelerin ekrandaki dikdörtgenleri (sayma sırasıyla; test ve yerleşim denetimi için).
func item_rects() -> Array[Rect2]:
	var out: Array[Rect2] = []
	for img: Control in _items:
		out.append(Rect2(img.position, img.size))
	return out

## Onluk + birlik: üst şeritte 10 nesne yan yana, alt şeritte kalanlar aynı sütunlarda.
## İki şerit ayrı kil zeminlidir; nesneler eğilmez, sayma sırası soldan sağa, önce onluk.
func _build_ten_groups(item_key: String) -> void:
	var cell: float = GROUP_AREA.size.x / float(GROUP_SIZE)
	var item: float = minf(cell * GROUP_ITEM_RATIO, (GROUP_AREA.size.y - GROUP_ROW_GAP) / 2.0 - GROUP_STRIP_PAD * 2.0)
	var row_h: float = item + GROUP_STRIP_PAD * 2.0
	var top: float = GROUP_AREA.get_center().y - (row_h * 2.0 + GROUP_ROW_GAP) / 2.0
	var rest: int = _count - GROUP_SIZE
	var counts: Array[int] = [GROUP_SIZE, rest]
	for r: int in 2:
		var y: float = top + r * (row_h + GROUP_ROW_GAP)
		var strip_w: float = counts[r] * cell
		add_child(ClayStyle.make_panel(ClayStyle.plaque_box(ClayStyle.IVORY, ClayStyle.CREAM.darkened(0.18), int(row_h / 2.0), 4, 4, 0),
			Rect2(GROUP_AREA.position.x, y, strip_w, row_h)))
		for k: int in counts[r]:
			var center: Vector2 = Vector2(GROUP_AREA.position.x + (k + 0.5) * cell, y + row_h / 2.0)
			var img: Control = ASSET_IMAGE.instantiate() as Control
			img.set("key", item_key)
			img.set("min_side", 0.0)
			img.mouse_filter = Control.MOUSE_FILTER_IGNORE
			add_child(img)
			img.custom_minimum_size = Vector2(item, item)
			img.size = Vector2(item, item)
			img.position = center - img.size / 2.0
			img.pivot_offset = img.size / 2.0
			_items.append(img)

## Nesneleri ızgara hücrelerine rng ile dağıtır; her nesne kendi hücresinde olduğu için çakışmaz.
## Izgara tepsinin ortasına toplanır; hücre nesneden çok büyük olmaz.
func _build_items(item_key: String) -> void:
	var item_size: Vector2 = item_size_for(_count)
	var cols: int = mini(ceili(sqrt(float(_count) * ITEM_AREA.size.x / ITEM_AREA.size.y)), _count)
	var rows: int = ceili(float(_count) / float(cols))
	# Boş hücreyi azalt: satır sayısına göre sütunu yeniden dengele.
	cols = ceili(float(_count) / float(rows))
	var cell: Vector2 = Vector2(ITEM_AREA.size.x / cols, ITEM_AREA.size.y / rows)
	cell = cell.min(item_size * CELL_MAX_RATIO)
	# Sığmazsa nesne hücreye göre küçülür.
	item_size = item_size.min(Vector2.ONE * minf(cell.x, cell.y))
	var grid_origin: Vector2 = ITEM_AREA.get_center() - Vector2(cols, rows) * cell / 2.0
	var slots: Array[int] = []
	for i: int in cols * rows:
		slots.append(i)
	_shuffle(slots)
	var jitter: Vector2 = ((cell - item_size) / 2.0).max(Vector2.ZERO) * JITTER_RATIO
	for n: int in _count:
		var slot: int = slots[n]
		var center: Vector2 = grid_origin + Vector2((slot % cols) + 0.5, (slot / cols) + 0.5) * cell
		center += Vector2(ctx.rng.randf_range(-1.0, 1.0) * jitter.x, ctx.rng.randf_range(-1.0, 1.0) * jitter.y)
		var img: Control = ASSET_IMAGE.instantiate() as Control
		img.set("key", item_key)
		img.mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(img)
		img.size = item_size
		img.position = center - item_size / 2.0
		img.pivot_offset = item_size / 2.0
		img.rotation_degrees = ctx.rng.randf_range(-8.0, 8.0)
		_items.append(img)

func _build_choices() -> void:
	var total_w: float = _choices.size() * CHOICE_SIZE.x + (_choices.size() - 1) * CHOICE_GAP
	var x: float = (BASE_SIZE.x - total_w) / 2.0
	for i: int in _choices.size():
		var tile: Control = CLAY_TILE.instantiate() as Control
		tile.set("text", str(_choices[i]))
		add_child(tile)
		tile.set("font_size", CHOICE_FONT_SIZE)
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

## Test için: kurulumdaki `count` ile `choices`'tan türetilen doğru seçenek indeksi.
func _debug_correct_index() -> int:
	return _choices.find(_count)

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
