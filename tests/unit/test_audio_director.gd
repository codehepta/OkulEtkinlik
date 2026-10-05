extends GutTest
## AudioDirector testleri: ses seviyeleri ve ducking.

var _a: Node = null

func before_each() -> void:
	_a = load("res://autoload/audio_director.gd").new()
	add_child_autofree(_a)

func after_each() -> void:
	_a.apply_volumes({"vol_voice": 1.0, "vol_music": 1.0, "vol_sfx": 1.0})
	_a.set_ducked(false)

func test_buses_exist() -> void:
	for b: String in ["Master", "Voice", "Music", "SFX"]:
		assert_ne(AudioServer.get_bus_index(b), -1, b)

func test_apply_volumes_linear_to_db() -> void:
	_a.apply_volumes({"vol_voice": 0.5, "vol_music": 1.0, "vol_sfx": 1.0})
	assert_almost_eq(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Voice")), linear_to_db(0.5), 0.01)

func test_duck_lowers_music_by_12_db() -> void:
	_a.apply_volumes({"vol_voice": 1.0, "vol_music": 1.0, "vol_sfx": 1.0})
	var idx: int = AudioServer.get_bus_index("Music")
	_a.set_ducked(true)
	assert_almost_eq(AudioServer.get_bus_volume_db(idx), -12.0, 0.01)
	_a.set_ducked(false)
	assert_almost_eq(AudioServer.get_bus_volume_db(idx), 0.0, 0.01)

## Faz 8 ses miksajı: ana kanalda sınırlayıcı var; üst üste binen ses, müzik ve efekt patlamaz.
func test_master_has_limiter() -> void:
	var master: int = AudioServer.get_bus_index("Master")
	var found: bool = false
	for i: int in AudioServer.get_bus_effect_count(master):
		if AudioServer.get_bus_effect(master, i) is AudioEffectHardLimiter and AudioServer.is_bus_effect_enabled(master, i):
			found = true
			assert_lte((AudioServer.get_bus_effect(master, i) as AudioEffectHardLimiter).ceiling_db, -0.5)
	assert_true(found, "Master kanalında etkin sınırlayıcı")
