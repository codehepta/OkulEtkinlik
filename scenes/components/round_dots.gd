extends Control
## Tur göstergesi: her tur bir kil boncuk. Biten: dolu + parlak; şimdiki: büyük, kalın halkalı;
## gelecek: küçük, soluk ve içi boş. Anlam yalnızca renkle değil boyut ve dolulukla da verilir.

const DONE_COLOR: Color = Color(0.98, 0.62, 0.22)
const CURRENT_RING: Color = Color(0.93, 0.47, 0.16)
const FUTURE_COLOR: Color = Color(1.0, 0.97, 0.9, 0.75)
const BASE_RADIUS: float = 20.0
const CURRENT_RADIUS: float = 28.0
const GAP: float = 26.0
const PLAQUE: Color = Color(1.0, 0.96, 0.88, 0.85)

var _done: int = 0
var _current: int = -1
var _total: int = 0

func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE

## done: tamamlanan tur sayısı; current: şimdiki turun sırası (-1 yok); total: toplam tur.
func set_progress(done: int, current: int, total: int) -> void:
	_done = done
	_current = current
	_total = total
	queue_redraw()

func done_count() -> int:
	return _done

func total_count() -> int:
	return _total

func _draw() -> void:
	if _total <= 0:
		return
	var step: float = CURRENT_RADIUS * 2.0 + GAP
	var width: float = (_total - 1) * step
	var cy: float = size.y / 2.0
	var x0: float = (size.x - width) / 2.0
	# Kil plaket.
	var pad: float = CURRENT_RADIUS + 22.0
	var plaque: StyleBoxFlat = StyleBoxFlat.new()
	plaque.bg_color = PLAQUE
	plaque.set_corner_radius_all(int(pad))
	plaque.border_color = Color(1, 1, 1, 0.9)
	plaque.set_border_width_all(4)
	plaque.shadow_color = Color(0.2, 0.1, 0.03, 0.18)
	plaque.shadow_size = 10
	plaque.shadow_offset = Vector2(0, 5)
	plaque.anti_aliasing = true
	draw_style_box(plaque, Rect2(x0 - pad, cy - pad, width + pad * 2.0, pad * 2.0))
	for i: int in _total:
		var c: Vector2 = Vector2(x0 + i * step, cy)
		if i < _done:
			_bead(c, BASE_RADIUS + 2.0, DONE_COLOR)
		elif i == _current:
			draw_circle(c + Vector2(0, 4), CURRENT_RADIUS, Color(0.2, 0.1, 0.03, 0.2), true, -1.0, true)
			draw_circle(c, CURRENT_RADIUS, Color(1, 1, 1), true, -1.0, true)
			draw_circle(c, CURRENT_RADIUS - 4.0, CURRENT_RING, false, 8.0, true)
			draw_circle(c, 8.0, CURRENT_RING, true, -1.0, true)
		else:
			draw_circle(c, BASE_RADIUS - 4.0, FUTURE_COLOR, true, -1.0, true)
			draw_circle(c, BASE_RADIUS - 4.0, Color(0.7, 0.55, 0.4, 0.8), false, 4.0, true)

## Dolu kil boncuk: gölge, gövde, alt koyuluk, ışık noktası.
func _bead(c: Vector2, r: float, col: Color) -> void:
	draw_circle(c + Vector2(0, 4), r, Color(0.2, 0.1, 0.03, 0.22), true, -1.0, true)
	draw_circle(c, r, col.darkened(0.18), true, -1.0, true)
	draw_circle(c + Vector2(0, -2), r - 3.0, col, true, -1.0, true)
	draw_circle(c + Vector2(-r * 0.35, -r * 0.4), r * 0.28, col.lightened(0.55), true, -1.0, true)
