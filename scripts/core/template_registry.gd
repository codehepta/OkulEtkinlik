class_name TemplateRegistry
extends RefCounted
## Mini oyun şablonlarının kayıt defteri.

const SCENES: Dictionary = {
	"count_choose": "res://scenes/games/count_choose/count_choose.tscn",
	"drag_match": "res://scenes/games/drag_match/drag_match.tscn",
	"listen_find": "res://scenes/games/listen_find/listen_find.tscn",
}

static func has(id: String) -> bool:
	return SCENES.has(id)

## Şablon betiğinin (sahneden bağımsız) yolu: res://scenes/games/<id>/<id>.gd
static func script_path(id: String) -> String:
	return (SCENES[id] as String).get_basename() + ".gd"

## Şablonun static validate_params metodunu çağırır; betik yoksa hata döner.
## Dönen mesajlar düğüm kimliği öneksizdir.
static func validate(id: String, params: Dictionary) -> Array[String]:
	if not has(id):
		return [ContentValidator.msg("err.content.unknown_template", {"id": id, "template": id})]
	var path: String = script_path(id)
	if not ResourceLoader.exists(path):
		return [ContentValidator.msg("err.content.template_script_missing", {"id": id})]
	var script: Script = load(path) as Script
	if script == null:
		return [ContentValidator.msg("err.content.template_script_missing", {"id": id})]
	var res: Array[String] = []
	res.assign(script.call("validate_params", params))
	return res
