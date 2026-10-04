extends Panel
## Kil renkli, yuvarlak köşeli kabarık kutu; üzerinde büyük Andika yazısı (rakam ve harfler).
## Çetele modu (tally > 0): yazı yerine en çok 5 kalın kil çubuk çizilir (5'te çapraz yok).

const GameStyle: GDScript = preload("res://scenes/games/game_style.gd")
const CORNER_RADIUS: int = 28
const FONT_SIZE: int = 72
const MAX_TALLY: int = 5
const BAR_COLOR: Color = Color(0.55, 0.32, 0.16)

@export var text: String = "":
	set(value):
		text = value
		if is_node_ready():
			_label.text = text
@export var clay_color: Color = ClayStyle.APRICOT:
	set(value):
		clay_color = value
		if is_node_ready():
			_apply_style()
## 0: metin modu; 1–5: çetele çubuğu sayısı.
@export var tally: int = 0:
	set(value):
		tally = clampi(value, 0, MAX_TALLY)
		if is_node_ready():
			_refresh_tally()
@export var font_size: int = FONT_SIZE:
	set(value):
		font_size = value
		if is_node_ready():
			_label.add_theme_font_size_override("font_size", font_size)

@onready var _label: Label = $Label as Label
var _bars: Control

func _ready() -> void:
	custom_minimum_size = Vector2(128, 128)
	_label.add_theme_font_size_override("font_size", font_size)
	_label.text = text
	# Yazı kil derinliğinin (kalın alt kenar) üstünde ortalansın.
	_label.offset_bottom = -float(ClayStyle.DEPTH)
	_bars = Control.new()
	_bars.name = "TallyBars"
	_bars.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_bars.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	_bars.draw.connect(_draw_tally)
	add_child(_bars)
	_apply_style()
	_refresh_tally()

func _apply_style() -> void:
	add_theme_stylebox_override("panel", GameStyle.card_box(clay_color, CORNER_RADIUS))

func _refresh_tally() -> void:
	_label.visible = tally == 0
	_bars.visible = tally > 0
	_bars.queue_redraw()

## Kalın, uçları yuvarlak kil çubuklar: gölge + gövde + açık ışık çizgisi.
func _draw_tally() -> void:
	if tally <= 0:
		return
	var area: Vector2 = _bars.size
	var bar_h: float = area.y * 0.56
	var bar_w: float = clampf(area.x * 0.105, 16.0, 30.0)
	var gap: float = bar_w * 0.75
	var total: float = tally * bar_w + (tally - 1) * gap
	var x0: float = (area.x - total) / 2.0 + bar_w / 2.0
	var top: float = (area.y - bar_h) / 2.0 - 4.0
	for i: int in tally:
		var x: float = x0 + i * (bar_w + gap)
		var a: Vector2 = Vector2(x, top + bar_w / 2.0)
		var b: Vector2 = Vector2(x, top + bar_h - bar_w / 2.0)
		_capsule(a + Vector2(0, 5), b + Vector2(0, 5), bar_w, Color(0.2, 0.1, 0.03, 0.25))
		_capsule(a, b, bar_w, BAR_COLOR)
		_capsule(a + Vector2(-bar_w * 0.18, 0), b + Vector2(-bar_w * 0.18, -bar_w * 0.3), bar_w * 0.28, BAR_COLOR.lightened(0.35))

func _capsule(a: Vector2, b: Vector2, w: float, c: Color) -> void:
	_bars.draw_line(a, b, c, w, true)
	_bars.draw_circle(a, w / 2.0, c, true, -1.0, true)
	_bars.draw_circle(b, w / 2.0, c, true, -1.0, true)
