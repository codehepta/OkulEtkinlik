extends GutTest
## 1. sınıf Türkçe içeriğinin (Faz 4b) programla uyumu: ünite = tema, harf sırası ve tema
## harfleri resmi dökümden, ses temelli yöntem (yalnızca öğrenilmiş harflerle okuma/yazma),
## eşleme tablosuyla tutarlılık.

const SOURCE_TXT: String = "res://docs/curriculum/sources/tymm-ilkokul-turkce.txt"
const THEMES_PATH: String = "res://docs/curriculum/themes.json"
const GAME_MAP_PATH: String = "res://docs/curriculum/game_map.json"
const STICKERS_PATH: String = "res://content/stickers.json"
const UNIT_DIR: String = "res://content/g1/turkce"
const UNIT_COUNT: int = 9
## Şekil 1'in (harf grupları) bulunduğu PDF sayfası.
const GROUPS_PAGE: int = 7
## Harf öğreten temalar: ünite -> temanın bu harfleri ve rakamları (resmi metinde tema
## tanıtımında yazar; harfler dökümden ayrıca doğrulanır).
const LETTER_UNITS: Dictionary = {
	"u02": {"digits": "1234"},
	"u03": {"digits": "5678 90"},
	"u04": {"digits": ""},
	"u05": {"digits": ""},
}
const LOWER: String = "abcçdefgğhıijklmnoöprsştuüvyz"
const UPPER: String = "ABCÇDEFGĞHIİJKLMNOÖPRSŞTUÜVYZ"

var _themes: Dictionary = {}
var _map: Dictionary = {}
var _pages: Dictionary = {}

func before_all() -> void:
	_themes = JSON.parse_string(FileAccess.get_file_as_string(THEMES_PATH))
	_map = JSON.parse_string(FileAccess.get_file_as_string(GAME_MAP_PATH))
	var page: int = 0
	var buf: PackedStringArray = PackedStringArray()
	for line: String in FileAccess.get_file_as_string(SOURCE_TXT).split("\n"):
		if line.begins_with("===== SAYFA "):
			_pages[page] = "\n".join(buf)
			buf = PackedStringArray()
			page = int(line.trim_prefix("===== SAYFA ").trim_suffix(" ====="))
			continue
		buf.append(line)
	_pages[page] = "\n".join(buf)

func _unit(n: int) -> Dictionary:
	var path: String = UNIT_DIR.path_join("u%02d.json" % n)
	if not FileAccess.file_exists(path):
		return {}
	return JSON.parse_string(FileAccess.get_file_as_string(path))

func _lower(ch: String) -> String:
	var i: int = UPPER.find(ch)
	return LOWER[i] if i >= 0 else ch

## Şekil 1: gruplar dökümde 5'ten 1'e sıralı, "- a, n, e, t, i, l" biçiminde küçük harf satırları.
func _program_letter_order() -> String:
	var re: RegEx = RegEx.new()
	re.compile("^- ([a-zçğıöşü](?:, [a-zçğıöşü])+)\\s*$")
	var groups: Array[String] = []
	for line: String in (_pages[GROUPS_PAGE] as String).split("\n"):
		var m: RegExMatch = re.search(line)
		if m != null:
			groups.push_front(m.get_string(1).replace(", ", ""))
	return "".join(groups)

## Temanın tanıtım sayfasındaki "a-A, n-N" çiftleri (tanıtım, ilk çıktı sayfasından bir önceki sayfadadır).
func _theme_letters(theme_key: String) -> String:
	var page: int = int(_themes[theme_key]["source"]["page"]) - 1
	var re: RegEx = RegEx.new()
	re.compile("([a-zçğıöşü])-([A-ZÇĞİÖŞÜ])")
	var out: String = ""
	for m: RegExMatch in re.search_all(_pages[page]):
		if UPPER[LOWER.find(m.get_string(1))] == m.get_string(2):
			out += m.get_string(1)
	return out

## Bir harf turunda (trace, tek küçük harf) öğretilen harf.
func _taught_letter(node: Dictionary) -> String:
	for r: Dictionary in node["rounds"]:
		if r["template"] == "trace":
			var c: String = str(r["params"]["chars"])
			if c.length() == 1 and LOWER.contains(c):
				return c
	return ""

func _node_texts(node: Dictionary) -> Array[String]:
	var res: Array[String] = []
	for r: Dictionary in node["rounds"]:
		var p: Dictionary = r["params"]
		match str(r["template"]):
			"syllable_build":
				res.append("".join(p["parts"]))
				for d: Variant in p.get("distractors", []):
					res.append(str(d))
			"drag_match":
				for pr: Dictionary in p["pairs"]:
					var left: Dictionary = pr["left"]
					if left["type"] == "text":
						res.append(Strings.t(str(left["value"])))
			"sequence":
				for t: Dictionary in p["items"]:
					res.append(Strings.t(str(t["value"])))
	return res

