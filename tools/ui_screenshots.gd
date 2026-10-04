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
	await _shot_with_subtitle("02b_profile_create_subtitle", "vo.genel.avatar_sec")
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
	await _shot_with_subtitle("05b_profile_select_subtitle", "vo.genel.profil_sec")
	_app.select_profile(pid)
	await _show("world_map", {})
	await _shot("06_world_map")
	await _shot_with_subtitle("06b_world_map_subtitle", "vo.bolge.kilitli_lab")
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
	await _shot_with_subtitle("11b_result_subtitle", "vo.genel.cikartma")
	await _show("album", {})
	await _shot("12_album")
	await _show("parent_gate", {"next": {"scene": "parent_panel", "args": {}}})
	await _shot("13_parent_gate")
	await _shot_with_subtitle("13b_parent_gate_subtitle", "vo.genel.veli_cagir")
	await _show("parent_panel", {})
	await _shot("14_parent_panel")
	await _shot_with_subtitle("14b_parent_panel_no_subtitle", "vo.genel.veli_cagir")
	var panel: Node = _app.current_scene()
	var scroll: ScrollContainer = _find_scroll(panel)
	if scroll != null:
		scroll.scroll_vertical = 900
		await _frames(10)
		await _shot("14c_parent_panel_settings")
		scroll.scroll_vertical = 100000
		await _frames(10)
		await _shot("14d_parent_panel_actions")
	if panel.has_method("request_delete"):
		panel.request_delete()
		await _frames(10)
		await _shot("14e_parent_panel_delete_dialog")
		(panel.call("delete_dialog") as Window).hide()
	await _show("session_end", {})
	await _shot("15_session_end")

	# --- Ders ekranları: ek kareler (yanlış cevap + ipucu 1, kalabalık sayma, eşleşme ortası) ---
	await _lesson_extras()
	print("ui_screenshots: %d görüntü -> %s" % [_shots, ProjectSettings.globalize_path(OUT_DIR)])
	quit(0)

## Uzun süren bir satırla altyazı balonu ekrandayken görüntü alır, sonra anlatımı keser.
func _shot_with_subtitle(name: String, line_id: String) -> void:
	var narrator: Node = root.get_node("Narrator")
	var scale: float = float(narrator.get("duration_scale"))
	narrator.set("duration_scale", 5.0)
	narrator.say(line_id)
	await _frames(30)
	await _shot(name)
	narrator.stop()
	narrator.set("duration_scale", scale)
	await _frames(2)

func _find_scroll(n: Node) -> ScrollContainer:
	for c: Node in n.get_children():
		if c is ScrollContainer:
			return c as ScrollContainer
	return null

## Ders şablonlarının ara durumları. Yanlış cevaplar runner'ın gerçek geri bildirim akışından geçer.
func _lesson_extras() -> void:
	# count_choose: iki yanlış -> ipucu 1 (nesneler sırayla zıplar).
	await _show("lesson", {"node_id": "g1.matematik.u01.n01"})
	await _wait_game()
	await _wrong_twice()
	await _frames(20)
	await _shot("16_lesson_count_choose_hint1")
	# Kalabalık sayma: 6 ve 11 nesne.
	await _show("lesson", {"node_id": "g1.matematik.u01.n04"})
	await _wait_game()
	await _shot("17_lesson_count_choose_6")
	await _show("lesson", {"node_id": "g1.matematik.u01.n05"})
	await _wait_game()
	await _shot("18_lesson_count_choose_11")
	# 20 nesne: şablon doğrudan runner'ın oyun alanına kurulur (yalnızca görüntü için).
	var runner: Node = _app.current_scene()
	var area: Control = runner.get_node("Host/GameArea") as Control
	for c: Node in area.get_children():
		c.queue_free()
	var cc: Control = (load("res://scenes/games/count_choose/count_choose.tscn") as PackedScene).instantiate() as Control
	area.add_child(cc)
	var ctx: RoundContext = RoundContext.new()
	ctx.rng.seed = 3
	cc.call("setup", {"item": "item.oyuncak.top", "count": 20, "choices": [18, 19, 20]}, 1, ctx)
	await _frames(20)
	await _shot("19_lesson_count_choose_20")
	# 4 çiftli drag_match, bir çift yerleşmiş (yalnızca görüntü için doğrudan kurulur).
	cc.queue_free()
	var dm4: Control = (load("res://scenes/games/drag_match/drag_match.tscn") as PackedScene).instantiate() as Control
	area.add_child(dm4)
	var pairs: Array = []
	for v: int in [2, 3, 4, 5]:
		pairs.append({"left": {"type": "text", "value": "label.cetele.%d" % v}, "right": {"type": "number", "value": v}})
	dm4.call("setup", {"pairs": pairs}, 1, ctx)
	await _frames(5)
	var s4: Array = dm4.call("_debug_right_slots")
	dm4.call("_debug_drop", 1, s4.find(1))
	await _frames(30)
	await _shot("19b_lesson_drag_match_4_pairs")
	# drag_match: bir eşleşme yapılmış, sonra iki yanlış -> ipucu 1 (doğru yuva parlar).
	await _show("lesson", {"node_id": "g1.matematik.u01.n02"})
	await _wait_game()
	var dm: Node = _runner_game()
	var slots: Array = dm.call("_debug_right_slots")
	await _frames(10)
	if slots.size() >= 3:
		dm.call("_debug_drop", 2, slots.find(2))
		await _frames(30)
	await _wrong_twice()
	await _frames(20)
	await _shot("20_lesson_drag_match_hint1")
	# listen_find: iki yanlış -> ipucu 1 (bir yanlış seçenek soluklaşır).
	await _show("lesson", {"node_id": "g1.matematik.u01.n03"})
	await _wait_game()
	await _wrong_twice()
	await _frames(30)
	await _shot("21_lesson_listen_find_hint1")

func _runner_game() -> Node:
	var runner: Node = _app.current_scene()
	return runner.call("current_game") if runner != null and runner.has_method("current_game") else null

## Turun oyunu kurulup girdiye açılana kadar bekler.
func _wait_game() -> void:
	for i: int in 600:
		var g: Node = _runner_game()
		if g != null and g.has_method("_can_input") and bool(g.call("_can_input")):
			break
		await process_frame
	await _frames(20)

## Şimdiki oyunda iki kez yanlış cevap verir; her seferinde runner'ın geri bildirimini bekler.
func _wrong_twice() -> void:
	for k: int in 2:
		var g: Node = _runner_game()
		if g == null:
			return
		if g.has_method("_debug_correct_index"):
			var right: int = int(g.call("_debug_correct_index"))
			g.call("_debug_choose", 0 if right != 0 else 1)
		elif g.has_method("_debug_right_slots"):
			var slots: Array = g.call("_debug_right_slots")
			var left: int = (g.get("_matched") as Array).find(false)
			var wrong_slot: int = 0 if int(slots[0]) != left else 1
			g.call("_debug_drop", left, wrong_slot)
		await _frames(5)
		await _wait_game()

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
