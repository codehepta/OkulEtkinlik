extends GutTest
## Ortak kil teması: tema türleri, seçili seçenek görünümü, kalın kaydırıcı, düğme stilleri.

func test_theme_covers_shared_control_types() -> void:
	var t: Theme = ClayStyle.build_theme()
	for state: String in ["normal", "hover", "pressed", "disabled", "focus"]:
		assert_true(t.has_stylebox(state, "Button"), "Button %s" % state)
	assert_true(t.has_stylebox("panel", "Panel"))
	assert_true(t.has_stylebox("normal", "LineEdit"))
	assert_true(t.has_stylebox("focus", "LineEdit"))
	assert_true(t.has_stylebox("slider", "HSlider"))
	assert_true(t.has_icon("grabber", "HSlider"))
	assert_true(t.has_icon("checked", "CheckButton"))
	assert_true(t.has_icon("unchecked", "CheckButton"))
	assert_true(t.has_stylebox("panel", "ScrollContainer"))
	assert_true(t.has_stylebox("grabber", "VScrollBar"))
	assert_eq(t.get_color("font_color", "Label"), ClayStyle.INK)

func test_button_is_rounded_clay() -> void:
	var sb: StyleBoxFlat = ClayStyle.build_theme().get_stylebox("normal", "Button") as StyleBoxFlat
	assert_not_null(sb)
	assert_gte(sb.corner_radius_top_left, 24, "yuvarlak köşe")
	assert_gt(sb.border_width_bottom, sb.border_width_top, "alt kenar kalın: kil derinliği")

func test_slider_is_thick_with_big_grabber() -> void:
	var t: Theme = ClayStyle.build_theme()
	var track: StyleBox = t.get_stylebox("slider", "HSlider")
	assert_gte(track.get_minimum_size().y, 24.0, "kalın oluk")
	assert_gte(t.get_icon("grabber", "HSlider").get_width(), 64, "büyük tutamak")

func test_selected_box_differs_by_more_than_color() -> void:
	var normal: StyleBoxFlat = ClayStyle.box(ClayStyle.CREAM)
	var sel: StyleBoxFlat = ClayStyle.selected_box()
	assert_ne(sel.bg_color, normal.bg_color)
	assert_gte(sel.border_width_left, ClayStyle.SELECTED_BORDER, "kalın kenar")
	assert_gt(sel.border_width_left, normal.border_width_left)

func test_make_choice_shows_check_icon_only_when_selected() -> void:
	var a: Button = Button.new()
	var b: Button = Button.new()
	add_child_autofree(a)
	add_child_autofree(b)
	var group: ButtonGroup = ButtonGroup.new()
	a.toggle_mode = true
	a.button_pressed = true
	ClayStyle.make_choice(a)
	ClayStyle.make_choice(b)
	a.button_group = group
	b.button_group = group
	assert_eq(a.icon, AssetRegistry.texture(ClayStyle.CHECK_ICON_KEY), "seçili: onay ikonu")
	assert_null(b.icon)
	b.button_pressed = true
	assert_null(a.icon, "seçim değişince eski seçenekten kalkar")
	assert_eq(b.icon, AssetRegistry.texture(ClayStyle.CHECK_ICON_KEY))
	assert_is(b.get_theme_stylebox("pressed"), StyleBoxFlat)
	assert_eq((b.get_theme_stylebox("pressed") as StyleBoxFlat).border_width_left, ClayStyle.SELECTED_BORDER)

func test_style_button_overrides_all_states() -> void:
	var b: Button = Button.new()
	add_child_autofree(b)
	ClayStyle.style_button(b, ClayStyle.MINT)
	for state: String in ["normal", "hover", "pressed", "disabled", "focus"]:
		assert_true(b.has_theme_stylebox_override(state), state)
	assert_eq((b.get_theme_stylebox("normal") as StyleBoxFlat).bg_color, ClayStyle.MINT)

func test_theme_installed_into_project_theme() -> void:
	var project: Theme = ThemeDB.get_project_theme()
	assert_not_null(project)
	assert_true(project.has_stylebox("normal", "Button"), "AppState açılışta kil temasını kurar")

func test_theme_font_is_andika() -> void:
	var t: Theme = ClayStyle.build_theme()
	assert_not_null(t.default_font)
	assert_eq(t.default_font.get_font_name(), "Andika")
	assert_eq(ClayStyle.bold_font().get_font_name(), "Andika")

func test_shared_plaque_and_card_boxes_are_raised_clay() -> void:
	var p: StyleBoxFlat = ClayStyle.plaque_box(ClayStyle.BUTTER, ClayStyle.CARAMEL, 48, 10, 8, 20)
	assert_eq(p.bg_color, ClayStyle.BUTTER)
	assert_eq(p.border_color, ClayStyle.CARAMEL)
	assert_eq(p.border_width_bottom, 18, "alt kenar = kenar + derinlik")
	assert_eq(p.shadow_size, 20)
	var c: StyleBoxFlat = ClayStyle.card_box(ClayStyle.APRICOT)
	assert_gt(c.border_width_bottom, c.border_width_top)
	assert_true(ClayStyle.REGION_BADGE.has("agac_ev"))
	for region: String in ["sayi_ormani", "harf_vadisi", "hayat_kasabasi", "kesif_laboratuvari"]:
		assert_true(ClayStyle.REGION_BADGE.has(region), region)
