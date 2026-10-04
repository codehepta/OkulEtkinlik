extends "res://tests/helpers/template_harness.gd"
## trace: dik temel harf ve rakam izleme.

func test_trace_follow_all_strokes_finishes() -> void:
	var g: MiniGame = make("trace", {"chars": "a"}, 2)
	assert_eq(int(g.call("stroke_count")), 2, "a: daire + çubuk")
	g.call("_debug_trace")
	assert_eq(answers, [true] as Array[bool])
	assert_eq(int(g.call("current_stroke")), 1)
	assert_eq(results.size(), 0, "son vuruştan önce bitmez")
	await wait_unlocked(g)
	g.call("_debug_trace")
	assert_eq(answers, [true, true] as Array[bool])
	await wait_for_signal(g.finished, 3.0)
	assert_eq(results.size(), 1)
	assert_eq(results[0].wrong, 0)
	assert_false(results[0].helped)

func test_trace_generous_tolerance() -> void:
	var g: MiniGame = make("trace", {"chars": "l"}, 1)
	g.call("_debug_trace", Vector2(0.22, 0.0))
	assert_eq(answers, [true] as Array[bool], "yoldan biraz yana kayık iz kabul edilir")

func test_trace_difficulty_narrows_tolerance() -> void:
	var g: MiniGame = make("trace", {"chars": "l"}, 3)
	g.call("_debug_trace", Vector2(0.3, 0.0))
	assert_ne(answers, [true] as Array[bool], "zorluk 3'te aynı kayma kabul edilmez")

func test_trace_stray_is_wrong_and_plays_demo_keeps_progress() -> void:
	var g: MiniGame = make("trace", {"chars": "L"}, 2)
	g.call("_debug_stray")
	assert_eq(answers, [false] as Array[bool])
	assert_true(bool(g.call("is_demo_playing")), "yanlış iz yön ipucunu başlatır")
	assert_eq(int(g.call("current_stroke")), 0)
	await wait_unlocked(g)
	g.call("_debug_trace")
	assert_eq(answers, [false, true] as Array[bool])
	await wait_for_signal(g.finished, 3.0)
	assert_eq(results[0].wrong, 1)

func test_trace_press_away_from_start_is_not_an_answer() -> void:
	var g: MiniGame = make("trace", {"chars": "b"}, 1)
	g.call("_debug_press_away")
	assert_eq(answers.size(), 0)

func test_trace_dot_stroke_is_a_tap() -> void:
	var g: MiniGame = make("trace", {"chars": "i"}, 1)
	g.call("_debug_trace")
	await wait_unlocked(g)
	g.call("_debug_trace")
	await wait_for_signal(g.finished, 3.0)
	assert_eq(answers, [true, true] as Array[bool])

func test_trace_multi_char_layout_fits_board() -> void:
	var g: MiniGame = make("trace", {"chars": "ŞÖĞÜ"}, 1)
	var board: Control = (g.call("touch_targets") as Array[Control])[0]
	var lay: Dictionary = preload("res://scripts/core/trace_path.gd").layout("ŞÖĞÜ")
	for s: PackedVector2Array in lay["strokes"] as Array:
		for p: Vector2 in s:
			var px: Vector2 = g.call("unit_to_board", p)
			assert_true(Rect2(Vector2.ZERO, board.size).has_point(px), "iz tahtanın içinde: %s" % px)

func test_trace_hint1_demo_not_an_answer() -> void:
	var g: MiniGame = make("trace", {"chars": "7"}, 2)
	g.show_hint(1)
	assert_true(bool(g.call("is_demo_playing")))
	assert_eq(answers.size(), 0)

func test_trace_hint2_completes_all() -> void:
	var g: MiniGame = make("trace", {"chars": "ğ"}, 3)
	g.show_hint(2)
	await wait_for_signal(g.finished, 12.0)
	assert_eq(results.size(), 1)
	assert_true(results[0].helped)
	assert_eq(int(g.call("current_stroke")), 3)

func test_trace_every_glyph_traceable() -> void:
	var TracePath: GDScript = preload("res://scripts/core/trace_path.gd")
	for ch: String in TracePath.glyphs():
		var g: MiniGame = make("trace", {"chars": ch}, 3)
		var n: int = int(g.call("stroke_count"))
		for k: int in n:
			g.input_locked = false
			g.call("_debug_trace")
		assert_eq(int(g.call("current_stroke")), n, "%s baştan sona izlenebilir" % ch)
		assert_false(answers.has(false), "%s izlemede yanlış yok" % ch)
		answers.clear()

func test_trace_touch_targets() -> void:
	assert_touch_targets(make("trace", {"chars": "a"}))

func test_trace_debug_answer_paths() -> void:
	var g: MiniGame = make("trace", {"chars": "1"}, 1)
	g.call("_debug_answer", false)
	await wait_unlocked(g)
	g.call("_debug_answer", true)
	await wait_for_signal(g.finished, 3.0)
	assert_eq(answers, [false, true] as Array[bool])
