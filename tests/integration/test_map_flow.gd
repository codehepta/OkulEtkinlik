extends GutTest
## Harita akışı: dünya haritası, patika, ders -> sonuç -> devam, çıkartma albümü.

const FakeServices: GDScript = preload("res://tests/helpers/fake_services.gd")
const ROOT: String = "res://tests/fixtures/lesson"
const STICKERS: String = "res://tests/fixtures/stickers.json"
const SAVE_DIR: String = "user://map_flow_test"
const N1: String = "g1.matematik.u01.n01"
const N2: String = "g1.matematik.u01.n02"

var _fake: Node = null
var _save: Node = null
var _db: Node = null
var _progress: Node = null
var _timer: Node = null
var _app: Node = null
var _root: Node = null

func before_each() -> void:
	DirAccess.make_dir_recursive_absolute(SAVE_DIR)
	_fake = FakeServices.new()
	add_child_autofree(_fake)
	_save = load("res://autoload/save_service.gd").new()
	_save.set_base_dir(SAVE_DIR)
	_save.load_or_create()
	_db = load("res://autoload/content_db.gd").new()
	_db.outcomes_path = "res://tests/fixtures/outcomes.json"
	_db.has_string = func(_k: String) -> bool: return true
	_db.has_voice = func(_k: String) -> bool: return true
	_db.load_all(ROOT)
	_progress = load("res://autoload/progress.gd").new()
	_progress.save = _save
	_progress.content = _db
	_timer = load("res://autoload/session_timer.gd").new()
	_timer.save = _save
	add_child_autofree(_timer)
	_root = Node.new()
	add_child_autofree(_root)
	_app = load("res://autoload/app_state.gd").new()
	_app.progress = _progress
	_app.session_timer = _timer
	_app.narrator = _fake
	_app.audio = _fake
	_app.save = _save
	_app.content = _db
	_app.scene_root = _root
	_app.stickers_path = STICKERS
	_app.anim_scale = 0.0

func after_each() -> void:
	for f: String in DirAccess.get_files_at(SAVE_DIR):
		DirAccess.remove_absolute(SAVE_DIR.path_join(f))
	_app.free()
	_progress.free()
	_db.free()
	_save.free()

func _screen() -> Node:
	return _app.current_scene()

func _login(grade: int) -> String:
	var id: String = _progress.create_profile("avatar.kedi", "T", grade)
	_app.select_profile(id)
	return id

func _win_lesson() -> void:
	var ok: bool = await wait_until(func() -> bool: return _screen().current_game() != null, 6.0)
	assert_true(ok, "oyun açılmalı")
	for i: int in 3:
		var idx: int = _screen().current_round_index()
		_screen().current_game().call("_debug_choose", 1)
		await wait_until(func() -> bool: return _app.current_scene_name() != "lesson" or _screen().current_round_index() != idx, 6.0)
		if _app.current_scene_name() != "lesson":
			return
		await wait_until(func() -> bool: return _screen().current_game() != null, 6.0)

func test_fen_locked_for_grade_1_open_for_grade_3() -> void:
	_login(1)
	_app.goto("world_map")
	assert_true(_screen().region_locked("fen"))
	assert_false(_screen().region_locked("matematik"))
	assert_true(_fake.said.has("vo.genel.harita_giris"))
	assert_true(_fake.music.has("music.menu"))

func test_fen_locked_for_grade_2() -> void:
	_login(2)
	_app.goto("world_map")
	assert_true(_screen().region_locked("fen"))

func test_fen_open_for_grade_3() -> void:
	_login(3)
	_app.goto("world_map")
	assert_false(_screen().region_locked("fen"))

func test_locked_lab_tap_says_locked_voice_and_stays() -> void:
	_login(1)
	_app.goto("world_map")
	await _screen().tap_region("fen")
	assert_true(_fake.said.has("vo.bolge.kilitli_lab"))
	assert_eq(_app.current_scene_name(), "world_map")

func test_region_tap_says_name_then_opens_path() -> void:
	_login(1)
	_app.goto("world_map")
	await _screen().tap_region("matematik")
	assert_true(_fake.said.has("vo.bolge.sayi_ormani"))
	assert_eq(_app.current_scene_name(), "region_path")
	assert_eq(_screen().subject, "matematik")

func test_tree_house_says_soon() -> void:
	_login(1)
	_app.goto("world_map")
	_screen().tap_tree_house()
	assert_true(_fake.said.has("vo.genel.yakinda"))
	assert_eq(_app.current_scene_name(), "world_map")

