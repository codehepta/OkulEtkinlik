extends GutTest
## Faz 3 şablon oyun testlerinin ortak tabanı: sahneyi örnekler, sahte Narrator/Audio bağlar,
## answered / finished sinyallerini kaydeder. Dosya adı "test_" ile başlamadığı için GUT bunu
## kendi başına çalıştırmaz.

const FakeServices: GDScript = preload("res://tests/helpers/fake_services.gd")
const FIXTURE_PATH: String = "res://tests/fixtures/faz3/params.json"

var fake: Node = null
var answers: Array[bool] = []
var results: Array[RoundResult] = []

func before_each() -> void:
	answers = []
	results = []
	fake = FakeServices.new()
	add_child_autofree(fake)

func make(id: String, params: Dictionary, difficulty: int = 1, rng_seed: int = 7) -> MiniGame:
	var scene: PackedScene = load(TemplateRegistry.SCENES[id]) as PackedScene
	var game: MiniGame = scene.instantiate() as MiniGame
	game.narrator = fake
	game.audio = fake
	add_child_autofree(game)
	var ctx: RoundContext = RoundContext.new()
	ctx.rng.seed = rng_seed
	ctx.voice_id = "vo.test"
	ctx.outcomes = PackedStringArray(["TEST.1"])
	game.answered.connect(func(c: bool) -> void: answers.append(c))
	game.finished.connect(func(r: RoundResult) -> void: results.append(r))
	game.setup(params, difficulty, ctx)
	return game

## Fixture dosyasındaki örnek params (ad -> {"template", "params"}).
static func fixture(name: String) -> Dictionary:
	var data: Variant = JSON.parse_string(FileAccess.get_file_as_string(FIXTURE_PATH))
	return ((data as Dictionary)[name] as Dictionary).duplicate(true)

## Kilidin açılmasını bekler (yanlış cevaptan sonra).
func wait_unlocked(g: MiniGame, timeout: float = 3.0) -> void:
	await wait_until(func() -> bool: return g._can_input(), timeout)

## Dokunma hedeflerinin hepsi ≥128×128 mi?
func assert_touch_targets(g: MiniGame) -> void:
	var targets: Array[Control] = g.call("touch_targets")
	assert_gt(targets.size(), 0, "dokunma hedefi olmalı")
	for c: Control in targets:
		assert_true(c.size.x >= 128.0 and c.size.y >= 128.0, "%s ≥128 px olmalı: %s" % [c.name, c.size])
