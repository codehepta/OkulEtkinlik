extends "res://tests/helpers/template_harness.gd"
## balance: terazi (karşılaştırma, eksik değer) ve sayı doğrusu (bul, yerleştir).

func _p_compare() -> Dictionary:
	return {"mode": "scale", "ask": "compare", "left": [7], "right": [3, 2]}

func _p_missing() -> Dictionary:
	return {"mode": "scale", "ask": "missing", "left": [3, 4], "right": [5, null], "choices": [1, 2, 3]}

func _p_find() -> Dictionary:
	return {"mode": "number_line", "ask": "find", "min": 0, "max": 10, "tick": 1, "value": 6, "choices": [5, 6, 7]}

func _p_place() -> Dictionary:
	return {"mode": "number_line", "ask": "place", "min": 0, "max": 100, "tick": 10, "value": 70}

func test_balance_compare_correct_tilts_beam() -> void:
	var g: MiniGame = make("balance", _p_compare())
	assert_almost_eq(float(g.call("beam_angle")), 0.0, 0.01, "takozlar teraziyi düz tutar")
	assert_eq(int(g.call("_debug_correct_index")), 2, "7 > 5")
	g.call("_debug_choose", 0)
	assert_eq(answers, [false] as Array[bool])
	await wait_unlocked(g)
	g.call("_debug_choose", 2)
	await wait_for_signal(g.finished, 3.0)
	assert_lt(float(g.call("beam_angle")), -0.05, "sol kefe ağır: sola eğilir")
	assert_eq(results[0].wrong, 1)

func test_balance_compare_equal_and_items() -> void:
	var g: MiniGame = make("balance", {"mode": "scale", "ask": "compare", "left": [4], "right": [4], "item": "item.meyve.elma"})
	assert_eq(int(g.call("_debug_correct_index")), 1)
	assert_eq(int(g.call("item_count")), 8, "iki kefede nesne grubu")
	g.call("_debug_choose", 1)
	await wait_for_signal(g.finished, 3.0)
	assert_almost_eq(float(g.call("beam_angle")), 0.0, 0.01)

func test_balance_missing_correct_levels_beam() -> void:
	var g: MiniGame = make("balance", _p_missing())
	assert_lt(float(g.call("beam_angle")), -0.05, "eksikken sol (7) ağır")
	var right: int = int(g.call("_debug_correct_index"))
	assert_eq(int(g.call("choice_values")[right]), 2)
	g.call("_debug_choose", 0 if right != 0 else 1)
	assert_eq(answers, [false] as Array[bool])
	await wait_unlocked(g)
	g.call("_debug_choose", right)
	await wait_for_signal(g.finished, 3.0)
	assert_almost_eq(float(g.call("beam_angle")), 0.0, 0.01, "doğru sayıyla dengelenir")

func test_number_line_find_and_p_place() -> void:
	var f: MiniGame = make("balance", _p_find())
	assert_eq(int(f.call("choice_values")[int(f.call("_debug_correct_index"))]), 6)
	f.call("_debug_choose", int(f.call("_debug_correct_index")))
	await wait_for_signal(f.finished, 3.0)
	var p: MiniGame = make("balance", _p_place())
	assert_eq(int(p.call("_debug_correct_index")), 7, "70, 8. çentik")
	p.call("_debug_choose", 6)
	assert_eq(answers, [true, false] as Array[bool])
	await wait_unlocked(p)
	p.call("_debug_choose", 7)
	await wait_for_signal(p.finished, 3.0)
	assert_eq(results.size(), 2)

func test_number_line_difficulty_labels() -> void:
	var p: Dictionary = {"mode": "number_line", "ask": "place", "min": 0, "max": 10, "tick": 1, "value": 6}
	assert_eq(make("balance", p, 1).call("labeled_ticks"), [0, 1, 2, 3, 4, 5, 7, 8, 9, 10] as Array[int])
	assert_eq(make("balance", p, 2).call("labeled_ticks"), [0, 5, 10] as Array[int])
	assert_eq(make("balance", p, 3).call("labeled_ticks"), [0, 10] as Array[int])

