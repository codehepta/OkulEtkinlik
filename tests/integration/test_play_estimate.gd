extends "res://tests/helpers/template_harness.gd"
## Faz 3b: "tahmin et → kontrol et → karşılaştır" modu (count_choose ve balance).

const Estimate: GDScript = preload("res://scripts/core/estimate.gd")

func _p_count() -> Dictionary:
	return {"item": "item.meyve.elma", "count": 12, "estimates": [5, 10, 20]}

func _count_all(g: MiniGame) -> void:
	for i: int in int(g.call("item_total")):
		g.call("_debug_tap_item", i)

func test_count_estimate_flow_near() -> void:
	var g: MiniGame = make("count_choose", _p_count())
	assert_eq(str(g.call("phase")), "estimate")
	assert_touch_targets(g)
	g.call("_debug_estimate", 1)
	assert_eq(str(g.call("phase")), "check")
	assert_eq(answers.size(), 0, "tahmin doğru/yanlış sayılmaz")
	assert_true(fake.said.has("vo.tahmin.say"))
	assert_touch_targets(g)
	g.call("_debug_tap_item", 0)
	g.call("_debug_tap_item", 0)
	assert_eq(int(g.call("counted")), 1, "aynı nesne iki kez sayılmaz")
	assert_true(fake.said.has("vo.sayi.1"))
	_count_all(g)
	assert_eq(str(g.call("phase")), "judge")
	assert_true(fake.said.has("vo.tahmin.karsilastir"))
	assert_eq(int(g.call("_debug_correct_index")), Estimate.NEAR, "10 ile 12 yakın (sınır 2)")
	assert_touch_targets(g)
	g.call("_debug_choose", Estimate.FAR)
	assert_eq(answers, [false] as Array[bool])
	await wait_unlocked(g)
	g.call("_debug_choose", Estimate.NEAR)
	await wait_for_signal(g.finished, 3.0)
	assert_eq(answers, [false, true] as Array[bool])
	assert_eq(results[0].wrong, 1)

func test_count_estimate_far_and_custom_near() -> void:
	var g: MiniGame = make("count_choose", {"item": "item.meyve.elma", "count": 12, "estimates": [5, 10, 20], "near": 1})
	g.call("_debug_estimate", 1)
	_count_all(g)
	assert_eq(int(g.call("_debug_correct_index")), Estimate.FAR, "near 1: 10 ile 12 uzak")

func test_count_estimate_hints() -> void:
	var g: MiniGame = make("count_choose", _p_count())
	g.call("_debug_estimate", 0)
	_count_all(g)
	g.show_hint(1)
	assert_eq(int(g.call("diff_hint")), 7, "fark karosu: |5 − 12|")
	for phase: String in ["estimate", "check", "judge"]:
		results = []
		var h: MiniGame = make("count_choose", _p_count())
		if phase != "estimate":
			h.call("_debug_estimate", 2)
		if phase == "judge":
			_count_all(h)
		h.show_hint(2)
		await wait_for_signal(h.finished, 6.0)
		assert_eq(results.size(), 1, phase + ": ipucu 2 turu bitirir")
		assert_true(results[0].helped)

func test_count_estimate_debug_answer() -> void:
	var g: MiniGame = make("count_choose", _p_count())
	g.call("_debug_answer", false)
	await wait_unlocked(g)
	g.call("_debug_answer", true)
	await wait_for_signal(g.finished, 3.0)
	assert_eq(answers, [false, true] as Array[bool])

func test_count_estimate_params() -> void:
	assert_eq(TemplateRegistry.validate("count_choose", _p_count()), [] as Array[String])
	for bad: Dictionary in [
		{"item": "item.meyve.elma", "count": 12, "estimates": [5]},
		{"item": "item.meyve.elma", "count": 12, "estimates": [20, 10]},
		{"item": "item.meyve.elma", "count": 12, "estimates": [11, 12, 13]},
		{"item": "item.meyve.elma", "count": 12, "estimates": [5, 10], "near": 0},
	]:
		assert_gt(TemplateRegistry.validate("count_choose", bad).size(), 0, str(bad))

# --- balance: birim küplerle tartma ---

func _p_weigh() -> Dictionary:
	return {"mode": "scale", "ask": "estimate", "item": "item.oyuncak.ayi", "value": 7, "estimates": [3, 6, 12]}

