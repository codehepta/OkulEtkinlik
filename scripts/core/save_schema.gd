class_name SaveSchema
## Kayıt dosyası şeması (v1), varsayılanlar ve sürüm göçü. Saf mantık, sahnesiz.

const VERSION: int = 1

## Üst düzey tamsayı alanlar.
const _ROOT_INTS: Array[String] = ["schema_version", "last_day_seen"]
## Ayarlardaki tamsayı alanlar.
const _SETTINGS_INTS: Array[String] = ["daily_limit_min"]
## Profildeki tamsayı alanlar.
const _PROFILE_INTS: Array[String] = ["grade", "created_day"]
const _NODE_INTS: Array[String] = ["best_stars", "plays"]
const _OUTCOME_INTS: Array[String] = ["box", "due", "last_day"]
const _USAGE_INTS: Array[String] = ["day", "seconds", "unlocked_day"]

static func default_settings() -> Dictionary:
	return {
		"daily_limit_min": 0,
		"vol_voice": 1.0,
		"vol_music": 0.6,
		"vol_sfx": 0.8,
		"show_text_g1": false,
		"reduce_motion": false,
	}

static func new_save() -> Dictionary:
	return {
		"schema_version": VERSION,
		"last_day_seen": 0,
		"settings": default_settings(),
		"profiles": [],
	}

static func new_profile(id: String, avatar: String, nickname: String, grade: int) -> Dictionary:
	return {
		"id": id,
		"avatar": avatar,
		"nickname": nickname,
		"grade": grade,
		"created_day": 0,
		"nodes": {},
		"outcomes": {},
		"stickers": [],
		"usage": {"day": 0, "seconds": 0, "unlocked_day": -1},
	}

## Veriyi güncel sürüme taşır. Gelecek sürüm (> VERSION) olduğu gibi döner.
static func migrate(data: Dictionary) -> Dictionary:
	var out: Dictionary = data.duplicate(true)
	_to_int(out, _ROOT_INTS)
	var version: int = int(out.get("schema_version", 0))
	if version > VERSION:
		return out
	# Sürüm adımları: şimdilik 0 -> 1 yalnızca eksik alanları doldurur.
	while version < VERSION:
		version += 1
	out["schema_version"] = VERSION
	_fill_defaults(out)
	_normalize(out)
	return out

static func _fill_defaults(d: Dictionary) -> void:
	if not d.has("last_day_seen"):
		d["last_day_seen"] = 0
	var settings: Dictionary = default_settings()
	var existing: Variant = d.get("settings")
	if existing is Dictionary:
		settings.merge(existing, true)
	d["settings"] = settings
	if not (d.get("profiles") is Array):
		d["profiles"] = []
	var fixed: Array = []
	for p: Variant in d["profiles"]:
		if p is Dictionary:
			var base: Dictionary = new_profile(str(p.get("id", "")), "", "", 1)
			base.merge(p, true)
			fixed.append(base)
	d["profiles"] = fixed

## JSON'dan float gelen bilinen tamsayı alanlarını int yapar.
static func _normalize(d: Dictionary) -> void:
	_to_int(d, _ROOT_INTS)
	_to_int(d["settings"], _SETTINGS_INTS)
	for p: Dictionary in d["profiles"]:
		_to_int(p, _PROFILE_INTS)
		if p["usage"] is Dictionary:
			_to_int(p["usage"], _USAGE_INTS)
		if p["nodes"] is Dictionary:
			for n: Variant in p["nodes"].values():
				if n is Dictionary:
					_to_int(n, _NODE_INTS)
		if p["outcomes"] is Dictionary:
			for o: Variant in p["outcomes"].values():
				if o is Dictionary:
					_to_int(o, _OUTCOME_INTS)

static func _to_int(d: Dictionary, keys: Array[String]) -> void:
	for k: String in keys:
		if d.has(k) and d[k] is float:
			d[k] = int(d[k])
