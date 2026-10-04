class_name TemplateRegistry
extends RefCounted
## Mini oyun şablonlarının kayıt defteri.

const SCENES: Dictionary = {
	"count_choose": "res://scenes/games/count_choose/count_choose.tscn",
	"drag_match": "res://scenes/games/drag_match/drag_match.tscn",
	"listen_find": "res://scenes/games/listen_find/listen_find.tscn",
	"sequence": "res://scenes/games/sequence/sequence.tscn",
	"balloon_pop": "res://scenes/games/balloon_pop/balloon_pop.tscn",
	"pattern": "res://scenes/games/pattern/pattern.tscn",
	"balance": "res://scenes/games/balance/balance.tscn",
	"clock_money": "res://scenes/games/clock_money/clock_money.tscn",
	"fraction_pizza": "res://scenes/games/fraction_pizza/fraction_pizza.tscn",
	"chart_build": "res://scenes/games/chart_build/chart_build.tscn",
	"grid": "res://scenes/games/grid/grid.tscn",
	"trace": "res://scenes/games/trace/trace.tscn",
	"syllable_build": "res://scenes/games/syllable_build/syllable_build.tscn",
	"story": "res://scenes/games/story/story.tscn",
	"sort_bins": "res://scenes/games/sort_bins/sort_bins.tscn",
	"scenario": "res://scenes/games/scenario/scenario.tscn",
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
	return validate_at(script_path(id), id, params)

## Betik yolunu açıkça verir (testlerde sahte yol kullanılabilsin diye).
static func validate_at(path: String, id: String, params: Dictionary) -> Array[String]:
	var res: Array[String] = []
	var script: Script = null
	if ResourceLoader.exists(path):
		script = load(path) as Script
	if script == null:
		res.append(ContentValidator.msg("err.content.template_script_missing", {"id": id}))
		return res
	res.assign(script.call("validate_params", params))
	return res
