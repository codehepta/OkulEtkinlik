extends "res://tests/helpers/template_harness.gd"
## grid: yol kurma / izleme ve boyama (kopya, simetri, kod, silüet, parça).

const GridLogic: GDScript = preload("res://scripts/core/grid_logic.gd")
const RUN_TIMEOUT: float = 8.0

func _build(extra: Dictionary = {}) -> Dictionary:
	var p: Dictionary = {"mode": "path", "ask": "build", "cols": 6, "rows": 4, "start": [0, 3], "facing": "right",
		"goal": [5, 0], "walls": [[2, 3], [2, 2]], "arrows": "relative", "shortest": false}
	p.merge(extra, true)
	return p

func _absolute(extra: Dictionary = {}) -> Dictionary:
	var p: Dictionary = {"mode": "path", "ask": "build", "cols": 6, "rows": 4, "start": [0, 3],
		"goal": [5, 0], "walls": [[2, 3], [2, 2]], "arrows": "absolute"}
	p.merge(extra, true)
	return p

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

func _all() -> Array[Dictionary]:
	return [_build(), _absolute({"shortest": true}), _follow(), _copy(), _sym(), _code(), _sil(), _pieces()]

func _cells(list: Array) -> Array[Vector2i]:
	var res: Array[Vector2i] = []
	for c: Array in list:
		res.append(Vector2i(int(c[0]), int(c[1])))
	return GridLogic.sorted_cells(res)

func _add(g: MiniGame, kinds: Array) -> void:
	for k: String in kinds:
		g.call("_debug_card", k)

func _painted(g: MiniGame) -> Array[Vector2i]:
	var res: Array[Vector2i] = []
	res.assign(g.call("painted"))
	return res

func test_path_build_correct_and_wrong() -> void:
	var g: MiniGame = make("grid", _build(), 2)
	assert_eq(g.call("character_cell"), Vector2i(0, 3))
	_add(g, ["forward", "forward"])
	assert_eq(g.call("program"), ["forward", "forward"] as Array[String])
	g.call("_debug_check")
	await wait_until(func() -> bool: return answers.size() == 1, RUN_TIMEOUT)
	assert_eq(answers, [false] as Array[bool], "duvara çarpma yanlış")
	await wait_unlocked(g)
	assert_eq(g.call("program"), ["forward", "forward"] as Array[String], "yanlıştan sonra program korunur")
	assert_eq(g.call("character_cell"), Vector2i(0, 3), "karakter başlangıca döner")
	g.call("_debug_remove", 0)
	assert_eq((g.call("program") as Array).size(), 1)
	for i: int in 14:
		g.call("_debug_card", "turn_left")
	assert_eq((g.call("program") as Array).size(), 12, "en çok 12 kart")
	g.call("_debug_answer", true)
	await wait_for_signal(g.finished, RUN_TIMEOUT)
	assert_eq(answers, [false, true] as Array[bool])
	assert_eq(g.call("character_cell"), Vector2i(5, 0))
	assert_false(results[0].helped)

func test_path_build_wrong_end_cell() -> void:
	var g: MiniGame = make("grid", _build(), 2)
	_add(g, ["turn_left", "forward"])
	g.call("_debug_check")
	await wait_until(func() -> bool: return answers.size() == 1, RUN_TIMEOUT)
	assert_eq(answers, [false] as Array[bool], "hedef dışında bitmek yanlış")

func test_path_build_shortest_required() -> void:
	var g: MiniGame = make("grid", _absolute({"shortest": true}), 2)
	assert_eq(int(g.call("shortest_length")), 8)
	_add(g, ["right", "left", "up", "up", "up", "right", "right", "right", "right", "right"])
	g.call("_debug_check")
	await wait_until(func() -> bool: return answers.size() == 1, RUN_TIMEOUT)
	assert_eq(answers, [false] as Array[bool], "uzun program en kısa istenince yanlış")
	await wait_unlocked(g)
	g.call("_debug_answer", true)
	await wait_for_signal(g.finished, RUN_TIMEOUT)
	assert_eq(answers, [false, true] as Array[bool])
	assert_eq((g.call("program") as Array).size(), 8)

func test_path_absolute_arrows() -> void:
	var g: MiniGame = make("grid", _absolute(), 2)
	assert_eq(int(g.call("palette_count")), 4)
	_add(g, ["up", "up", "up", "right", "right", "right", "right", "right"])
	g.call("_debug_check")
	await wait_for_signal(g.finished, RUN_TIMEOUT)
	assert_eq(answers, [true] as Array[bool])
	assert_eq(g.call("character_cell"), Vector2i(5, 0))
	assert_eq(int(make("grid", _build(), 2).call("palette_count")), 3, "göreli: ileri, sola, sağa")

func test_path_follow_correct_and_wrong() -> void:
	var g: MiniGame = make("grid", _follow())
	assert_eq(g.call("program"), ["forward", "forward", "turn_right", "forward"] as Array[String])
	g.call("_debug_card", "forward")
	assert_eq((g.call("program") as Array).size(), 4, "follow programı salt okunur")
	g.call("_debug_tap_cell", Vector2i(0, 0))
	assert_eq(answers, [false] as Array[bool])
	await wait_unlocked(g)
	g.call("_debug_tap_cell", Vector2i(1, 1))
	await wait_for_signal(g.finished, RUN_TIMEOUT)
	assert_eq(answers, [false, true] as Array[bool])
	assert_eq(g.call("character_cell"), Vector2i(1, 1))

