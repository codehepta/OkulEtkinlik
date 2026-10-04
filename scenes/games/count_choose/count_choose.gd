extends MiniGame
## Say ve seç: ekranda `count` adet nesne vardır, çocuk doğru sayıyı seçer.
## Tahmin modu (`estimates` verilirse, Faz 3b): önce aralıklı bir tahmin seçilir (doğru/yanlış
## sayılmaz), sonra nesnelere tek tek dokunarak sayılır (kontrol), en sonda tahminin sonuca
## "yakın" mı "uzak" mı olduğu seçilir (MAT.1.1.7, 2.1.6, 3.1.8).

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

const Widgets: GDScript = preload("res://scenes/games/game_widgets.gd")
const EstimateFlow: GDScript = preload("res://scenes/games/estimate_flow.gd")
const Estimate: GDScript = preload("res://scripts/core/estimate.gd")
const MAX_COUNT: int = 20
## Tahmin modu yerleşimi: alt sırada tahmin / sayaç / yargı kartları.
const ESTIMATE_TILE: Vector2 = Vector2(260, 180)
const SLOT_LEFT: Rect2 = Rect2(300, 716, 260, 180)
const SLOT_RIGHT: Rect2 = Rect2(1360, 716, 260, 180)
const BADGE_SIZE: Vector2 = Vector2(64, 64)
const DIFF_RECT: Rect2 = Rect2(885, 560, 150, 130)

var _count: int = 0
var _choices: Array[int] = []
var _items: Array[Control] = []
var _tiles: Array[Control] = []
var _hint_gen: int = 0
# Tahmin modu
## "" (normal), "estimate", "check" ya da "judge".
var _phase: String = ""
var _estimates: Array[int] = []
var _estimate_views: Array[Control] = []
var _estimate: int = -1
var _tol: int = 1
var _counted: Array[bool] = []
var _counted_n: int = 0
var _counter: Control = null
var _judge_views: Array[Control] = []
var _judge_correct: int = -1
var _diff_tile: Control = null

func setup(params: Dictionary, difficulty_value: int, context: RoundContext) -> void:
	_init_round(difficulty_value, context)
	_count = int(params["count"])
	_choices.clear()
	add_child(ClayStyle.make_panel(ClayStyle.tray_box(0.8), TRAY_RECT))
	if params.has("estimates"):
		_setup_estimate(params)
		return
	for c: Variant in params["choices"] as Array:
		_choices.append(int(c))
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
## Tahmin modunda nesneler hep dağınıktır (tahmin onluk dizilişle kolaylaşmasın, sayarken
## her nesne ayrı dokunma hedefi olsun).
func is_grouped_by_ten() -> bool:
	return _count > GROUP_SIZE and _phase == ""

# ================= Tahmin modu =================

func _setup_estimate(params: Dictionary) -> void:
	_phase = "estimate"
	for e: Variant in params["estimates"] as Array:
		_estimates.append(int(e))
	_tol = int(params["near"]) if params.has("near") else Estimate.tolerance(_count)
	_build_items(str(params["item"]))
	for i: int in _items.size():
		_counted.append(false)
		_items[i].gui_input.connect(_on_item_input.bind(i))
	_estimate_views = EstimateFlow.make_estimate_row(self, _estimates, CHOICE_Y, ESTIMATE_TILE, CHOICE_GAP)
	for i: int in _estimate_views.size():
		_estimate_views[i].gui_input.connect(_on_estimate_input.bind(i))

func _on_estimate_input(event: InputEvent, index: int) -> void:
	if is_press(event):
		_pick_estimate(index)

## Tahmin seçilir (cevap sayılmaz): seçilen karo sol yuvaya geçer, diğerleri kalkar, sayma başlar.
func _pick_estimate(index: int, forced: bool = false) -> void:
	if _phase != "estimate" or not (forced or _can_input()) or index < 0 or index >= _estimates.size():
		return
	_tap_feedback(_estimate_views[index])
	_estimate = _estimates[index]
	for i: int in _estimate_views.size():
		if i != index:
			_estimate_views[i].queue_free()
	var chosen: Control = _estimate_views[index]
	chosen.mouse_filter = Control.MOUSE_FILTER_IGNORE
	chosen.position = SLOT_LEFT.position
	chosen.size = SLOT_LEFT.size
	_estimate_views = [chosen]
	_counter = Widgets.make_tile(self, "0", SLOT_RIGHT, 96, EstimateFlow.RESULT_COLOR)
	_counter.name = "Counter"
	_counter.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_phase = "check"
	for img: Control in _items:
		img.mouse_filter = Control.MOUSE_FILTER_STOP
	narrator.say(EstimateFlow.VOICE_COUNT)

func _on_item_input(event: InputEvent, index: int) -> void:
	if is_press(event):
		_tap_item(index)

## Kontrol: dokunulan nesneye sıra numarası rozeti konur, sayı okunur; hepsi sayılınca yargı.
func _tap_item(index: int) -> void:
	if _phase != "check" or _busy or _done or index < 0 or index >= _items.size() or _counted[index]:
		return
	_mark_counted(index)
	if _counted_n == _count:
		_start_judge()

