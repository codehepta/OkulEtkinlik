extends "res://tests/helpers/template_harness.gd"
## scenario: durumu gör, doğru davranışı seç.

func _params(n: int = 3) -> Dictionary:
	var choices: Array = [
		{"token": {"type": "item", "value": "item.davranis.bekle"}, "correct": true, "result": "item.sahne.karsiya_gecti"},
		{"token": {"type": "item", "value": "item.davranis.kos"}, "correct": false,
			"result": "item.sahne.korna", "result_voice": "vo.test.sonuc"},
		{"token": {"type": "item", "value": "item.davranis.top"}, "correct": false},
	]
	return {"scene": "item.sahne.yaya_gecidi", "hint": "vo.test.ipucu", "choices": choices.slice(0, n)}

func _index_of(g: MiniGame, key: String) -> int:
	return (g.call("choice_keys") as Array[String]).find(key)

func test_scenario_correct_finishes() -> void:
	var g: MiniGame = make("scenario", _params(), 3)
	g.call("_debug_choose", int(g.call("_debug_correct_index")))
	assert_eq(answers, [true] as Array[bool])
	assert_eq(g.call("scene_key"), "item.sahne.karsiya_gecti", "doğru seçimin sonucu gösterilir")
	await wait_for_signal(g.finished, 3.0)
	assert_eq(results.size(), 1)
	assert_eq(results[0].wrong, 0)
	assert_false(results[0].helped)

func test_scenario_wrong_shows_gentle_consequence_then_answers() -> void:
	var g: MiniGame = make("scenario", _params(), 3)
	var wrong: int = _index_of(g, "item.davranis.kos")
	g.call("_debug_choose", wrong)
	assert_eq(answers.size(), 0, "sonuç gösterilirken cevap henüz bildirilmez (runner sesleri çakışmasın)")
	assert_eq(g.call("scene_key"), "item.sahne.korna", "nazik sonuç görseli")
	assert_true(fake.said.has("vo.test.sonuc"), "sonuç seslendirilir")
	await wait_until(func() -> bool: return answers.size() == 1, 5.0)
	assert_eq(answers, [false] as Array[bool])
	assert_eq(g.call("scene_key"), "item.sahne.yaya_gecidi", "sahne durumuna geri döner")
	assert_true(g.call("is_tried", wrong), "denenen seçenek işaretlenir")
	await wait_unlocked(g)
	g.call("_debug_choose", wrong)
	assert_eq(answers, [false] as Array[bool], "denenen seçenek yeniden yanlış sayılmaz")

func test_scenario_wrong_without_result() -> void:
	var g: MiniGame = make("scenario", _params(), 3)
	g.call("_debug_choose", _index_of(g, "item.davranis.top"))
	await wait_until(func() -> bool: return answers.size() == 1, 5.0)
	assert_eq(answers, [false] as Array[bool])
	assert_eq(g.call("scene_key"), "item.sahne.yaya_gecidi")

func test_scenario_double_tap_counts_once() -> void:
	var g: MiniGame = make("scenario", _params(), 3)
	var wrong: int = _index_of(g, "item.davranis.kos")
	g.call("_debug_choose", wrong)
	g.call("_debug_choose", int(g.call("_debug_correct_index")))
	await wait_until(func() -> bool: return answers.size() >= 1, 5.0)
	await wait_seconds(0.2)
	assert_eq(answers, [false] as Array[bool], "sonuç sırasında gelen dokunma yok sayılır")

func test_scenario_difficulty_limits_choices() -> void:
	assert_eq((make("scenario", _params(), 1).call("choice_keys") as Array).size(), 2, "zorluk 1: en çok 2 seçenek")
	var g: MiniGame = make("scenario", _params(), 1)
	assert_true((g.call("choice_keys") as Array[String]).has("item.davranis.kos"), "ilk yanlış seçenek kalır")
	assert_eq((make("scenario", _params(), 2).call("choice_keys") as Array).size(), 3)

func test_scenario_hint1_says_hint_and_fades_one_wrong() -> void:
	var g: MiniGame = make("scenario", _params(), 3)
	g.show_hint(1)
	await wait_seconds(0.5)
	assert_true(fake.said.has("vo.test.ipucu"), "ipucu satırı okunur")
	assert_eq(int(g.call("faded_count")), 1, "üç seçenekte bir yanlış soluklaşır")
	assert_eq(answers.size(), 0, "ipucu cevap sayılmaz")

func test_scenario_hint1_never_reveals_with_one_wrong_left() -> void:
	var g: MiniGame = make("scenario", _params(2), 3)
	g.show_hint(1)
	await wait_seconds(0.5)
	assert_eq(int(g.call("faded_count")), 0, "tek yanlış kalınca soluklaştırma cevabı vermez")

func test_scenario_hint2_solves() -> void:
	var g: MiniGame = make("scenario", _params(), 3)
	g.show_hint(2)
	await wait_for_signal(g.finished, 5.0)
	assert_eq(results.size(), 1)
	assert_true(results[0].helped)
	assert_eq(answers, [true] as Array[bool])

func test_scenario_touch_targets() -> void:
	assert_touch_targets(make("scenario", _params(), 3))

func test_scenario_debug_answer_paths() -> void:
	var g: MiniGame = make("scenario", _params(), 2)
	g.call("_debug_answer", false)
	await wait_until(func() -> bool: return answers.size() == 1, 5.0)
	await wait_unlocked(g)
	g.call("_debug_answer", true)
	await wait_for_signal(g.finished, 3.0)
	assert_eq(results[0].wrong, 1)
	assert_eq(answers, [false, true] as Array[bool])
