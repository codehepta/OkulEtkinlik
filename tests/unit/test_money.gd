extends GutTest
## Para küpürleri ve ödeme hesapları.

const Money: GDScript = preload("res://scripts/core/money.gd")

func test_allowed_by_unit() -> void:
	assert_true(Money.allowed("tl", "tl_5"))
	assert_true(Money.allowed("tl", "tl_1"))
	assert_false(Money.allowed("tl", "kr_50"))
	assert_true(Money.allowed("kr", "kr_25"))
	assert_true(Money.allowed("kr", "tl_1"), "1 lira = 100 kuruş")
	assert_false(Money.allowed("kr", "tl_5"))
	assert_false(Money.allowed("kr", "tl_3"))

func test_value_and_total() -> void:
	assert_eq(Money.value_in("tl", "tl_20"), 20)
	assert_eq(Money.value_in("kr", "tl_1"), 100)
	assert_eq(Money.total("tl", ["tl_5", "tl_10", "tl_1", "tl_1"]), 17)
	assert_eq(Money.total("kr", ["kr_50", "kr_25", "tl_1"]), 175)

func test_min_pieces() -> void:
	assert_eq(Money.min_pieces(75, [50, 25, 10, 5] as Array[int]), [50, 25] as Array[int])
	assert_eq(Money.min_pieces(30, [25, 10] as Array[int]), [10, 10, 10] as Array[int], "açgözlü değil, en az parça")
	assert_eq(Money.min_pieces(7, [5, 10] as Array[int]), [] as Array[int], "ödenemez")
	assert_eq(Money.min_pieces(0, [5] as Array[int]), [] as Array[int])

func test_image_keys_cover_all_denoms() -> void:
	for d: String in Money.KURUS:
		assert_eq(str(Money.IMAGE_KEYS[d]), "item.para." + d)
		assert_true(AssetPaths.image_path(str(Money.IMAGE_KEYS[d])).ends_with("/items/para/%s.png" % d))

## Faz 3b S3: 1 kuruş küpür listesinde yok.
func test_one_kurus_removed() -> void:
	assert_false(Money.is_denom("kr_1"))
	assert_false(Money.allowed("kr", "kr_1"))
