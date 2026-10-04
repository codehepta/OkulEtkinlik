extends SceneTree
## Müfredat matrisi CLI'si (geliştirici aracı).
## Kullanım: godot --headless --path . -s res://tools/curriculum_report.gd
## Sonuç: res://docs/curriculum/matrix.md (üretilmiştir, elle düzenlenmez; testle güncelliği denetlenir).

const CurriculumReport := preload("res://tools/curriculum/report.gd")

const OUTCOMES_PATH: String = "res://docs/curriculum/outcomes.json"
const THEMES_PATH: String = "res://docs/curriculum/themes.json"
const GAME_MAP_PATH: String = "res://docs/curriculum/game_map.json"
const MATRIX_PATH: String = "res://docs/curriculum/matrix.md"

func _load_json(path: String) -> Dictionary:
	if not FileAccess.file_exists(path):
		printerr("Dosya yok: %s" % path)
		return {}
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
	if not (parsed is Dictionary):
		printerr("JSON okunamadı: %s" % path)
		return {}
	return parsed

func _init() -> void:
	var outcomes: Dictionary = _load_json(OUTCOMES_PATH)
	var themes: Dictionary = _load_json(THEMES_PATH)
	var game_map: Dictionary = _load_json(GAME_MAP_PATH)
	if outcomes.is_empty() or themes.is_empty() or game_map.is_empty():
		quit(1)
		return
	var md: String = CurriculumReport.render(outcomes, themes, game_map)
	var f: FileAccess = FileAccess.open(MATRIX_PATH, FileAccess.WRITE)
	if f == null:
		printerr("Yazılamadı: %s" % MATRIX_PATH)
		quit(1)
		return
	f.store_string(md)
	f.close()
	print("%d çıktı, %d tema -> %s" % [outcomes.size(), themes.size(), MATRIX_PATH])
	quit()
