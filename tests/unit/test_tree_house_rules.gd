extends GutTest
## Ağaç evi eşikleri ve katalog (scripts/core/tree_house_rules.gd).

func test_thresholds_follow_spec() -> void:
	var got: Array[int] = []
	for i: int in 6:
		got.append(TreeHouseRules.threshold(i))
	assert_eq(got, [5, 15, 30, 50, 70, 90])

func test_unlocked_count() -> void:
	assert_eq(TreeHouseRules.unlocked_count(0, 12), 0)
	assert_eq(TreeHouseRules.unlocked_count(4, 12), 0)
	assert_eq(TreeHouseRules.unlocked_count(5, 12), 1)
	assert_eq(TreeHouseRules.unlocked_count(29, 12), 2)
	assert_eq(TreeHouseRules.unlocked_count(50, 12), 4)
	assert_eq(TreeHouseRules.unlocked_count(10000, 3), 3, "katalog boyutuyla sınırlı")

func test_catalog_items_are_unique_decor_keys() -> void:
	var items: PackedStringArray = TreeHouseRules.load_items()
	assert_gt(items.size(), 0)
	var seen: Dictionary = {}
	for k: String in items:
		assert_true(k.begins_with("decor."), k)
		assert_ne(AssetPaths.image_path(k), "", k)
		assert_false(seen.has(k), "yinelenen: " + k)
		seen[k] = true

func test_clamp_pos() -> void:
	assert_eq(TreeHouseRules.clamp_pos(Vector2(-1, 2)), Vector2(0, 1))
