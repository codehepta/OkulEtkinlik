extends MiniGame
## Kareli zemin (spec §3.7 #15). İki mod:
## path (hareket): build → yön kartlarıyla program kur ve oynat, karakter hedefte bitmeli;
##                 follow → verilen programı izle, karakterin varacağı hücreye dokun.
## paint (boyama): copy (örneği kopyala), symmetry (dikey ya da yatay ayna eksenine göre tamamla;
##                 `axis_dir`, Faz 3e, MAT.3.3.7 b), code (yön + adım
##                 kodunu boya), silhouette (silüeti eşle), pieces (N bağlı hücre boya).
## Boyalı hücre kabarık kil + iç işaret, kilitli hücre çizgili desen + koyu kenar alır; ipucu
## noktaları ve iz çizgisi şekilce ayrılır (renk tek başına anlam taşımaz).
## copy + `transform` ("rotate" | "scale") + `reference` (Faz 3d, MAT.2.3.4 b): sağdaki örnek
## `reference` şeklini gösterir; çocuk onu döndürerek (örnekle aynı yönde olmayan herhangi bir
## çeyrek dönüş) ya da iki kat büyüterek zemine boyar. Konum serbesttir; `target` ipucu ve çözüm
## için önerilen yerdir.

const Widgets: GDScript = preload("res://scenes/games/game_widgets.gd")
const GridLogic: GDScript = preload("res://scripts/core/grid_logic.gd")

const MODES: PackedStringArray = ["path", "paint"]
const PATH_ASKS: PackedStringArray = ["build", "follow"]
const PAINT_ASKS: PackedStringArray = ["copy", "symmetry", "code", "silhouette", "pieces"]
const ARROW_SETS: PackedStringArray = ["relative", "absolute"]
## Simetri ekseninin yönü: dikey eksen sütun sınırı, yatay eksen satır sınırıdır.
const AXIS_DIRS: PackedStringArray = ["vertical", "horizontal"]
## copy dönüşümleri (MAT.2.3.4 b).
const TRANSFORMS: PackedStringArray = ["rotate", "scale"]
## Sütun / satır aralıkları (x: en az, y: en çok).
const PATH_COLS: Vector2i = Vector2i(3, 8)
const PATH_ROWS: Vector2i = Vector2i(3, 5)
const PAINT_COLS: Vector2i = Vector2i(3, 8)
const PAINT_ROWS: Vector2i = Vector2i(3, 6)
const MIN_CELL: float = 128.0
const MAX_PROGRAM: int = 12
const MAX_CODE: int = 6
const MAX_CODE_COUNT: int = 9
const PIECES_MIN: int = 2
const PIECES_MAX: int = 20

const CHAR_KEY: String = "char.grid.gezgin"
const GOAL_KEY: String = "ui.grid.hedef"
const WALL_KEY: String = "ui.grid.duvar"

# path düzeni
const PATH_AREA: Rect2 = Rect2(280, 160, 1030, 640)
const PALETTE_ORIGIN: Vector2 = Vector2(1330, 180)
const PALETTE_CARD: float = 150.0
const PALETTE_GAP: float = 20.0
const PATH_CHECK_RECT: Rect2 = Rect2(1330, 560, 320, 170)
const STRIP_ORIGIN: Vector2 = Vector2(280, 830)
const STRIP_CARD: float = 128.0
const STRIP_GAP: float = 8.0
const CHAR_SCALE: float = 0.84
# paint düzeni
const PAINT_AREA: Rect2 = Rect2(280, 160, 1030, 780)
const REF_RECT: Rect2 = Rect2(1330, 170, 540, 380)
const CODE_ORIGIN: Vector2 = Vector2(1330, 170)
const CODE_TILE: float = 128.0
const CODE_PAIR_GAP: float = 8.0
const CODE_COL_GAP: float = 22.0
const CODE_ROW_GAP: float = 12.0
const COUNT_RECT: Rect2 = Rect2(1330, 600, 170, 150)
const TARGET_COUNT_RECT: Rect2 = Rect2(1580, 600, 170, 150)
const PAINT_CHECK_RECT: Rect2 = Rect2(1600, 790, 260, 150)
const COUNT_FONT: int = 80
const CELL_PAD: float = 5.0

# zamanlama
const STEP_SECONDS: float = 0.25
const BUMP_SECONDS: float = 0.12
const RESET_SECONDS: float = 0.3
const SOLVE_SECONDS: float = 0.6
const SWAY_SECONDS: float = 0.1
const SWAY_ANGLE: float = 0.06

const CELL_COLOR: Color = ClayStyle.IVORY
const PAINT_COLOR: Color = ClayStyle.TEAL
const LOCKED_COLOR: Color = ClayStyle.CARAMEL
const WALL_COLOR: Color = ClayStyle.CLAY_EDGE
const PAWN_COLOR: Color = ClayStyle.ROSE
const FLAG_COLOR: Color = ClayStyle.EMBER
const TRAIL_COLOR: Color = Color(ClayStyle.TEAL, 0.35)
const DOT_COLOR: Color = Color(ClayStyle.COCOA, 0.35)
const GHOST_FILL: Color = Color(ClayStyle.COCOA, 0.14)
const GHOST_LINE: Color = Color(ClayStyle.COCOA, 0.55)
const STRIPE_COLOR: Color = Color(ClayStyle.INK, 0.4)
const CARD_COLORS: Dictionary = {
	"forward": ClayStyle.SKY,
	"turn_left": ClayStyle.PEACH,
	"turn_right": ClayStyle.ROSE,
	"up": ClayStyle.SKY,
	"down": ClayStyle.SKY,
	"left": ClayStyle.SKY,
	"right": ClayStyle.SKY,
}

