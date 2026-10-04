extends RefCounted
## Müfredat matrisi üreticisi (geliştirici aracı, saf mantık).
## outcomes.json / themes.json / game_map.json -> docs/curriculum/matrix.md metni.
## Çıktı belirli bir outcomes.json için deterministiktir: sıralama açık anahtarlara dayanır;
## yalnızca "Önerilen yeni şablonlar" kodları outcomes.json'daki kayıt sırasını izler.
##   const CurriculumReport := preload("res://tools/curriculum/report.gd")
## `class_name` bilerek yok.

## Ders sırası ve görünen adları.
const SUBJECT_ORDER: PackedStringArray = ["matematik", "turkce", "hayat_bilgisi", "fen"]
const SUBJECT_TITLES: Dictionary = {
	"matematik": "Matematik",
	"turkce": "Türkçe",
	"hayat_bilgisi": "Hayat Bilgisi",
	"fen": "Fen Bilimleri",
}
const FIT_LABELS: Dictionary = {"full": "tam", "partial": "kısmi", "none": "yok"}
const FIT_ORDER: PackedStringArray = ["full", "partial", "none"]
const SPEC_PATH: String = "docs/superpowers/specs/2026-10-04-bilgi-adasi-design.md"

# --- Yardımcılar ---

static func _dict(v: Variant) -> Dictionary:
	return v if v is Dictionary else {}

## Tablo hücresi: satır sonları boşluk olur, `|` kaçışlanır.
static func _cell(s: String) -> String:
	var t: String = s.replace("\r\n", " ").replace("\n", " ").replace("\r", " ")
	return t.replace("|", "\\|").strip_edges()

static func _grades(outcomes: Dictionary) -> Array[int]:
	var seen: Dictionary = {}
	for code: String in outcomes.keys():
		seen[int(_dict(outcomes[code]).get("grade", 0))] = true
	var result: Array[int] = []
	for g: Variant in seen.keys():
		result.append(int(g))
	result.sort()
	return result

static func _fit_of(game_map: Dictionary, code: String) -> String:
	return str(_dict(game_map.get(code, {})).get("fit", ""))

## Bir sınıf ve ders için tema kimlikleri: önce `order`, eşitlikte kimlik sırası.
static func _theme_ids(themes: Dictionary, grade: int, subject: String) -> Array[String]:
	var ids: Array[String] = []
	for tid: String in themes.keys():
		var t: Dictionary = _dict(themes[tid])
		if int(t.get("grade", 0)) == grade and str(t.get("subject", "")) == subject:
			ids.append(tid)
	ids.sort_custom(func(a: String, b: String) -> bool:
		var oa: int = int(_dict(themes[a]).get("order", 0))
		var ob: int = int(_dict(themes[b]).get("order", 0))
		if oa != ob:
			return oa < ob
		return a < b)
	return ids

# --- Bölümler ---

static func _summary(outcomes: Dictionary, game_map: Dictionary, grades: Array[int]) -> Array[String]:
	var lines: Array[String] = [
		"## Özet",
		"",
		"| Sınıf | Ders | Çıktı | tam (full) | kısmi (partial) | yok (none) |",
		"|---|---|---|---|---|---|",
	]
	var total: Dictionary = {"all": 0, "full": 0, "partial": 0, "none": 0}
	for grade: int in grades:
		for subject: String in SUBJECT_ORDER:
			var counts: Dictionary = {"all": 0, "full": 0, "partial": 0, "none": 0}
			for code: String in outcomes.keys():
				var o: Dictionary = _dict(outcomes[code])
				if int(o.get("grade", 0)) != grade or str(o.get("subject", "")) != subject:
					continue
				counts["all"] += 1
				var fit: String = _fit_of(game_map, code)
				if counts.has(fit):
					counts[fit] += 1
			if counts["all"] == 0:
				continue
			lines.append("| %d | %s | %d | %d | %d | %d |" % [grade, SUBJECT_TITLES[subject], counts["all"], counts["full"], counts["partial"], counts["none"]])
			for k: String in total.keys():
				total[k] += counts[k]
	lines.append("| **Toplam** | | **%d** | **%d** | **%d** | **%d** |" % [total["all"], total["full"], total["partial"], total["none"]])
	lines.append("")
	lines.append("Uygunluk: **tam** = bütün süreç bileşenleri dokunmatik oyunla çalışılabilir; **kısmi** = bir kısmı (hangisi olduğu Not sütununda); **yok** = konuşma, kâğıda yazma, grup ya da beden etkinliği ya da gerçek dünyada gözlem gerektirir.")
	lines.append("")
	return lines

