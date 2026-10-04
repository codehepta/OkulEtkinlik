extends GutTest
## Faz 3 şablonlarının kaydı ve parametre doğrulaması (TemplateRegistry üzerinden).

const FAZ3: PackedStringArray = ["sequence", "balloon_pop", "pattern", "balance", "clock_money", "fraction_pizza"]

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

# --- pattern ---
func _cell(shape: String, color: String) -> Dictionary:
	return {"shape": shape, "color": color}

func test_pattern_valid() -> void:
	_ok("pattern", {"kind": "repeat", "unit": [_cell("circle", "red"), _cell("square", "blue")], "length": 5})
	_ok("pattern", {"kind": "repeat", "unit": [_cell("star", "red"), _cell("star", "red"), _cell("heart", "green")], "length": 12})
	_ok("pattern", {"kind": "repeat", "unit": [_item("item.meyve.elma"), _item("item.meyve.armut")], "length": 8})
	_ok("pattern", {"kind": "number", "start": 2, "step": 2, "length": 6})
	_ok("pattern", {"kind": "number", "start": 100, "step": -10, "length": 10})

func test_pattern_invalid() -> void:
	_bad("pattern", {"kind": "spiral"}, "bilinmeyen tür")
	_bad("pattern", {"kind": "repeat", "unit": [_cell("circle", "red")], "length": 5}, "tek hücreli birim")
	_bad("pattern", {"kind": "repeat", "unit": [_cell("circle", "red"), _cell("circle", "red")], "length": 5}, "hepsi aynı")
	_bad("pattern", {"kind": "repeat", "unit": [_cell("blob", "red"), _cell("circle", "blue")], "length": 5}, "bilinmeyen şekil")
	_bad("pattern", {"kind": "repeat", "unit": [_cell("circle", "pink"), _cell("square", "blue")], "length": 5}, "bilinmeyen renk")
	_bad("pattern", {"kind": "repeat", "unit": [_cell("circle", "red"), _cell("square", "blue")], "length": 4}, "length < 2u+1")
	_bad("pattern", {"kind": "repeat", "unit": [_cell("circle", "red"), _cell("square", "blue")], "length": 13}, "length > 12")
	_bad("pattern", {"kind": "repeat", "unit": [_num(1), _num(2)], "length": 5}, "sayı token birimde değil")
	_bad("pattern", {"kind": "number", "start": 2, "step": 0, "length": 6}, "adım 0")
	_bad("pattern", {"kind": "number", "start": 2, "step": 2, "length": 3}, "kısa")
	_bad("pattern", {"kind": "number", "start": 10, "step": -5, "length": 4}, "negatif terim")
	_bad("pattern", {"kind": "number", "start": 990, "step": 5, "length": 4}, "1000'i aşan terim")
	_bad("pattern", {"kind": "number", "start": 2, "step": 101, "length": 4}, "büyük adım")

func test_pattern_color_only_rejected() -> void:
	var errs: Array[String] = TemplateRegistry.validate("pattern", {"kind": "repeat", "unit": [_cell("circle", "red"), _cell("circle", "blue")], "length": 5})
	assert_eq(errs.size(), 1)
	assert_eq(errs[0], ContentValidator.msg("err.params.pat_color_only"))

# --- balance ---
func test_balance_valid() -> void:
	_ok("balance", {"mode": "scale", "ask": "compare", "left": [7], "right": [3, 2]})
	_ok("balance", {"mode": "scale", "ask": "compare", "left": [4], "right": [6], "item": "item.meyve.elma"})
	_ok("balance", {"mode": "scale", "ask": "missing", "left": [3, 4], "right": [5, null], "choices": [1, 2, 3]})
	_ok("balance", {"mode": "scale", "ask": "missing", "left": [null], "right": [8, 2], "choices": [10, 9]})
	_ok("balance", {"mode": "number_line", "ask": "find", "min": 0, "max": 10, "tick": 1, "value": 6, "choices": [5, 6, 7]})
	_ok("balance", {"mode": "number_line", "ask": "place", "min": 0, "max": 100, "tick": 10, "value": 70})
	_ok("balance", {"mode": "number_line", "ask": "place", "min": 20, "max": 40, "tick": 10, "value": 30})