var _mode: String = "path"
var _ask: String = "build"
var _cols: int = 3
var _rows: int = 3
var _cell: float = MIN_CELL
var _origin: Vector2 = Vector2.ZERO
var _cells: Dictionary = {}
var _overlay: Control = null
var _check: Control = null
# path
var _arrows: String = "relative"
var _start: Vector2i = Vector2i.ZERO
var _facing: String = "right"
var _goal: Vector2i = Vector2i(-1, -1)
var _walls: Dictionary = {}
var _shortest: bool = false
var _min_len: int = -1
var _program: Array[String] = []
var _palette: Dictionary = {}
var _palette_list: Array[Control] = []
var _strip: Array[Control] = []
var _char: Control = null
var _char_cell: Vector2i = Vector2i.ZERO
var _char_facing: String = "right"
var _follow_end: Vector2i = Vector2i.ZERO
var _hint_dots: Array[Vector2i] = []
var _hint_card: String = ""
# paint
var _painted: Dictionary = {}
var _locked: Dictionary = {}
var _target: Dictionary = {}
## copy: sağdaki örnekte görünen şekil (dönüşüm yoksa hedefin kendisi).
var _reference: Dictionary = {}
## copy: "" (birebir kopya), "rotate" ya da "scale".
var _transform: String = ""
var _pieces: int = 0
var _axis: int = 0
var _axis_dir: String = "vertical"
var _code: Array = []
var _marked: Dictionary = {}
var _missing: Vector2i = Vector2i(-1, -1)
var _count_tile: Control = null
var _target_tile: Control = null

func setup(params: Dictionary, difficulty_value: int, context: RoundContext) -> void:
	_init_round(difficulty_value, context)
	_mode = str(params["mode"])
	_ask = str(params["ask"])
	_cols = int(params["cols"])
	_rows = int(params["rows"])
	var area: Rect2 = _area(_mode)
	_cell = cell_size_for(_mode, _cols, _rows)
	_origin = area.position + (area.size - Vector2(_cols, _rows) * _cell) / 2.0
	if _mode == "path":
		_setup_path(params)
	else:
		_setup_paint(params)

static func _area(mode: String) -> Rect2:
	return PATH_AREA if mode == "path" else PAINT_AREA

## Ekrandaki hücre kenarı (px): ızgara alanına sığan en büyük kare.
static func cell_size_for(mode: String, cols: int, rows: int) -> float:
	var area: Rect2 = _area(mode)
	return minf(area.size.x / cols, area.size.y / rows)

# ================= Ortak ızgara =================

func _build_cells(tappable: bool) -> void:
	for r: int in _rows:
		for c: int in _cols:
			var cell: Vector2i = Vector2i(c, r)
			var v: Control = Control.new()
			v.name = "Cell_%d_%d" % [c, r]
			v.position = _origin + Vector2(c, r) * _cell
			v.size = Vector2(_cell, _cell)
			v.pivot_offset = v.size / 2.0
			v.mouse_filter = Control.MOUSE_FILTER_STOP if tappable else Control.MOUSE_FILTER_IGNORE
			v.draw.connect(_draw_cell.bind(v, cell))
			v.gui_input.connect(_on_cell_input.bind(cell))
			add_child(v)
			_cells[cell] = v
	_overlay = Control.new()
	_overlay.name = "Overlay"
	_overlay.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_overlay.position = _origin
	_overlay.size = Vector2(_cols, _rows) * _cell
	_overlay.draw.connect(_draw_overlay)
	add_child(_overlay)

func _redraw_cells() -> void:
	for v: Control in _cells.values():
		v.queue_redraw()
	if _overlay != null:
		_overlay.queue_redraw()

func _on_cell_input(event: InputEvent, cell: Vector2i) -> void:
	if is_press(event):
		_tap_cell(cell)

func _tap_cell(cell: Vector2i) -> void:
	if not _can_input() or not _cells.has(cell):
		return
	if _mode == "paint":
		_toggle(cell)
	elif _ask == "follow":
		var v: Control = _cells[cell]
		_tap_feedback(v)
		if cell == _follow_end:
			_finish_follow()
		else:
			_sway(v)
			_submit_answer(false)

func _on_check_input(event: InputEvent) -> void:
	if is_press(event):
		_check_answer()

func _check_answer() -> void:
	if not _can_input() or _check == null:
		return
	_tap_feedback(_check)
	if _mode == "path":
		_run_program()
	else:
		_submit_answer(_paint_correct())

func _animated() -> bool:
	return is_inside_tree() and not _reduce_motion()

func _sway(c: Control) -> void:
	if not _animated():
		return
	c.pivot_offset = c.size / 2.0
	var tw: Tween = c.create_tween()
	tw.tween_property(c, "rotation", SWAY_ANGLE, SWAY_SECONDS)
	tw.tween_property(c, "rotation", -SWAY_ANGLE, SWAY_SECONDS * 2.0)
	tw.tween_property(c, "rotation", 0.0, SWAY_SECONDS)

# ================= path =================

func _setup_path(params: Dictionary) -> void:
	_arrows = str(params.get("arrows", "relative"))
	_facing = str(params.get("facing", "right"))
	_start = GridLogic.parse_cell(params["start"])
	for w: Vector2i in GridLogic.parse_cells(params.get("walls", [])) as Array:
		_walls[w] = true
	_build_cells(_ask == "follow")
	if _ask == "build":
		_goal = GridLogic.parse_cell(params["goal"])
		_shortest = bool(params.get("shortest", false))
		_min_len = GridLogic.shortest_program(_start, _facing, _goal, _arrows, _cols, _rows, _walls).size()
		_build_strip_wells()
		_build_palette()
		_check = Widgets.make_check_button(self, PATH_CHECK_RECT)
		_check.gui_input.connect(_on_check_input)
	else:
		for k: Variant in params["program"] as Array:
			_program.append(str(k))
		_follow_end = _simulate(_program)["end"]
	_rebuild_strip()
	_char = Control.new()
	_char.name = "Character"
	_char.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_char.size = Vector2(_cell, _cell) * CHAR_SCALE
	_char.draw.connect(func() -> void: _draw_pawn(_char, Rect2(Vector2.ZERO, _char.size)))
	add_child(_char)
	_reset_character()

func _simulate(program: Array) -> Dictionary:
	return GridLogic.simulate(program, _start, _facing, _cols, _rows, _walls)

func _build_palette() -> void:
	var kinds: PackedStringArray = GridLogic.cards_for(_arrows)
	for i: int in kinds.size():
		var col: int = i % 2
		var row: int = floori(i / 2.0)
		var pos: Vector2 = PALETTE_ORIGIN + Vector2(col, row) * (PALETTE_CARD + PALETTE_GAP)
		var t: Control = _make_card(kinds[i], Rect2(pos, Vector2(PALETTE_CARD, PALETTE_CARD)))
		t.name = "Palette_" + kinds[i]
		t.gui_input.connect(_on_palette_input.bind(kinds[i]))
		_palette[kinds[i]] = t
		_palette_list.append(t)

