extends GutTest
## Faz 3 şablonlarının kaydı ve parametre doğrulaması (TemplateRegistry üzerinden).

const FAZ3: PackedStringArray = ["sequence", "balloon_pop"]

func _item(v: String) -> Dictionary:
	return {"type": "item", "value": v}

func _num(v: Variant) -> Dictionary:
	return {"type": "number", "value": v}

func _ok(id: String, p: Dictionary) -> void:
	assert_eq(TemplateRegistry.validate(id, p), [] as Array[String], id + " geçerli olmalı: " + str(p))

func _bad(id: String, p: Dictionary, why: String) -> void:
	assert_gt(TemplateRegistry.validate(id, p).size(), 0, id + " geçersiz olmalı: " + why)

func test_faz3_templates_registered() -> void:
	for id: String in FAZ3:
		assert_true(TemplateRegistry.has(id), id + " kayıtlı olmalı")
		if not TemplateRegistry.has(id):
			continue
		assert_true(ResourceLoader.exists(TemplateRegistry.SCENES[id]), id + " sahnesi var")
		assert_true(ResourceLoader.exists(TemplateRegistry.script_path(id)), id + " betiği var")

func test_fixture_params_are_valid() -> void:
	var data: Dictionary = JSON.parse_string(FileAccess.get_file_as_string("res://tests/fixtures/faz3/params.json"))
	for name: String in data:
		var entry: Dictionary = data[name]
		var id: String = str(entry["template"])
		if TemplateRegistry.has(id):
			_ok(id, entry["params"] as Dictionary)

# --- sequence ---
func test_sequence_valid() -> void:
	_ok("sequence", {"items": [_num(1), _num(2), _num(3)]})
	_ok("sequence", {"items": [_item("item.a.b"), _item("item.a.c"), _item("item.a.d"), _item("item.a.e"), _item("item.a.f"), _item("item.a.g")]})

func test_sequence_invalid() -> void:
	_bad("sequence", {}, "items yok")
	_bad("sequence", {"items": [_num(1), _num(2)]}, "2 öğe")
	_bad("sequence", {"items": [_num(1), _num(2), _num(3), _num(4), _num(5), _num(6), _num(7)]}, "7 öğe")
	_bad("sequence", {"items": [_num(1), _num(2), _num(2)]}, "yinelenen")
	_bad("sequence", {"items": [_num(1), _num(2.5), _num(3)]}, "kesirli sayı")
	_bad("sequence", {"items": [_num(1), {"type": "x", "value": 1}, _num(3)]}, "bozuk token")

# --- balloon_pop ---
func test_balloon_pop_valid() -> void:
	_ok("balloon_pop", {"a": 7, "op": "+", "b": 5, "choices": [12, 11]})
	_ok("balloon_pop", {"a": 9, "op": "-", "b": 9, "choices": [0, 1, 2, 3, 4, 5]})
	_ok("balloon_pop", {"a": 600.0, "op": "+", "b": 400.0, "choices": [1000.0, 900.0]})

func test_balloon_pop_invalid() -> void:
	_bad("balloon_pop", {"a": 3, "op": "-", "b": 5, "choices": [2, 8]}, "negatif sonuç")
	_bad("balloon_pop", {"a": 600, "op": "+", "b": 500, "choices": [1100, 1000]}, "sonuç > 1000")
	_bad("balloon_pop", {"a": 3, "op": "+", "b": 5, "choices": [7, 9]}, "choices'ta sonuç yok")
	_bad("balloon_pop", {"a": 3, "op": "+", "b": 5, "choices": [8, 1, 2, 3, 4, 5, 6]}, "7 seçenek")
	_bad("balloon_pop", {"a": 3, "op": "+", "b": 5, "choices": [8]}, "tek seçenek")
	_bad("balloon_pop", {"a": 3, "op": "+", "b": 5, "choices": [8, 7, 7]}, "yinelenen seçenek")
	_bad("balloon_pop", {"a": 3, "op": "x", "b": 5, "choices": [15, 8]}, "bilinmeyen op")
	_bad("balloon_pop", {"a": 3.5, "op": "+", "b": 5, "choices": [8, 9]}, "kesirli a")
	_bad("balloon_pop", {"op": "+", "b": 5, "choices": [8, 9]}, "a yok")
