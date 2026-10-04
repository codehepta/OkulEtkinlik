extends RefCounted
## Müfredat veri denetleyicisi (geliştirici aracı, saf mantık).
## outcomes.json / themes.json / game_map.json kayıtlarını resmi PDF dökümüne ve
## birbirine karşı doğrular. Kullanım:
##   const CurriculumCheck := preload("res://tools/curriculum/curriculum_check.gd")
## `class_name` bilerek yok. Hata iletileri Türkçedir ve kod/tema kimliğini içerir.

## Ders -> resmi kaynak bilgisi.
const SUBJECT_SOURCES: Dictionary = {
	"matematik": {
		"file": "docs/curriculum/sources/tymm-ilkokul-matematik.pdf",
		"doc": "İlkokul Matematik Dersi Öğretim Programı",
		"url": "https://tymm.meb.gov.tr/assets/pdf/ilkokul-matematik-dersi_20260902_111356_122.pdf",
	},
	"turkce": {
		"file": "docs/curriculum/sources/tymm-ilkokul-turkce.pdf",
		"doc": "İlkokul Türkçe Dersi Öğretim Programı",
		"url": "https://tymm.meb.gov.tr/assets/pdf/ilkokul-turkce-dersi_20260902_111433_940.pdf",
	},
	"hayat_bilgisi": {
		"file": "docs/curriculum/sources/tymm-hayat-bilgisi.pdf",
		"doc": "Hayat Bilgisi Dersi Öğretim Programı",
		"url": "https://tymm.meb.gov.tr/assets/pdf/hayat-bilgisi-dersi_20260902_111246_099.pdf",
	},
	"fen": {
		"file": "docs/curriculum/sources/tymm-fen-bilimleri.pdf",
		"doc": "Fen Bilimleri Dersi Öğretim Programı",
		"url": "https://tymm.meb.gov.tr/assets/pdf/fen-bilimleri-dersi_20260902_111309_119.pdf",
	},
}

## Spec §3.7'deki 14 şablon kimliği.
const SPEC_TEMPLATES: PackedStringArray = [
	"drag_match", "count_choose", "sequence", "sort_bins", "trace", "syllable_build",
	"listen_find", "balloon_pop", "pattern", "balance", "clock_money", "story",
	"scenario", "fraction_pizza",
]

const FITS: PackedStringArray = ["full", "partial", "none"]

## Ders -> kod deseni (ilk yakalama grubu sınıf). Kapsam: 1-3 (fen yalnızca 3).
const CODE_PATTERNS: Dictionary = {
	"matematik": "^MAT\\.([1-3])\\.[1-4]\\.\\d+$",
	"turkce": "^T\\.[DKOY]\\.([1-3])\\.\\d+$",
	"hayat_bilgisi": "^HB\\.([1-3])\\.\\d+\\.\\d+$",
	"fen": "^FB\\.(3)\\.\\d+\\.\\d+$",
}

const THEME_ID_RE: String = "^g([1-3])\\.(matematik|turkce|hayat_bilgisi|fen)\\.t(\\d{2})$"
const PAGE_MARKER_RE: String = "(?m)^===== SAYFA (\\d+) =====[ \\t\\r]*$"
const PROPOSED_RE: String = "^[a-z][a-z0-9_]*$"
## Normalize edilmiş metnin başında bir adım işareti (`a)`, `ç)` ...).
const STEP_MARKER_RE: String = "^[a-zçğıöşü]\\)"

# --- Yardımcılar ---

static func _regex(pattern: String) -> RegEx:
	var re: RegEx = RegEx.new()
	re.compile(pattern)
	return re

## JSON sayıları float gelir; tam sayı değerli float kabul edilir.
static func _is_int_like(v: Variant) -> bool:
	if v is int:
		return true
	if v is float:
		return is_equal_approx(v, roundf(v))
	return false

static func _non_empty_string(v: Variant) -> bool:
	return v is String and not (v as String).strip_edges().is_empty()

## Unicode boşluk ayırıcıları (U+2000-U+200B, U+202F, U+3000): dökümde adım harfinden sonra
## U+2002 (EN SPACE) gibi karakterler çıkabiliyor.
const UNICODE_SPACES: PackedStringArray = [
	"\u2000", "\u2001", "\u2002", "\u2003", "\u2004", "\u2005", "\u2006", "\u2007",
	"\u2008", "\u2009", "\u200A", "\u200B", "\u202F", "\u3000",
]