func test_world_map_limit_goes_to_session_end() -> void:
	_login(1)
	_app.goto("world_map")
	_timer.limit_reached.emit()
	assert_eq(_app.current_scene_name(), "session_end")

func test_region_path_first_open_others_locked() -> void:
	_login(1)
	_app.goto("region_path", {"subject": "matematik"})
	assert_eq(_screen().stop_ids(), [N1, N2] as Array[String])
	assert_eq(_screen().stop_state(N1), "open")
	assert_eq(_screen().stop_state(N2), "locked")
	assert_true(_fake.said.has("vo.genel.durak_sec"))
	assert_true(_fake.music.has("music.sayi_ormani"))

func test_locked_stop_does_not_start_lesson() -> void:
	_login(1)
	_app.goto("region_path", {"subject": "matematik"})
	_screen().tap_stop(N2)
	assert_eq(_app.current_scene_name(), "region_path")

func test_empty_subject_says_soon_and_returns_to_map() -> void:
	_login(1)
	_app.goto("region_path", {"subject": "turkce"})
	await wait_until(func() -> bool: return _app.current_scene_name() == "world_map", 6.0)
	assert_true(_fake.said.has("vo.genel.yakinda"))
	assert_eq(_app.current_scene_name(), "world_map")

func test_lesson_result_continue_opens_second_stop() -> void:
	var pid: String = _login(1)
	_app.goto("region_path", {"subject": "matematik"})
	_screen().tap_stop(N1)
	assert_eq(_app.current_scene_name(), "lesson")
	await _win_lesson()
	var ok: bool = await wait_until(func() -> bool: return _app.current_scene_name() == "result", 6.0)
	assert_true(ok, "ders bitince sonuç ekranı")
	await wait_until(func() -> bool: return _screen().is_sequence_done(), 6.0)
	assert_eq(_progress.best_stars(pid, N1), 3)
	assert_eq(_fake.sfx.count("sfx.star"), 3)
	assert_true(_fake.said.has("vo.genel.yildiz_3"))
	assert_true(_fake.said.has("vo.genel.cikartma"), "yeni çıkartma sesi")
	assert_true(_fake.sfx.has("sfx.sticker"))
	_screen().continue_button().pressed.emit()
	assert_eq(_app.current_scene_name(), "region_path")
	assert_eq(_screen().stop_state(N1), "done")
	assert_eq(_screen().stop_state(N2), "open")
	assert_eq(_screen().highlighted(), N2)

func test_result_replay_starts_same_node() -> void:
	_login(1)
	_app.goto("result", {"stars": 2, "new_sticker": "", "unlocked": N2, "node_id": N1, "time_up": false, "subject": "matematik"})
	await wait_until(func() -> bool: return _screen().is_sequence_done(), 6.0)
	assert_true(_fake.said.has("vo.genel.yildiz_2"))
	assert_false(_fake.said.has("vo.genel.cikartma"))
	_screen().replay_button().pressed.emit()
	assert_eq(_app.current_scene_name(), "lesson")

func test_result_time_up_goes_to_session_end() -> void:
	_login(1)
	_app.goto("result", {"stars": 0, "new_sticker": "", "unlocked": "", "node_id": N1, "time_up": true, "subject": "matematik"})
	assert_eq(_app.current_scene_name(), "session_end")

func test_home_from_lesson_returns_to_region_path() -> void:
	_login(1)
	_app.goto("lesson", {"node_id": N1})
	_screen().home_requested.emit()
	assert_eq(_app.current_scene_name(), "region_path")
	assert_eq(_screen().subject, "matematik")

func test_album_shows_earned_sticker_filled() -> void:
	var pid: String = _login(1)
	(_save.data["profiles"][0]["stickers"] as Array).append("st.matematik.elma")
	_app.goto("album")
	assert_eq(_screen().tab_subjects(), PackedStringArray(["matematik", "turkce", "hayat_bilgisi"]))
	assert_eq(_screen().slot_keys(), PackedStringArray(["st.matematik.elma", "st.matematik.armut"]))
	assert_true(_screen().slot_earned("st.matematik.elma"))
	assert_false(_screen().slot_earned("st.matematik.armut"))
	assert_eq(_screen().slot_image_key("st.matematik.elma"), "st.matematik.elma")
	assert_eq(_screen().slot_image_key("st.matematik.armut"), "ui.sticker_frame")
	assert_not_null(pid)
	_screen().back_button().pressed.emit()
	assert_eq(_app.current_scene_name(), "world_map")

