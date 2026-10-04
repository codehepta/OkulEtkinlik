extends GutTest
## Tekrar Bulutu tur seçimi (scripts/core/review_picker.gd).

const ReviewPicker: GDScript = preload("res://scripts/core/review_picker.gd")

func _node(id: String, outs: Array, n_rounds: int) -> Dictionary:
	var rounds: Array = []
	for i: int in n_rounds:
		rounds.append({"template": "count_choose", "difficulty": 1, "voice": "%s.r%d" % [id, i], "params": {}})
	return {"id": id, "outcomes": outs, "rounds": rounds}

func _nodes(list: Array) -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	out.assign(list)
	return out

func _rng(s: int = 1) -> RandomNumberGenerator:
	var r: RandomNumberGenerator = RandomNumberGenerator.new()
	r.seed = s
	return r

func test_three_rounds_mixed_across_due_outcomes() -> void:
	var nodes: Array[Dictionary] = _nodes([_node("a", ["A"], 3), _node("b", ["B"], 3), _node("c", ["C"], 3)])
	var got: Array[Dictionary] = ReviewPicker.pick(PackedStringArray(["A", "B", "C"]), nodes, _rng())
	assert_eq(got.size(), 3)
	var codes: Dictionary = {}
	for r: Dictionary in got:
		codes[r["outcomes"][0]] = true
	assert_eq(codes.size(), 3, "her vadesi gelen çıktıdan birer tur")

func test_fills_from_same_outcome_without_repeating_round() -> void:
	var got: Array[Dictionary] = ReviewPicker.pick(PackedStringArray(["A"]), _nodes([_node("a", ["A"], 2)]), _rng())
	assert_eq(got.size(), 2, "yeterli tur yoksa olan kadar")
	assert_ne(got[0]["voice"], got[1]["voice"])

func test_oldest_due_first_when_more_outcomes_than_rounds() -> void:
	var nodes: Array[Dictionary] = _nodes([_node("a", ["A"], 1), _node("b", ["B"], 1), _node("c", ["C"], 1), _node("d", ["D"], 1)])
	var got: Array[Dictionary] = ReviewPicker.pick(PackedStringArray(["D", "A", "B", "C"]), nodes, _rng())
	var codes: Array = got.map(func(r: Dictionary) -> String: return str(r["outcomes"][0]))
	assert_false(codes.has("C"), "en son vadeli çıktı dışarıda kalır")
	assert_true(codes.has("D"))

func test_no_candidates_returns_empty() -> void:
	assert_eq(ReviewPicker.pick(PackedStringArray(["X"]), _nodes([_node("a", ["A"], 2)]), _rng()).size(), 0)

func test_does_not_mutate_content() -> void:
	var n: Dictionary = _node("a", ["A"], 1)
	var got: Array[Dictionary] = ReviewPicker.pick(PackedStringArray(["A"]), _nodes([n]), _rng())
	got[0]["params"]["x"] = 1
	assert_false((n["rounds"][0] as Dictionary).has("outcomes"))
	assert_eq(n["rounds"][0]["params"], {})
