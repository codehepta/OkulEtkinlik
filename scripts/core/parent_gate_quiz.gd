class_name ParentGateQuiz
## Veli kapısı çarpım sorusu üreticisi.

# Özel statik yardımcı: strings.tr.json yükler ve önbelleğe alır.
var _strings_cache: Dictionary
var _initialized: bool = false

static var _instance: ParentGateQuiz = ParentGateQuiz.new()

## Strings.tr.json dosyasından bir değeri okur (statik çağrı için).
static func _load_strings() -> Dictionary:
	if _instance._initialized:
		return _instance._strings_cache

	var json_path: String = "res://content/strings.tr.json"
	if not ResourceLoader.exists(json_path):
		return {}

	var file: FileAccess = FileAccess.open(json_path, FileAccess.READ)
	if file == null:
		return {}

	var file_content: String = file.get_as_text()
	var json: JSON = JSON.new()
	var _error: int = json.parse(file_content)
	var result: Dictionary = json.get_data() if json.get_data() is Dictionary else {}

	_instance._strings_cache = result
	_instance._initialized = true
	return result

## Belirli a ve b için soru oluştur: {"text": String, "answer": int, "a": int, "b": int}
static func make(a: int, b: int) -> Dictionary:
	var strings: Dictionary = _load_strings()

	# Sayıları Türkçeye çevir
	var num_a_key: String = "num.%d" % a
	var num_b_key: String = "num_acc.%d" % b

	var num_a_tr: String = strings.get(num_a_key, "")
	var num_b_tr: String = strings.get(num_b_key, "")

	# Soru şablonunu al ve yerleştiricileri değiştir
	var template: String = strings.get("gate.question", "{a} ile {b} çarpın.")
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
	return answer_int == q["answer"]
