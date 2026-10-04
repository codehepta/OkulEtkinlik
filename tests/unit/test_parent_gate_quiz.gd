extends GutTest
# Veli kapısı soru üreticisi için testler.

func test_generate_returns_dict_with_required_keys() -> void:
	# generate() sözlük döner: text, answer ve opsiyonel a, b
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 42
	var q: Dictionary = ParentGateQuiz.generate(rng)
	assert_true(q.has("text"))
	assert_true(q.has("answer"))
	assert_true(q["text"] is String)
	assert_true(q["answer"] is int)

func test_generate_answer_is_product() -> void:
	# answer == a * b
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 42
	var q: Dictionary = ParentGateQuiz.generate(rng)
	assert_true(q.has("a"))
	assert_true(q.has("b"))
	assert_eq(q["answer"], q["a"] * q["b"])

func test_generate_text_contains_formatting() -> void:
	# Metin " ile " ve " çarpın." içerir
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 42
	var q: Dictionary = ParentGateQuiz.generate(rng)
	assert_true(q["text"].contains(" ile "))
	assert_true(q["text"].contains(" çarpın."))

func test_generate_a_range() -> void:
	# 1000 üretim: A ∈ [11,19]
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 42
	for _i in range(1000):
		var q: Dictionary = ParentGateQuiz.generate(rng)
		assert_true(q["a"] >= 11 and q["a"] <= 19)

func test_generate_b_range() -> void:
	# 1000 üretim: B ∈ [3,9]
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 42
	for _i in range(1000):
		var q: Dictionary = ParentGateQuiz.generate(rng)
		assert_true(q["b"] >= 3 and q["b"] <= 9)

func test_check_correct_answer() -> void:
	# check(q, "84") doğru cevap için true
	var q: Dictionary = {"text": "on dört ile altıyı çarpın.", "answer": 84, "a": 14, "b": 6}
	assert_true(ParentGateQuiz.check(q, "84"))

func test_check_correct_answer_with_whitespace() -> void:
	# check(q, " 84 ") boşluk kırpılması ile true
	var q: Dictionary = {"text": "on dört ile altıyı çarpın.", "answer": 84, "a": 14, "b": 6}
	assert_true(ParentGateQuiz.check(q, " 84 "))

func test_check_wrong_answer() -> void:
	# check(q, "abc") false
	var q: Dictionary = {"text": "on dört ile altıyı çarpın.", "answer": 84, "a": 14, "b": 6}
	assert_false(ParentGateQuiz.check(q, "abc"))

func test_check_empty_string() -> void:
	# check(q, "") false
	var q: Dictionary = {"text": "on dört ile altıyı çarpın.", "answer": 84, "a": 14, "b": 6}
	assert_false(ParentGateQuiz.check(q, ""))

func test_check_wrong_number() -> void:
	# check(q, "50") yanlış cevap için false
	var q: Dictionary = {"text": "on dört ile altıyı çarpın.", "answer": 84, "a": 14, "b": 6}
	assert_false(ParentGateQuiz.check(q, "50"))

func test_make_14_6() -> void:
	# make(14, 6) → metin "on dört ile altıyı çarpın.", answer = 84
	var q: Dictionary = ParentGateQuiz.make(14, 6)
	assert_eq(q["text"], "on dört ile altıyı çarpın.")
	assert_eq(q["answer"], 84)

func test_make_11_3() -> void:
	# make(11, 3) → metin "on bir ile üçü çarpın.", answer = 33
	var q: Dictionary = ParentGateQuiz.make(11, 3)
	assert_eq(q["text"], "on bir ile üçü çarpın.")
	assert_eq(q["answer"], 33)

func test_make_19_9() -> void:
	# make(19, 9) → metin "on dokuz ile dokuzu çarpın.", answer = 171
	var q: Dictionary = ParentGateQuiz.make(19, 9)
	assert_eq(q["text"], "on dokuz ile dokuzu çarpın.")
	assert_eq(q["answer"], 171)
