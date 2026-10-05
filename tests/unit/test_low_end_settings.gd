extends GutTest
## Faz 8 düşük cihaz ayarları (2 GB RAM, Android 8): proje ayarları sabit kalsın.

func test_mobile_uses_compatibility_renderer() -> void:
	# Android 8 dönemi cihazların çoğunda Vulkan yok ya da kararsız; uygulama 2B'dir.
	assert_eq(str(ProjectSettings.get_setting("rendering/renderer/rendering_method.mobile")), "gl_compatibility")

func test_etc2_textures_for_android() -> void:
	assert_true(bool(ProjectSettings.get_setting("rendering/textures/vram_compression/import_etc2_astc")))

func test_android_export_has_no_permissions_and_arm_targets() -> void:
	var cfg: ConfigFile = ConfigFile.new()
	assert_eq(cfg.load("res://export_presets.cfg"), OK)
	var android: String = ""
	for s: String in cfg.get_sections():
		if s.ends_with(".options"):
			continue
		if str(cfg.get_value(s, "platform", "")) == "Android" and str(cfg.get_value(s, "name", "")) == "Android":
			android = s
	assert_ne(android, "", "Android ön ayarı")
	var opts: String = android + ".options"
	assert_true(bool(cfg.get_value(opts, "architectures/arm64-v8a", false)), "arm64")
	assert_true(bool(cfg.get_value(opts, "architectures/armeabi-v7a", false)), "32 bit eski cihazlar")
	assert_false(bool(cfg.get_value(opts, "permissions/internet", false)), "INTERNET kapalı")
	# Boş değer Godot'nun varsayılanıdır (API 24); elle verilirse Android 8'i (API 26) dışlamamalı.
	var min_sdk: String = str(cfg.get_value(opts, "gradle_build/min_sdk", ""))
	if not min_sdk.is_empty():
		assert_lte(int(min_sdk), 26, "Android 8 (API 26) desteklenir")
