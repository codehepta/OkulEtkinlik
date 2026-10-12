extends RefCounted
## Veli paneli özetleri: ders bazında çıktı özeti (oynanan/toplam, ortalama ustalık, son
## oynanma günü), ders listesi ve bugünkü süre kullanımı. Metin üretmez; panel sonuçları
## strings.tr.json anahtarlarına çevirir. Saf mantık, sahnesiz.

## Ünitelerdeki (ContentDB.units çıktısı) bütün düğümlerin çıktı kodları; tekil ve sıralı.
static func subject_codes(units: Array[Dictionary]) -> PackedStringArray:
	var seen: Dictionary = {}
	for u: Dictionary in units:
		for n: Variant in u.get("nodes", []):
			if not (n is Dictionary):
				continue
			for code: Variant in (n as Dictionary).get("outcomes", []):
				seen[str(code)] = true
	var res: PackedStringArray = PackedStringArray(seen.keys())
	res.sort()
	return res

## rows içinden verilen dersin satırları (sıra korunur).
static func rows_of(rows: Array[Dictionary], subject: String) -> Array[Dictionary]:
	var res: Array[Dictionary] = []
	for r: Dictionary in rows:
		if str(r.get("subject", "")) == subject:
			res.append(r)
	return res

## Panelde gösterilecek dersler: önce sınıfın dersleri, sonra satırlarda geçen (ör. eski
## sınıftan kalan) başka dersler. Dersi boş satırlar listeye ders eklemez.
static func subjects(grade_subjects: PackedStringArray, rows: Array[Dictionary]) -> PackedStringArray:
	var res: PackedStringArray = grade_subjects.duplicate()
	for r: Dictionary in rows:
		var s: String = str(r.get("subject", ""))
		if s != "" and not res.has(s):
			res.append(s)
	return res

## Ders özeti: {played, total, average (-1 = oynanmadı), last_day (0 = hiç)}.
## total_codes: dersin çocuğun sınıfındaki oyun çıktıları. played ve average yalnızca bu
## kodları sayar; last_day dersin bütün satırlarından gelir.
static func subject_summary(rows: Array[Dictionary], subject: String, total_codes: PackedStringArray) -> Dictionary:
	var played: int = 0
	var sum: float = 0.0
	var last_day: int = 0
	for r: Dictionary in rows_of(rows, subject):
		last_day = maxi(last_day, int(r.get("last_day", 0)))
		if total_codes.has(str(r.get("code", ""))):
			played += 1
			sum += float(r.get("mastery", 0.0))
	return {
		"played": played,
		"total": total_codes.size(),
		"average": sum / played if played > 0 else -1.0,
		"last_day": last_day,
	}

## Bugünkü kullanım: {state, played_min, left_min}. state: "unlimited" (sınır yok),
## "unlocked" (veli bugünlük açtı), "locked" (süre doldu), "limited" (süre işliyor).
## Kalan dakika yukarı yuvarlanır: 30 sn kaldıysa "1 dk kaldı".
static func usage(limit_min: int, used_seconds: int, unlocked_today: bool) -> Dictionary:
	var used: int = maxi(0, used_seconds)
	var res: Dictionary = {"state": "unlimited", "played_min": int(used / 60.0), "left_min": 0}
	if limit_min <= 0:
		return res
	if unlocked_today:
		res["state"] = "unlocked"
		return res
	var left_s: int = limit_min * 60 - used
	if left_s <= 0:
		res["state"] = "locked"
		return res
	res["state"] = "limited"
	res["left_min"] = ceili(left_s / 60.0)
	return res
