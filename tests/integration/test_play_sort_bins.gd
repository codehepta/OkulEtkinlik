extends "res://tests/helpers/template_harness.gd"
## sort_bins: öğeleri kutulara ayırma.

## Tek / çift: 1..n sayıları, tekler kutu 0, çiftler kutu 1.
func _odd_even(n: int) -> Dictionary:
	var items: Array = []
	for i: int in n:
		items.append({"token": {"type": "number", "value": i + 1}, "bin": i % 2})
	return {"bins": [
		{"label": {"type": "item", "value": "item.simge.tek", "voice": "vo.test.tek"}, "shape": "circle", "color": "red"},
		{"label": {"type": "item", "value": "item.simge.cift"}, "shape": "square", "color": "blue"}],
		"items": items}

func _wrong_bin(g: MiniGame, item: int) -> int:
	return 1 - int(g.call("_debug_bin_of", item))

func test_sort_correct_drops_finish() -> void:
	var g: MiniGame = make("sort_bins", _odd_even(4), 3)
	assert_eq(g.call("open_items"), [0, 1, 2, 3] as Array[int], "zorluk 3: örnek yok")
	for k: int in 4:
		var item: int = (g.call("open_items") as Array[int])[0]
		g.call("_debug_drop", item, int(g.call("_debug_bin_of", item)))
		if k < 3:
			assert_eq(results.size(), 0, "son öğeden önce bitmez")
			await wait_unlocked(g)
	assert_eq(answers, [true, true, true, true] as Array[bool])
	await wait_for_signal(g.finished, 3.0)
	assert_eq(results.size(), 1)
	assert_eq(results[0].wrong, 0)
	assert_false(results[0].helped)
	assert_eq(g.call("bin_contents", 0), [0, 2] as Array[int])
	assert_eq(g.call("bin_contents", 1), [1, 3] as Array[int])

func test_sort_wrong_bin_bounces_and_answers_false() -> void:
	var g: MiniGame = make("sort_bins", _odd_even(4), 3)
	g.call("_debug_drop", 0, _wrong_bin(g, 0))
	assert_eq(answers, [false] as Array[bool])
	assert_eq(g.call("open_items"), [0, 1, 2, 3] as Array[int], "yanlış kutuya giren öğe yerleşmez")
	assert_eq(g.call("bin_contents", 1), [] as Array[int])
	await wait_unlocked(g)
	g.call("_debug_drop", 0, 0)
	assert_eq(answers, [false, true] as Array[bool])
	assert_eq(g.call("open_items"), [1, 2, 3] as Array[int])

func test_sort_drop_outside_is_not_an_answer() -> void:
	var g: MiniGame = make("sort_bins", _odd_even(4), 3)
	g.call("_debug_drop", 0, -1)
	assert_eq(answers.size(), 0)
	assert_eq(g.call("open_items"), [0, 1, 2, 3] as Array[int])

func test_sort_input_ignored_while_locked() -> void:
	var g: MiniGame = make("sort_bins", _odd_even(4), 3)
	g.call("_debug_drop", 0, _wrong_bin(g, 0))
	g.call("_debug_drop", 1, _wrong_bin(g, 1))
	assert_eq(answers, [false] as Array[bool], "geri bildirim sırasında dokunma yok sayılır")

func test_sort_difficulty_examples() -> void:
	assert_eq(make("sort_bins", _odd_even(6), 1).call("open_items"), [2, 3, 4, 5] as Array[int], "zorluk 1: her kutuda bir örnek")
	assert_eq(make("sort_bins", _odd_even(6), 2).call("open_items"), [1, 2, 3, 4, 5] as Array[int], "zorluk 2: yalnızca ilk kutuda örnek")
	var single: Dictionary = _odd_even(4)
	(single["items"] as Array)[3]["bin"] = 0
	# Kutu 1'de tek öğe var: örnek olarak kullanılmaz (sıralanacak öğe kalsın).
	assert_eq(make("sort_bins", single, 1).call("open_items"), [1, 2, 3] as Array[int])
	var g: MiniGame = make("sort_bins", _odd_even(6), 1)
	assert_eq(g.call("bin_contents", 0), [0] as Array[int], "örnek kutunun içinde başlar")
	assert_eq(g.call("bin_contents", 1), [1] as Array[int])

