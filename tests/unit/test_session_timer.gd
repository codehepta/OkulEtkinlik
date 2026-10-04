extends GutTest
## SessionTimer testleri (geçici kayıt dizini, sabit gün).

const SAVE_DIR: String = "user://session_timer_test"

var _save: Node = null
var _t: Node = null
var _emitted: int = 0

func before_each() -> void:
	DirAccess.make_dir_recursive_absolute(SAVE_DIR)
	_save = load("res://autoload/save_service.gd").new()
	_save.set_base_dir(SAVE_DIR)
	_save.load_or_create()
	_save.data["profiles"].append(SaveSchema.new_profile("p1", "a", "n", 1))
	_t = load("res://autoload/session_timer.gd").new()
	_t.save = _save
	_t.clock = DayClock.new()
	_t.clock.fixed_day = 100
	_emitted = 0
	_t.limit_reached.connect(func() -> void: _emitted += 1)

func after_each() -> void:
	for f: String in DirAccess.get_files_at(SAVE_DIR):
		DirAccess.remove_absolute(SAVE_DIR.path_join(f))
	_t.free()
	_save.free()

func _set_limit(min: int) -> void:
	_save.data["settings"]["daily_limit_min"] = min

func test_disabled_limit_never_locks() -> void:
	_set_limit(0)
	_t.start()
	_t.tick(100000.0)
	assert_false(_t.is_locked())
	assert_eq(_t.remaining_seconds(), -1)
	assert_eq(_emitted, 0)

func test_limit_reached_emits_once() -> void:
	_set_limit(10)
	_t.start()
	_t.tick(601.0)
	assert_eq(_emitted, 1)
	assert_true(_t.is_locked())
	assert_eq(_t.remaining_seconds(), 0)
	_t.tick(10.0)
	assert_eq(_emitted, 1)

func test_tick_ignored_when_not_started() -> void:
	_set_limit(10)
	_t.tick(1000.0)
	assert_false(_t.is_locked())
	assert_eq(_t.remaining_seconds(), 600)

func test_new_day_resets_usage() -> void:
	_set_limit(10)
	_t.start()
	_t.tick(601.0)
	assert_true(_t.is_locked())
	_t.clock.fixed_day = 101
	assert_false(_t.is_locked())
	assert_eq(_t.remaining_seconds(), 600)
	assert_eq(_save.data["last_day_seen"], 101)

func test_clock_moved_back_does_not_reset_usage() -> void:
	_set_limit(10)
	_t.start()
	_t.tick(601.0)
	_t.clock.fixed_day = 99
	assert_true(_t.is_locked())
	assert_eq(_save.data["last_day_seen"], 100)

func test_parent_unlock_today() -> void:
	_set_limit(10)
	_t.start()
	_t.tick(601.0)
	assert_true(_t.is_locked())
	_t.parent_unlock_today()
	assert_false(_t.is_locked())
	assert_eq(_t.remaining_seconds(), -1)
	_t.clock.fixed_day = 101
	_t.tick(601.0)
	assert_true(_t.is_locked())

func test_stop_persists_usage() -> void:
	_set_limit(10)
	_t.start()
	_t.tick(5.0)
	_t.stop()
	var reloaded: Node = load("res://autoload/save_service.gd").new()
	reloaded.set_base_dir(SAVE_DIR)
	reloaded.load_or_create()
	assert_eq(reloaded.data["usage"]["seconds"], 5)
	reloaded.free()

func _saved_seconds() -> int:
	var s2: Node = load("res://autoload/save_service.gd").new()
	s2.set_base_dir(SAVE_DIR)
	s2.load_or_create()
	var secs: int = int(s2.data["usage"]["seconds"])
	s2.free()
	return secs

func test_app_pause_saves_usage() -> void:
	_set_limit(10)
	_t.start()
	_t.tick(5.0)
	_t._notification(NOTIFICATION_APPLICATION_PAUSED)
	assert_eq(_saved_seconds(), 5, "uygulama arka plana geçince kullanım diske yazılır")

func test_close_request_saves_usage() -> void:
	_set_limit(10)
	_t.start()
	_t.tick(7.0)
	_t._notification(NOTIFICATION_WM_CLOSE_REQUEST)
	assert_eq(_saved_seconds(), 7)

func test_process_caps_large_delta() -> void:
	_set_limit(10)
	_t.start()
	_t._process(600.0)
	assert_eq(_t.remaining_seconds(), 599, "askıdan dönüşteki dev kare süresi sayılmaz (en çok 1 sn)")

func test_limit_is_per_device_not_per_profile() -> void:
	_set_limit(10)
	_save.data["profiles"].append(SaveSchema.new_profile("p2", "a", "m", 2))
	_t.start()
	_t.tick(400.0)
	_t.stop()
	# Profil değiştirmek sayacı sıfırlamaz: süre bütün profillerde ortaktır.
	_t.start()
	_t.tick(201.0)
	assert_true(_t.is_locked())
	assert_eq(_emitted, 1)

func test_parent_unlock_applies_to_device() -> void:
	_set_limit(10)
	_t.start()
	_t.tick(601.0)
	_t.parent_unlock_today()
	assert_false(_t.is_locked())

func test_reset_day_after_clock_moved_forward_and_back() -> void:
	_set_limit(10)
	_t.clock.fixed_day = 110
	_t.start()
	_t.tick(601.0)
	assert_true(_t.is_locked())
	# Saat geri getirildi: etkin gün 110'da kalır, kilit sürer.
	_t.clock.fixed_day = 100
	assert_true(_t.is_locked())
	assert_true(_t.day_ahead())
	_t.reset_day()
	assert_false(_t.day_ahead())
	assert_eq(_save.data["last_day_seen"], 100)
	assert_false(_t.is_locked())
	assert_eq(_t.remaining_seconds(), 600)
	_t.tick(601.0)
	assert_true(_t.is_locked())
	assert_eq(_emitted, 2, "sıfırlanan gün yeniden sınıra ulaşınca sinyal yeniden yayılır")

func test_reset_day_cancels_future_unlock() -> void:
	_set_limit(10)
	_t.clock.fixed_day = 110
	_t.start()
	_t.tick(601.0)
	_t.parent_unlock_today()
	_t.clock.fixed_day = 100
	_t.reset_day()
	assert_eq(_save.data["usage"]["unlocked_day"], -1)