## Boşluk karakterlerini (boşluk, sekme, satır sonu, U+00A0, Unicode boşluk ayırıcıları), `-` ve
## yumuşak tireyi (U+00AD) siler. Büyük/küçük harf ve tırnaklar aynen kalır.
static func normalize(s: String) -> String:
	var r: String = s
	for ch: String in [" ", "\t", "\n", "\r", "\u00A0", "-", "\u00AD"]:
		r = r.replace(ch, "")
	for ch: String in UNICODE_SPACES:
		r = r.replace(ch, "")
	return r

## Sayfa başındaki çalışan başlık satırı mı: boş, yalnızca rakam ya da `PROGRAMI` içeren satır.
static func is_page_header_line(line: String) -> bool:
	var t: String = line.strip_edges()
	return t.is_empty() or t.is_valid_int() or t.contains("PROGRAMI")

## Sayfa metninin başındaki çalışan başlık satırlarını (bkz. is_page_header_line) atar.
static func strip_page_header(page_text: String) -> String:
	var lines: PackedStringArray = page_text.split("\n")
	var i: int = 0
	while i < lines.size() and is_page_header_line(lines[i]):
		i += 1
	return "\n".join(lines.slice(i))

## `===== SAYFA N =====` işaretlerine göre döküm metnini ayırır: int sayfa -> metin.
static func split_pages(txt: String) -> Dictionary:
	var pages: Dictionary = {}
	var matches: Array[RegExMatch] = _regex(PAGE_MARKER_RE).search_all(txt)
	for i: int in matches.size():
		var start: int = matches[i].get_end()
		var stop: int = txt.length() if i == matches.size() - 1 else matches[i + 1].get_start()
		var body: String = txt.substr(start, stop - start)
		if body.begins_with("\r\n"):
			body = body.substr(2)
		elif body.begins_with("\n"):
			body = body.substr(1)
		pages[int(matches[i].get_string(1))] = body
	return pages

## PDF yolunun (proje köküne göre) `.txt` kardeşini okuyup sayfalara ayırır. Yoksa {}.
static func load_pages(pdf_path: String) -> Dictionary:
	var path: String = pdf_path
	if not path.begins_with("res://"):
		path = "res://" + path
	var txt_path: String = path.get_basename() + ".txt"
	if not FileAccess.file_exists(txt_path):
		return {}
	return split_pages(FileAccess.get_file_as_string(txt_path))

## Kodun ders desenine uyuyorsa sınıfı, uymuyorsa 0.
static func code_grade(code: String, subject: String) -> int:
	if not CODE_PATTERNS.has(subject):
		return 0
	var m: RegExMatch = _regex(CODE_PATTERNS[subject]).search(code)
	if m == null:
		return 0
	return int(m.get_string(1))

static func _sorted_keys(d: Dictionary) -> Array:
	var keys: Array = d.keys()
	keys.sort()
	return keys

# --- check_outcomes ---

## pages_by_file: pdf yolu -> split_pages sonucu.
static func check_outcomes(outcomes: Dictionary, themes: Dictionary, pages_by_file: Dictionary) -> Array[String]:
	var errs: Array[String] = []
	for code: String in _sorted_keys(outcomes):
		var o: Variant = outcomes[code]
		if not (o is Dictionary):
			errs.append("%s: kayıt bir sözlük değil" % code)
			continue
		_check_outcome(code, o as Dictionary, themes, pages_by_file, errs)
	return errs

