extends Button
## Büyük kil düğme (en az 128×128): isteğe bağlı simge + metin; dokunuşta 0.1 sn "pop" ve ses.

const CORNER_RADIUS: int = 24
const FONT_SIZE: int = 56
const POP_SECONDS: float = 0.1
const ICON_MARGIN: float = 16.0

## Metin için strings anahtarı (boşsa metinsiz).
@export var text_key: String = "":
	set(value):
		text_key = value
		if is_node_ready():
			_refresh()
## Simge için asset anahtarı (boşsa simgesiz).
@export var icon_key: String = "":
	set(value):
		icon_key = value
		if is_node_ready():
			_refresh()
@export var clay_color: Color = Color(0.96, 0.78, 0.55):
	set(value):
		clay_color = value
		if is_node_ready():
			_apply_style()

@onready var _icon: Control = $Icon as Control

func _ready() -> void:
	custom_minimum_size = custom_minimum_size.max(Vector2(128, 128))
	add_theme_font_size_override("font_size", FONT_SIZE)
	add_theme_color_override("font_color", Color(0.25, 0.15, 0.08))
	pressed.connect(_on_pressed)
	_apply_style()
	_refresh()

func _refresh() -> void:
	text = Strings.t(text_key) if text_key != "" else ""
	_icon.set("key", icon_key)
	_icon.visible = icon_key != ""

func _apply_style() -> void:
	var normal: StyleBoxFlat = _box(clay_color)
	add_theme_stylebox_override("normal", normal)
	add_theme_stylebox_override("hover", _box(clay_color.lightened(0.08)))
	add_theme_stylebox_override("pressed", _box(clay_color.darkened(0.08)))
	add_theme_stylebox_override("focus", _box(clay_color))

func _box(color: Color) -> StyleBoxFlat:
	var style: StyleBoxFlat = StyleBoxFlat.new()
	style.bg_color = color
	style.set_corner_radius_all(CORNER_RADIUS)
	style.border_color = color.darkened(0.2)
	style.set_border_width_all(4)
	return style

func _on_pressed() -> void:
	AudioDirector.play_sfx("sfx.tap")
	var settings: Variant = SaveService.data.get("settings", {})
	if settings is Dictionary and bool((settings as Dictionary).get("reduce_motion", false)):
		return
	pivot_offset = size / 2.0
	var tw: Tween = create_tween()
	tw.tween_property(self, "scale", Vector2(1.1, 1.1), POP_SECONDS / 2.0)
	tw.tween_property(self, "scale", Vector2.ONE, POP_SECONDS / 2.0)
