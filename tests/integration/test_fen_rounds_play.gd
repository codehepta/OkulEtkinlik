extends "res://tests/helpers/template_harness.gd"
## Fen 3 ünitelerindeki her tur gerçek şablon sahnesinde kurulabilmeli: kendi zorluğunda ve
## en zor seviyede hatasız açılır, dokunma hedefleri ≥128 px, ilk ipucu çalışır.

const UNIT_DIR: String = "res://content/g3/fen"

func _rounds() -> Array[Dictionary]:
	var res: Array[Dictionary] = []
	for i: int in range(1, 9):
		var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string("%s/u%02d.json" % [UNIT_DIR, i]))
		if not (parsed is Dictionary):
			continue
		for n: Variant in (parsed as Dictionary)["nodes"]:
			for r: Variant in (n as Dictionary)["rounds"]:
				var rd: Dictionary = (r as Dictionary).duplicate(true)
				rd["node"] = (n as Dictionary)["id"]
				res.append(rd)
	return res

func test_every_fen_round_sets_up() -> void:
	var rounds: Array[Dictionary] = _rounds()
	assert_gt(rounds.size(), 60, "Fen turları yüklenmeli")
	for rd: Dictionary in rounds:
		for d: int in [int(rd["difficulty"]), 3]:
			var g: MiniGame = make(str(rd["template"]), _ints(rd["params"]) as Dictionary, d)
			if g.has_method("touch_targets"):
				for c: Control in g.call("touch_targets"):
					assert_true(c.size.x >= 128.0 and c.size.y >= 128.0, "%s %s: %s" % [rd["node"], rd["template"], c.name])
			g.show_hint(1)
			g.queue_free()
	assert_eq(results.size(), 0, "kurulum turu kendiliğinden bitirmemeli")

## JSON sayıları float gelir; ContentDB gibi tam sayıya çevir.
func _ints(v: Variant) -> Variant:
	if v is Dictionary:
		var d: Dictionary = {}
		for k: Variant in v:
			d[k] = _ints(v[k])
		return d
	if v is Array:
		var a: Array = []
		for x: Variant in v:
			a.append(_ints(x))
		return a
	if v is float and is_equal_approx(v, roundf(v)):
		return int(v)
	return v
