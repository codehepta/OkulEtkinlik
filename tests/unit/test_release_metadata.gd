extends GutTest
## Faz 9 yayın hazırlığı: sürüm numaraları, export ön ayarları ve mağaza metinleri tutarlı.

const LOCALES: PackedStringArray = ["tr-TR", "en-US"]
const META: String = "res://fastlane/metadata/android"

var _cfg: ConfigFile = null

func before_all() -> void:
	_cfg = ConfigFile.new()
	_cfg.load("res://export_presets.cfg")

func _preset(name: String) -> String:
	for s: String in _cfg.get_sections():
		if not s.ends_with(".options") and str(_cfg.get_value(s, "name", "")) == name:
			return s
	return ""

func _opt(preset: String, key: String) -> Variant:
	return _cfg.get_value(_preset(preset) + ".options", key)

func _version_code() -> int:
	return int(_opt("Android", "version/code"))

func test_presets_exist() -> void:
	for p: String in ["Android", "Android AAB", "iOS"]:
		assert_ne(_preset(p), "", p)

func test_versions_match_everywhere() -> void:
	var v: String = str(ProjectSettings.get_setting("application/config/version"))
	assert_true(v.split(".").size() == 3, "anlamsal sürüm: %s" % v)
	assert_eq(str(_opt("Android", "version/name")), v)
	assert_eq(str(_opt("Android AAB", "version/name")), v)
	assert_eq(str(_opt("iOS", "application/short_version")), v)
	assert_eq(int(_opt("Android AAB", "version/code")), _version_code())
	assert_gt(_version_code(), 0)

func test_aab_preset_is_gradle_bundle_with_same_rules() -> void:
	assert_true(bool(_opt("Android AAB", "gradle_build/use_gradle_build")))
	assert_eq(int(_opt("Android AAB", "gradle_build/export_format")), 1, "AAB")
	assert_false(bool(_opt("Android AAB", "permissions/internet")))
	assert_eq(str(_opt("Android AAB", "package/unique_name")), str(_opt("Android", "package/unique_name")))
	var aab: String = _preset("Android AAB")
	var apk: String = _preset("Android")
	assert_eq(_cfg.get_value(aab, "exclude_filter"), _cfg.get_value(apk, "exclude_filter"), "testler ve araçlar pakete girmez")
	assert_eq(_cfg.get_value(aab, "include_filter"), _cfg.get_value(apk, "include_filter"))

func test_store_texts_fit_limits() -> void:
	for loc: String in LOCALES:
		var dir: String = META.path_join(loc)
		var title: String = FileAccess.get_file_as_string(dir.path_join("title.txt")).strip_edges()
		var short: String = FileAccess.get_file_as_string(dir.path_join("short_description.txt")).strip_edges()
		var full: String = FileAccess.get_file_as_string(dir.path_join("full_description.txt")).strip_edges()
		assert_between(title.length(), 1, 50, "%s başlık" % loc)
		assert_between(short.length(), 1, 80, "%s kısa açıklama" % loc)
		assert_between(full.length(), 1, 4000, "%s uzun açıklama" % loc)

func test_changelog_for_current_version_code() -> void:
	for loc: String in LOCALES:
		var path: String = META.path_join(loc).path_join("changelogs/%d.txt" % _version_code())
		assert_true(FileAccess.file_exists(path), path)
		assert_between(FileAccess.get_file_as_string(path).strip_edges().length(), 1, 500, "%s sürüm notu ≤500" % loc)
	var changelog: String = FileAccess.get_file_as_string("res://CHANGELOG.md")
	assert_string_contains(changelog, "[%s]" % str(ProjectSettings.get_setting("application/config/version")))

func test_privacy_policy_states_no_data_collection() -> void:
	var text: String = FileAccess.get_file_as_string("res://PRIVACY.md")
	assert_string_contains(text, "Veri toplamıyoruz")
	assert_string_contains(text, "collects **no data**")

func test_orientation_is_sensor_landscape_only() -> void:
	# Oyun yalnızca yatay oynanır; telefon çevrilince dikeye dönmemeli.
	# Android ve iOS export'u bu proje ayarından yönü alır.
	assert_eq(int(ProjectSettings.get_setting("display/window/handheld/orientation")),
		DisplayServer.SCREEN_SENSOR_LANDSCAPE, "yön sensor_landscape olmalı")

# --- Faz 9b: mağaza hazırlığı ---