func test_balance_hints() -> void:
	var c: MiniGame = make("balance", _p_compare())
	c.show_hint(1)
	await wait_seconds(0.8)
	assert_lt(float(c.call("beam_angle")), -0.02, "ipucu 1: terazi biraz eğilir")
	assert_eq(answers.size(), 0)
	var m: MiniGame = make("balance", _p_missing())
	m.show_hint(1)
	assert_eq(int(m.call("hint_total")), 7, "eksiksiz tarafın toplamı gösterilir")
	var n: MiniGame = make("balance", {"mode": "number_line", "ask": "find", "min": 0, "max": 10, "tick": 1, "value": 6, "choices": [5, 6, 7]}, 3)
	n.show_hint(1)
	assert_eq(n.call("labeled_ticks"), [0, 5, 7, 10] as Array[int], "komşu etiketler açılır")
	for id: String in ["c", "m", "f", "p"]:
		results = []
		var params: Dictionary = {"c": _p_compare(), "m": _p_missing(), "f": _p_find(), "p": _p_place()}[id]
		var g: MiniGame = make("balance", params)
		g.show_hint(2)
		await wait_for_signal(g.finished, 4.0)
		assert_eq(results.size(), 1, id + " ipucu 2 turu bitirir")
		assert_true(results[0].helped)

func test_balance_touch_targets() -> void:
	for params: Dictionary in [_p_compare(), _p_missing(), _p_find(), _p_place()]:
		assert_touch_targets(make("balance", params))

func test_balance_debug_answer_paths() -> void:
	for params: Dictionary in [_p_compare(), _p_missing(), _p_find(), _p_place()]:
		answers = []
		results = []
		var g: MiniGame = make("balance", params)
		g.call("_debug_answer", false)
		await wait_unlocked(g)
		g.call("_debug_answer", true)
		await wait_for_signal(g.finished, 3.0)
		assert_eq(answers, [false, true] as Array[bool])

## Faz 3b S1: 1. sınıfta sözcük kartı + terazi ikonu, 2. sınıftan itibaren sembol.
func test_balance_compare_words_in_grade_one() -> void:
	var g1: MiniGame = make("balance", _p_compare(), 1, 7, 1)
	assert_eq(g1.call("choice_labels"), [Strings.t("bal.word.less"), Strings.t("bal.word.equal"), Strings.t("bal.word.more")] as Array[String])
	assert_true(bool(g1.call("has_relation_icons")), "sözcük kartında ağır kefe ikonu")
	assert_touch_targets(g1)
	var g2: MiniGame = make("balance", _p_compare(), 1, 7, 2)
	assert_eq(g2.call("choice_labels"), ["<", "=", ">"] as Array[String])
	assert_false(bool(g2.call("has_relation_icons")))
	g1.call("_debug_choose", 2)
	await wait_for_signal(g1.finished, 3.0)
	assert_eq(answers, [true] as Array[bool], "7 > 5: sol daha çok")

## Faz 3b (MAT.1.1.4): nesne gruplarında ipucu 1 bire bir eşleme çizgileridir.
func test_balance_compare_items_pairing_hint() -> void:
	var g: MiniGame = make("balance", {"mode": "scale", "ask": "compare", "left": [6], "right": [4], "item": "item.meyve.elma"})
	assert_eq(int(g.call("pair_count")), 0)
	g.show_hint(1)
	assert_eq(int(g.call("pair_count")), 4, "4 çift eşlenir, soldaki 2 nesne eşsiz kalır")
	assert_almost_eq(float(g.call("beam_angle")), 0.0, 0.01, "eşleme ipucunda terazi eğilmez")
	assert_eq(answers.size(), 0)
