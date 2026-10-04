extends GutTest
## grid şablonunun kaydı, parametre doğrulaması (TemplateRegistry üzerinden) ve saf mantığı.

const GridLogic: GDScript = preload("res://scripts/core/grid_logic.gd")
const FIXTURE_PATH: String = "res://tests/fixtures/faz3b/grid.json"

func _ok(p: Dictionary) -> void:
	assert_eq(TemplateRegistry.validate("grid", p), [] as Array[String], "grid geçerli olmalı: " + str(p))

func _bad(p: Dictionary, why: String) -> void:
	assert_gt(TemplateRegistry.validate("grid", p).size(), 0, "grid geçersiz olmalı: " + why)

func _errs(p: Dictionary) -> Array[String]:
	return TemplateRegistry.validate("grid", p)

func _with(base: Dictionary, changes: Dictionary) -> Dictionary:
	var p: Dictionary = base.duplicate(true)
	for k: String in changes:
		if changes[k] == null:
			p.erase(k)
		else:
			p[k] = changes[k]
	return p

func _build() -> Dictionary:
	return {"mode": "path", "ask": "build", "cols": 6, "rows": 4, "start": [0, 3], "facing": "right",
		"goal": [5, 0], "walls": [[2, 3], [2, 2]], "arrows": "relative", "shortest": false}

func _follow() -> Dictionary:
	return {"mode": "path", "ask": "follow", "cols": 5, "rows": 4, "start": [0, 3], "facing": "up",
		"program": ["forward", "forward", "turn_right", "forward"], "arrows": "relative"}

func _copy() -> Dictionary:
	return {"mode": "paint", "ask": "copy", "cols": 8, "rows": 6, "target": [[1, 1], [2, 1], [1, 2]]}

func _sym() -> Dictionary:
	return {"mode": "paint", "ask": "symmetry", "cols": 8, "rows": 5, "axis": 4, "given": [[3, 1], [2, 2], [3, 2]]}

func _code() -> Dictionary:
	return {"mode": "paint", "ask": "code", "cols": 8, "rows": 6, "start": [1, 1], "code": [["right", 3], ["down", 2], ["left", 3]]}

func _sil() -> Dictionary:
	return {"mode": "paint", "ask": "silhouette", "cols": 7, "rows": 5, "target": [[2, 1], [3, 1], [2, 2], [3, 2]]}

func _pieces() -> Dictionary:
	return {"mode": "paint", "ask": "pieces", "cols": 6, "rows": 5, "pieces": 5}

func test_grid_registered() -> void:
	assert_true(TemplateRegistry.has("grid"))
	if TemplateRegistry.has("grid"):
		assert_true(ResourceLoader.exists(TemplateRegistry.SCENES["grid"]), "sahne var")
		assert_true(ResourceLoader.exists(TemplateRegistry.script_path("grid")), "betik var")

func test_grid_fixture_params_are_valid() -> void:
	var data: Dictionary = JSON.parse_string(FileAccess.get_file_as_string(FIXTURE_PATH))
	var combos: Dictionary = {}
	for name: String in data:
		var entry: Dictionary = data[name]
		assert_eq(str(entry["template"]), "grid")
		var p: Dictionary = entry["params"]
		_ok(p)
		combos["%s/%s" % [p["mode"], p["ask"]]] = true
	assert_eq(combos.size(), 7, "her mod/soru için bir örnek: " + str(combos.keys()))

func test_grid_valid() -> void:
	for p: Dictionary in [_build(), _follow(), _copy(), _sym(), _code(), _sil(), _pieces()]:
		_ok(p)
	_ok(_with(_build(), {"walls": null, "facing": null, "arrows": null, "shortest": null}))
	_ok(_with(_build(), {"arrows": "absolute", "shortest": true}))
	_ok(_with(_follow(), {"arrows": "absolute", "program": ["up", "up", "right", "right"]}))
	_ok(_with(_build(), {"cols": 8, "rows": 5, "start": [0, 4], "goal": [7, 0]}))
	_ok(_with(_build(), {"cols": 3, "rows": 3, "start": [0, 0], "goal": [2, 2], "walls": []}))
	_ok(_with(_copy(), {"cols": 8, "rows": 6, "target": [[7, 5]]}))
	_ok(_with(_pieces(), {"cols": 3, "rows": 3, "pieces": 9}))
	_ok(_with(_pieces(), {"cols": 8, "rows": 6, "pieces": 20}))
	_ok(_with(_sym(), {"axis": 1, "given": [[0, 0]]}))

