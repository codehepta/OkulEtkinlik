extends "res://tests/helpers/template_harness.gd"
## pattern: şekil ve sayı örüntülerini tamamla.

func _shapes() -> Dictionary:
	return {"kind": "repeat", "length": 9, "unit": [
		{"shape": "circle", "color": "red"}, {"shape": "triangle", "color": "blue"}, {"shape": "star", "color": "yellow"}]}

func _numbers() -> Dictionary:
	return {"kind": "number", "start": 5, "step": 5, "length": 7}

func test_pattern_repeat_fill_blanks_in_order() -> void:
	var g: MiniGame = make("pattern", _shapes(), 2)
	assert_eq(int(g.call("blank_count")), 2)
	assert_eq(int(g.call("choice_count")), 3, "birimdeki farklı hücreler")
	g.call("_debug_choose", int(g.call("_debug_correct_index")))
	assert_eq(answers, [true] as Array[bool])
	assert_eq(results.size(), 0, "ilk boşluktan sonra bitmez")
	assert_eq(int(g.call("blank_count")), 1)
	await wait_unlocked(g)
	g.call("_debug_choose", int(g.call("_debug_correct_index")))
	await wait_for_signal(g.finished, 3.0)
	assert_eq(results[0].wrong, 0)

func test_pattern_number_choices_contain_answer() -> void:
	var g: MiniGame = make("pattern", _numbers(), 3)
	assert_eq(int(g.call("blank_count")), 3)
	var expected: Array[int] = [25, 30, 35]
	for k: int in 3:
		var vals: Array = g.call("choice_values")
		assert_eq(vals.size(), 3)
		assert_true(vals.has(expected[k]), "seçenekler doğru terimi içerir")
		g.call("_debug_choose", int(g.call("_debug_correct_index")))
		if k < 2:
			await wait_unlocked(g)
	await wait_for_signal(g.finished, 3.0)
	assert_eq(answers, [true, true, true] as Array[bool])

func test_pattern_difficulty_sets_blanks() -> void:
	assert_eq(int(make("pattern", _shapes(), 1).call("blank_count")), 1)
	assert_eq(int(make("pattern", _shapes(), 3).call("blank_count")), 3)
	# 2 hücrelik birim, length 5: en az iki tam birim görünür kalmalı -> en çok 1 boşluk.
	var short: Dictionary = {"kind": "repeat", "length": 5, "unit": [{"shape": "circle", "color": "red"}, {"shape": "square", "color": "blue"}]}
	assert_eq(int(make("pattern", short, 3).call("blank_count")), 1)
	assert_eq(int(make("pattern", {"kind": "number", "start": 1, "step": 1, "length": 4}, 3).call("blank_count")), 1)

func test_pattern_wrong_keeps_blank() -> void:
	var g: MiniGame = make("pattern", _shapes(), 1)
	var right: int = int(g.call("_debug_correct_index"))
	g.call("_debug_choose", 0 if right != 0 else 1)
	assert_eq(answers, [false] as Array[bool])
	assert_eq(int(g.call("blank_count")), 1)

func test_pattern_hint1_repeat_and_number() -> void:
	var g: MiniGame = make("pattern", _shapes(), 1)
	g.show_hint(1)
	assert_true(bool(g.call("is_unit_marked")), "ilk birim çerçevelenir")
	var n: MiniGame = make("pattern", _numbers(), 1)
	n.show_hint(1)
	assert_eq(n.call("step_labels"), ["+5", "+5", "+5", "+5", "+5"], "görünen terimler arasında adım")
	var d: MiniGame = make("pattern", {"kind": "number", "start": 50, "step": -10, "length": 5}, 1)
	d.show_hint(1)
	assert_eq(d.call("step_labels"), ["−10", "−10", "−10"])
	assert_eq(answers.size(), 0)

func test_pattern_hint2_fills_all() -> void:
	var g: MiniGame = make("pattern", _numbers(), 3)
	g.show_hint(2)
	await wait_for_signal(g.finished, 8.0)
	assert_true(results[0].helped)
	assert_eq(int(g.call("blank_count")), 0)

func test_pattern_items_and_touch_targets() -> void:
	var g: MiniGame = make("pattern", {"kind": "repeat", "length": 7, "unit": [
		{"type": "item", "value": "item.meyve.elma"}, {"type": "item", "value": "item.meyve.armut"}]}, 1)
	assert_eq(int(g.call("choice_count")), 2)
	assert_touch_targets(g)
	assert_touch_targets(make("pattern", _numbers(), 3))

func test_pattern_debug_answer_paths() -> void:
	var g: MiniGame = make("pattern", _shapes(), 1)
	g.call("_debug_answer", false)
	await wait_unlocked(g)
	g.call("_debug_answer", true)
	await wait_for_signal(g.finished, 3.0)
	assert_eq(answers, [false, true] as Array[bool])
