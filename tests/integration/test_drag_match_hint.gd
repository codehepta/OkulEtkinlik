extends "res://tests/helpers/template_harness.gd"
## drag_match ipucu 1: çocuğun son yanlış sürüklediği kartı esas alır; hem o kart hem gideceği
## hedef parlar. (Önceden yalnız ilk eşleşmemiş çiftin hedefi parlıyordu: çocuk elindeki kartı
## parlayan yere götürünce yine yanlış oluyordu.)

const GLOW_WAIT: float = 0.6

func _params() -> Dictionary:
	var pairs: Array = []
	for k: String in ["label.hb.23_nisan", "label.hb.19_mayis", "label.hb.29_ekim"]:
		pairs.append({"left": {"type": "text", "value": k}, "right": {"type": "item", "value": "item.milli.cocuk_senligi"}})
	return {"pairs": pairs}

func _glowing(c: Control) -> bool:
	return c.modulate.r > 1.1

func _target(g: MiniGame, pair_index: int) -> Control:
	return (g.get("_right_views") as Array[Control])[int(g.call("_slot_of", pair_index))]

func _left(g: MiniGame, pair_index: int) -> Control:
	return (g.get("_left_views") as Array[Control])[pair_index]

## Sol kart k'yi kendi hedefi olmayan bir yuvaya bırakır.
func _drop_wrong(g: MiniGame, k: int) -> void:
	var right: int = int(g.call("_slot_of", k))
	g.call("_drop", k, (right + 1) % (g.get("_right_views") as Array).size())

func test_hint_1_points_at_the_card_the_child_just_tried() -> void:
	var g: MiniGame = make("drag_match", _params())
	_drop_wrong(g, 2)
	await wait_seconds(1.0)
	g.show_hint(1)
	await wait_seconds(GLOW_WAIT)
	assert_true(_glowing(_left(g, 2)), "denenen kart parlar")
	assert_true(_glowing(_target(g, 2)), "o kartın hedefi parlar")
	assert_false(_glowing(_target(g, 0)), "başka çiftin hedefi parlamaz")

func test_hint_1_without_a_wrong_try_shows_first_open_pair_card_and_target() -> void:
	var g: MiniGame = make("drag_match", _params())
	g.show_hint(1)
	await wait_seconds(GLOW_WAIT)
	assert_true(_glowing(_left(g, 0)), "kart parlar")
	assert_true(_glowing(_target(g, 0)), "hedef parlar")

func test_hint_1_skips_a_tried_card_that_was_matched_later() -> void:
	var g: MiniGame = make("drag_match", _params())
	_drop_wrong(g, 1)
	await wait_seconds(1.0)
	g.call("_drop", 1, int(g.call("_slot_of", 1)))
	await wait_seconds(1.0)
	g.show_hint(1)
	await wait_seconds(GLOW_WAIT)
	assert_true(_glowing(_left(g, 0)), "eşleşmiş kart yerine ilk açık çift")
	assert_true(_glowing(_target(g, 0)))
