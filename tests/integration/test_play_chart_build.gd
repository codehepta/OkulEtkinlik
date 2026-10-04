extends "res://tests/helpers/template_harness.gd"
## chart_build: nesneleri grafiğe sürükleyip grafikle ilgili soruları yanıtlama.

const CB_FIXTURE: String = "res://tests/fixtures/faz3b/chart_build.json"
const CATS: Array = ["item.meyve.elma", "item.meyve.armut", "item.meyve.muz"]

func _params(kind: String = "tally", questions: Array = []) -> Dictionary:
	if questions.is_empty():
		questions = [
			{"ask": "most", "voice": "vo.test.q1"},
			{"ask": "count", "category": 0, "choices": [2, 3, 4], "voice": "vo.test.q2"},
		]
	return {"kind": kind, "categories": CATS.duplicate(), "counts": [3, 5, 2], "questions": questions}

## Küçük tur: 3 nesne, tek soru (bekleme süreli testler kısa kalsın).
func _small(kind: String = "dot", ask: Dictionary = {"ask": "most", "voice": "vo.test.q1"}) -> Dictionary:
	return {"kind": kind, "categories": ["item.meyve.elma", "item.meyve.armut"], "counts": [2, 1], "questions": [ask]}

func _cb_fixture(name: String) -> Dictionary:
	var data: Dictionary = JSON.parse_string(FileAccess.get_file_as_string(CB_FIXTURE))
	return ((data[name] as Dictionary)["params"] as Dictionary).duplicate(true)

## Bütün nesneleri doğru sütuna bırakır (testi hızlandırmak için kilidi elle açar).
func _fill(g: MiniGame) -> void:
	var cats: Array[int] = g.call("item_categories")
	for i: int in cats.size():
		g.input_locked = false
		g.call("_debug_drop", i, cats[i])
	g.input_locked = false

func _first_item_of(g: MiniGame, cat: int) -> int:
	var cats: Array[int] = g.call("item_categories")
	return cats.find(cat)

func test_chart_build_drop_correct_and_wrong() -> void:
	var g: MiniGame = make("chart_build", _params())
	assert_eq(g.call("phase"), "build")
	assert_eq(int(g.call("remaining_items")), 10)
	assert_eq(g.call("chart_counts"), [0, 0, 0] as Array[int])
	var i: int = _first_item_of(g, 1)
	g.call("_debug_drop", i, 0)
	assert_eq(answers, [false] as Array[bool], "yanlış kategori yanlış sayılır")
	assert_eq(int(g.call("remaining_items")), 10, "nesne tepsiye döner")
	assert_eq(g.call("chart_counts"), [0, 0, 0] as Array[int])
	await wait_unlocked(g)
	g.call("_debug_drop", i, -1)
	assert_eq(answers.size(), 1, "hedef dışı bırakma cevap değildir")
	g.call("_debug_drop", i, 1)
	assert_eq(answers, [false, true] as Array[bool])
	assert_eq(int(g.call("remaining_items")), 9)
	assert_eq(g.call("chart_counts"), [0, 1, 0] as Array[int])
	assert_eq(results.size(), 0, "tur bitmedi")
	await wait_unlocked(g)
	g.call("_debug_drop", i, 1)
	assert_eq(answers.size(), 2, "yerleşen nesne yeniden bırakılamaz")

func test_chart_build_kinds_render() -> void:
	for name: String in ["chart_tally", "chart_table", "chart_object", "chart_dot"]:
		var p: Dictionary = _cb_fixture(name)
		var g: MiniGame = make("chart_build", p)
		_fill(g)
		var want: Array[int] = []
		for c: Variant in p["counts"] as Array:
			want.append(int(c))
		assert_eq(g.call("chart_counts"), want, name + ": grafik sayıları")
		assert_eq(int(g.call("remaining_items")), 0)
		assert_eq(g.call("phase"), "questions", name + ": soru evresine geçer")
		assert_eq(int(g.call("question_index")), 0)

