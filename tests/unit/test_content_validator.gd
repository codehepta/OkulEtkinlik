extends GutTest
## ContentValidator ve TemplateRegistry testleri.

const FIXTURE: String = "res://tests/fixtures/content/g1/matematik/u01.json"

var _known: PackedStringArray = PackedStringArray(["TEST.1"])
var _has_key: Callable = func(_k: String) -> bool: return true

func _unit() -> Dictionary:
	return JSON.parse_string(FileAccess.get_file_as_string(FIXTURE))

func _validate(u: Dictionary) -> Array[String]:
	return ContentValidator.validate_unit(u, _known, _has_key, _has_key)

func _first_round(u: Dictionary) -> Dictionary:
	return u["nodes"][0]["rounds"][0]

func test_valid_fixture_has_no_errors() -> void:
	assert_eq(_validate(_unit()), [] as Array[String])

func test_empty_outcomes() -> void:
	var u: Dictionary = _unit()
	u["nodes"][0]["outcomes"] = []
	var e: Array[String] = _validate(u)
	assert_eq(e.size(), 1)
	assert_true(e[0].begins_with("g1.matematik.u01.n01: "))

func test_unknown_outcome() -> void:
	var u: Dictionary = _unit()
	u["nodes"][0]["outcomes"] = ["YOK.9"]
	assert_eq(_validate(u).size(), 1)

func test_unknown_template() -> void:
	var u: Dictionary = _unit()
	_first_round(u)["template"] = "yok_sablon"
	assert_eq(_validate(u).size(), 1)

func test_difficulty_out_of_range() -> void:
	var u: Dictionary = _unit()
	_first_round(u)["difficulty"] = 4
	assert_eq(_validate(u).size(), 1)

func test_non_integral_difficulty_rejected_integral_float_ok() -> void:
	var u: Dictionary = _unit()
	_first_round(u)["difficulty"] = 2.0
	assert_eq(_validate(u).size(), 0)
	_first_round(u)["difficulty"] = 1.5
	assert_eq(_validate(u).size(), 1)

func test_duplicate_node_id() -> void:
	var u: Dictionary = _unit()
	u["nodes"][1]["id"] = u["nodes"][0]["id"]
	assert_gt(_validate(u).size(), 0)

func test_bad_id_format() -> void:
	var u: Dictionary = _unit()
	u["nodes"][0]["id"] = "g1.matematik.u01.nX1"
	assert_gt(_validate(u).size(), 0)

func test_id_prefix_mismatch() -> void:
	var u: Dictionary = _unit()
	u["nodes"][0]["id"] = "g1.matematik.u02.n01"
	assert_gt(_validate(u).size(), 0)

func test_missing_voice_key() -> void:
	var u: Dictionary = _unit()
	var no_voice: Callable = func(k: String) -> bool: return k != "fx.vo.n01.r01"
	var e: Array[String] = ContentValidator.validate_unit(u, _known, _has_key, no_voice)
	assert_eq(e.size(), 1)

func test_missing_title_key() -> void:
	var u: Dictionary = _unit()
	var no_str: Callable = func(k: String) -> bool: return k != "fx.node.n01"
	assert_eq(ContentValidator.validate_unit(u, _known, no_str, _has_key).size(), 1)

func test_template_param_error() -> void:
	var u: Dictionary = _unit()
	_first_round(u)["params"]["count"] = 99
	assert_gt(_validate(u).size(), 0)

func test_missing_required_fields() -> void:
	var u: Dictionary = _unit()
	u.erase("source")
	u["nodes"][0].erase("sticker")
	assert_gt(_validate(u).size(), 1)

func test_empty_rounds() -> void:
	var u: Dictionary = _unit()
	u["nodes"][0]["rounds"] = []
	assert_eq(_validate(u).size(), 1)

func test_registry_has() -> void:
	assert_true(TemplateRegistry.has("count_choose"))
	assert_true(TemplateRegistry.has("drag_match"))
	assert_false(TemplateRegistry.has("yok"))

func test_registry_missing_script_reports_error() -> void:
	var e: Array[String] = TemplateRegistry.validate_at("res://yok/yok_sablon.gd", "yok_sablon", {})
	assert_eq(e.size(), 1)

func test_count_choose_params() -> void:
	var ok: Dictionary = {"item": "item.meyve.elma", "count": 3.0, "choices": [2.0, 3.0]}
	assert_eq(TemplateRegistry.validate("count_choose", ok), [] as Array[String])
	assert_gt(TemplateRegistry.validate("count_choose", {"item": "", "count": 3, "choices": [2, 3]}).size(), 0)
	assert_gt(TemplateRegistry.validate("count_choose", {"item": "a", "count": 3, "choices": [2, 4]}).size(), 0)
	assert_gt(TemplateRegistry.validate("count_choose", {"item": "a", "count": 3, "choices": [3, 3]}).size(), 0)
	assert_gt(TemplateRegistry.validate("count_choose", {"item": "a", "count": 3, "choices": [3]}).size(), 0)
	assert_gt(TemplateRegistry.validate("count_choose", {"item": "a", "count": 3, "choices": [3, 2.5]}).size(), 0)
	assert_gt(TemplateRegistry.validate("count_choose", {"item": "a", "count": 0, "choices": [0, 1]}).size(), 0)

func test_unit_id_grade_subject_mismatch() -> void:
	var u: Dictionary = _unit()
	u["grade"] = 2
	assert_eq(_validate(u).size(), 1)
	u = _unit()
	u["subject"] = "turkce"
	assert_eq(_validate(u).size(), 1)

func test_detailed_has_structured_node_index() -> void:
	var u: Dictionary = _unit()
	u["nodes"][1].erase("id")
	u["nodes"][1]["outcomes"] = []
	var d: Array[Dictionary] = ContentValidator.validate_unit_detailed(u, _known, _has_key, _has_key)
	assert_gt(d.size(), 0)
	for item: Dictionary in d:
		assert_eq(item["node_index"], 1)
		assert_true(item["message"] is String)

func test_detailed_unit_level_index_minus_one() -> void:
	var u: Dictionary = _unit()
	u.erase("source")
	var d: Array[Dictionary] = ContentValidator.validate_unit_detailed(u, _known, _has_key, _has_key)
	assert_eq(d[0]["node_index"], -1)

func test_non_dict_node_entry_reported() -> void:
	var u: Dictionary = _unit()
	u["nodes"] = [1]
	var d: Array[Dictionary] = ContentValidator.validate_unit_detailed(u, _known, _has_key, _has_key)
	assert_eq(d.size(), 1)
	assert_eq(d[0]["node_index"], 0)
