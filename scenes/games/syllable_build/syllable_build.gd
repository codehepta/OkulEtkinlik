extends MiniGame
## Hece kur: üstte (varsa) kelimenin görseli ve boş yuvalar, altta karışık hece ya da harf
## karoları. Çocuk karoya dokunur: karo sıradaki yuvanın parçasıysa yuvaya uçar ve oturur
## (`answered(true)`), değilse hafifçe sallanıp yerinde kalır (`answered(false)`).
## Bütün yuvalar dolunca kelime bütün olarak gösterilir ve (varsa) kelimenin sesi okunur.
## Aynı parça birden çok kez geçebilir ("ba" + "ba"); eşleşme metinle yapılır.

const Widgets: GDScript = preload("res://scenes/games/game_widgets.gd")
const ASSET_IMAGE: PackedScene = preload("res://scenes/components/asset_image.tscn")
const MIN_PARTS: int = 2
const MAX_PARTS: int = 5
const MAX_DISTRACTORS: int = 3
const MAX_PART_LENGTH: int = 4
## Türkçe küçük ve büyük harfler (yalnızca bunlardan oluşan parçalar kabul edilir).
const LETTERS: String = "abcçdefgğhıijklmnoöprsştuüvyzABCÇDEFGĞHIİJKLMNOÖPRSŞTUÜVYZ"
const TILE_H: float = 190.0
const TILE_MIN_W: float = 180.0
const TILE_CHAR_W: float = 56.0
const TILE_GAP: float = 28.0
## Karo sırası ekrana sığmalı (1080p tabanında).
const MAX_ROW_WIDTH: float = 1820.0
const SLOT_Y: float = 400.0
const SLOT_GAP: float = 18.0
const TILE_Y: float = 700.0
const TRAY_MARGIN: float = 30.0
const PICTURE_SIZE: float = 230.0
const PICTURE_Y: float = 150.0
const FONT_SIZE: int = 96
const TILE_COLOR: Color = ClayStyle.PEACH
const PLACED_COLOR: Color = ClayStyle.MINT
const AUTO_STEP_SECONDS: float = 0.35

var _parts: Array[String] = []
var _labels: Array[String] = []
## Karo i'nin doğru yuvası (çeldirici: -1). Aynı metinli parçalardan hangisinin hangi
## yuvaya gideceği yalnızca görsel başlangıç içindir; eşleşme metinle yapılır.
var _tiles: Array[Control] = []
var _tile_home: Array[Vector2] = []
var _tile_used: Array[bool] = []
var _slots: Array[Control] = []
var _filled: int = 0
var _word_voice: String = ""
var _picture: Control = null

func setup(params: Dictionary, difficulty_value: int, context: RoundContext) -> void:
	_init_round(difficulty_value, context)
	_parts.assign(params["parts"] as Array)
	_word_voice = str(params.get("voice", ""))
	var distractors: Array[String] = []
	distractors.assign(params.get("distractors", []) as Array)
	var shown: int = distractors_shown(distractors.size(), difficulty)
	_labels = _parts.duplicate()
	for i: int in shown:
		_labels.append(distractors[i])
	var item: String = str(params.get("item", ""))
	if item != "":
		_picture = ASSET_IMAGE.instantiate() as Control
		_picture.set("key", item)
		_picture.mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(_picture)
		_picture.size = Vector2(PICTURE_SIZE, PICTURE_SIZE)
		_picture.position = Vector2((BASE_SIZE.x - PICTURE_SIZE) / 2.0, PICTURE_Y)
	_build_slots(item != "")
	_build_tiles()

## Zorluğa göre görünen çeldirici sayısı: 1 → yok, 2 → en çok 1, 3 → hepsi.
static func distractors_shown(available: int, difficulty_value: int) -> int:
	if difficulty_value <= 1:
		return 0
	if difficulty_value == 2:
		return mini(available, 1)
	return mini(available, MAX_DISTRACTORS)

static func tile_width(label: String) -> float:
	return maxf(TILE_MIN_W, label.length() * TILE_CHAR_W + 70.0)

