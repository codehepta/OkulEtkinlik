extends GutTest
## Uzun ve boşluklu metin karoları iki satıra bölünür; yazı tek satırdan daha büyük kalır.

const TV: GDScript = preload("res://scenes/games/token_view.gd")

func test_short_text_stays_single_line() -> void:
	assert_eq(TV.layout_label("kedi", Vector2(180, 180)), "kedi")

func test_long_two_word_text_wraps_at_middle_space() -> void:
	assert_eq(TV.layout_label("konuşan kedi", Vector2(180, 180)), "konuşan\nkedi")

func test_wrap_picks_most_balanced_space() -> void:
	assert_eq(TV.layout_label("bir küçük kırmızı top", Vector2(200, 200)), "bir küçük\nkırmızı top")

func test_wrapped_font_is_larger_than_single_line() -> void:
	var box: Vector2 = Vector2(180, 180)
	var single: int = TV.fit_font_size("konuşan kedi", box)
	var wrapped: int = TV.fit_font_size("konuşan\nkedi", box)
	assert_gt(wrapped, single)

func test_two_lines_are_limited_by_height() -> void:
	var fs: int = TV.fit_font_size("a\nb", Vector2(400, 100))
	assert_lte(float(fs) * 2.0 * TV.LINE_EM, 100.0 * TV.TEXT_HEIGHT_RATIO + 1.0)

func test_no_wrap_when_it_does_not_help() -> void:
	# Geniş ve alçak kutuda (hikâye seçeneği) tek satır daha büyük yazı verir.
	assert_eq(TV.layout_label("Bilge kitap okudu", Vector2(760, 150)), "Bilge kitap okudu")

func test_view_shows_wrapped_label() -> void:
	var view: Control = (load("res://scenes/games/token_view.tscn") as PackedScene).instantiate() as Control
	add_child_autofree(view)
	view.size = Vector2(180, 180)
	view.call("set_token", {"type": "text", "value": "app.title"})
	var tile: Node = view.get_child(0)
	assert_eq(str(tile.get("text")), "Bilgi\nAdası")

## Banknot ve madeni paralarda değer görselde yazmaz (görsellerde rakam yok): karo altına kodla
## değer etiketi çizilir, çocuk yalnız renge bakmak zorunda kalmaz.
func test_money_item_shows_value_badge() -> void:
	var v: Control = (load("res://scenes/games/token_view.tscn") as PackedScene).instantiate() as Control
	add_child_autofree(v)
	v.call("set_token", {"type": "item", "value": "item.para.tl_20"})
	assert_eq(v.call("money_badge_text"), Strings.t("fmt.money.tl", {"n": "20"}))
	v.call("set_token", {"type": "item", "value": "item.para.kr_50"})
	assert_eq(v.call("money_badge_text"), Strings.t("fmt.money.kr", {"n": "50"}))
	v.call("set_token", {"type": "item", "value": "item.hayvan.kedi"})
	assert_eq(v.call("money_badge_text"), "", "para olmayan görselde etiket yok")

func test_money_value_parses_key() -> void:
	var TokenView: GDScript = load("res://scenes/games/token_view.gd")
	assert_eq(TokenView.money_value("item.para.tl_200"), {"unit": "tl", "n": 200})
	assert_eq(TokenView.money_value("item.para.kr_5"), {"unit": "kr", "n": 5})
	assert_eq(TokenView.money_value("item.para.cuzdan"), {})
	assert_eq(TokenView.money_value("item.esya.para"), {})
