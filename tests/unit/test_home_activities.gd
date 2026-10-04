extends GutTest
## Evde etkinlik önerileri: içerik kapısı ve sınıf süzgeci (scripts/core/home_activities.gd).

const HomeActivities: GDScript = preload("res://scripts/core/home_activities.gd")

func _json(path: String) -> Dictionary:
	return JSON.parse_string(FileAccess.get_file_as_string(path)) as Dictionary

func test_content_file_is_valid() -> void:
	var texts: Dictionary = HomeActivities.load_texts()
	assert_gt(texts.size(), 0)
	var errs: Array[String] = HomeActivities.validate(texts, _json("res://docs/curriculum/outcomes.json"), _json("res://docs/curriculum/game_map.json"))
	assert_eq(errs, [] as Array[String])

func test_validate_reports_problems() -> void:
	var outcomes: Dictionary = {"A": {"grade": 1}, "B": {"grade": 1}, "C": {"grade": 1}}
	var game_map: Dictionary = {"A": {"fit": "full"}, "B": {"fit": "none"}, "C": {"fit": "none"}}
	var errs: Array[String] = HomeActivities.validate({"A": "x", "B": " ", "Z": "y"}, outcomes, game_map)
	assert_eq(errs.size(), 4, str(errs))

func test_rows_for_grade_filters_and_sorts() -> void:
	var outcomes: Dictionary = {
		"T.1": {"grade": 1, "subject": "turkce", "text": "t"},
		"H.1": {"grade": 1, "subject": "hayat_bilgisi", "text": "h"},
		"T.2": {"grade": 2, "subject": "turkce", "text": "t2"},
	}
	var rows: Array[Dictionary] = HomeActivities.rows_for_grade({"T.1": "a", "H.1": "b", "T.2": "c", "X": "d"}, outcomes, 1)
	assert_eq(rows.map(func(r: Dictionary) -> String: return str(r["code"])), ["H.1", "T.1"])
	assert_eq(rows[0]["text"], "b")
	assert_eq(rows[0]["outcome"], "h")