func test_album_has_fen_tab_for_grade_3() -> void:
	_login(3)
	_app.goto("album")
	assert_true(_screen().tab_subjects().has("fen"))

func _lock(id: String) -> void:
	_save.data["settings"]["daily_limit_min"] = 10
	for p: Variant in _save.data["profiles"]:
		var d: Dictionary = p
		if str(d["id"]) == id:
			d["usage"]["seconds"] = 9999
			d["usage"]["day"] = _timer._effective_day()

func test_locked_profile_cannot_enter_play_scenes() -> void:
	var pid: String = _login(1)
	_lock(pid)
	for scene: String in ["world_map", "region_path", "lesson", "result", "album"]:
		_app.goto(scene, {"subject": "matematik", "node_id": N1})
		assert_eq(_app.current_scene_name(), "session_end", scene)

func test_limit_on_result_then_continue_goes_to_session_end() -> void:
	var pid: String = _login(1)
	_app.goto("result", {"stars": 3, "new_sticker": "", "unlocked": N2, "node_id": N1, "time_up": false, "subject": "matematik"})
	await wait_until(func() -> bool: return _screen().is_sequence_done(), 6.0)
	_lock(pid)
	_timer.limit_reached.emit()
	assert_eq(_app.current_scene_name(), "session_end")

func test_limit_during_result_animation_finishes_then_session_end() -> void:
	var pid: String = _login(1)
	_app.goto("result", {"stars": 2, "new_sticker": "", "unlocked": N2, "node_id": N1, "time_up": false, "subject": "matematik"})
	_lock(pid)
	_timer.limit_reached.emit()
	await wait_until(func() -> bool: return _app.current_scene_name() == "session_end", 6.0)
	assert_eq(_app.current_scene_name(), "session_end")

func test_continue_after_lock_goes_to_session_end() -> void:
	var pid: String = _login(1)
	_app.goto("result", {"stars": 1, "new_sticker": "", "unlocked": N2, "node_id": N1, "time_up": false, "subject": "matematik"})
	await wait_until(func() -> bool: return _screen().is_sequence_done(), 6.0)
	var scr: Node = _screen()
	_lock(pid)
	scr.continue_button().pressed.emit()
	assert_eq(_app.current_scene_name(), "session_end")

func test_album_limit_goes_to_session_end() -> void:
	_login(1)
	_app.goto("album")
	_timer.limit_reached.emit()
	assert_eq(_app.current_scene_name(), "session_end")

func test_album_selected_tab_has_shape_cue() -> void:
	_login(1)
	_app.goto("album")
	assert_true(_screen().tab_selected("matematik"))
	assert_false(_screen().tab_selected("turkce"))
	_screen().select_subject("turkce")
	assert_true(_screen().tab_selected("turkce"))
	assert_false(_screen().tab_selected("matematik"))
	assert_true(_screen().tab_scale("turkce") > _screen().tab_scale("matematik"))

func test_album_has_title_plaque_and_large_centered_grid() -> void:
	_login(1)
	(_save.data["profiles"][0]["stickers"] as Array).append("st.matematik.elma")
	_app.goto("album")
	assert_not_null(_screen().title_plaque(), "başlık plaketi olmalı")
	assert_eq(_screen().title_text(), Strings.t("album.title"))
	assert_eq(_screen().grid_columns(), 3, "büyük yuvalar 3 sütunlu ızgarada")
	var earned: Control = _screen().slot_image("st.matematik.elma")
	var empty: Control = _screen().slot_image("st.matematik.armut")
	assert_gte((earned.get_parent() as Control).custom_minimum_size.x, 240.0, "yuvalar büyük")
	assert_eq(earned.modulate.a, 1.0, "kazanılan çıkartma tam görünür")
	assert_lt(empty.modulate.a, 1.0, "boş yuva soluk")

func test_album_selected_tab_scale_survives_layout() -> void:
	_login(1)
	_app.goto("album")
	await wait_physics_frames(3)
	assert_gt(_screen().tab_scale("matematik"), 1.0, "kap sıralaması seçili sekme büyütmesini silmemeli")
	assert_eq(_screen().tab_scale("turkce"), 1.0)

func test_result_buttons_have_icons() -> void:
	_login(1)
	_app.goto("result", {"stars": 1, "new_sticker": "", "unlocked": "", "node_id": N1, "time_up": false, "subject": "matematik"})
	assert_ne(str(_screen().continue_button().get("icon_key")), "")
	assert_ne(str(_screen().replay_button().get("icon_key")), "")
