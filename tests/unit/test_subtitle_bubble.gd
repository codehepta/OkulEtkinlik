extends GutTest
## Altyazı görünürlük kuralı.

func test_visibility_rules() -> void:
	var B: GDScript = load("res://scenes/components/subtitle_bubble.gd")
	assert_true(B.should_show(0, false, false), "sınıf bilinmiyor: göster")
	assert_true(B.should_show(2, false, false), "2. sınıf: göster")
	assert_false(B.should_show(1, false, false), "1. sınıf, kapalı: gizle")
	assert_true(B.should_show(1, true, false), "1. sınıf, açık: göster")
	assert_true(B.should_show(1, false, true), "sessiz yol: her durumda göster")
