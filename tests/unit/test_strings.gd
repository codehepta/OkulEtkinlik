extends GutTest
## Strings servisi testleri.

const STRINGS_SCRIPT: String = "res://autoload/strings.gd"

var _s: Node = null

func before_each() -> void:
	_s = load(STRINGS_SCRIPT).new()

func after_each() -> void:
	_s.free()
	_s = null

func test_t_substitutes_args() -> void:
	assert_eq(_s.t("gate.question", {"a": "on bir", "b": "üçü"}), "on bir ile üçü çarpın.")

func test_t_missing_key_returns_key() -> void:
	assert_eq(_s.t("yok.anahtar"), "yok.anahtar")
	assert_push_warning_count(1)

func test_has() -> void:
	assert_true(_s.has("app.title"))
	assert_false(_s.has("yok.anahtar"))
