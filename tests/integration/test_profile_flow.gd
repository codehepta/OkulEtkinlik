extends GutTest
## AppState ve profil akışı: splash yönlendirmesi, profil oluşturma, seçim, kilit.

const FakeServices: GDScript = preload("res://tests/helpers/fake_services.gd")
const SAVE_DIR: String = "user://profile_flow_test"

var _fake: Node = null
var _save: Node = null
var _progress: Node = null
var _timer: Node = null
var _app: Node = null
var _root: Node = null

func before_each() -> void:
	DirAccess.make_dir_recursive_absolute(SAVE_DIR)
	_fake = FakeServices.new()
	add_child_autofree(_fake)
	_save = load("res://autoload/save_service.gd").new()
	_save.set_base_dir(SAVE_DIR)
	_save.load_or_create()
	_progress = load("res://autoload/progress.gd").new()
	_progress.save = _save
	_timer = load("res://autoload/session_timer.gd").new()
	_timer.save = _save
	add_child_autofree(_timer)
	_root = Node.new()
	add_child_autofree(_root)
	_app = load("res://autoload/app_state.gd").new()
	_app.progress = _progress
	_app.session_timer = _timer
	_app.narrator = _fake
	_app.audio = _fake
	_app.save = _save
	_app.scene_root = _root

func after_each() -> void:
	for f: String in DirAccess.get_files_at(SAVE_DIR):
		DirAccess.remove_absolute(SAVE_DIR.path_join(f))
	_app.free()
	_progress.free()
	_save.free()

func _screen() -> Node:
	return _app.current_scene()

func _lock_profile(id: String) -> void:
	_save.data["settings"]["daily_limit_min"] = 10
	# Süre sınırı cihaz başınadır; profil kimliği yalnızca çağrıyı okunur kılmak için.
	assert_ne(id, "")
	_save.data["usage"]["seconds"] = 9999
	_save.data["usage"]["day"] = _timer._effective_day()

func _splash() -> Control:
	var splash: Control = (load("res://scenes/ui/splash.tscn") as PackedScene).instantiate() as Control
	splash.app = _app
	_root.add_child(splash)
	return splash

func test_splash_waits_for_start_button() -> void:
	var splash: Control = _splash()
	await wait_seconds(0.6)
	assert_eq(_app.current_scene_name(), "splash", "düğmeye basılmadan geçmez")
	assert_true(_fake.said.has("vo.genel.hosgeldin"))
	splash.start_button().pressed.emit()
	assert_eq(_app.current_scene_name(), "profile_create")

func test_splash_start_with_profile_goes_to_select() -> void:
	_progress.create_profile("avatar.kedi", "A", 1)
	var splash: Control = _splash()
	splash.start_button().pressed.emit()
	assert_eq(_app.current_scene_name(), "profile_select")

func test_splash_start_button_is_big_with_text_and_icon() -> void:
	var splash: Control = _splash()
	await wait_process_frames(2)
	var b: Button = splash.start_button()
	assert_eq(b.text, Strings.t("splash.start"))
	assert_eq(str(b.get("icon_key")), "ui.page_next")
	assert_gte(b.size.x, 480.0)
	assert_gte(b.size.y, 150.0)
	splash.queue_free()

func test_splash_says_start_hint_after_greeting() -> void:
	var splash: Control = _splash()
	await wait_until(func() -> bool: return _fake.said.has("vo.genel.basla_dokun"), 2.0)
	assert_eq(_fake.said, ["vo.genel.hosgeldin", "vo.genel.basla_dokun"] as Array[String])
	splash.queue_free()

func test_splash_start_is_single_shot() -> void:
	var splash: Control = _splash()
	splash.start_button().pressed.emit()
	var first: Node = _app.current_scene()
	splash.start()
	assert_eq(_app.current_scene(), first, "ikinci dokunuş yeni ekran açmaz")

func test_splash_has_island_backdrop_title_plaque_and_bilge() -> void:
	var splash: Control = _splash()
	assert_eq(splash.backdrop().texture, AssetRegistry.texture("map.island"), "ada görseli zemin")
	assert_eq(splash.title_label().text, Strings.t("app.title"))
	assert_true(splash.title_label().get_parent() == splash.title_plaque(), "başlık kil plakette")
	assert_not_null(splash.bilge_view())
	assert_gte(splash.bilge_view().size.y, 300.0)
	splash.queue_free()

func test_splash_reduce_motion_shows_final_state() -> void:
	_save.data["settings"]["reduce_motion"] = true
	var splash: Control = _splash()
	await wait_physics_frames(3)
	assert_eq(splash.title_plaque().modulate.a, 1.0, "hareket azaltılınca plaket hemen görünür")
	assert_eq(splash.bilge_view().modulate.a, 1.0)
	assert_eq(splash.start_button().scale, Vector2.ONE, "hareket azaltılınca düğme atmaz")
	splash.queue_free()

func test_create_profile_flow_reaches_world_map() -> void:
	_app.goto("profile_create")
	var s: Node = _screen()
	assert_eq(_app.current_scene_name(), "profile_create")
	assert_true(_fake.said.has("vo.genel.avatar_sec"))
	assert_eq(s.step(), 1)
	s.pick_avatar("avatar.tavsan")
	assert_eq(s.step(), 2)
	assert_true(_fake.said.has("vo.genel.sinif_sec"))
	s.pick_grade(2)
	assert_eq(s.step(), 3)
	assert_eq(s.nickname_edit().max_length, 12)
	s.confirm()
	var list: Array[Dictionary] = _progress.profiles()
	assert_eq(list.size(), 1)
	assert_eq(str(list[0]["avatar"]), "avatar.tavsan")
	assert_eq(int(list[0]["grade"]), 2)
	assert_eq(_app.current_scene_name(), "world_map")
	assert_eq(_app.profile_id, str(list[0]["id"]))
	assert_eq(_app.active_grade, 2)

