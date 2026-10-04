extends "res://tests/helpers/template_harness.gd"
## syllable_build: hece ya da harf karolarıyla kelime kurma.

func test_syllable_correct_taps_build_word() -> void:
	var g: MiniGame = make("syllable_build", {"parts": ["el", "ma"], "voice": "vo.kelime"}, 1)
	g.call("_debug_choose", int(g.call("_debug_correct_index")))
	assert_eq(answers, [true] as Array[bool])
	assert_eq(str(g.call("built_word")), "el")
	await wait_unlocked(g)
	g.call("_debug_choose", int(g.call("_debug_correct_index")))
	assert_eq(str(g.call("built_word")), "elma")
	await wait_for_signal(g.finished, 3.0)
	assert_eq(results.size(), 1)
	assert_eq(results[0].wrong, 0)
	await wait_until(func() -> bool: return fake.said.has("vo.kelime"), 3.0)
	assert_true(fake.said.has("vo.kelime"), "kelime tamamlanınca sesi okunur")

func test_syllable_wrong_tile_stays() -> void:
	var g: MiniGame = make("syllable_build", {"parts": ["el", "ma"], "distractors": ["al"]}, 3)
	var wrong: int = int(g.call("_debug_wrong_index"))
	g.call("_debug_choose", wrong)
	assert_eq(answers, [false] as Array[bool])
	assert_eq(int(g.call("filled_count")), 0)
	assert_true((g.call("touch_targets") as Array).size() == 3, "yanlış karo yerinde kalır")

func test_syllable_repeated_parts() -> void:
	var g: MiniGame = make("syllable_build", {"parts": ["ba", "ba"]}, 1)
	for k: int in 2:
		g.call("_debug_choose", int(g.call("_debug_correct_index")))
		await wait_unlocked(g)
	assert_eq(str(g.call("built_word")), "baba")
	assert_eq(answers, [true, true] as Array[bool])

func test_syllable_difficulty_distractors() -> void:
	var p: Dictionary = {"parts": ["a", "t"], "distractors": ["e", "l", "m"]}
	assert_eq(int(make("syllable_build", p, 1).call("tile_count")), 2, "zorluk 1: çeldirici yok")
	assert_eq(int(make("syllable_build", p, 2).call("tile_count")), 3, "zorluk 2: bir çeldirici")
	assert_eq(int(make("syllable_build", p, 3).call("tile_count")), 5, "zorluk 3: hepsi")

func test_syllable_hint1_glows_next() -> void:
	var g: MiniGame = make("syllable_build", {"parts": ["ka", "pı"]}, 2)
	var slot: Control = (g.call("slot_views") as Array[Control])[0]
	g.show_hint(1)
	await wait_seconds(0.5)
	assert_gt(slot.modulate.r, 1.0)
	assert_eq(answers.size(), 0)

func test_syllable_hint2_completes() -> void:
	var g: MiniGame = make("syllable_build", {"parts": ["ka", "le", "m"], "distractors": ["ba"]}, 3)
	g.show_hint(2)
	await wait_for_signal(g.finished, 6.0)
	assert_true(results[0].helped)
	assert_eq(str(g.call("built_word")), "kalem")

func test_syllable_touch_targets() -> void:
	assert_touch_targets(make("syllable_build", {"parts": ["ke", "le", "bek"], "distractors": ["ka", "la", "bak"]}, 3))

func test_syllable_tiles_fit_screen() -> void:
	var g: MiniGame = make("syllable_build", {"parts": ["kele", "bekl", "erim", "izd"], "distractors": ["abc"]}, 3)
	for c: Control in g.call("touch_targets") as Array[Control]:
		assert_true(c.position.x >= 0.0 and c.position.x + c.size.x <= 1920.0, "karo ekranda: %s" % c.position)

func test_syllable_debug_answer_paths() -> void:
	var g: MiniGame = make("syllable_build", {"parts": ["o", "ta"], "distractors": ["u"]}, 3)
	g.call("_debug_answer", false)
	await wait_unlocked(g)
	g.call("_debug_answer", true)
	await wait_unlocked(g)
	g.call("_debug_answer", true)
	await wait_for_signal(g.finished, 3.0)
	assert_eq(answers, [false, true, true] as Array[bool])