func test_chart_build_questions_flow() -> void:
	var g: MiniGame = make("chart_build", _params())
	_fill(g)
	assert_eq(fake.said.count("vo.test.q1"), 1, "ilk soru seslendirilir")
	assert_false(fake.said.has("vo.test.q2"))
	g.call("_debug_choose", int(g.call("_debug_correct_index")))
	assert_eq(int(g.call("question_index")), 1)
	assert_eq(results.size(), 0, "son sorudan önce bitmez")
	assert_true(fake.said.has("vo.test.q2"), "ikinci soru seslendirilir")
	await wait_unlocked(g)
	var correct: int = int(g.call("_debug_correct_index"))
	g.call("_debug_choose", (correct + 1) % 3)
	assert_eq(answers[answers.size() - 1], false, "yanlış seçim")
	assert_eq(int(g.call("question_index")), 1, "yanlışta soru değişmez")
	await wait_unlocked(g)
	g.call("_debug_choose", correct)
	await wait_for_signal(g.finished, 3.0)
	assert_eq(results.size(), 1)
	assert_eq(results[0].wrong, 1)
	assert_false(results[0].helped)

func test_chart_build_most_least_icons() -> void:
	var g: MiniGame = make("chart_build", _params("object", [
		{"ask": "most", "voice": "vo.test.q1"}, {"ask": "least", "voice": "vo.test.q2"}]))
	_fill(g)
	var tiles: Array[Control] = g.call("touch_targets")
	assert_eq(tiles.size(), 3, "her kategori bir seçenek")
	for k: int in tiles.size():
		var imgs: Array[Node] = tiles[k].find_children("*", "TextureRect", true, false)
		assert_eq(imgs.size(), 1, "seçenek bir ikon taşır")
		assert_eq(str(imgs[0].get("key")), CATS[k])
	assert_eq(int(g.call("_debug_correct_index")), 1, "en çok: armut (5)")
	g.call("_debug_choose", 1)
	await wait_unlocked(g)
	assert_eq(int(g.call("_debug_correct_index")), 2, "en az: muz (2)")

func test_chart_build_difficulty_counters() -> void:
	var g1: MiniGame = make("chart_build", _params("tally"), 1)
	assert_eq(g1.call("counter_texts"), ["0", "0", "0"] as Array[String], "zorluk 1: canlı sayaç")
	g1.call("_debug_drop", _first_item_of(g1, 0), 0)
	assert_eq(g1.call("counter_texts"), ["1", "0", "0"] as Array[String])
	for kind: String in ["tally", "object", "dot"]:
		var g2: MiniGame = make("chart_build", _params(kind), 2)
		assert_eq(g2.call("counter_texts"), [] as Array[String], kind + " zorluk 2: sayaç gizli")
	var g3: MiniGame = make("chart_build", _params("dot"), 3)
	assert_eq(g3.call("counter_texts"), [] as Array[String])
	var gt: MiniGame = make("chart_build", _params("table"), 3)
	assert_eq(gt.call("counter_texts"), ["0", "0", "0"] as Array[String], "tablo her zaman sayı gösterir")
	gt.call("_debug_drop", _first_item_of(gt, 2), 2)
	assert_eq(gt.call("counter_texts"), ["0", "0", "1"] as Array[String])

func test_chart_build_hint1_build_glows_item_and_target() -> void:
	var g: MiniGame = make("chart_build", _params(), 2)
	g.show_hint(1)
	await wait_seconds(0.5)
	var targets: Array[Control] = g.call("chart_targets")
	var cats: Array[int] = g.call("item_categories")
	var items: Array[Control] = g.call("touch_targets")
	assert_gt(items[0].modulate.r, 1.0, "ilk nesne parlar")
	assert_gt(targets[cats[0]].modulate.r, 1.0, "hedef satırı parlar")
	assert_eq(answers.size(), 0, "ipucu cevap sayılmaz")

func test_chart_build_hint1_question_counts_aloud() -> void:
	var g: MiniGame = make("chart_build", _params("dot", [
		{"ask": "count", "category": 0, "choices": [2, 3, 4], "voice": "vo.test.q1"}]), 2)
	_fill(g)
	fake.said.clear()
	g.show_hint(1)
	await wait_seconds(0.5)
	var targets: Array[Control] = g.call("chart_targets")
	assert_gt(targets[0].modulate.r, 1.0, "ilgili sütun parlar")
	assert_eq(targets[1].modulate.r, 1.0, "diğer sütun parlamaz")
	await wait_until(func() -> bool: return fake.said.has("vo.sayi.3"), 5.0)
	assert_eq(fake.said, ["vo.sayi.1", "vo.sayi.2", "vo.sayi.3"] as Array[String])
	assert_eq(answers.size(), 10, "yalnızca bırakmalar cevap sayıldı")

