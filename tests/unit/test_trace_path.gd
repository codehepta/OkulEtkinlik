extends GutTest
## trace şablonunun saf mantığı: glif verisi, örnekleme, yerleşim ve iz takibi.

const TracePath: GDScript = preload("res://scripts/core/trace_path.gd")
const LOWER: String = "abcçdefgğhıijklmnoöprsştuüvyz"
const UPPER: String = "ABCÇDEFGĞHIİJKLMNOÖPRSŞTUÜVYZ"
const DIGITS: String = "0123456789"

func test_alphabet_and_digits_have_glyphs() -> void:
	assert_eq(LOWER.length(), 29)
	assert_eq(UPPER.length(), 29)
	for ch: String in LOWER + UPPER + DIGITS:
		assert_true(TracePath.has_glyph(ch), "glif olmalı: " + ch)

func test_all_glyphs_valid_and_inside_band() -> void:
	var g: Dictionary = TracePath.glyphs()
	assert_gt(g.size(), 0)
	for ch: String in g:
		assert_true(TracePath.is_valid_glyph(g[ch]), "geçerli glif: " + ch)
		for s: Variant in (g[ch] as Dictionary)["strokes"]:
			for p: Vector2 in TracePath.sample_stroke(s as Array):
				assert_true(p.y >= TracePath.BAND_TOP and p.y <= TracePath.BAND_BOTTOM, "%s bant içinde: %s" % [ch, p])

## Bir yay, kalemin bulunduğu yerden başlamalı (veri hatası araya uzun düz çizgi eklerdi).
func test_arcs_start_at_pen() -> void:
	var g: Dictionary = TracePath.glyphs()
	for ch: String in g:
		for s: Variant in (g[ch] as Dictionary)["strokes"]:
			var ops: Array = s as Array
			for i: int in range(1, ops.size()):
				var op: Array = ops[i]
				if str(op[0]) != "A":
					continue
				var before: PackedVector2Array = TracePath.sample_stroke(ops.slice(0, i))
				var pen: Vector2 = before[before.size() - 1]
				var a0: float = deg_to_rad(float(op[5]))
				var start: Vector2 = Vector2(float(op[1]), float(op[2])) + Vector2(cos(a0), sin(a0)) * Vector2(float(op[3]), float(op[4]))
				assert_lt(pen.distance_to(start), 0.06, "%s yayı kalemden başlar" % ch)

func test_invalid_glyph_shapes() -> void:
	assert_false(TracePath.is_valid_glyph({}))
	assert_false(TracePath.is_valid_glyph({"strokes": []}))
	assert_false(TracePath.is_valid_glyph({"strokes": [[["L", 1, 1]]]}), "L ile başlayamaz")
	assert_false(TracePath.is_valid_glyph({"strokes": [[["M", 0, 0], ["M", 1, 1]]]}), "ikinci M")
	assert_false(TracePath.is_valid_glyph({"strokes": [[["D", 0, 0], ["L", 1, 1]]]}), "nokta tek başına")
	assert_false(TracePath.is_valid_glyph({"strokes": [[["A", 0, 0, 1]]]}), "eksik yay")
	assert_true(TracePath.is_valid_glyph({"strokes": [[["M", 0, 0], ["L", 0, 2]], [["D", 0, 0.5]]]}))

func test_sample_stroke_is_dense() -> void:
	var pts: PackedVector2Array = TracePath.sample_stroke([["M", 0, 0], ["L", 0, 2]])
	assert_eq(pts[0], Vector2(0, 0))
	assert_eq(pts[pts.size() - 1], Vector2(0, 2))
	for i: int in range(1, pts.size()):
		assert_lt(pts[i - 1].distance_to(pts[i]), 0.06)

func test_layout_places_glyphs_left_to_right() -> void:
	var lay: Dictionary = TracePath.layout("ab")
	var strokes: Array = lay["strokes"]
	var glyph_of: Array = lay["glyph_of"]
	assert_eq(strokes.size(), 4, "a: 2 vuruş, b: 2 vuruş")
	assert_eq(glyph_of, [0, 0, 1, 1])
	var a_max: float = -INF
	var b_min: float = INF
	for i: int in strokes.size():
		for p: Vector2 in strokes[i] as PackedVector2Array:
			if int(glyph_of[i]) == 0:
				a_max = maxf(a_max, p.x)
			else:
				b_min = minf(b_min, p.x)
	assert_gt(b_min, a_max, "glifler üst üste binmez")
	var bounds: Rect2 = lay["bounds"]
	assert_almost_eq(bounds.position.x, 0.0, 0.001)
	assert_almost_eq(bounds.end.x, b_min + 0.9, 0.05)

func _tracker(text_ops: Array, tol: float = 0.3) -> RefCounted:
	return TracePath.Tracker.new(TracePath.sample_stroke(text_ops), tol)

func test_tracker_follow_path_done() -> void:
	var t: RefCounted = _tracker([["M", 0, 0], ["L", 0, 2]])
	assert_true(t.can_start(Vector2(0.1, 0.05)))
	assert_false(t.can_start(Vector2(1.5, 1.0)))
	var res: int = TracePath.Tracker.ON
	for k: int in 21:
		res = t.feed(Vector2(0.12, k * 0.1))
		if res != TracePath.Tracker.ON:
			break
	assert_eq(res, TracePath.Tracker.DONE)
	assert_eq(t.ratio(), 1.0)

func test_tracker_off_path() -> void:
	var t: RefCounted = _tracker([["M", 0, 0], ["L", 0, 2]])
	assert_eq(t.feed(Vector2(0, 0.2)), TracePath.Tracker.ON)
	assert_eq(t.feed(Vector2(1.5, 0.3)), TracePath.Tracker.OFF)
	assert_gt(t.progress, 0, "ilerleme korunur")

func test_tracker_cannot_jump_ahead() -> void:
	var t: RefCounted = _tracker([["M", 0, 0], ["L", 0, 2]])
	assert_eq(t.feed(Vector2(0, 1.9)), TracePath.Tracker.OFF, "sona atlamak yoldan çıkmaktır")
	assert_eq(t.progress, 0)

func test_tracker_closed_loop_needs_full_circle() -> void:
	var t: RefCounted = _tracker([["A", 0.45, 1.5, 0.45, 0.5, -90, -450]])
	# Başlangıç ve bitiş aynı nokta: başta dokunmak bitirmez.
	assert_eq(t.feed(t.anchor()), TracePath.Tracker.ON)
	assert_lt(t.ratio(), 0.1)

func test_tracker_feed_segment_fast_swipe() -> void:
	var t: RefCounted = _tracker([["M", 0, 0], ["L", 0, 2]])
	assert_eq(t.feed_segment(Vector2(0, 0), Vector2(0, 2)), TracePath.Tracker.DONE, "ara noktalar beslenir")

func test_tracker_reverse_direction_not_done() -> void:
	var t: RefCounted = _tracker([["M", 0, 0], ["L", 0, 2]])
	assert_false(t.can_start(Vector2(0, 2)), "ters uçtan başlanmaz")

func test_tracker_dot() -> void:
	var t: RefCounted = _tracker([["D", 0, 0.5]])
	assert_true(t.is_dot())
	assert_eq(t.feed(Vector2(0.1, 0.55)), TracePath.Tracker.DONE)