static func _check_outcome(code: String, o: Dictionary, themes: Dictionary, pages_by_file: Dictionary, errs: Array[String]) -> void:
	var subject: String = str(o.get("subject", ""))
	if not SUBJECT_SOURCES.has(subject):
		errs.append("%s: bilinmeyen ders '%s'" % [code, subject])
		return
	var src_expected: Dictionary = SUBJECT_SOURCES[subject]

	var cg: int = code_grade(code, subject)
	if cg == 0:
		errs.append("%s: kod '%s' dersi için kapsam dışı ya da desene uymuyor" % [code, subject])
	elif not _is_int_like(o.get("grade")) or int(o["grade"]) != cg:
		errs.append("%s: grade alanı (%s) kodun sınıfıyla (%d) uyuşmuyor" % [code, str(o.get("grade")), cg])

	var printed: String = str(o.get("printed_code", ""))
	if printed != code + ".":
		errs.append("%s: printed_code '%s' olmalıydı '%s.'" % [code, printed, code])

	var manual: bool = str(o.get("text_check", "")) == "manual"
	if not _non_empty_string(o.get("text")):
		errs.append("%s: text boş" % code)
	if manual and not _non_empty_string(o.get("manual_note")):
		errs.append("%s: text_check manual ise manual_note boş olamaz" % code)

	# Kaynak alanları.
	var src: Variant = o.get("source")
	if not (src is Dictionary):
		errs.append("%s: source eksik" % code)
		return
	var source: Dictionary = src
	for key: String in ["file", "doc", "url"]:
		if str(source.get(key, "")) != src_expected[key]:
			errs.append("%s: source.%s '%s' dersin değeriyle ('%s') aynı değil" % [code, key, str(source.get(key, "")), src_expected[key]])

	_check_outcome_text(code, o, source, src_expected["file"], printed, manual, pages_by_file, errs)

	# Tema başvuruları.
	var th: Variant = o.get("themes")
	if not (th is Array) or (th as Array).is_empty():
		errs.append("%s: themes boş olmayan bir dizi olmalı" % code)
	else:
		for tid: Variant in th:
			if not themes.has(tid):
				errs.append("%s: bilinmeyen tema '%s'" % [code, str(tid)])

static func _check_outcome_text(code: String, o: Dictionary, source: Dictionary, file: String, printed: String, manual: bool, pages_by_file: Dictionary, errs: Array[String]) -> void:
	if not _is_int_like(source.get("page")):
		errs.append("%s: source.page tamsayı değil" % code)
		return
	var page: int = int(source["page"])
	if not pages_by_file.has(file):
		errs.append("%s: %s için döküm sayfaları yüklenmemiş" % [code, file])
		return
	var pages: Dictionary = pages_by_file[file]
	if not pages.has(page):
		errs.append("%s: s.%d dökümde yok" % [code, page])
		return
	var page_norm: String = normalize(str(pages[page]))
	var code_norm: String = normalize(printed)
	if code_norm.is_empty() or not page_norm.contains(code_norm):
		errs.append("%s: kod s.%d'de bulunamadı" % [code, page])
		return
	# printed_code zaten hatalıysa (üstte bildirildi) bağlı metin denetimi anlamsız; çifte hata verme.
	if manual or printed != code + ".":
		return
	var tail_next: String = ""
	if pages.has(page + 1):
		tail_next = normalize(strip_page_header(str(pages[page + 1])))
	var span_label: String = "s.%d-%d" % [page, page + 1]

	# Beklenen ardışık metin: text + tüm adımlar (sırayla). Boş normalize sonucu reddedilir.
	var text_norm: String = normalize(str(o.get("text", "")))
	if text_norm.is_empty():
		errs.append("%s: metin normalize sonrası boş" % code)
		return
	var steps_norm: Array[String] = []
	var steps: Variant = o.get("steps", [])
	if steps is Array:
		for step: Variant in steps:
			var sn: String = normalize(step) if step is String else ""
			if sn.is_empty():
				errs.append("%s: süreç bileşeni '%s' boş ya da geçersiz" % [code, str(step)])
				return
			steps_norm.append(sn)

	# Kod sayfada birden çok kez geçebilir; herhangi bir geçiş kuralı sağlarsa yeter.
	var best: int = -1
	var best_msg: String = ""
	var from: int = 0
	while true:
		var idx: int = page_norm.find(code_norm, from)
		if idx < 0:
			break
		from = idx + 1
		var tail: String = page_norm.substr(idx + code_norm.length()) + tail_next
		var res: Dictionary = _match_tail(tail, text_norm, steps_norm, o.get("steps", []) as Array)
		if res["ok"]:
			return
		if int(res["progress"]) > best:
			best = int(res["progress"])
			best_msg = str(res["msg"])
	errs.append("%s: %s (%s)" % [code, best_msg, span_label])

