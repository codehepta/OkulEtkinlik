extends GutTest
## ProgressExport: yedek dışa/içe aktarma biçimi.

func _sample() -> Dictionary:
	var d: Dictionary = SaveSchema.new_save()
	d["profiles"].append(SaveSchema.new_profile("p1", "avatar.kedi", "Ada", 2))
	d["settings"]["daily_limit_min"] = 20
	return d

func test_round_trip_preserves_data() -> void:
	var src: Dictionary = _sample()
	var back: Dictionary = SaveSchema.migrate(ProgressExport.from_json(ProgressExport.to_json(src)))
	assert_eq(back, SaveSchema.migrate(src))

func test_to_json_is_pretty_printed() -> void:
	assert_true(ProgressExport.to_json(_sample()).contains("\n"))

func test_broken_json_returns_empty() -> void:
	assert_eq(ProgressExport.from_json("{bozuk"), {})

func test_empty_text_returns_empty() -> void:
	assert_eq(ProgressExport.from_json(""), {})

func test_not_a_dictionary_returns_empty() -> void:
	assert_eq(ProgressExport.from_json("[1, 2]"), {})

func test_profiles_not_array_returns_empty() -> void:
	assert_eq(ProgressExport.from_json('{"schema_version": 1, "profiles": 3}'), {})
	assert_eq(ProgressExport.from_json('{"profiles": 3}'), {})

func test_missing_profiles_returns_empty() -> void:
	assert_eq(ProgressExport.from_json('{"schema_version": 1}'), {})

func test_schema_version_must_be_number() -> void:
	assert_eq(ProgressExport.from_json('{"schema_version": "1", "profiles": []}'), {})
	assert_eq(ProgressExport.from_json('{"profiles": []}'), {})

func test_minimal_valid() -> void:
	assert_false(ProgressExport.from_json('{"schema_version": 1, "profiles": []}').is_empty())
