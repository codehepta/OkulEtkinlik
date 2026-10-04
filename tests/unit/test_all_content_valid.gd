extends GutTest
## İçerik kapısı: res://content altındaki her ünite doğrulayıcıdan temiz geçmeli.

func _collect(dir: String, out: PackedStringArray) -> void:
	for f: String in DirAccess.get_files_at(dir):
		if f.ends_with(".json") and f.begins_with("u"):
			out.append(dir.path_join(f))
	for d: String in DirAccess.get_directories_at(dir):
		_collect(dir.path_join(d), out)

func test_all_content_valid() -> void:
	assert_true(DirAccess.dir_exists_absolute("res://content"))
	var files: PackedStringArray = PackedStringArray()
	_collect("res://content", files)
	assert_gt(files.size(), 0, "en az bir ünite dosyası doğrulanmalı")
	var known: PackedStringArray = PackedStringArray(
		(JSON.parse_string(FileAccess.get_file_as_string("res://docs/curriculum/outcomes.json")) as Dictionary).keys())
	var voice_lines: Dictionary = JSON.parse_string(FileAccess.get_file_as_string("res://content/voice_lines.tr.json"))
	var has_str: Callable = func(k: String) -> bool: return Strings.has(k)
	var has_vo: Callable = func(k: String) -> bool: return voice_lines.has(k)
	for path: String in files:
		var unit: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
		assert_true(unit is Dictionary, path)
		var errs: Array[String] = ContentValidator.validate_unit(unit, known, has_str, has_vo)
		assert_eq(errs, [] as Array[String], path)
