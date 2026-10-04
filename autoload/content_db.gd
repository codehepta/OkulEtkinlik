extends Node
## İçerik veritabanı: content/g<N>/<ders>/uNN.json dosyalarını yükler ve doğrular.
## Debug derlemede hatalı düğüm tutulur (hata kartı için), sürümde atılır.

const SUBJECT_REGION: Dictionary = {
	"matematik": "sayi_ormani",
	"turkce": "harf_vadisi",
	"hayat_bilgisi": "hayat_kasabasi",
	"fen": "kesif_laboratuvari",
}
const VOICE_LINES_PATH: String = "res://content/voice_lines.tr.json"

var errors: Array[String] = []
var outcomes_path: String = "res://docs/curriculum/outcomes.json"
var debug_build: bool = OS.is_debug_build()
## (key: String) -> bool; testlerde değiştirilebilir.
var has_string: Callable = func(k: String) -> bool:
	return Strings.has(k)
var has_voice: Callable = func(k: String) -> bool:
	return _voice_lines().has(k)

var _voice_cache: Dictionary = {}
var _voice_loaded: bool = false
## "g1.matematik" -> Array[Dictionary] (id'ye göre sıralı)
var _units: Dictionary = {}
var _nodes: Dictionary = {}
## "g1.matematik" -> Array[String] düğüm kimlikleri, sıralı
var _order: Dictionary = {}

func load_all(root: String = "res://content") -> void:
	errors.clear()
	_units.clear()
	_nodes.clear()
	_order.clear()
	var known: PackedStringArray = _load_known_outcomes()
	var files: PackedStringArray = PackedStringArray()
	_collect(root, files)
	files.sort()
	for path: String in files:
		_load_unit(path, known)
	for key: String in _units:
		(_units[key] as Array).sort_custom(func(a: Dictionary, b: Dictionary) -> bool: return str(a["id"]) < str(b["id"]))
		var ids: Array[String] = []
		for u: Dictionary in _units[key]:
			for n: Dictionary in u["nodes"]:
				ids.append(str(n["id"]))
		_order[key] = ids

func units(grade: int, subject: String) -> Array[Dictionary]:
	var res: Array[Dictionary] = []
	res.assign(_units.get("g%d.%s" % [grade, subject], []))
	return res

func node(id: String) -> Dictionary:
	return _nodes.get(id, {})

func next_node_id(id: String) -> String:
	var parts: PackedStringArray = id.split(".")
	if parts.size() < 4:
		return ""
	var ids: Array = _order.get(parts[0] + "." + parts[1], [])
	var i: int = ids.find(id)
	if i < 0 or i + 1 >= ids.size():
		return ""
	return ids[i + 1]

func subjects_for_grade(grade: int) -> PackedStringArray:
	var s: PackedStringArray = PackedStringArray(["matematik", "turkce", "hayat_bilgisi"])
	if grade >= 3:
		s.append("fen")
	return s

func _load_known_outcomes() -> PackedStringArray:
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(outcomes_path))
	if parsed is Dictionary:
		return PackedStringArray((parsed as Dictionary).keys())
	push_error("outcomes.json okunamadı: " + outcomes_path)
	return PackedStringArray()

func _collect(dir: String, out: PackedStringArray) -> void:
	for f: String in DirAccess.get_files_at(dir):
		if f.ends_with(".json") and _is_unit_file(dir.path_join(f)):
			out.append(dir.path_join(f))
	for d: String in DirAccess.get_directories_at(dir):
		_collect(dir.path_join(d), out)

## g<1-3>/<ders>/u<NN>.json konumu.
func _is_unit_file(path: String) -> bool:
	var re: RegEx = RegEx.new()
	re.compile("/g[1-3]/[a-z_]+/u\\d{2}\\.json$")
	return re.search(path) != null

func _load_unit(path: String, known: PackedStringArray) -> void:
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
	if not (parsed is Dictionary):
		_log_error(path + ": JSON okunamadı")
		return
	var unit: Dictionary = _normalize(parsed)
	var errs: Array[String] = ContentValidator.validate_unit(unit, known, has_string, has_voice)
	var bad_nodes: Dictionary = {}
	for e: String in errs:
		_log_error(e)
		bad_nodes[e.get_slice(":", 0)] = true
	if not debug_build:
		var kept: Array = []
		for n: Dictionary in unit.get("nodes", []):
			if not bad_nodes.has(str(n.get("id", ""))):
				kept.append(n)
		unit["nodes"] = kept
	if not unit.has("id") or not unit.has("grade") or not unit.has("subject"):
		return
	var key: String = "g%d.%s" % [int(unit["grade"]), unit["subject"]]
	if not _units.has(key):
		_units[key] = []
	(_units[key] as Array).append(unit)
	for n: Dictionary in unit["nodes"]:
		_nodes[str(n.get("id", ""))] = n

func _log_error(e: String) -> void:
	errors.append(e)
	push_error(e)

## Tam sayı değerli float'ları int'e çevirir (JSON sayıları float gelir).
func _normalize(v: Variant) -> Variant:
	if v is Dictionary:
		var d: Dictionary = {}
		for k: Variant in v:
			d[k] = _normalize(v[k])
		return d
	if v is Array:
		var a: Array = []
		for x: Variant in v:
			a.append(_normalize(x))
		return a
	if v is float and is_equal_approx(v, roundf(v)):
		return int(v)
	return v

func _voice_lines() -> Dictionary:
	if not _voice_loaded:
		_voice_loaded = true
		var p: Variant = JSON.parse_string(FileAccess.get_file_as_string(VOICE_LINES_PATH))
		if p is Dictionary:
			_voice_cache = p
	return _voice_cache
