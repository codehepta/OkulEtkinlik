extends "res://tests/helpers/template_harness.gd"
## Faz 3e duman testi: Matematik 3 ünitelerinin her turu gerçek şablon sahnesinde kurulur,
## dokunma hedefi bildiren şablonlarda hedefler ≥128 px'tir ve tur yalnızca doğru cevaplarla sonuna kadar oynanabilir.

const DIR: String = "res://content/g3/matematik"
const MAX_STEPS: int = 40

func _rounds() -> Array[Dictionary]:
	var res: Array[Dictionary] = []
	for f: String in DirAccess.get_files_at(DIR):
		if not (f.begins_with("u") and f.ends_with(".json")):
			continue
		var u: Dictionary = JSON.parse_string(FileAccess.get_file_as_string(DIR.path_join(f)))
		for n: Dictionary in u["nodes"]:
			var i: int = 0
			for r: Dictionary in n["rounds"]:
				i += 1
				res.append({"id": "%s.r%02d" % [n["id"], i], "round": r})
	return res

func test_every_round_plays_to_the_end() -> void:
	var rounds: Array[Dictionary] = _rounds()
	assert_gt(rounds.size(), 100, "Matematik 3 turları yüklenmeli")
	for entry: Dictionary in rounds:
		var r: Dictionary = entry["round"]
		answers = []
		results = []
		var g: MiniGame = make(str(r["template"]), (r["params"] as Dictionary).duplicate(true), int(r["difficulty"]), 7, 3)
		await wait_frames(2)
		if g.has_method("touch_targets"):
			assert_touch_targets(g)
		for step: int in MAX_STEPS:
			if results.size() > 0:
				break
			await wait_until(func() -> bool: return g._can_input() or results.size() > 0, 4.0)
			if results.size() > 0:
				break
			g.call("_debug_answer", true)
			await wait_frames(1)
		await wait_until(func() -> bool: return results.size() > 0, 4.0)
		assert_eq(results.size(), 1, "%s (%s) bitmeli" % [entry["id"], r["template"]])
		assert_false(answers.has(false), "%s: doğru cevap yanlış sayıldı" % entry["id"])
		g.queue_free()
		await wait_frames(1)
