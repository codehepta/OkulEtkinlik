class_name ClayStyle
extends RefCounted
## Ortak kil teması: renk paleti, kil kutuları (StyleBoxFlat) ve uygulama geneli Theme.
## Bütün ekranlar renklerini ve kutularını buradan alır; ekranlarda StyleBoxFlat kurulmaz.
## AppState açılışta install() çağırır: Theme proje temasına (default_theme.tres) birleştirilir,
## böylece düz Button/Panel/LineEdit/HSlider/CheckButton/ScrollContainer/Label kil görünür.

# --- Palet (spec §5.1: sıcak, doygun pastel kil) ---
## Varsayılan düğme / tekrar dinle: bej kil.
const CREAM: Color = Color(0.98, 0.9, 0.74)
## Kart / ikincil düğme: kayısı kil.
const APRICOT: Color = Color(0.96, 0.78, 0.55)
## Onay / devam: nane yeşili.
const MINT: Color = Color(0.58, 0.86, 0.62)
## Geri / nötr / veli: gök mavisi.
const SKY: Color = Color(0.71, 0.8, 0.9)
## Seçili seçenek: bal sarısı (kalın kenar + onay ikonuyla birlikte; renk tek başına anlam taşımaz).
const HONEY: Color = Color(1.0, 0.76, 0.32)
## Silme gibi dikkat isteyen veli eylemleri: gül kurusu.
const ROSE: Color = Color(0.95, 0.64, 0.62)
## Veli uyarı yazısı (kayıt kurtarıldı vb.).
const ALERT: Color = Color(0.7, 0.15, 0.1)
## Ana yazı rengi: koyu kahve.
const INK: Color = Color(0.25, 0.15, 0.08)
## İkincil yazı / yer tutucu.
const INK_SOFT: Color = Color(0.48, 0.38, 0.3)
## Açık zemin (veli paneli, kartlar).
const PAPER: Color = Color(0.97, 0.94, 0.88)
## Çocuk ekranlarının yeşil zemini.
const MEADOW: Color = Color(0.31, 0.7, 0.53)
## Gece zemini (oturum sonu).
const NIGHT: Color = Color(0.2, 0.25, 0.45)
## Altyazı balonu: yarı saydam sıcak koyu kahve, açık yazı.
const BUBBLE_BG: Color = Color(0.24, 0.16, 0.1, 0.8)
const BUBBLE_TEXT: Color = Color(1.0, 0.97, 0.9)
## Kil gölgesi.
const SHADOW: Color = Color(0.2, 0.12, 0.05, 0.28)
## Bölge renk çiftleri (spec §5.1): [ana, vurgu].
const REGION_COLORS: Dictionary = {
	"sayi_ormani": [Color(0.5, 0.78, 0.38), Color(1.0, 0.64, 0.3)],
	"harf_vadisi": [Color(0.7, 0.55, 0.88), Color(0.98, 0.6, 0.78)],
	"hayat_kasabasi": [Color(1.0, 0.84, 0.36), Color(0.45, 0.66, 0.95)],
	"kesif_laboratuvari": [Color(0.3, 0.8, 0.78), Color(0.97, 0.98, 0.98)],
}

# --- Ölçüler ---
const RADIUS: int = 28
const BORDER: int = 4
## Alt kenar kalınlığı: düğmeye "kabarık kil" derinliği verir.
const DEPTH: int = 10
## Seçili seçeneğin kenar kalınlığı.
const SELECTED_BORDER: int = 10
const MIN_TOUCH: float = 128.0
const BUTTON_FONT_SIZE: int = 40
const ICON_MAX: int = 64
## Altyazı balonu için ekranların altta (ya da üstte) boş bıraktığı şerit yüksekliği.
const SUBTITLE_BAND: float = 200.0
const CHECK_ICON_KEY: String = "ui.check"

## Kil kutusu: dolu zemin, koyu kenar, kalın alt kenar ve yumuşak gölge.
static func box(color: Color, radius: int = RADIUS, depth: int = DEPTH) -> StyleBoxFlat:
	var s: StyleBoxFlat = StyleBoxFlat.new()
	s.bg_color = color
	s.set_corner_radius_all(radius)
	s.corner_detail = 12
	s.anti_aliasing = true
	s.border_color = color.darkened(0.22)
	s.set_border_width_all(BORDER)
	s.border_width_bottom = BORDER + depth
	if depth > 0:
		s.shadow_color = SHADOW
		s.shadow_size = 6
		s.shadow_offset = Vector2(0, 5)
	s.content_margin_left = 24.0
	s.content_margin_right = 24.0
	s.content_margin_top = 12.0
	s.content_margin_bottom = 12.0 + float(depth)
	return s

