extends "res://tests/helpers/template_harness.gd"
## drag_match okuma kipleri: dinlemede sol kartın sesi tutunca okunur; sessiz okumada
## sesler ilk cevaba (ya da ipucuna) kadar kapalıdır.

const FX: String = "res://tests/fixtures/faz4a/params.json"

func _press_left(g: MiniGame, i: int) -> void:
	var ev: InputEventMouseButton = InputEventMouseButton.new()
	ev.button_index = MOUSE_BUTTON_LEFT
	ev.pressed = true
	g.call("_on_left_input", ev, i)
	var up: InputEventMouseButton = InputEventMouseButton.new()
	up.button_index = MOUSE_BUTTON_LEFT
	up.pressed = false
	g.call("_on_left_input", up, i)

func _params(read: String) -> Dictionary:
	var p: Dictionary = fixture("match_silent", FX)["params"] as Dictionary
	p["read"] = read
	return p

func test_listen_reads_left_card_on_pickup() -> void:
	var g: MiniGame = make("drag_match", _params("listen"))
	_press_left(g, 0)
	assert_eq(fake.said, ["vo.genel.dinle"] as Array[String])

func test_silent_withholds_until_first_answer() -> void:
	var g: MiniGame = make("drag_match", _params("silent"))
	_press_left(g, 0)
	assert_eq(fake.said.size(), 0, "sessiz okumada kart sesi tutulur")
	var slots: Array[int] = g.call("_debug_right_slots")
	g.call("_debug_drop", 0, slots.find(1))
	assert_eq(answers, [false] as Array[bool])
	assert_true(bool(g.call("voice_unlocked")))
	await wait_unlocked(g)
	_press_left(g, 0)
	assert_eq(fake.said.back(), "vo.genel.dinle", "ilk cevaptan sonra ses açılır")

func test_silent_hint1_reads_pair() -> void:
	var g: MiniGame = make("drag_match", _params("silent"))
	g.show_hint(1)
	assert_true(bool(g.call("voice_unlocked")))
	assert_eq(fake.said.back(), "vo.genel.dinle")

func test_default_without_voices_stays_quiet() -> void:
	var g: MiniGame = make("drag_match", {"pairs": [
		{"left": {"type": "number", "value": 1}, "right": {"type": "number", "value": 1, "voice": "vo.sayi.1"}},
		{"left": {"type": "number", "value": 2}, "right": {"type": "number", "value": 2, "voice": "vo.sayi.2"}}]})
	_press_left(g, 0)
	assert_eq(fake.said.size(), 0, "sol kartta ses yoksa (Faz 1 içeriği) davranış değişmez")
