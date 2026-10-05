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

## Faz 7b: ayar, sapması düzeltilmiş ustalık tahmini + tur sayısı + önceki ayarla verilir.

func test_estimate_corrects_cold_start_bias() -> void:
	# Tek kusursuz tur: m = 0.3 ama tahmin 0.3 / (1 - 0.7) = 1.0
	assert_almost_eq(Mastery.estimate(0.3, 1), 1.0, 0.0001)
	# İki tur (1.0, 0.6): m = 0.3*0.7 + 0.18 = 0.39; tahmin 0.39 / 0.51
	assert_almost_eq(Mastery.estimate(0.39, 2), 0.39 / 0.51, 0.0001)

func test_estimate_without_round_count_is_raw_mastery() -> void:
	# Eski kayıtta n yok: ham ustalık kullanılır.
	assert_almost_eq(Mastery.estimate(0.55, 0), 0.55, 0.0001)

func test_cold_outcome_plays_base() -> void:
	assert_eq(Mastery.difficulty_adjust(0.0, 0, 0), 0)

func test_up_needs_min_rounds() -> void:
	# Tahmin yüksek ama yalnızca 2 tur: henüz yükselmez.
	assert_eq(Mastery.difficulty_adjust(1.0, 2, 0), 0)
	assert_eq(Mastery.difficulty_adjust(0.9, 3, 0), 1)

func test_down_is_immediate() -> void:
	assert_eq(Mastery.difficulty_adjust(0.78, 1, 0), -1)
	assert_eq(Mastery.difficulty_adjust(0.5, 5, 1), -1)

func test_dead_zone_keeps_previous_adjust() -> void:
	# 0.78 < tahmin < 0.9: önceki ayar korunur (gidip gelme yok).
	assert_eq(Mastery.difficulty_adjust(0.85, 6, 1), 1)
	assert_eq(Mastery.difficulty_adjust(0.85, 6, -1), -1)
	assert_eq(Mastery.difficulty_adjust(0.85, 6, 0), 0)

func test_played_difficulty_clamps() -> void:
	assert_eq(Mastery.played_difficulty(1, -1), 1)
	assert_eq(Mastery.played_difficulty(3, 1), 3)
	assert_eq(Mastery.played_difficulty(2, 1), 3)
	assert_eq(Mastery.played_difficulty(2, -1), 1)
	assert_eq(Mastery.played_difficulty(2, 0), 2)

func test_apply_result_updates_record() -> void:
	var rec: Dictionary = {}
	for i: int in 3:
		Mastery.apply_result(rec, 1.0)
	assert_eq(int(rec["n"]), 3)
	assert_almost_eq(float(rec["mastery"]), 1.0 - pow(0.7, 3), 0.0001)
	assert_eq(int(rec["adj"]), 1, "üç kusursuz tur zorluğu artırır")
	Mastery.apply_result(rec, 0.0)
	assert_eq(int(rec["adj"]), -1, "yardımlı tur zorluğu hemen düşürür")
