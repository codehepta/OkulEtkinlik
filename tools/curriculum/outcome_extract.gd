extends RefCounted
## Müfredat taslak çıkarıcı (geliştirici aracı, saf mantık).
## Resmi PDF dökümünün sayfa aralığından öğrenme çıktısı kodu + metni + süreç bileşenlerini
## çıkarır. Çıktı bir TASLAKTIR: insan gözden geçirir, `themes` elle eklenir ve nihai
## doğruluk CurriculumCheck ile sağlanır. Kullanım:
##   const OutcomeExtract := preload("res://tools/curriculum/outcome_extract.gd")
## `class_name` bilerek yok.

const CurriculumCheck := preload("res://tools/curriculum/curriculum_check.gd")

## `<kod>. <başlık>` satırı; kodun önünde `VE SÜREÇ BİLEŞENLERİ ` gibi büyük harfli tablo
## etiketi olabilir. Sondaki noktasız kod (ör. `Uygulamaları HB.1.1.1`) eşleşmez.
const CODE_LINE_RE: String = "^(?:[A-ZÇĞİÖŞÜ ]+ )?([A-Z]+\\.(?:[A-Z]\\.)?\\d+\\.\\d+(?:\\.\\d+)?)\\.\\s+(\\S.*)$"
const STEP_RE: String = "^[a-zçğıöşü]\\)\\s"
const LETTER_RE: String = "[A-Za-zÇĞİÖŞÜçğıöşü]"
## Bu önekle başlayan satırlar bloğu bitirir.
const END_PREFIXES: PackedStringArray = ["İÇERİK ÇERÇEVESİ", "ÖĞRENME", "Anahtar Kavramlar", "===== SAYFA"]

static func _regex(pattern: String) -> RegEx:
	var re: RegEx = RegEx.new()
	re.compile(pattern)
	return re

## Sekme / U+00A0 / boşluk dizilerini tek boşluğa indirir, kenar boşluklarını atar.
static func _clean(line: String) -> String:
	var s: String = line.replace("\t", " ").replace("\r", " ").replace("\u00A0", " ")
	while s.contains("  "):
		s = s.replace("  ", " ")
	return s.strip_edges()

## `base` + `line` birleştirir; `base` `-` ile bitiyorsa (satır sonu tirelemesi) tire atılır, boşluk eklenmez.
static func _join(base: String, line: String) -> String:
	if base.is_empty():
		return line
	if base.ends_with("-"):
		return base.substr(0, base.length() - 1).strip_edges(false, true) + line
	return base + " " + line

static func _is_digits_only(s: String) -> bool:
	return not s.is_empty() and s.is_valid_int()

## Sayfa başındaki sayfa numarası ve çalışan başlık (`... ÖĞRETİM PROGRAMI`) satırı mı?
static func _is_page_header(line: String) -> bool:
	return line.is_empty() or _is_digits_only(line) or line.contains("PROGRAMI")

## Büyük harfli bölüm etiketi mi (ör. `KONUŞMA`, `DİNLEME/İZLEME`, `1. SINIF`)?
static func _is_all_caps_label(line: String, letter_re: RegEx) -> bool:
	return letter_re.search(line) != null and line.to_upper() == line

static func _is_end_line(line: String, letter_re: RegEx) -> bool:
	for prefix: String in END_PREFIXES:
		if line.begins_with(prefix):
			return true
	return _is_all_caps_label(line, letter_re)

## pages: sayfa no -> metin (CurriculumCheck.split_pages). Dönüş: kod -> kayıt
## {"grade","subject","text","printed_code","steps"?,"source":{"doc","file","page","url"}}.
## Kodun ilk göründüğü sayfa `page` olur; aynı kod sonra görülürse ilk kayıt korunur.
## Sayfa sınırına rastlayan açık bir blok sonraki sayfanın başındaki numara/başlık
## satırları atlanarak sürer.
static func extract(pages: Dictionary, subject: String, first_page: int, last_page: int) -> Dictionary:
	if not CurriculumCheck.SUBJECT_SOURCES.has(subject):
		return {}
	var src: Dictionary = CurriculumCheck.SUBJECT_SOURCES[subject]
	var code_re: RegEx = _regex(CODE_LINE_RE)
	var step_re: RegEx = _regex(STEP_RE)
	var letter_re: RegEx = _regex(LETTER_RE)

	var builders: Dictionary = {}  # kod -> {"page","title","steps"}
	var seen: Dictionary = {}  # kod -> true (kapsam dışı olanlar dahil)
	var cur: Dictionary = {}  # açık blok; boşsa satırlar yok sayılır

	var page_nums: Array = pages.keys()
	page_nums.sort()
	for pn: Variant in page_nums:
		var page: int = int(pn)
		if page < first_page or page > last_page:
			continue
		var lines: PackedStringArray = str(pages[pn]).split("\n")
		var at_top: bool = true
		for raw: String in lines:
			var line: String = _clean(raw)
			if at_top:
				if _is_page_header(line):
					continue
				at_top = false
			if line.is_empty() or _is_digits_only(line):
				continue

			var cm: RegExMatch = code_re.search(line)
			if cm != null:
				var code: String = cm.get_string(1)
				cur = {}
				if seen.has(code):
					continue
				seen[code] = true
				if CurriculumCheck.code_grade(code, subject) == 0:
					continue
				cur = {"page": page, "title": cm.get_string(2), "steps": []}
				builders[code] = cur
				continue

			if _is_end_line(line, letter_re):
				cur = {}
				continue
			if cur.is_empty():
				continue

			var steps: Array = cur["steps"]
			if step_re.search(line) != null:
				steps.append(line)
			elif steps.is_empty():
				cur["title"] = _join(str(cur["title"]), line)
			else:
				steps[steps.size() - 1] = _join(str(steps[steps.size() - 1]), line)

	var result: Dictionary = {}
	for code: String in builders.keys():
		var b: Dictionary = builders[code]
		var entry: Dictionary = {
			"grade": CurriculumCheck.code_grade(code, subject),
			"subject": subject,
			"text": b["title"],
			"printed_code": code + ".",
		}
		if not (b["steps"] as Array).is_empty():
			entry["steps"] = b["steps"]
		entry["source"] = {
			"doc": src["doc"],
			"file": src["file"],
			"page": b["page"],
			"url": src["url"],
		}
		result[code] = entry
	return result
