extends MiniGame
## İz sür: dik temel harf ya da rakamı dört çizgili kâğıtta parmakla izleme.
## Soluk iz yolu her zaman görünür; sıradaki vuruşun başlangıcında numaralı nokta (ve kolay
## zorlukta yön oku) durur. Vuruş baştan sona izlenince yerine oturur (`answered(true)`).
## Yoldan çok uzaklaşmak ceza değildir: o vuruşun ilerlemesi korunur, bir yanlış sayılır ve
## şablon hemen yön ipucunu (kalemin vuruşu çizdiği canlandırma) oynatır.

const Widgets: GDScript = preload("res://scenes/games/game_widgets.gd")
const TracePath: GDScript = preload("res://scripts/core/trace_path.gd")
const ASSET_IMAGE: PackedScene = preload("res://scenes/components/asset_image.tscn")
const MAX_CHARS: int = 4
const BOARD_RECT: Rect2 = Rect2(150, 165, 1620, 770)
const BOARD_FILL: float = 0.9
const PICTURE_SIZE: float = 230.0
const PICTURE_POS: Vector2 = Vector2(40, 180)
## Zorluğa göre iz toleransı (glif birimi; 1 birim ≈ 180 px).
const TOLERANCE: Dictionary = {1: 0.34, 2: 0.27, 3: 0.21}
const PENCIL_KEY: String = "ui.trace_pencil"
const PAPER: Color = ClayStyle.IVORY
const LINE_COLOR: Color = Color(ClayStyle.COCOA, 0.28)
const BASE_COLOR: Color = Color(ClayStyle.COCOA, 0.5)
## Opak renkler (kâğıt rengiyle önceden karıştırılmış).
const GHOST: Color = Color(0.88, 0.79, 0.68)
const GHOST_FAINT: Color = Color(0.92, 0.85, 0.75)
const INK: Color = ClayStyle.TEAL
const FINGER: Color = Color(ClayStyle.COCOA, 0.35)
const START_COLOR: Color = ClayStyle.MINT
const DEMO_COLOR: Color = ClayStyle.HONEY
const DEMO_SECONDS: float = 1.1
const AUTO_STEP_SECONDS: float = 0.35

var _text: String = ""
var _strokes: Array[PackedVector2Array] = []
var _stroke: int = 0
var _tracker: RefCounted = null
var _tol: float = 0.3
## Glif birimi -> yerel piksel.
var _unit: float = 180.0
var _origin: Vector2 = Vector2.ZERO
var _board: Control = null
var _drawing: bool = false
var _last: Vector2 = Vector2.ZERO
var _finger: PackedVector2Array = PackedVector2Array()
## Kalem canlandırması: oynatılan vuruş ve 0..1 konum (-1: kapalı).
var _demo_stroke: int = -1
var _demo_t: float = -1.0
var _demo_gen: int = 0
var _start_pulse: float = 0.0
var _pencil: Texture2D = null

func setup(params: Dictionary, difficulty_value: int, context: RoundContext) -> void:
	_init_round(difficulty_value, context)
	_text = str(params["chars"])
	_tol = float(TOLERANCE.get(clampi(difficulty, 1, 3), 0.27))
	var lay: Dictionary = TracePath.layout(_text)
	_strokes.assign(lay["strokes"] as Array)
	var bounds: Rect2 = lay["bounds"]
	var area: Rect2 = BOARD_RECT.grow(-BOARD_RECT.size.y * (1.0 - BOARD_FILL) / 2.0)
	_unit = minf(area.size.y / bounds.size.y, area.size.x / maxf(bounds.size.x, 1.0))
	var used: Vector2 = Vector2(bounds.size.x, bounds.size.y) * _unit
	var top_left: Vector2 = BOARD_RECT.get_center() - used / 2.0
	_origin = top_left - bounds.position * _unit
	_pencil = AssetRegistry.texture(PENCIL_KEY)
	add_child(ClayStyle.make_panel(ClayStyle.card_box(PAPER, 48), BOARD_RECT))
	_board = Control.new()
	_board.name = "TraceBoard"
	_board.position = BOARD_RECT.position
	_board.size = BOARD_RECT.size
	_board.draw.connect(_draw_board)
	_board.gui_input.connect(_on_board_input)
	add_child(_board)
	var item: String = str(params.get("item", ""))
	if item != "":
		var img: Control = ASSET_IMAGE.instantiate() as Control
		img.set("key", item)
		img.mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(img)
		img.position = PICTURE_POS
		img.size = Vector2(PICTURE_SIZE, PICTURE_SIZE)
	_begin_stroke(0)

