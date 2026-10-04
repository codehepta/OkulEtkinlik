class_name ParentGateQuiz
## Veli kapısı çarpım sorusu üreticisi.

## Belirli a ve b için soru oluştur: {"text": String, "answer": int, "a": int, "b": int}
## Metinler Strings autoload'undan gelir (sahne ağacı gerekir).
static func make(a: int, b: int) -> Dictionary:
	var strings: Node = (Engine.get_main_loop() as SceneTree).root.get_node("Strings")
	var text: String = strings.call("t", "gate.question", {
		"a": strings.call("t", "num.%d" % a),
		"b": strings.call("t", "num_acc.%d" % b),
	})
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
