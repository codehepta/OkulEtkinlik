extends GutTest
## 1. sınıf Türkçe içeriğinin her turu kendi şablonunda kurulur ve ipucu 2 ile sonuna kadar
## oynanır (tur hiçbir içerikte takılı kalmamalı). Süre ölçeği testi hızlandırır.

const FakeServices: GDScript = preload("res://tests/helpers/fake_services.gd")
const UNIT_DIR: String = "res://content/g1/turkce"
const TIME_SCALE: float = 25.0
const ROUND_TIMEOUT: float = 60.0

var _fake: Node = null

func before_all() -> void:
	Engine.time_scale = TIME_SCALE

func after_all() -> void:
	Engine.time_scale = 1.0

func before_each() -> void:
	_fake = FakeServices.new()
	add_child_autofree(_fake)

func _rounds() -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	for f: String in DirAccess.get_files_at(UNIT_DIR):
		if not f.ends_with(".json"):
			continue
		var unit: Dictionary = JSON.parse_string(FileAccess.get_file_as_string(UNIT_DIR.path_join(f)))
		for node: Dictionary in unit["nodes"]:
			var i: int = 0
			for r: Dictionary in node["rounds"]:
				i += 1
				out.append({"id": "%s r%d" % [node["id"], i], "round": r})
	return out

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

func test_every_round_sets_up_and_finishes_with_hint() -> void:
	var rounds: Array[Dictionary] = _rounds()
	assert_gt(rounds.size(), 200, "Türkçe 1 turları yüklendi")
	for item: Dictionary in rounds:
		var r: Dictionary = _normalize(item["round"])
		var scene: PackedScene = load(TemplateRegistry.SCENES[r["template"]]) as PackedScene
		var game: MiniGame = scene.instantiate() as MiniGame
		game.narrator = _fake
		game.audio = _fake
		add_child(game)
		var ctx: RoundContext = RoundContext.new()
		ctx.rng.seed = 11
		ctx.voice_id = str(r["voice"])
		ctx.outcomes = PackedStringArray(["TEST.1"])
		var done: Array[bool] = [false]
		game.finished.connect(func(_res: RoundResult) -> void: done[0] = true)
		game.setup(r["params"], int(r["difficulty"]), ctx)
		var waited: float = 0.0
		while not done[0] and waited < ROUND_TIMEOUT:
			game.show_hint(2)
			await get_tree().create_timer(0.5).timeout
			waited += 0.5
		assert_true(done[0], item["id"] + " ipucu 2 ile bitti")
		game.queue_free()
		await get_tree().process_frame