## Program şeridindeki boş yuvalar (en çok 12 kart).
func _build_strip_wells() -> void:
	var wells: Control = Control.new()
	wells.name = "StripWells"
	wells.mouse_filter = Control.MOUSE_FILTER_IGNORE
	wells.position = STRIP_ORIGIN
	wells.size = Vector2(MAX_PROGRAM * (STRIP_CARD + STRIP_GAP), STRIP_CARD)
	wells.draw.connect(func() -> void:
		for i: int in MAX_PROGRAM:
			Widgets.draw_well(wells, Rect2(Vector2(i * (STRIP_CARD + STRIP_GAP), 0), Vector2(STRIP_CARD, STRIP_CARD)), 22.0))
	add_child(wells)

## Yön kartı: kil karo + kodla çizilmiş kalın ok (yazı yok).
func _make_card(kind: String, rect: Rect2) -> Control:
	var t: Control = Widgets.make_tile(self, "", rect, 40, CARD_COLORS.get(kind, ClayStyle.SKY) as Color)
	var icon: Control = Control.new()
	icon.mouse_filter = Control.MOUSE_FILTER_IGNORE
	icon.size = rect.size - Vector2(0, ClayStyle.DEPTH)
	icon.draw.connect(func() -> void: _draw_card_icon(icon, kind, Rect2(Vector2.ZERO, icon.size)))
	t.add_child(icon)
	return t

func _rebuild_strip() -> void:
	for c: Control in _strip:
		c.hide()
		c.queue_free()
	_strip.clear()
	for i: int in _program.size():
		var pos: Vector2 = STRIP_ORIGIN + Vector2(i * (STRIP_CARD + STRIP_GAP), 0)
		var t: Control = _make_card(_program[i], Rect2(pos, Vector2(STRIP_CARD, STRIP_CARD)))
		if _ask == "build":
			t.gui_input.connect(_on_strip_input.bind(i))
		else:
			t.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_strip.append(t)
	if _overlay != null:
		_overlay.queue_redraw()

func _on_palette_input(event: InputEvent, kind: String) -> void:
	if is_press(event):
		_add_card(kind)

func _on_strip_input(event: InputEvent, i: int) -> void:
	if is_press(event):
		_remove_card(i)

func _add_card(kind: String) -> void:
	if not _can_input() or _ask != "build" or not _palette.has(kind) or _program.size() >= MAX_PROGRAM:
		return
	_tap_feedback(_palette[kind] as Control)
	_program.append(kind)
	_rebuild_strip()

func _remove_card(i: int) -> void:
	if not _can_input() or _ask != "build" or i < 0 or i >= _program.size():
		return
	audio.play_sfx("sfx.tap")
	_program.remove_at(i)
	_rebuild_strip()

func _char_pos(cell: Vector2i) -> Vector2:
	return _origin + Vector2(cell) * _cell + (Vector2(_cell, _cell) - _char.size) / 2.0

func _reset_character() -> void:
	_char_cell = _start
	_char_facing = _facing
	_char.position = _char_pos(_start)
	_char.queue_redraw()

## Karakteri durum listesi boyunca adım adım yürütür (hareket azaltılmışsa anında).
func _walk(states: Array) -> void:
	for s: Dictionary in states:
		var cell: Vector2i = s["cell"]
		var moved: bool = cell != _char_cell
		_char_cell = cell
		_char_facing = str(s["facing"])
		_char.queue_redraw()
		if not _animated():
			_char.position = _char_pos(cell)
		elif moved:
			var tw: Tween = _char.create_tween()
			tw.tween_property(_char, "position", _char_pos(cell), STEP_SECONDS)
			await tw.finished
		else:
			await _wait(STEP_SECONDS)

## Duvar ya da kenar: küçük ileri-geri tümsek (karakter hücresinde kalır).
func _bump(facing: String) -> void:
	_char_facing = facing
	_char.queue_redraw()
	if not _animated():
		return
	var home: Vector2 = _char_pos(_char_cell)
	var d: Vector2 = Vector2(GridLogic.DIRS[facing] as Vector2i)
	var tw: Tween = _char.create_tween()
	tw.tween_property(_char, "position", home + d * _cell * 0.2, BUMP_SECONDS)
	tw.tween_property(_char, "position", home, BUMP_SECONDS)
	await tw.finished

## Programı oynatır; yanlışta karakter başlangıca döner, program korunur (K4).
func _run_program() -> void:
	_busy = true
	_reset_character()
	var sim: Dictionary = _simulate(_program)
	await _walk(sim["states"] as Array)
	var blocked: bool = bool(sim["blocked"])
	if blocked:
		await _bump(str(sim["blocked_facing"]))
	var correct: bool = not blocked and _char_cell == _goal and (not _shortest or _program.size() <= _min_len)
	if not correct:
		if _animated():
			await _wait(RESET_SECONDS)
		_reset_character()
	_busy = false
	_submit_answer(correct)

func _finish_follow() -> void:
	_busy = true
	_reset_character()
	await _walk(_simulate(_program)["states"] as Array)
	_busy = false
	_submit_answer(true)

## Program ızgaradan çıkmadan bittiği hücreler (başlangıç hariç, sırayla).
func _path_cells(program: Array) -> Array[Vector2i]:
	var res: Array[Vector2i] = []
	for s: Dictionary in _simulate(program)["states"] as Array:
		var c: Vector2i = s["cell"]
		if c != _start and not res.has(c):
			res.append(c)
	return res

## Programın en kısa yoldan ilk saptığı adımda doğru kart ("" : sapma yok / hedefte).
func _next_card() -> String:
	var cell: Vector2i = _start
	var f: String = _facing
	var dist: int = _min_len
	for card: String in _program:
		var n: Dictionary = GridLogic.step(cell, f, card)
		var nc: Vector2i = n["cell"]
		if not GridLogic.passable(nc, _cols, _rows, _walls):
			break
		var nd: int = GridLogic.shortest_program(nc, str(n["facing"]), _goal, _arrows, _cols, _rows, _walls).size()
		if nd != dist - 1:
			break
		cell = nc
		f = str(n["facing"])
		dist = nd
	if cell == _goal:
		return ""
	var sp: Array[String] = GridLogic.shortest_program(cell, f, _goal, _arrows, _cols, _rows, _walls)
	return sp[0] if not sp.is_empty() else ""