func test_path_build_trail_difficulty() -> void:
	var g: MiniGame = make("grid", _build(), 1)
	assert_eq(g.call("trail_cells"), [] as Array[Vector2i])
	g.call("_debug_card", "forward")
	assert_eq(g.call("trail_cells"), [Vector2i(1, 3)] as Array[Vector2i])
	_add(g, ["turn_left", "forward"])
	assert_eq(g.call("trail_cells"), [Vector2i(1, 3), Vector2i(1, 2)] as Array[Vector2i])
	g.call("_debug_remove", 0)
	assert_eq(g.call("trail_cells"), [Vector2i(0, 2)] as Array[Vector2i])
	assert_eq(answers.size(), 0, "kart eklemek cevap sayılmaz")
	var d2: MiniGame = make("grid", _build(), 2)
	d2.call("_debug_card", "forward")
	assert_eq(d2.call("trail_cells"), [] as Array[Vector2i], "zorluk 2: iz yok")

func test_paint_copy_toggle_and_check() -> void:
	var g: MiniGame = make("grid", _copy(), 1)
	assert_true(bool(g.call("is_counter_shown")))
	for c: Vector2i in [Vector2i(1, 1), Vector2i(2, 1), Vector2i(5, 5)]:
		g.call("_debug_tap_cell", c)
	assert_eq(_painted(g).size(), 3)
	assert_eq(answers.size(), 0, "boyamak cevap sayılmaz")
	g.call("_debug_check")
	assert_eq(answers, [false] as Array[bool])
	await wait_unlocked(g)
	assert_eq(_painted(g).size(), 3, "yanlış onay boyamayı korur")
	g.call("_debug_tap_cell", Vector2i(5, 5))
	g.call("_debug_tap_cell", Vector2i(1, 2))
	assert_eq(_painted(g), _cells(_copy()["target"]))
	g.call("_debug_check")
	await wait_for_signal(g.finished, 3.0)
	assert_eq(answers, [false, true] as Array[bool])
	assert_false(bool(make("grid", _copy(), 2).call("is_counter_shown")), "zorluk 2: sayaç yok")

func test_paint_symmetry_locked_given() -> void:
	var g: MiniGame = make("grid", _sym(), 2)
	assert_eq(_painted(g), _cells(_sym()["given"]), "verilenler boyalı başlar")
	g.call("_debug_tap_cell", Vector2i(3, 1))
	assert_eq(_painted(g).size(), 3, "verilen hücre kilitli")
	for c: Vector2i in [Vector2i(4, 1), Vector2i(5, 2), Vector2i(4, 2)]:
		g.call("_debug_tap_cell", c)
	g.call("_debug_check")
	await wait_for_signal(g.finished, 3.0)
	assert_eq(answers, [true] as Array[bool])

func test_paint_code_target() -> void:
	var g: MiniGame = make("grid", _code(), 2)
	g.call("_debug_tap_cell", Vector2i(1, 1))
	g.call("_debug_check")
	assert_eq(answers, [false] as Array[bool])
	await wait_unlocked(g)
	g.call("_debug_answer", true)
	await wait_for_signal(g.finished, 3.0)
	assert_eq(_painted(g), GridLogic.sorted_cells(GridLogic.code_cells(Vector2i(1, 1), _code()["code"])))
	assert_eq(_painted(g).size(), 9)

func test_paint_silhouette() -> void:
	var g: MiniGame = make("grid", _sil(), 2)
	for c: Vector2i in _cells(_sil()["target"]):
		g.call("_debug_tap_cell", c)
	g.call("_debug_check")
	await wait_for_signal(g.finished, 3.0)
	assert_eq(answers, [true] as Array[bool])

func test_paint_pieces_connected_and_count() -> void:
	var g: MiniGame = make("grid", _pieces(), 1)
	for c: Vector2i in [Vector2i(0, 0), Vector2i(1, 0), Vector2i(2, 0), Vector2i(3, 0), Vector2i(5, 4)]:
		g.call("_debug_tap_cell", c)
	g.call("_debug_check")
	assert_eq(answers, [false] as Array[bool], "5 hücre ama bağlı değil")
	await wait_unlocked(g)
	g.call("_debug_tap_cell", Vector2i(5, 4))
	g.call("_debug_check")
	assert_eq(answers, [false, false] as Array[bool], "4 hücre eksik")
	await wait_unlocked(g)
	g.call("_debug_tap_cell", Vector2i(3, 1))
	g.call("_debug_check")
	await wait_for_signal(g.finished, 3.0)
	assert_eq(answers, [false, false, true] as Array[bool])

