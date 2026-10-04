extends GutTest
## Üç şablonun oynanışı: sahne örneklenir, setup çağrılır, cevap simüle edilir.

const FakeServices: GDScript = preload("res://tests/helpers/fake_services.gd")

var _fake: Node = null
var _answers: Array[bool] = []
var _results: Array[RoundResult] = []

func before_each() -> void:
	_answers = []
	_results = []
	_fake = FakeServices.new()
	add_child_autofree(_fake)

func _make(id: String, params: Dictionary) -> MiniGame:
	var scene: PackedScene = load(TemplateRegistry.SCENES[id]) as PackedScene
	var game: MiniGame = scene.instantiate() as MiniGame
	game.narrator = _fake
	game.audio = _fake
	add_child_autofree(game)
	var ctx: RoundContext = RoundContext.new()
	ctx.rng.seed = 7
	ctx.voice_id = "vo.test"
	ctx.outcomes = PackedStringArray(["TEST.1"])
	game.answered.connect(func(c: bool) -> void: _answers.append(c))
	game.finished.connect(func(r: RoundResult) -> void: _results.append(r))
	game.setup(params, 1, ctx)
	return game

func _count_params() -> Dictionary:
	return {"item": "item.elma", "count": 3, "choices": [2, 3, 4]}

func _drag_params() -> Dictionary:
	return {"pairs": [
		{"left": {"type": "item", "value": "item.elma"}, "right": {"type": "number", "value": 1}},
		{"left": {"type": "item", "value": "item.armut"}, "right": {"type": "number", "value": 2}},
	]}

func _listen_params() -> Dictionary:
	return {
		"target": {"type": "item", "value": "item.elma", "voice": "vo.sayi.1"},
		"options": [
			{"type": "item", "value": "item.elma"},
			{"type": "item", "value": "item.armut"},
			{"type": "item", "value": "item.kedi"},
		],
	}

# count_choose seçenekleri sırayla [2,3,4] (karıştırılmaz); doğru = indeks 1.
func test_count_choose_correct_emits_finished() -> void:
	var g: MiniGame = _make("count_choose", _count_params())
	g._debug_choose(1)
	assert_eq(_answers, [true] as Array[bool])
	assert_true(g.input_locked)
	await wait_for_signal(g.finished, 3.0)
	assert_eq(_results.size(), 1)
	var r: RoundResult = _results[0]
	assert_eq(r.attempts, 1)
	assert_eq(r.wrong, 0)
	assert_false(r.helped)
	assert_eq(r.outcomes, PackedStringArray(["TEST.1"]))
	assert_true(_fake.sfx.has("sfx.correct"))
	var praised: bool = false
	for id: String in _fake.said:
		if id.begins_with("vo.genel.aferin_"):
			praised = true
	assert_true(praised, "aferin satırı okunmalı")

func test_count_choose_wrong_emits_answered_false() -> void:
	var g: MiniGame = _make("count_choose", _count_params())
	g._debug_choose(0)
	assert_eq(_answers, [false] as Array[bool])
	assert_eq(_results.size(), 0)

func test_input_locked_during_feedback() -> void:
	var g: MiniGame = _make("count_choose", _count_params())
	g._debug_choose(0)
	g._debug_choose(2)
	g._debug_choose(1)
	assert_eq(_answers.size(), 1, "kilitliyken dokunmalar yok sayılır")
	await wait_seconds(0.7)
	assert_false(g.input_locked, "yanlış cevap kilidi 0.6 sn sonra açılır")
	g._debug_choose(1)
	assert_eq(_answers, [false, true] as Array[bool])
	await wait_for_signal(g.finished, 3.0)
	assert_eq(_results[0].wrong, 1)
	assert_eq(_results[0].attempts, 2)

func test_drag_match_finishes_after_all_pairs() -> void:
	var g: MiniGame = _make("drag_match", _drag_params())
	var right_of: Array[int] = g._debug_right_slots()
	g._debug_drop(0, right_of[0])
	assert_eq(_answers, [true] as Array[bool])
	assert_eq(_results.size(), 0, "ilk çiftten sonra tur bitmez")
	await wait_seconds(0.9)
	g._debug_drop(1, right_of[0])
	assert_eq(_answers, [true, false] as Array[bool])
	await wait_seconds(0.7)
	g._debug_drop(1, right_of[1])
	await wait_for_signal(g.finished, 3.0)
	assert_eq(_results.size(), 1)
	assert_eq(_results[0].wrong, 1)
	assert_eq(_results[0].attempts, 3)

func test_listen_find_speaks_target_on_setup() -> void:
	_make("listen_find", _listen_params())
	assert_eq(_fake.said, ["vo.sayi.1"] as Array[String])

func test_listen_find_correct_choice_finishes() -> void:
	var g: MiniGame = _make("listen_find", _listen_params())
	g._debug_choose(g._debug_correct_index())
	await wait_for_signal(g.finished, 3.0)
	assert_eq(_results[0].wrong, 0)

func test_show_hint_2_resolves_round() -> void:
	var cases: Dictionary = {
		"count_choose": _count_params(),
		"drag_match": _drag_params(),
		"listen_find": _listen_params(),
	}
	for id: String in cases:
		_results = []
		var g: MiniGame = _make(id, cases[id] as Dictionary)
		g.show_hint(1)
		g.show_hint(2)
		await wait_for_signal(g.finished, 5.0)
		assert_eq(_results.size(), 1, id + ": finished yayılmalı")
		assert_true(_results[0].helped, id + ": helped olmalı")
