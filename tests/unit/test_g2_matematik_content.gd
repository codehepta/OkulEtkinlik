extends GutTest
## 2. sınıf Matematik içeriği (Faz 3d): ünite = tema (uNN = tNN), her tema çıktısı bir durakta
## çalışılır, durak şablonları game_map eşlemesinden gelir, çıkartmalar albümde kayıtlıdır.

const GRADE: int = 2
const SUBJECT: String = "matematik"

func _json(path: String) -> Variant:
	return JSON.parse_string(FileAccess.get_file_as_string(path))

func _themes() -> Array[String]:
	var res: Array[String] = []
	var themes: Dictionary = _json("res://docs/curriculum/themes.json")
	for id: String in themes:
		if id.begins_with("g%d.%s." % [GRADE, SUBJECT]):
			res.append(id)
	res.sort()
	return res

func _unit_path(theme_id: String) -> String:
	return "res://content/g%d/%s/u%s.json" % [GRADE, SUBJECT, theme_id.get_slice(".", 2).trim_prefix("t")]

func test_every_theme_has_a_unit_in_program_order() -> void:
	var themes: Dictionary = _json("res://docs/curriculum/themes.json")
	var ids: Array[String] = _themes()
	assert_eq(ids.size(), 6)
	for id: String in ids:
		var path: String = _unit_path(id)
		assert_true(FileAccess.file_exists(path), path)
		if not FileAccess.file_exists(path):
			continue
		var unit: Dictionary = _json(path)
		assert_eq(str(unit["id"]), "g%d.%s.u%s" % [GRADE, SUBJECT, id.get_slice(".", 2).trim_prefix("t")])
		var src: Dictionary = unit["source"]
		assert_eq(str(src["theme"]), str((themes[id] as Dictionary)["official"]), path)
		assert_eq(int(src["page"]), int(((themes[id] as Dictionary)["source"] as Dictionary)["page"]), path)

func test_nodes_cover_theme_outcomes_with_mapped_templates() -> void:
	var themes: Dictionary = _json("res://docs/curriculum/themes.json")
	var game_map: Dictionary = _json("res://docs/curriculum/game_map.json")
	for id: String in _themes():
		if not FileAccess.file_exists(_unit_path(id)):
			continue
		var unit: Dictionary = _json(_unit_path(id))
		var wanted: Array = (themes[id] as Dictionary)["outcomes"]
		var covered: Dictionary = {}
		for node: Dictionary in unit["nodes"]:
			var allowed: Dictionary = {}
			for code: String in node["outcomes"]:
				assert_true(wanted.has(code), "%s: %s temada yok" % [node["id"], code])
				covered[code] = true
				for t: String in (game_map[code] as Dictionary)["templates"]:
					allowed[t] = true
			for r: Dictionary in node["rounds"]:
				assert_true(allowed.has(str(r["template"])), "%s: %s eşlemede yok" % [node["id"], r["template"]])
		for code: String in wanted:
			assert_true(covered.has(code), "%s: %s için durak yok" % [id, code])

func test_stickers_are_in_album_and_unique() -> void:
	var album: Array = (_json("res://content/stickers.json") as Dictionary)[SUBJECT]
	var seen: Dictionary = {}
	for id: String in _themes():
		if not FileAccess.file_exists(_unit_path(id)):
			continue
		for node: Dictionary in (_json(_unit_path(id)) as Dictionary)["nodes"]:
			var st: String = node["sticker"]
			assert_true(album.has(st), "%s albümde yok" % st)
			assert_false(seen.has(st), "%s iki durakta" % st)
			seen[st] = true

## Sayı token'larının sayı sesi değerle aynı olmalı (vo.sayi.47 → 47).
func test_number_voices_match_values() -> void:
	var voices: Dictionary = _json("res://content/voice_lines.tr.json")
	for n: int in range(0, 101):
		assert_true(voices.has("vo.sayi.%d" % n), "vo.sayi.%d" % n)
	for id: String in _themes():
		if FileAccess.file_exists(_unit_path(id)):
			_check_numbers(_json(_unit_path(id)))

func _check_numbers(v: Variant) -> void:
	if v is Array:
		for x: Variant in v:
			_check_numbers(x)
	elif v is Dictionary:
		var d: Dictionary = v
		if d.get("type") == "number" and str(d.get("voice", "")).begins_with("vo.sayi."):
			assert_eq(str(d["voice"]), "vo.sayi.%d" % int(d["value"]))
		for k: Variant in d:
			_check_numbers(d[k])
