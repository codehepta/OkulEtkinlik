extends GutTest
## Faz 7b: uyarlanabilir zorluk, gerçek ünitelerle sahte oyuncu simülasyonunda hedefleri tutar.
## Hedefler: güçlü oyuncu tabanın üstünde zorlanır ve tabanın altında oynamaz; orta oyuncunun
## ilk deneme başarısı akış bölgesinde kalır; zorlanan oyuncu tabanın üstüne itilmez ve çözüm
## gösterilen tur oranı düşüktür. Eşikler: scripts/core/adaptive_config.gd.

const Sim: GDScript = preload("res://tools/adaptive_sim.gd")
const SEEDS: int = 4

var _nodes: Array = []
var _tuned: Dictionary = {}
var _legacy: Dictionary = {}

func before_all() -> void:
	_nodes = Sim.load_nodes()
	for profile: String in Sim.PROFILES:
		_tuned[profile] = Sim.average(_nodes, profile, SEEDS, "tuned")
		_legacy[profile] = Sim.average(_nodes, profile, SEEDS, "legacy")
		gut.p("%s tuned %s" % [profile, _tuned[profile]])

func test_uses_real_content() -> void:
	assert_gt(_nodes.size(), 300, "bütün sınıfların durakları")

func test_strong_player_is_challenged() -> void:
	var r: Dictionary = _tuned["guclu"]
	assert_gt(float(r["delta_level"]), 0.3, "güçlü oyuncu tabanın üstünde oynar")
	assert_lt(float(r["below_base"]), 0.05, "güçlü oyuncu tabanın altına düşmez")
	assert_lt(float(r["below_base"]), float(_legacy["guclu"]["below_base"]), "eski kurala göre daha az kolay tur")

func test_average_player_stays_in_flow() -> void:
	var r: Dictionary = _tuned["orta"]
	assert_between(float(r["first_try"]), 0.72, 0.9, "ilk deneme başarısı akış bölgesinde")
	assert_lt(float(r["helped"]), 0.02)

func test_struggling_player_is_not_pushed() -> void:
	var r: Dictionary = _tuned["zorlanan"]
	assert_lt(float(r["delta_level"]), 0.05, "zorlanan oyuncu tabanın üstüne itilmez")
	assert_lt(float(r["helped"]), 0.04, "çözüm gösterilen tur az")

func test_levels_order_by_skill() -> void:
	var g: float = float(_tuned["guclu"]["delta_level"])
	var o: float = float(_tuned["orta"]["delta_level"])
	var z: float = float(_tuned["zorlanan"]["delta_level"])
	assert_gt(g, o)
	assert_gt(o, z)

func test_simulation_is_deterministic() -> void:
	var a: Dictionary = Sim.run(_nodes, "orta", 7, "tuned")
	var b: Dictionary = Sim.run(_nodes, "orta", 7, "tuned")
	assert_eq(a, b)
