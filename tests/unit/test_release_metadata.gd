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
