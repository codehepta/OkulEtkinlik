extends SceneTree
# Geliştirici aracı: bütün ekranların ekran görüntüsünü build/screens/ altına alır.
# Görüntü için sanal ekran gerekir:
#   xvfb-run -s "-screen 0 1920x1080x24" godot --path . --rendering-method gl_compatibility \
#     --rendering-driver opengl3 --resolution 1920x1080 -s res://tools/ui_screenshots.gd
# Gerçek kayıt dosyasına dokunmaz (user://ui_shots kullanır).

const OUT_DIR: String = "res://build/screens"

var _app: Node
var _shots: int = 0

func _initialize() -> void:
	_run.call_deferred()

func _run() -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(OUT_DIR))
	var save: Node = root.get_node("SaveService")
	save.set_base_dir("user://ui_shots")
	for f: String in ["save_v1.json", "save_v1.bak.json", "save_v1.tmp.json"]:
		DirAccess.remove_absolute(ProjectSettings.globalize_path("user://ui_shots/" + f))
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path("user://ui_shots"))
	save.load_or_create()
	_app = root.get_node("AppState")
	_app.splash_delay = 999.0
	var narrator: Node = root.get_node("Narrator")
	narrator.tts_voice_lookup = func() -> Array: return []
	narrator.duration_scale = 0.05

	await _show("splash", {})
	await _shot("01_splash")
	await _show("profile_create", {})
	await _shot("02_profile_create_avatar")
	var pc: Node = _app.current_scene()
	if pc.has_method("pick_avatar"):
		pc.pick_avatar("avatar.tavsan")
		await _frames(10)
		await _shot("03_profile_create_grade")
		pc.pick_grade(1)
		await _frames(10)
		await _shot("04_profile_create_nickname")
	var progress: Node = root.get_node("Progress")
	if progress.profiles().is_empty():
		progress.create_profile("avatar.tavsan", "", 1)
	progress.create_profile("avatar.kedi", "Ece", 2)
	var pid: String = str(progress.profiles()[0]["id"])
	await _show("profile_select", {})
	await _shot("05_profile_select")
	_app.select_profile(pid)
	await _show("world_map", {})
	await _shot("06_world_map")
	await _show("region_path", {"subject": "matematik"})
	await _shot("07_region_path")
	await _show("lesson", {"node_id": "g1.matematik.u01.n01"})
	await _frames(240)
	await _shot("08_lesson_count_choose")
	await _show("lesson", {"node_id": "g1.matematik.u01.n02"})
	await _frames(240)
	await _shot("09_lesson_drag_match")
	await _show("lesson", {"node_id": "g1.matematik.u01.n03"})
	await _frames(300)
	await _shot("10_lesson_listen_find")
	await _show("result", {"node_id": "g1.matematik.u01.n01", "stars": 3, "new_sticker": "st.matematik.elma", "unlocked": "g1.matematik.u01.n02", "subject": "matematik"})
	await _frames(240)
	await _shot("11_result")
	await _show("album", {})
	await _shot("12_album")
	await _show("parent_gate", {"next": {"scene": "parent_panel", "args": {}}})
	await _shot("13_parent_gate")
	await _show("parent_panel", {})
	await _shot("14_parent_panel")
	await _show("session_end", {})
	await _shot("15_session_end")

	# --- Harita ve patika ek kareleri (1. ve 3. sınıf haritası, ilk durak bitince patika) ---
	_app.select_profile(pid)
	await _show("world_map", {})
	await _shot("20_world_map_grade1")
	var g3: String = progress.create_profile("avatar.kedi", "Ali", 3)
	_app.select_profile(g3)
	await _show("world_map", {})
	await _shot("21_world_map_grade3")
	_app.select_profile(pid)
	var no_results: Array[RoundResult] = []
	progress.record_node(pid, "g1.matematik.u01.n01", no_results)
	await _show("region_path", {"subject": "matematik", "highlight": "g1.matematik.u01.n02"})
	await _frames(30)
	await _shot("22_region_path_after_n01")
	var path_scene: Node = _app.current_scene()
	var scroll: ScrollContainer = null
	for c: Node in path_scene.get_children():
		if c is ScrollContainer:
			scroll = c as ScrollContainer
	if scroll != null:
		scroll.scroll_horizontal = 100000
		await _frames(30)
		await _shot("23_region_path_scrolled_end")
	# --- ek kareler sonu ---
	print("ui_screenshots: %d görüntü -> %s" % [_shots, ProjectSettings.globalize_path(OUT_DIR)])
	quit(0)

func _show(scene: String, args: Dictionary) -> void:
	_app.goto(scene, args)
	await _frames(45)

func _frames(n: int) -> void:
	for i: int in n:
		await process_frame

func _shot(name: String) -> void:
	await RenderingServer.frame_post_draw
	var img: Image = root.get_texture().get_image()
	img.save_png(ProjectSettings.globalize_path(OUT_DIR + "/" + name + ".png"))
	_shots += 1