const ICON_DIR: String = "res://assets/images/app_icon"
## Açılış ekranı ve iOS başlatma ekranı rengi: ilk sahnenin (ada haritası) deniz rengi.
const SPLASH_BG: Color = Color8(95, 201, 197)
## Google Play: yeni uygulama ve güncellemeler 31 Ağustos 2026'dan beri API 36 hedeflemeli.
const PLAY_MIN_TARGET_SDK: int = 36

func _icon_image(file: String) -> Image:
	return Image.load_from_file(ProjectSettings.globalize_path(ICON_DIR.path_join(file)))

func test_app_icon_is_set_everywhere() -> void:
	assert_eq(str(ProjectSettings.get_setting("application/config/icon")), ICON_DIR.path_join("icon_1024.png"))
	for p: String in ["Android", "Android AAB"]:
		assert_eq(str(_opt(p, "launcher_icons/main_192x192")), ICON_DIR.path_join("android_main_192.png"), p)
		assert_eq(str(_opt(p, "launcher_icons/adaptive_foreground_432x432")), ICON_DIR.path_join("android_foreground_432.png"), p)
		assert_eq(str(_opt(p, "launcher_icons/adaptive_background_432x432")), ICON_DIR.path_join("android_background_432.png"), p)
		assert_eq(str(_opt(p, "launcher_icons/adaptive_monochrome_432x432")), ICON_DIR.path_join("android_monochrome_432.png"), p)
	for k: String in ["icons/icon_1024x1024", "icons/app_store_1024x1024"]:
		assert_eq(str(_opt("iOS", k)), ICON_DIR.path_join("icon_1024.png"), k)

func test_icon_files_have_store_sizes() -> void:
	var main: Image = _icon_image("icon_1024.png")
	assert_eq(main.get_size(), Vector2i(1024, 1024))
	assert_eq(main.detect_alpha(), Image.ALPHA_NONE, "App Store simgesi saydamlık içermez")
	assert_eq(_icon_image("android_main_192.png").get_size(), Vector2i(192, 192))
	for f: String in ["android_foreground_432.png", "android_background_432.png", "android_monochrome_432.png"]:
		assert_eq(_icon_image(f).get_size(), Vector2i(432, 432), f)
	assert_ne(_icon_image("android_foreground_432.png").detect_alpha(), Image.ALPHA_NONE, "ön katman saydam")
	assert_ne(_icon_image("android_monochrome_432.png").detect_alpha(), Image.ALPHA_NONE, "tek renk katman saydam")

func test_boot_splash_shows_no_engine_logo() -> void:
	assert_false(bool(ProjectSettings.get_setting("application/boot_splash/show_image")))
	assert_true((ProjectSettings.get_setting("application/boot_splash/bg_color") as Color).is_equal_approx(SPLASH_BG))
	assert_true(bool(_opt("iOS", "storyboard/use_custom_bg_color")))
	assert_true((_opt("iOS", "storyboard/custom_bg_color") as Color).is_equal_approx(SPLASH_BG))

func test_ios_launch_screen_uses_our_image_not_engine_logo() -> void:
	# iOS başlatma ekranı (storyboard) görsel verilmezse Godot logosunu koyar; show_image=false
	# yalnız oyun içi açılışı kapatır.
	var want: Dictionary = {"storyboard/custom_image@2x": Vector2i(480, 480), "storyboard/custom_image@3x": Vector2i(720, 720)}
	for k: String in want:
		var path: String = str(_opt("iOS", k))
		assert_true(path.begins_with(ICON_DIR), "%s: %s" % [k, path])
		var img: Image = Image.load_from_file(ProjectSettings.globalize_path(path))
		assert_not_null(img, path)
		if img != null:
			assert_eq(img.get_size(), want[k] as Vector2i, k)
			assert_ne(img.detect_alpha(), Image.ALPHA_NONE, "zemin saydam; arkada deniz rengi görünür")

func test_aab_targets_play_minimum_sdk() -> void:
	assert_gte(int(str(_opt("Android AAB", "gradle_build/target_sdk"))), PLAY_MIN_TARGET_SDK)

func test_ios_declares_exempt_encryption() -> void:
	# App Store Connect her yüklemede şifreleme beyanı sorar; uygulama ağ ve şifreleme kullanmaz.
	var plist: String = str(_opt("iOS", "application/additional_plist_content"))
	assert_string_contains(plist, "<key>ITSAppUsesNonExemptEncryption</key>")
	assert_string_contains(plist, "<false/>")

