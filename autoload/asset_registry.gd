extends Node
## Asset kayıt defteri: anahtardan görsel/ses yükler, önbellekler, eksikleri raporlar.
## Dosya yoksa null döner; çağıran yer tutucu gösterir (geliştirme asset'ler için durmaz).

var _root: String = AssetPaths.DEFAULT_ROOT
var _cache: Dictionary = {}
var _missing: Dictionary = {}

## Test/özel kullanım için asset kökünü değiştirir; boş string varsayılana döner.
func set_root_override(root: String) -> void:
	_root = AssetPaths.DEFAULT_ROOT if root.is_empty() else root.trim_suffix("/")
	clear_cache()

func texture(key: String) -> Texture2D:
	return _load_cached(key, PackedStringArray([AssetPaths.image_path(key, _root)])) as Texture2D

func audio(key: String) -> AudioStream:
	return _load_cached(key, AssetPaths.audio_candidates(key, _root)) as AudioStream

## İstenip bulunamayan benzersiz anahtarlar.
func missing_keys() -> PackedStringArray:
	return PackedStringArray(_missing.keys())

func clear_cache() -> void:
	_cache.clear()
	_missing.clear()

func _load_cached(key: String, candidates: PackedStringArray) -> Resource:
	if _cache.has(key):
		return _cache[key]
	var res: Resource = null
	for path: String in candidates:
		if path != "" and ResourceLoader.exists(path):
			res = load(path)
			break
	if res == null:
		_missing[key] = true
	_cache[key] = res
	return res
