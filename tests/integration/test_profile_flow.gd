extends GutTest
## AppState ve profil akışı: splash yönlendirmesi, profil oluşturma, seçim, kilit.

const FakeServices: GDScript = preload("res://tests/helpers/fake_services.gd")
const SAVE_DIR: String = "user://profile_flow_test"

var _fake: Node = null
var _save: Node = null
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
	_progress = load("res://autoload/progress.gd").new()
	_progress.save = _save
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
	_app.scene_root = _root
	_app.splash_delay = 0.0

func after_each() -> void:
	for f: String in DirAccess.get_files_at(SAVE_DIR):
		DirAccess.remove_absolute(SAVE_DIR.path_join(f))
	_app.free()
	_progress.free()
	_save.free()

func _screen() -> Node:
	return _app.current_scene()

func _lock_profile(id: String) -> void:
	_save.data["settings"]["daily_limit_min"] = 10
	for p: Variant in _save.data["profiles"]:
		var d: Dictionary = p
		if str(d["id"]) == id:
			d["usage"]["seconds"] = 9999
			d["usage"]["day"] = _timer._effective_day()

func test_splash_without_profiles_goes_to_create() -> void:
	var splash: Control = (load("res://scenes/ui/splash.tscn") as PackedScene).instantiate() as Control
	splash.app = _app
	_root.add_child(splash)
	await wait_until(func() -> bool: return _app.current_scene_name() == "profile_create", 3.0)
	assert_eq(_app.current_scene_name(), "profile_create")
	assert_true(_fake.said.has("vo.genel.hosgeldin"))

func test_splash_with_profile_goes_to_select() -> void:
	_progress.create_profile("avatar.kedi", "A", 1)
	var splash: Control = (load("res://scenes/ui/splash.tscn") as PackedScene).instantiate() as Control
	splash.app = _app
	_root.add_child(splash)
	await wait_until(func() -> bool: return _app.current_scene_name() == "profile_select", 3.0)
	assert_eq(_app.current_scene_name(), "profile_select")

func test_create_profile_flow_reaches_world_map() -> void:
	_app.goto("profile_create")
	var s: Node = _screen()
	assert_eq(_app.current_scene_name(), "profile_create")
	assert_true(_fake.said.has("vo.genel.avatar_sec"))
	assert_eq(s.step(), 1)
	s.pick_avatar("avatar.tavsan")
	assert_eq(s.step(), 2)
	assert_true(_fake.said.has("vo.genel.sinif_sec"))
	s.pick_grade(2)
	assert_eq(s.step(), 3)
	assert_eq(s.nickname_edit().max_length, 12)
	s.confirm()
	var list: Array[Dictionary] = _progress.profiles()
	assert_eq(list.size(), 1)
	assert_eq(str(list[0]["avatar"]), "avatar.tavsan")
	assert_eq(int(list[0]["grade"]), 2)
	assert_eq(_app.current_scene_name(), "world_map")
	assert_eq(_app.profile_id, str(list[0]["id"]))
	assert_eq(_app.active_grade, 2)

func test_nickname_is_saved() -> void:
	_app.goto("profile_create")
	var s: Node = _screen()
	s.pick_avatar("avatar.ayi")
	s.pick_grade(1)
	s.nickname_edit().text = "Deniz"
	s.confirm()
	assert_eq(str(_progress.profiles()[0]["nickname"]), "Deniz")

func test_plus_card_hidden_at_four_profiles() -> void:
	for i: int in 3:
		_progress.create_profile("avatar.kedi", "P%d" % i, 1)
	_app.goto("profile_select")
	assert_true(_screen().plus_card().visible)
	assert_eq(_screen().profile_cards().size(), 3)
	_progress.create_profile("avatar.ayi", "P4", 1)
	_app.goto("profile_select")
	assert_false(_screen().plus_card().visible)
	assert_eq(_screen().profile_cards().size(), 4)
	assert_true(_fake.said.has("vo.genel.profil_sec"))

func test_select_profile_goes_to_world_map() -> void:
	var id: String = _progress.create_profile("avatar.kedi", "A", 3)
	_app.goto("profile_select")
	_screen().select(id)
	assert_eq(_app.current_scene_name(), "world_map")
	assert_eq(_app.profile_id, id)
	assert_eq(_app.active_grade, 3)

func test_locked_profile_goes_to_session_end() -> void:
	var id: String = _progress.create_profile("avatar.kedi", "A", 1)
	_lock_profile(id)
	_app.goto("profile_select")
	_screen().select(id)
	assert_eq(_app.current_scene_name(), "session_end")

func test_gear_goes_to_parent_gate_with_next() -> void:
	_progress.create_profile("avatar.kedi", "A", 1)
	_app.goto("profile_select")
	_screen().open_parent_gate()
	assert_eq(_app.current_scene_name(), "parent_gate")
	var next: Dictionary = _screen().args["next"]
	assert_eq(next["scene"], "parent_panel")

func test_goto_missing_scene_stays() -> void:
	_app.goto("profile_create")
	_app.goto("region_path")  # dosyası henüz yok
	assert_eq(_app.current_scene_name(), "profile_create")
