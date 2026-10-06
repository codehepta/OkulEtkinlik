extends "res://tests/helpers/template_harness.gd"
## story: resimli hikâye + anlama soruları; dinleme ve sessiz okuma kipleri.

const FX: String = "res://tests/fixtures/faz4a/params.json"

func test_story_listen_reads_pages_then_question() -> void:
	var g: MiniGame = make("story", fixture("story_listen", FX)["params"] as Dictionary, 1)
	assert_eq(str(g.call("phase")), "read")
	assert_eq(fake.said, ["vo.genel.dinle"] as Array[String], "dinleme kipinde sayfa okunur")
	assert_true(bool(g.call("speaker_visible")))
	g.call("_debug_next")
	assert_eq(int(g.call("page_index")), 1)
	assert_eq(fake.said.back(), "vo.genel.dokun")
	g.call("_debug_next")
	assert_eq(str(g.call("phase")), "question")
	assert_eq(fake.said.back(), "vo.genel.hazir_misin", "soru seslendirilir")
	assert_eq(answers.size(), 0, "sayfa çevirmek cevap değildir")
	g.call("_debug_choose", int(g.call("_debug_correct_index")))
	await wait_for_signal(g.finished, 3.0)
	assert_eq(answers, [true] as Array[bool])
	assert_eq(results[0].wrong, 0)

func test_story_silent_withholds_passage_voice_until_first_answer() -> void:
	var g: MiniGame = make("story", fixture("story_silent", FX)["params"] as Dictionary, 1)
	assert_false(fake.said.has("vo.genel.dinle"), "sessiz okumada sayfa sesi tutulur")
	assert_false(bool(g.call("speaker_visible")), "hoparlör görünmez")
	assert_false(bool(g.call("voice_unlocked")))
	g.call("_debug_speaker")
	assert_false(fake.said.has("vo.genel.dinle"), "kilitliyken hoparlör okutmaz")
	g.call("_debug_next")
	assert_eq(fake.said.back(), "vo.genel.hazir_misin", "soru (yönerge) yine seslendirilir")
	var c: int = int(g.call("_debug_correct_index"))
	g.call("_debug_choose", 1 - c)
	assert_eq(answers, [false] as Array[bool])
	assert_true(bool(g.call("voice_unlocked")), "ilk cevaptan sonra ses açılır")
	await wait_unlocked(g)
	g.call("_debug_book")
	assert_eq(str(g.call("phase")), "read")
	assert_true(bool(g.call("speaker_visible")))
	assert_false(fake.said.has("vo.genel.dinle"), "sessiz kipte sayfa kendiliğinden okunmaz")
	g.call("_debug_speaker")
	assert_eq(fake.said.back(), "vo.genel.dinle", "açılmış hoparlör okutur")

func test_story_silent_hint1_reads_passage() -> void:
	var g: MiniGame = make("story", fixture("story_silent", FX)["params"] as Dictionary, 1)
	g.call("_debug_next")
	g.show_hint(1)
	assert_true(bool(g.call("voice_unlocked")))
	assert_eq(fake.said.back(), "vo.genel.dinle", "ipucu 1 okuma parçasını seslendirir")
	assert_eq(answers.size(), 0)

func test_story_multi_question() -> void:
	var g: MiniGame = make("story", fixture("story_silent", FX)["params"] as Dictionary, 1)
	g.call("_debug_next")
	g.call("_debug_choose", int(g.call("_debug_correct_index")))
	assert_eq(results.size(), 0, "ilk soru turu bitirmez")
	await wait_until(func() -> bool: return int(g.call("question_index")) == 1 and g._can_input(), 4.0)
	assert_eq(fake.said.back(), "vo.genel.dokun", "ikinci soru seslendirilir")
	g.call("_debug_choose", int(g.call("_debug_correct_index")))
	await wait_for_signal(g.finished, 3.0)
	assert_eq(answers, [true, true] as Array[bool])

func test_story_hint2_solves_from_read_phase() -> void:
	var g: MiniGame = make("story", fixture("story_silent", FX)["params"] as Dictionary, 1)
	g.show_hint(2)
	await wait_for_signal(g.finished, 8.0)
	assert_true(results[0].helped)
	assert_eq(answers, [true, true] as Array[bool])

func test_story_text_options_and_touch_targets() -> void:
	var g: MiniGame = make("story", fixture("story_listen", FX)["params"] as Dictionary, 1)
	assert_touch_targets(g)
	g.call("_debug_next")
	g.call("_debug_next")
	assert_touch_targets(g)

func test_story_debug_answer_paths() -> void:
	var g: MiniGame = make("story", fixture("story_listen", FX)["params"] as Dictionary, 1)
	g.call("_debug_answer", false)
	assert_eq(answers, [false] as Array[bool])
	await wait_unlocked(g)
	g.call("_debug_answer", true)
	await wait_for_signal(g.finished, 3.0)
	assert_eq(answers, [false, true] as Array[bool])

func test_story_listen_last_page_narration_moves_to_question() -> void:
	var g: MiniGame = make("story", fixture("story_listen", FX)["params"] as Dictionary, 1)
	await wait_seconds(1.5)
	assert_eq(str(g.call("phase")), "read", "ilk sayfanın sesi bitince sayfa kendiliğinden çevrilmez")
	assert_eq(int(g.call("page_index")), 0)
	g.call("_debug_next")
	var moved: bool = await wait_until(func() -> bool: return str(g.call("phase")) == "question", 3.0)
	assert_true(moved, "son sayfanın sesi bitince soru kendiliğinden gelir")
	assert_eq(fake.said.back(), "vo.genel.hazir_misin", "soru seslendirilir")
	assert_eq(answers.size(), 0, "soruya geçmek cevap değildir")

func test_story_silent_last_page_waits_for_arrow() -> void:
	var g: MiniGame = make("story", fixture("story_silent", FX)["params"] as Dictionary, 1)
	await wait_seconds(1.5)
	assert_eq(str(g.call("phase")), "read", "sessiz okumada çocuk kendi hızında okur")
