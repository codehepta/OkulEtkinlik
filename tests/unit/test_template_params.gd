extends GutTest
## Üç şablonun parametre doğrulaması (TemplateRegistry üzerinden).

func _item(v: String = "item.elma") -> Dictionary:
	return {"type": "item", "value": v}

func _num(v: Variant) -> Dictionary:
	return {"type": "number", "value": v}

func _ok(id: String, p: Dictionary) -> void:
	assert_eq(TemplateRegistry.validate(id, p), [] as Array[String], id + " geçerli olmalı")

func _bad(id: String, p: Dictionary, why: String) -> void:
	assert_gt(TemplateRegistry.validate(id, p).size(), 0, id + " geçersiz olmalı: " + why)

# --- Token ---
func test_token_validation() -> void:
	assert_true(Token.is_valid({"type": "item", "value": "item.elma"}))
	assert_true(Token.is_valid({"type": "number", "value": 3.0}))
	assert_true(Token.is_valid({"type": "text", "value": "label.x", "voice": "vo.x"}))
	assert_false(Token.is_valid({"type": "number", "value": 2.5}))
	assert_false(Token.is_valid({"type": "color", "value": "x"}))
	assert_false(Token.is_valid({"type": "item", "value": ""}))
	assert_false(Token.is_valid({"type": "text", "value": "a", "voice": ""}))
	assert_false(Token.is_valid("item"))

# --- count_choose ---
func test_count_choose_valid() -> void:
	_ok("count_choose", {"item": "item.elma", "count": 5, "choices": [4, 5, 6]})
	_ok("count_choose", {"item": "item.elma", "count": 5.0, "choices": [4.0, 5.0]})

func test_count_choose_invalid() -> void:
	_bad("count_choose", {"item": "item.elma", "count": 0, "choices": [0, 1]}, "count 0")
	_bad("count_choose", {"item": "item.elma", "count": 21, "choices": [20, 21]}, "count 21")
	_bad("count_choose", {"item": "item.elma", "count": 3, "choices": [1, 2]}, "count yok")
	_bad("count_choose", {"item": "item.elma", "count": 3, "choices": [3]}, "tek seçenek")
	_bad("count_choose", {"item": "item.elma", "count": 3, "choices": [1, 2, 3, 4, 5]}, "5 seçenek")

# --- drag_match ---
func _pair(l: Dictionary, r: Dictionary) -> Dictionary:
	return {"left": l, "right": r}

func test_drag_match_valid() -> void:
	_ok("drag_match", {"pairs": [_pair(_item("item.elma"), _num(1)), _pair(_item("item.armut"), _num(2))]})

func test_drag_match_invalid() -> void:
	_bad("drag_match", {"pairs": [_pair(_item(), _num(1))]}, "tek çift")
	_bad("drag_match", {}, "pairs yok")
	_bad("drag_match", {"pairs": [_pair(_item("a.b"), _num(1)), _pair(_item("a.c"), _num(2)), _pair(_item("a.d"), _num(3)), _pair(_item("a.e"), _num(4)), _pair(_item("a.f"), _num(5))]}, "5 çift")
	_bad("drag_match", {"pairs": [_pair(_item("a.b"), _num(1.5)), _pair(_item("a.c"), _num(2))]}, "kesirli sayı")
	_bad("drag_match", {"pairs": [{"left": _item("a.b")}, _pair(_item("a.c"), _num(2))]}, "right yok")
	_bad("drag_match", {"pairs": [_pair(_item("a.b"), _num(1)), _pair(_item("a.c"), _num(1))]}, "yinelenen sağ")

# --- listen_find ---
func _tv(v: String) -> Dictionary:
	return {"type": "item", "value": v, "voice": "vo.genel.aferin_1"}

func test_listen_find_valid() -> void:
	_ok("listen_find", {"target": _tv("item.elma"), "options": [_tv("item.elma"), _item("item.armut")]})

func test_listen_find_invalid() -> void:
	_bad("listen_find", {"target": _item("item.elma"), "options": [_item("item.elma"), _item("item.armut")]}, "voice yok")
	_bad("listen_find", {"target": _tv("item.elma"), "options": [_item("item.kedi"), _item("item.armut")]}, "target yok")
	_bad("listen_find", {"target": _tv("item.elma"), "options": [_item("item.elma")]}, "tek seçenek")
	_bad("listen_find", {"target": _tv("item.elma"), "options": [_item("item.elma"), {"type": "x", "value": "y"}]}, "bozuk token")
	_bad("listen_find", {"options": [_item("item.elma"), _item("item.armut")]}, "target yok")
