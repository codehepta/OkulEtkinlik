extends GutTest
## Faz 5a şablonlarının (sort_bins, scenario) kaydı ve parametre doğrulaması.

const FAZ5: PackedStringArray = ["sort_bins", "scenario"]

func _item(v: String) -> Dictionary:
	return {"type": "item", "value": v}

func _num(v: Variant) -> Dictionary:
	return {"type": "number", "value": v}

func _ok(id: String, p: Dictionary) -> void:
	assert_eq(TemplateRegistry.validate(id, p), [] as Array[String], id + " geçerli olmalı: " + str(p))

func _bad(id: String, p: Dictionary, why: String) -> void:
	assert_gt(TemplateRegistry.validate(id, p).size(), 0, id + " geçersiz olmalı: " + why)

func test_faz5_templates_registered() -> void:
	for id: String in FAZ5:
		assert_true(TemplateRegistry.has(id), id + " kayıtlı olmalı")
		if not TemplateRegistry.has(id):
			continue
		assert_true(ResourceLoader.exists(TemplateRegistry.SCENES[id]), id + " sahnesi var")
		assert_true(ResourceLoader.exists(TemplateRegistry.script_path(id)), id + " betiği var")

# --- sort_bins ---
func _bin(label: Dictionary, shape: String, color: String = "") -> Dictionary:
	var b: Dictionary = {"label": label, "shape": shape}
	if color != "":
		b["color"] = color
	return b

func _sort(bins: Array, assign: Array) -> Dictionary:
	var items: Array = []
	for i: int in assign.size():
		items.append({"token": _num(i + 1), "bin": assign[i]})
	return {"bins": bins, "items": items}

func _two_bins() -> Array:
	return [_bin(_item("item.simge.tek"), "circle", "red"), _bin(_item("item.simge.cift"), "square", "blue")]

func test_sort_bins_valid() -> void:
	_ok("sort_bins", _sort(_two_bins(), [0, 1, 0, 1]))
	_ok("sort_bins", _sort([_bin(_item("item.a.b"), "star"), _bin(_item("item.a.c"), "heart"), _bin({"type": "text", "value": "label.x"}, "triangle")],
		[0, 1, 2, 0, 1, 2, 0, 1, 2]))
	_ok("sort_bins", _sort(_two_bins(), [0, 0, 0, 0, 0, 0, 0, 1]))
	_ok("sort_bins", {"bins": _two_bins(), "items": [
		{"token": _item("item.hayvan.kedi"), "bin": 0}, {"token": _item("item.esya.top"), "bin": 1},
		{"token": _item("item.hayvan.kopek"), "bin": 0}, {"token": _item("item.esya.kalem"), "bin": 1}]})

func test_sort_bins_invalid() -> void:
	_bad("sort_bins", {}, "boş")
	_bad("sort_bins", _sort([_bin(_item("item.a.b"), "circle")], [0, 0, 0, 0]), "tek kutu")
	_bad("sort_bins", _sort(_two_bins() + [_bin(_item("item.a.d"), "star"), _bin(_item("item.a.e"), "heart")], [0, 1, 2, 3]), "4 kutu")
	_bad("sort_bins", _sort([_bin(_item("item.a.b"), "circle", "red"), _bin(_item("item.a.c"), "circle", "blue")], [0, 1, 0, 1]),
		"kutular yalnızca renkle ayrılıyor")
	_bad("sort_bins", _sort([_bin(_item("item.a.b"), "blob"), _bin(_item("item.a.c"), "square")], [0, 1, 0, 1]), "bilinmeyen şekil")
	_bad("sort_bins", _sort([_bin(_item("item.a.b"), "circle", "pink"), _bin(_item("item.a.c"), "square")], [0, 1, 0, 1]), "bilinmeyen renk")
	_bad("sort_bins", _sort([_bin({"type": "x"}, "circle"), _bin(_item("item.a.c"), "square")], [0, 1, 0, 1]), "bozuk etiket")
	_bad("sort_bins", _sort(_two_bins(), [0, 1, 0]), "3 öğe")
	_bad("sort_bins", _sort(_two_bins(), [0, 1, 0, 1, 0, 1, 0, 1, 0, 1]), "10 öğe")
	_bad("sort_bins", _sort(_two_bins(), [0, 0, 0, 0]), "boş kutu")
	_bad("sort_bins", _sort(_two_bins(), [0, 1, 2, 1]), "olmayan kutu")
	_bad("sort_bins", _sort(_two_bins(), [0, 1, 0.5, 1]), "kesirli kutu")
	_bad("sort_bins", {"bins": _two_bins(), "items": [
		{"token": _num(1), "bin": 0}, {"token": _num(1), "bin": 1}, {"token": _num(2), "bin": 0}, {"token": _num(3), "bin": 1}]}, "yinelenen öğe")
	_bad("sort_bins", {"bins": _two_bins(), "items": [
		{"token": {"type": "number", "value": "a"}, "bin": 0}, {"token": _num(2), "bin": 1}, {"token": _num(3), "bin": 0}, {"token": _num(4), "bin": 1}]}, "bozuk token")

# --- scenario ---
func _choice(key: String, correct: bool = false) -> Dictionary:
	return {"token": _item(key), "correct": correct}

func test_scenario_valid() -> void:
	_ok("scenario", {"scene": "item.sahne.yaya_gecidi", "choices": [_choice("item.davranis.bekle", true), _choice("item.davranis.kos")]})
	_ok("scenario", {"scene": "item.sahne.yaya_gecidi", "hint": "vo.test.ipucu", "choices": [
		_choice("item.davranis.bekle", true),
		{"token": _item("item.davranis.kos"), "correct": false, "result": "item.sahne.korna", "result_voice": "vo.test.sonuc"},
		_choice("item.davranis.oyna")]})

func test_scenario_invalid() -> void:
	var two: Array = [_choice("item.a.b", true), _choice("item.a.c")]
	_bad("scenario", {"choices": two}, "scene yok")
	_bad("scenario", {"scene": "", "choices": two}, "boş scene")
	_bad("scenario", {"scene": "item.s.x", "choices": [_choice("item.a.b", true)]}, "tek seçenek")
	_bad("scenario", {"scene": "item.s.x", "choices": two + [_choice("item.a.d"), _choice("item.a.e")]}, "4 seçenek")
	_bad("scenario", {"scene": "item.s.x", "choices": [_choice("item.a.b"), _choice("item.a.c")]}, "doğru seçenek yok")
	_bad("scenario", {"scene": "item.s.x", "choices": [_choice("item.a.b", true), _choice("item.a.c", true)]}, "iki doğru")
	_bad("scenario", {"scene": "item.s.x", "choices": [_choice("item.a.b", true), _choice("item.a.b")]}, "yinelenen")
	_bad("scenario", {"scene": "item.s.x", "choices": [{"token": {"type": "q"}, "correct": true}, _choice("item.a.c")]}, "bozuk token")
	_bad("scenario", {"scene": "item.s.x", "choices": [{"token": _item("item.a.b"), "correct": "evet"}, _choice("item.a.c")]}, "correct bool değil")
	_bad("scenario", {"scene": "item.s.x", "choices": [_choice("item.a.b", true), {"token": _item("item.a.c"), "correct": false, "result": ""}]}, "boş result")
	_bad("scenario", {"scene": "item.s.x", "choices": [_choice("item.a.b", true), {"token": _item("item.a.c"), "correct": false, "result_voice": 3}]}, "bozuk result_voice")
	_bad("scenario", {"scene": "item.s.x", "hint": "", "choices": two}, "boş hint")