func _begin_stroke(i: int) -> void:
	_stroke = i
	_drawing = false
	_finger = PackedVector2Array()
	if i < _strokes.size():
		_tracker = TracePath.Tracker.new(_strokes[i], _tol)
	_redraw()

func _redraw() -> void:
	if _board != null:
		_board.queue_redraw()

## Glif birimi -> board yerel pikseli.
func unit_to_board(p: Vector2) -> Vector2:
	return _origin + p * _unit - BOARD_RECT.position

func board_to_unit(p: Vector2) -> Vector2:
	return (p + BOARD_RECT.position - _origin) / _unit

func stroke_count() -> int:
	return _strokes.size()

## Tamamlanmış vuruş sayısı.
func current_stroke() -> int:
	return _stroke

func touch_targets() -> Array[Control]:
	return [_board] as Array[Control]

func is_demo_playing() -> bool:
	return _demo_t >= 0.0

# --- çizim ---

func _draw_board() -> void:
	var w: float = _board.size.x
	for y: int in 4:
		var py: float = unit_to_board(Vector2(0, y)).y
		var col: Color = BASE_COLOR if y == 2 else LINE_COLOR
		if y == 1:
			_dashed_hline(py, 40.0, w - 40.0, col)
		else:
			_board.draw_line(Vector2(40, py), Vector2(w - 40, py), col, 5.0 if y == 2 else 3.0, true)
	var thick: float = _unit * 0.24
	var ghost: Color = GHOST if difficulty < 3 else GHOST_FAINT
	for i: int in _strokes.size():
		_paint(_strokes[i], thick, ghost, _strokes[i].size())
	for i: int in mini(_stroke, _strokes.size()):
		_paint(_strokes[i], thick * 0.82, INK, _strokes[i].size())
	if _tracker != null and _stroke < _strokes.size() and not _done:
		var progress: int = int(_tracker.get("progress"))
		_paint(_strokes[_stroke], thick * 0.82, INK, progress + 1 if progress > 0 else 0)
	if _finger.size() > 1:
		_board.draw_polyline(_finger, FINGER, 10.0, true)
	if _demo_stroke >= 0 and _demo_stroke < _strokes.size() and _demo_t >= 0.0:
		var pts: PackedVector2Array = _strokes[_demo_stroke]
		var n: int = clampi(int(round(_demo_t * (pts.size() - 1))) + 1, 1, pts.size())
		_paint(pts, thick * 0.6, DEMO_COLOR, n)
		_draw_pencil(unit_to_board(pts[n - 1]))
	if _stroke < _strokes.size() and not _done:
		_draw_start()

## Vuruşun ilk n noktasını kalın, yuvarlak uçlu boyar. Renkler opaktır: her örnek noktaya
## daire çizilir (keskin dönüşlerde sivri köşe ve saydam üst üste binme lekesi olmasın).
func _paint(pts: PackedVector2Array, width: float, color: Color, n: int) -> void:
	var count: int = mini(n, pts.size())
	if count <= 0:
		return
	var prev: Vector2 = unit_to_board(pts[0])
	_board.draw_circle(prev, width * (0.75 if pts.size() == 1 else 0.5), color, true, -1.0, true)
	for k: int in range(1, count):
		var cur: Vector2 = unit_to_board(pts[k])
		_board.draw_line(prev, cur, color, width, true)
		_board.draw_circle(cur, width * 0.5, color, true, -1.0, true)
		prev = cur

func _dashed_hline(y: float, x0: float, x1: float, col: Color) -> void:
	var x: float = x0
	while x < x1:
		_board.draw_line(Vector2(x, y), Vector2(minf(x + 26.0, x1), y), col, 3.0, true)
		x += 46.0

