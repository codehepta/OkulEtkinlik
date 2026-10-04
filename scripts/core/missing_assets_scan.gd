extends RefCounted
## Eksik asset taraması için saf mantık (tools/missing_assets.gd kullanır).
## Dosya okumaz; anahtar toplama, sınıflandırma ve rapor metni üretir.
## Rapor metinleri geliştirici içindir (oyunda görünmez).

const KEY_RE: String = "^[a-z]+(\\.[a-z0-9_]+)+$"
const CODE_KEY_RE: String = "\"((?:char|avatar|region|map|item|ui|st|decor|vo|music|sfx)\\.[a-z0-9_.%]*)\""

## Kodda biçimlendirilerek ("%d", "+") kurulan anahtarların açılımı.
## Yeni bir dinamik anahtar eklendiğinde bu liste de güncellenir.
const NUMBERED_VOICES: Dictionary = {
	"vo.genel.aferin_": 5,
	"vo.genel.tekrar_dene_": 3,
	"vo.genel.yildiz_": 3,
}
const MAP_STOP_STATES: PackedStringArray = ["open", "done", "locked", "review"]
const MAX_NUMBER_VOICE: int = 20
const CLOCK_VOICE_MINUTES: Array[int] = [0, 30]

## Görsel önekine göre style-guide.md blok adı.
const SCENE_KEYS: PackedStringArray = ["map.island"]
const ICON_PREFIXES: PackedStringArray = ["ui", "st"]

static func _re(pattern: String) -> RegEx:
	var re: RegEx = RegEx.new()
	re.compile(pattern)
	return re

## Bilinen önekli, tamamlanmış (biçim yer tutucusu içermeyen) asset anahtarı mı?
static func is_asset_key(s: String) -> bool:
	if _re(KEY_RE).search(s) == null or s.ends_with("_"):
		return false
	var prefix: String = s.get_slice(".", 0)
	return AssetPaths.IMAGE_PREFIXES.has(prefix) or AssetPaths.AUDIO_PREFIXES.has(prefix)

## JSON değerini (sözlük/dizi/metin) gezer, asset anahtarı olan metinleri out'a ekler.
static func collect_from_json(v: Variant, out: Dictionary) -> void:
	if v is Dictionary:
		for k: Variant in v:
			collect_from_json((v as Dictionary)[k], out)
	elif v is Array:
		for x: Variant in v:
			collect_from_json(x, out)
	elif v is String and is_asset_key(v as String):
		out[v] = true

## Kaynak koddaki tırnaklı anahtarlar; metin anahtarları (strings.tr.json) ve
## biçimlendirilmiş/yarım anahtarlar atlanır. Sıra korunur, yinelenenler atılır.
static func extract_code_keys(source: String, string_keys: Dictionary) -> PackedStringArray:
	var res: PackedStringArray = PackedStringArray()
	for m: RegExMatch in _re(CODE_KEY_RE).search_all(source):
		var k: String = m.get_string(1)
		if string_keys.has(k) or not is_asset_key(k) or res.has(k):
			continue
		res.append(k)
	return res

## Biçimlendirilmiş anahtarların bilinen açılımları.
static func dynamic_keys(regions: PackedStringArray) -> PackedStringArray:
	var res: PackedStringArray = PackedStringArray()
	for base: String in NUMBERED_VOICES:
		for i: int in range(1, int(NUMBERED_VOICES[base]) + 1):
			res.append("%s%d" % [base, i])
	for n: int in range(0, MAX_NUMBER_VOICE + 1):
		res.append("vo.sayi.%d" % n)
	for r: String in regions:
		res.append("region.%s.bg" % r)
		res.append("region.%s.icon" % r)
		res.append("music.%s" % r)
		res.append("vo.bolge.%s" % r)
	for s: String in MAP_STOP_STATES:
		res.append("map.stop_%s" % s)
	# 1. sınıf saat okuma sesleri (clock_money, tam ve yarım saat).
	for h: int in range(1, 13):
		for m: int in CLOCK_VOICE_MINUTES:
			res.append("vo.saat.%d_%02d" % [h, m])
	return res

