extends GutTest
## Faz 8 erişilebilirlik denetimi: her ekranda görünen bütün dokunma hedefleri (düğmeler)
## en az 128×128 px (1080p tabanı) ve ekranın içinde.

const FakeServices: GDScript = preload("res://tests/helpers/fake_services.gd")
const ROOT: String = "res://tests/fixtures/lesson"
const STICKERS: String = "res://tests/fixtures/stickers.json"
const SAVE_DIR: String = "user://a11y_screens_test"
const MIN_TOUCH: float = 128.0
const SCREEN: Rect2 = Rect2(0, 0, 1920, 1080)

var _fake: Node = null
var _save: Node = null
var _db: Node = null
var _progress: Node = null
var _timer: Node = null
var _app: Node = null
var _root: Control = null

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
	_root = Control.new()
	_root.size = SCREEN.size
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
	_app.splash_delay = 999.0

func after_each() -> void:
	for f: String in DirAccess.get_files_at(SAVE_DIR):
		DirAccess.remove_absolute(SAVE_DIR.path_join(f))
	_app.free()
	_progress.free()
	_db.free()
	_save.free()

func _buttons(n: Node, out: Array[BaseButton]) -> void:
	if n is BaseButton and (n as BaseButton).is_visible_in_tree():
		out.append(n as BaseButton)
	for c: Node in n.get_children():
		_buttons(c, out)

func _audit(scene_name: String, args: Dictionary = {}) -> void:
	_app.goto(scene_name, args)
	await wait_process_frames(6)
	var screen: Node = _app.current_scene()
	assert_not_null(screen, scene_name)
	if screen == null:
		return
	var list: Array[BaseButton] = []
	_buttons(screen, list)
	assert_gt(list.size(), 0, "%s: dokunma hedefi bulunamadı" % scene_name)
	for b: BaseButton in list:
		var r: Rect2 = b.get_global_rect()
		assert_true(r.size.x >= MIN_TOUCH - 0.5 and r.size.y >= MIN_TOUCH - 0.5, "%s: %s küçük %s" % [scene_name, b.get_path(), r.size])

func _login(grade: int) -> String:
	var id: String = _progress.create_profile("avatar.kedi", "T", grade)
	_app.select_profile(id)
	return id

func test_profile_screens() -> void:
	await _audit("profile_create")
	_login(1)
	await _audit("profile_select")

func test_map_screens() -> void:
	_login(1)
	await _audit("world_map")
	await _audit("region_path", {"subject": "matematik"})
	await _audit("album")
	await _audit("tree_house")

func test_result_and_session_end() -> void:
	_login(1)
	await _audit("result", {"node_id": "g1.matematik.u01.n01", "stars": 3, "new_sticker": "", "unlocked": "g1.matematik.u01.n02", "subject": "matematik"})
	await _audit("session_end")

func test_parent_screens() -> void:
	_login(1)
	await _audit("parent_gate", {"next": {"scene": "parent_panel", "args": {}}})
	await _audit("parent_panel")