## Basılı kil: biraz koyu, derinlik azalır, içerik aşağı kayar.
static func pressed_box(color: Color, radius: int = RADIUS, depth: int = DEPTH) -> StyleBoxFlat:
	var s: StyleBoxFlat = box(color.darkened(0.08), radius, 0)
	s.border_width_bottom = BORDER + int(depth / 3.0)
	s.content_margin_top = 12.0 + float(depth) * 2.0 / 3.0
	s.content_margin_bottom = 12.0 + float(depth) / 3.0
	return s

## Seçili seçenek: bal sarısı, her yanda kalın koyu kenar.
static func selected_box(radius: int = RADIUS) -> StyleBoxFlat:
	var s: StyleBoxFlat = box(HONEY, radius, 0)
	s.border_color = INK
	s.set_border_width_all(SELECTED_BORDER)
	s.content_margin_left = 24.0
	s.content_margin_right = 24.0
	s.content_margin_top = 12.0
	s.content_margin_bottom = 12.0
	return s

## Düz (derinliksiz) yuvarlak panel.
static func panel_box(color: Color, radius: int = 32) -> StyleBoxFlat:
	var s: StyleBoxFlat = box(color, radius, 0)
	s.border_color = color.darkened(0.12)
	s.content_margin_left = 24.0
	s.content_margin_right = 24.0
	s.content_margin_top = 20.0
	s.content_margin_bottom = 20.0
	return s

## Altyazı balonu: yarı saydam, yuvarlak, kenarsız.
static func bubble_box(radius: int, pad_x: float, pad_y: float) -> StyleBoxFlat:
	var s: StyleBoxFlat = StyleBoxFlat.new()
	s.bg_color = BUBBLE_BG
	s.set_corner_radius_all(radius)
	s.corner_detail = 12
	s.anti_aliasing = true
	s.content_margin_left = pad_x
	s.content_margin_right = pad_x
	s.content_margin_top = pad_y
	s.content_margin_bottom = pad_y
	return s

## Klavye odağı halkası (dokunmatikte görünmez).
static func focus_box(radius: int = RADIUS) -> StyleBoxFlat:
	var s: StyleBoxFlat = StyleBoxFlat.new()
	s.draw_center = false
	s.set_corner_radius_all(radius + 6)
	s.border_color = HONEY.darkened(0.2)
	s.set_border_width_all(6)
	s.set_expand_margin_all(6.0)
	s.anti_aliasing = true
	return s

static func disabled_box(color: Color, radius: int = RADIUS) -> StyleBoxFlat:
	var c: Color = color.lerp(Color(0.8, 0.78, 0.75), 0.6)
	c.a = 0.7
	return box(c, radius, 0)

## Bir düğmeye verilen renkte kil durumlarını (normal/hover/pressed/disabled/focus) uygular.
static func style_button(b: Button, color: Color, radius: int = RADIUS) -> void:
	b.add_theme_stylebox_override("normal", box(color, radius))
	b.add_theme_stylebox_override("hover", box(color.lightened(0.07), radius))
	b.add_theme_stylebox_override("pressed", pressed_box(color, radius))
	b.add_theme_stylebox_override("hover_pressed", pressed_box(color, radius))
	b.add_theme_stylebox_override("disabled", disabled_box(color, radius))
	b.add_theme_stylebox_override("focus", focus_box(radius))
	for c: String in ["font_color", "font_hover_color", "font_pressed_color", "font_hover_pressed_color", "font_focus_color"]:
		b.add_theme_color_override(c, INK)

## Seçenek düğmesi (ButtonGroup ile tek seçim): seçiliyken bal sarısı + kalın kenar + onay ikonu.
static func make_choice(b: Button, show_check: bool = true) -> void:
	b.toggle_mode = true
	b.add_theme_stylebox_override("pressed", selected_box())
	b.add_theme_stylebox_override("hover_pressed", selected_box())
	if show_check:
		_update_check(b, b.button_pressed)
		b.toggled.connect(func(on: bool) -> void: _update_check(b, on))

static func _update_check(b: Button, on: bool) -> void:
	b.icon = AssetRegistry.texture(CHECK_ICON_KEY) if on else null

# --- Tema ---