func test_grid_hints() -> void:
	var b: MiniGame = make("grid", _build(), 2)
	b.call("_debug_card", "turn_right")
	b.show_hint(1)
	var walls: Dictionary = {Vector2i(2, 3): true, Vector2i(2, 2): true}
	var best: Array[String] = GridLogic.shortest_program(Vector2i(0, 3), "right", Vector2i(5, 0), "relative", 6, 4, walls)
	assert_eq(str(b.call("hint_card")), best[0], "sapmadan önceki doğru kart parlar")
	var dots: Array[Vector2i] = []
	dots.assign(b.call("hint_cells"))
	assert_true(dots.has(Vector2i(5, 0)) and dots.size() >= 8, "en kısa yol noktaları")
	var f: MiniGame = make("grid", _follow())
	f.show_hint(1)
	assert_eq(f.call("hint_cells"), [Vector2i(0, 2), Vector2i(0, 1)] as Array[Vector2i], "yolun ilk yarısı")
	var c: MiniGame = make("grid", _copy(), 2)
	c.call("_debug_tap_cell", Vector2i(5, 5))
	c.show_hint(1)
	assert_eq(c.call("hint_cells"), [Vector2i(1, 1), Vector2i(5, 5)] as Array[Vector2i], "yanlış hücre + ilk eksik")
	assert_eq(answers.size(), 0)
	var p: MiniGame = make("grid", _pieces(), 3)
	assert_false(bool(p.call("is_counter_shown")))
	p.show_hint(1)
	assert_true(bool(p.call("is_counter_shown")), "ipucu sayacı gösterir")
	for params: Dictionary in _all():
		results = []
		var g: MiniGame = make("grid", params, 3)
		if params["mode"] == "paint":
			g.call("_debug_tap_cell", Vector2i(2, 4))
		g.show_hint(2)
		await wait_for_signal(g.finished, RUN_TIMEOUT)
		assert_eq(results.size(), 1, "ipucu 2 turu bitirir: " + str(params["ask"]))
		if results.size() == 1:
			assert_true(results[0].helped)

func test_grid_hint2_paint_states() -> void:
	var g: MiniGame = make("grid", _sym(), 2)
	g.show_hint(2)
	await wait_for_signal(g.finished, 3.0)
	assert_eq(_painted(g), _cells([[3, 1], [2, 2], [3, 2], [4, 1], [5, 2], [4, 2]]))
	var p: MiniGame = make("grid", _pieces(), 2)
	p.call("_debug_tap_cell", Vector2i(5, 4))
	p.show_hint(2)
	await wait_for_signal(p.finished, 3.0)
	assert_eq(_painted(p).size(), 5)
	assert_true(GridLogic.cells_connected(_painted(p)))

func test_grid_touch_targets() -> void:
	var b: MiniGame = make("grid", _build({"cols": 8, "rows": 5, "start": [0, 4], "goal": [7, 0]}), 1)
	_add(b, ["forward", "turn_left", "forward"])
	assert_touch_targets(b)
	assert_touch_targets(make("grid", _absolute(), 1))
	assert_touch_targets(make("grid", _follow()))
	assert_touch_targets(make("grid", {"mode": "paint", "ask": "copy", "cols": 8, "rows": 6, "target": [[1, 1]]}, 1))
	assert_touch_targets(make("grid", _sym(), 1))
	assert_touch_targets(make("grid", _code(), 1))

func test_grid_debug_answer_paths() -> void:
	for params: Dictionary in _all():
		answers = []
		results = []
		var g: MiniGame = make("grid", params)
		g.call("_debug_answer", false)
		await wait_until(func() -> bool: return answers.size() == 1, RUN_TIMEOUT)
		await wait_unlocked(g)
		g.call("_debug_answer", true)
		await wait_for_signal(g.finished, RUN_TIMEOUT)
		assert_eq(answers, [false, true] as Array[bool], str(params["ask"]))

func test_check_double_press_counts_once() -> void:
	var b: MiniGame = make("grid", _build())
	b.call("_debug_check")
	b.call("_debug_check")
	b.call("_debug_check")
	await wait_until(func() -> bool: return answers.size() >= 1, RUN_TIMEOUT)
	await wait_seconds(0.2)
	assert_eq(answers.size(), 1)
	answers = []
	var c: MiniGame = make("grid", _copy())
	c.call("_debug_check")
	c.call("_debug_check")
	c.call("_debug_check")
	assert_eq(answers.size(), 1)

## Bilge sol alt köşede durur (lesson_runner: x 16–266, y 724–1068); ızgara ve şerit oraya taşmaz.
func test_grid_keeps_bilge_corner_clear() -> void:
	var corner: Rect2 = Rect2(16, 724, 250, 344)
	var widest: Array[Dictionary] = [
		_build({"cols": 8, "rows": 5, "start": [0, 4], "goal": [7, 0]}),
		{"mode": "paint", "ask": "copy", "cols": 8, "rows": 6, "target": [[0, 5]]}]
	for params: Dictionary in _all() + widest:
		var g: MiniGame = make("grid", params, 1)
		for c: Control in g.call("touch_targets") as Array[Control]:
			assert_false(c.get_global_rect().intersects(corner), "%s Bilge köşesine taşmamalı: %s" % [c.name, c.get_global_rect()])