func test_one_unit_per_theme() -> void:
	for n: int in range(1, UNIT_COUNT + 1):
		var u: Dictionary = _unit(n)
		assert_false(u.is_empty(), "u%02d var" % n)
		if u.is_empty():
			continue
		var theme: Dictionary = _themes["g1.turkce.t%02d" % n]
		assert_eq(u["source"]["theme"], theme["official"], "u%02d temanın resmi adı" % n)
		assert_eq(int(u["source"]["page"]), int(theme["source"]["page"]), "u%02d sayfa" % n)
	assert_false(FileAccess.file_exists(UNIT_DIR.path_join("u%02d.json" % (UNIT_COUNT + 1))), "tema sayısından fazla ünite yok")

func test_node_outcomes_belong_to_theme_and_are_playable() -> void:
	for n: int in range(1, UNIT_COUNT + 1):
		var u: Dictionary = _unit(n)
		var allowed: Array = _themes["g1.turkce.t%02d" % n]["outcomes"]
		for node: Dictionary in u.get("nodes", []):
			for code: Variant in node["outcomes"]:
				assert_true(allowed.has(code), "%s: %s temada yok" % [node["id"], code])
				assert_ne(_map[code]["fit"], "none", "%s: %s oyunda oynanamaz (evde etkinlik)" % [node["id"], code])

func test_round_templates_match_game_map() -> void:
	for n: int in range(1, UNIT_COUNT + 1):
		for node: Dictionary in _unit(n).get("nodes", []):
			var templates: Array = []
			for code: Variant in node["outcomes"]:
				templates.append_array(_map[code]["templates"])
			for r: Dictionary in node["rounds"]:
				assert_true(templates.has(r["template"]), "%s: %s, düğümün çıktılarına eşlenmemiş" % [node["id"], r["template"]])

func test_letter_order_follows_program_groups() -> void:
	var order: String = _program_letter_order()
	assert_eq(order.length(), 29, "Şekil 1'de 29 harf")
	var taught: String = ""
	for n: int in range(1, UNIT_COUNT + 1):
		for node: Dictionary in _unit(n).get("nodes", []):
			taught += _taught_letter(node)
	assert_eq(taught, order, "harf durakları MEB ses grubu sırasında")

func test_each_unit_teaches_its_theme_letters() -> void:
	for uid: String in LETTER_UNITS:
		var n: int = int(uid.trim_prefix("u"))
		var expected: String = _theme_letters("g1.turkce.t%02d" % n)
		assert_gt(expected.length(), 0, uid + " temasının harfleri dökümde")
		var taught: String = ""
		for node: Dictionary in _unit(n).get("nodes", []):
			taught += _taught_letter(node)
		assert_eq(taught, expected, uid + " temanın harfleri")

func test_each_letter_node_traces_upper_case_too() -> void:
	for uid: String in LETTER_UNITS:
		for node: Dictionary in _unit(int(uid.trim_prefix("u"))).get("nodes", []):
			var ch: String = _taught_letter(node)
			if ch.is_empty():
				continue
			var upper: bool = false
			for r: Dictionary in node["rounds"]:
				if r["template"] == "trace" and str(r["params"]["chars"]) == UPPER[LOWER.find(ch)]:
					upper = true
			assert_true(upper, "%s büyük harf de yazılır" % node["id"])

func test_theme_digits() -> void:
	for uid: String in LETTER_UNITS:
		var digits: String = ""
		for node: Dictionary in _unit(int(uid.trim_prefix("u"))).get("nodes", []):
			for r: Dictionary in node["rounds"]:
				var c: String = str(r["params"].get("chars", "")) if r["template"] == "trace" else ""
				if c.length() == 1 and "0123456789".contains(c):
					digits += c
		assert_eq(digits, (LETTER_UNITS[uid]["digits"] as String).replace(" ", ""), uid + " rakamları")

## Ses temelli yöntem: harf ünitelerinde okunan ve yazılan her sözcük yalnızca o ana kadar
## öğrenilmiş harflerden oluşur.
func test_reading_uses_only_learned_letters() -> void:
	var learned: String = ""
	for uid: String in LETTER_UNITS:
		for node: Dictionary in _unit(int(uid.trim_prefix("u"))).get("nodes", []):
			learned += _taught_letter(node)
			for text: String in _node_texts(node):
				for ch: String in text:
					var c: String = _lower(ch)
					if LOWER.contains(c):
						assert_true(learned.contains(c), "%s: '%s' içinde öğrenilmemiş harf %s" % [node["id"], text, c])

func test_stickers_registered_and_unique() -> void:
	var registered: Array = (JSON.parse_string(FileAccess.get_file_as_string(STICKERS_PATH)) as Dictionary)["turkce"]
	var seen: Dictionary = {}
	for n: int in range(1, UNIT_COUNT + 1):
		for node: Dictionary in _unit(n).get("nodes", []):
			var st: String = node["sticker"]
			assert_true(registered.has(st), st + " stickers.json'da")
			assert_false(seen.has(st), st + " tek düğümde")
			seen[st] = true

func test_reading_rounds_are_silent() -> void:
	for n: int in range(1, UNIT_COUNT + 1):
		for node: Dictionary in _unit(n).get("nodes", []):
			if not (node["outcomes"] as Array).has("T.O.1.1") and not (node["outcomes"] as Array).has("T.O.1.2"):
				continue
			for r: Dictionary in node["rounds"]:
				if r["template"] in ["drag_match", "story"]:
					assert_eq(r["params"].get("read", "listen"), "silent", "%s okuma turu sessiz" % node["id"])
