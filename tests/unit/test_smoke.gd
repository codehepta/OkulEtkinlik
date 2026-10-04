extends GutTest
# Duman testi: ana sahne ve açılış ekranı.

func test_main_scene_is_splash() -> void:
	assert_eq(ProjectSettings.get_setting("application/run/main_scene"), "res://scenes/ui/splash.tscn")

func test_splash_instantiates() -> void:
	var s: Node = load("res://scenes/ui/splash.tscn").instantiate()
	assert_not_null(s)
	s.free()
