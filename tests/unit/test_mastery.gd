extends GutTest
# Mastery kalitesi ve zorluk düzeyi hesapları için testler.

func test_result_value_first_attempt() -> void:
	# 1. deneme başarı = 1.0
	assert_eq(Mastery.result_value(1, false), 1.0)

func test_result_value_second_attempt() -> void:
	# 2. deneme başarı = 0.6
	assert_eq(Mastery.result_value(2, false), 0.6)

func test_result_value_third_attempt_not_helped() -> void:
	# 3. deneme başarı, yardım olmadan = 0.3
	assert_eq(Mastery.result_value(3, false), 0.3)

func test_result_value_third_attempt_helped() -> void:
	# 3. deneme, yardım alındı = 0.0
	assert_eq(Mastery.result_value(3, true), 0.0)

func test_update_zero_mastery_perfect() -> void:
	# update(0.0, 1.0) = 0.0*0.7 + 1.0*0.3 = 0.3
	assert_almost_eq(Mastery.update(0.0, 1.0), 0.3, 0.0001)

func test_update_half_mastery() -> void:
	# update(0.5, 0.6) = 0.5*0.7 + 0.6*0.3 = 0.35 + 0.18 = 0.53
	assert_almost_eq(Mastery.update(0.5, 0.6), 0.53, 0.0001)

func test_difficulty_adjust_high_mastery() -> void:
	# m >= 0.8 → +1
	assert_eq(Mastery.difficulty_adjust(0.8), 1)

func test_difficulty_adjust_low_mastery() -> void:
	# m <= 0.4 → -1
	assert_eq(Mastery.difficulty_adjust(0.4), -1)

func test_difficulty_adjust_mid_mastery() -> void:
	# 0.4 < m < 0.8 → 0
	assert_eq(Mastery.difficulty_adjust(0.6), 0)

func test_played_difficulty_lower_bound() -> void:
	# played_difficulty = clamp(base + adj, 1, 3)
	# base=1, m=0.0 → adj=-1 → clamp(1-1, 1, 3) = 1
	assert_eq(Mastery.played_difficulty(1, 0.0), 1)

func test_played_difficulty_upper_bound() -> void:
	# base=3, m=0.9 → adj=1 → clamp(3+1, 1, 3) = 3
	assert_eq(Mastery.played_difficulty(3, 0.9), 3)

func test_played_difficulty_increase() -> void:
	# base=2, m=0.9 → adj=1 → clamp(2+1, 1, 3) = 3
	assert_eq(Mastery.played_difficulty(2, 0.9), 3)