func test_sort_hint1_glows_next_item_and_bin() -> void:
	var g: MiniGame = make("sort_bins", _odd_even(4), 3)
	var next: int = int(g.call("_debug_next_item"))
	var item: Control = (g.call("item_views") as Array[Control])[next]
	var bin: Control = (g.call("bin_views") as Array[Control])[int(g.call("_debug_bin_of", next))]
	g.show_hint(1)
	await wait_seconds(0.5)
	assert_gt(item.modulate.r, 1.0, "sıradaki öğe parlar")
	assert_gt(bin.modulate.r, 1.0, "onun kutusu parlar")
	assert_eq(answers.size(), 0, "ipucu cevap sayılmaz")

func test_sort_hint2_completes_all() -> void:
	var g: MiniGame = make("sort_bins", _odd_even(5), 3)
	g.show_hint(2)
	await wait_for_signal(g.finished, 8.0)
	assert_eq(results.size(), 1)
	assert_true(results[0].helped)
	assert_eq(g.call("open_items"), [] as Array[int])
	assert_eq(g.call("bin_contents", 0), [0, 2, 4] as Array[int])

func test_sort_tap_bin_says_label() -> void:
	var g: MiniGame = make("sort_bins", _odd_even(4), 3)
	g.call("_debug_tap_bin", 0)
	assert_true(fake.said.has("vo.test.tek"), "kutuya dokununca adı okunur")
	g.call("_debug_tap_bin", 1)
	assert_eq(answers.size(), 0, "kutuya dokunmak cevap değil")

func test_sort_bins_have_distinct_shapes() -> void:
	var g: MiniGame = make("sort_bins", _odd_even(4), 3)
	assert_eq(g.call("bin_shapes"), ["circle", "square"] as Array[String], "renk tek başına anlam taşımaz")

func test_sort_layout_fits_screen() -> void:
	var p: Dictionary = {"bins": [
		{"label": {"type": "item", "value": "item.a.b"}, "shape": "circle"},
		{"label": {"type": "item", "value": "item.a.c"}, "shape": "star"},
		{"label": {"type": "item", "value": "item.a.d"}, "shape": "heart"}], "items": []}
	for i: int in 9:
		(p["items"] as Array).append({"token": {"type": "number", "value": i}, "bin": 0 if i < 7 else i - 6})
	var g: MiniGame = make("sort_bins", p, 3)
	var screen: Rect2 = Rect2(Vector2.ZERO, MiniGame.BASE_SIZE)
	for c: Control in (g.call("item_views") as Array[Control]) + (g.call("bin_views") as Array[Control]):
		assert_true(screen.encloses(Rect2(c.position, c.size)), "%s ekranda: %s" % [c.name, Rect2(c.position, c.size)])
	g.show_hint(2)
	await wait_for_signal(g.finished, 12.0)
	for c: Control in g.call("item_views") as Array[Control]:
		assert_true(screen.encloses(c.get_global_rect()), "yerleşen öğe kutu içinde kalır")

func test_sort_touch_targets() -> void:
	assert_touch_targets(make("sort_bins", _odd_even(9), 3))

func test_sort_debug_answer_paths() -> void:
	var g: MiniGame = make("sort_bins", _odd_even(4), 1)
	g.call("_debug_answer", false)
	assert_eq(answers, [false] as Array[bool])
	await wait_unlocked(g)
	g.call("_debug_answer", true)
	await wait_unlocked(g)
	g.call("_debug_answer", true)
	await wait_for_signal(g.finished, 3.0)
	assert_eq(results[0].wrong, 1)