func test_chart_build_hints() -> void:
	# Kurma evresinden: kalan bırakmalar ve sorular otomatik tamamlanır.
	var g: MiniGame = make("chart_build", _small("tally", {"ask": "total", "choices": [3, 4], "voice": "vo.test.q1"}))
	g.show_hint(2)
	g.call("_debug_answer", false)
	assert_eq(answers.count(false), 0, "yardım sürerken girdi yok sayılır")
	await wait_for_signal(g.finished, 10.0)
	assert_eq(results.size(), 1)
	assert_true(results[0].helped)
	assert_eq(results[0].wrong, 0)
	assert_eq(g.call("chart_counts"), [2, 1] as Array[int])
	assert_true(fake.said.has("vo.test.q1"))
	# Soru evresinden.
	results.clear()
	var g2: MiniGame = make("chart_build", _params("table"))
	_fill(g2)
	g2.call("_debug_choose", int(g2.call("_debug_correct_index")))
	await wait_unlocked(g2)
	g2.show_hint(2)
	await wait_for_signal(g2.finished, 6.0)
	assert_eq(results.size(), 1)
	assert_true(results[0].helped)
	assert_eq(int(g2.call("question_index")), 1, "son soruda biter")

func test_chart_build_touch_targets() -> void:
	var g: MiniGame = make("chart_build", _params())
	assert_eq((g.call("touch_targets") as Array[Control]).size(), 10, "kurma evresi: tepsideki nesneler")
	assert_touch_targets(g)
	var big: Dictionary = {"kind": "dot", "categories": ["item.a.b", "item.a.c", "item.a.d", "item.a.e"],
		"counts": [4, 4, 4, 3], "questions": [{"ask": "least", "voice": "vo.x"}]}
	var gb: MiniGame = make("chart_build", big)
	assert_touch_targets(gb)
	for c: Control in gb.call("touch_targets") as Array[Control]:
		assert_true(Rect2(Vector2.ZERO, MiniGame.BASE_SIZE).encloses(Rect2(c.position, c.size)), "nesne ekranda")
	_fill(gb)
	assert_eq((gb.call("touch_targets") as Array[Control]).size(), 4, "soru evresi: seçenekler")
	assert_touch_targets(gb)
	_fill(g)
	assert_eq((g.call("touch_targets") as Array[Control]).size(), 3)
	assert_touch_targets(g)

func test_chart_build_debug_answer_paths() -> void:
	var g: MiniGame = make("chart_build", _small())
	g.call("_debug_answer", false)
	assert_eq(answers, [false] as Array[bool])
	for k: int in 3:
		await wait_unlocked(g)
		g.call("_debug_answer", true)
	assert_eq(g.call("phase"), "questions")
	await wait_unlocked(g)
	g.call("_debug_answer", false)
	await wait_unlocked(g)
	g.call("_debug_answer", true)
	await wait_for_signal(g.finished, 3.0)
	assert_eq(answers, [false, true, true, true, false, true] as Array[bool])
	assert_eq(results[0].wrong, 2)

func test_chart_build_multi_step_result() -> void:
	var g: MiniGame = make("chart_build", _small())
	g.show_hint(2)
	await wait_for_signal(g.finished, 10.0)
	assert_eq(results.size(), 1)
	assert_true(results[0].multi_step)

## Bilge sol alt köşede durur (lesson_runner: x 16–266, y 724–1068); tepsi ve nesneler oraya taşmaz.
func test_chart_build_keeps_bilge_corner_clear() -> void:
	var corner: Rect2 = Rect2(16, 724, 250, 344)
	for kind: String in ["tally", "table", "object", "dot"]:
		var full: Dictionary = {"kind": kind, "categories": ["item.meyve.elma", "item.meyve.armut", "item.meyve.muz"],
			"counts": [8, 4, 3], "questions": [{"ask": "most", "voice": "vo.test.q1"}]}
		var g: MiniGame = make("chart_build", full, 1)
		for c: Control in g.call("touch_targets") as Array[Control]:
			assert_false(c.get_global_rect().intersects(corner), "%s Bilge köşesine taşmamalı" % c.name)
			assert_true(c.size.x >= 128.0, "15 nesnede de ≥128 px")
