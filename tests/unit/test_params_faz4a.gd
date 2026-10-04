extends GutTest
## Faz 4a Türkçe şablonlarının kaydı ve parametre doğrulaması (TemplateRegistry üzerinden);
## drag_match okuma kipi ve ContentValidator'ın params içindeki anahtar denetimi.

const FAZ4A: PackedStringArray = ["trace", "syllable_build", "story"]
const FIXTURE: String = "res://tests/fixtures/faz4a/params.json"

func _item(v: String) -> Dictionary:
	return {"type": "item", "value": v}

func _text(v: String, voice: String = "") -> Dictionary:
	var d: Dictionary = {"type": "text", "value": v}
	if voice != "":
		d["voice"] = voice
	return d

func _num(v: int) -> Dictionary:
	return {"type": "number", "value": v}

func _ok(id: String, p: Dictionary) -> void:
	assert_eq(TemplateRegistry.validate(id, p), [] as Array[String], id + " geçerli olmalı: " + str(p))

func _bad(id: String, p: Dictionary, why: String) -> void:
	assert_gt(TemplateRegistry.validate(id, p).size(), 0, id + " geçersiz olmalı: " + why)

func test_faz4a_templates_registered() -> void:
	for id: String in FAZ4A:
		assert_true(TemplateRegistry.has(id), id + " kayıtlı olmalı")
		if not TemplateRegistry.has(id):
			continue
		assert_true(ResourceLoader.exists(TemplateRegistry.SCENES[id]), id + " sahnesi var")
		assert_true(ResourceLoader.exists(TemplateRegistry.script_path(id)), id + " betiği var")

func test_fixture_params_are_valid() -> void:
	var data: Dictionary = JSON.parse_string(FileAccess.get_file_as_string(FIXTURE))
	for name: String in data:
		var entry: Dictionary = data[name]
		_ok(str(entry["template"]), entry["params"] as Dictionary)

# --- trace ---
func test_trace_valid() -> void:
	_ok("trace", {"chars": "a"})
	_ok("trace", {"chars": "Ğ"})
	_ok("trace", {"chars": "7"})
	_ok("trace", {"chars": "ışık"})
	_ok("trace", {"chars": "e", "item": "item.meyve.elma"})

func test_trace_invalid() -> void:
	_bad("trace", {}, "chars yok")
	_bad("trace", {"chars": ""}, "boş")
	_bad("trace", {"chars": "kalem"}, "5 karakter")
	_bad("trace", {"chars": "a b"}, "boşluk")
	_bad("trace", {"chars": "q"}, "Türk alfabesinde yok")
	_bad("trace", {"chars": "w"}, "Türk alfabesinde yok")
	_bad("trace", {"chars": 5}, "metin değil")
	_bad("trace", {"chars": "a", "item": ""}, "boş item")

# --- syllable_build ---
func test_syllable_build_valid() -> void:
	_ok("syllable_build", {"parts": ["el", "ma"]})
	_ok("syllable_build", {"parts": ["ba", "ba"], "distractors": ["da"]})
	_ok("syllable_build", {"parts": ["a", "t"], "distractors": ["e", "l", "m"]})
	_ok("syllable_build", {"parts": ["ka", "pı"], "item": "item.ev.kapi", "voice": "vo.x.y"})
	_ok("syllable_build", {"parts": ["Ay", "şe"]})

func test_syllable_build_invalid() -> void:
	_bad("syllable_build", {"parts": ["elma"]}, "tek parça")
	_bad("syllable_build", {"parts": ["a", "b", "c", "d", "e", "f"]}, "6 parça")
	_bad("syllable_build", {"parts": ["el", ""]}, "boş parça")
	_bad("syllable_build", {"parts": ["el", "ma1"]}, "rakam")
	_bad("syllable_build", {"parts": ["el", "ma "]}, "boşluk")
	_bad("syllable_build", {"parts": ["kelebek", "ler"]}, "4 harften uzun")
	_bad("syllable_build", {"parts": ["el", "ma"], "distractors": ["ma"]}, "çeldirici parçayla aynı")
	_bad("syllable_build", {"parts": ["el", "ma"], "distractors": ["al", "al"]}, "yinelenen çeldirici")
	_bad("syllable_build", {"parts": ["el", "ma"], "distractors": ["a", "b", "c", "d"]}, "4 çeldirici")
	_bad("syllable_build", {"parts": ["kele", "bekl", "erim", "izdi", "rler"], "distractors": ["abcd", "efgh", "ijkl"]}, "sığmıyor")
	_bad("syllable_build", {"parts": ["el", "ma"], "voice": ""}, "boş voice")

# --- story ---
func _story(extra: Dictionary = {}) -> Dictionary:
	var p: Dictionary = {
		"pages": [{"text": "s.p1", "voice": "vo.p1", "image": "item.a.b"}, {"text": "s.p2", "voice": "vo.p2"}],
		"questions": [{"text": "s.q1", "voice": "vo.q1", "answer": 1, "options": [_item("item.a.b"), _item("item.a.c")]}],
	}
	p.merge(extra, true)
	return p

func test_story_valid() -> void:
	_ok("story", _story())
	_ok("story", _story({"read": "silent"}))
	_ok("story", _story({"read": "listen"}))
	_ok("story", _story({"questions": [
		{"voice": "vo.q1", "answer": 0, "page": 0, "options": [_text("a"), _text("b"), _text("c"), _text("d")]},
		{"voice": "vo.q2", "answer": 2, "options": [_num(1), _num(2), _num(3)]},
		{"voice": "vo.q3", "answer": 0, "options": [_item("item.a.b"), _num(2)]}]}))

