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
## İki satırlı yazıda satır yüksekliği (em) ve karo yüksekliğinde kaplanabilecek oran.
const LINE_EM: float = 1.25
const TEXT_HEIGHT_RATIO: float = 0.8

var token: Dictionary = {}
var framed: bool = false
var card_color: Color = ClayStyle.APRICOT

var _tile: Control = null
var _image: Control = null
## Karodaki yazının satırlara bölünmemiş hali.
var _label_text: String = ""

func _init() -> void:
	custom_minimum_size = DEFAULT_SIZE
	size = DEFAULT_SIZE

## Token'ı çizer; önceki içeriği temizler.
func set_token(t: Dictionary) -> void:
	token = t
	_tile = null
	_image = null
	_label_text = ""
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
## kadar küçülür (Andika'da ortalama harf genişliği ≈ 0.55 em). Satırlar "\n" ile ayrılır;
## iki satırlı yazı karonun yüksekliğine de sığar.
static func fit_font_size(label: String, box: Vector2) -> int:
	var fs: float = minf(box.x, box.y) * FONT_RATIO
	var lines: PackedStringArray = label.split("\n")
	var longest: int = 0
	for line: String in lines:
		longest = maxi(longest, line.length())
	if longest > 0:
		fs = minf(fs, box.x * TEXT_WIDTH_RATIO / (longest * CHAR_EM))
	if lines.size() > 1:
		fs = minf(fs, box.y * TEXT_HEIGHT_RATIO / (lines.size() * LINE_EM))
	return int(fs)

## Boşluklu metin, yazıyı büyüttüğü durumda en dengeli boşluktan iki satıra bölünür.
static func layout_label(label: String, box: Vector2) -> String:
	var best: String = label
	var best_fs: int = fit_font_size(label, box)
	for i: int in label.length():
		if label[i] != " ":
			continue
		var candidate: String = label.substr(0, i) + "\n" + label.substr(i + 1)
		var fs: int = fit_font_size(candidate, box)
		if fs > best_fs:
			best = candidate
			best_fs = fs
	return best

func _add_tile(label: String) -> Control:
	_label_text = label
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
		_tile.set("text", layout_label(_label_text, size))
		_tile.set("font_size", fit_font_size(str(_tile.get("text")), size))
	if _image != null and is_instance_valid(_image) and _tile != null:
		var pad: float = minf(size.x, size.y) * ITEM_PADDING_RATIO
		_image.offset_left = pad
		_image.offset_top = pad
		_image.offset_right = -pad
		_image.offset_bottom = -pad - 6.0
