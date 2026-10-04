extends GutTest
## chart_build: kayıt ve parametre doğrulaması (TemplateRegistry üzerinden).

const FIXTURE_PATH: String = "res://tests/fixtures/faz3b/chart_build.json"
const CATS: Array = ["item.meyve.elma", "item.meyve.armut", "item.meyve.muz"]

func _p(over: Dictionary = {}) -> Dictionary:
	var p: Dictionary = {
		"kind": "tally",
		"categories": CATS.duplicate(),
		"counts": [3, 5, 2],
		"questions": [
			{"ask": "most", "voice": "vo.test.q1"},
			{"ask": "count", "category": 0, "choices": [2, 3, 4], "voice": "vo.test.q2"},
		],
	}
	for k: String in over:
		p[k] = over[k]
	return p

func _q(q: Dictionary) -> Dictionary:
	return _p({"questions": [q]})

func _ok(p: Dictionary) -> void:
	assert_eq(TemplateRegistry.validate("chart_build", p), [] as Array[String], "geçerli olmalı: " + str(p))

func _bad(p: Dictionary, why: String) -> void:
	assert_gt(TemplateRegistry.validate("chart_build", p).size(), 0, "geçersiz olmalı: " + why)

func test_chart_build_registered() -> void:
	assert_true(TemplateRegistry.has("chart_build"))
	assert_true(ResourceLoader.exists(TemplateRegistry.SCENES["chart_build"]))
	assert_true(ResourceLoader.exists(TemplateRegistry.script_path("chart_build")))

func test_chart_build_fixture_entries_valid() -> void:
	var data: Dictionary = JSON.parse_string(FileAccess.get_file_as_string(FIXTURE_PATH))
	var kinds: Dictionary = {}
	for name: String in data:
		var entry: Dictionary = data[name]
		assert_eq(str(entry["template"]), "chart_build")
		_ok(entry["params"] as Dictionary)
		kinds[str((entry["params"] as Dictionary)["kind"])] = true
	assert_eq(kinds.size(), 4, "her tür için bir örnek")

func test_chart_build_valid() -> void:
	_ok(_p())
	for kind: String in ["tally", "table", "object", "dot"]:
		_ok(_p({"kind": kind}))
	_ok(_p({"categories": ["item.a.b", "item.a.c"], "counts": [1, 2], "questions": [{"ask": "least", "voice": "vo.x"}]}))
	_ok(_p({"categories": ["item.a.b", "item.a.c", "item.a.d", "item.a.e"], "counts": [4, 4, 4, 3],
		"questions": [{"ask": "least", "voice": "vo.x"}]}))
	_ok(_q({"ask": "diff", "a": 1, "b": 2, "choices": [3, 2], "voice": "vo.x"}))
	_ok(_q({"ask": "total", "choices": [10, 9, 11, 12], "voice": "vo.x"}))
	_ok(_p({"counts": [8, 5, 2], "questions": [
		{"ask": "most", "voice": "vo.a"}, {"ask": "least", "voice": "vo.b"}, {"ask": "total", "choices": [15, 14], "voice": "vo.c"}]}))

func test_chart_build_invalid() -> void:
	_bad({}, "boş")
	_bad(_p({"kind": "pie"}), "bilinmeyen tür")
	_bad(_p({"categories": ["item.a.b"], "counts": [3]}), "tek kategori")
	_bad(_p({"categories": ["item.a.b", "item.a.c", "item.a.d", "item.a.e", "item.a.f"], "counts": [1, 1, 1, 1, 1]}), "5 kategori")
	_bad(_p({"categories": ["item.a.b", "item.a.b", "item.a.c"]}), "yinelenen kategori")
	_bad(_p({"categories": ["item.a.b", "", "item.a.c"]}), "boş kategori")
	_bad(_p({"counts": [3, 5]}), "counts uzunluğu farklı")
	_bad(_p({"counts": [3, 0, 2]}), "sıfır sayı")
	_bad(_p({"counts": [3, 9, 2]}), "8'den büyük")
	_bad(_p({"counts": [3, 2.5, 2]}), "kesirli sayı")
	_bad(_p({"categories": ["item.a.b", "item.a.c"], "counts": [1, 1], "questions": [{"ask": "total", "choices": [2, 3], "voice": "vo.x"}]}), "toplam < 3")
	_bad(_p({"counts": [8, 6, 2]}), "toplam > 15")
	_bad(_p({"questions": []}), "soru yok")
	_bad(_p({"questions": [{"ask": "most", "voice": "vo.a"}, {"ask": "most", "voice": "vo.a"},
		{"ask": "most", "voice": "vo.a"}, {"ask": "most", "voice": "vo.a"}]}), "4 soru")
	_bad(_q({"ask": "most"}), "voice yok")
	_bad(_q({"ask": "most", "voice": ""}), "boş voice")
	_bad(_q({"ask": "median", "voice": "vo.x"}), "bilinmeyen soru")
	_bad(_p({"counts": [5, 5, 2], "questions": [{"ask": "most", "voice": "vo.x"}]}), "en çok tek değil")
	_bad(_p({"counts": [2, 5, 2], "questions": [{"ask": "least", "voice": "vo.x"}]}), "en az tek değil")
	_bad(_q({"ask": "count", "category": 3, "choices": [2, 3], "voice": "vo.x"}), "kategori aralık dışı")
	_bad(_q({"ask": "count", "choices": [2, 3], "voice": "vo.x"}), "kategori yok")
	_bad(_q({"ask": "count", "category": 0, "choices": [2, 4], "voice": "vo.x"}), "choices cevabı içermiyor")
	_bad(_q({"ask": "count", "category": 0, "choices": [3], "voice": "vo.x"}), "tek seçenek")
	_bad(_q({"ask": "count", "category": 0, "choices": [3, 1, 2, 4, 5], "voice": "vo.x"}), "5 seçenek")
	_bad(_q({"ask": "count", "category": 0, "choices": [3, 3, 2], "voice": "vo.x"}), "yinelenen seçenek")
	_bad(_q({"ask": "count", "category": 0, "choices": [3, 2.5], "voice": "vo.x"}), "kesirli seçenek")
	_bad(_q({"ask": "diff", "a": 2, "b": 1, "choices": [3, 2], "voice": "vo.x"}), "counts[a] ≤ counts[b]")
	_bad(_p({"counts": [3, 3, 2], "questions": [{"ask": "diff", "a": 0, "b": 1, "choices": [0, 1], "voice": "vo.x"}]}), "eşit fark")
	_bad(_q({"ask": "diff", "a": 1, "b": 2, "choices": [2, 4], "voice": "vo.x"}), "fark seçeneklerde yok")
	_bad(_q({"ask": "diff", "a": 1, "b": 5, "choices": [3, 2], "voice": "vo.x"}), "b aralık dışı")
	_bad(_q({"ask": "total", "choices": [9, 11], "voice": "vo.x"}), "toplam seçeneklerde yok")
