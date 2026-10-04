extends Panel
## Kil renkli, yuvarlak köşeli kutu; üzerinde büyük Andika yazısı (rakam ve harfler bununla çizilir).

const CORNER_RADIUS: int = 24
const FONT_SIZE: int = 72

@export var text: String = "":
	set(value):
		text = value
		if is_node_ready():
			_label.text = text
@export var clay_color: Color = Color(0.96, 0.78, 0.55):
	set(value):
		clay_color = value
		if is_node_ready():
			_apply_style()

@onready var _label: Label = $Label as Label

func _ready() -> void:
	custom_minimum_size = Vector2(128, 128)
	_label.add_theme_font_size_override("font_size", FONT_SIZE)
	_label.text = text
	_apply_style()

func _apply_style() -> void:
	var style: StyleBoxFlat = StyleBoxFlat.new()
	style.bg_color = clay_color
	style.set_corner_radius_all(CORNER_RADIUS)
	style.border_color = clay_color.darkened(0.2)
	style.set_border_width_all(4)
	add_theme_stylebox_override("panel", style)
