extends GutTest
## İçerik tutarlılığı: doğrulayıcının yapısal kurallarının ötesinde, turun seslendirmesi ile
## verisi birbirini tutmalı. Denetim sırasında bulunan hata türleri burada kurala döner.

const BASAMAK: Dictionary = {"iki": 2, "üç": 3, "dört": 4}
## Grafik turunda seslendirme bu sözcüğü anıyorsa bütün kategoriler bu önekten olmalı.
const CHART_WORDS: Dictionary = {
	"meyve": "item.meyve.",
	"oyunca": "item.oyuncak.",
	"hayvan": "item.hayvan.",
}

var _voice: Dictionary = {}

func before_all() -> void:
	_voice = JSON.parse_string(FileAccess.get_file_as_string("res://content/voice_lines.tr.json"))

func _collect(dir: String, out: PackedStringArray) -> void:
	for f: String in DirAccess.get_files_at(dir):
		if f.ends_with(".json") and f.begins_with("u"):
			out.append(dir.path_join(f))
	for d: String in DirAccess.get_directories_at(dir):
		_collect(dir.path_join(d), out)

## Her tur için {"where", "node", "round"} listesi.
func _rounds() -> Array[Dictionary]:
	var files: PackedStringArray = PackedStringArray()
	_collect("res://content", files)
	var res: Array[Dictionary] = []
	for path: String in files:
		var unit: Dictionary = JSON.parse_string(FileAccess.get_file_as_string(path))
		for node: Variant in unit["nodes"] as Array:
			var rounds: Array = (node as Dictionary)["rounds"]
			for i: int in rounds.size():
				res.append({"where": "%s r%d" % [(node as Dictionary)["id"], i + 1], "node": node, "round": rounds[i]})
	return res

func _vo(key: Variant) -> String:
	if not (key is String) or not _voice.has(key):
		return ""
	return str((_voice[key] as Dictionary)["text"]).to_lower()

func _numbers(v: Variant, out: Array[int]) -> void:
	if v is Dictionary:
		var d: Dictionary = v
		if str(d.get("type", "")) == "number" and ContentValidator.is_int_like(d.get("value")):
			out.append(int(d["value"]))
		for x: Variant in d.values():
			_numbers(x, out)
	elif v is Array:
		for x: Variant in v as Array:
			_numbers(x, out)

## "Üç basamaklı sayılar!" diyen turda dört basamaklı 1000 vardı.
func test_digit_count_matches_voice() -> void:
	var re: RegEx = RegEx.create_from_string("(iki|üç|dört) basamaklı")
	var checked: int = 0
	for r: Dictionary in _rounds():
		var m: RegExMatch = re.search(_vo((r["round"] as Dictionary).get("voice")))
		if m == null:
			continue
		var digits: int = BASAMAK[m.get_string(1)]
		var nums: Array[int] = []
		_numbers((r["round"] as Dictionary)["params"], nums)
		for n: int in nums:
			checked += 1
			assert_eq(str(absi(n)).length(), digits, "%s: %d, '%s' ile uyuşmuyor" % [r["where"], n, m.get_string()])
	assert_gt(checked, 0, "en az bir basamak turu denetlenmeli")

## "Meyveleri grafiğe işle" diyen turda mantar, "oyuncakları" diyen turda kitap vardı.
func test_chart_categories_match_voice() -> void:
	var checked: int = 0
	for r: Dictionary in _rounds():
		var rd: Dictionary = r["round"]
		if str(rd["template"]) != "chart_build":
			continue
		var vo: String = _vo(rd.get("voice"))
		for word: String in CHART_WORDS:
			if not vo.contains(word):
				continue
			checked += 1
			for c: Variant in (rd["params"] as Dictionary)["categories"] as Array:
				assert_true(str(c).begins_with(str(CHART_WORDS[word])),
					"%s: seslendirme '%s' diyor ama kategori %s" % [r["where"], word, c])
	assert_gt(checked, 0, "en az bir grafik turu denetlenmeli")

## "Hangisi X'in, hangisi Y'nin hikâyesindeydi?" kartları aynı düğümdeki hikâyelerde geçmeli
## ("buz" ve "boya" kartları hiçbir hikâyede yoktu). Ek alan sözcükler için kök karşılaştırılır.
func test_story_compare_cards_appear_in_stories() -> void:
	var re: RegEx = RegEx.create_from_string("(hikâyesinde|konuşmasında|fıkrasında)")
	var checked: int = 0
	for r: Dictionary in _rounds():
		var rd: Dictionary = r["round"]
		if str(rd["template"]) != "sort_bins" or re.search(_vo(rd.get("voice"))) == null:
			continue
		var text: String = ""
		for other: Variant in (r["node"] as Dictionary)["rounds"] as Array:
			if str((other as Dictionary)["template"]) != "story":
				continue
			for pg: Variant in ((other as Dictionary)["params"] as Dictionary)["pages"] as Array:
				text += " " + Strings.t(str((pg as Dictionary)["text"])).to_lower()
		for it: Variant in (rd["params"] as Dictionary)["items"] as Array:
			var tok: Dictionary = (it as Dictionary)["token"]
			if str(tok.get("type", "")) != "text":
				continue
			var card: String = Strings.t(str(tok["value"])).to_lower()
			var stem: String = card.substr(0, maxi(mini(3, card.length()), card.length() - 1))
			checked += 1
			assert_true(text.contains(stem), "%s: '%s' kartı hikâyelerde geçmiyor" % [r["where"], card])
	assert_gt(checked, 0, "en az bir karşılaştırma kartı denetlenmeli")