static func _theme_section(tid: String, themes: Dictionary, outcomes: Dictionary, game_map: Dictionary) -> Array[String]:
	var t: Dictionary = _dict(themes[tid])
	var lines: Array[String] = []
	lines.append("#### %s" % _cell(str(t.get("official", tid))))
	lines.append("")
	var meta: String = "`%s` · işleniş sırası %d · programda %d çıktı" % [tid, int(t.get("order", 0)), int(t.get("declared_count", 0))]
	var src: Dictionary = _dict(t.get("source", {}))
	if src.has("page"):
		meta += " · PDF s. %d" % int(src["page"])
	lines.append(meta)
	lines.append("")
	lines.append("| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |")
	lines.append("|---|---|---|---|---|---|")
	var raw_codes: Variant = t.get("outcomes", [])
	for code_v: Variant in (raw_codes as Array if raw_codes is Array else []):
		var code: String = str(code_v)
		if not outcomes.has(code):
			lines.append("| %s | (outcomes.json'da kayıt yok) | | | | |" % _cell(code))
			continue
		var o: Dictionary = _dict(outcomes[code])
		var gm: Dictionary = _dict(game_map.get(code, {}))
		var fit_label: String = str(FIT_LABELS.get(str(gm.get("fit", "")), "—"))
		var tpl: Array[String] = []
		var raw_tpl: Variant = gm.get("templates", [])
		for x: Variant in (raw_tpl as Array if raw_tpl is Array else []):
			tpl.append("`%s`" % str(x))
		lines.append("| %s | %s | %d | %s | %s | %s |" % [
			_cell(code),
			_cell(str(o.get("text", ""))),
			int(_dict(o.get("source", {})).get("page", 0)),
			fit_label,
			", ".join(tpl),
			_cell(str(gm.get("note", ""))),
		])
	lines.append("")
	return lines

static func _proposed(game_map: Dictionary, outcomes: Dictionary) -> Array[String]:
	var lines: Array[String] = ["## Önerilen yeni şablonlar", ""]
	var by_id: Dictionary = {}
	## Kodlar outcomes.json sırasıyla (sözlük ekleme sırası) toplanır.
	for code: String in outcomes.keys():
		var gm: Dictionary = _dict(game_map.get(code, {}))
		var raw_props: Variant = gm.get("proposed", [])
		for p: Variant in (raw_props as Array if raw_props is Array else []):
			var pid: String = str(p)
			if not by_id.has(pid):
				by_id[pid] = []
			(by_id[pid] as Array).append(code)
	if by_id.is_empty():
		lines.append("Yok.")
		lines.append("")
		return lines
	lines.append("Spec §3.7'deki 14 şablonda karşılığı olmayan mekanikler (karar için bkz. spec \"Açık sorular (Faz 2)\").")
	lines.append("")
	lines.append("| Öneri | Çıktı sayısı | Kodlar |")
	lines.append("|---|---|---|")
	var ids: Array = by_id.keys()
	ids.sort()
	for pid: String in ids:
		var codes: Array = by_id[pid]
		var parts: Array[String] = []
		for c: Variant in codes:
			parts.append(str(c))
		lines.append("| `%s` | %d | %s |" % [_cell(pid), codes.size(), _cell(", ".join(parts))])
	lines.append("")
	return lines

static func _owner_notes(outcomes: Dictionary, themes: Dictionary) -> Array[String]:
	var lines: Array[String] = ["## Sahibe notlar", ""]
	lines.append("Açık sorular ve alınan kararlar: `%s` içindeki \"Açık sorular (Faz 2)\" bölümü." % SPEC_PATH)
	lines.append("")
	var manual: Array[String] = []
	var codes: Array = outcomes.keys()
	codes.sort()
	for code: String in codes:
		var o: Dictionary = _dict(outcomes[code])
		if str(o.get("text_check", "")) == "manual" or o.has("manual_note"):
			manual.append("- `%s`: %s" % [code, _cell(str(o.get("manual_note", "")))])
	lines.append("### Elle doğrulanan çıktılar (`manual_note`)")
	lines.append("")
	if manual.is_empty():
		lines.append("Yok.")
	else:
		lines.append_array(manual)
	lines.append("")
	var counts: Array[String] = []
	var tids: Array = themes.keys()
	tids.sort()
	for tid: String in tids:
		var t: Dictionary = _dict(themes[tid])
		if t.has("declared_count_note"):
			counts.append("- `%s`: %s" % [tid, _cell(str(t["declared_count_note"]))])
	lines.append("### Tablo ve tema gövdesi sayısı uyuşmayan temalar (`declared_count_note`)")
	lines.append("")
	if counts.is_empty():
		lines.append("Yok.")
	else:
		lines.append_array(counts)
	lines.append("")
	return lines

# --- Giriş noktası ---

static func render(outcomes: Dictionary, themes: Dictionary, game_map: Dictionary) -> String:
	var lines: Array[String] = [
		"# Müfredat matrisi",
		"",
		"> Bu dosya üretilmiştir, elle düzenleme. Kaynak: `outcomes.json`, `themes.json`, `game_map.json`. Yeniden üretmek için: `godot --headless --path . -s res://tools/curriculum_report.gd`.",
		"",
	]
	var grades: Array[int] = _grades(outcomes)
	lines.append_array(_summary(outcomes, game_map, grades))
	for grade: int in grades:
		lines.append("## %d. sınıf" % grade)
		lines.append("")
		for subject: String in SUBJECT_ORDER:
			var tids: Array[String] = _theme_ids(themes, grade, subject)
			if tids.is_empty():
				continue
			lines.append("### %s" % SUBJECT_TITLES[subject])
			lines.append("")
			for tid: String in tids:
				lines.append_array(_theme_section(tid, themes, outcomes, game_map))
	lines.append_array(_proposed(game_map, outcomes))
	lines.append_array(_owner_notes(outcomes, themes))
	## Sondaki boş satırı at; dosya tek "\n" ile biter.
	while not lines.is_empty() and lines[lines.size() - 1] == "":
		lines.remove_at(lines.size() - 1)
	return "\n".join(lines) + "\n"
