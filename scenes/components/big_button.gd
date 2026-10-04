extends Button
## Büyük kil düğme (en az 128×128): isteğe bağlı simge + metin; dokunuşta 0.1 sn "pop" ve ses.
## Yalnızca simge varsa simge düğmeyi doldurur; simge + metin varsa simge solda durur,
## metin kalan alanda ortalanır (üst üste binmez).

const FONT_SIZE: int = 56
const POP_SECONDS: float = 0.1
const ICON_MARGIN: float = 16.0
## Simge + metin düzeninde simgenin en büyük kenarı.
const SIDE_ICON_MAX: float = 112.0

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
@export var clay_color: Color = ClayStyle.APRICOT:
	set(value):
		clay_color = value
		if is_node_ready():
			_apply_style()

@onready var _icon: Control = $Icon as Control

func _ready() -> void:
	custom_minimum_size = custom_minimum_size.max(Vector2(128, 128))
	add_theme_font_size_override("font_size", FONT_SIZE)
	pressed.connect(_on_pressed)
	resized.connect(_layout_icon)
	_apply_style()
	_refresh()

## Simge + metin düzeninde mi (testler için).
func has_side_icon() -> bool:
	return icon_key != "" and text_key != ""

## Simgenin düğme içindeki dikdörtgeni (testler için).
func icon_rect() -> Rect2:
	return Rect2(_icon.position, _icon.size)

func _refresh() -> void:
	text = Strings.t(text_key) if text_key != "" else ""
	_icon.set("key", icon_key)
	_icon.visible = icon_key != ""
	_apply_style()
	_layout_icon()

func _side_icon_size() -> float:
	var h: float = maxf(size.y, custom_minimum_size.y)
	return minf(SIDE_ICON_MAX, h - 2.0 * ICON_MARGIN - float(ClayStyle.DEPTH))

func _apply_style() -> void:
	ClayStyle.style_button(self, clay_color)
	if not has_side_icon():
		return
	# Metin simgenin sağındaki alanda ortalansın: soldaki iç boşluğu simge kadar genişlet.
	var left: float = ICON_MARGIN * 2.0 + _side_icon_size()
	for state: String in ["normal", "hover", "pressed", "hover_pressed", "disabled"]:
		var sb: StyleBox = get_theme_stylebox(state)
		sb.content_margin_left = left
		sb.content_margin_right = ICON_MARGIN * 2.0

func _layout_icon() -> void:
	if _icon == null:
		return
	if has_side_icon():
		var s: float = _side_icon_size()
		_icon.set_anchors_preset(Control.PRESET_TOP_LEFT)
		_icon.custom_minimum_size = Vector2(s, s)
		_icon.size = Vector2(s, s)
		_icon.position = Vector2(ICON_MARGIN * 1.5, (size.y - float(ClayStyle.DEPTH) - s) / 2.0)
	else:
		_icon.custom_minimum_size = Vector2.ZERO
		_icon.set_anchors_preset(Control.PRESET_FULL_RECT)
		_icon.offset_left = ICON_MARGIN
		_icon.offset_top = ICON_MARGIN
		_icon.offset_right = -ICON_MARGIN
		_icon.offset_bottom = -ICON_MARGIN - float(ClayStyle.DEPTH)

func _on_pressed() -> void:
	AudioDirector.play_sfx("sfx.tap")
	var settings: Variant = SaveService.data.get("settings", {})
	if settings is Dictionary and bool((settings as Dictionary).get("reduce_motion", false)):
		return
	pivot_offset = size / 2.0
	var tw: Tween = create_tween()
	tw.tween_property(self, "scale", Vector2(1.1, 1.1), POP_SECONDS / 2.0)
	tw.tween_property(self, "scale", Vector2.ONE, POP_SECONDS / 2.0)
