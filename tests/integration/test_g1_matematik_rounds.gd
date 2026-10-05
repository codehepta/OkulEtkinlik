extends "res://tests/helpers/template_harness.gd"
## Faz 3c: gerçek 1. sınıf Matematik içeriğindeki her tur kendi şablonunda hatasız kurulur;
## dokunma hedefleri ≥128 px, ekranın içinde ve Bilge köşesinin dışındadır.

const UNIT_DIR: String = "res://content/g1/matematik"
const SCREEN: Rect2 = Rect2(0, 0, 1920, 1080)
## Bilge sol alt köşede durur (Faz 3b düzeni).
const BILGE_CORNER: Rect2 = Rect2(16, 724, 250, 344)

func _rounds() -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	var files: PackedStringArray = DirAccess.get_files_at(UNIT_DIR)
	files.sort()
	for f: String in files:
		if not f.ends_with(".json"):
			continue
		var unit: Dictionary = JSON.parse_string(FileAccess.get_file_as_string(UNIT_DIR.path_join(f)))
		for n: Dictionary in unit["nodes"]:
			var i: int = 0
			for r: Dictionary in n["rounds"]:
				i += 1
				out.append({"where": "%s r%02d" % [n["id"], i], "round": r})
	return out

func test_every_round_sets_up_with_reachable_targets() -> void:
	var rounds: Array[Dictionary] = _rounds()
	assert_gt(rounds.size(), 100, "1. sınıf Matematik turları")
	for item: Dictionary in rounds:
		var r: Dictionary = item["round"]
		var params: Dictionary = _normalize(r["params"])
		var g: MiniGame = make(str(r["template"]), params, int(r["difficulty"]))
		await wait_frames(2)
		# drag_match (Faz 1) touch_targets sunmuyor; yalnızca hatasız kurulması denetlenir.
		if not g.has_method("touch_targets"):
			g.queue_free()
			await wait_frames(1)
			continue
		var targets: Array[Control] = g.call("touch_targets")
		assert_gt(targets.size(), 0, "%s: dokunma hedefi yok" % item["where"])
		for c: Control in targets:
			var rect: Rect2 = c.get_global_rect()
			assert_true(c.size.x >= 128.0 and c.size.y >= 128.0, "%s: %s küçük %s" % [item["where"], c.name, c.size])
			assert_true(SCREEN.encloses(rect.grow(-1.0)), "%s: %s ekran dışında %s" % [item["where"], c.name, rect])
			assert_false(BILGE_CORNER.intersects(rect.grow(-1.0)), "%s: %s Bilge köşesinde %s" % [item["where"], c.name, rect])
		g.queue_free()
		await wait_frames(1)

## JSON sayıları float gelir; ContentDB gibi tam sayılara çevirir.
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
