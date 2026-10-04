extends Control
## Bir token'ı çizer: item -> AssetImage, number -> ClayTile (rakam), text -> ClayTile (metin).
## Yalnızca çetele çizgilerinden ("|", "||", ...) oluşan metin ClayTile'ın çetele modunda çizilir.
## framed: item görseli de kil kartın üstünde durur (sürüklenen / seçilen kartlar için).

const ASSET_IMAGE: PackedScene = preload("res://scenes/components/asset_image.tscn")
const CLAY_TILE: PackedScene = preload("res://scenes/components/clay_tile.tscn")
const DEFAULT_SIZE: Vector2 = Vector2(200, 200)
const TALLY_CHAR: String = "|"
const FONT_RATIO: float = 0.5
const ITEM_PADDING_RATIO: float = 0.12
## Yazının karo genişliğinde kaplayabileceği oran ve ortalama harf genişliği (em).
const TEXT_WIDTH_RATIO: float = 0.84
const CHAR_EM: float = 0.55

var token: Dictionary = {}
var framed: bool = false
var card_color: Color = ClayStyle.APRICOT

var _tile: Control = null
var _image: Control = null

func _init() -> void:
	custom_minimum_size = DEFAULT_SIZE
	size = DEFAULT_SIZE

## Token'ı çizer; önceki içeriği temizler.
func set_token(t: Dictionary) -> void:
	token = t
	_tile = null
	_image = null
	for c: Node in get_children():
		remove_child(c)
		c.queue_free()
	match str(t.get("type", "")):
		"item":
			if framed:
				_tile = _add_tile("")
			var img: Control = ASSET_IMAGE.instantiate() as Control
			img.set("key", str(t["value"]))
			_image = _add_full(img)
		"number":
			_tile = _add_tile(str(int(t["value"])))
		"text":
			var s: String = Strings.t(str(t["value"]))
			var bars: int = tally_count(s)
			_tile = _add_tile("" if bars > 0 else s)
			_tile.set("tally", bars)
		_:
			return
	_layout()

## Metin yalnızca 1–5 çetele çizgisiyse çizgi sayısı, değilse 0.
static func tally_count(s: String) -> int:
	if s.is_empty() or s.length() > 5:
		return 0
	for ch: String in s:
		if ch != TALLY_CHAR:
			return 0
	return s.length()

## Karo yazısının boyutu: kısa kenarın yarısı; uzun sözcükler karonun genişliğine sığacak
## kadar küçülür (Andika'da ortalama harf genişliği ≈ 0.55 em).
static func fit_font_size(label: String, box: Vector2) -> int:
	var fs: float = minf(box.x, box.y) * FONT_RATIO
	if label.length() > 0:
		fs = minf(fs, box.x * TEXT_WIDTH_RATIO / (label.length() * CHAR_EM))
	return int(fs)

func _add_tile(label: String) -> Control:
	var tile: Control = CLAY_TILE.instantiate() as Control
	tile.set("text", label)
	tile.set("clay_color", card_color)
	return _add_full(tile)

func _add_full(child: Control) -> Control:
	child.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	child.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(child)
	return child

func _notification(what: int) -> void:
	if what == NOTIFICATION_RESIZED:
		_layout()

func _layout() -> void:
	if _tile != null and is_instance_valid(_tile):
		_tile.set("font_size", fit_font_size(str(_tile.get("text")), size))
	if _image != null and is_instance_valid(_image) and _tile != null:
		var pad: float = minf(size.x, size.y) * ITEM_PADDING_RATIO
		_image.offset_left = pad
		_image.offset_top = pad
		_image.offset_right = -pad
		_image.offset_bottom = -pad - 6.0
