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
	_t.start("p1")
	_t.tick(100000.0)
	assert_false(_t.is_locked("p1"))
	assert_eq(_t.remaining_seconds("p1"), -1)
	assert_eq(_emitted, 0)

func test_limit_reached_emits_once() -> void:
	_set_limit(10)
	_t.start("p1")
	_t.tick(601.0)
	assert_eq(_emitted, 1)
	assert_true(_t.is_locked("p1"))
	assert_eq(_t.remaining_seconds("p1"), 0)
	_t.tick(10.0)
	assert_eq(_emitted, 1)

func test_tick_ignored_when_not_started() -> void:
	_set_limit(10)
	_t.tick(1000.0)
	assert_false(_t.is_locked("p1"))
	assert_eq(_t.remaining_seconds("p1"), 600)

func test_new_day_resets_usage() -> void:
	_set_limit(10)
	_t.start("p1")
	_t.tick(601.0)
	assert_true(_t.is_locked("p1"))
	_t.clock.fixed_day = 101
	assert_false(_t.is_locked("p1"))
	assert_eq(_t.remaining_seconds("p1"), 600)
	assert_eq(_save.data["last_day_seen"], 101)

func test_clock_moved_back_does_not_reset_usage() -> void:
	_set_limit(10)
	_t.start("p1")
	_t.tick(601.0)
	_t.clock.fixed_day = 99
	assert_true(_t.is_locked("p1"))
	assert_eq(_save.data["last_day_seen"], 100)

func test_parent_unlock_today() -> void:
	_set_limit(10)
	_t.start("p1")
	_t.tick(601.0)
	assert_true(_t.is_locked("p1"))
	_t.parent_unlock_today("p1")
	assert_false(_t.is_locked("p1"))
	assert_eq(_t.remaining_seconds("p1"), -1)
	_t.clock.fixed_day = 101
	_t.tick(601.0)
	assert_true(_t.is_locked("p1"))

func test_stop_persists_usage() -> void:
	_set_limit(10)
	_t.start("p1")
	_t.tick(5.0)
	_t.stop()
	var reloaded: Node = load("res://autoload/save_service.gd").new()
	reloaded.set_base_dir(SAVE_DIR)
	reloaded.load_or_create()
	assert_eq(reloaded.data["profiles"][0]["usage"]["seconds"], 5)
	reloaded.free()
