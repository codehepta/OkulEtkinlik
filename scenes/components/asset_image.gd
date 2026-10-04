extends TextureRect
## Anahtardan görsel gösterir; görsel yoksa renkli yer tutucu panel + etiket.

const CORNER_RADIUS: int = 24

@export var key: String = "":
	set(value):
		key = value
		if is_node_ready():
			_refresh()

var _panel: Panel
var _label: Label

func _ready() -> void:
	# Eklenmeden önce verilen daha büyük boyut korunur; en az 128×128.
	custom_minimum_size = custom_minimum_size.max(Vector2(128, 128))
	expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	_panel = $Placeholder as Panel
	_label = $Placeholder/PlaceholderLabel as Label
	_refresh()

func _refresh() -> void:
	var tex: Texture2D = AssetRegistry.texture(key) if key != "" else null
	texture = tex
	_panel.visible = tex == null
	if tex != null:
		return
	_panel.add_theme_stylebox_override("panel", ClayStyle.panel_box(AssetPaths.placeholder_color(key), CORNER_RADIUS))
	_label.text = _label_text()

func _label_text() -> String:
	if Strings.has("label." + key):
		return Strings.t("label." + key)
	return key.get_slice(".", key.get_slice_count(".") - 1)
