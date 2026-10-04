extends GutTest
# Leitner kartı kutusu ve tekrar programı için testler.

func test_promote_from_box_one() -> void:
	# promote(1) = 2
	assert_eq(Leitner.promote(1), 2)

func test_promote_at_max_box() -> void:
	# promote(5) = 5 (kutu 5'te kalır)
	assert_eq(Leitner.promote(5), 5)

func test_reset_returns_one() -> void:
	# reset() = 1 (kutu 1'e dönme)
	assert_eq(Leitner.reset(), 1)

func test_due_day_box_one() -> void:
	# due_day(1, 100) = 100 + INTERVALS[0] = 100 + 0 = 100
	assert_eq(Leitner.due_day(1, 100), 100)

func test_due_day_box_four() -> void:
	# due_day(4, 100) = 100 + INTERVALS[3] = 100 + 7 = 107
	assert_eq(Leitner.due_day(4, 100), 107)

func test_due_day_box_five() -> void:
	# due_day(5, 100) = 100 + INTERVALS[4] = 100 + 14 = 114
	assert_eq(Leitner.due_day(5, 100), 114)

func test_is_due_today() -> void:
	# is_due(100, 100) → true (due_day <= today)
	assert_true(Leitner.is_due(100, 100))

func test_is_due_future() -> void:
	# is_due(101, 100) → false (due_day > today)
	assert_false(Leitner.is_due(101, 100))
