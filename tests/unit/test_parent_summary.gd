extends GutTest
## Veli paneli özetleri (scripts/core/parent_summary.gd): ders özeti, ders listesi, bugünkü süre.

const ParentSummary: GDScript = preload("res://scripts/core/parent_summary.gd")

func _row(code: String, subject: String, mastery: float, day: int) -> Dictionary:
	return {"code": code, "subject": subject, "mastery": mastery, "last_day": day}

func test_subject_codes_collects_unique_sorted_outcomes() -> void:
	var units: Array[Dictionary] = [
		{"nodes": [{"id": "a", "outcomes": ["M.2", "M.1"]}, {"id": "b", "outcomes": ["M.1"]}]},
		{"nodes": [{"id": "c", "outcomes": ["M.3"]}, {"id": "d"}]},
	]
	assert_eq(ParentSummary.subject_codes(units), PackedStringArray(["M.1", "M.2", "M.3"]))

func test_subject_summary_counts_played_average_and_last_day() -> void:
	var rows: Array[Dictionary] = [
		_row("M.1", "matematik", 0.5, 100),
		_row("M.2", "matematik", 1.0, 120),
		_row("T.1", "turkce", 0.2, 130),
		_row("M.9", "matematik", 0.0, 90),
	]
	var s: Dictionary = ParentSummary.subject_summary(rows, "matematik", PackedStringArray(["M.1", "M.2", "M.3"]))
	assert_eq(s["played"], 2, "yalnızca bu sınıfın çıktıları sayılır")
	assert_eq(s["total"], 3)
	assert_almost_eq(float(s["average"]), 0.75, 0.0001)
	assert_eq(s["last_day"], 120, "en son oynanan gün")

func test_subject_summary_empty() -> void:
	var rows: Array[Dictionary] = []
	var s: Dictionary = ParentSummary.subject_summary(rows, "fen", PackedStringArray(["F.1"]))
	assert_eq(s["played"], 0)
	assert_eq(s["total"], 1)
	assert_almost_eq(float(s["average"]), -1.0, 0.0001, "oynanmadıysa ortalama yok")
	assert_eq(s["last_day"], 0)

func test_rows_of_filters_subject_keeping_order() -> void:
	var rows: Array[Dictionary] = [_row("A", "turkce", 0.1, 1), _row("B", "matematik", 0.2, 1), _row("C", "turkce", 0.3, 1)]
	var res: Array[Dictionary] = ParentSummary.rows_of(rows, "turkce")
	assert_eq(res.map(func(r: Dictionary) -> String: return str(r["code"])), ["A", "C"])

func test_subjects_appends_played_subjects_outside_grade() -> void:
	var rows: Array[Dictionary] = [_row("F.1", "fen", 0.5, 1), _row("M.1", "matematik", 0.5, 1), _row("X", "", 0.5, 1)]
	var res: PackedStringArray = ParentSummary.subjects(PackedStringArray(["matematik", "turkce"]), rows)
	assert_eq(res, PackedStringArray(["matematik", "turkce", "fen"]))

func test_usage_unlimited() -> void:
	var u: Dictionary = ParentSummary.usage(0, 610, false)
	assert_eq(u["state"], "unlimited")
	assert_eq(u["played_min"], 10)

func test_usage_limited_rounds_left_minutes_up() -> void:
	var u: Dictionary = ParentSummary.usage(20, 7 * 60 + 30, false)
	assert_eq(u["state"], "limited")
	assert_eq(u["played_min"], 7)
	assert_eq(u["left_min"], 13)

func test_usage_locked_when_limit_used() -> void:
	var u: Dictionary = ParentSummary.usage(10, 600, false)
	assert_eq(u["state"], "locked")
	assert_eq(u["left_min"], 0)
	assert_eq(ParentSummary.usage(10, 9999, false)["played_min"], 166)

func test_usage_unlocked_today_overrides_lock() -> void:
	var u: Dictionary = ParentSummary.usage(10, 9999, true)
	assert_eq(u["state"], "unlocked")
