extends GutTest
## Progress servisi testleri (geçici kayıt dizini + fixture içerik).

const ROOT: String = "res://tests/fixtures/content"
const SAVE_DIR: String = "user://progress_test"
const N1: String = "g1.matematik.u01.n01"
const N2: String = "g1.matematik.u01.n02"

var _save: Node = null
var _db: Node = null
var _p: Node = null

func before_each() -> void:
	DirAccess.make_dir_recursive_absolute(SAVE_DIR)
	_save = load("res://autoload/save_service.gd").new()
	_save.set_base_dir(SAVE_DIR)
	_save.load_or_create()
	_db = load("res://autoload/content_db.gd").new()
	_db.outcomes_path = "res://tests/fixtures/outcomes.json"
	_db.has_string = func(_k: String) -> bool: return true
	_db.has_voice = func(_k: String) -> bool: return true
	_db.load_all(ROOT)
	_p = load("res://autoload/progress.gd").new()
	_p.save = _save
	_p.content = _db
	_p.clock = DayClock.new()
	_p.clock.fixed_day = 100

func after_each() -> void:
	for f: String in DirAccess.get_files_at(SAVE_DIR):
		DirAccess.remove_absolute(SAVE_DIR.path_join(f))
	_p.free()
	_db.free()
	_save.free()

func _rr(wrong: int, helped: bool = false) -> RoundResult:
	var r: RoundResult = RoundResult.new()
	r.attempts = wrong + 1
	r.wrong = wrong
	r.helped = helped
	r.outcomes = PackedStringArray(["TEST.1"])
	return r

func _res(list: Array) -> Array[RoundResult]:
	var out: Array[RoundResult] = []
	for x: Variant in list:
		out.append(x)
	return out

func test_create_up_to_four_profiles() -> void:
	for i: int in 4:
		assert_ne(_p.create_profile("a", "n%d" % i, 1), "")
	assert_eq(_p.create_profile("a", "n5", 1), "")
	assert_eq(_p.profiles().size(), 4)
	_p.delete_profile(_p.profiles()[0]["id"])
	assert_eq(_p.profiles().size(), 3)
	assert_ne(_p.create_profile("a", "yeni", 1), "")

func test_first_node_open_others_locked() -> void:
	var id: String = _p.create_profile("a", "n", 1)
	assert_eq(_p.node_state(id, N1), "open")
	assert_eq(_p.node_state(id, N2), "locked")
	assert_eq(_p.node_state(id, "yok"), "locked")

func test_record_node_unlocks_next_and_awards_sticker_once() -> void:
	var id: String = _p.create_profile("a", "n", 1)
	var r1: Dictionary = _p.record_node(id, N1, _res([_rr(0)]))
	assert_eq(r1["stars"], 3)
	assert_eq(r1["new_sticker"], "st.matematik.elma")
	assert_eq(r1["unlocked"], N2)
	assert_eq(_p.node_state(id, N1), "done")
	assert_eq(_p.node_state(id, N2), "open")
	var r2: Dictionary = _p.record_node(id, N1, _res([_rr(0)]))
	assert_eq(r2["new_sticker"], "")

func test_best_stars_kept() -> void:
	var id: String = _p.create_profile("a", "n", 1)
	_p.record_node(id, N1, _res([_rr(0)]))
	_p.record_node(id, N1, _res([_rr(5)]))
	assert_eq(_p.best_stars(id, N1), 3)

func test_mastery_updates_from_results() -> void:
	var a: String = _p.create_profile("a", "n", 1)
	_p.record_node(a, N1, _res([_rr(0)]))
	assert_almost_eq(_p.outcome_mastery(a, "TEST.1"), 0.3, 0.0001)
	var b: String = _p.create_profile("a", "m", 1)
	_p.record_node(b, N1, _res([_rr(1)]))
	assert_almost_eq(_p.outcome_mastery(b, "TEST.1"), 0.18, 0.0001)

func test_leitner_promote_on_two_stars_reset_on_helped() -> void:
	var id: String = _p.create_profile("a", "n", 1)
	_p.record_node(id, N1, _res([_rr(0)]))
	var o: Dictionary = _save.data["profiles"][0]["outcomes"]["TEST.1"]
	assert_eq(o["box"], 2)
	assert_eq(o["due"], 101)
	_p.record_node(id, N1, _res([_rr(0)]))
	o = _save.data["profiles"][0]["outcomes"]["TEST.1"]
	assert_eq(o["box"], 3)
	assert_eq(o["due"], 103)
	assert_eq(_p.due_outcomes(id).size(), 0)
	_p.clock.fixed_day = 103
	assert_eq(_p.due_outcomes(id), PackedStringArray(["TEST.1"]))
	_p.record_node(id, N1, _res([_rr(3, true)]))
	o = _save.data["profiles"][0]["outcomes"]["TEST.1"]
	assert_eq(o["box"], 1)

func test_grade_change_preserves_progress() -> void:
	var id: String = _p.create_profile("a", "n", 1)
	_p.record_node(id, N1, _res([_rr(0)]))
	_p.set_grade(id, 2)
	_p.set_grade(id, 1)
	assert_eq(_p.best_stars(id, N1), 3)
	assert_eq(_p.profiles()[0]["grade"], 1)

func test_record_partial_updates_mastery_only() -> void:
	var pid: String = _p.create_profile("a", "x", 1)
	_p.record_partial(pid, N1, _res([_rr(0)]))
	assert_almost_eq(_p.outcome_mastery(pid, "TEST.1"), 0.3, 0.001)
	assert_eq(_p.best_stars(pid, N1), 0)
	assert_eq(_p.node_state(pid, N2), "locked")
	var prof: Dictionary = _p._profile(pid)
	assert_eq((prof["stickers"] as Array).size(), 0)
	var nodes: Dictionary = prof["nodes"]
	assert_false(nodes.has(N1), "oynama sayısı artmaz")

func test_stickers_lists_owned_in_order() -> void:
	var pid: String = _p.create_profile("a", "x", 1)
	assert_eq(_p.stickers(pid), PackedStringArray())
	_p.record_node(pid, N1, _res([_rr(0)]))
	assert_eq(_p.stickers(pid).size(), 1)
	assert_eq(_p.stickers("yok"), PackedStringArray())

func test_last_day_recorded_on_node_and_partial() -> void:
	var id: String = _p.create_profile("a", "n", 1)
	_p.record_node(id, N1, _res([_rr(0)]))
	assert_eq(_save.data["profiles"][0]["outcomes"]["TEST.1"]["last_day"], 100)
	_p.clock.fixed_day = 105
	_p.record_partial(id, N1, _res([_rr(0)]))
	assert_eq(_save.data["profiles"][0]["outcomes"]["TEST.1"]["last_day"], 105)
