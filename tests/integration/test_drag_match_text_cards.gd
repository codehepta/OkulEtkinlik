extends "res://tests/helpers/template_harness.gd"
## drag_match: sol kartların hepsi yazıysa kartlar (ve bırakma çukurları) geniştir; uzun bayram
## adı ("19 Mayıs Gençlik ve Spor Bayramı") öteki kartlardan belirgin küçük yazılmaz.

const TV: GDScript = preload("res://scenes/games/token_view.gd")

func _text(key: String) -> Dictionary:
	return {"type": "text", "value": key}

func _item(key: String) -> Dictionary:
	return {"type": "item", "value": key}

func _bayram_params() -> Dictionary:
	var pairs: Array = []
	for k: String in ["label.hb.23_nisan", "label.hb.19_mayis", "label.hb.29_ekim", "label.hb.30_agustos"]:
		pairs.append({"left": _text(k), "right": _item("item.milli.cocuk_senligi")})
	return {"pairs": pairs}

func _left_views(g: MiniGame) -> Array[Control]:
	return g.get("_left_views") as Array[Control]

func test_text_left_cards_are_wide() -> void:
	var g: MiniGame = make("drag_match", _bayram_params())
	var v: Control = _left_views(g)[0]
	assert_gt(v.size.x, v.size.y * 1.5, "yazı kartı geniş")

func test_wide_card_fits_its_well() -> void:
	var g: MiniGame = make("drag_match", _bayram_params())
	var v: Control = _left_views(g)[1]
	var slots: Array[int] = g.call("_debug_right_slots")
	var slot: Control = (g.get("_right_views") as Array[Control])[slots.find(1)]
	var target: Control = slot.get_child(1) as Control
	assert_true(target.position.x >= v.size.x, "hedef kart, çukura oturan geniş kartın sağında kalır")

func test_text_cards_share_one_font_size() -> void:
	var g: MiniGame = make("drag_match", _bayram_params())
	var sizes: Array[int] = []
	for v: Control in _left_views(g):
		var tile: Control = v.get("_tile") as Control
		sizes.append(int(tile.get("font_size")))
	assert_eq(sizes.min(), sizes.max(), "aynı turdaki yazı kartları aynı boyda yazılır: %s" % [sizes])
	# Ortak boy, en sığmayan kartın sığdığı boydur (hiçbiri taşmaz).
	var v1: Control = _left_views(g)[1]
	assert_lte(sizes[1], TV.fit_font_size(TV.layout_label(str(v1.get("_label_text")), v1.size), v1.size))

func test_item_left_cards_stay_square() -> void:
	var p: Dictionary = {"pairs": [
		{"left": _item("item.milli.cocuk_senligi"), "right": _text("label.hb.23_nisan")},
		{"left": _item("item.milli.genclik_spor"), "right": _text("label.hb.19_mayis")},
	]}
	var g: MiniGame = make("drag_match", p)
	var v: Control = _left_views(g)[0]
	assert_eq(v.size.x, v.size.y)
