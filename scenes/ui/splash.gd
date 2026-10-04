extends Control
## Açılış ekranı: ada görseli zemin, kil plakette oyun adı, sevinçli Bilge + hoş geldin sesi;
## ardından profil yoksa ProfileCreate, varsa ProfileSelect.
## Giriş animasyonu yumuşaktır (yanıp sönme yok); "hareketi azalt" açıkken her şey son hâliyle gelir.

const ISLAND_KEY: String = "map.island"
## Sevinçli Bilge için denenecek pozlar (sırayla); hiçbiri yoksa karakter sayfasından önden görünüş.
const BILGE_KEYS: PackedStringArray = ["char.bilge.happy", "char.bilge.idle", "char.bilge.wave"]
const BILGE_SHEET_KEY: String = "char.bilge.sheet"
## sheet.png (2048×1143) içindeki önden görünüşün kare kırpımı.
const SHEET_FRONT_REGION: Rect2 = Rect2(20, 100, 520, 520)
const BILGE_SIZE: Vector2 = Vector2(440, 440)
const TITLE_FONT_SIZE: int = 132
const PLAQUE_COLOR: Color = ClayStyle.BUTTER
const PLAQUE_BORDER: Color = ClayStyle.CARAMEL
const TITLE_COLOR: Color = ClayStyle.TITLE_INK
const MEDAL_COLOR: Color = Color(0.93, 0.93, 0.93)
const INTRO_SECONDS: float = 0.9
const BOB_SECONDS: float = 1.8
const BOB_PIXELS: float = 10.0

var app: Node = AppState

var _title: Label = null
var _plaque: PanelContainer = null
var _bilge: Control = null
var _backdrop: TextureRect = null

func _ready() -> void:
	_build()
	_title.text = Strings.t("app.title")
	app.adopt_scene("splash", self)
	app.narrator.say("vo.genel.hosgeldin")
	_play_intro.call_deferred()
	await get_tree().create_timer(app.splash_delay).timeout
	if not is_inside_tree():
		return
	if app.progress.profiles().is_empty():
		app.goto("profile_create")
	else:
		app.goto("profile_select")

func title_label() -> Label:
	return _title

func title_plaque() -> PanelContainer:
	return _plaque

func bilge_view() -> Control:
	return _bilge

func backdrop() -> TextureRect:
	return _backdrop

func _build() -> void:
	# Zemin: ada görseli (tam görünür, kapatacak şekilde); yoksa sıcak gökyüzü gradyanı.
	_backdrop = TextureRect.new()
	_backdrop.name = "Backdrop"
	_backdrop.set_anchors_preset(Control.PRESET_FULL_RECT)
	_backdrop.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	_backdrop.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
	_backdrop.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var island: Texture2D = AssetRegistry.texture(ISLAND_KEY)
	_backdrop.texture = island if island != null else _sky_gradient()
	add_child(_backdrop)

	_plaque = PanelContainer.new()
	_plaque.name = "TitlePlaque"
	_plaque.add_theme_stylebox_override("panel", _plaque_style())
	_plaque.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_plaque.set_anchors_preset(Control.PRESET_CENTER_TOP)
	_plaque.grow_horizontal = Control.GROW_DIRECTION_BOTH
	_plaque.offset_top = 56.0
	add_child(_plaque)
	_title = Label.new()
	_title.name = "Title"
	_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_title.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_title.add_theme_font_size_override("font_size", TITLE_FONT_SIZE)
	_title.add_theme_color_override("font_color", TITLE_COLOR)
	_title.add_theme_color_override("font_shadow_color", Color(1, 1, 1, 0.55))
	_title.add_theme_constant_override("shadow_offset_x", 0)
	_title.add_theme_constant_override("shadow_offset_y", 4)
	ClayStyle.use_bold(_title)
	_plaque.add_child(_title)

	_bilge = _make_bilge()
	_bilge.name = "Bilge"
	_bilge.set_anchors_preset(Control.PRESET_BOTTOM_LEFT)
	_bilge.offset_left = 72.0
	_bilge.offset_right = 72.0 + BILGE_SIZE.x
	_bilge.offset_top = -BILGE_SIZE.y - 40.0
	_bilge.offset_bottom = -40.0
	_bilge.pivot_offset = Vector2(BILGE_SIZE.x / 2.0, BILGE_SIZE.y)
	add_child(_bilge)