func test_grid_invalid() -> void:
	_bad(_with(_build(), {"mode": "draw"}), "bilinmeyen mod")
	_bad(_with(_build(), {"ask": "copy"}), "path'te boyama sorusu")
	_bad(_with(_copy(), {"ask": "build"}), "paint'te yol sorusu")
	_bad(_with(_build(), {"cols": 2}), "2 sütun")
	_bad(_with(_build(), {"cols": 9, "start": [0, 3]}), "path 9 sütun")
	_bad(_with(_build(), {"rows": 6}), "path 6 satır")
	_bad(_with(_build(), {"rows": 2, "start": [0, 1]}), "2 satır")
	_bad(_with(_build(), {"cols": 4.5}), "kesirli cols")
	_bad(_with(_copy(), {"cols": 9}), "paint 9 sütun")
	_bad(_with(_copy(), {"rows": 7}), "paint 7 satır")
	_bad(_with(_build(), {"facing": "north"}), "bilinmeyen yön")
	_bad(_with(_build(), {"arrows": "diagonal"}), "bilinmeyen ok seti")
	_bad(_with(_build(), {"start": [6, 0]}), "start dışarıda")
	_bad(_with(_build(), {"start": null}), "start yok")
	_bad(_with(_build(), {"start": [2, 3]}), "start duvar")
	_bad(_with(_build(), {"start": [0]}), "bozuk start")
	_bad(_with(_build(), {"goal": [0, 3]}), "goal = start")
	_bad(_with(_build(), {"goal": [5, 4]}), "goal dışarıda")
	_bad(_with(_build(), {"goal": [2, 2]}), "goal duvar")
	_bad(_with(_build(), {"goal": null}), "goal yok")
	_bad(_with(_build(), {"walls": [[2, 3], [2, 3]]}), "yinelenen duvar")
	_bad(_with(_build(), {"walls": [[6, 0]]}), "duvar dışarıda")
	_bad(_with(_build(), {"walls": "x"}), "duvar listesi değil")
	_bad({"mode": "path", "ask": "build", "cols": 3, "rows": 3, "start": [0, 0], "goal": [2, 2],
		"walls": [[1, 0], [1, 1], [0, 2], [2, 0]]}, "çok duvar (9/3'ten fazla)")
	_bad(_with(_build(), {"shortest": "yes"}), "shortest bool değil")
	_bad(_with(_follow(), {"program": []}), "boş program")
	_bad(_with(_follow(), {"program": ["turn_left", "turn_left", "turn_left", "turn_left", "turn_left", "turn_left",
		"turn_left", "turn_left", "turn_left", "turn_left", "turn_left", "turn_left", "forward"]}), "13 kart")
	_bad(_with(_follow(), {"program": ["jump"]}), "bilinmeyen kart")
	_bad(_with(_follow(), {"program": ["up", "up"]}), "göreli sette mutlak kart")
	_bad(_with(_follow(), {"arrows": "absolute"}), "mutlak sette göreli kart")
	_bad(_with(_follow(), {"program": ["forward", "forward", "forward", "forward"]}), "program ızgaradan çıkar")
	_bad(_with(_follow(), {"walls": [[0, 1]]}), "program duvara çarpar")
	_bad(_with(_follow(), {"program": ["turn_left"]}), "program başlangıçta biter")
	_bad(_with(_copy(), {"target": []}), "boş hedef")
	_bad(_with(_copy(), {"target": [[8, 0]]}), "hedef dışarıda")
	_bad(_with(_copy(), {"target": [[1, 1], [1, 1]]}), "yinelenen hedef")
	_bad(_with(_copy(), {"target": null}), "hedef yok")
	_bad(_with(_sil(), {"target": [[1, -1]]}), "negatif satır")
	_bad(_with(_sym(), {"axis": 0}), "eksen 0")
	_bad(_with(_sym(), {"axis": 8}), "eksen = cols")
	_bad(_with(_sym(), {"given": [[4, 1]]}), "verilen eksenin sağında")
	_bad(_with(_sym(), {"given": []}), "boş verilen")
	_bad(_with(_sym(), {"axis": 6, "given": [[3, 1]]}), "ayna dışarıda")
	_bad(_with(_code(), {"code": [["right", 0]]}), "adım 0")
	_bad(_with(_code(), {"code": [["right", 10]]}), "adım 10")
	_bad(_with(_code(), {"code": [["diag", 1]]}), "bilinmeyen yön")
	_bad(_with(_code(), {"code": [["right", 1], ["left", 1], ["right", 1], ["left", 1], ["right", 1], ["left", 1], ["right", 1]]}), "7 komut")
	_bad(_with(_code(), {"code": []}), "boş kod")
	_bad(_with(_code(), {"code": [["left", 3]]}), "kod dışarı çıkar")
	_bad(_with(_code(), {"start": [8, 0]}), "kod başlangıcı dışarıda")
	_bad(_with(_pieces(), {"pieces": 1}), "1 parça")
	_bad(_with(_pieces(), {"pieces": 21}), "21 parça")
	_bad(_with(_pieces(), {"cols": 3, "rows": 3, "pieces": 10}), "hücreden fazla parça")
	_bad(_with(_pieces(), {"pieces": 4.5}), "kesirli parça")

