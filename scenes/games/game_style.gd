extends RefCounted
## Ders ekranları ve şablonlar için yerel kil stilleri (ortak tema gelince oraya taşınacak).

const CLAY: Color = Color(0.96, 0.78, 0.55)
const CLAY_DARK: Color = Color(0.78, 0.55, 0.33)
const CREAM: Color = Color(1.0, 0.96, 0.88)
const INK: Color = Color(0.25, 0.15, 0.08)
const SHADOW: Color = Color(0.22, 0.13, 0.05, 0.28)

## Kabarık kil kart: alt kenar kalın ve koyu (hacim), yumuşak gölge.
static func card_box(color: Color, radius: int = 28) -> StyleBoxFlat:
	var s: StyleBoxFlat = StyleBoxFlat.new()
	s.bg_color = color
	s.set_corner_radius_all(radius)
	s.border_color = color.darkened(0.22)
	s.set_border_width_all(4)
	s.border_width_bottom = 12
	s.shadow_color = SHADOW
	s.shadow_size = 14
	s.shadow_offset = Vector2(0, 8)
	s.anti_aliasing = true
	return s

## Yarı saydam krem tepsi: oyun alanını arka plandan ayırır, okunurluğu artırır.
static func tray_box(alpha: float = 0.72, radius: int = 56) -> StyleBoxFlat:
	var s: StyleBoxFlat = StyleBoxFlat.new()
	s.bg_color = Color(CREAM, alpha)
	s.set_corner_radius_all(radius)
	s.border_color = Color(1.0, 1.0, 1.0, 0.85)
	s.set_border_width_all(6)
	s.shadow_color = Color(SHADOW, 0.18)
	s.shadow_size = 24
	s.shadow_offset = Vector2(0, 10)
	s.anti_aliasing = true
	return s

## Basit Panel düğümü (girdi geçirmez değil: fareyi yok sayar).
static func make_panel(box: StyleBox, rect: Rect2) -> Panel:
	var p: Panel = Panel.new()
	p.add_theme_stylebox_override("panel", box)
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.position = rect.position
	p.size = rect.size
	return p

## Kesik kenarlı yuvarlak köşeli çerçeve (boş bırakma yuvası). Kenar boyunca eşit aralıklı çizgiler.
static func draw_dashed_round_rect(ci: CanvasItem, rect: Rect2, radius: float, color: Color, width: float, dash: float) -> void:
	var pts: PackedVector2Array = _round_rect_points(rect, radius, 10)
	var total: float = 0.0
	for i: int in pts.size():
		total += pts[i].distance_to(pts[(i + 1) % pts.size()])
	var count: int = maxi(int(total / (dash * 2.0)), 4)
	var step: float = total / count
	for k: int in count:
		var a: Vector2 = _point_at(pts, k * step)
		var b: Vector2 = _point_at(pts, k * step + step * 0.55)
		ci.draw_line(a, b, color, width, true)
		ci.draw_circle(a, width / 2.0, color, true, -1.0, true)
		ci.draw_circle(b, width / 2.0, color, true, -1.0, true)

static func _round_rect_points(rect: Rect2, radius: float, seg: int) -> PackedVector2Array:
	var out: PackedVector2Array = PackedVector2Array()
	var r: float = minf(radius, minf(rect.size.x, rect.size.y) / 2.0)
	var centers: Array[Vector2] = [
		Vector2(rect.end.x - r, rect.position.y + r),
		Vector2(rect.end.x - r, rect.end.y - r),
		Vector2(rect.position.x + r, rect.end.y - r),
		Vector2(rect.position.x + r, rect.position.y + r),
	]
	for c: int in 4:
		var start: float = -PI / 2.0 + c * PI / 2.0
		for i: int in seg + 1:
			var ang: float = start + (PI / 2.0) * i / seg
			out.append(centers[c] + Vector2(cos(ang), sin(ang)) * r)
	return out

static func _point_at(pts: PackedVector2Array, dist: float) -> Vector2:
	var d: float = dist
	for i: int in pts.size():
		var a: Vector2 = pts[i]
		var b: Vector2 = pts[(i + 1) % pts.size()]
		var l: float = a.distance_to(b)
		if d <= l:
			return a.lerp(b, d / l if l > 0.0 else 0.0)
		d -= l
	return pts[0]

static func reduce_motion() -> bool:
	var settings: Variant = SaveService.data.get("settings", {})
	return settings is Dictionary and bool((settings as Dictionary).get("reduce_motion", false))