## Sevinçli Bilge: poz görseli; yoksa karakter sayfasından kırpılmış madalyon; o da yoksa yer tutucu.
func _make_bilge() -> Control:
	for key: String in BILGE_KEYS:
		var tex: Texture2D = AssetRegistry.texture(key)
		if tex != null:
			var rect: TextureRect = TextureRect.new()
			rect.texture = tex
			rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
			rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
			rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
			return rect
	var sheet: Texture2D = AssetRegistry.texture(BILGE_SHEET_KEY)
	if sheet != null:
		# Karakter sayfasının arka planı açık gri: yuvarlak kil madalyon içinde gösterilir.
		var medal: Panel = Panel.new()
		medal.add_theme_stylebox_override("panel", ClayStyle.plaque_box(MEDAL_COLOR, PLAQUE_BORDER, int(BILGE_SIZE.x / 2.0), 12, 0, 0, 0.0, 0.0))
		medal.mouse_filter = Control.MOUSE_FILTER_IGNORE
		# Önden görünüş kırpılır ve yuvarlak maskeyle (shader) madalyonun içine oturtulur.
		var crop: Image = sheet.get_image().get_region(Rect2i(SHEET_FRONT_REGION))
		var face: TextureRect = TextureRect.new()
		face.texture = ImageTexture.create_from_image(crop)
		face.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		face.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		face.set_anchors_preset(Control.PRESET_FULL_RECT)
		face.offset_left = 12.0
		face.offset_top = 12.0
		face.offset_right = -12.0
		face.offset_bottom = -12.0
		face.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var mat: ShaderMaterial = ShaderMaterial.new()
		mat.shader = _circle_mask_shader()
		face.material = mat
		medal.add_child(face)
		return medal
	var img: Control = (load("res://scenes/components/asset_image.tscn") as PackedScene).instantiate() as Control
	img.set("key", BILGE_KEYS[0])
	img.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return img

func _circle_mask_shader() -> Shader:
	var sh: Shader = Shader.new()
	sh.code = """shader_type canvas_item;
void fragment() {
	float d = distance(UV, vec2(0.5));
	COLOR.a *= 1.0 - smoothstep(0.49, 0.5, d);
}
"""
	return sh

## Başlık plaketi: alt kenarı kalın (kil kalınlığı), geniş yan boşluk.
func _plaque_style() -> StyleBoxFlat:
	var style: StyleBoxFlat = ClayStyle.plaque_box(PLAQUE_COLOR, PLAQUE_BORDER, 48, 10, 8, 20, 72.0, 12.0)
	style.content_margin_bottom = 20.0
	return style

func _sky_gradient() -> GradientTexture2D:
	return ClayStyle.vertical_gradient(ClayStyle.DAY_TOP, ClayStyle.DAY_BOTTOM)

## Yumuşak giriş: plaket yukarıdan süzülür, Bilge aşağıdan yükselir, ardından hafifçe sallanır.
func _play_intro() -> void:
	if not is_inside_tree() or app.reduce_motion():
		return
	_plaque.pivot_offset = _plaque.size / 2.0
	var plaque_y: float = _plaque.position.y
	_plaque.modulate.a = 0.0
	_plaque.position.y = plaque_y - 60.0
	var bilge_y: float = _bilge.position.y
	_bilge.modulate.a = 0.0
	_bilge.position.y = bilge_y + 80.0
	var tw: Tween = create_tween().set_parallel(true)
	tw.tween_property(_plaque, "modulate:a", 1.0, INTRO_SECONDS * 0.6)
	tw.tween_property(_plaque, "position:y", plaque_y, INTRO_SECONDS).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tw.tween_property(_bilge, "modulate:a", 1.0, INTRO_SECONDS * 0.6).set_delay(0.3)
	tw.tween_property(_bilge, "position:y", bilge_y, INTRO_SECONDS).set_delay(0.3).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tw.chain().tween_callback(_start_bob.bind(bilge_y))

func _start_bob(base_y: float) -> void:
	if not is_inside_tree():
		return
	var bob: Tween = create_tween().set_loops()
	bob.tween_property(_bilge, "position:y", base_y - BOB_PIXELS, BOB_SECONDS).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	bob.tween_property(_bilge, "position:y", base_y, BOB_SECONDS).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
