extends "res://tests/helpers/template_harness.gd"
## clock_money: saat oku / kur, para say / öde.

func _p_read() -> Dictionary:
	return {"mode": "clock", "ask": "read", "hour": 3, "minute": 30,
		"choices": [{"hour": 3, "minute": 30}, {"hour": 6, "minute": 15}, {"hour": 6, "minute": 0}]}

func _p_set() -> Dictionary:
	return {"mode": "clock", "ask": "set", "hour": 2, "minute": 15}

func _p_count() -> Dictionary:
	return {"mode": "money", "ask": "count", "unit": "tl", "items": ["tl_5", "tl_10", "tl_1", "tl_1"], "choices": [16, 17, 18]}

func _p_pay() -> Dictionary:
	return {"mode": "money", "ask": "pay", "unit": "kr", "amount": 75, "wallet": ["kr_50", "kr_25", "kr_10", "kr_5"]}

func test_clock_read_correct_and_wrong() -> void:
	var g: MiniGame = make("clock_money", _p_read())
	assert_eq(g.call("shown_time"), Vector2i(3, 30))
	var right: int = int(g.call("_debug_correct_index"))
	assert_eq(g.call("choice_labels")[right], Strings.t("fmt.clock", {"h": "3", "m": "30"}))
	g.call("_debug_choose", (right + 1) % 3)
	assert_eq(answers, [false] as Array[bool])
	await wait_unlocked(g)
	g.call("_debug_choose", right)
	await wait_for_signal(g.finished, 3.0)
	assert_eq(results[0].wrong, 1)

func test_clock_set_steps_and_check() -> void:
	var g: MiniGame = make("clock_money", _p_set(), 2)
	assert_eq(g.call("shown_time"), Vector2i(12, 0))
	g.call("_debug_check")
	assert_eq(answers, [false] as Array[bool], "kurmadan onay yanlış sayılır")
	await wait_unlocked(g)
	g.call("_debug_step", "hour", 1)
	g.call("_debug_step", "hour", 1)
	g.call("_debug_step", "minute", 1)
	assert_eq(g.call("shown_time"), Vector2i(2, 15), "zorluk 2: çeyrek adım")
	assert_eq(answers.size(), 1, "adımlar cevap sayılmaz")
	g.call("_debug_check")
	await wait_for_signal(g.finished, 3.0)
	assert_eq(answers, [false, true] as Array[bool])

func test_clock_set_wrong_check_keeps_state() -> void:
	var g: MiniGame = make("clock_money", _p_set(), 1)
	g.call("_debug_step", "minute", 1)
	assert_eq(g.call("shown_time"), Vector2i(12, 15), "zorluk 1 ama hedef çeyrek: adım 15")
	g.call("_debug_check")
	assert_eq(answers, [false] as Array[bool])
	await wait_unlocked(g)
	assert_eq(g.call("shown_time"), Vector2i(12, 15), "yanlış onay kurulan saati sıfırlamaz")

func test_clock_set_reachable_for_every_difficulty() -> void:
	for d: int in [1, 2, 3]:
		for m: int in [0, 5, 15, 30, 45, 55]:
			answers = []
			results = []
			var g: MiniGame = make("clock_money", {"mode": "clock", "ask": "set", "hour": 7, "minute": m}, d)
			g.call("_debug_answer", true)
			assert_eq(g.call("shown_time"), Vector2i(7, m), "zorluk %d, dakika %d ulaşılabilir" % [d, m])
			assert_eq(answers, [true] as Array[bool])

func test_money_count_correct() -> void:
	var g: MiniGame = make("clock_money", _p_count())
	var right: int = int(g.call("_debug_correct_index"))
	assert_eq(g.call("choice_labels")[right], Strings.t("fmt.money.tl", {"n": "17"}))
	assert_eq(int(g.call("piece_count")), 4)
	g.call("_debug_choose", right)
	await wait_for_signal(g.finished, 3.0)
	assert_eq(results[0].wrong, 0)

