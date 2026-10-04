extends GutTest
## SaveService testleri: atomik yazma, yedek, bozuk dosyadan kurtarma.

const SERVICE_SCRIPT: String = "res://autoload/save_service.gd"

var _dir: String = ""
var _svc: Node = null

func before_each() -> void:
	_dir = "user://test_%d_%d/" % [Time.get_ticks_usec(), randi()]
	DirAccess.make_dir_recursive_absolute(_dir)
	_svc = load(SERVICE_SCRIPT).new()
	_svc.set_base_dir(_dir)

func after_each() -> void:
	if _svc != null:
		_svc.free()
		_svc = null
	var d: DirAccess = DirAccess.open(_dir)
	if d != null:
		for f: String in d.get_files():
			d.remove(f)
	DirAccess.remove_absolute(_dir)

func _write(name: String, text: String) -> void:
	var f: FileAccess = FileAccess.open(_dir + name, FileAccess.WRITE)
	f.store_string(text)
	f.close()

func _read(name: String) -> String:
	return FileAccess.get_file_as_string(_dir + name)

func test_fresh_install_creates_default() -> void:
	watch_signals(_svc)
	_svc.load_or_create()
	assert_eq(_svc.data["schema_version"], SaveSchema.VERSION)
	assert_eq((_svc.data["profiles"] as Array).size(), 0)
	assert_signal_not_emitted(_svc, "reset_to_fresh")
	assert_signal_not_emitted(_svc, "recovered_from_backup")

func test_roundtrip_preserves_data() -> void:
	_svc.load_or_create()
	(_svc.data["profiles"] as Array).append(SaveSchema.new_profile("p1", "tavsan", "Ada", 2))
	_svc.data["last_day_seen"] = 20000
	_svc.data["settings"]["vol_music"] = 0.25
	_svc.save()
	var other: Node = load(SERVICE_SCRIPT).new()
	other.set_base_dir(_dir)
	other.load_or_create()
	assert_eq(other.data, _svc.data)
	assert_typeof(other.data["last_day_seen"], TYPE_INT)
	assert_typeof(other.data["profiles"][0]["grade"], TYPE_INT)
	assert_eq(other.data["profiles"][0]["nickname"], "Ada")
	other.free()

func test_save_writes_backup_of_previous() -> void:
	_svc.load_or_create()
	_svc.data["last_day_seen"] = 1
	_svc.save()
	var first: String = _read("save_v1.json")
	_svc.data["last_day_seen"] = 2
	_svc.save()
	assert_eq(_read("save_v1.bak.json"), first)
	assert_ne(_read("save_v1.json"), first)
	assert_false(FileAccess.file_exists(_dir + "save_v1.tmp.json"))

func test_corrupt_main_falls_back_to_backup() -> void:
	_svc.load_or_create()
	_svc.data["last_day_seen"] = 7
	_svc.save()
	_svc.data["last_day_seen"] = 8
	_svc.save()
	_write("save_v1.json", "{bozuk")
	var other: Node = load(SERVICE_SCRIPT).new()
	other.set_base_dir(_dir)
	watch_signals(other)
	other.load_or_create()
	assert_signal_emitted(other, "recovered_from_backup")
	assert_signal_not_emitted(other, "reset_to_fresh")
	assert_eq(other.data["last_day_seen"], 7)
	other.free()

func test_both_corrupt_resets_and_signals() -> void:
	_write("save_v1.json", "{bozuk")
	_write("save_v1.bak.json", "[1,2")
	watch_signals(_svc)
	_svc.load_or_create()
	assert_signal_emitted(_svc, "reset_to_fresh")
	assert_eq(_svc.data["schema_version"], SaveSchema.VERSION)
	assert_eq((_svc.data["profiles"] as Array).size(), 0)

func test_corrupt_main_without_backup_resets() -> void:
	_write("save_v1.json", "{bozuk")
	watch_signals(_svc)
	_svc.load_or_create()
	assert_signal_emitted(_svc, "reset_to_fresh")

func test_migrate_unknown_future_version_does_not_crash() -> void:
	_write("save_v1.json", JSON.stringify({"schema_version": 99, "last_day_seen": 5, "extra": "x"}))
	watch_signals(_svc)
	_svc.load_or_create()
	assert_eq(int(_svc.data["schema_version"]), 99)
	assert_eq(_svc.data["extra"], "x")
	assert_signal_not_emitted(_svc, "reset_to_fresh")
	_svc.save()
	assert_true(JSON.parse_string(_read("save_v1.json")) is Dictionary)
	assert_eq(int(JSON.parse_string(_read("save_v1.json"))["schema_version"]), 99)

func test_migrate_fills_defaults_and_normalizes_ints() -> void:
	var m: Dictionary = SaveSchema.migrate({"schema_version": 1.0, "profiles": [{"id": "p1", "grade": 2.0}]})
	assert_typeof(m["schema_version"], TYPE_INT)
	assert_typeof(m["profiles"][0]["grade"], TYPE_INT)
	assert_true(m.has("settings"))
	assert_true(m["profiles"][0].has("outcomes"))