# ================= paint =================

func _setup_paint(params: Dictionary) -> void:
	match _ask:
		"copy", "silhouette":
			for c: Vector2i in GridLogic.parse_cells(params["target"]) as Array:
				_target[c] = true
			_transform = str(params.get("transform", ""))
			_reference = _target.duplicate()
			if _transform != "":
				_reference.clear()
				for c: Vector2i in GridLogic.parse_cells(params["reference"]) as Array:
					_reference[c] = true
		"symmetry":
			_axis = int(params["axis"])
			_axis_dir = str(params.get("axis_dir", "vertical"))
			for c: Vector2i in GridLogic.parse_cells(params["given"]) as Array:
				_locked[c] = true
				_painted[c] = true
				_target[c] = true
				_target[GridLogic.mirror_axis(c, _axis, _axis_dir)] = true
		"code":
			_start = GridLogic.parse_cell(params["start"])
			_code = (params["code"] as Array).duplicate(true)
			for c: Vector2i in GridLogic.code_cells(_start, _code):
				_target[c] = true
		"pieces":
			_pieces = int(params["pieces"])
	_build_cells(true)
	if _ask == "copy":
		_build_reference()
	elif _ask == "code":
		_build_code_strip()
	_check = Widgets.make_check_button(self, PAINT_CHECK_RECT)
	_check.gui_input.connect(_on_check_input)
	if difficulty <= 1:
		_show_counter()

## Sağda salt okunur küçük örnek ızgara (copy).
func _build_reference() -> void:
	var ref: Control = Control.new()
	ref.name = "Reference"
	ref.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ref.position = REF_RECT.position
	ref.size = REF_RECT.size
	ref.draw.connect(func() -> void: _draw_reference(ref))
	add_child(ref)

## Kod şeridi: her komut için ok karosu + adım sayısı karosu.
func _build_code_strip() -> void:
	for i: int in _code.size():
		var pair: Array = _code[i]
		var col: int = i % 2
		var row: int = floori(i / 2.0)
		var pos: Vector2 = CODE_ORIGIN + Vector2(col * (2.0 * CODE_TILE + CODE_PAIR_GAP + CODE_COL_GAP), row * (CODE_TILE + CODE_ROW_GAP))
		var arrow: Control = _make_card(str(pair[0]), Rect2(pos, Vector2(CODE_TILE, CODE_TILE)))
		arrow.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var num: Control = Widgets.make_tile(self, str(int(pair[1])), Rect2(pos + Vector2(CODE_TILE + CODE_PAIR_GAP, 0), Vector2(CODE_TILE, CODE_TILE)), COUNT_FONT, ClayStyle.BUTTER)
		num.mouse_filter = Control.MOUSE_FILTER_IGNORE

## Sayaç: boyalı hücre sayısı ve hedef sayısı (yalnızca rakam) yan yana, arada eğik çizgi.
func _show_counter() -> void:
	if _count_tile != null:
		return
	_count_tile = Widgets.make_tile(self, str(_painted.size()), COUNT_RECT, COUNT_FONT, ClayStyle.IVORY)
	_count_tile.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var bar: Control = Control.new()
	bar.mouse_filter = Control.MOUSE_FILTER_IGNORE
	bar.position = Vector2(COUNT_RECT.end.x, COUNT_RECT.position.y)
	bar.size = Vector2(TARGET_COUNT_RECT.position.x - COUNT_RECT.end.x, COUNT_RECT.size.y)
	bar.draw.connect(func() -> void:
		bar.draw_line(Vector2(bar.size.x * 0.7, 24), Vector2(bar.size.x * 0.3, bar.size.y - 24), ClayStyle.INK, 12.0, true))
	add_child(bar)
	_target_tile = Widgets.make_tile(self, str(_target_count()), TARGET_COUNT_RECT, COUNT_FONT, ClayStyle.BUTTER)
	_target_tile.mouse_filter = Control.MOUSE_FILTER_IGNORE

func _target_count() -> int:
	return _pieces if _ask == "pieces" else _target.size()

func _toggle(cell: Vector2i) -> void:
	if not _can_input() or _locked.has(cell) or not _cells.has(cell):
		return
	if _painted.has(cell):
		_painted.erase(cell)
	else:
		_painted[cell] = true
	_marked.erase(cell)
	if cell == _missing:
		_missing = Vector2i(-1, -1)
	audio.play_sfx("sfx.tap")
	_refresh_paint()

func _refresh_paint() -> void:
	_redraw_cells()
	if _count_tile != null:
		_count_tile.set("text", str(_painted.size()))

func _paint_correct() -> bool:
	if _transform != "":
		return GridLogic.matches_transform(_painted.keys(), _reference.keys(), _transform)
	if _ask == "pieces":
		return _painted.size() == _pieces and GridLogic.cells_connected(_painted.keys())
	if _painted.size() != _target.size():
		return false
	for c: Vector2i in _target:
		if not _painted.has(c):
			return false
	return true

## Doğru boyama: hedef; pieces için geçerli seçim korunur, yoksa sol üstten yılan sırası.
func _solution() -> Dictionary:
	var res: Dictionary = {}
	if _ask != "pieces":
		return _target.duplicate()
	if _paint_correct():
		return _painted.duplicate()
	for c: Vector2i in GridLogic.snake_cells(_cols, _rows, _pieces):
		res[c] = true
	return res

# ================= Çizim =================

