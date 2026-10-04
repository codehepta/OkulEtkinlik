extends GutTest
## Tahmin et → kontrol et → karşılaştır modunun saf mantığı (Faz 3b).

const Estimate: GDScript = preload("res://scripts/core/estimate.gd")

func test_default_tolerance_is_a_fifth_at_least_one() -> void:
	assert_eq(Estimate.tolerance(3), 1)
	assert_eq(Estimate.tolerance(7), 1)
	assert_eq(Estimate.tolerance(15), 3)
	assert_eq(Estimate.tolerance(50), 10)
	assert_eq(Estimate.tolerance(100), 20)

func test_near_and_far() -> void:
	assert_true(Estimate.is_near(10, 12, 3))
	assert_true(Estimate.is_near(15, 12, 3), "fark tam sınırda: yakın")
	assert_false(Estimate.is_near(5, 12, 3))
	assert_true(Estimate.is_near(7, 7, 1))

func test_judge_index() -> void:
	assert_eq(Estimate.judge_index(10, 12, 3), Estimate.NEAR)
	assert_eq(Estimate.judge_index(20, 12, 3), Estimate.FAR)

func test_validate_estimates() -> void:
	assert_true(Estimate.valid_estimates([5, 10, 15], 1000))
	assert_true(Estimate.valid_estimates([5, 20], 1000))
	assert_false(Estimate.valid_estimates([5], 1000), "en az 2")
	assert_false(Estimate.valid_estimates([5, 10, 15, 20, 25], 1000), "en çok 4")
	assert_false(Estimate.valid_estimates([10, 5], 1000), "artan sıra")
	assert_false(Estimate.valid_estimates([5, 5], 1000), "tekrarsız")
	assert_false(Estimate.valid_estimates([5, 2000], 1000), "üst sınır")
	assert_false(Estimate.valid_estimates("x", 1000))

func test_estimates_must_allow_both_judgements() -> void:
	# Hiçbir seçenek uzak (ya da hiçbiri yakın) değilse yargı sorusu anlamsızdır.
	assert_true(Estimate.both_judgements_possible([5, 10, 20], 10, 2))
	assert_false(Estimate.both_judgements_possible([9, 10, 11], 10, 2), "hepsi yakın")
	assert_false(Estimate.both_judgements_possible([1, 30], 10, 2), "hepsi uzak")