func _build_slots(has_picture: bool) -> void:
	var y: float = SLOT_Y if has_picture else SLOT_Y - 120.0
	var total: float = 0.0
	for p: String in _parts:
		total += tile_width(p)
	total += SLOT_GAP * (_parts.size() - 1)
	var x: float = (BASE_SIZE.x - total) / 2.0
	add_child(ClayStyle.make_panel(ClayStyle.tray_box(0.72),
		Rect2(x - TRAY_MARGIN, y - TRAY_MARGIN, total + TRAY_MARGIN * 2.0, TILE_H + TRAY_MARGIN * 2.0)))
	for p: String in _parts:
		var w: float = tile_width(p)
		var slot: Control = Control.new()
		slot.mouse_filter = Control.MOUSE_FILTER_IGNORE
		slot.position = Vector2(x, y)
		slot.size = Vector2(w, TILE_H)
		slot.pivot_offset = slot.size / 2.0
		slot.draw.connect(func() -> void: Widgets.draw_well(slot, Rect2(Vector2(6, 6), slot.size - Vector2(12, 12))))
		add_child(slot)
		_slots.append(slot)
		x += w + SLOT_GAP

func _build_tiles() -> void:
	var order: Array = []
	for i: int in _labels.size():
		order.append(i)
	Widgets.shuffle(order, ctx.rng)
	# Karışım doğru sırayla aynı çıkarsa bir kaydır (kelime hazır görünmesin).
	var straight: bool = true
	for k: int in mini(order.size(), _parts.size()):
		if _labels[int(order[k])] != _parts[k]:
			straight = false
	if straight and order.size() > 1:
		order.push_back(order.pop_front())
	var total: float = 0.0
	for i: int in order:
		total += tile_width(_labels[i])
	total += TILE_GAP * (order.size() - 1)
	var x: float = (BASE_SIZE.x - total) / 2.0
	add_child(ClayStyle.make_panel(ClayStyle.tray_box(0.6),
		Rect2(x - TRAY_MARGIN, TILE_Y - TRAY_MARGIN, total + TRAY_MARGIN * 2.0, TILE_H + TRAY_MARGIN * 2.0)))
	_tiles.resize(_labels.size())
	_tile_home.resize(_labels.size())
	for i: int in _labels.size():
		_tile_used.append(false)
	for i: int in order:
		var w: float = tile_width(_labels[i])
		var home: Vector2 = Vector2(x, TILE_Y)
		var tile: Control = Widgets.make_tile(self, _labels[i], Rect2(home, Vector2(w, TILE_H)), FONT_SIZE, TILE_COLOR)
		tile.name = "Tile%d" % i
		tile.gui_input.connect(_on_tile_input.bind(i))
		_tiles[i] = tile
		_tile_home[i] = home
		x += w + TILE_GAP

func _on_tile_input(event: InputEvent, index: int) -> void:
	if is_press(event):
		_choose(index)

## Sıradaki yuvaya ait (henüz kullanılmamış) bir karo.
func _correct_tile() -> int:
	if _filled >= _parts.size():
		return -1
	for i: int in _labels.size():
		if not _tile_used[i] and _labels[i] == _parts[_filled]:
			return i
	return -1

func _choose(index: int) -> void:
	if not _can_input() or index < 0 or index >= _tiles.size() or _tile_used[index]:
		return
	_tap_feedback(_tiles[index])
	if _labels[index] == _parts[_filled]:
		_place(index)
		_submit_answer(true, _filled >= _parts.size())
		if _filled >= _parts.size():
			_on_word_done()
	else:
		_wiggle(_tiles[index])
		_submit_answer(false, false)

func _place(index: int) -> void:
	_tile_used[index] = true
	var tile: Control = _tiles[index]
	tile.mouse_filter = Control.MOUSE_FILTER_IGNORE
	tile.set("clay_color", PLACED_COLOR)
	var slot: Control = _slots[_filled]
	_filled += 1
	audio.play_sfx("sfx.drop")
	tile.move_to_front()
	if _reduce_motion() or not is_inside_tree():
		tile.position = slot.position
		return
	var tw: Tween = tile.create_tween()
	tw.tween_property(tile, "position", slot.position, 0.18).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)

## Kelime tamam: karolar hafifçe zıplar, kelimenin sesi okunur (övgü satırından sonra).
func _on_word_done() -> void:
	if _word_voice == "":
		return
	await _wait(CORRECT_LOCK_SECONDS * 0.5)
	narrator.say(_word_voice)

