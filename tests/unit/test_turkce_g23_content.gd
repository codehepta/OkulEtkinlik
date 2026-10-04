extends GutTest
## 2–3. sınıf Türkçe içerik kapısı (Faz 4c): tema eşlemesi, sessiz okuma, karo yazı boyu, hikâye
## sayfası uzunluğu ve çıkartma listesi. ContentValidator'ın denetlemediği içerik kurallarıdır.

const TV: GDScript = preload("res://scenes/games/token_view.gd")
## Karodaki yazı bundan küçük olmamalı (1920×1080 tasarım tuvalinde piksel).
const MIN_FONT: int = 34
## Resimli hikâye sayfasında metin alanı dardır; resimsiz sayfa daha uzun olabilir.
const PAGE_MAX_WITH_IMAGE: int = 125
const PAGE_MAX: int = 210
const GRADES: Array[int] = [2, 3]
const THEMES_PER_GRADE: int = 8

func _json(path: String) -> Dictionary:
	return JSON.parse_string(FileAccess.get_file_as_string(path)) as Dictionary

func _const(template: String, name: String) -> Variant:
	var script: Script = load(TemplateRegistry.script_path(template)) as Script
	return script.get_script_constant_map()[name]

func _units() -> Array[Dictionary]:
	var res: Array[Dictionary] = []
	for g: int in GRADES:
		var dir: String = "res://content/g%d/turkce" % g
		if not DirAccess.dir_exists_absolute(dir):
			continue
		var files: PackedStringArray = DirAccess.get_files_at(dir)
		files.sort()
		for f: String in files:
			if f.ends_with(".json"):
				var u: Dictionary = _json(dir.path_join(f))
				u["_path"] = dir.path_join(f)
				res.append(u)
	return res

func _theme_id(unit: Dictionary) -> String:
	var parts: PackedStringArray = str(unit["id"]).split(".")
	return "%s.turkce.t%s" % [parts[0], parts[2].substr(1)]

func test_every_theme_has_a_unit() -> void:
	var have: Dictionary = {}
	for u: Dictionary in _units():
		have[_theme_id(u)] = true
	for g: int in GRADES:
		for t: int in range(1, THEMES_PER_GRADE + 1):
			var id: String = "g%d.turkce.t%02d" % [g, t]
			assert_true(have.has(id), id + " için ünite yok")

func test_units_follow_theme_outcomes() -> void:
	var themes: Dictionary = _json("res://docs/curriculum/themes.json")
	var game_map: Dictionary = _json("res://docs/curriculum/game_map.json")
	for u: Dictionary in _units():
		var tid: String = _theme_id(u)
		assert_true(themes.has(tid), str(u["_path"]))
		if not themes.has(tid):
			continue
		assert_eq(str((u["source"] as Dictionary).get("theme_id", "")), tid, str(u["_path"]))
		var allowed: Array = (themes[tid] as Dictionary)["outcomes"]
		for n: Dictionary in u["nodes"]:
			for code: Variant in n["outcomes"]:
				assert_true(allowed.has(code), "%s: %s temada yok" % [n["id"], code])
				assert_ne(str((game_map[code] as Dictionary)["fit"]), "none", "%s: %s oynanamaz" % [n["id"], code])

func test_reading_nodes_use_silent_mode() -> void:
	for u: Dictionary in _units():
		for n: Dictionary in u["nodes"]:
			if not str((n["outcomes"] as Array)[0]).begins_with("T.O."):
				continue
			for r: Dictionary in n["rounds"]:
				if r["template"] in ["story", "drag_match"]:
					assert_eq(str((r["params"] as Dictionary).get("read", "listen")), "silent", str(n["id"]))

func test_story_pages_fit() -> void:
	for u: Dictionary in _units():
		for n: Dictionary in u["nodes"]:
			for r: Dictionary in n["rounds"]:
				if r["template"] != "story":
					continue
				for pg: Dictionary in (r["params"] as Dictionary)["pages"]:
					var limit: int = PAGE_MAX_WITH_IMAGE if pg.has("image") else PAGE_MAX
					var text: String = Strings.t(str(pg["text"]))
					assert_lte(text.length(), limit, "%s: %s" % [n["id"], text])

func test_text_cards_are_readable() -> void:
	for u: Dictionary in _units():
		for n: Dictionary in u["nodes"]:
			for r: Dictionary in n["rounds"]:
				for c: Array in _cards(r["template"], r["params"]):
					var text: String = Strings.t(str((c[0] as Dictionary)["value"]))
					var box: Vector2 = c[1]
					var fs: int = TV.fit_font_size(TV.layout_label(text, box), box)
					assert_gte(fs, MIN_FONT, "%s: '%s' karoya sığmıyor" % [n["id"], text])

## [token, kutu boyu] listesi: yalnızca metin token'ları.
func _cards(template: String, p: Dictionary) -> Array[Array]:
	var out: Array[Array] = []
	match template:
		"drag_match":
			var side: float = float((_const("drag_match", "VIEW_SIDE_BY_COUNT") as Dictionary)[(p["pairs"] as Array).size()])
			for pr: Dictionary in p["pairs"]:
				out.append([pr["left"], Vector2(side, side)])
				out.append([pr["right"], Vector2(side, side)])
		"sort_bins":
			var side: float = float((_const("sort_bins", "SIDE_BY_COUNT") as Dictionary)[(p["items"] as Array).size()])
			var label: float = float(_const("sort_bins", "LABEL_SIDE"))
			for b: Dictionary in p["bins"]:
				out.append([b["label"], Vector2(label, label)])
			for it: Dictionary in p["items"]:
				out.append([it["token"], Vector2(side, side)])
		"sequence":
			var side: float = float((_const("sequence", "SIDE_BY_COUNT") as Dictionary)[(p["items"] as Array).size()])
			for t: Dictionary in p["items"]:
				out.append([t, Vector2(side, side)])
		"scenario":
			var side: float = float(_const("scenario", "CARD_SIDE"))
			for c: Dictionary in p["choices"]:
				out.append([c["token"], Vector2(side, side)])
		"story":
			var box: Vector2 = _const("story", "TEXT_OPTION_SIZE")
			for q: Dictionary in p["questions"]:
				for o: Dictionary in q["options"]:
					out.append([o, box])
	var texts: Array[Array] = []
	for c: Array in out:
		if str((c[0] as Dictionary)["type"]) == "text":
			texts.append(c)
	return texts

func test_stickers_are_listed() -> void:
	var listed: Array = _json("res://content/stickers.json")["turkce"]
	for u: Dictionary in _units():
		for n: Dictionary in u["nodes"]:
			assert_true(listed.has(n["sticker"]), str(n["id"]))