func test_story_invalid() -> void:
	_bad("story", _story({"read": "loud"}), "bilinmeyen kip")
	_bad("story", _story({"pages": []}), "sayfa yok")
	_bad("story", _story({"pages": [{"text": "a", "voice": "v"}, {"text": "a", "voice": "v"}, {"text": "a", "voice": "v"},
		{"text": "a", "voice": "v"}, {"text": "a", "voice": "v"}]}), "5 sayfa")
	_bad("story", _story({"pages": [{"text": "s.p1"}]}), "sayfa sesi yok")
	_bad("story", _story({"pages": [{"voice": "vo.p1"}]}), "sayfa metni yok")
	_bad("story", _story({"pages": [{"text": "s.p1", "voice": "vo.p1", "image": ""}]}), "boş görsel")
	_bad("story", _story({"questions": []}), "soru yok")
	var q: Dictionary = {"voice": "vo.q", "answer": 0, "options": [_num(1), _num(2)]}
	_bad("story", _story({"questions": [q, q, q, q]}), "4 soru")
	_bad("story", _story({"questions": [{"answer": 0, "options": [_num(1), _num(2)]}]}), "soru sesi yok")
	_bad("story", _story({"questions": [{"voice": "vo.q", "answer": 0, "options": [_num(1)]}]}), "tek seçenek")
	_bad("story", _story({"questions": [{"voice": "vo.q", "answer": 0, "options": [_num(1), _num(1)]}]}), "yinelenen seçenek")
	_bad("story", _story({"questions": [{"voice": "vo.q", "answer": 2, "options": [_num(1), _num(2)]}]}), "answer dışarıda")
	_bad("story", _story({"questions": [{"voice": "vo.q", "answer": 0.5, "options": [_num(1), _num(2)]}]}), "kesirli answer")
	_bad("story", _story({"questions": [{"voice": "vo.q", "answer": 0, "options": [_text("a"), _num(2)]}]}), "karışık metin seçenek")
	_bad("story", _story({"questions": [{"voice": "vo.q", "answer": 0, "page": 2, "options": [_num(1), _num(2)]}]}), "sayfa dışarıda")
	_bad("story", _story({"questions": [{"voice": "vo.q", "text": "", "answer": 0, "options": [_num(1), _num(2)]}]}), "boş soru metni")

# --- drag_match okuma kipi ---
func _pairs(left_voice: String = "") -> Array:
	return [{"left": _text("a", left_voice), "right": _item("item.a.b")}, {"left": _text("b"), "right": _item("item.a.c")}]

func test_drag_match_read_mode() -> void:
	_ok("drag_match", {"pairs": _pairs()})
	_ok("drag_match", {"pairs": _pairs(), "read": "listen"})
	_ok("drag_match", {"pairs": _pairs("vo.a"), "read": "silent"})
	_bad("drag_match", {"pairs": _pairs(), "read": "silent"}, "sessiz okumada hiç ses yok")
	_bad("drag_match", {"pairs": _pairs("vo.a"), "read": "quiet"}, "bilinmeyen kip")

# --- ContentValidator: params içindeki metin ve ses anahtarları ---
func _unit(params: Dictionary, template: String) -> Dictionary:
	return {
		"id": "g1.turkce.u01", "grade": 1, "subject": "turkce", "title_key": "t", "source": {},
		"nodes": [{"id": "g1.turkce.u01.n01", "outcomes": ["X.1"], "title_key": "t", "intro_voice": "vo.ok",
			"sticker": "st.a", "rounds": [{"template": template, "difficulty": 1, "voice": "vo.ok", "params": params}]}],
	}

func test_validator_checks_param_keys() -> void:
	var has_string: Callable = func(k: String) -> bool: return k.begins_with("s.")
	var has_voice: Callable = func(k: String) -> bool: return k.begins_with("vo.ok")
	var known: PackedStringArray = ["X.1"]
	var good: Dictionary = {"pages": [{"text": "s.p1", "voice": "vo.ok.p1"}],
		"questions": [{"text": "s.q", "voice": "vo.ok.q", "answer": 0, "options": [_text("s.a"), _text("s.b")]}]}
	var unit_ok: Dictionary = _unit(good, "story")
	unit_ok["title_key"] = "s.t"
	(unit_ok["nodes"][0] as Dictionary)["title_key"] = "s.t"
	assert_eq(ContentValidator.validate_unit(unit_ok, known, has_string, has_voice), [] as Array[String])
	var bad: Dictionary = good.duplicate(true)
	bad["pages"][0]["voice"] = "vo.yok"
	bad["questions"][0]["options"][1]["value"] = "eksik.metin"
	var unit_bad: Dictionary = _unit(bad, "story")
	unit_bad["title_key"] = "s.t"
	(unit_bad["nodes"][0] as Dictionary)["title_key"] = "s.t"
	var errs: Array[String] = ContentValidator.validate_unit(unit_bad, known, has_string, has_voice)
	assert_eq(errs.size(), 2, str(errs))
	assert_string_contains(str(errs), "vo.yok")
	assert_string_contains(str(errs), "eksik.metin")