func _wiggle(c: Control) -> void:
	if _reduce_motion() or not is_inside_tree():
		return
	var home: Vector2 = c.position
	var tw: Tween = c.create_tween()
	for dx: float in [14.0, -14.0, 8.0, 0.0]:
		tw.tween_property(c, "position", home + Vector2(dx, 0), 0.06)

func filled_count() -> int:
	return _filled

func tile_count() -> int:
	return _tiles.size()

## Yuvalara yerleşmiş karoların metni (soldan sağa).
func built_word() -> String:
	var s: String = ""
	for i: int in _filled:
		s += _parts[i]
	return s

func slot_views() -> Array[Control]:
	return _slots.duplicate()

func touch_targets() -> Array[Control]:
	var res: Array[Control] = []
	for i: int in _tiles.size():
		if not _tile_used[i]:
			res.append(_tiles[i])
	return res

func show_hint(level: int) -> void:
	if _done or _busy:
		return
	var i: int = _correct_tile()
	if i < 0:
		return
	if level == 1:
		_glow(_slots[_filled])
		_glow(_tiles[i])
	elif level >= 2:
		_auto_complete()

## İpucu 2: kalan parçalar soldan sağa sırayla yerine oturur.
func _auto_complete() -> void:
	_busy = true
	helped = true
	while not _done:
		var i: int = _correct_tile()
		if i < 0:
			break
		_glow(_tiles[i])
		await _wait(AUTO_STEP_SECONDS)
		if _done:
			return
		_place(i)
		_submit_answer(true, _filled >= _parts.size())
		if _filled >= _parts.size():
			_on_word_done()
		await _wait(AUTO_STEP_SECONDS)
	_busy = false

# --- test kancaları ---

func _debug_choose(index: int) -> void:
	_choose(index)

func _debug_correct_index() -> int:
	return _correct_tile()

## Test için: sıradaki yuvaya ait olmayan, kullanılmamış bir karo (yoksa -1).
func _debug_wrong_index() -> int:
	if _filled >= _parts.size():
		return -1
	for i: int in _labels.size():
		if not _tile_used[i] and _labels[i] != _parts[_filled]:
			return i
	return -1

func _debug_answer(correct: bool) -> void:
	var i: int = _correct_tile() if correct else _debug_wrong_index()
	if i >= 0:
		_choose(i)

static func is_letters(s: String) -> bool:
	if s.is_empty():
		return false
	for ch: String in s:
		if not LETTERS.contains(ch):
			return false
	return true

static func validate_params(p: Dictionary) -> Array[String]:
	var errs: Array[String] = []
	var parts: Variant = p.get("parts")
	if not (parts is Array) or (parts as Array).size() < MIN_PARTS or (parts as Array).size() > MAX_PARTS:
		errs.append(ContentValidator.msg("err.params.sb_parts"))
		return errs
	for s: Variant in parts as Array:
		if not (s is String) or not is_letters(s as String) or (s as String).length() > MAX_PART_LENGTH:
			errs.append(ContentValidator.msg("err.params.sb_parts"))
			return errs
	var d: Variant = p.get("distractors", [])
	if not (d is Array) or (d as Array).size() > MAX_DISTRACTORS:
		errs.append(ContentValidator.msg("err.params.sb_distractors"))
		return errs
	var seen: Dictionary = {}
	for s: Variant in d as Array:
		if not (s is String) or not is_letters(s as String) or (s as String).length() > MAX_PART_LENGTH \
				or (parts as Array).has(s) or seen.has(s):
			errs.append(ContentValidator.msg("err.params.sb_distractors"))
			return errs
		seen[s] = true
	var row: float = TILE_GAP * ((parts as Array).size() + (d as Array).size() - 1)
	for s: Variant in (parts as Array) + (d as Array):
		row += tile_width(s as String)
	if row > MAX_ROW_WIDTH:
		errs.append(ContentValidator.msg("err.params.sb_width"))
	if p.has("item") and (not (p["item"] is String) or (p["item"] as String).is_empty()):
		errs.append(ContentValidator.msg("err.params.item"))
	if p.has("voice") and (not (p["voice"] is String) or (p["voice"] as String).is_empty()):
		errs.append(ContentValidator.msg("err.params.voice"))
	return errs
