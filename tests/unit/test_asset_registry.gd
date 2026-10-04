extends GutTest
## AssetRegistry testleri: eksik anahtar, kök geçersiz kılma, yer tutucu bileşen.

const REGISTRY_SCRIPT: String = "res://autoload/asset_registry.gd"
const FIXTURE_ROOT: String = "res://tests/fixtures/assets"

var _reg: Node = null

func before_each() -> void:
	_reg = load(REGISTRY_SCRIPT).new()

func after_each() -> void:
	_reg.free()
	_reg = null

func test_missing_texture_returns_null_and_is_reported() -> void:
	assert_null(_reg.texture("item.yok.yok"))
	assert_true(_reg.missing_keys().has("item.yok.yok"))

func test_missing_keys_unique() -> void:
	_reg.texture("item.yok.yok")
	_reg.texture("item.yok.yok")
	_reg.audio("vo.yok.yok")
	assert_eq(_reg.missing_keys().size(), 2)

func test_missing_audio_returns_null() -> void:
	assert_null(_reg.audio("sfx.yok"))
	assert_true(_reg.missing_keys().has("sfx.yok"))

func test_root_override_loads_fixture() -> void:
	_reg.set_root_override(FIXTURE_ROOT)
	var tex: Texture2D = _reg.texture("ui.test_fixture")
	assert_not_null(tex)
	assert_eq(_reg.missing_keys().size(), 0)

func test_root_override_reset_restores_default() -> void:
	_reg.set_root_override(FIXTURE_ROOT)
	_reg.set_root_override("")
	assert_null(_reg.texture("ui.test_fixture"))

func test_asset_image_placeholder_label_is_last_segment() -> void:
	var img: Control = load("res://scenes/components/asset_image.tscn").instantiate()
	img.key = "item.meyve.elma"
	add_child_autofree(img)
	var lbl: Label = img.find_child("PlaceholderLabel", true, false) as Label
	assert_not_null(lbl)
	assert_eq(lbl.text, "elma")
