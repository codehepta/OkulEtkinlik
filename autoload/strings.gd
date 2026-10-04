extends Node
## Metin servisi: content/strings.tr.json içinden Türkçe metin verir.
## Anahtar yoksa anahtarın kendisini döndürür ve uyarı loglar.

const STRINGS_PATH: String = "res://content/strings.tr.json"

var _data: Dictionary = {}
var _loaded: bool = false

func has(key: String) -> bool:
	_ensure_loaded()
	return _data.has(key)

## `{ad}` biçimindeki yer tutucuları args ile değiştirir.
func t(key: String, args: Dictionary = {}) -> String:
	_ensure_loaded()
	if not _data.has(key):
		push_warning("Eksik metin anahtarı: " + key)
		return key
	var text: String = str(_data[key])
	for name: Variant in args:
		text = text.replace("{%s}" % str(name), str(args[name]))
	return text

func _ensure_loaded() -> void:
	if _loaded:
		return
	_loaded = true
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(STRINGS_PATH))
	if parsed is Dictionary:
		_data = parsed
	else:
		push_error("strings.tr.json okunamadı: " + STRINGS_PATH)
