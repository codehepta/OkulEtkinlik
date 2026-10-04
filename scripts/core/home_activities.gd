extends RefCounted
## Veli paneli "evde etkinlik önerileri" (spec Açık sorular Faz 2 (b)): oyunda oynanamayan
## (`fit: none`) çıktılar ve `partial` kayıtların oynanamayan bileşenleri için çıktı bazında
## öneri metni. content/home_activities.tr.json, çevrimdışı; ustalık hesabına girmez.
## Saf mantık, sahnesiz.

const DEFAULT_PATH: String = "res://content/home_activities.tr.json"

## Çıktı kodu -> öneri metni; okunamazsa {}.
static func load_texts(path: String = DEFAULT_PATH) -> Dictionary:
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
	if parsed is Dictionary:
		return parsed
	push_error("Evde etkinlik önerileri okunamadı: " + path)
	return {}

## Sınıfın öneri satırları ({code, subject, outcome, text}), ders ve kod sırasıyla.
## outcomes: outcomes.json içeriği (kod -> {grade, subject, text}).
static func rows_for_grade(texts: Dictionary, outcomes: Dictionary, grade: int) -> Array[Dictionary]:
	var rows: Array[Dictionary] = []
	for code: String in texts:
		var info: Variant = outcomes.get(code)
		if not (info is Dictionary) or int((info as Dictionary).get("grade", 0)) != grade:
			continue
		rows.append({
			"code": code,
			"subject": str((info as Dictionary).get("subject", "")),
			"outcome": str((info as Dictionary).get("text", "")),
			"text": str(texts[code]),
		})
	rows.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a["subject"]) + str(a["code"]) < str(b["subject"]) + str(b["code"]))
	return rows

## İçerik kapısı: hata listesi (boş = geçerli). Her kod outcomes.json'da olmalı, `fit: full`
## olmamalı, metin boş olmamalı; her `fit: none` çıktının önerisi bulunmalı.
static func validate(texts: Dictionary, outcomes: Dictionary, game_map: Dictionary) -> Array[String]:
	var errs: Array[String] = []
	for code: Variant in texts:
		if not outcomes.has(code):
			errs.append("bilinmeyen çıktı kodu: %s" % code)
		elif str((game_map.get(code, {}) as Dictionary).get("fit", "")) == "full":
			errs.append("oyunda tam oynanan çıktıya öneri yazılmaz: %s" % code)
		if not (texts[code] is String) or str(texts[code]).strip_edges().is_empty():
			errs.append("boş öneri metni: %s" % code)
	for code: String in game_map:
		if str((game_map[code] as Dictionary).get("fit", "")) == "none" and not texts.has(code):
			errs.append("oynanamayan çıktının önerisi eksik: %s" % code)
	return errs
