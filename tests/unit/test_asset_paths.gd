extends GutTest
## AssetPaths testleri: anahtar -> yol eşlemesi (docs/assets/naming.md).

func test_image_paths() -> void:
	assert_eq(AssetPaths.image_path("char.bilge.happy"), "res://assets/images/characters/bilge/happy.png")
	assert_eq(AssetPaths.image_path("avatar.tavsan"), "res://assets/images/avatars/tavsan.png")
	assert_eq(AssetPaths.image_path("region.sayi_ormani.bg"), "res://assets/images/regions/sayi_ormani/bg.png")
	assert_eq(AssetPaths.image_path("map.island"), "res://assets/images/map/island.png")
	assert_eq(AssetPaths.image_path("item.meyve.elma"), "res://assets/images/items/meyve/elma.png")
	assert_eq(AssetPaths.image_path("ui.star"), "res://assets/images/ui/star.png")
	assert_eq(AssetPaths.image_path("st.matematik.elma"), "res://assets/images/stickers/matematik/elma.png")
	assert_eq(AssetPaths.image_path("decor.lamba"), "res://assets/images/decor/lamba.png")

func test_unknown_prefix_and_audio_give_empty_image_path() -> void:
	assert_eq(AssetPaths.image_path("bilinmeyen.x"), "")
	assert_eq(AssetPaths.image_path("vo.sayi.3"), "")
	assert_eq(AssetPaths.image_path("sfx.correct"), "")

func test_audio_candidates() -> void:
	assert_eq(AssetPaths.audio_candidates("vo.g1.matematik.u01.n01.intro"), PackedStringArray([
		"res://assets/audio/voice/g1/matematik/u01/n01/intro.ogg",
		"res://assets/audio/voice/g1/matematik/u01/n01/intro.wav",
		"res://assets/audio/voice/g1/matematik/u01/n01/intro.mp3"]))
	assert_eq(AssetPaths.audio_candidates("vo.sayi.3")[0], "res://assets/audio/voice/sayi/3.ogg")
	assert_eq(AssetPaths.audio_candidates("music.sayi_ormani")[1], "res://assets/audio/music/sayi_ormani.wav")
	assert_eq(AssetPaths.audio_candidates("sfx.correct")[2], "res://assets/audio/sfx/correct.mp3")
	assert_eq(AssetPaths.audio_candidates("item.meyve.elma").size(), 0)

func test_is_audio_key() -> void:
	assert_true(AssetPaths.is_audio_key("vo.genel.aferin_1"))
	assert_true(AssetPaths.is_audio_key("music.x"))
	assert_true(AssetPaths.is_audio_key("sfx.x"))
	assert_false(AssetPaths.is_audio_key("ui.star"))

func test_placeholder_color_deterministic() -> void:
	assert_eq(AssetPaths.placeholder_color("item.meyve.elma"), AssetPaths.placeholder_color("item.meyve.elma"))
	var c: Color = AssetPaths.placeholder_color("item.meyve.elma")
	assert_almost_eq(c.s, 0.45, 0.01)
	assert_almost_eq(c.v, 0.95, 0.01)
