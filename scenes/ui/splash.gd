extends Control
# Açılış ekranı. Task 7'de Strings servisine taşınacak; şimdilik JSON doğrudan okunur.

const STRINGS_PATH: String = "res://content/strings.tr.json"

@onready var _title: Label = $Title


func _ready() -> void:
	_title.text = _load_string("app.title")


func _load_string(key: String) -> String:
	var text: String = FileAccess.get_file_as_string(STRINGS_PATH)
	var data: Variant = JSON.parse_string(text)
	if data is Dictionary and (data as Dictionary).has(key):
		return str((data as Dictionary)[key])
	return key
