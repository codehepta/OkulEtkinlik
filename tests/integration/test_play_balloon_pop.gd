extends "res://tests/helpers/template_harness.gd"
## balloon_pop: doğru cevabı taşıyan balonu patlat; süre baskısı yok.

func _params() -> Dictionary:
	return {"a": 7, "op": "+", "b": 5, "choices": [12, 11, 13, 14, 10, 9]}

func test_balloon_correct_pops_and_finishes() -> void:
	var g: MiniGame = make("balloon_pop", _params())
	var idx: int = int(g.call("_debug_correct_index"))
	assert_eq(int(g.call("balloon_values")[idx]), 12)
	g.call("_debug_choose", idx)
	await wait_for_signal(g.finished, 3.0)
	assert_eq(answers, [true] as Array[bool])
	assert_eq(results[0].wrong, 0)
	assert_true(fake.sfx.has("sfx.balloon_pop"))

func test_balloon_wrong_stays() -> void:
	var g: MiniGame = make("balloon_pop", _params())
	var idx: int = int(g.call("_debug_correct_index"))
	var wrong: int = 0 if idx != 0 else 1
	g.call("_debug_choose", wrong)
	assert_eq(answers, [false] as Array[bool])
	await wait_seconds(0.8)
	assert_true(bool(g.call("is_balloon_visible", wrong)), "yanlış balon kaybolmaz")
	assert_eq(results.size(), 0)

func test_balloon_difficulty_limits_count() -> void:
	assert_eq((make("balloon_pop", _params(), 1).call("balloon_values") as Array).size(), 3)
	assert_eq((make("balloon_pop", _params(), 2).call("balloon_values") as Array).size(), 4)
	assert_eq((make("balloon_pop", _params(), 3).call("balloon_values") as Array).size(), 6)
	var vals: Array = make("balloon_pop", _params(), 1).call("balloon_values")
	vals.sort()
	assert_eq(vals, [11, 12, 13], "yanlışlar choices sırasından alınır")

func test_balloons_stay_on_screen_and_never_expire() -> void:
	var g: MiniGame = make("balloon_pop", _params(), 3)
	assert_eq(g.find_children("*", "Timer", true, false).size(), 0, "sahnede zamanlayıcı yok")
	await wait_seconds(2.0)
	var screen: Rect2 = Rect2(Vector2.ZERO, MiniGame.BASE_SIZE)
	var rects: Array[Rect2] = g.call("balloon_rects")
	assert_eq(rects.size(), 6)
	for i: int in rects.size():
		assert_true(screen.encloses(rects[i]), "balon ekranda kalır")
		assert_true(bool(g.call("is_balloon_visible", i)), "balon kaybolmaz")
	assert_eq(answers.size(), 0)

func test_balloon_hint1_model_or_fade() -> void:
	var small: MiniGame = make("balloon_pop", _params(), 3)
	small.show_hint(1)
	assert_true(bool(small.call("is_model_shown")), "küçük sayılarda somut model")
	var big: MiniGame = make("balloon_pop", {"a": 64, "op": "-", "b": 21, "choices": [43, 42, 53, 33]}, 3)
	big.show_hint(1)
	assert_false(bool(big.call("is_model_shown")))
	assert_eq(int(big.call("faded_count")), 2, "3 yanlışın yarısı (yukarı yuvarlanır)")
	assert_eq(answers.size(), 0)

func test_balloon_hint2_pops_correct() -> void:
	var g: MiniGame = make("balloon_pop", _params())
	g.show_hint(2)
	await wait_for_signal(g.finished, 4.0)
	assert_true(results[0].helped)

func test_balloon_touch_targets() -> void:
	assert_touch_targets(make("balloon_pop", _params(), 3))

func test_balloon_debug_answer_paths() -> void:
	var g: MiniGame = make("balloon_pop", {"a": 1000, "op": "-", "b": 1, "choices": [999, 998]})
	g.call("_debug_answer", false)
	await wait_unlocked(g)
	g.call("_debug_answer", true)
	await wait_for_signal(g.finished, 3.0)
	assert_eq(answers, [false, true] as Array[bool])

func test_balloon_multiply_and_divide() -> void:
	var mul: MiniGame = make("balloon_pop", {"a": 6, "op": "×", "b": 7, "choices": [42, 36, 48, 49]}, 3)
	assert_eq(int(mul.call("balloon_values")[int(mul.call("_debug_correct_index"))]), 42)
	var div: MiniGame = make("balloon_pop", {"a": 56, "op": "÷", "b": 8, "choices": [7, 6, 8, 9]}, 3)
	assert_eq(int(div.call("balloon_values")[int(div.call("_debug_correct_index"))]), 7)

func test_balloon_hint1_no_model_for_multiply_divide() -> void:
	var g: MiniGame = make("balloon_pop", {"a": 3, "op": "×", "b": 4, "choices": [12, 7, 10, 16]}, 3)
	g.show_hint(1)
	assert_false(bool(g.call("is_model_shown")), "çarpma ve bölmede toplama modeli gösterilmez")
	assert_eq(int(g.call("faded_count")), 2)
	assert_eq(answers.size(), 0)