func _draw_cell(v: Control, cell: Vector2i) -> void:
	var r: Rect2 = Rect2(Vector2.ZERO, v.size).grow(-CELL_PAD)
	var rad: int = int(_cell * 0.16)
	if _mode == "path" and _walls.has(cell):
		_draw_wall(v, r, rad)
		return
	v.draw_style_box(ClayStyle.panel_box(CELL_COLOR, rad), r)
	if _mode == "path":
		if cell == _goal:
			_draw_goal(v, r)
		elif cell == _start:
			v.draw_arc(r.get_center(), r.size.x * 0.3, 0.0, TAU, 40, Color(ClayStyle.COCOA, 0.3), 6.0, true)
		return
	if _ask == "silhouette" and _target.has(cell):
		v.draw_style_box(ClayStyle.soft_box(GHOST_FILL, rad), r.grow(-6.0))
		ClayStyle.draw_dashed_round_rect(v, r.grow(-10.0), float(rad), GHOST_LINE, 5.0, 12.0)
	if _painted.has(cell):
		_draw_painted(v, r, rad, _locked.has(cell))
	if _ask == "code" and cell == _start:
		v.draw_arc(r.get_center(), r.size.x * 0.32, 0.0, TAU, 40, ClayStyle.INK, 8.0, true)
	if _marked.has(cell):
		ClayStyle.draw_dashed_round_rect(v, r.grow(-8.0), float(rad), ClayStyle.INK, 6.0, 12.0)
		var c: Vector2 = r.get_center()
		var q: float = r.size.x * 0.14
		v.draw_line(c + Vector2(-q, -q), c + Vector2(q, q), ClayStyle.INK, 7.0, true)
		v.draw_line(c + Vector2(q, -q), c + Vector2(-q, q), ClayStyle.INK, 7.0, true)

## Boyalı hücre: kabarık kil + iç nokta; kilitli hücre: çapraz çizgili desen + kalın koyu kenar.
func _draw_painted(ci: CanvasItem, r: Rect2, rad: int, locked: bool) -> void:
	ci.draw_style_box(ClayStyle.card_box(LOCKED_COLOR if locked else PAINT_COLOR, rad), r)
	if locked:
		var s: float = minf(r.size.x, r.size.y)
		for k: int in range(1, 8):
			var t: float = s * k / 4.0
			var a: Vector2 = r.position + Vector2(minf(t, s), t - minf(t, s))
			var b: Vector2 = r.position + Vector2(t - minf(t, s), minf(t, s))
			ci.draw_line(a, b, STRIPE_COLOR, 6.0, true)
		ci.draw_rect(r.grow(-3.0), ClayStyle.INK, false, 6.0)
	else:
		ci.draw_circle(r.get_center() - Vector2(0, ClayStyle.DEPTH / 2.0), r.size.x * 0.13, ClayStyle.IVORY, true, -1.0, true)

func _draw_wall(ci: CanvasItem, r: Rect2, rad: int) -> void:
	var tex: Texture2D = AssetRegistry.texture(WALL_KEY)
	if tex != null:
		ci.draw_texture_rect(tex, r, false)
		return
	ci.draw_style_box(ClayStyle.card_box(WALL_COLOR, rad), r)
	var line: Color = WALL_COLOR.darkened(0.35)
	var y1: float = r.position.y + r.size.y * 0.36
	var y2: float = r.position.y + r.size.y * 0.66
	ci.draw_line(Vector2(r.position.x + 10.0, y1), Vector2(r.end.x - 10.0, y1), line, 5.0, true)
	ci.draw_line(Vector2(r.position.x + 10.0, y2), Vector2(r.end.x - 10.0, y2), line, 5.0, true)
	var mx: float = r.get_center().x
	ci.draw_line(Vector2(mx, r.position.y + 10.0), Vector2(mx, y1), line, 5.0, true)
	ci.draw_line(Vector2(mx - r.size.x * 0.25, y1), Vector2(mx - r.size.x * 0.25, y2), line, 5.0, true)
	ci.draw_line(Vector2(mx + r.size.x * 0.25, y1), Vector2(mx + r.size.x * 0.25, y2), line, 5.0, true)
	ci.draw_line(Vector2(mx, y2), Vector2(mx, r.end.y - 16.0), line, 5.0, true)

func _draw_goal(ci: CanvasItem, r: Rect2) -> void:
	var tex: Texture2D = AssetRegistry.texture(GOAL_KEY)
	if tex != null:
		ci.draw_texture_rect(tex, r.grow(-8.0), false)
		return
	var s: Vector2 = r.size
	var p: Vector2 = r.position
	var foot: Vector2 = p + Vector2(0.36, 0.82) * s
	ci.draw_circle(foot + Vector2(0.06 * s.x, 0), s.x * 0.14, ClayStyle.SHADOW, true, -1.0, true)
	ci.draw_line(foot, p + Vector2(0.36, 0.16) * s, ClayStyle.COCOA, 9.0, true)
	var flag: PackedVector2Array = PackedVector2Array([
		p + Vector2(0.38, 0.17) * s, p + Vector2(0.8, 0.3) * s, p + Vector2(0.38, 0.45) * s])
	ci.draw_colored_polygon(flag, FLAG_COLOR)
	ci.draw_polyline(flag + PackedVector2Array([flag[0]]), FLAG_COLOR.darkened(0.3), 4.0, true)

## Karakter: `char.grid.gezgin` dokusu ya da kil piyon; her durumda baktığı yönü gösteren üçgen.
func _draw_pawn(ci: CanvasItem, r: Rect2) -> void:
	var tex: Texture2D = AssetRegistry.texture(CHAR_KEY)
	var c: Vector2 = r.get_center()
	var s: float = minf(r.size.x, r.size.y)
	if tex != null:
		ci.draw_texture_rect(tex, r, false)
	else:
		ci.draw_circle(c + Vector2(0, s * 0.05), s * 0.34, ClayStyle.SHADOW, true, -1.0, true)
		ci.draw_circle(c, s * 0.34, PAWN_COLOR, true, -1.0, true)
		ci.draw_arc(c, s * 0.34, 0.0, TAU, 48, PAWN_COLOR.darkened(0.3), 5.0, true)
		ci.draw_circle(c + Vector2(-0.12, -0.12) * s, s * 0.07, Color(1, 1, 1, 0.4), true, -1.0, true)
	var d: Vector2 = Vector2(GridLogic.DIRS[_char_facing] as Vector2i)
	var perp: Vector2 = Vector2(-d.y, d.x)
	var tri: PackedVector2Array = PackedVector2Array([
		c + d * s * 0.5, c + d * s * 0.3 + perp * s * 0.14, c + d * s * 0.3 - perp * s * 0.14])
	ci.draw_colored_polygon(tri, ClayStyle.INK)

func _draw_card_icon(ci: CanvasItem, kind: String, r: Rect2) -> void:
	var c: Vector2 = r.get_center()
	var s: float = minf(r.size.x, r.size.y)
	match kind:
		"turn_left":
			_draw_turn(ci, c, s, -1.0)
		"turn_right":
			_draw_turn(ci, c, s, 1.0)
		_:
			var dir_name: String = "up" if kind == "forward" else kind
			_draw_arrow(ci, c, s, Vector2(GridLogic.DIRS[dir_name] as Vector2i))

