extends "res://tests/helpers/template_harness.gd"
## sequence: kartları doğru sıraya dizme.

func _numbers(n: int) -> Dictionary:
	var items: Array = []
	for i: int in n:
		items.append({"type": "number", "value": (i + 1) * 2})
	return {"items": items}

func test_sequence_correct_drops_finish() -> void:
	var g: MiniGame = make("sequence", _numbers(4), 3)
	assert_eq(g.call("open_slots"), [0, 1, 2, 3] as Array[int], "zorluk 3: hepsi boş")
	for s: int in 4:
		var card: int = int(g.call("_debug_card_for_slot", s))
		g.call("_debug_drop", card, s)
		if s < 3:
			assert_eq(results.size(), 0, "son karttan önce bitmez")
			await wait_unlocked(g)
	assert_eq(answers, [true, true, true, true] as Array[bool])
	await wait_for_signal(g.finished, 3.0)
	assert_eq(results.size(), 1)
	assert_eq(results[0].wrong, 0)
	assert_false(results[0].helped)

func test_sequence_wrong_slot_bounces_and_answers_false() -> void:
	var g: MiniGame = make("sequence", _numbers(3), 3)
	var card1: int = int(g.call("_debug_card_for_slot", 1))
	g.call("_debug_drop", card1, 0)
	assert_eq(answers, [false] as Array[bool])
	assert_eq(g.call("open_slots"), [0, 1, 2] as Array[int], "yanlış kart yerleşmez")
	await wait_unlocked(g)
	g.call("_debug_drop", card1, 1)
	assert_eq(answers, [false, true] as Array[bool])
	assert_eq(g.call("open_slots"), [0, 2] as Array[int])

func test_sequence_drop_outside_is_not_an_answer() -> void:
	var g: MiniGame = make("sequence", _numbers(3), 3)
	g.call("_debug_drop", 0, -1)
	assert_eq(answers.size(), 0)

func test_sequence_difficulty_prefills_anchors() -> void:
	assert_eq(make("sequence", _numbers(5), 1).call("open_slots"), [1, 2, 3] as Array[int], "zorluk 1: ilk ve son yerinde")
	assert_eq(make("sequence", _numbers(3), 1).call("open_slots"), [1, 2] as Array[int], "3 öğede yalnızca ilk")
	assert_eq(make("sequence", _numbers(5), 2).call("open_slots"), [1, 2, 3, 4] as Array[int], "zorluk 2: yalnızca ilk")

func test_sequence_hint1_glows_next_slot() -> void:
	var g: MiniGame = make("sequence", _numbers(4), 2)
	var slot: Control = (g.call("slot_views") as Array[Control])[1]
	g.show_hint(1)
	await wait_seconds(0.5)
	assert_gt(slot.modulate.r, 1.0, "ilk boş yuva parlar")
	assert_eq(answers.size(), 0, "ipucu cevap sayılmaz")

func test_sequence_hint2_completes_all() -> void:
	var g: MiniGame = make("sequence", _numbers(5), 3)
	g.show_hint(2)
	await wait_for_signal(g.finished, 8.0)
	assert_eq(results.size(), 1)
	assert_true(results[0].helped)
	assert_eq(g.call("open_slots"), [] as Array[int])

func test_sequence_touch_targets() -> void:
	assert_touch_targets(make("sequence", _numbers(6), 3))

func test_sequence_debug_answer_paths() -> void:
	var g: MiniGame = make("sequence", _numbers(3), 1)
	g.call("_debug_answer", false)
	assert_eq(answers, [false] as Array[bool])
	await wait_unlocked(g)
	g.call("_debug_answer", true)
	await wait_unlocked(g)
	g.call("_debug_answer", true)
	await wait_for_signal(g.finished, 3.0)
	assert_eq(results[0].wrong, 1)