## Uygulama geneli kil teması (Button, Panel, LineEdit, HSlider, CheckButton, ScrollContainer, Label...).
static func build_theme() -> Theme:
	var t: Theme = Theme.new()
	# Düğme
	t.set_stylebox("normal", "Button", box(CREAM))
	t.set_stylebox("hover", "Button", box(CREAM.lightened(0.07)))
	t.set_stylebox("pressed", "Button", pressed_box(CREAM))
	t.set_stylebox("hover_pressed", "Button", pressed_box(CREAM))
	t.set_stylebox("disabled", "Button", disabled_box(CREAM))
	t.set_stylebox("focus", "Button", focus_box())
	for c: String in ["font_color", "font_hover_color", "font_pressed_color", "font_hover_pressed_color", "font_focus_color"]:
		t.set_color(c, "Button", INK)
	t.set_color("font_disabled_color", "Button", INK_SOFT)
	t.set_color("icon_normal_color", "Button", Color.WHITE)
	t.set_color("icon_pressed_color", "Button", Color.WHITE)
	t.set_color("icon_hover_color", "Button", Color.WHITE)
	t.set_color("icon_hover_pressed_color", "Button", Color.WHITE)
	t.set_color("icon_focus_color", "Button", Color.WHITE)
	t.set_constant("h_separation", "Button", 16)
	t.set_constant("icon_max_width", "Button", ICON_MAX)
	t.set_font_size("font_size", "Button", BUTTON_FONT_SIZE)
	# Yazı
	t.set_color("font_color", "Label", INK)
	# Paneller
	t.set_stylebox("panel", "Panel", panel_box(PAPER))
	t.set_stylebox("panel", "PanelContainer", panel_box(PAPER))
	# Yazı alanı
	var le: StyleBoxFlat = panel_box(Color(1.0, 0.98, 0.94), RADIUS)
	le.border_color = INK_SOFT
	le.set_border_width_all(BORDER)
	le.content_margin_left = 32.0
	le.content_margin_right = 32.0
	var le_focus: StyleBoxFlat = le.duplicate() as StyleBoxFlat
	le_focus.border_color = HONEY.darkened(0.15)
	le_focus.set_border_width_all(SELECTED_BORDER - 2)
	t.set_stylebox("normal", "LineEdit", le)
	t.set_stylebox("focus", "LineEdit", le_focus)
	t.set_stylebox("read_only", "LineEdit", le)
	t.set_color("font_color", "LineEdit", INK)
	t.set_color("font_placeholder_color", "LineEdit", Color(INK_SOFT, 0.75))
	t.set_color("caret_color", "LineEdit", INK)
	t.set_color("selection_color", "LineEdit", Color(HONEY, 0.5))
	t.set_color("font_selected_color", "LineEdit", INK)
	t.set_constant("caret_width", "LineEdit", 4)
	# Kaydırıcı: kalın kil oluk + büyük yuvarlak tutamak
	var track: StyleBoxFlat = panel_box(CREAM.darkened(0.12), 18)
	track.set_border_width_all(0)
	track.content_margin_top = 14.0
	track.content_margin_bottom = 14.0
	var fill: StyleBoxFlat = track.duplicate() as StyleBoxFlat
	fill.bg_color = MINT
	t.set_stylebox("slider", "HSlider", track)
	t.set_stylebox("grabber_area", "HSlider", fill)
	t.set_stylebox("grabber_area_highlight", "HSlider", fill)
	t.set_icon("grabber", "HSlider", circle_texture(80, APRICOT))
	t.set_icon("grabber_highlight", "HSlider", circle_texture(80, APRICOT.lightened(0.1)))
	t.set_icon("grabber_disabled", "HSlider", circle_texture(80, Color(0.8, 0.78, 0.75)))
	t.set_constant("center_grabber", "HSlider", 0)
	# Aç/kapa anahtarı: satır kil kart, sağda kalın anahtar
	var row: StyleBoxFlat = panel_box(CREAM)
	t.set_stylebox("normal", "CheckButton", row)
	t.set_stylebox("hover", "CheckButton", panel_box(CREAM.lightened(0.05)))
	t.set_stylebox("pressed", "CheckButton", row)
	t.set_stylebox("hover_pressed", "CheckButton", panel_box(CREAM.lightened(0.05)))
	t.set_stylebox("focus", "CheckButton", focus_box(32))
	t.set_icon("checked", "CheckButton", switch_texture(true))
	t.set_icon("unchecked", "CheckButton", switch_texture(false))
	t.set_icon("checked_disabled", "CheckButton", switch_texture(true))
	t.set_icon("unchecked_disabled", "CheckButton", switch_texture(false))
	for c: String in ["font_color", "font_hover_color", "font_pressed_color", "font_hover_pressed_color", "font_focus_color"]:
		t.set_color(c, "CheckButton", INK)
	t.set_constant("h_separation", "CheckButton", 24)
	# Anahtar simgesi düğme simgesi sınırına (icon_max_width) takılmasın.
	t.set_constant("icon_max_width", "CheckButton", 0)
	# Kaydırma: zemin yok, kalın yuvarlak kaydırma çubuğu
	t.set_stylebox("panel", "ScrollContainer", StyleBoxEmpty.new())
	for bar: String in ["VScrollBar", "HScrollBar"]:
		var gutter: StyleBoxFlat = panel_box(CREAM.darkened(0.1), 14)
		gutter.set_border_width_all(0)
		gutter.content_margin_left = 12.0
		gutter.content_margin_right = 12.0
		gutter.content_margin_top = 12.0
		gutter.content_margin_bottom = 12.0
		var grab: StyleBoxFlat = gutter.duplicate() as StyleBoxFlat
		grab.bg_color = APRICOT
		var grab_hi: StyleBoxFlat = gutter.duplicate() as StyleBoxFlat
		grab_hi.bg_color = APRICOT.darkened(0.1)
		t.set_stylebox("scroll", bar, gutter)
		t.set_stylebox("scroll_focus", bar, gutter)
		t.set_stylebox("grabber", bar, grab)
		t.set_stylebox("grabber_highlight", bar, grab_hi)
		t.set_stylebox("grabber_pressed", bar, grab_hi)
	# İlerleme çubuğu
	var pb_bg: StyleBoxFlat = panel_box(CREAM.darkened(0.12), 18)
	pb_bg.set_border_width_all(0)
	var pb_fill: StyleBoxFlat = pb_bg.duplicate() as StyleBoxFlat
	pb_fill.bg_color = MINT
	t.set_stylebox("background", "ProgressBar", pb_bg)
	t.set_stylebox("fill", "ProgressBar", pb_fill)
	t.set_color("font_color", "ProgressBar", INK)
	# Onay pencereleri (veli paneli)
	var dialog: StyleBoxFlat = panel_box(PAPER, 0)
	dialog.set_border_width_all(0)
	t.set_stylebox("panel", "AcceptDialog", dialog)
	var win: StyleBoxFlat = panel_box(PAPER, 24)
	win.set_expand_margin_all(8.0)
	win.expand_margin_top = 56.0
	t.set_stylebox("embedded_border", "Window", win)
	t.set_stylebox("embedded_unfocused_border", "Window", win)
	t.set_color("title_color", "Window", INK)
	t.set_constant("title_height", "Window", 56)
	return t