func _mark_counted(index: int) -> void:
	_counted[index] = true
	_counted_n += 1
	var img: Control = _items[index]
	_tap_feedback(img)
	var badge: Control = Widgets.make_tile(self, str(_counted_n), Rect2(img.position + Vector2(img.size.x - BADGE_SIZE.x * 0.7, -BADGE_SIZE.y * 0.3), BADGE_SIZE), 40, ClayStyle.IVORY)
	badge.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_counter.set("text", str(_counted_n))
	if _counted_n <= MAX_VOICED_COUNT:
		narrator.say("vo.sayi.%d" % _counted_n)

func _start_judge() -> void:
	_phase = "judge"
	for img: Control in _items:
		img.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_judge_correct = Estimate.judge_index(_estimate, _count, _tol)
	_judge_views = EstimateFlow.make_judge_cards(self, BASE_SIZE.x / 2.0, SLOT_LEFT.position.y - 5.0)
	for i: int in _judge_views.size():
		_judge_views[i].gui_input.connect(_on_tile_input.bind(i))
	narrator.say(EstimateFlow.VOICE_JUDGE)

## Test için: tahmin karosuna dokunma.
func _debug_estimate(index: int) -> void:
	_pick_estimate(index)

## Test için: nesneye (sayma) dokunma.
func _debug_tap_item(index: int) -> void:
	_tap_item(index)

func phase() -> String:
	return _phase

func item_total() -> int:
	return _items.size()

func counted() -> int:
	return _counted_n

func diff_hint() -> int:
	return int(str(_diff_tile.get("text"))) if _diff_tile != null else -1

func touch_targets() -> Array[Control]:
	match _phase:
		"estimate":
			return _estimate_views.duplicate()
		"check":
			return _items.duplicate()
		"judge":
			return _judge_views.duplicate()
	return _tiles.duplicate()

## Tahmin modunda bir sonraki adıma kadar ilerletir (tahmin + sayma), yargıda bekler.
func _fast_forward() -> void:
	if _phase == "estimate":
		_pick_estimate(_estimates.size() / 2, true)
	if _phase == "check":
		for i: int in _items.size():
			if not _counted[i]:
				_mark_counted(i)
		_start_judge()

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
## Tahmin modunun yargı adımında doğru kartın indeksi.
func _debug_correct_index() -> int:
	if _phase != "":
		return _judge_correct
	return _choices.find(_count)

## Test için: bir sonraki cevabı doğru ya da yanlış verir (tahmin modunda önce ilerletir).
func _debug_answer(correct: bool) -> void:
	if _phase != "":
		_fast_forward()
	var right: int = _debug_correct_index()
	_choose(right if correct else (0 if right != 0 else 1))

func _choose(index: int) -> void:
	if _phase != "":
		if _phase != "judge" or not _can_input() or index < 0 or index >= _judge_views.size():
			return
		_tap_feedback(_judge_views[index])
		_submit_answer(index == _judge_correct)
		return
	if not _can_input() or index < 0 or index >= _choices.size():
		return
	_tap_feedback(_tiles[index])
	_submit_answer(_choices[index] == _count)

func show_hint(level: int) -> void:
	if _done or _busy:
		return
	if level == 1:
		if _phase == "judge":
			_hint_diff()
		elif _phase == "check":
			for i: int in _items.size():
				if not _counted[i]:
					_glow(_items[i])
					break
		elif _phase == "":
			_hint_count_aloud()
	elif level >= 2:
		_solve()

## Tahmin modu ipucu 1: tahmin ile sonucun farkı kartların üstünde gösterilir.
func _hint_diff() -> void:
	if _diff_tile != null:
		return
	_diff_tile = EstimateFlow.make_diff_tile(self, _estimate, _count, DIFF_RECT)
	_glow(_diff_tile)

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
	if _phase != "":
		_fast_forward()
	var idx: int = _debug_correct_index()
	_glow(_judge_views[idx] if _phase != "" else _tiles[idx])
	await _wait(0.6)
	_busy = false
	if _done:
		return
	_submit_answer(true)

static func validate_params(p: Dictionary) -> Array[String]:
	var errs: Array[String] = []
	if not (p.get("item") is String) or (p["item"] as String).is_empty():
		errs.append(ContentValidator.msg("err.params.item"))
	var count_ok: bool = ContentValidator.is_int_like(p.get("count")) and int(p["count"]) >= 1 and int(p["count"]) <= MAX_COUNT
	if not count_ok:
		errs.append(ContentValidator.msg("err.params.count"))
	if p.has("estimates"):
		errs.append_array(_validate_estimate(p, int(p["count"]) if count_ok else -1))
		return errs
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

## Tahmin modu: `estimates` 2–4 artan tekrarsız sayı; `near` (isteğe bağlı) ≥ 1; seçenekler
## arasında hem yakın hem uzak tahmin bulunmalı (yoksa yargı sorusu hep aynı cevaplı olur).
static func _validate_estimate(p: Dictionary, count: int) -> Array[String]:
	var errs: Array[String] = []
	if not Estimate.valid_estimates(p.get("estimates"), MAX_COUNT * 5):
		errs.append(ContentValidator.msg("err.params.est_values"))
		return errs
	if p.has("near") and not (ContentValidator.is_int_like(p["near"]) and int(p["near"]) >= 1):
		errs.append(ContentValidator.msg("err.params.est_near"))
		return errs
	if count < 0:
		return errs
	var tol: int = int(p["near"]) if p.has("near") else Estimate.tolerance(count)
	if not Estimate.both_judgements_possible(p["estimates"] as Array, count, tol):
		errs.append(ContentValidator.msg("err.params.est_judgement"))
	return errs