## Grup adı: "image:<önek>", "voice", "music" ya da "sfx".
static func group_of(key: String) -> String:
	var prefix: String = key.get_slice(".", 0)
	if prefix == "vo":
		return "voice"
	if AssetPaths.AUDIO_PREFIXES.has(prefix):
		return prefix
	return "image:" + prefix

static func style_block_for(key: String) -> String:
	if SCENE_KEYS.has(key) or (key.begins_with("region.") and key.ends_with(".bg")):
		return "STYLE_SCENE"
	if ICON_PREFIXES.has(key.get_slice(".", 0)) or key.ends_with(".icon") or key.begins_with("map.stop_"):
		return "STYLE_ICON"
	return "STYLE_SPRITE"

## exists: (key: String) -> bool. Dönen sözlük: grup -> sıralı PackedStringArray.
static func find_missing(keys: PackedStringArray, exists: Callable) -> Dictionary:
	var res: Dictionary = {}
	for k: String in keys:
		if exists.call(k):
			continue
		var g: String = group_of(k)
		if not res.has(g):
			res[g] = PackedStringArray()
		var arr: PackedStringArray = res[g]
		if not arr.has(k):
			arr.append(k)
		res[g] = arr
	for g: String in res:
		var arr2: PackedStringArray = res[g]
		arr2.sort()
		res[g] = arr2
	return res

static func _sorted_groups(missing: Dictionary) -> Array:
	var groups: Array = missing.keys()
	groups.sort()
	return groups

## Konsol çıktısı.
static func report_text(missing: Dictionary) -> String:
	var lines: PackedStringArray = PackedStringArray()
	var total: int = 0
	for g: String in _sorted_groups(missing):
		var arr: PackedStringArray = missing[g]
		total += arr.size()
		lines.append("%s (%d)" % [g, arr.size()])
		for k: String in arr:
			lines.append("  " + k)
	lines.append("TOPLAM eksik: %d" % total)
	return "\n".join(lines)

static func _rel(path: String) -> String:
	return path.trim_prefix("res://")

## Parti taslağı (Markdown): görseller için stil bloğu, sesler için tablo.
static func report_markdown(missing: Dictionary, voice_lines: Dictionary) -> String:
	var md: PackedStringArray = PackedStringArray()
	md.append("# Eksik asset taslağı")
	md.append("")
	md.append("`tools/missing_assets.gd` tarafından üretildi. Parti dosyası yazarken `asset-requests/001–00N` içinde zaten istenmiş olanları ayıkla.")
	for g: String in _sorted_groups(missing):
		var arr: PackedStringArray = missing[g]
		md.append("")
		md.append("## %s (%d)" % [g, arr.size()])
		md.append("")
		if g.begins_with("image:"):
			md.append("| Anahtar | Dosya yolu | Stil bloğu |")
			md.append("|---|---|---|")
			for k: String in arr:
				md.append("| `%s` | `%s` | %s |" % [k, _rel(AssetPaths.image_path(k)), style_block_for(k)])
		elif g == "voice":
			md.append("| Kimlik | Dosya yolu | Konuşmacı | Metin |")
			md.append("|---|---|---|---|")
			for k: String in arr:
				var line: Dictionary = voice_lines.get(k, {}) if voice_lines.get(k) is Dictionary else {}
				var wav: String = ""
				for c: String in AssetPaths.audio_candidates(k):
					if c.ends_with(".wav"):
						wav = c
				md.append("| `%s` | `%s` | %s | %s |" % [k, _rel(wav), str(line.get("speaker", "?")), str(line.get("text", "?"))])
		else:
			md.append("| Kimlik | Dosya yolu |")
			md.append("|---|---|")
			for k: String in arr:
				md.append("| `%s` | `%s` |" % [k, _rel(AssetPaths.audio_candidates(k)[0])])
	md.append("")
	return "\n".join(md)