## Kodun ardındaki `tail` metninin text + adımlarla BAŞLAYIP BAŞLAMADIĞINI denetler ve
## adımlar bittikten sonra yeni bir adım işaretinin (`a)`) gelmediğini (eksik adım) doğrular.
## Dönüş: {ok, progress, msg}; progress: 0 metin, 1+i i. adım, 1000 fazladan adım.
static func _match_tail(tail: String, text_norm: String, steps_norm: Array[String], raw_steps: Array) -> Dictionary:
	if not tail.begins_with(text_norm):
		return {"ok": false, "progress": 0, "msg": "metin kodun hemen ardından bulunamadı"}
	var pos: int = text_norm.length()
	for i: int in steps_norm.size():
		if not tail.substr(pos).begins_with(steps_norm[i]):
			return {"ok": false, "progress": 1 + i, "msg": "süreç bileşeni '%s' sırayla bulunamadı" % str(raw_steps[i])}
		pos += steps_norm[i].length()
	if _regex(STEP_MARKER_RE).search(tail.substr(pos)) != null:
		return {"ok": false, "progress": 1000, "msg": "sondan sonra yeni bir adım işareti var (eksik adım)"}
	return {"ok": true, "progress": 1000, "msg": ""}

# --- check_themes ---

static func check_themes(themes: Dictionary, outcomes: Dictionary) -> Array[String]:
	var errs: Array[String] = []
	var orders: Dictionary = {}  # "g1.matematik" -> Array[int]
	var id_re: RegEx = _regex(THEME_ID_RE)
	for tid: String in _sorted_keys(themes):
		var t: Variant = themes[tid]
		if not (t is Dictionary):
			errs.append("%s: kayıt bir sözlük değil" % tid)
			continue
		var m: RegExMatch = id_re.search(tid)
		if m == null:
			errs.append("%s: tema kimliği biçime uymuyor" % tid)
			continue
		_check_theme(tid, t as Dictionary, m, outcomes, errs)
		var gs: String = "g%s.%s" % [m.get_string(1), m.get_string(2)]
		if not orders.has(gs):
			orders[gs] = []
		(orders[gs] as Array).append(int(m.get_string(3)))
	# Sıra 1..N kesintisiz.
	for gs: String in _sorted_keys(orders):
		var list: Array = orders[gs]
		list.sort()
		for i: int in list.size():
			if list[i] != i + 1:
				errs.append("%s: tema sırası 1..%d kesintisiz değil (bulunan: %s)" % [gs, list.size(), str(list)])
				break
	# Ters yön: çıktının themes dizisindeki tema, temanın listesinde olmalı.
	for code: String in _sorted_keys(outcomes):
		var o: Variant = outcomes[code]
		if not (o is Dictionary):
			continue
		var th: Variant = (o as Dictionary).get("themes")
		if not (th is Array):
			continue
		for tid: Variant in th:
			if themes.has(tid) and themes[tid] is Dictionary:
				var listed: Variant = (themes[tid] as Dictionary).get("outcomes")
				if not (listed is Array) or not (listed as Array).has(code):
					errs.append("%s: çıktı '%s' temasını belirtiyor ama tema listesinde yok" % [code, str(tid)])
	return errs

