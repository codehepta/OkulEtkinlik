extends SceneTree
## Düşük cihaz performans ölçümü (geliştirici aracı, Faz 8).
## Kullanım: godot --headless --path . -s res://tools/perf_probe.gd
## Gerçek içeriği ContentDB ile yükler (açılış maliyeti), sonra her şablonun içerikteki en
## kalabalık turunu kurar ve kurulum süresini, düğüm sayısını ve bellek artışını ölçer.
## Sonuç stdout'a ve build/perf_probe.md'ye yazılır. Masaüstü işlemcide ölçülür; düşük
## cihazda süreler kabaca 5–8 kat uzar. Bütçe aşımı uyarı olarak işaretlenir, çıkış her zaman 0.

const FakeServices: GDScript = preload("res://tests/helpers/fake_services.gd")
const REPORT_PATH: String = "res://build/perf_probe.md"
## Masaüstü bütçeleri (ms): düşük cihazda ~6 katı hedef üst sınırı aşmamalı.
const CONTENT_LOAD_BUDGET_MS: float = 400.0
const SETUP_BUDGET_MS: float = 50.0
const NODE_BUDGET: int = 600

func _initialize() -> void:
	_run.call_deferred()

func _run() -> void:
	var lines: PackedStringArray = PackedStringArray()
	lines.append("# Performans ölçümü (masaüstü, headless)")
	var mem0: int = OS.get_static_memory_usage()
	var t0: int = Time.get_ticks_usec()
	var db: Node = load("res://autoload/content_db.gd").new()
	root.add_child(db)
	db.load_all()
	var load_ms: float = (Time.get_ticks_usec() - t0) / 1000.0
	var heaviest: Dictionary = _heaviest_rounds(db)
	lines.append("")
	lines.append("İçerik yükleme: %.1f ms%s, bellek +%.1f MB, %d şablon" % [load_ms, _flag(load_ms > CONTENT_LOAD_BUDGET_MS), (OS.get_static_memory_usage() - mem0) / 1048576.0, heaviest.size()])
	lines.append("")
	lines.append("Şablonlar ısınma turundan sonra ölçülür (ilk yükleme maliyeti hariç).")
	lines.append("")
	lines.append("| şablon | tur | kurulum ms | düğüm | bellek MB |")
	lines.append("|---|---|---|---|---|")
	var fake: Node = FakeServices.new()
	root.add_child(fake)
	var ids: Array = heaviest.keys()
	ids.sort()
	# Isınma turu: yazı tipi ve ortak kaynakların ilk yüklenmesi ölçüme karışmasın.
	for id: String in ids:
		await _setup_once(heaviest[id], id, fake)
	for id: String in ids:
		var item: Dictionary = heaviest[id]
		var scene: PackedScene = load(TemplateRegistry.SCENES[id]) as PackedScene
		var m0: int = OS.get_static_memory_usage()
		var n0: int = int(Performance.get_monitor(Performance.OBJECT_NODE_COUNT))
		var s0: int = Time.get_ticks_usec()
		# MiniGame tipi kullanılmaz: araç betiği autoload'lar kaydolmadan derlenir.
		var game: Node = scene.instantiate()
		game.set("narrator", fake)
		game.set("audio", fake)
		root.add_child(game)
		var ctx: RoundContext = RoundContext.new()
		ctx.rng.seed = 7
		ctx.voice_id = str(item["round"].get("voice", ""))
		ctx.grade = int(item["grade"])
		game.call("setup", item["round"].get("params", {}), 3, ctx)
		await process_frame
		var ms: float = (Time.get_ticks_usec() - s0) / 1000.0
		var nodes: int = int(Performance.get_monitor(Performance.OBJECT_NODE_COUNT)) - n0
		var mb: float = (OS.get_static_memory_usage() - m0) / 1048576.0
		lines.append("| %s | %s | %.1f%s | %d%s | %.2f |" % [id, item["where"], ms, _flag(ms > SETUP_BUDGET_MS), nodes, _flag(nodes > NODE_BUDGET), mb])
		game.queue_free()
		await process_frame
	var text: String = "\n".join(lines) + "\n"
	print(text)
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path("res://build"))
	var f: FileAccess = FileAccess.open(REPORT_PATH, FileAccess.WRITE)
	if f != null:
		f.store_string(text)
	quit(0)

func _setup_once(item: Dictionary, id: String, fake: Node) -> void:
	var game: Node = (load(TemplateRegistry.SCENES[id]) as PackedScene).instantiate()
	game.set("narrator", fake)
	game.set("audio", fake)
	root.add_child(game)
	var ctx: RoundContext = RoundContext.new()
	ctx.grade = int(item["grade"])
	game.call("setup", item["round"].get("params", {}), 3, ctx)
	await process_frame
	game.queue_free()
	await process_frame

func _flag(over: bool) -> String:
	return " ⚠" if over else ""

## Her şablon için params JSON'u en uzun tur (en kalabalık sahne).
func _heaviest_rounds(db: Node) -> Dictionary:
	var out: Dictionary = {}
	for grade: int in [1, 2, 3]:
		for subject: String in db.subjects_for_grade(grade):
			for u: Dictionary in db.units(grade, subject):
				for n: Dictionary in u["nodes"]:
					var i: int = 0
					for r: Dictionary in n["rounds"]:
						i += 1
						var id: String = str(r.get("template", ""))
						if not TemplateRegistry.has(id):
							continue
						var size: int = JSON.stringify(r.get("params", {})).length()
						if not out.has(id) or size > int(out[id]["size"]):
							out[id] = {"size": size, "round": r, "grade": grade, "where": "%s r%02d" % [n.get("id", ""), i]}
	return out