## Sıradaki vuruşun başlangıç noktası: kil daire + vuruş numarası; kolay zorlukta yön oku.
func _draw_start() -> void:
	var pts: PackedVector2Array = _strokes[_stroke]
	var t: Object = _tracker
	var at: Vector2 = unit_to_board(t.call("anchor") as Vector2)
	var r: float = _unit * 0.19 * (1.0 + 0.18 * _start_pulse)
	_board.draw_circle(at + Vector2(0, 5), r, ClayStyle.SHADOW, true, -1.0, true)
	_board.draw_circle(at, r, START_COLOR, true, -1.0, true)
	_board.draw_arc(at, r, 0.0, TAU, 40, START_COLOR.darkened(0.35), 4.0, true)
	var font: Font = _board.get_theme_default_font()
	var fs: int = int(r * 1.2)
	var label: String = str(_stroke + 1)
	var sz: Vector2 = font.get_string_size(label, HORIZONTAL_ALIGNMENT_CENTER, -1, fs)
	_board.draw_string(font, at + Vector2(-sz.x / 2.0, fs * 0.36), label, HORIZONTAL_ALIGNMENT_CENTER, -1, fs, ClayStyle.INK)
	if difficulty <= 1 and pts.size() > 1 and int(t.get("progress")) == 0:
		_draw_arrow(pts)

## Başlangıçtan biraz ileride, yolun yönünü gösteren ok.
func _draw_arrow(pts: PackedVector2Array) -> void:
	var k: int = mini(pts.size() - 1, 9)
	var a: Vector2 = unit_to_board(pts[mini(k, 5)])
	var b: Vector2 = unit_to_board(pts[k])
	var dir: Vector2 = (b - a).normalized()
	if dir == Vector2.ZERO:
		return
	var tip: Vector2 = unit_to_board(pts[k]) + dir * _unit * 0.12
	var side: Vector2 = dir.orthogonal() * _unit * 0.11
	var back: Vector2 = tip - dir * _unit * 0.16
	_board.draw_polyline(PackedVector2Array([back + side, tip, back - side]), START_COLOR.darkened(0.35), 9.0, true)

func _draw_pencil(at: Vector2) -> void:
	var s: float = _unit * 0.6
	if _pencil != null:
		_board.draw_texture_rect(_pencil, Rect2(at - Vector2(s * 0.2, s * 0.8), Vector2(s, s)), false)
		return
	_board.draw_circle(at + Vector2(0, 5), s * 0.24, ClayStyle.SHADOW, true, -1.0, true)
	_board.draw_circle(at, s * 0.24, ClayStyle.TANGERINE, true, -1.0, true)
	_board.draw_arc(at, s * 0.24, 0.0, TAU, 32, ClayStyle.TANGERINE.darkened(0.35), 5.0, true)
	_board.draw_circle(at + Vector2(-0.08, -0.08) * s, s * 0.06, Color(1, 1, 1, 0.5), true, -1.0, true)

# --- girdi ---

func _on_board_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and (event as InputEventMouseButton).button_index == MOUSE_BUTTON_LEFT:
		var mb: InputEventMouseButton = event as InputEventMouseButton
		if mb.pressed:
			_press(mb.position)
		else:
			_release()
	elif event is InputEventMouseMotion and _drawing:
		_move((event as InputEventMouseMotion).position)

## Başlangıç noktasına (ya da kalınan yere) yakın basış izlemeyi başlatır; başka yere basış
## cevap değildir, yalnızca başlangıç noktası nabız gibi büyür.
func _press(local: Vector2) -> void:
	if not _can_input() or _tracker == null or _stroke >= _strokes.size():
		return
	var p: Vector2 = board_to_unit(local)
	var t: Object = _tracker
	if not bool(t.call("can_start", p)):
		_pulse_start()
		return
	_drawing = true
	_last = p
	_finger = PackedVector2Array([local])
	_handle(int(t.call("feed", p)))

func _move(local: Vector2) -> void:
	if not _drawing or not _can_input():
		_drawing = false
		return
	var p: Vector2 = board_to_unit(local)
	_finger.append(local)
	var res: int = int(_tracker.call("feed_segment", _last, p))
	_last = p
	_handle(res)
	_redraw()

func _release() -> void:
	_drawing = false
	_finger = PackedVector2Array()
	_redraw()

func _handle(res: int) -> void:
	if res == TracePath.Tracker.DONE:
		_drawing = false
		_stroke_done()
	elif res == TracePath.Tracker.OFF:
		_drawing = false
		_finger = PackedVector2Array()
		_redraw()
		_submit_answer(false, false)
		_play_demo()

