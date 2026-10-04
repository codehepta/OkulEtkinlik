class_name ProgressExport
## Yedek dışa/içe aktarma biçimi. Saf mantık, sahnesiz.

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