func test_ios_backup_is_reachable_from_files_app() -> void:
	# Veli panelindeki yedek user:// altına yazılır; iOS'ta veli ona yalnızca Dosyalar'dan ulaşır.
	assert_true(bool(_opt("iOS", "user_data/accessible_from_files_app")))

func test_ios_usage_descriptions_are_not_empty() -> void:
	# Motor ses/kamera API'lerine bağlı; App Store'un otomatik denetimi boş açıklamayı reddeder.
	# Uygulama bu izinleri hiç istemez; açıklama bunu söyler.
	for k: String in ["privacy/camera_usage_description", "privacy/microphone_usage_description", "privacy/photolibrary_usage_description"]:
		assert_gt(str(_opt("iOS", k)).strip_edges().length(), 0, k)

const IOS_META: String = "res://fastlane/metadata/ios"
const IOS_LOCALES: PackedStringArray = ["tr", "en-US"]
## App Store Connect alan sınırları (karakter; anahtar kelimelerde bayt sayısı da aşılmamalı).
const IOS_LIMITS: Dictionary = {
	"name.txt": 30, "subtitle.txt": 30, "keywords.txt": 100, "promotional_text.txt": 170,
	"description.txt": 4000, "release_notes.txt": 4000,
}

func _text(path: String) -> String:
	return FileAccess.get_file_as_string(path).strip_edges()

func test_app_store_texts_fit_limits() -> void:
	for loc: String in IOS_LOCALES:
		for f: String in IOS_LIMITS:
			var t: String = _text(IOS_META.path_join(loc).path_join(f))
			assert_between(t.length(), 1, int(IOS_LIMITS[f]), "%s/%s" % [loc, f])
		assert_lte(_text(IOS_META.path_join(loc).path_join("keywords.txt")).to_utf8_buffer().size(), 100, "%s anahtar kelime baytı" % loc)
		for f: String in ["support_url.txt", "marketing_url.txt", "privacy_url.txt"]:
			assert_true(_text(IOS_META.path_join(loc).path_join(f)).begins_with("https://"), "%s/%s" % [loc, f])

func test_app_store_name_matches_project() -> void:
	for loc: String in IOS_LOCALES:
		assert_eq(_text(IOS_META.path_join(loc).path_join("name.txt")), str(ProjectSettings.get_setting("application/config/name")))

func _image_size(path: String) -> Vector2i:
	var img: Image = Image.load_from_file(ProjectSettings.globalize_path(path))
	return img.get_size() if img != null else Vector2i.ZERO

func test_play_store_graphics_have_required_sizes() -> void:
	var dir: String = "res://fastlane/metadata/android/en-US/images"
	assert_eq(_image_size(dir.path_join("icon.png")), Vector2i(512, 512))
	assert_eq(_image_size(dir.path_join("featureGraphic.jpg")), Vector2i(1024, 500))
	for sub: String in ["phoneScreenshots", "sevenInchScreenshots", "tenInchScreenshots"]:
		var files: PackedStringArray = DirAccess.get_files_at(dir.path_join(sub))
		assert_between(files.size(), 2, 8, "%s: Play 2–8 kare ister" % sub)
		for f: String in files:
			var s: Vector2i = _image_size(dir.path_join(sub).path_join(f))
			assert_between(mini(s.x, s.y), 320, 3840, "%s/%s kenar" % [sub, f])
			assert_lte(float(maxi(s.x, s.y)) / float(mini(s.x, s.y)), 2.0, "%s/%s en-boy ≤ 2:1" % [sub, f])

func test_app_store_screenshots_match_device_sizes() -> void:
	# iPhone 6.9" ve iPad 13" (yatay); App Store en az 1, en çok 10 kare kabul eder.
	var want: Dictionary = {"iphone_69": Vector2i(2868, 1320), "ipad_13": Vector2i(2752, 2064)}
	var dir: String = "res://fastlane/screenshots/tr"
	var files: PackedStringArray = DirAccess.get_files_at(dir)
	for device: String in want:
		var n: int = 0
		for f: String in files:
			if f.begins_with(device + "_"):
				n += 1
				assert_eq(_image_size(dir.path_join(f)), want[device] as Vector2i, f)
		assert_between(n, 1, 10, device)