## Kalın düz ok (ileri / mutlak yön).
static func _draw_arrow(ci: CanvasItem, c: Vector2, s: float, d: Vector2) -> void:
	var w: float = s * 0.12
	var perp: Vector2 = Vector2(-d.y, d.x)
	var tail: Vector2 = c - d * s * 0.3
	ci.draw_line(tail, c + d * s * 0.06, ClayStyle.INK, w, true)
	ci.draw_circle(tail, w / 2.0, ClayStyle.INK, true, -1.0, true)
	ci.draw_colored_polygon(PackedVector2Array([
		c + d * s * 0.34, c + d * s * 0.04 + perp * s * 0.2, c + d * s * 0.04 - perp * s * 0.2]), ClayStyle.INK)

## Kıvrık dönüş oku: aşağıdan yukarı çıkar, çeyrek yayla yana (side: -1 sol, 1 sağ) döner.
static func _draw_turn(ci: CanvasItem, c: Vector2, s: float, side: float) -> void:
	var w: float = s * 0.12
	var rad: float = s * 0.22
	var center: Vector2 = c + Vector2(0.1 * side, 0.0) * s
	var pts: PackedVector2Array = PackedVector2Array([c + Vector2(-0.12 * side, 0.32) * s])
	for k: int in 13:
		var a: float = lerpf(PI, PI * 1.5, k / 12.0)
		pts.append(center + Vector2(cos(a) * side, sin(a)) * rad)
	ci.draw_polyline(pts, ClayStyle.INK, w, true)
	ci.draw_circle(pts[0], w / 2.0, ClayStyle.INK, true, -1.0, true)
	var tip_base: Vector2 = pts[pts.size() - 1]
	ci.draw_colored_polygon(PackedVector2Array([
		tip_base + Vector2(0.2 * side, 0.0) * s, tip_base + Vector2(0.0, -0.17) * s, tip_base + Vector2(0.0, 0.17) * s]), ClayStyle.INK)

func _cell_center(cell: Vector2i) -> Vector2:
	return (Vector2(cell) + Vector2(0.5, 0.5)) * _cell

## Üst katman: simetri ekseni, program izi (çizgi + kare), ipucu noktaları (daire).
func _draw_overlay() -> void:
	if _ask == "symmetry" and _axis_dir == "horizontal":
		var y: float = _axis * _cell
		_overlay.draw_dashed_line(Vector2(-12.0, y), Vector2(_cols * _cell + 12.0, y), ClayStyle.INK, 10.0, 26.0)
	elif _ask == "symmetry":
		var x: float = _axis * _cell
		_overlay.draw_dashed_line(Vector2(x, -12.0), Vector2(x, _rows * _cell + 12.0), ClayStyle.INK, 10.0, 26.0)
	var trail: Array[Vector2i] = trail_cells()
	if not trail.is_empty():
		var pts: PackedVector2Array = PackedVector2Array([_cell_center(_start)])
		for s: Dictionary in _simulate(_program)["states"] as Array:
			var p: Vector2 = _cell_center(s["cell"] as Vector2i)
			if p != pts[pts.size() - 1]:
				pts.append(p)
		if pts.size() >= 2:
			_overlay.draw_polyline(pts, TRAIL_COLOR, _cell * 0.12, true)
		var q: float = _cell * 0.09
		for c: Vector2i in trail:
			_overlay.draw_rect(Rect2(_cell_center(c) - Vector2(q, q), Vector2(q, q) * 2.0), TRAIL_COLOR)
	for c: Vector2i in _hint_dots:
		_overlay.draw_circle(_cell_center(c), _cell * 0.11, DOT_COLOR, true, -1.0, true)

func _draw_reference(ci: Control) -> void:
	var rs: float = minf(ci.size.x / _cols, ci.size.y / _rows)
	var grid_size: Vector2 = Vector2(_cols, _rows) * rs
	var o: Vector2 = (ci.size - grid_size) / 2.0
	ci.draw_style_box(ClayStyle.card_box(ClayStyle.SAND, 24), Rect2(o - Vector2(12, 12), grid_size + Vector2(24, 24)))
	for r: int in _rows:
		for c: int in _cols:
			var rect: Rect2 = Rect2(o + Vector2(c, r) * rs, Vector2(rs, rs)).grow(-3.0)
			if _reference.has(Vector2i(c, r)):
				ci.draw_style_box(ClayStyle.plaque_box(PAINT_COLOR, PAINT_COLOR.darkened(0.22), 8, 3, 4, 0), rect)
				ci.draw_circle(rect.get_center() - Vector2(0, 2), rs * 0.13, ClayStyle.IVORY, true, -1.0, true)
			else:
				ci.draw_style_box(ClayStyle.panel_box(CELL_COLOR, 8), rect)

# ================= İpuçları =================

func show_hint(level: int) -> void:
	if _done or _busy:
		return
	if level == 1:
		_hint_one()
	elif level >= 2:
		_solve()

func _hint_one() -> void:
	if _ask == "build":
		_hint_dots = _path_cells(GridLogic.shortest_program(_start, _facing, _goal, _arrows, _cols, _rows, _walls))
		_hint_card = _next_card()
		if _hint_card != "":
			_glow(_palette[_hint_card] as Control)
		_overlay.queue_redraw()
	elif _ask == "follow":
		var states: Array = _simulate(_program)["states"]
		var half: Array = states.slice(0, ceili(states.size() / 2.0))
		_hint_dots = []
		for s: Dictionary in half:
			var c: Vector2i = s["cell"]
			if c != _start and not _hint_dots.has(c):
				_hint_dots.append(c)
		_overlay.queue_redraw()
	elif _ask == "pieces":
		_show_counter()
		_glow(_target_tile)
	else:
		_marked.clear()
		for c: Vector2i in _painted:
			if not _target.has(c) and not _locked.has(c):
				_marked[c] = true
		_missing = Vector2i(-1, -1)
		for c: Vector2i in GridLogic.sorted_cells(_target.keys()):
			if not _painted.has(c):
				_missing = c
				break
		if _missing.x >= 0:
			_glow(_cells[_missing] as Control)
		_redraw_cells()

