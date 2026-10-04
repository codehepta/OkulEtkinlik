extends Panel
## Kil renkli, yuvarlak köşeli kutu; üzerinde büyük Andika yazısı (rakam ve harfler bununla çizilir).

const CORNER_RADIUS: int = 24
const FONT_SIZE: int = 72

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

@onready var _label: Label = $Label as Label

func _ready() -> void:
	custom_minimum_size = Vector2(128, 128)
	_label.add_theme_font_size_override("font_size", FONT_SIZE)
	_label.text = text
	# Yazı kil derinliğinin (kalın alt kenar) üstünde ortalansın.
	_label.offset_bottom = -float(ClayStyle.DEPTH)
	_apply_style()

func _apply_style() -> void:
	add_theme_stylebox_override("panel", ClayStyle.box(clay_color, CORNER_RADIUS))