func _stroke_done() -> void:
	audio.play_sfx("sfx.drop")
	var last: bool = _stroke + 1 >= _strokes.size()
	_begin_stroke(_stroke + 1)
	_submit_answer(true, last)

func _pulse_start() -> void:
	if _reduce_motion() or not is_inside_tree():
		return
	var tw: Tween = create_tween()
	tw.tween_method(func(v: float) -> void:
		_start_pulse = v
		_redraw(), 0.0, 1.0, 0.2)
	tw.tween_method(func(v: float) -> void:
		_start_pulse = v
		_redraw(), 1.0, 0.0, 0.3)

## Yön ipucu: kalem sıradaki vuruşu baştan sona yavaşça çizer (iz silinir, cevap sayılmaz).
func _play_demo() -> void:
	if _stroke >= _strokes.size():
		return
	_demo_gen += 1
	var gen: int = _demo_gen
	_demo_stroke = _stroke
	_demo_t = 0.0
	_redraw()
	if not is_inside_tree():
		return
	var seconds: float = DEMO_SECONDS * (0.5 if _reduce_motion() else 1.0)
	var tw: Tween = create_tween()
	tw.tween_method(func(v: float) -> void:
		if gen == _demo_gen:
			_demo_t = v
			_redraw(), 0.0, 1.0, seconds)
	await tw.finished
	await _wait(0.4)
	if gen == _demo_gen:
		_demo_t = -1.0
		_demo_stroke = -1
		_redraw()

func show_hint(level: int) -> void:
	if _done or _busy:
		return
	if level == 1:
		_pulse_start()
		_play_demo()
	elif level >= 2:
		_auto_complete()

## İpucu 2: kalan vuruşlar sırayla kalemle çizilip yerine oturur.
func _auto_complete() -> void:
	_busy = true
	helped = true
	_drawing = false
	while not _done and _stroke < _strokes.size():
		await _play_demo()
		if _done:
			return
		_stroke_done()
		await _wait(AUTO_STEP_SECONDS)
	_busy = false

# --- test kancaları ---

## Test için: sıradaki vuruşu kalınan yerden gerçek girdi yoluyla (bas, kaydır, bırak) izler.
## offset (birim) yolu kaydırır: tolerans içinde kalırsa yine doğru sayılır.
func _debug_trace(offset: Vector2 = Vector2.ZERO) -> void:
	if _stroke >= _strokes.size():
		return
	var pts: PackedVector2Array = _strokes[_stroke]
	var from: int = int(_tracker.get("progress"))
	_press(unit_to_board(pts[from] + offset))
	for k: int in range(from + 1, pts.size(), 3):
		if not _drawing:
			break
		_move(unit_to_board(pts[k] + offset))
	if _drawing:
		_move(unit_to_board(pts[pts.size() - 1] + offset))
	_release()

## Test için: başlangıçtan basıp yoldan uzağa kaydırır.
func _debug_stray() -> void:
	if _stroke >= _strokes.size():
		return
	var start: Vector2 = _tracker.call("anchor") as Vector2
	_press(unit_to_board(start))
	_move(unit_to_board(start + Vector2(2.5, 0.0)))
	_release()

## Test için: başlangıçtan uzağa basar (cevap sayılmaz).
func _debug_press_away() -> void:
	var start: Vector2 = _tracker.call("anchor") as Vector2
	_press(unit_to_board(start + Vector2(3.0, 0.0)))
	_release()

func _debug_answer(correct: bool) -> void:
	if correct:
		_debug_trace()
	else:
		_debug_stray()

static func validate_params(p: Dictionary) -> Array[String]:
	var errs: Array[String] = []
	var text: Variant = p.get("chars")
	if not (text is String) or (text as String).is_empty() or (text as String).length() > MAX_CHARS:
		errs.append(ContentValidator.msg("err.params.tr_text"))
		return errs
	for ch: String in text as String:
		if not TracePath.has_glyph(ch):
			errs.append(ContentValidator.msg("err.params.tr_glyph", {"char": ch}))
	if p.has("item") and (not (p["item"] is String) or (p["item"] as String).is_empty()):
		errs.append(ContentValidator.msg("err.params.item"))
	return errs
