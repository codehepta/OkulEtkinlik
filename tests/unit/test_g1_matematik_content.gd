extends GutTest
## Faz 3c: 1. sınıf Matematik içeriği programın işleniş sırasını izler (uNN = themes.json tNN),
## her oynanabilir çıktıyı en az bir durakla karşılar ve yalnızca game_map.json'daki şablonları kullanır.

const UNIT_DIR: String = "res://content/g1/matematik"

var _themes: Dictionary = {}
var _game_map: Dictionary = {}
var _outcomes: Dictionary = {}

func before_all() -> void:
	_themes = _read("res://docs/curriculum/themes.json")
	_game_map = _read("res://docs/curriculum/game_map.json")
	_outcomes = _read("res://docs/curriculum/outcomes.json")

func _read(path: String) -> Dictionary:
	var v: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
	return v if v is Dictionary else {}

func _theme_ids() -> Array[String]:
	var ids: Array[String] = []
	for k: String in _themes.keys():
		if k.begins_with("g1.matematik.t"):
			ids.append(k)
	ids.sort()
	return ids

func _unit(tid: String) -> Dictionary:
	return _read(UNIT_DIR.path_join("u" + tid.get_slice(".t", 1) + ".json"))

func test_every_theme_has_unit_in_teaching_order() -> void:
	var ids: Array[String] = _theme_ids()
	assert_eq(ids.size(), 7, "1. sınıf Matematikte 7 tema")
	for tid: String in ids:
		var theme: Dictionary = _themes[tid]
		var unit: Dictionary = _unit(tid)
		assert_false(unit.is_empty(), "%s için ünite dosyası yok" % tid)
		if unit.is_empty():
			continue
		var src: Dictionary = unit.get("source", {})
		assert_eq(str(src.get("theme", "")), str(theme["official"]), "%s tema adı" % tid)
		assert_eq(int(src.get("page", 0)), int((theme["source"] as Dictionary)["page"]), "%s sayfa" % tid)
		for n: Dictionary in unit["nodes"]:
			for code: Variant in n["outcomes"]:
				assert_true((theme["outcomes"] as Array).has(code), "%s: %s bu temanın çıktısı değil" % [n["id"], code])

func test_every_playable_outcome_is_covered() -> void:
	var covered: Dictionary = {}
	for tid: String in _theme_ids():
		var unit: Dictionary = _unit(tid)
		for n: Dictionary in unit.get("nodes", []):
			for code: Variant in n["outcomes"]:
				covered[str(code)] = true
	for code: String in _outcomes.keys():
		if not code.begins_with("MAT.1."):
			continue
		if str((_game_map.get(code, {}) as Dictionary).get("fit", "none")) == "none":
			continue
		assert_true(covered.has(code), "%s için durak yok" % code)

func test_rounds_use_mapped_templates() -> void:
	for tid: String in _theme_ids():
		var unit: Dictionary = _unit(tid)
		for n: Dictionary in unit.get("nodes", []):
			var allowed: Dictionary = {}
			for code: Variant in n["outcomes"]:
				for t: Variant in (_game_map.get(str(code), {}) as Dictionary).get("templates", []):
					allowed[str(t)] = true
			for r: Dictionary in n["rounds"]:
				assert_true(allowed.has(str(r["template"])), "%s: %s eşlemede yok" % [n["id"], r["template"]])

func test_stickers_listed_and_unique() -> void:
	var listed: Array = (_read("res://content/stickers.json")["matematik"]) as Array
	var seen: Dictionary = {}
	for tid: String in _theme_ids():
		for n: Dictionary in _unit(tid).get("nodes", []):
			var st: String = str(n["sticker"])
			assert_true(listed.has(st), "%s stickers.json'da yok" % st)
			assert_false(seen.has(st), "%s iki durakta kullanılmış" % st)
			seen[st] = true