static func _check_theme(tid: String, t: Dictionary, m: RegExMatch, outcomes: Dictionary, errs: Array[String]) -> void:
	var grade: int = int(m.get_string(1))
	var subject: String = m.get_string(2)
	var order: int = int(m.get_string(3))
	if not _is_int_like(t.get("grade")) or int(t["grade"]) != grade:
		errs.append("%s: grade alanı kimlikle (%d) uyuşmuyor" % [tid, grade])
	if str(t.get("subject", "")) != subject:
		errs.append("%s: subject alanı kimlikle ('%s') uyuşmuyor" % [tid, subject])
	if not _is_int_like(t.get("order")) or int(t["order"]) != order:
		errs.append("%s: order alanı kimlikle (%d) uyuşmuyor" % [tid, order])
	if not _non_empty_string(t.get("official")):
		errs.append("%s: official boş" % tid)

	var listed: Variant = t.get("outcomes")
	if not (listed is Array) or (listed as Array).is_empty():
		errs.append("%s: outcomes boş olmayan bir dizi olmalı" % tid)
		return
	for code: Variant in listed:
		var c: String = str(code)
		if not outcomes.has(c) or not (outcomes[c] is Dictionary):
			errs.append("%s: çıktı '%s' outcomes.json'da yok" % [tid, c])
			continue
		var o: Dictionary = outcomes[c]
		if str(o.get("subject", "")) != subject or not _is_int_like(o.get("grade")) or int(o["grade"]) != grade:
			errs.append("%s: çıktı '%s' aynı sınıf/derse ait değil" % [tid, c])
		var back: Variant = o.get("themes")
		if not (back is Array) or not (back as Array).has(tid):
			errs.append("%s: tema '%s' listesinde ama çıktının themes dizisinde yok" % [c, tid])

	var size: int = (listed as Array).size()
	var declared_ok: bool = _is_int_like(t.get("declared_count")) and int(t["declared_count"]) == size
	if not declared_ok and not _non_empty_string(t.get("declared_count_note")):
		errs.append("%s: declared_count (%s) çıktı sayısıyla (%d) uyuşmuyor ve declared_count_note yok" % [tid, str(t.get("declared_count")), size])

# --- check_game_map ---

## Yalnızca `subjects` içindeki derslerin çıktıları için kayıt istenir.
static func check_game_map(game_map: Dictionary, outcomes: Dictionary, subjects: PackedStringArray) -> Array[String]:
	var errs: Array[String] = []
	for code: String in _sorted_keys(outcomes):
		var o: Variant = outcomes[code]
		if o is Dictionary and subjects.has(str((o as Dictionary).get("subject", ""))) and not game_map.has(code):
			errs.append("%s: game_map kaydı eksik" % code)
	var proposed_re: RegEx = _regex(PROPOSED_RE)
	for code: String in _sorted_keys(game_map):
		if not outcomes.has(code):
			errs.append("%s: game_map'te var ama outcomes.json'da yok" % code)
			continue
		var e: Variant = game_map[code]
		if not (e is Dictionary):
			errs.append("%s: game_map kaydı bir sözlük değil" % code)
			continue
		var entry: Dictionary = e
		var fit: String = str(entry.get("fit", ""))
		if not FITS.has(fit):
			errs.append("%s: fit '%s' geçersiz (full/partial/none)" % [code, fit])
		var tpls: Variant = entry.get("templates")
		var tpl_count: int = 0
		if not (tpls is Array):
			errs.append("%s: templates bir dizi olmalı" % code)
		else:
			tpl_count = (tpls as Array).size()
			for tpl: Variant in tpls:
				if not SPEC_TEMPLATES.has(str(tpl)):
					errs.append("%s: şablon '%s' spec'te yok" % [code, str(tpl)])
			if (fit == "full" or fit == "partial") and tpl_count == 0:
				errs.append("%s: fit %s ise templates boş olamaz" % [code, fit])
			if fit == "none" and tpl_count > 0:
				errs.append("%s: fit none ise templates boş olmalı" % code)
		if (fit == "partial" or fit == "none") and not _non_empty_string(entry.get("note")):
			errs.append("%s: fit %s ise note zorunlu" % [code, fit])
		if entry.has("proposed"):
			var prop: Variant = entry["proposed"]
			if not (prop is Array):
				errs.append("%s: proposed bir dizi olmalı" % code)
			else:
				for p: Variant in prop:
					if not (p is String) or proposed_re.search(p) == null:
						errs.append("%s: proposed '%s' snake_case değil" % [code, str(p)])
	return errs

# --- Sayım ---

## "g1.matematik" -> çıktı sayısı.
static func count_by_grade_subject(outcomes: Dictionary) -> Dictionary:
	var counts: Dictionary = {}
	for code: String in outcomes.keys():
		var o: Variant = outcomes[code]
		if not (o is Dictionary):
			continue
		var key: String = "g%d.%s" % [int((o as Dictionary).get("grade", 0)), str((o as Dictionary).get("subject", ""))]
		counts[key] = int(counts.get(key, 0)) + 1
	return counts