func test_balance_invalid() -> void:
	_bad("balance", {"mode": "seesaw"}, "bilinmeyen mod")
	_bad("balance", {"mode": "scale", "ask": "guess", "left": [1], "right": [2]}, "bilinmeyen soru")
	_bad("balance", {"mode": "scale", "ask": "compare", "left": [], "right": [2]}, "boş taraf")
	_bad("balance", {"mode": "scale", "ask": "compare", "left": [1, 2, 3, 4], "right": [2]}, "4 değer")
	_bad("balance", {"mode": "scale", "ask": "compare", "left": [1001], "right": [2]}, "1000'den büyük")
	_bad("balance", {"mode": "scale", "ask": "compare", "left": [4, 1], "right": [6], "item": "item.meyve.elma"}, "item ile çok değer")
	_bad("balance", {"mode": "scale", "ask": "compare", "left": [11], "right": [6], "item": "item.meyve.elma"}, "item ile 10'dan fazla")
	_bad("balance", {"mode": "scale", "ask": "compare", "left": [null], "right": [6]}, "compare'da null")
	_bad("balance", {"mode": "scale", "ask": "missing", "left": [3, 4], "right": [5, 2], "choices": [1, 2]}, "null yok")
	_bad("balance", {"mode": "scale", "ask": "missing", "left": [null, 4], "right": [5, null], "choices": [1, 2]}, "iki null")
	_bad("balance", {"mode": "scale", "ask": "missing", "left": [3, 4], "right": [5, null], "choices": [1, 3]}, "choices'ta cevap yok")
	_bad("balance", {"mode": "scale", "ask": "missing", "left": [3, 4], "right": [5, null]}, "choices yok")
	_bad("balance", {"mode": "number_line", "ask": "find", "min": 0, "max": 10, "tick": 1, "value": 6}, "find'da choices yok")
	_bad("balance", {"mode": "number_line", "ask": "place", "min": 0, "max": 20, "tick": 1, "value": 6}, "20 aralık")
	_bad("balance", {"mode": "number_line", "ask": "place", "min": 0, "max": 10, "tick": 3, "value": 6}, "tick'e bölünmüyor")
	_bad("balance", {"mode": "number_line", "ask": "place", "min": 0, "max": 10, "tick": 2, "value": 5}, "çentikte değil")
	_bad("balance", {"mode": "number_line", "ask": "place", "min": 0, "max": 10, "tick": 1, "value": 10}, "uçta")
	_bad("balance", {"mode": "number_line", "ask": "place", "min": 995, "max": 1005, "tick": 1, "value": 1000}, "1000'i aşan")

func test_balance_missing_negative_rejected() -> void:
	var errs: Array[String] = TemplateRegistry.validate("balance", {"mode": "scale", "ask": "missing", "left": [3], "right": [5, null], "choices": [1, 2]})
	assert_eq(errs, [ContentValidator.msg("err.params.bal_missing_range")] as Array[String], "3 = 5 + ? çözümsüz")

# --- clock_money ---
func _t(h: int, m: int) -> Dictionary:
	return {"hour": h, "minute": m}

func test_clock_money_valid() -> void:
	_ok("clock_money", {"mode": "clock", "ask": "read", "hour": 3, "minute": 30, "choices": [_t(3, 30), _t(6, 15)]})
	_ok("clock_money", {"mode": "clock", "ask": "set", "hour": 12, "minute": 55})
	_ok("clock_money", {"mode": "money", "ask": "count", "unit": "tl", "items": ["tl_5", "tl_10"], "choices": [15, 16]})
	_ok("clock_money", {"mode": "money", "ask": "count", "unit": "kr", "items": ["kr_50", "tl_1"], "choices": [150, 100, 75]})
	_ok("clock_money", {"mode": "money", "ask": "pay", "unit": "tl", "amount": 35, "wallet": ["tl_20", "tl_10", "tl_5"]})