func test_grid_error_messages() -> void:
	var blocked: Dictionary = {"mode": "path", "ask": "build", "cols": 3, "rows": 3, "start": [0, 0], "goal": [2, 0],
		"walls": [[1, 0], [1, 1], [1, 2]]}
	assert_eq(_errs(blocked), [ContentValidator.msg("err.params.grid_unreachable")] as Array[String], "ulaşılamayan hedef")
	assert_eq(_errs(_with(_follow(), {"program": ["forward", "forward", "forward", "forward"]})),
		[ContentValidator.msg("err.params.grid_program_path")] as Array[String])
	assert_eq(_errs(_with(_follow(), {"program": ["turn_left"]})),
		[ContentValidator.msg("err.params.grid_program_end")] as Array[String])
	assert_eq(_errs(_with(_sym(), {"axis": 6, "given": [[3, 1]]})),
		[ContentValidator.msg("err.params.grid_mirror")] as Array[String])
	assert_eq(_errs(_with(_pieces(), {"cols": 3, "rows": 3, "pieces": 10})),
		[ContentValidator.msg("err.params.grid_pieces")] as Array[String])

func test_grid_cell_size_rule() -> void:
	var s: GDScript = load(TemplateRegistry.script_path("grid")) as GDScript
	# Her izinli boyutta hücre ≥128 px (path 8×5, paint 8×6 en sıkışık durumlar; Bilge köşesi boş kalır).
	assert_gte(float(s.call("cell_size_for", "path", 8, 5)), 128.0)
	assert_gte(float(s.call("cell_size_for", "paint", 8, 6)), 128.0)
	assert_lt(float(s.call("cell_size_for", "paint", 9, 6)), 128.0, "9 sütun 128 px'e sığmaz")

# --- saf mantık ---
func test_grid_logic_simulate_and_shortest() -> void:
	var walls: Dictionary = {Vector2i(2, 3): true, Vector2i(2, 2): true}
	var sim: Dictionary = GridLogic.simulate(["forward", "forward"], Vector2i(0, 3), "right", 6, 4, walls)
	assert_true(bool(sim["blocked"]), "duvara çarpar")
	assert_eq((sim["states"] as Array).size(), 1)
	assert_eq(sim["end"], Vector2i(1, 3))
	var turn: Dictionary = GridLogic.simulate(["turn_left", "forward"], Vector2i(0, 3), "right", 6, 4, walls)
	assert_eq(turn["end"], Vector2i(0, 2))
	assert_eq(str(turn["end_facing"]), "up")
	var rel: Array[String] = GridLogic.shortest_program(Vector2i(0, 3), "right", Vector2i(5, 0), "relative", 6, 4, walls)
	assert_eq(rel.size(), 10, "2 dönüş + 8 ileri")
	var rs: Dictionary = GridLogic.simulate(rel, Vector2i(0, 3), "right", 6, 4, walls)
	assert_false(bool(rs["blocked"]))
	assert_eq(rs["end"], Vector2i(5, 0))
	var ab: Array[String] = GridLogic.shortest_program(Vector2i(0, 3), "right", Vector2i(5, 0), "absolute", 6, 4, walls)
	assert_eq(ab.size(), 8)
	var closed: Dictionary = {Vector2i(1, 0): true, Vector2i(1, 1): true, Vector2i(1, 2): true}
	assert_false(GridLogic.is_reachable(Vector2i(0, 0), "right", Vector2i(2, 0), "relative", 3, 3, closed))

func test_grid_logic_paint_helpers() -> void:
	assert_eq(GridLogic.mirror(Vector2i(3, 1), 4), Vector2i(4, 1))
	assert_eq(GridLogic.mirror(Vector2i(0, 2), 4), Vector2i(7, 2))
	var cells: Array[Vector2i] = GridLogic.code_cells(Vector2i(1, 1), [["right", 3], ["down", 2], ["left", 3]])
	assert_eq(cells.size(), 9)
	assert_true(cells.has(Vector2i(4, 3)) and cells.has(Vector2i(1, 3)))
	assert_true(GridLogic.cells_connected([Vector2i(0, 0), Vector2i(1, 0), Vector2i(1, 1)]))
	assert_false(GridLogic.cells_connected([Vector2i(0, 0), Vector2i(1, 1)]), "çapraz bağlı sayılmaz")
	assert_false(GridLogic.cells_connected([]))
	var snake: Array[Vector2i] = GridLogic.snake_cells(3, 3, 5)
	assert_eq(snake, [Vector2i(0, 0), Vector2i(1, 0), Vector2i(2, 0), Vector2i(2, 1), Vector2i(1, 1)] as Array[Vector2i])
	assert_true(GridLogic.cells_connected(GridLogic.snake_cells(6, 5, 20)))
	assert_eq(GridLogic.sorted_cells([Vector2i(1, 2), Vector2i(3, 0), Vector2i(0, 2)]),
		[Vector2i(3, 0), Vector2i(0, 2), Vector2i(1, 2)] as Array[Vector2i])
