extends GutTest
## Uçtan uca dikey dilim: temiz kayıt -> profil -> harita -> Sayı Ormanı -> ilk durak
## (GERÇEK içerik) -> 3 yıldız -> albümde çıkartma -> ikinci durak açık. Asset dizini boş (yer tutucular).

const FakeServices: GDScript = preload("res://tests/helpers/fake_services.gd")
const EMPTY_ASSETS: String = "res://tests/fixtures/empty_assets"
const SAVE_DIR: String = "user://e2e_vertical_slice_test"
const N1: String = "g1.matematik.u01.n01"
const N2: String = "g1.matematik.u01.n02"
const STICKER: String = "st.matematik.elma"
const WAIT: float = 8.0

var _fake: Node = null
var _save: Node = null
var _db: Node = null
var _progress: Node = null
var _timer: Node = null
var _app: Node = null
var _root: Node = null

func before_each() -> void:
	DirAccess.make_dir_recursive_absolute(SAVE_DIR)
	for f: String in DirAccess.get_files_at(SAVE_DIR):
		DirAccess.remove_absolute(SAVE_DIR.path_join(f))
	AssetRegistry.set_root_override(EMPTY_ASSETS)
	_fake = FakeServices.new()
	add_child_autofree(_fake)
	_save = load("res://autoload/save_service.gd").new()
	_save.set_base_dir(SAVE_DIR)
	_save.load_or_create()
	_db = load("res://autoload/content_db.gd").new()
	_db.load_all("res://content")  # gerçek içerik + gerçek docs/curriculum/outcomes.json
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
	_app.anim_scale = 0.0

func after_each() -> void:
	AssetRegistry.set_root_override("")
	for f: String in DirAccess.get_files_at(SAVE_DIR):
		DirAccess.remove_absolute(SAVE_DIR.path_join(f))
	_app.free()
	_progress.free()
	_db.free()
	_save.free()

func _screen() -> Node:
	return _app.current_scene()

func test_full_vertical_slice() -> void:
	assert_true(_db.node(N1).size() > 0, "gerçek içerik yüklenmeli")
	assert_eq(_progress.profiles().size(), 0, "temiz kayıt")
	# Profil oluştur.
	_app.goto("profile_create")
	var pc: Node = _screen()
	pc.pick_avatar("avatar.tavsan")
	pc.pick_grade(1)
	pc.confirm()
	assert_eq(_app.current_scene_name(), "world_map")
	var pid: String = _app.profile_id
	assert_ne(pid, "")
	assert_eq(_app.active_grade, 1)
	# Harita -> Sayı Ormanı.
	assert_false(_screen().region_locked("matematik"))
	await _screen().tap_region("matematik")
	assert_eq(_app.current_scene_name(), "region_path")
	assert_eq(_screen().stop_state(N1), "open")
	assert_eq(_screen().stop_state(N2), "locked")
	# İlk durak: bütün turlar doğru.
	_screen().tap_stop(N1)
	assert_eq(_app.current_scene_name(), "lesson")
	var rounds: int = (_db.node(N1)["rounds"] as Array).size()
	for i: int in rounds:
		var ok: bool = await wait_until(func() -> bool:
			return _app.current_scene_name() == "lesson" and _screen().current_game() != null and _screen().current_round_index() == i, WAIT)
		assert_true(ok, "tur %d açılmalı" % i)
		if not ok:
			return
		var game: Node = _screen().current_game()
		game.call("_debug_choose", int(game.call("_debug_correct_index")))
	var done: bool = await wait_until(func() -> bool: return _app.current_scene_name() == "result", WAIT)
	assert_true(done, "ders bitince sonuç ekranı")
	if not done:
		return
	var seq: bool = await wait_until(func() -> bool: return _screen().is_sequence_done(), WAIT)
	assert_true(seq, "sonuç dizisi bitmeli")
	assert_eq(_progress.best_stars(pid, N1), 3)
	assert_eq(_fake.sfx.count("sfx.star"), 3)
	assert_true(_fake.sfx.has("sfx.sticker"))
	# Albüm: çıkartma kazanıldı.
	_screen().continue_button().pressed.emit()
	assert_eq(_app.current_scene_name(), "region_path")
	assert_eq(_screen().stop_state(N1), "done")
	assert_eq(_screen().stop_state(N2), "open")
	_app.goto("album")
	assert_true(_screen().slot_earned(STICKER))
	assert_eq(_screen().slot_image_key(STICKER), STICKER)
	# Yer tutucular: asset dizini boş olduğu için hiçbir anahtar gerçekten yüklenmedi.
	assert_gt(AssetRegistry.missing_keys().size(), 0)