func test_clock_money_invalid() -> void:
	_bad("clock_money", {"mode": "time"}, "bilinmeyen mod")
	_bad("clock_money", {"mode": "clock", "ask": "count", "hour": 3, "minute": 0}, "saatte para sorusu")
	_bad("clock_money", {"mode": "clock", "ask": "set", "hour": 13, "minute": 0}, "saat 13")
	_bad("clock_money", {"mode": "clock", "ask": "set", "hour": 0, "minute": 0}, "saat 0")
	_bad("clock_money", {"mode": "clock", "ask": "set", "hour": 3, "minute": 7}, "5'in katı değil")
	_bad("clock_money", {"mode": "clock", "ask": "set", "hour": 3, "minute": 60}, "dakika 60")
	_bad("clock_money", {"mode": "clock", "ask": "read", "hour": 3, "minute": 30, "choices": [_t(4, 30), _t(6, 15)]}, "hedef yok")
	_bad("clock_money", {"mode": "clock", "ask": "read", "hour": 3, "minute": 30, "choices": [_t(3, 30), _t(3, 30)]}, "yinelenen")
	_bad("clock_money", {"mode": "clock", "ask": "read", "hour": 3, "minute": 30, "choices": [_t(3, 30)]}, "tek seçenek")
	_bad("clock_money", {"mode": "money", "ask": "count", "unit": "usd", "items": ["tl_5"], "choices": [5, 6]}, "bilinmeyen birim")
	_bad("clock_money", {"mode": "money", "ask": "count", "unit": "tl", "items": ["kr_50"], "choices": [5, 6]}, "birime uymayan küpür")
	_bad("clock_money", {"mode": "money", "ask": "count", "unit": "tl", "items": ["tl_3"], "choices": [3, 6]}, "olmayan küpür")
	_bad("clock_money", {"mode": "money", "ask": "count", "unit": "tl", "items": [], "choices": [5, 6]}, "boş")
	_bad("clock_money", {"mode": "money", "ask": "count", "unit": "tl", "items": ["tl_200", "tl_200", "tl_200", "tl_200", "tl_200", "tl_200"], "choices": [1200, 1000]}, "1000'i aşan toplam")
	_bad("clock_money", {"mode": "money", "ask": "count", "unit": "tl", "items": ["tl_5", "tl_10"], "choices": [14, 16]}, "toplam seçeneklerde yok")
	_bad("clock_money", {"mode": "money", "ask": "pay", "unit": "tl", "amount": 0, "wallet": ["tl_5"]}, "tutar 0")
	_bad("clock_money", {"mode": "money", "ask": "pay", "unit": "tl", "amount": 10, "wallet": []}, "boş cüzdan")
	_bad("clock_money", {"mode": "money", "ask": "pay", "unit": "tl", "amount": 10, "wallet": ["tl_5", "tl_5"]}, "yinelenen cüzdan")

func test_money_pay_unpayable_rejected() -> void:
	var errs: Array[String] = TemplateRegistry.validate("clock_money", {"mode": "money", "ask": "pay", "unit": "tl", "amount": 7, "wallet": ["tl_5", "tl_10"]})
	assert_eq(errs, [ContentValidator.msg("err.params.cm_unpayable")] as Array[String])

# --- fraction_pizza ---
func test_fraction_pizza_valid() -> void:
	_ok("fraction_pizza", {"ask": "split", "parts": 2})
	_ok("fraction_pizza", {"ask": "split", "parts": 8})
	_ok("fraction_pizza", {"ask": "select", "parts": 4, "take": 1})
	_ok("fraction_pizza", {"ask": "select", "parts": 12, "take": 12})

func test_fraction_pizza_invalid() -> void:
	_bad("fraction_pizza", {"ask": "eat", "parts": 4}, "bilinmeyen soru")
	_bad("fraction_pizza", {"ask": "split", "parts": 1}, "1 parça")
	_bad("fraction_pizza", {"ask": "split", "parts": 9}, "split 9 parça")
	_bad("fraction_pizza", {"ask": "select", "parts": 13, "take": 1}, "13 parça")
	_bad("fraction_pizza", {"ask": "select", "parts": 4, "take": 0}, "take 0")
	_bad("fraction_pizza", {"ask": "select", "parts": 4, "take": 5}, "take > parts")
	_bad("fraction_pizza", {"ask": "select", "parts": 4}, "take yok")
	_bad("fraction_pizza", {"ask": "select", "parts": 4.5, "take": 1}, "kesirli parts")
