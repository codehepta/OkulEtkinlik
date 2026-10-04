extends GutTest
## Faz 3e içerik kapısı: Sayı Ormanı 3. sınıf (Matematik 3) ünitelerinin müfredat kapsamı.
## Oynanabilir (`fit` full/partial) her MAT.3 çıktısı en az bir durakta çalışılır; durağın
## şablonları çıktının `game_map.json` eşlemesindeki şablonlardandır. Ünite numarası programın
## işleniş sırasını izler: uNN = themes.json'daki tNN.

const GRADE: int = 3
const SUBJECT: String = "matematik"

var _outcomes: Dictionary = {}
var _game_map: Dictionary = {}
var _themes: Dictionary = {}
var _stickers: Dictionary = {}
## "g3.matematik.u01" -> ünite sözlüğü
var _units: Dictionary = {}

func before_all() -> void:
	_outcomes = _load("res://docs/curriculum/outcomes.json")
	_game_map = _load("res://docs/curriculum/game_map.json")
	_themes = _load("res://docs/curriculum/themes.json")
	_stickers = _load("res://content/stickers.json")
	var dir: String = "res://content/g%d/%s" % [GRADE, SUBJECT]
	if DirAccess.dir_exists_absolute(dir):
		for f: String in DirAccess.get_files_at(dir):
			if f.begins_with("u") and f.ends_with(".json"):
				var u: Dictionary = _load(dir.path_join(f))
				_units[str(u.get("id", ""))] = u

func _load(path: String) -> Dictionary:
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
	return parsed if parsed is Dictionary else {}

func _nodes() -> Array[Dictionary]:
	var res: Array[Dictionary] = []
	for uid: String in _units:
		for n: Dictionary in (_units[uid] as Dictionary)["nodes"]:
			res.append(n)
	return res

func _theme_of(uid: String) -> String:
	var parts: PackedStringArray = uid.split(".")
	return "%s.%s.t%s" % [parts[0], parts[1], parts[2].substr(1)]

func test_every_theme_has_a_unit() -> void:
	for key: String in _themes:
		if key.begins_with("g%d.%s." % [GRADE, SUBJECT]):
			var uid: String = key.replace(".t", ".u")
			assert_true(_units.has(uid), "temanın ünitesi yok: " + key)

func test_every_playable_outcome_is_covered() -> void:
	var covered: Dictionary = {}
	for n: Dictionary in _nodes():
		for code: Variant in n["outcomes"]:
			covered[str(code)] = true
	var missing: PackedStringArray = PackedStringArray()
	for code: String in _outcomes:
		if not code.begins_with("MAT.%d." % GRADE):
			continue
		if str((_game_map.get(code, {}) as Dictionary).get("fit", "")) != "none" and not covered.has(code):
			missing.append(code)
	assert_eq(missing, PackedStringArray(), "oynanabilir ama durağı olmayan çıktılar")

func test_templates_follow_game_map() -> void:
	for n: Dictionary in _nodes():
		var allowed: Dictionary = {}
		for code: Variant in n["outcomes"]:
			for t: Variant in (_game_map.get(str(code), {}) as Dictionary).get("templates", []):
				allowed[str(t)] = true
		for r: Dictionary in n["rounds"]:
			assert_true(allowed.has(str(r["template"])), "%s: %s şablonu eşlemede yok" % [n["id"], r["template"]])

func test_unit_number_follows_theme_order() -> void:
	assert_eq(_units.size(), 6, "3. sınıf Matematikte 6 tema var")
	for uid: String in _units:
		var theme: String = _theme_of(uid)
		for n: Dictionary in (_units[uid] as Dictionary)["nodes"]:
			for code: Variant in n["outcomes"]:
				var themes: Array = (_outcomes.get(str(code), {}) as Dictionary).get("themes", [])
				assert_true(themes.has(theme), "%s: %s teması %s değil" % [n["id"], code, theme])

func test_unit_source_page_matches_theme() -> void:
	for uid: String in _units:
		var theme: Dictionary = _themes.get(_theme_of(uid), {})
		var src: Dictionary = (_units[uid] as Dictionary)["source"]
		assert_eq(int(src.get("page", 0)), int((theme.get("source", {}) as Dictionary).get("page", -1)), uid)
		assert_eq(str(src.get("file", "")), str((theme.get("source", {}) as Dictionary).get("file", "")), uid)
		assert_eq(str(src.get("theme", "")), str(theme.get("official", "")), uid)

func test_node_stickers_are_in_album_and_unique() -> void:
	var album: Array = _stickers.get(SUBJECT, [])
	var seen: Dictionary = {}
	for n: Dictionary in _nodes():
		var st: String = str(n["sticker"])
		assert_true(album.has(st), "%s çıkartması albümde yok: %s" % [n["id"], st])
		assert_false(seen.has(st), "çıkartma iki durakta: " + st)
		seen[st] = true

## Kart ve kutu üzerindeki kısa metinler 200 px'lik karoda okunur kalmalı (≥ 25 px yazı).
func test_card_texts_are_short() -> void:
	for n: Dictionary in _nodes():
		for r: Dictionary in n["rounds"]:
			if not ["drag_match", "sort_bins", "sequence"].has(str(r["template"])):
				continue
			for key: String in _text_tokens(r["params"]):
				assert_lte(Strings.t(key).length(), 12, "%s: uzun kart metni %s" % [n["id"], Strings.t(key)])

func _text_tokens(v: Variant) -> PackedStringArray:
	var res: PackedStringArray = PackedStringArray()
	if v is Array:
		for x: Variant in v:
			res.append_array(_text_tokens(x))
	elif v is Dictionary:
		var d: Dictionary = v
		if d.get("type") == "text" and d.get("value") is String:
			res.append(str(d["value"]))
		for k: Variant in d:
			res.append_array(_text_tokens(d[k]))
	return res