func test_money_count_difficulty_order() -> void:
	var g: MiniGame = make("clock_money", _p_count(), 1)
	assert_eq(g.call("piece_denoms"), ["tl_10", "tl_5", "tl_1", "tl_1"] as Array[String], "zorluk 1: büyükten küçüğe")

func test_money_pay_add_remove_check() -> void:
	var g: MiniGame = make("clock_money", _p_pay(), 1)
	var wallet: Array[String] = g.call("wallet_denoms")
	g.call("_debug_add", wallet.find("kr_50"))
	g.call("_debug_add", wallet.find("kr_10"))
	assert_eq(int(g.call("tray_total")), 60)
	assert_true(bool(g.call("is_total_shown")), "zorluk 1: toplam görünür")
	g.call("_debug_check")
	assert_eq(answers, [false] as Array[bool])
	await wait_unlocked(g)
	g.call("_debug_remove", 1)
	g.call("_debug_add", wallet.find("kr_25"))
	assert_eq(int(g.call("tray_total")), 75)
	g.call("_debug_check")
	await wait_for_signal(g.finished, 3.0)
	assert_eq(answers, [false, true] as Array[bool])
	assert_false(bool(make("clock_money", _p_pay(), 2).call("is_total_shown")), "zorluk 2: toplam gizli")

func test_check_button_double_press_counts_once() -> void:
	var g: MiniGame = make("clock_money", _p_set())
	g.call("_debug_check")
	g.call("_debug_check")
	g.call("_debug_check")
	assert_eq(answers.size(), 1)

func test_clock_money_hints() -> void:
	var r: MiniGame = make("clock_money", _p_read())
	r.show_hint(1)
	assert_true(bool(r.call("is_hour_hint_shown")))
	var s: MiniGame = make("clock_money", _p_set())
	s.show_hint(1)
	assert_true(bool(s.call("is_ghost_shown")), "hedef akrep gölgesi")
	var c: MiniGame = make("clock_money", _p_count(), 3)
	c.show_hint(1)
	assert_eq(c.call("piece_denoms"), ["tl_10", "tl_5", "tl_1", "tl_1"] as Array[String], "büyükten küçüğe dizilir")
	assert_eq(c.call("running_totals"), [10, 15, 16, 17] as Array[int])
	var p: MiniGame = make("clock_money", _p_pay(), 2)
	p.show_hint(1)
	assert_eq(p.call("hinted_wallet"), "kr_50", "kalan tutara sığan en büyük küpür")
	assert_eq(answers.size(), 0)
	var cases: Array[Dictionary] = [_p_read(), _p_set(), _p_count(), _p_pay()]
	for params: Dictionary in cases:
		results = []
		var g: MiniGame = make("clock_money", params)
		g.show_hint(2)
		await wait_for_signal(g.finished, 5.0)
		assert_eq(results.size(), 1, str(params["ask"]) + " ipucu 2 turu bitirir")
		assert_true(results[0].helped)

func test_money_pay_hint_when_overpaid() -> void:
	var g: MiniGame = make("clock_money", _p_pay(), 2)
	var wallet: Array[String] = g.call("wallet_denoms")
	g.call("_debug_add", wallet.find("kr_50"))
	g.call("_debug_add", wallet.find("kr_50"))
	g.show_hint(1)
	assert_eq(int(g.call("hinted_tray")), 1, "fazla ödendi: fazlayı karşılayan en küçük tepsi küpürü parlar")

func test_clock_money_touch_targets() -> void:
	for params: Dictionary in [_p_read(), _p_set(), _p_count(), _p_pay()]:
		assert_touch_targets(make("clock_money", params))

func test_clock_money_debug_answer_paths() -> void:
	for params: Dictionary in [_p_read(), _p_set(), _p_count(), _p_pay()]:
		answers = []
		results = []
		var g: MiniGame = make("clock_money", params)
		g.call("_debug_answer", false)
		await wait_unlocked(g)
		g.call("_debug_answer", true)
		await wait_for_signal(g.finished, 3.0)
		assert_eq(answers, [false, true] as Array[bool], str(params["ask"]))
