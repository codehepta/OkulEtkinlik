extends SceneTree
# Geliştirici aracı: mağaza ekran görüntüleri. Pencere boyutu cihazın piksel ölçüsüdür; çıktı
# build/store/<ad>/ altına gider. macOS'ta (Retina) her cihaz için bir kez çalıştırılır:
#   godot --path . --resolution 2868x1320 -s res://tools/store_screenshots.gd -- iphone_69
#   godot --path . --resolution 2752x2064 -s res://tools/store_screenshots.gd -- ipad_13
#   godot --path . --resolution 1920x1080 -s res://tools/store_screenshots.gd -- android_phone
#   godot --path . --resolution 2560x1600 -s res://tools/store_screenshots.gd -- android_tablet
# Gerçek kayıt dosyasına dokunmaz (user://store_shots kullanır). Ses kapalıdır; altyazı balonu
# her kareden önce kapatılır.

const OUT_ROOT: String = "res://build/store"
## [dosya adı, ders düğümü]: her biri farklı bir oyun türünün ilk turu.
const LESSONS: Array = [
	["04_sayma", "g1.matematik.u02.n01"],
	["05_harf_izleme", "g1.turkce.u01.n03"],
	["06_eslestirme_fen", "g3.fen.u02.n02"],
	["06b_senaryo_fen", "g3.fen.u01.n01"],
	["07_siniflama", "g1.hayat_bilgisi.u02.n01"],
	["08_saat_para", "g2.matematik.u04.n05"],
	["09_kesir", "g2.matematik.u04.n01"],
	["10_kodlama", "g1.matematik.u01.n02"],
	["11_terazi", "g1.matematik.u02.n08"],
]

## Ders açılınca giriş seslendirmesi ve tur kurulumu için beklenen süre (sn).
const LESSON_WAIT_S: float = 9.0

var _app: Node
var _out: String = ""
var _shots: int = 0

func _initialize() -> void:
	_run.call_deferred()

func _run() -> void:
	var args: PackedStringArray = OS.get_cmdline_user_args()
	var label: String = args[0] if not args.is_empty() else "%dx%d" % [root.size.x, root.size.y]
	_out = OUT_ROOT.path_join(label)
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(_out))
	var ignore: String = ProjectSettings.globalize_path("res://build/.gdignore")
	if not FileAccess.file_exists(ignore):
		FileAccess.open(ignore, FileAccess.WRITE).close()
	AudioServer.set_bus_mute(0, true)
	var save: Node = root.get_node("SaveService")
	save.set_base_dir("user://store_shots")
	for f: String in ["save_v1.json", "save_v1.bak.json", "save_v1.tmp.json"]:
		DirAccess.remove_absolute(ProjectSettings.globalize_path("user://store_shots/" + f))
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path("user://store_shots"))
	save.load_or_create()
	_app = root.get_node("AppState")
	var narrator: Node = root.get_node("Narrator")
	narrator.tts_voice_lookup = func() -> Array: return []
	narrator.duration_scale = 0.05

	await _show("splash", {})
	await _frames(150)
	await _shot("01_acilis")
	var progress: Node = root.get_node("Progress")
	var pid: String = progress.create_profile("avatar.kedi", "Ece", 2)
	_app.select_profile(pid)
	_earn_stars(pid)
	await _show("world_map", {})
	await _shot("02_harita")
	await _show("region_path", {"subject": "hayat_bilgisi"})
	await _shot("03_patika")
	for l: Array in LESSONS:
		await _show("lesson", {"node_id": str(l[1])})
		# Tur, giriş seslendirmesi bitince açılır; kare sayısı ekran tazelemesine bağlı olduğundan süre beklenir.
		await create_timer(LESSON_WAIT_S).timeout
		await _shot(str(l[0]))
	var items: PackedStringArray = progress.decor_unlocked(pid)
	for i: int in mini(items.size(), 3):
		progress.place_decor(pid, items[i], Vector2(0.25 + 0.25 * i, 0.62))
	await _show("tree_house", {})
	await _shot("12_agac_evi")
	await _show("album", {})
	await _shot("13_album")
	await _show("parent_gate", {"next": {"scene": "parent_panel", "args": {}}})
	await _show("parent_panel", {})
	_app.current_scene().select_tab("home")
	await _shot("14_veli_paneli")
	print("store_screenshots: %d görüntü -> %s" % [_shots, ProjectSettings.globalize_path(_out)])
	quit(0)

## Ağaç Evi süsleri ve albüm çıkartmaları açık görünsün diye örnek ilerleme yazar.
func _earn_stars(pid: String) -> void:
	for p: Variant in root.get_node("SaveService").data["profiles"]:
		if str((p as Dictionary)["id"]) != pid:
			continue
		var nodes: Dictionary = (p as Dictionary)["nodes"]
		for i: int in 12:
			nodes["g2.ornek.u99.n%02d" % i] = {"best_stars": 3, "plays": 1}
		(p as Dictionary)["stickers"] = ["st.matematik.elma", "st.matematik.balon", "st.matematik.kelebek", "st.turkce.g1_kalem", "st.turkce.g1_ari", "st.hayat_bilgisi.okul_zili", "st.hayat_bilgisi.havuc", "st.fen.buyutec"]

func _show(scene: String, args: Dictionary) -> void:
	_app.goto(scene, args)
	await _frames(45)

func _frames(n: int) -> void:
	for i: int in n:
		await process_frame

func _shot(name: String) -> void:
	root.get_node("Narrator").stop()
	await _frames(20)
	await RenderingServer.frame_post_draw
	var img: Image = root.get_texture().get_image()
	img.save_png(ProjectSettings.globalize_path(_out.path_join(name + ".png")))
	_shots += 1
