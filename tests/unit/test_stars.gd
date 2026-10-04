extends GutTest
# Yıldız puanı hesaplama testleri.

func test_compute_no_wrong() -> void:
	# total_wrong = 0 ≤ 1 → 3 yıldız
	assert_eq(Stars.compute(0), 3)

func test_compute_one_wrong() -> void:
	# total_wrong = 1 ≤ 1 → 3 yıldız
	assert_eq(Stars.compute(1), 3)

func test_compute_two_wrong() -> void:
	# total_wrong = 2 (1 < 2 ≤ 3) → 2 yıldız
	assert_eq(Stars.compute(2), 2)

func test_compute_three_wrong() -> void:
	# total_wrong = 3 ≤ 3 → 2 yıldız
	assert_eq(Stars.compute(3), 2)

func test_compute_four_wrong() -> void:
	# total_wrong = 4 > 3 → 1 yıldız
	assert_eq(Stars.compute(4), 1)
