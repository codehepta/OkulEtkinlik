extends GutTest
## Fen Bilimleri 3 içerik kapısı (Faz 6): sekiz tema ünitesi, bütün FB.3 çıktıları,
## Faz 2 eşlemesindeki şablonlar ve çıkartma kataloğu birbiriyle tutarlı olmalı.

const UNIT_DIR: String = "res://content/g3/fen"
const OUTCOMES_PATH: String = "res://docs/curriculum/outcomes.json"
const THEMES_PATH: String = "res://docs/curriculum/themes.json"
const GAME_MAP_PATH: String = "res://docs/curriculum/game_map.json"
const STICKERS_PATH: String = "res://content/stickers.json"
const THEME_COUNT: int = 8
const MAX_PAGE_CHARS_WITH_IMAGE: int = 140
const MAX_PAGE_CHARS: int = 260

func _json(path: String) -> Dictionary:
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
	return parsed if parsed is Dictionary else {}

func _units() -> Array[Dictionary]:
	var res: Array[Dictionary] = []
	for i: int in range(1, THEME_COUNT + 1):
		var u: Dictionary = _json("%s/u%02d.json" % [UNIT_DIR, i])
		if not u.is_empty():
			res.append(u)
	return res

func _nodes() -> Array[Dictionary]:
	var res: Array[Dictionary] = []
	for u: Dictionary in _units():
		for n: Variant in u.get("nodes", []):
			res.append(n as Dictionary)
	return res

## Ünite sırası programın işleniş sırasıdır: uNN = themes.json g3.fen.tNN.
func test_one_unit_per_theme_in_program_order() -> void:
	var themes: Dictionary = _json(THEMES_PATH)
	var units: Array[Dictionary] = _units()
	assert_eq(units.size(), THEME_COUNT, "her tema için bir ünite")
	for i: int in units.size():
		var u: Dictionary = units[i]
		assert_eq(str(u.get("id")), "g3.fen.u%02d" % (i + 1))
		var theme: Dictionary = themes.get("g3.fen.t%02d" % (i + 1), {})
		var allowed: Array = theme.get("outcomes", [])
		assert_eq(int(u["source"]["page"]), int(theme["source"]["page"]), str(u["id"]) + " kaynak sayfası")
		for n: Variant in u["nodes"]:
			for code: Variant in (n as Dictionary)["outcomes"]:
				assert_has(allowed, code, "%s temasında olmayan çıktı" % u["id"])

func test_every_fb3_outcome_has_a_node() -> void:
	var covered: Dictionary = {}
	for n: Dictionary in _nodes():
		for code: Variant in n["outcomes"]:
			covered[str(code)] = true
	var outcomes: Dictionary = _json(OUTCOMES_PATH)
	var expected: int = 0
	for code: String in outcomes:
		if code.begins_with("FB.3."):
			expected += 1
			assert_true(covered.has(code), code + " için durak yok")
	assert_eq(expected, 20)

## Durak 3–5 tur; zorluk durak içinde azalmaz; şablonlar Faz 2 eşlemesinden gelir.
func test_rounds_follow_game_map() -> void:
	var game_map: Dictionary = _json(GAME_MAP_PATH)
	for n: Dictionary in _nodes():
		var rounds: Array = n["rounds"]
		assert_between(rounds.size(), 3, 5, str(n["id"]) + " tur sayısı")
		var allowed: Array = []
		for code: Variant in n["outcomes"]:
			allowed.append_array((game_map[code] as Dictionary)["templates"])
		var last: int = 0
		for r: Variant in rounds:
			var rd: Dictionary = r
			assert_has(allowed, rd["template"], "%s: %s eşlemede yok" % [n["id"], rd["template"]])
			assert_true(int(rd["difficulty"]) >= last, str(n["id"]) + " zorluk azalmamalı")
			last = int(rd["difficulty"])

func test_stickers_listed_once_in_fen_album() -> void:
	var album: Array = _json(STICKERS_PATH).get("fen", [])
	var seen: Dictionary = {}
	for n: Dictionary in _nodes():
		var s: String = str(n["sticker"])
		assert_true(s.begins_with("st.fen."), s)
		assert_false(seen.has(s), s + " iki kez kullanılmış")
		seen[s] = true
		assert_has(album, s)
	assert_eq(album.size(), seen.size())

## Hikâye sayfası metni kutusuna sığmalı (64 px yazı): resimli sayfa dar sütundadır.
func test_story_pages_fit_text_box() -> void:
	var strings: Dictionary = _json("res://content/strings.tr.json")
	for n: Dictionary in _nodes():
		for r: Variant in n["rounds"]:
			var rd: Dictionary = r
			if rd["template"] != "story":
				continue
			for pg: Variant in (rd["params"] as Dictionary)["pages"]:
				var page: Dictionary = pg
				var limit: int = MAX_PAGE_CHARS_WITH_IMAGE if page.has("image") else MAX_PAGE_CHARS
				var text: String = str(strings.get(page["text"], ""))
				assert_between(text.length(), 1, limit, str(page["text"]))

func test_fen_units_load_without_errors() -> void:
	var db: Node = load("res://autoload/content_db.gd").new()
	db.debug_build = false
	db.load_all()
	var fen_errors: Array[String] = []
	for e: String in db.errors:
		if e.contains("g3.fen"):
			fen_errors.append(e)
	assert_eq(fen_errors, [] as Array[String])
	assert_eq(db.units(3, "fen").size(), THEME_COUNT)
	db.free()
