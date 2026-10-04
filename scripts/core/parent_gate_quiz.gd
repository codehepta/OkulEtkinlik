class_name ParentGateQuiz
## Veli kapısı çarpım sorusu üreticisi.

# Statik önbellek: strings.tr.json yükler ve önbelleğe alır.
static var _strings: Dictionary
static var _loaded: bool = false

## Strings.tr.json dosyasından bir değeri okur (statik çağrı için).
static func _load_strings() -> Dictionary:
	if _loaded:
		return _strings

	var json_path: String = "res://content/strings.tr.json"
	if not FileAccess.file_exists(json_path):
		push_error("Strings file not found: " + json_path)
		_loaded = true
		return {}

	var file: FileAccess = FileAccess.open(json_path, FileAccess.READ)
	if file == null:
		push_error("Failed to open strings file: " + json_path)
		_loaded = true
		return {}

	var file_content: String = file.get_as_text()
	var json: JSON = JSON.new()
	var error: int = json.parse(file_content)
	if error != OK:
		push_error("Failed to parse JSON in %s: %s" % [json_path, json.get_error_message()])
		_loaded = true
		return {}

	var result: Dictionary = json.get_data() if json.get_data() is Dictionary else {}

	_strings = result
	_loaded = true
	return result

## Belirli a ve b için soru oluştur: {"text": String, "answer": int, "a": int, "b": int}
static func make(a: int, b: int) -> Dictionary:
	var strings: Dictionary = _load_strings()

	# Sayıları Türkçeye çevir
	var num_a_key: String = "num.%d" % a
	var num_b_key: String = "num_acc.%d" % b

	var num_a_tr: String = strings.get(num_a_key, num_a_key)
	if not strings.has(num_a_key):
		push_error("Missing string key: " + num_a_key)

	var num_b_tr: String = strings.get(num_b_key, num_b_key)
	if not strings.has(num_b_key):
		push_error("Missing string key: " + num_b_key)

	# Soru şablonunu al
	var template: String = strings.get("gate.question", "gate.question")
	if not strings.has("gate.question"):
		push_error("Missing string key: gate.question")

	var text: String = template.replace("{a}", num_a_tr).replace("{b}", num_b_tr)

	return {
		"text": text,
		"answer": a * b,
		"a": a,
		"b": b
	}

## Rastgele soru oluştur.
static func generate(rng: RandomNumberGenerator) -> Dictionary:
	var a: int = rng.randi_range(11, 19)
	var b: int = rng.randi_range(3, 9)
	return make(a, b)

## Sorunun cevabını kontrol et.
static func check(q: Dictionary, input: String) -> bool:
	var trimmed: String = input.strip_edges()

	if trimmed.is_empty():
		return false

	if not trimmed.is_valid_int():
		return false

	var answer_int: int = int(trimmed)
	var expected_answer: int = q.get("answer", -1)
	return answer_int == expected_answer
