extends GutTest
## Gerçek veri kapısı: docs/curriculum/*.json resmi kaynak dökümüne ve programdaki sayımlara uymalı.

const CurriculumCheck := preload("res://tools/curriculum/curriculum_check.gd")

const OUTCOMES_PATH: String = "res://docs/curriculum/outcomes.json"
const THEMES_PATH: String = "res://docs/curriculum/themes.json"
const GAME_MAP_PATH: String = "res://docs/curriculum/game_map.json"

## Programdaki "TOPLAM" satırları (sonraki görevler satır ekler).
const EXPECTED_COUNTS: Dictionary = {
	"g1.matematik": 19,
	"g2.matematik": 25,
	"g3.matematik": 33,
	"g1.turkce": 17,
	"g2.turkce": 20,
	"g3.turkce": 20,
}

## game_map.json kaydı zorunlu olan dersler (Görev 6-7 doldurur).
const MAPPED_SUBJECTS: PackedStringArray = []

func _load_json(path: String) -> Dictionary:
	if not FileAccess.file_exists(path):
		return {}
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
	return parsed if parsed is Dictionary else {}

func _load_pages() -> Dictionary:
	var pages: Dictionary = {}
	for subject: String in CurriculumCheck.SUBJECT_SOURCES.keys():
		var file: String = CurriculumCheck.SUBJECT_SOURCES[subject]["file"]
		pages[file] = CurriculumCheck.load_pages(file)
	return pages

func test_outcomes_match_sources() -> void:
	var errs: Array[String] = CurriculumCheck.check_outcomes(_load_json(OUTCOMES_PATH), _load_json(THEMES_PATH), _load_pages())
	assert_eq(errs, [] as Array[String], "\n".join(errs))

func test_themes_consistent() -> void:
	assert_true(FileAccess.file_exists(THEMES_PATH), "themes.json yok")
	var errs: Array[String] = CurriculumCheck.check_themes(_load_json(THEMES_PATH), _load_json(OUTCOMES_PATH))
	assert_eq(errs, [] as Array[String], "\n".join(errs))

func test_counts_match_program() -> void:
	var counts: Dictionary = CurriculumCheck.count_by_grade_subject(_load_json(OUTCOMES_PATH))
	for key: String in EXPECTED_COUNTS.keys():
		assert_eq(int(counts.get(key, 0)), int(EXPECTED_COUNTS[key]), "%s çıktı sayısı" % key)
	for key: String in counts.keys():
		assert_true(EXPECTED_COUNTS.has(key), "beklenmeyen ders/sınıf grubu: %s" % key)

func test_game_map_covers_mapped_subjects() -> void:
	var errs: Array[String] = CurriculumCheck.check_game_map(_load_json(GAME_MAP_PATH), _load_json(OUTCOMES_PATH), MAPPED_SUBJECTS)
	assert_eq(errs, [] as Array[String], "\n".join(errs))
