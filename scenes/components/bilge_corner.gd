extends Control
## Ders ekranının köşesindeki Bilge: konuşurken hafifçe sallanır, doğru cevapta küçük zıplar.
## Görsel: char.bilge.<poz> varsa o; yoksa karakter sayfasındaki (char.bilge.sheet) önden
## duruşun arka planı kenardan doldurma ile saydamlaştırılmış kesiti (bir kez hazırlanır).

## Sırayla denenen poz anahtarları (asset-requests/001).
const POSE_KEYS: PackedStringArray = ["char.bilge.idle", "char.bilge.happy", "char.bilge.encourage"]
const SHEET_KEY: String = "char.bilge.sheet"
## Karakter sayfasında önden duruşun bölgesi (2048×1143 piksel).
const SHEET_FRONT_REGION: Rect2i = Rect2i(100, 120, 360, 492)
const BG_TOLERANCE: float = 0.10
const SWAY_DEGREES: float = 4.0
const SWAY_SECONDS: float = 0.45

static var _cutout: Texture2D = null

var _figure: TextureRect
var _shadow: Control
var _talk_tween: Tween = null
var _talking: bool = false

func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	_shadow = Control.new()
	_shadow.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_shadow.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	_shadow.draw.connect(_draw_shadow)
	add_child(_shadow)
	_figure = TextureRect.new()
	_figure.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_figure.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	_figure.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	_figure.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	_figure.texture = _pick_texture()
	add_child(_figure)
	resized.connect(_on_resized)
	_on_resized()

func _on_resized() -> void:
	if _figure != null:
		_figure.pivot_offset = Vector2(_figure.size.x / 2.0, _figure.size.y)

func _draw_shadow() -> void:
	var c: Vector2 = Vector2(size.x / 2.0, size.y - 6.0)
	var r: Vector2 = Vector2(size.x * 0.32, 14.0)
	var pts: PackedVector2Array = PackedVector2Array()
	for i: int in 32:
		var a: float = TAU * i / 32.0
		pts.append(c + Vector2(cos(a) * r.x, sin(a) * r.y))
	_shadow.draw_colored_polygon(pts, Color(0.15, 0.08, 0.02, 0.22))

func has_figure() -> bool:
	return _figure != null and _figure.texture != null

func _pick_texture() -> Texture2D:
	for key: String in POSE_KEYS:
		var path: String = AssetPaths.image_path(key)
		if ResourceLoader.exists(path):
			return AssetRegistry.texture(key)
	if _cutout == null:
		_cutout = _make_cutout()
	return _cutout

## Sayfadan önden duruşu keser; kenara bağlı açık gri arka planı saydam yapar.
static func _make_cutout() -> Texture2D:
	var sheet: Texture2D = AssetRegistry.texture(SHEET_KEY)
	if sheet == null:
		return null
	var src: Image = sheet.get_image()
	if src == null or src.is_empty():
		return null
	if src.is_compressed():
		src.decompress()
	var img: Image = src.get_region(SHEET_FRONT_REGION)
	img.convert(Image.FORMAT_RGBA8)
	var w: int = img.get_width()
	var h: int = img.get_height()
	var bg: Color = img.get_pixel(2, 2)
	var seen: PackedByteArray = PackedByteArray()
	seen.resize(w * h)
	var stack: PackedInt32Array = PackedInt32Array()
	for x: int in w:
		stack.append(x)
		stack.append((h - 1) * w + x)
	for y: int in h:
		stack.append(y * w)
		stack.append(y * w + w - 1)
	while not stack.is_empty():
		var idx: int = stack[stack.size() - 1]
		stack.remove_at(stack.size() - 1)
		if seen[idx] == 1:
			continue
		seen[idx] = 1
		var px: int = idx % w
		var py: int = idx / w
		var c: Color = img.get_pixel(px, py)
		var diff: float = maxf(absf(c.r - bg.r), maxf(absf(c.g - bg.g), absf(c.b - bg.b)))
		# Gölge gibi düşük doygunluklu koyulaşmalar da arka plandır.
		var shade: bool = c.s < 0.12 and c.v > 0.45
		if diff > BG_TOLERANCE and not shade:
			continue
		var alpha: float = clampf((diff - BG_TOLERANCE * 0.5) / (BG_TOLERANCE * 0.5), 0.0, 1.0) if not shade else 0.0
		img.set_pixel(px, py, Color(c.r, c.g, c.b, alpha))
		if px > 0:
			stack.append(idx - 1)
		if px < w - 1:
			stack.append(idx + 1)
		if py > 0:
			stack.append(idx - w)
		if py < h - 1:
			stack.append(idx + w)
	return ImageTexture.create_from_image(img)

## Konuşma sırasında yumuşak sallanma (yanıp sönme yok; reduce_motion'da durur).
func set_talking(on: bool) -> void:
	if on == _talking or _figure == null:
		return
	_talking = on
	if _talk_tween != null and _talk_tween.is_valid():
		_talk_tween.kill()
	_talk_tween = null
	if not on or _reduce_motion():
		var back: Tween = create_tween()
		back.tween_property(_figure, "rotation_degrees", 0.0, 0.2)
		return
	_talk_tween = create_tween().set_loops()
	_talk_tween.tween_property(_figure, "rotation_degrees", SWAY_DEGREES, SWAY_SECONDS).set_trans(Tween.TRANS_SINE)
	_talk_tween.tween_property(_figure, "rotation_degrees", -SWAY_DEGREES, SWAY_SECONDS * 2.0).set_trans(Tween.TRANS_SINE)
	_talk_tween.tween_property(_figure, "rotation_degrees", 0.0, SWAY_SECONDS).set_trans(Tween.TRANS_SINE)

func is_talking() -> bool:
	return _talking

## Doğru cevapta küçük sevinç zıplaması.
func cheer() -> void:
	if _figure == null or _reduce_motion():
		return
	var tw: Tween = create_tween()
	tw.tween_property(_figure, "position:y", -36.0, 0.18).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tw.tween_property(_figure, "position:y", 0.0, 0.22).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)

func _reduce_motion() -> bool:
	var settings: Variant = SaveService.data.get("settings", {})
	return settings is Dictionary and bool((settings as Dictionary).get("reduce_motion", false))