## İpucu 2: doğru durum kurulur ve onaylanır; tur her durumda biter (helped).
func _solve() -> void:
	helped = true
	_busy = true
	if _ask == "build":
		_program = GridLogic.shortest_program(_start, _facing, _goal, _arrows, _cols, _rows, _walls)
		_rebuild_strip()
		_glow(_check)
		await _wait(SOLVE_SECONDS)
		if _done:
			return
		_run_program()
	elif _ask == "follow":
		_glow(_cells[_follow_end] as Control)
		await _wait(SOLVE_SECONDS)
		if _done:
			return
		_finish_follow()
	else:
		var want: Dictionary = _solution()
		_painted = want
		for c: Vector2i in _locked:
			_painted[c] = true
		_marked.clear()
		_refresh_paint()
		_glow(_check)
		await _wait(SOLVE_SECONDS)
		_busy = false
		if _done:
			return
		_submit_answer(true)

# --- Test kancaları ---

func _debug_answer(correct: bool) -> void:
	match _ask:
		"build":
			for i: int in range(_program.size() - 1, -1, -1):
				_remove_card(i)
			if correct:
				for k: String in GridLogic.shortest_program(_start, _facing, _goal, _arrows, _cols, _rows, _walls):
					_add_card(k)
			_check_answer()
		"follow":
			_tap_cell(_follow_end if correct else _start)
		_:
			var want: Dictionary = _solution() if correct else {}
			for c: Vector2i in _cells:
				if not _locked.has(c) and _painted.has(c) != want.has(c):
					_toggle(c)
			_check_answer()

func _debug_card(kind: String) -> void:
	_add_card(kind)

func _debug_remove(i: int) -> void:
	_remove_card(i)

func _debug_check() -> void:
	_check_answer()

func _debug_tap_cell(cell: Vector2i) -> void:
	_tap_cell(cell)

func program() -> Array[String]:
	return _program.duplicate()

func painted() -> Array[Vector2i]:
	return GridLogic.sorted_cells(_painted.keys())

## copy: sağdaki örnekte görünen hücreler.
func reference_cells() -> Array[Vector2i]:
	return GridLogic.sorted_cells(_reference.keys())

func character_cell() -> Vector2i:
	return _char_cell

## Zorluk 1'de (build) mevcut programın gideceği hücreler (başlangıç hariç).
func trail_cells() -> Array[Vector2i]:
	if _ask != "build" or difficulty > 1:
		return [] as Array[Vector2i]
	return _path_cells(_program)

## İpucu 1'in işaretlediği hücreler: yolda noktalar; boyamada silinecekler + ilk eksik hücre.
func hint_cells() -> Array[Vector2i]:
	if _mode == "path":
		return _hint_dots.duplicate()
	var res: Array = _marked.keys()
	if _missing.x >= 0:
		res.append(_missing)
	return GridLogic.sorted_cells(res)

func hint_card() -> String:
	return _hint_card

func shortest_length() -> int:
	return _min_len

func palette_count() -> int:
	return _palette_list.size()

func is_counter_shown() -> bool:
	return _count_tile != null

func touch_targets() -> Array[Control]:
	var res: Array[Control] = []
	if _ask == "build":
		res.append_array(_palette_list)
		res.append_array(_strip)
		res.append(_check)
	elif _ask == "follow":
		for v: Control in _cells.values():
			res.append(v)
	else:
		for c: Vector2i in _cells:
			if not _locked.has(c):
				res.append(_cells[c] as Control)
		res.append(_check)
	return res

# ================= Doğrulama =================

static func validate_params(p: Dictionary) -> Array[String]:
	var errs: Array[String] = []
	var mode: Variant = p.get("mode")
	if not (mode is String) or not MODES.has(mode as String):
		errs.append(ContentValidator.msg("err.params.grid_mode"))
		return errs
	var m: String = mode
	var ask: Variant = p.get("ask")
	var asks: PackedStringArray = PATH_ASKS if m == "path" else PAINT_ASKS
	if not (ask is String) or not asks.has(ask as String):
		errs.append(ContentValidator.msg("err.params.grid_ask"))
		return errs
	var col_range: Vector2i = PATH_COLS if m == "path" else PAINT_COLS
	var row_range: Vector2i = PATH_ROWS if m == "path" else PAINT_ROWS
	var cols_v: Variant = p.get("cols")
	var rows_v: Variant = p.get("rows")
	if not ContentValidator.is_int_like(cols_v) or not ContentValidator.is_int_like(rows_v) \
			or int(cols_v) < col_range.x or int(cols_v) > col_range.y \
			or int(rows_v) < row_range.x or int(rows_v) > row_range.y:
		errs.append(ContentValidator.msg("err.params.grid_size"))
		return errs
	var cols: int = int(cols_v)
	var rows: int = int(rows_v)
	if cell_size_for(m, cols, rows) < MIN_CELL:
		errs.append(ContentValidator.msg("err.params.grid_cell"))
		return errs
	if m == "path":
		errs.append_array(_validate_path(p, str(ask), cols, rows))
	else:
		errs.append_array(_validate_paint(p, str(ask), cols, rows))
	return errs

