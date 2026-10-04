extends GutTest
## ContentDB testleri (fixture içeriğiyle).

const ROOT: String = "res://tests/fixtures/content"
const OUTCOMES: String = "res://docs/curriculum/outcomes.json"

var _db: Node = null

func before_each() -> void:
	_db = load("res://autoload/content_db.gd").new()
	_db.outcomes_path = OUTCOMES
	_db.has_string = func(_k: String) -> bool: return true
	_db.has_voice = func(_k: String) -> bool: return true

func after_each() -> void:
	_db.free()
	_db = null

func test_load_and_lookup() -> void:
	_db.load_all(ROOT)
	assert_eq(_db.errors.size(), 0)
	assert_eq(_db.units(1, "matematik").size(), 1)
	assert_eq(_db.units(2, "matematik").size(), 0)
	var n: Dictionary = _db.node("g1.matematik.u01.n01")
	assert_eq(n["rounds"][0]["params"]["count"], 3)
	assert_typeof(n["rounds"][0]["difficulty"], TYPE_INT)
	assert_typeof(n["rounds"][0]["params"]["choices"][0], TYPE_INT)
	assert_true(_db.node("yok").is_empty())

func test_next_node_id() -> void:
	_db.load_all(ROOT)
	assert_eq(_db.next_node_id("g1.matematik.u01.n01"), "g1.matematik.u01.n02")
	assert_eq(_db.next_node_id("g1.matematik.u01.n02"), "")
	assert_eq(_db.next_node_id("yok"), "")

func test_next_node_id_crosses_unit_boundary() -> void:
	var dir: String = "user://content_test"
	DirAccess.make_dir_recursive_absolute(dir + "/g1/matematik")
	var u: Dictionary = JSON.parse_string(FileAccess.get_file_as_string(ROOT + "/g1/matematik/u01.json"))
	var u2: Dictionary = u.duplicate(true)
	u2["id"] = "g1.matematik.u02"
	u2["nodes"].remove_at(1)
	u2["nodes"][0]["id"] = "g1.matematik.u02.n01"
	for pair: Array in [["u01", u], ["u02", u2]]:
		var f: FileAccess = FileAccess.open("%s/g1/matematik/%s.json" % [dir, pair[0]], FileAccess.WRITE)
		f.store_string(JSON.stringify(pair[1]))
		f.close()
	_db.load_all(dir)
	assert_eq(_db.next_node_id("g1.matematik.u01.n02"), "g1.matematik.u02.n01")
	assert_eq(_db.next_node_id("g1.matematik.u02.n01"), "")
	DirAccess.remove_absolute(dir + "/g1/matematik/u01.json")
	DirAccess.remove_absolute(dir + "/g1/matematik/u02.json")
	DirAccess.remove_absolute(dir + "/g1/matematik")
	DirAccess.remove_absolute(dir + "/g1")
	DirAccess.remove_absolute(dir)

func test_invalid_node_dropped_in_release() -> void:
	_db.outcomes_path = "res://tests/fixtures/empty_outcomes.json"
	_db.debug_build = false
	_db.load_all(ROOT)
	assert_gt(_db.errors.size(), 0)
	assert_push_error_count(2)
	assert_true(_db.node("g1.matematik.u01.n01").is_empty())

func test_invalid_node_kept_in_debug_with_errors() -> void:
	_db.outcomes_path = "res://tests/fixtures/empty_outcomes.json"
	_db.debug_build = true
	_db.load_all(ROOT)
	assert_gt(_db.errors.size(), 0)
	assert_push_error_count(2)
	assert_false(_db.node("g1.matematik.u01.n01").is_empty())

func test_subjects_for_grade() -> void:
	assert_false(_db.subjects_for_grade(1).has("fen"))
	assert_true(_db.subjects_for_grade(1).has("matematik"))
	assert_true(_db.subjects_for_grade(3).has("fen"))

func test_subject_region() -> void:
	assert_eq(_db.SUBJECT_REGION["fen"], "kesif_laboratuvari")
