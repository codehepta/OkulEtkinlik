class_name ContentValidator
extends RefCounted
## Ünite JSON'unu spec §4.3'e göre doğrular. Saf mantık; metin ve ses anahtarı
## varlığı Callable olarak dışarıdan gelir.

const NODE_ID_RE: String = "^g[1-3]\\.[a-z_]+\\.u\\d{2}\\.n\\d{2}$"
const UNIT_ID_RE: String = "^g[1-3]\\.[a-z_]+\\.u\\d{2}$"

## JSON sayıları float gelir; tam sayı değerli float kabul edilir.
static func is_int_like(v: Variant) -> bool:
	if v is int:
		return true
	if v is float:
		return is_equal_approx(v, roundf(v))
	return false

## Hata mesajı: Strings autoload'ı varsa şablondan, yoksa anahtarın kendisi.
static func msg(code: String, args: Dictionary = {}) -> String:
	var loop: SceneTree = Engine.get_main_loop() as SceneTree
	if loop != null:
		var s: Node = loop.root.get_node_or_null("Strings")
		if s != null and s.has(code):
			return s.t(code, args)
	return code + " " + str(args)

static func validate_unit(unit: Dictionary, known_outcomes: PackedStringArray, has_string: Callable, has_voice: Callable) -> Array[String]:
	var res: Array[String] = []
	for item: Dictionary in validate_unit_detailed(unit, known_outcomes, has_string, has_voice):
		res.append(item["message"])
	return res

## Yapısal sonuç: her öğe {node_index: int, node_id: String, message: String}.
## node_index -1 ise hata ünite düzeyindedir; aksi halde nodes[] içindeki sıradır.
static func validate_unit_detailed(unit: Dictionary, known_outcomes: PackedStringArray, has_string: Callable, has_voice: Callable) -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	var unit_id: String = str(unit.get("id", "?"))
	var errs: Array[String] = []
	var id_ok: bool = unit.get("id") is String and _matches(UNIT_ID_RE, unit_id)
	if not id_ok:
		errs.append(msg("err.content.bad_id", {"id": unit_id}))
	var grade_ok: bool = is_int_like(unit.get("grade")) and int(unit["grade"]) >= 1 and int(unit["grade"]) <= 3
	if not grade_ok:
		errs.append(msg("err.content.missing_field", {"id": unit_id, "field": "grade"}))
	var subject_ok: bool = unit.get("subject") is String and not (unit["subject"] as String).is_empty()
	if not subject_ok:
		errs.append(msg("err.content.missing_field", {"id": unit_id, "field": "subject"}))
	if id_ok and grade_ok and subject_ok:
		var parts: PackedStringArray = unit_id.split(".")
		if parts[0] != "g%d" % int(unit["grade"]) or parts[1] != unit["subject"]:
			errs.append(msg("err.content.unit_mismatch", {"id": unit_id}))
	if not (unit.get("source") is Dictionary):
		errs.append(msg("err.content.missing_field", {"id": unit_id, "field": "source"}))
	_check_string_key(unit, "title_key", unit_id, has_string, errs)
	for e: String in errs:
		out.append({"node_index": -1, "node_id": "", "message": e})
	if not (unit.get("nodes") is Array) or (unit["nodes"] as Array).is_empty():
		out.append({"node_index": -1, "node_id": "", "message": msg("err.content.missing_field", {"id": unit_id, "field": "nodes"})})
		return out
	var seen: Dictionary = {}
	var idx: int = -1
	for node_v: Variant in unit["nodes"]:
		idx += 1
		if not (node_v is Dictionary):
			out.append({"node_index": idx, "node_id": "", "message": msg("err.content.missing_field", {"id": unit_id, "field": "nodes[]"})})
			continue
		var node: Dictionary = node_v
		for e: String in _validate_node(node, unit_id, seen, known_outcomes, has_string, has_voice):
			out.append({"node_index": idx, "node_id": str(node.get("id", "")), "message": e})
	return out

static func _validate_node(node: Dictionary, unit_id: String, seen: Dictionary, known: PackedStringArray, has_string: Callable, has_voice: Callable) -> Array[String]:
	var errs: Array[String] = []
	var id: String = str(node.get("id", "?"))
	if not (node.get("id") is String) or not _matches(NODE_ID_RE, id):
		errs.append(msg("err.content.bad_id", {"id": id}))
	elif not id.begins_with(unit_id + "."):
		errs.append(msg("err.content.id_prefix", {"id": id, "unit": unit_id}))
	if seen.has(id):
		errs.append(msg("err.content.dup_id", {"id": id}))
	seen[id] = true
	var outcomes: Variant = node.get("outcomes")
	if not (outcomes is Array) or (outcomes as Array).is_empty():
		errs.append(msg("err.content.empty_outcomes", {"id": id}))
	else:
		for code: Variant in outcomes:
			if not known.has(str(code)):
				errs.append(msg("err.content.unknown_outcome", {"id": id, "code": str(code)}))
	_check_string_key(node, "title_key", id, has_string, errs)
	_check_voice_key(node, "intro_voice", id, has_voice, errs)
	if not (node.get("sticker") is String) or (node["sticker"] as String).is_empty():
		errs.append(msg("err.content.missing_field", {"id": id, "field": "sticker"}))
	var rounds: Variant = node.get("rounds")
	if not (rounds is Array) or (rounds as Array).is_empty():
		errs.append(msg("err.content.no_rounds", {"id": id}))
		return errs
	var idx: int = 0
	for r_v: Variant in rounds:
		idx += 1
		if not (r_v is Dictionary):
			errs.append(msg("err.content.missing_field", {"id": id, "field": "rounds[]"}))
			continue
		var r: Dictionary = r_v
		var tpl: String = str(r.get("template", ""))
		if not TemplateRegistry.has(tpl):
			errs.append(msg("err.content.unknown_template", {"id": id, "template": tpl}))
		elif not (r.get("params") is Dictionary):
			errs.append(msg("err.content.missing_field", {"id": id, "field": "params"}))
		else:
			for detail: String in TemplateRegistry.validate(tpl, r["params"]):
				errs.append(msg("err.content.params", {"id": id, "round": idx, "detail": detail}))
		var d: Variant = r.get("difficulty")
		if not is_int_like(d) or int(d) < 1 or int(d) > 3:
			errs.append(msg("err.content.bad_difficulty", {"id": id}))
		_check_voice_key(r, "voice", id, has_voice, errs)
	return errs

static func _check_string_key(d: Dictionary, field: String, id: String, has_string: Callable, errs: Array[String]) -> void:
	var k: Variant = d.get(field)
	if not (k is String) or (k as String).is_empty():
		errs.append(msg("err.content.missing_field", {"id": id, "field": field}))
	elif not has_string.call(k):
		errs.append(msg("err.content.missing_string", {"id": id, "key": k}))

static func _check_voice_key(d: Dictionary, field: String, id: String, has_voice: Callable, errs: Array[String]) -> void:
	var k: Variant = d.get(field)
	if not (k is String) or (k as String).is_empty():
		errs.append(msg("err.content.missing_field", {"id": id, "field": field}))
	elif not has_voice.call(k):
		errs.append(msg("err.content.missing_voice", {"id": id, "key": k}))

static func _matches(pattern: String, s: String) -> bool:
	var re: RegEx = RegEx.new()
	re.compile(pattern)
	return re.search(s) != null
