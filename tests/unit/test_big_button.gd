extends GutTest
## Büyük düğme: simge + metin birlikteyken simge solda, metin alanının dışında kalır.

const SCENE: String = "res://scenes/components/big_button.tscn"

func _make(text_key: String, icon_key: String, size: Vector2) -> Button:
	var b: Button = (load(SCENE) as PackedScene).instantiate() as Button
	b.set("text_key", text_key)
	b.set("icon_key", icon_key)
	b.custom_minimum_size = size
	add_child_autofree(b)
	return b

func test_icon_and_text_do_not_overlap() -> void:
	var b: Button = _make("result.replay", "ui.back", Vector2(520, 160))
	await wait_process_frames(2)
	assert_true(b.call("has_side_icon"))
	var icon: Rect2 = b.call("icon_rect")
	var text_left: float = b.get_theme_stylebox("normal").content_margin_left
	assert_lte(icon.end.x, text_left, "metin simgenin sağında başlar")
	assert_gte(icon.position.x, 0.0)
	assert_lte(icon.end.y, b.size.y)
	var font: Font = b.get_theme_font("font")
	var text_w: float = font.get_string_size(b.text, HORIZONTAL_ALIGNMENT_LEFT, -1, b.get_theme_font_size("font_size")).x
	assert_lte(text_left + text_w, b.size.x - b.get_theme_stylebox("normal").content_margin_right + 1.0, "metin düğmeye sığar")

func test_icon_only_fills_button() -> void:
	var b: Button = _make("", "ui.home", Vector2(128, 128))
	await wait_process_frames(2)
	assert_false(b.call("has_side_icon"))
	var icon: Rect2 = b.call("icon_rect")
	assert_gte(icon.size.x, 80.0)
	assert_lte(icon.end.x, b.size.x)
