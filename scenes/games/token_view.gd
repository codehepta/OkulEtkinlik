extends Control
## Bir token'ı çizer: item -> AssetImage, number -> ClayTile (rakam), text -> ClayTile (metin).

const ASSET_IMAGE: PackedScene = preload("res://scenes/components/asset_image.tscn")
const CLAY_TILE: PackedScene = preload("res://scenes/components/clay_tile.tscn")
const DEFAULT_SIZE: Vector2 = Vector2(200, 200)

var token: Dictionary = {}

func _init() -> void:
	custom_minimum_size = DEFAULT_SIZE
	size = DEFAULT_SIZE

## Token'ı çizer; önceki içeriği temizler.
func set_token(t: Dictionary) -> void:
	token = t
	for c: Node in get_children():
		remove_child(c)
		c.queue_free()
	var child: Control
	match str(t.get("type", "")):
		"item":
			var img: Control = ASSET_IMAGE.instantiate() as Control
			img.set("key", str(t["value"]))
			child = img
		"number":
			var tile: Control = CLAY_TILE.instantiate() as Control
			tile.set("text", str(int(t["value"])))
			child = tile
		"text":
			var tile2: Control = CLAY_TILE.instantiate() as Control
			tile2.set("text", Strings.t(str(t["value"])))
			child = tile2
		_:
			return
	child.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	child.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(child)
