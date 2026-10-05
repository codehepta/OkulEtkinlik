extends SceneTree
## Uyarlanabilir zorluk raporu (geliştirici aracı, Faz 7b).
## Kullanım: godot --headless --path . -s res://tools/adaptive_report.gd
## Gerçek ünitelerle sahte oyuncu simülasyonunu çalıştırır; güncel eşikler (tuned) ile
## Faz 7b öncesi kuralı (legacy) yan yana yazar. Her zaman 0 ile çıkar.

const Sim: GDScript = preload("res://tools/adaptive_sim.gd")
const SEEDS: int = 8
const COLUMNS: PackedStringArray = ["first_try", "helped", "delta_level", "below_base", "above_base", "star3", "star1"]

func _initialize() -> void:
	var nodes: Array = Sim.load_nodes()
	print("Uyarlanabilir zorluk simülasyonu: %d durak, %d tohum ortalaması" % [nodes.size(), SEEDS])
	print("| kural | oyuncu | %s |" % " | ".join(COLUMNS))
	print("|---|---|%s" % "---|".repeat(COLUMNS.size()))
	for mode: String in Sim.MODES:
		for profile: String in Sim.PROFILES:
			var r: Dictionary = Sim.average(nodes, profile, SEEDS, mode)
			var cells: PackedStringArray = PackedStringArray()
			for c: String in COLUMNS:
				cells.append("%+.2f" % r[c] if c == "delta_level" else "%.2f" % r[c])
			print("| %s | %s | %s |" % [mode, profile, " | ".join(cells)])
	quit(0)
