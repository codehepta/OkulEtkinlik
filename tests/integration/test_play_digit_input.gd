extends "res://tests/helpers/template_harness.gd"
## Faz 3b: rakam karosu girişi (listen_find yazma modu).

func _p() -> Dictionary:
	return {"answer": "digits", "target": {"type": "number", "value": 305, "voice": "vo.test.sayi"}}

func test_write_mode_keys_fill_slots_and_check() -> void:
	var g: MiniGame = make("listen_find", _p())
	assert_true(bool(g.call("is_write_mode")))
	assert_true(fake.said.has("vo.test.sayi"), "hedef sayı okunur")
	assert_touch_targets(g)
	g.call("_debug_key", 3)
	g.call("_debug_key", 5)
	g.call("_debug_check")
	assert_eq(answers.size(), 0, "eksik yuvayla onay cevap sayılmaz")
	g.call("_debug_key", 0)
	assert_eq(int(g.call("written")), 350)
	g.call("_debug_check")
	assert_eq(answers, [false] as Array[bool])
	await wait_unlocked(g)
	assert_eq(int(g.call("written")), 350, "yanlıştan sonra rakamlar yerinde kalır")
	g.call("_debug_clear", 1)
	g.call("_debug_clear", 2)
	g.call("_debug_key", 0)
	g.call("_debug_key", 5)
	assert_eq(int(g.call("written")), 305)
	g.call("_debug_check")
	await wait_for_signal(g.finished, 3.0)
	assert_eq(answers, [false, true] as Array[bool])

func test_write_mode_hints() -> void:
	var g: MiniGame = make("listen_find", _p())
	g.show_hint(1)
	assert_eq(answers.size(), 0)
	g.show_hint(2)
	await wait_for_signal(g.finished, 3.0)
	assert_true(results[0].helped)
	assert_eq(int(g.call("written")), 305)

func test_write_mode_debug_answer() -> void:
	for v: int in [7, 10, 99, 100, 305]:
		answers = []
		results = []
		var g: MiniGame = make("listen_find", {"answer": "digits", "target": {"type": "number", "value": v, "voice": "vo.test.sayi"}})
		g.call("_debug_answer", false)
		await wait_unlocked(g)
		g.call("_debug_answer", true)
		await wait_for_signal(g.finished, 3.0)
		assert_eq(answers, [false, true] as Array[bool], str(v))

func test_write_mode_params() -> void:
	assert_eq(TemplateRegistry.validate("listen_find", _p()), [] as Array[String])
	for bad: Dictionary in [
		{"answer": "letters", "target": {"type": "number", "value": 3, "voice": "vo.a"}},
		{"answer": "digits", "target": {"type": "item", "value": "item.a.b", "voice": "vo.a"}},
		{"answer": "digits", "target": {"type": "number", "value": 10000, "voice": "vo.a"}},
		{"answer": "digits", "target": {"type": "number", "value": 3}},
	]:
		assert_gt(TemplateRegistry.validate("listen_find", bad).size(), 0, str(bad))