func test_balance_estimate_weigh_flow() -> void:
	var g: MiniGame = make("balance", _p_weigh())
	assert_eq(str(g.call("phase")), "estimate")
	assert_lt(float(g.call("beam_angle")), -0.05, "boş sağ kefe: nesne tarafı ağır")
	g.call("_debug_estimate", 1)
	assert_eq(str(g.call("phase")), "check")
	assert_true(fake.said.has("vo.tahmin.tart"))
	assert_touch_targets(g)
	for k: int in 6:
		g.call("_debug_add_unit")
	assert_eq(int(g.call("unit_count")), 6)
	assert_eq(str(g.call("phase")), "check")
	g.call("_debug_add_unit")
	assert_eq(str(g.call("phase")), "judge", "7 küpte terazi dengelenir")
	await wait_seconds(0.8)
	assert_almost_eq(float(g.call("beam_angle")), 0.0, 0.01)
	assert_eq(answers.size(), 0, "küp eklemek cevap sayılmaz")
	assert_eq(int(g.call("_debug_correct_index")), Estimate.NEAR, "6 ile 7 yakın")
	g.call("_debug_choose", Estimate.NEAR)
	await wait_for_signal(g.finished, 3.0)
	assert_eq(answers, [true] as Array[bool])
	assert_false(results[0].multi_step)

# --- balance: zihinden işlem ---

func _p_calc() -> Dictionary:
	return {"mode": "scale", "ask": "estimate", "left": [28, 31], "right": [null], "estimates": [40, 60, 80], "choices": [58, 59, 60]}

func test_balance_estimate_calc_flow() -> void:
	var g: MiniGame = make("balance", _p_calc())
	g.call("_debug_estimate", 1)
	assert_eq(str(g.call("phase")), "check")
	assert_true(fake.said.has("vo.tahmin.islem"))
	var right: int = int(g.call("_debug_correct_index"))
	assert_eq(int(g.call("choice_values")[right]), 59)
	g.call("_debug_choose", 0 if right != 0 else 1)
	assert_eq(answers, [false] as Array[bool])
	await wait_unlocked(g)
	g.call("_debug_choose", right)
	await wait_until(func() -> bool: return str(g.call("phase")) == "judge", 3.0)
	assert_eq(answers, [false, true] as Array[bool], "doğru işlem sonucu bir adım")
	await wait_seconds(0.8)
	assert_almost_eq(float(g.call("beam_angle")), 0.0, 0.01, "sonuçla dengelenir")
	await wait_unlocked(g)
	g.call("_debug_choose", Estimate.NEAR)
	await wait_for_signal(g.finished, 3.0)
	assert_true(results[0].multi_step, "işlem + yargı: çok adımlı tur")

func test_balance_estimate_hints_and_paths() -> void:
	for params: Dictionary in [_p_weigh(), _p_calc()]:
		for start: int in 2:
			results = []
			var g: MiniGame = make("balance", params)
			if start == 1:
				g.call("_debug_estimate", 0)
			g.show_hint(1)
			g.show_hint(2)
			await wait_for_signal(g.finished, 8.0)
			assert_eq(results.size(), 1, "ipucu 2 turu bitirir")
			assert_true(results[0].helped)
		answers = []
		results = []
		var d: MiniGame = make("balance", params)
		d.call("_debug_answer", false)
		await wait_unlocked(d)
		while results.is_empty():
			d.call("_debug_answer", true)
			await wait_until(func() -> bool: return d._can_input() or not results.is_empty(), 3.0)
		assert_eq(answers[0], false)
		assert_eq(answers[answers.size() - 1], true)

func test_balance_estimate_params() -> void:
	assert_eq(TemplateRegistry.validate("balance", _p_weigh()), [] as Array[String])
	assert_eq(TemplateRegistry.validate("balance", _p_calc()), [] as Array[String])
	assert_eq(TemplateRegistry.validate("balance", {"mode": "scale", "ask": "estimate", "left": [59], "right": [28, null], "estimates": [10, 30, 50], "choices": [30, 31, 41]}), [] as Array[String])
	for bad: Dictionary in [
		{"mode": "scale", "ask": "estimate", "item": "item.oyuncak.ayi", "value": 0, "estimates": [3, 6, 12]},
		{"mode": "scale", "ask": "estimate", "item": "item.oyuncak.ayi", "value": 16, "estimates": [3, 6, 12]},
		{"mode": "scale", "ask": "estimate", "item": "item.oyuncak.ayi", "value": 7, "estimates": [6, 7, 8]},
		{"mode": "scale", "ask": "estimate", "left": [28, 31], "right": [null], "estimates": [40, 60, 80], "choices": [58, 60]},
		{"mode": "scale", "ask": "estimate", "left": [28, 31], "right": [5], "estimates": [40, 60, 80], "choices": [58, 59]},
		{"mode": "scale", "ask": "estimate", "estimates": [40, 60, 80]},
	]:
		assert_gt(TemplateRegistry.validate("balance", bad).size(), 0, str(bad))
