class_name AssetPaths
extends RefCounted
## Mantıksal asset anahtarını dosya yoluna çevirir (docs/assets/naming.md).

const DEFAULT_ROOT: String = "res://assets"
const AUDIO_EXTENSIONS: PackedStringArray = ["ogg", "wav", "mp3"]

## Görsel anahtar önekleri -> images altındaki kök klasör.
const IMAGE_PREFIXES: Dictionary = {
	"char": "characters",
	"avatar": "avatars",
	"region": "regions",
	"map": "map",
	"item": "items",
	"ui": "ui",
	"st": "stickers",
	"decor": "decor",
}

## Ses anahtar önekleri -> audio altındaki kök klasör.
const AUDIO_PREFIXES: Dictionary = {
	"vo": "voice",
	"music": "music",
	"sfx": "sfx",
}

static func is_audio_key(key: String) -> bool:
	return AUDIO_PREFIXES.has(key.get_slice(".", 0)) and key.contains(".")

## Görsel yolu; ses anahtarı ya da tanımsız önek için boş string.
static func image_path(key: String, root: String = DEFAULT_ROOT) -> String:
	var parts: PackedStringArray = key.split(".")
	if parts.size() < 2 or not IMAGE_PREFIXES.has(parts[0]):
		return ""
	var rel: String = "/".join(parts.slice(1))
	return "%s/images/%s/%s.png" % [root, IMAGE_PREFIXES[parts[0]], rel]

## Ses için aday yollar (.ogg, .wav, .mp3 sırasıyla); ses olmayan anahtar için boş.
static func audio_candidates(key: String, root: String = DEFAULT_ROOT) -> PackedStringArray:
	var result: PackedStringArray = PackedStringArray()
	if not is_audio_key(key):
		return result
	var parts: PackedStringArray = key.split(".")
	var rel: String = "/".join(parts.slice(1))
	for ext: String in AUDIO_EXTENSIONS:
		result.append("%s/audio/%s/%s.%s" % [root, AUDIO_PREFIXES[parts[0]], rel, ext])
	return result

## Anahtara göre deterministik pastel yer tutucu rengi.
static func placeholder_color(key: String) -> Color:
	var h: int = posmod(hash(key), 360)
	return Color.from_hsv(h / 360.0, 0.45, 0.95)
