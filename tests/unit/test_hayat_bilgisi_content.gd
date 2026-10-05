extends GutTest
## Faz 5b içerik kapısı: Hayat Kasabası (Hayat Bilgisi 1–3) ünitelerinin müfredat kapsamı.
## Oynanabilir (`fit` full/partial) her HB çıktısı en az bir durakta çalışılır; `fit: none`
## çıktılar oyuna girmez (veli panelindeki evde etkinlik önerisine gider). Ünite numarası
## programın işleniş sırasını izler: uNN = themes.json'daki tNN.

const SUBJECT: String = "hayat_bilgisi"

var _outcomes: Dictionary = {}
var _game_map: Dictionary = {}
var _stickers: Dictionary = {}
## "g1.hayat_bilgisi.u01" -> ünite sözlüğü
var _units: Dictionary = {}

func before_all() -> void:
	_outcomes = _load("res://docs/curriculum/outcomes.json")
	_game_map = _load("res://docs/curriculum/game_map.json")
	_stickers = _load("res://content/stickers.json")
	for g: int in [1, 2, 3]:
		var dir: String = "res://content/g%d/%s" % [g, SUBJECT]
		if not DirAccess.dir_exists_absolute(dir):
			continue
		for f: String in DirAccess.get_files_at(dir):
			if f.begins_with("u") and f.ends_with(".json"):
				var u: Dictionary = _load(dir.path_join(f))
				_units[str(u.get("id", ""))] = u

func _load(path: String) -> Dictionary:
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
	return parsed if parsed is Dictionary else {}

func _hb_codes() -> PackedStringArray:
	var res: PackedStringArray = PackedStringArray()
	for code: String in _outcomes:
		if code.begins_with("HB."):
			res.append(code)
	return res

func _covered() -> Dictionary:
	var res: Dictionary = {}
	for uid: String in _units:
		for n: Dictionary in (_units[uid] as Dictionary)["nodes"]:
			for code: Variant in n["outcomes"]:
				res[str(code)] = true
	return res

func test_every_playable_outcome_is_covered() -> void:
	var covered: Dictionary = _covered()
	var missing: PackedStringArray = PackedStringArray()
	for code: String in _hb_codes():
		if str((_game_map.get(code, {}) as Dictionary).get("fit", "")) != "none" and not covered.has(code):
			missing.append(code)
	assert_eq(missing, PackedStringArray(), "oynanabilir ama durağı olmayan HB çıktıları")

func test_no_unplayable_outcome_in_game() -> void:
	var covered: Dictionary = _covered()
	for code: String in covered:
		assert_ne(str((_game_map.get(code, {}) as Dictionary).get("fit", "")), "none", code)

func test_unit_number_follows_theme_order() -> void:
	assert_gt(_units.size(), 0, "Hayat Bilgisi ünitesi bulunamadı")
	for uid: String in _units:
		var parts: PackedStringArray = uid.split(".")
		var theme: String = "%s.%s.t%s" % [parts[0], parts[1], parts[2].substr(1)]
		for n: Dictionary in (_units[uid] as Dictionary)["nodes"]:
			for code: Variant in n["outcomes"]:
				var themes: Array = (_outcomes.get(str(code), {}) as Dictionary).get("themes", [])
				assert_true(themes.has(theme), "%s: %s teması %s değil" % [n["id"], code, theme])

func test_unit_source_page_matches_theme() -> void:
	var themes: Dictionary = _load("res://docs/curriculum/themes.json")
	for uid: String in _units:
		var parts: PackedStringArray = uid.split(".")
		var theme: Dictionary = themes.get("%s.%s.t%s" % [parts[0], parts[1], parts[2].substr(1)], {})
		var src: Dictionary = (_units[uid] as Dictionary)["source"]
		assert_eq(int(src.get("page", 0)), int((theme.get("source", {}) as Dictionary).get("page", -1)), uid)
		assert_eq(str(src.get("file", "")), str((theme.get("source", {}) as Dictionary).get("file", "")), uid)

func test_node_stickers_are_in_album() -> void:
	var album: Array = _stickers.get(SUBJECT, [])
	var seen: Dictionary = {}
	for uid: String in _units:
		for n: Dictionary in (_units[uid] as Dictionary)["nodes"]:
			var st: String = str(n["sticker"])
			assert_true(album.has(st), "%s çıkartması albümde yok: %s" % [n["id"], st])
			assert_false(seen.has(st), "çıkartma iki durakta: " + st)
			seen[st] = true
