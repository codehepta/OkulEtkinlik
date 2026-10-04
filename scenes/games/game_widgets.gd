extends RefCounted
## Faz 3 şablonlarının ortak küçük yardımcıları: kil karo, onay düğmesi, karıştırma,
## şekil çizimi ve boş yuva. Şablonlar `preload` ile kullanır (paylaşılan tip değil).

const CLAY_TILE: PackedScene = preload("res://scenes/components/clay_tile.tscn")
const CHECK_ICON_KEY: String = "ui.check"
const CHECK_COLOR: Color = ClayStyle.MINT
const WELL_LINE: Color = Color(ClayStyle.CLAY_EDGE, 0.9)
const WELL_FILL: Color = Color(ClayStyle.COCOA, 0.12)

## Şekil adları (pattern şablonu ve ipucu modelleri).
const SHAPES: PackedStringArray = ["circle", "square", "triangle", "star", "heart", "diamond"]
## Renk adı -> kil rengi. Renk her zaman şekille birlikte kullanılır (spec §4.9).
const COLORS: Dictionary = {
	"red": Color(0.93, 0.36, 0.33),
	"blue": Color(0.33, 0.56, 0.9),
	"yellow": Color(1.0, 0.8, 0.27),
	"green": Color(0.38, 0.75, 0.42),
	"purple": Color(0.66, 0.46, 0.85),
	"orange": Color(0.98, 0.58, 0.24),
}

## Kil karo (ClayTile): verilen dikdörtgende, verilen yazıyla.
static func make_tile(parent: Control, text: String, rect: Rect2, font_size: int, color: Color = ClayStyle.APRICOT) -> Control:
	var tile: Control = CLAY_TILE.instantiate() as Control
	tile.set("text", text)
	tile.set("clay_color", color)
	parent.add_child(tile)
	tile.set("font_size", font_size)
	tile.size = rect.size
	tile.position = rect.position
	tile.pivot_offset = rect.size / 2.0
	return tile

## Onay düğmesi: nane yeşili kil karo + `ui.check` ikonu (yoksa kodla çizilmiş onay işareti).
static func make_check_button(parent: Control, rect: Rect2) -> Control:
	var tile: Control = make_tile(parent, "", rect, 40, CHECK_COLOR)
	tile.name = "CheckButton"
	var tex: Texture2D = AssetRegistry.texture(CHECK_ICON_KEY)
	var icon: Control = null
	if tex != null:
		var tr: TextureRect = TextureRect.new()
		tr.texture = tex
		tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		tr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		icon = tr
	else:
		icon = Control.new()
		icon.draw.connect(func() -> void: draw_check(icon, Rect2(Vector2.ZERO, icon.size)))
	icon.mouse_filter = Control.MOUSE_FILTER_IGNORE
	tile.add_child(icon)
	var pad: float = rect.size.y * 0.2
	icon.position = Vector2(pad, pad * 0.8)
	icon.size = rect.size - Vector2(pad * 2.0, pad * 2.0)
	return tile

## Kalın, uçları yuvarlak onay işareti.
static func draw_check(ci: CanvasItem, r: Rect2, color: Color = ClayStyle.INK) -> void:
	var w: float = minf(r.size.x, r.size.y)
	var c: Vector2 = r.get_center()
	var pts: PackedVector2Array = PackedVector2Array([
		c + Vector2(-0.32, 0.0) * w, c + Vector2(-0.08, 0.24) * w, c + Vector2(0.34, -0.22) * w])
	var width: float = w * 0.14
	ci.draw_polyline(pts, color, width, true)
	for p: Vector2 in pts:
		ci.draw_circle(p, width / 2.0, color, true, -1.0, true)

## Fisher-Yates (bağlamın rng'siyle; testlerde tekrarlanabilir).
static func shuffle(a: Array, rng: RandomNumberGenerator) -> void:
	for i: int in range(a.size() - 1, 0, -1):
		var j: int = rng.randi_range(0, i)
		var t: Variant = a[i]
		a[i] = a[j]
		a[j] = t

## Kesik kenarlı boş yuva (bırakma çukuru / boş hücre).
static func draw_well(ci: CanvasItem, r: Rect2, radius: float = 26.0) -> void:
	ci.draw_style_box(ClayStyle.soft_box(WELL_FILL, int(radius)), r)
	ClayStyle.draw_dashed_round_rect(ci, r, radius, WELL_LINE, 7.0, 14.0)

## Kil şekil: gölge + gövde + koyu kenar + açık ışık lekesi.
static func draw_shape(ci: CanvasItem, shape: String, r: Rect2, color: Color) -> void:
	var pts: PackedVector2Array = shape_points(shape, r)
	if pts.is_empty():
		return
	var shadow: PackedVector2Array = PackedVector2Array()
	for p: Vector2 in pts:
		shadow.append(p + Vector2(0, r.size.y * 0.04))
	ci.draw_colored_polygon(shadow, ClayStyle.SHADOW)
	ci.draw_colored_polygon(pts, color)
	ci.draw_polyline(pts + PackedVector2Array([pts[0]]), color.darkened(0.3), maxf(3.0, r.size.x * 0.035), true)
	# Işık lekesi yalnızca geniş gövdeli şekillerde (üçgen / yıldız ucunda taşmasın).
	if shape in ["circle", "square", "heart"]:
		var hl: Vector2 = r.get_center() + Vector2(-0.16, -0.16) * r.size
		ci.draw_circle(hl, r.size.x * 0.07, Color(1, 1, 1, 0.35), true, -1.0, true)

## Şeklin çokgen noktaları (rect içinde, kenarlardan biraz içeride).
static func shape_points(shape: String, r: Rect2) -> PackedVector2Array:
	var c: Vector2 = r.get_center()
	var s: float = minf(r.size.x, r.size.y) * 0.42
	var out: PackedVector2Array = PackedVector2Array()
	match shape:
		"circle":
			for i: int in 40:
				var a: float = TAU * i / 40.0
				out.append(c + Vector2(cos(a), sin(a)) * s)
		"square":
			var q: float = s * 0.86
			out = PackedVector2Array([c + Vector2(-q, -q), c + Vector2(q, -q), c + Vector2(q, q), c + Vector2(-q, q)])
		"triangle":
			out = PackedVector2Array([c + Vector2(0, -s), c + Vector2(s * 0.98, s * 0.78), c + Vector2(-s * 0.98, s * 0.78)])
		"diamond":
			out = PackedVector2Array([c + Vector2(0, -s), c + Vector2(s * 0.72, 0), c + Vector2(0, s), c + Vector2(-s * 0.72, 0)])
		"star":
			for i: int in 10:
				var a: float = -PI / 2.0 + TAU * i / 10.0
				var rad: float = s if i % 2 == 0 else s * 0.45
				out.append(c + Vector2(cos(a), sin(a)) * rad + Vector2(0, s * 0.08))
		"heart":
			for i: int in 48:
				var t: float = TAU * i / 48.0
				var x: float = 16.0 * pow(sin(t), 3)
				var y: float = -(13.0 * cos(t) - 5.0 * cos(2.0 * t) - 2.0 * cos(3.0 * t) - cos(4.0 * t))
				out.append(c + Vector2(x, y + 1.5) * (s / 16.5))
	return out
