extends "res://tests/helpers/template_harness.gd"
## fraction_pizza: bütünü eş parçalara bölme ve parça seçme.

func _p_split() -> Dictionary:
	return {"ask": "split", "parts": 4}

func _p_select() -> Dictionary:
	return {"ask": "select", "parts": 8, "take": 3}

func test_pizza_split_correct_and_wrong() -> void:
	var g: MiniGame = make("fraction_pizza", _p_split(), 2)
	var right: int = int(g.call("_debug_correct_index"))
	assert_true(bool(g.call("option_is_equal", right)))
	assert_eq(int(g.call("option_parts", right)), 4)
	g.call("_debug_choose", (right + 1) % int(g.call("option_count")))
	assert_eq(answers, [false] as Array[bool])
	await wait_unlocked(g)
	g.call("_debug_choose", right)
	await wait_for_signal(g.finished, 3.0)
	assert_eq(results[0].wrong, 1)

func test_pizza_split_difficulty_option_count() -> void:
	for d: int in [1, 2, 3]:
		var g: MiniGame = make("fraction_pizza", _p_split(), d)
		assert_eq(int(g.call("option_count")), d + 1)
		var equal_four: int = 0
		for i: int in int(g.call("option_count")):
			if bool(g.call("option_is_equal", i)) and int(g.call("option_parts", i)) == 4:
				equal_four += 1
		assert_eq(equal_four, 1, "yalnızca bir seçenek 4 eş parça")

func test_pizza_select_toggle_and_check() -> void:
	var g: MiniGame = make("fraction_pizza", _p_select(), 1)
	assert_true(bool(g.call("is_counter_shown")), "zorluk 1: seçili sayısı görünür")
	g.call("_debug_toggle", 0)
	g.call("_debug_toggle", 1)
	assert_eq(int(g.call("selected_count")), 2)
	g.call("_debug_check")
	assert_eq(answers, [false] as Array[bool])
	await wait_unlocked(g)
	assert_eq(int(g.call("selected_count")), 2, "yanlış onay seçimi korur")
	g.call("_debug_toggle", 5)
	g.call("_debug_toggle", 1)
	g.call("_debug_toggle", 1)
	assert_eq(int(g.call("selected_count")), 3)
	assert_eq(answers.size(), 1, "dilim seçmek cevap sayılmaz")
	g.call("_debug_check")
	await wait_for_signal(g.finished, 3.0)
	assert_eq(answers, [false, true] as Array[bool])
	assert_false(bool(make("fraction_pizza", _p_select(), 2).call("is_counter_shown")))

func test_pizza_slice_hit_test() -> void:
	var g: MiniGame = make("fraction_pizza", {"ask": "select", "parts": 4, "take": 1}, 1)
	var r: float = float(g.call("pizza_radius"))
	# Dilim 0 saat 12'den başlar ve saat yönünde gider: sağ üst çeyrek.
	assert_eq(int(g.call("slice_at", Vector2(r * 0.5, -r * 0.5))), 0)
	assert_eq(int(g.call("slice_at", Vector2(r * 0.5, r * 0.5))), 1)
	assert_eq(int(g.call("slice_at", Vector2(-r * 0.5, r * 0.5))), 2)
	assert_eq(int(g.call("slice_at", Vector2(-r * 0.5, -r * 0.5))), 3)
	assert_eq(int(g.call("slice_at", Vector2(r * 1.5, 0))), -1, "pizza dışı")
	var d3: MiniGame = make("fraction_pizza", {"ask": "select", "parts": 4, "take": 1}, 3)
	assert_eq(int(d3.call("slice_at", Vector2(r * 0.6, -r * 0.1))), 0, "zorluk 3: yarım dilim döndürülmüş")

func test_pizza_hints() -> void:
	var s: MiniGame = make("fraction_pizza", _p_split(), 3)
	s.show_hint(1)
	assert_eq(int(s.call("faded_count")), 1)
	var p: MiniGame = make("fraction_pizza", _p_select(), 2)
	p.show_hint(1)
	await wait_seconds(0.3)
	assert_true(fake.said.has("vo.sayi.1"), "dilimler sayılır")
	assert_eq(answers.size(), 0)
	for params: Dictionary in [_p_split(), _p_select()]:
		results = []
		var g: MiniGame = make("fraction_pizza", params)
		g.show_hint(2)
		await wait_for_signal(g.finished, 4.0)
		assert_eq(results.size(), 1)
		assert_true(results[0].helped)
		if params["ask"] == "select":
			assert_eq(int(g.call("selected_count")), 3)

func test_pizza_touch_targets() -> void:
	assert_touch_targets(make("fraction_pizza", _p_split(), 3))
	assert_touch_targets(make("fraction_pizza", {"ask": "select", "parts": 12, "take": 5}, 1))

func test_pizza_debug_answer_paths() -> void:
	for params: Dictionary in [_p_split(), _p_select()]:
		answers = []
		results = []
		var g: MiniGame = make("fraction_pizza", params)
		g.call("_debug_answer", false)
		await wait_unlocked(g)
		g.call("_debug_answer", true)
		await wait_for_signal(g.finished, 3.0)
		assert_eq(answers, [false, true] as Array[bool])
