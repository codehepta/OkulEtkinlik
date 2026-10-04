extends GutTest
## MissingAssetsScan testleri: anahtar toplama, sınıflandırma ve rapor taslağı (saf mantık).

const Scan: GDScript = preload("res://scripts/core/missing_assets_scan.gd")

func test_is_asset_key() -> void:
	assert_true(Scan.is_asset_key("item.meyve.elma"))
	assert_true(Scan.is_asset_key("vo.sayi.3"))
	assert_true(Scan.is_asset_key("st.matematik.elma"))
	assert_false(Scan.is_asset_key("label.cetele.1"))
	assert_false(Scan.is_asset_key("node.g1.matematik.u01.n01"))
	assert_false(Scan.is_asset_key("vo.genel.aferin_%d"))
	assert_false(Scan.is_asset_key("music."))
	assert_false(Scan.is_asset_key("map.stop_"))
	assert_false(Scan.is_asset_key("Kaç elma var?"))
	assert_false(Scan.is_asset_key("ui"))

func test_collect_from_json_walks_nested_values() -> void:
	var unit: Dictionary = {
		"title_key": "unit.x",
		"nodes": [{"sticker": "st.matematik.elma", "intro_voice": "vo.a.intro", "rounds": [
			{"voice": "vo.a.r01", "params": {"item": "item.meyve.elma", "target": {"type": "number", "value": 3, "voice": "vo.sayi.3"}}},
		]}],
	}
	var out: Dictionary = {}
	Scan.collect_from_json(unit, out)
	var keys: Array = out.keys()
	keys.sort()
	assert_eq(keys, ["item.meyve.elma", "st.matematik.elma", "vo.a.intro", "vo.a.r01", "vo.sayi.3"])

func test_extract_code_keys_skips_string_keys_and_formats() -> void:
	var src: String = 'a("ui.home")\nb("map.back")\nc("vo.genel.aferin_%d" % 1)\nd("sfx.tap")\nkey = "ui.replay"\ne("music." + r)'
	var string_keys: Dictionary = {"map.back": true}
	var keys: PackedStringArray = Scan.extract_code_keys(src, string_keys)
	assert_eq(keys, PackedStringArray(["ui.home", "sfx.tap", "ui.replay"]))

func test_dynamic_keys_expand() -> void:
	var keys: PackedStringArray = Scan.dynamic_keys(PackedStringArray(["sayi_ormani"]))
	assert_true(keys.has("vo.genel.aferin_1"))
	assert_true(keys.has("vo.genel.aferin_5"))
	assert_true(keys.has("vo.genel.yildiz_3"))
	assert_true(keys.has("region.sayi_ormani.bg"))
	assert_true(keys.has("music.sayi_ormani"))
	assert_true(keys.has("map.stop_locked"))
	assert_true(keys.has("vo.sayi.20"))

func test_group_of() -> void:
	assert_eq(Scan.group_of("item.meyve.elma"), "image:item")
	assert_eq(Scan.group_of("st.matematik.elma"), "image:st")
	assert_eq(Scan.group_of("vo.sayi.3"), "voice")
	assert_eq(Scan.group_of("music.menu"), "music")
	assert_eq(Scan.group_of("sfx.tap"), "sfx")

func test_style_block_for() -> void:
	assert_eq(Scan.style_block_for("st.matematik.elma"), "STYLE_ICON")
	assert_eq(Scan.style_block_for("ui.replay"), "STYLE_ICON")
	assert_eq(Scan.style_block_for("region.sayi_ormani.bg"), "STYLE_SCENE")
	assert_eq(Scan.style_block_for("map.island"), "STYLE_SCENE")
	assert_eq(Scan.style_block_for("item.meyve.elma"), "STYLE_SPRITE")
	assert_eq(Scan.style_block_for("char.bilge.happy"), "STYLE_SPRITE")

func test_find_missing_uses_exists_callable() -> void:
	var exists: Callable = func(k: String) -> bool: return k == "ui.home"
	var missing: Dictionary = Scan.find_missing(PackedStringArray(["ui.home", "ui.replay", "vo.sayi.1", "sfx.tap"]), exists)
	assert_eq(missing.keys().size(), 3)
	assert_eq(missing["image:ui"], PackedStringArray(["ui.replay"]))
	assert_eq(missing["voice"], PackedStringArray(["vo.sayi.1"]))
	assert_eq(missing["sfx"], PackedStringArray(["sfx.tap"]))

func test_report_markdown_has_style_block_and_voice_table() -> void:
	var missing: Dictionary = {"image:ui": PackedStringArray(["ui.replay"]), "voice": PackedStringArray(["vo.sayi.1"])}
	var lines: Dictionary = {"vo.sayi.1": {"text": "bir", "speaker": "ANLATICI"}}
	var md: String = Scan.report_markdown(missing, lines)
	assert_string_contains(md, "`assets/images/ui/replay.png`")
	assert_string_contains(md, "STYLE_ICON")
	assert_string_contains(md, "| `vo.sayi.1` | `assets/audio/voice/sayi/1.wav` | ANLATICI | bir |")

func test_report_text_lists_groups() -> void:
	var missing: Dictionary = {"image:ui": PackedStringArray(["ui.replay"]), "sfx": PackedStringArray(["sfx.tap"])}
	var txt: String = Scan.report_text(missing)
	assert_string_contains(txt, "image:ui (1)")
	assert_string_contains(txt, "  ui.replay")
	assert_string_contains(txt, "sfx (1)")