func test_nickname_is_saved() -> void:
	_app.goto("profile_create")
	var s: Node = _screen()
	s.pick_avatar("avatar.ayi")
	s.pick_grade(1)
	s.nickname_edit().text = "Deniz"
	s.confirm()
	assert_eq(str(_progress.profiles()[0]["nickname"]), "Deniz")

func test_plus_card_hidden_at_four_profiles() -> void:
	for i: int in 3:
		_progress.create_profile("avatar.kedi", "P%d" % i, 1)
	_app.goto("profile_select")
	assert_true(_screen().plus_card().visible)
	assert_eq(_screen().profile_cards().size(), 3)
	_progress.create_profile("avatar.ayi", "P4", 1)
	_app.goto("profile_select")
	assert_false(_screen().plus_card().visible)
	assert_eq(_screen().profile_cards().size(), 4)
	assert_true(_fake.said.has("vo.genel.profil_sec"))

func test_profile_select_has_title_plaque_island_and_bilge() -> void:
	_progress.create_profile("avatar.kedi", "A", 1)
	_app.goto("profile_select")
	var s: Node = _screen()
	assert_eq(s.title_label().text, Strings.t("profile.title"))
	assert_eq(s.backdrop().texture, AssetRegistry.texture("map.island"), "ada görseli zemin")
	assert_not_null(s.bilge_view())
	assert_eq(s.plus_caption().text, Strings.t("profile.new"))

func test_profile_create_has_same_island_backdrop_on_every_step() -> void:
	# "Hangi arkadaş sen olsun?" ekranı düz yeşildi; profil seçme ekranıyla aynı bulanık ada zemini.
	_app.goto("profile_create")
	var s: Node = _screen()
	var bd: TextureRect = s.backdrop()
	assert_not_null(bd, "zemin var")
	if bd == null:
		return
	assert_eq(bd.texture, AssetRegistry.texture("map.island"), "ada görseli zemin")
	assert_not_null(bd.material, "bulanık")
	s.pick_avatar("avatar.kedi")
	assert_true(bd.is_visible_in_tree(), "sınıf adımında da zemin görünür")
	s.pick_grade(2)
	assert_true(bd.is_visible_in_tree(), "takma ad adımında da zemin görünür")

func test_card_press_bounces_then_selects() -> void:
	var id: String = _progress.create_profile("avatar.kedi", "A", 2)
	_app.goto("profile_select")
	_screen().profile_cards()[0].pressed.emit()
	await wait_until(func() -> bool: return _app.current_scene_name() == "world_map", 2.0)
	assert_eq(_app.profile_id, id)

func test_select_profile_goes_to_world_map() -> void:
	var id: String = _progress.create_profile("avatar.kedi", "A", 3)
	_app.goto("profile_select")
	_screen().select(id)
	assert_eq(_app.current_scene_name(), "world_map")
	assert_eq(_app.profile_id, id)
	assert_eq(_app.active_grade, 3)

func test_locked_profile_goes_to_session_end() -> void:
	var id: String = _progress.create_profile("avatar.kedi", "A", 1)
	_lock_profile(id)
	_app.goto("profile_select")
	_screen().select(id)
	assert_eq(_app.current_scene_name(), "session_end")

func test_gear_goes_to_parent_gate_with_next() -> void:
	_progress.create_profile("avatar.kedi", "A", 1)
	_app.goto("profile_select")
	_screen().open_parent_gate()
	assert_eq(_app.current_scene_name(), "parent_gate")
	var next: Dictionary = _screen().args["next"]
	assert_eq(next["scene"], "parent_panel")

func test_goto_missing_scene_stays() -> void:
	_app.goto("profile_create")
	_app.scenes["ghost"] = "res://scenes/ui/ghost_yok.tscn"  # kasıtlı olarak var olmayan sahne
	_app.goto("ghost")
	assert_eq(_app.current_scene_name(), "profile_create")

func test_double_tap_on_select_navigates_once() -> void:
	var id: String = _progress.create_profile("avatar.kedi", "A", 3)
	_app.goto("profile_select")
	var sel: Node = _screen()
	sel.select(id)
	var first: Node = _screen()
	sel.select(id)
	assert_eq(_screen(), first, "ikinci dokunuş yok sayılır")

func test_double_tap_on_confirm_creates_one_profile() -> void:
	_app.goto("profile_create")
	var s: Node = _screen()
	s.pick_avatar("avatar.ayi")
	s.pick_grade(1)
	s.confirm()
	s.confirm()
	assert_eq(_progress.profiles().size(), 1)

func test_profile_cards_keep_their_size_with_big_avatar() -> void:
	_progress.create_profile("avatar.kedi", "A", 1)
	_app.goto("profile_select")
	await wait_process_frames(3)
	var card: Button = _screen().profile_cards()[0]
	var card_size: Vector2 = _screen().CARD_SIZE
	assert_almost_eq(card.size.y, card_size.y, 1.0, "kart ekran boyunca uzamaz")
	var avatar: Control = null
	for n: Node in card.find_children("*", "TextureRect", true, false):
		avatar = n as Control
	assert_not_null(avatar)
	assert_gte(avatar.size.x, 256.0, "avatar büyük")
	assert_eq(_screen().plus_card().size.y, card.size.y, "+ kartı da aynı boyda")
