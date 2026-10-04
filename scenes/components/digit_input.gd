extends Control
## Rakam karosu girişi (Faz 3b): 2–3. sınıfta çok basamaklı sayı yazmak için iz sürme yerine
## kullanılır (MAT.2.1.1 c, MAT.3.1.1 c). Üstte basamak sayısı kadar kesik kenarlı yuva, altta
## 0–9 kil rakam karoları (2 × 5). Karoya dokunmak sıradaki boş yuvayı doldurur; dolu yuvaya
## dokunmak o yuvayı boşaltır. Cevabı şablon kendi onay düğmesiyle denetler; bu bileşen cevap
## saymaz, yalnızca `changed` yayar. Paylaşılan tip değil, şablonlar `preload` ile kullanır.

signal changed

const Widgets: GDScript = preload("res://scenes/games/game_widgets.gd")
const KEY_SIZE: Vector2 = Vector2(128, 128)
const KEY_GAP: float = 18.0
const KEYS_PER_ROW: int = 5
const SLOT_SIZE: Vector2 = Vector2(136, 160)
const SLOT_GAP: float = 22.0
const KEY_FONT: int = 84
const SLOT_FONT: int = 100
const MAX_DIGITS: int = 4
const KEY_COLOR: Color = ClayStyle.PEACH
const SLOT_COLOR: Color = ClayStyle.IVORY

var _digits: Array[int] = []
var _slots: Array[Control] = []
var _slot_tiles: Array[Control] = []
var _keys: Array[Control] = []
## Girdi kapalıyken dokunmalar yok sayılır (şablonun kilidi).
var can_input: Callable = func() -> bool: return true
var audio: Node = null

## digits: yuva sayısı (1–4). slots_center / keys_center: ekran (1920×1080) koordinatları.
func build(digits: int, slots_center: Vector2, keys_center: Vector2) -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	size = MiniGame.BASE_SIZE
	var n: int = clampi(digits, 1, MAX_DIGITS)
	var sw: float = n * SLOT_SIZE.x + (n - 1) * SLOT_GAP
	for i: int in n:
		_digits.append(-1)
		var slot: Control = Control.new()
		slot.name = "Slot%d" % i
		slot.position = Vector2(slots_center.x - sw / 2.0 + i * (SLOT_SIZE.x + SLOT_GAP), slots_center.y - SLOT_SIZE.y / 2.0)
		slot.size = SLOT_SIZE
		slot.draw.connect(func() -> void: Widgets.draw_well(slot, Rect2(Vector2(4, 4), slot.size - Vector2(8, 8))))
		slot.gui_input.connect(_on_slot_input.bind(i))
		add_child(slot)
		_slots.append(slot)
		_slot_tiles.append(null)
	var kw: float = KEYS_PER_ROW * KEY_SIZE.x + (KEYS_PER_ROW - 1) * KEY_GAP
	var kh: float = 2.0 * KEY_SIZE.y + KEY_GAP
	for d: int in 10:
		# Sıra: 1 2 3 4 5 / 6 7 8 9 0
		var pos_index: int = 9 if d == 0 else d - 1
		var col: int = pos_index % KEYS_PER_ROW
		var row: int = pos_index / KEYS_PER_ROW
		var rect: Rect2 = Rect2(Vector2(keys_center.x - kw / 2.0 + col * (KEY_SIZE.x + KEY_GAP), keys_center.y - kh / 2.0 + row * (KEY_SIZE.y + KEY_GAP)), KEY_SIZE)
		var key: Control = Widgets.make_tile(self, str(d), rect, KEY_FONT, KEY_COLOR)
		key.name = "Key%d" % d
		key.gui_input.connect(_on_key_input.bind(d))
		_keys.append(key)

func _on_key_input(event: InputEvent, d: int) -> void:
	if MiniGame.is_press(event):
		press_key(d)

func _on_slot_input(event: InputEvent, i: int) -> void:
	if MiniGame.is_press(event):
		clear_slot(i)

## Rakam karosu: sıradaki boş yuvaya yazılır (yuva yoksa yok sayılır).
func press_key(d: int) -> void:
	if not can_input.call() or d < 0 or d > 9:
		return
	var i: int = _digits.find(-1)
	if i < 0:
		return
	_feedback(_keys[d])
	_set_slot(i, d)
	changed.emit()

func clear_slot(i: int) -> void:
	if not can_input.call() or i < 0 or i >= _digits.size() or _digits[i] < 0:
		return
	_set_slot(i, -1)
	changed.emit()

func _set_slot(i: int, d: int) -> void:
	_digits[i] = d
	if _slot_tiles[i] != null:
		_slot_tiles[i].queue_free()
		_slot_tiles[i] = null
	if d >= 0:
		var t: Control = Widgets.make_tile(_slots[i], str(d), Rect2(Vector2.ZERO, SLOT_SIZE), SLOT_FONT, SLOT_COLOR)
		t.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_slot_tiles[i] = t

func _feedback(c: Control) -> void:
	if audio != null:
		audio.play_sfx("sfx.tap")

## Bütün yuvalar dolu mu?
func is_complete() -> bool:
	return not _digits.has(-1)

## Yazılan sayı; eksik yuva varsa -1.
func value() -> int:
	if not is_complete():
		return -1
	var v: int = 0
	for d: int in _digits:
		v = v * 10 + d
	return v

## Doğru sayıyı yuvalara yazar (ipucu 2).
func set_value(v: int) -> void:
	var s: String = str(v).pad_zeros(_digits.size())
	for i: int in _digits.size():
		_set_slot(i, int(s.substr(s.length() - _digits.size() + i, 1)))
	changed.emit()

## İpucu: hedef sayıyla uyuşmayan ilk yuva ve o yuvaya gereken rakam karosu (yuva/karo döner).
func first_mismatch(v: int) -> int:
	var s: String = str(v).pad_zeros(_digits.size())
	for i: int in _digits.size():
		if _digits[i] != int(s.substr(i, 1)):
			return i
	return -1

func digit_for(v: int, slot: int) -> int:
	return int(str(v).pad_zeros(_digits.size()).substr(slot, 1))

func slot_view(i: int) -> Control:
	return _slots[i]

func key_view(d: int) -> Control:
	return _keys[d]

func touch_targets() -> Array[Control]:
	var res: Array[Control] = []
	res.append_array(_keys)
	res.append_array(_slots)
	return res
