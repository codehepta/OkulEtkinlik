class_name ProgressExport
## Yedek dışa/içe aktarma biçimi. Saf mantık, sahnesiz.

const MAX_PROFILES: int = 4

## Kayıt verisini okunaklı (girintili) JSON metnine çevirir.
static func to_json(save: Dictionary) -> String:
	return JSON.stringify(save, "\t")

## Yedek metnini ayrıştırır. Geçersizse {} döner (bozuk JSON, sözlük değil,
## schema_version sayı değil, profiles dizi değil).
static func from_json(text: String) -> Dictionary:
	var json: JSON = JSON.new()
	if json.parse(text) != OK or not (json.data is Dictionary):
		return {}
	var d: Dictionary = json.data
	if not (d.get("schema_version") is float or d.get("schema_version") is int):
		return {}
	if not (d.get("profiles") is Array):
		return {}
	return d

## İçe aktarma için tam doğrulama. {"data": göç etmiş kayıt, "error": ""} ya da
## {"data": {}, "error": <strings anahtarı>} döner. Hiçbir şey yazmaz.
static func prepare_import(text: String) -> Dictionary:
	var bad: Dictionary = {"data": {}, "error": "parent.import_bad"}
	var raw: Dictionary = from_json(text)
	if raw.is_empty() or int(raw["schema_version"]) > SaveSchema.VERSION:
		return bad
	var raw_profiles: Array = raw["profiles"]
	if raw_profiles.size() > MAX_PROFILES:
		return {"data": {}, "error": "parent.import_too_many"}
	for p: Variant in raw_profiles:
		if not (p is Dictionary):
			return bad
	var data: Dictionary = SaveSchema.migrate(raw)
	if not (data.get("settings") is Dictionary):
		return bad
	var seen: Dictionary = {}
	for p: Dictionary in data["profiles"]:
		var id: Variant = p.get("id")
		if not (id is String) or (id as String).is_empty() or seen.has(id):
			return bad
		seen[id] = true
		for key: String in ["nodes", "outcomes", "usage"]:
			if not (p.get(key) is Dictionary):
				return bad
		if not (p.get("stickers") is Array):
			return bad
		if not (p.get("grade") is int) or int(p["grade"]) < 1 or int(p["grade"]) > 3:
			return bad
	return {"data": data, "error": ""}
