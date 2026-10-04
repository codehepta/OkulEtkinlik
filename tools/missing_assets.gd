extends SceneTree
## Eksik asset raporu (geliştirici aracı).
## Kullanım: godot --headless --path . -s res://tools/missing_assets.gd
## content/**/*.json, ses satırları ve koddaki asset anahtarlarını toplar; her anahtarı
## AssetPaths ile yola çevirip ResourceLoader.exists ile denetler. Eksikleri türüne göre
## gruplu olarak stdout'a yazar ve build/missing_assets.md taslağını üretir. Her zaman 0 ile çıkar.

const Scan: GDScript = preload("res://scripts/core/missing_assets_scan.gd")
const CONTENT_ROOT: String = "res://content"
const STRINGS_PATH: String = "res://content/strings.tr.json"
const VOICE_LINES_PATH: String = "res://content/voice_lines.tr.json"
const CODE_ROOTS: PackedStringArray = ["res://scenes", "res://autoload", "res://scripts"]
const REPORT_PATH: String = "res://build/missing_assets.md"
const REGIONS: PackedStringArray = ["sayi_ormani", "harf_vadisi", "hayat_kasabasi", "kesif_laboratuvari"]

func _initialize() -> void:
	var keys: Dictionary = {}
	var voice_lines: Dictionary = _read_json(VOICE_LINES_PATH)
	var string_keys: Dictionary = _read_json(STRINGS_PATH)
	# 1) İçerik dosyaları (ünite, çıkartma listesi vb.); metin dosyası hariç.
	var files: PackedStringArray = PackedStringArray()
	_collect_files(CONTENT_ROOT, PackedStringArray(["json"]), files)
	for path: String in files:
		if path == STRINGS_PATH or path == VOICE_LINES_PATH:
			continue
		Scan.collect_from_json(_read_json_any(path), keys)
	# 2) Bütün ses satırları.
	for k: Variant in voice_lines:
		if Scan.is_asset_key(str(k)):
			keys[str(k)] = true
	# 3) Koddaki sabit anahtarlar + biçimlendirilmiş anahtarların açılımları.
	var code_files: PackedStringArray = PackedStringArray()
	for root: String in CODE_ROOTS:
		_collect_files(root, PackedStringArray(["gd", "tscn"]), code_files)
	for path: String in code_files:
		if path.ends_with("missing_assets_scan.gd") or path.ends_with("asset_paths.gd"):
			continue
		for k: String in Scan.extract_code_keys(FileAccess.get_file_as_string(path), string_keys):
			keys[k] = true
	for k: String in Scan.dynamic_keys(REGIONS):
		keys[k] = true
	var all_keys: PackedStringArray = PackedStringArray(keys.keys())
	all_keys.sort()
	var missing: Dictionary = Scan.find_missing(all_keys, _exists)
	print("Taranan anahtar: %d" % all_keys.size())
	print(Scan.report_text(missing))
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(REPORT_PATH.get_base_dir()))
	var f: FileAccess = FileAccess.open(REPORT_PATH, FileAccess.WRITE)
	if f != null:
		f.store_string(Scan.report_markdown(missing, voice_lines))
		f.close()
		print("Taslak: " + ProjectSettings.globalize_path(REPORT_PATH))
	else:
		print("Taslak yazılamadı: " + REPORT_PATH)
	quit(0)

func _exists(key: String) -> bool:
	if AssetPaths.is_audio_key(key):
		for p: String in AssetPaths.audio_candidates(key):
			if ResourceLoader.exists(p):
				return true
		return false
	var img: String = AssetPaths.image_path(key)
	return not img.is_empty() and ResourceLoader.exists(img)

func _collect_files(dir: String, exts: PackedStringArray, out: PackedStringArray) -> void:
	if not DirAccess.dir_exists_absolute(dir):
		return
	for f: String in DirAccess.get_files_at(dir):
		if exts.has(f.get_extension()):
			out.append(dir.path_join(f))
	for d: String in DirAccess.get_directories_at(dir):
		_collect_files(dir.path_join(d), exts, out)

func _read_json_any(path: String) -> Variant:
	return JSON.parse_string(FileAccess.get_file_as_string(path))

func _read_json(path: String) -> Dictionary:
	var v: Variant = _read_json_any(path)
	return v if v is Dictionary else {}