static func _validate_path(p: Dictionary, ask: String, cols: int, rows: int) -> Array[String]:
	var errs: Array[String] = []
	var facing: Variant = p.get("facing", "right")
	if not (facing is String) or not GridLogic.DIRS.has(facing):
		errs.append(ContentValidator.msg("err.params.grid_facing"))
	var arrows: Variant = p.get("arrows", "relative")
	if not (arrows is String) or not ARROW_SETS.has(arrows as String):
		errs.append(ContentValidator.msg("err.params.grid_arrows"))
	var walls: Dictionary = {}
	var walls_v: Variant = GridLogic.parse_cells(p.get("walls", []))
	var walls_ok: bool = walls_v is Array and (walls_v as Array).size() <= floori(cols * rows / 3.0)
	if walls_v is Array:
		for w: Vector2i in walls_v as Array:
			if not GridLogic.in_bounds(w, cols, rows) or walls.has(w):
				walls_ok = false
			walls[w] = true
	if not walls_ok:
		errs.append(ContentValidator.msg("err.params.grid_walls"))
	var start: Variant = GridLogic.parse_cell(p.get("start"))
	if not (start is Vector2i) or not GridLogic.in_bounds(start as Vector2i, cols, rows) or walls.has(start):
		errs.append(ContentValidator.msg("err.params.grid_start"))
	if not errs.is_empty():
		return errs
	var s: Vector2i = start
	var f: String = facing
	var arr: String = arrows
	if ask == "build":
		var goal: Variant = GridLogic.parse_cell(p.get("goal"))
		if not (goal is Vector2i) or not GridLogic.in_bounds(goal as Vector2i, cols, rows) or goal == s or walls.has(goal):
			errs.append(ContentValidator.msg("err.params.grid_goal"))
			return errs
		if p.has("shortest") and not (p["shortest"] is bool):
			errs.append(ContentValidator.msg("err.params.grid_shortest"))
		if not GridLogic.is_reachable(s, f, goal as Vector2i, arr, cols, rows, walls):
			errs.append(ContentValidator.msg("err.params.grid_unreachable"))
		return errs
	var prog: Variant = p.get("program")
	var cards: PackedStringArray = GridLogic.cards_for(arr)
	var ok: bool = prog is Array and (prog as Array).size() >= 1 and (prog as Array).size() <= MAX_PROGRAM
	if ok:
		for k: Variant in prog as Array:
			if not (k is String) or not cards.has(k as String):
				ok = false
	if not ok:
		errs.append(ContentValidator.msg("err.params.grid_program"))
		return errs
	var sim: Dictionary = GridLogic.simulate(prog as Array, s, f, cols, rows, walls)
	if bool(sim["blocked"]):
		errs.append(ContentValidator.msg("err.params.grid_program_path"))
	elif sim["end"] == s:
		errs.append(ContentValidator.msg("err.params.grid_program_end"))
	return errs

## Boş olmayan, ızgara içi, tekrarsız hücre listesi mi?
static func _valid_cells(v: Variant, cols: int, rows: int) -> bool:
	var cells: Variant = GridLogic.parse_cells(v)
	if not (cells is Array) or (cells as Array).is_empty():
		return false
	var seen: Dictionary = {}
	for c: Vector2i in cells as Array:
		if not GridLogic.in_bounds(c, cols, rows) or seen.has(c):
			return false
		seen[c] = true
	return true

static func _validate_paint(p: Dictionary, ask: String, cols: int, rows: int) -> Array[String]:
	var errs: Array[String] = []
	match ask:
		"copy", "silhouette":
			if not _valid_cells(p.get("target"), cols, rows):
				errs.append(ContentValidator.msg("err.params.grid_target"))
				return errs
			if p.has("transform") or p.has("reference"):
				errs.append_array(_validate_transform(p, ask, cols, rows))
		"symmetry":
			var dir: Variant = p.get("axis_dir", "vertical")
			if not (dir is String) or not AXIS_DIRS.has(dir as String):
				errs.append(ContentValidator.msg("err.params.grid_axis_dir"))
				return errs
			var horizontal: bool = dir == "horizontal"
			var limit: int = rows if horizontal else cols
			var axis: Variant = p.get("axis")
			if not ContentValidator.is_int_like(axis) or int(axis) < 1 or int(axis) > limit - 1:
				errs.append(ContentValidator.msg("err.params.grid_axis"))
				return errs
			if not _valid_cells(p.get("given"), cols, rows):
				errs.append(ContentValidator.msg("err.params.grid_given"))
				return errs
			var given: Array = GridLogic.parse_cells(p.get("given"))
			for c: Vector2i in given:
				if (c.y if horizontal else c.x) >= int(axis):
					errs.append(ContentValidator.msg("err.params.grid_given"))
					return errs
			for c: Vector2i in given:
				if not GridLogic.in_bounds(GridLogic.mirror_axis(c, int(axis), dir as String), cols, rows):
					errs.append(ContentValidator.msg("err.params.grid_mirror"))
					return errs
		"code":
			var start: Variant = GridLogic.parse_cell(p.get("start"))
			if not (start is Vector2i) or not GridLogic.in_bounds(start as Vector2i, cols, rows):
				errs.append(ContentValidator.msg("err.params.grid_start"))
				return errs
			var code: Variant = p.get("code")
			if not _valid_code(code):
				errs.append(ContentValidator.msg("err.params.grid_code"))
				return errs
			for c: Vector2i in GridLogic.code_cells(start as Vector2i, code as Array):
				if not GridLogic.in_bounds(c, cols, rows):
					errs.append(ContentValidator.msg("err.params.grid_code_path"))
					return errs
		"pieces":
			var n: Variant = p.get("pieces")
			if not ContentValidator.is_int_like(n) or int(n) < PIECES_MIN or int(n) > PIECES_MAX or int(n) > cols * rows:
				errs.append(ContentValidator.msg("err.params.grid_pieces"))
	return errs

## copy dönüşümü: transform rotate ya da scale, reference geçerli hücreler; hedef örneğin dönüşmüş
## biçimlerinden biri olmalı. Dönünce değişmeyen örnek (kare, tek hücre) döndürme sorusu olamaz.
static func _validate_transform(p: Dictionary, ask: String, cols: int, rows: int) -> Array[String]:
	var errs: Array[String] = []
	var kind: Variant = p.get("transform")
	if ask != "copy" or not (kind is String) or not TRANSFORMS.has(kind as String) or not _valid_cells(p.get("reference"), cols, rows):
		errs.append(ContentValidator.msg("err.params.grid_transform"))
		return errs
	var reference: Array = GridLogic.parse_cells(p["reference"])
	var shapes: Array = GridLogic.transform_shapes(reference, kind as String)
	if shapes.is_empty():
		errs.append(ContentValidator.msg("err.params.grid_transform_same"))
	elif not shapes.has(GridLogic.normalized(GridLogic.parse_cells(p["target"]))):
		errs.append(ContentValidator.msg("err.params.grid_transform_target"))
	return errs

## 1–6 komut; her biri [yön, 1–9 tam sayı].
static func _valid_code(code: Variant) -> bool:
	if not (code is Array) or (code as Array).is_empty() or (code as Array).size() > MAX_CODE:
		return false
	for ins: Variant in code as Array:
		if not (ins is Array) or (ins as Array).size() != 2:
			return false
		var pair: Array = ins
		if not (pair[0] is String) or not GridLogic.DIRS.has(pair[0]):
			return false
		if not ContentValidator.is_int_like(pair[1]) or int(pair[1]) < 1 or int(pair[1]) > MAX_CODE_COUNT:
			return false
	return true
