extends Node
## Kayıt servisi: atomik yazma (tmp -> bak -> rename), yedekten kurtarma.

signal recovered_from_backup
signal reset_to_fresh

const MAIN_FILE: String = "save_v1.json"
const BAK_FILE: String = "save_v1.bak.json"
const TMP_FILE: String = "save_v1.tmp.json"

var data: Dictionary = {}
var _base_dir: String = "user://"

## Test için kayıt dizinini değiştirir.
func set_base_dir(dir: String) -> void:
	_base_dir = dir if dir.ends_with("/") else dir + "/"

func _ready() -> void:
	load_or_create()

func load_or_create() -> void:
	var main_path: String = _base_dir + MAIN_FILE
	var main_exists: bool = FileAccess.file_exists(main_path)
	if not main_exists:
		data = SaveSchema.migrate(SaveSchema.new_save())
		return
	var parsed: Variant = _read_json(main_path)
	if parsed is Dictionary:
		data = SaveSchema.migrate(parsed)
		return
	var bak: Variant = _read_json(_base_dir + BAK_FILE)
	if bak is Dictionary:
		data = SaveSchema.migrate(bak)
		recovered_from_backup.emit()
		return
	data = SaveSchema.migrate(SaveSchema.new_save())
	reset_to_fresh.emit()

func save() -> void:
	var text: String = JSON.stringify(data)
	var tmp_path: String = _base_dir + TMP_FILE
	var main_path: String = _base_dir + MAIN_FILE
	var bak_path: String = _base_dir + BAK_FILE
	var f: FileAccess = FileAccess.open(tmp_path, FileAccess.WRITE)
	if f == null:
		push_error("SaveService: tmp dosyası açılamadı: %d" % FileAccess.get_open_error())
		return
	f.store_string(text)
	f.close()
	# Yazılan dosya geçerli JSON değilse ana dosyaya dokunma.
	if not (_read_json(tmp_path) is Dictionary):
		push_error("SaveService: tmp doğrulaması başarısız")
		DirAccess.remove_absolute(tmp_path)
		return
	if FileAccess.file_exists(main_path):
		DirAccess.copy_absolute(main_path, bak_path)
	var err: int = DirAccess.rename_absolute(tmp_path, main_path)
	if err != OK:
		# Bazı platformlarda hedef varsa rename başarısız olur.
		DirAccess.remove_absolute(main_path)
		err = DirAccess.rename_absolute(tmp_path, main_path)
		if err != OK:
			push_error("SaveService: rename başarısız: %d" % err)

func _read_json(path: String) -> Variant:
	if not FileAccess.file_exists(path):
		return null
	var text: String = FileAccess.get_file_as_string(path)
	var json: JSON = JSON.new()
	if json.parse(text) != OK:
		return null
	return json.data