## Kil temasını proje temasına birleştirir (uygulama açılışında bir kez).
static func install() -> void:
	var project: Theme = ThemeDB.get_project_theme()
	if project != null:
		project.merge_with(build_theme())

# --- Çizim yardımcıları (tema simgeleri; görsel asset değil, kod çizimi) ---

## Kenarlı kil daire (kaydırıcı tutamağı).
static func circle_texture(diameter: int, color: Color) -> ImageTexture:
	var img: Image = Image.create(diameter, diameter, false, Image.FORMAT_RGBA8)
	var r: float = diameter / 2.0
	var c: Vector2 = Vector2(r, r)
	var edge: Color = color.darkened(0.25)
	for y: int in diameter:
		for x: int in diameter:
			var d: float = Vector2(x + 0.5, y + 0.5).distance_to(c)
			var a: float = clampf(r - d, 0.0, 1.0)
			if a <= 0.0:
				continue
			var px: Color = edge if d > r - 6.0 else color
			# Üst-sol hafif parlaklık: kil kabarıklığı.
			if d < r - 6.0 and Vector2(x, y).distance_to(c - Vector2(r, r) * 0.3) < r * 0.35:
				px = px.lightened(0.18)
			px.a = a
			img.set_pixel(x, y, px)
	return ImageTexture.create_from_image(img)

## Aç/kapa anahtarı: kalın hap biçimli oluk + kil topuz. Açıkken nane yeşili, topuz sağda.
static func switch_texture(on: bool) -> ImageTexture:
	var w: int = 132
	var h: int = 72
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	var track: Color = MINT if on else Color(0.82, 0.78, 0.72)
	var edge: Color = track.darkened(0.25)
	var r: float = h / 2.0
	var knob_c: Vector2 = Vector2(w - r if on else r, r)
	var knob_r: float = r - 9.0
	for y: int in h:
		for x: int in w:
			var p: Vector2 = Vector2(x + 0.5, y + 0.5)
			var cx: float = clampf(p.x, r, w - r)
			var d: float = p.distance_to(Vector2(cx, r))
			var a: float = clampf(r - d, 0.0, 1.0)
			if a <= 0.0:
				continue
			var px: Color = edge if d > r - 5.0 else track
			var kd: float = p.distance_to(knob_c)
			if kd < knob_r + 0.5:
				px = Color.WHITE.lerp(CREAM, 0.3) if kd < knob_r - 4.0 else CREAM.darkened(0.3)
			px.a = a
			img.set_pixel(x, y, px)
	return ImageTexture.create_from_image(img)
