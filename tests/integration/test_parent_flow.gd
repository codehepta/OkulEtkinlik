extends GutTest
## Veli akışı: kapı, panel (sınır, ses, anahtarlar, silme, yedek) ve oturum sonu.

const FakeServices: GDScript = preload("res://tests/helpers/fake_services.gd")
const ROOT: String = "res://tests/fixtures/lesson"
const SAVE_DIR: String = "user://parent_flow_test"
const EXPORT_DIR: String = "user://parent_flow_export"

var _fake: Node = null
var _save: Node = null
var _db: Node = null
var _progress: Node = null
var _timer: Node = null
var _app: Node = null
var _root: Node = null

func before_each() -> void:
	DirAccess.make_dir_recursive_absolute(SAVE_DIR)
	DirAccess.make_dir_recursive_absolute(EXPORT_DIR)
	_fake = FakeServices.new()
	add_child_autofree(_fake)
	_save = load("res://autoload/save_service.gd").new()
	_save.set_base_dir(SAVE_DIR)
	_save.load_or_create()
	_db = load("res://autoload/content_db.gd").new()
	_db.outcomes_path = "res://tests/fixtures/outcomes.json"
	_db.has_string = func(_k: String) -> bool: return true
	_db.has_voice = func(_k: String) -> bool: return true
	_db.load_all(ROOT)
	_progress = load("res://autoload/progress.gd").new()
	_progress.save = _save
	_progress.content = _db
	_progress.clock.fixed_day = 20000
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
	_app.content = _db
	_app.scene_root = _root
	_app.anim_scale = 0.0

func after_each() -> void:
	for dir: String in [SAVE_DIR, EXPORT_DIR]:
		for f: String in DirAccess.get_files_at(dir):
			DirAccess.remove_absolute(dir.path_join(f))
	_app.free()
	_progress.free()
	_db.free()
	_save.free()

func _screen() -> Node:
	return _app.current_scene()

func _login(grade: int) -> String:
	var id: String = _progress.create_profile("avatar.kedi", "T", grade)
	_app.select_profile(id)
	return id

func _open_panel() -> Node:
	_app.goto("parent_panel")
	var panel: Node = _screen()
	panel.export_dir = EXPORT_DIR
	return panel

func _type(gate: Node, text: String) -> void:
	for ch: String in text:
		gate.press_digit(int(ch))

# --- Kapı ---

func test_gate_says_call_adult_and_shows_question() -> void:
	_app.goto("parent_gate", {"next": {"scene": "parent_panel", "args": {}}})
	assert_true(_fake.said.has("vo.genel.veli_cagir"))
	assert_ne(str(_screen().question()["text"]), "")

func test_gate_correct_answer_goes_to_next() -> void:
	_app.goto("parent_gate", {"next": {"scene": "parent_panel", "args": {}}})
	_screen().set_question(ParentGateQuiz.make(12, 5))
	_type(_screen(), "60")
	assert_eq(_screen().typed(), "60")
	_screen().submit()
	assert_eq(_app.current_scene_name(), "parent_panel")

func test_gate_wrong_answer_new_question_same_scene() -> void:
	_app.goto("parent_gate", {"next": {"scene": "parent_panel", "args": {}}})
	var gate: Node = _screen()
	gate.set_question(ParentGateQuiz.make(12, 5))
	var before: int = gate.question_count()
	_type(gate, "61")
	gate.submit()
	assert_eq(_app.current_scene_name(), "parent_gate")
	assert_eq(gate.question_count(), before + 1)
	assert_eq(gate.typed(), "")

func test_gate_backspace_and_back() -> void:
	_app.goto("parent_gate", {"next": {"scene": "parent_panel", "args": {}}})
	_type(_screen(), "12")
	_screen().backspace()
	assert_eq(_screen().typed(), "1")
	assert_true(_screen().digit_button(7).custom_minimum_size.x >= 128.0)
	_screen().back_button().pressed.emit()
	assert_eq(_app.current_scene_name(), "profile_select")

# --- Panel ---

func test_panel_limit_change_saved() -> void:
	_login(1)
	var panel: Node = _open_panel()
	panel.set_daily_limit(20)
	assert_eq(_save.data["settings"]["daily_limit_min"], 20)
	var on_disk: Variant = JSON.parse_string(FileAccess.get_file_as_string(SAVE_DIR + "/save_v1.json"))
	assert_eq(int((on_disk as Dictionary)["settings"]["daily_limit_min"]), 20)

func test_panel_volume_applied_live_and_saved() -> void:
	_login(1)
	var panel: Node = _open_panel()
	panel.set_volume("vol_music", 0.25)
	assert_almost_eq(float(_save.data["settings"]["vol_music"]), 0.25, 0.0001)
	assert_almost_eq(float(_fake.volumes.back()["vol_music"]), 0.25, 0.0001)

func test_panel_toggles_saved() -> void:
	_login(1)
	var panel: Node = _open_panel()
	panel.set_toggle("show_text_g1", true)
	panel.set_toggle("reduce_motion", true)
	assert_true(_save.data["settings"]["show_text_g1"])
	assert_true(_app.reduce_motion())

func test_panel_grade_change() -> void:
	var id: String = _login(1)
	var panel: Node = _open_panel()
	panel.set_grade(3)
	assert_eq(_app.current_grade(), 3)
	assert_not_null(id)

func test_panel_unlock_today() -> void:
	var id: String = _login(1)
	_save.data["settings"]["daily_limit_min"] = 10
	_save.data["profiles"][0]["usage"]["seconds"] = 9999
	_save.data["profiles"][0]["usage"]["day"] = _timer._effective_day()
	assert_true(_timer.is_locked(id))
	var panel: Node = _open_panel()
	panel.unlock_today()
	assert_false(_timer.is_locked(id))

func test_panel_delete_needs_confirmation_then_goes_to_select() -> void:
	var a: String = _login(1)
	var b: String = _progress.create_profile("avatar.kedi", "U", 1)
	var panel: Node = _open_panel()
	panel.select_profile_tab(b)
	panel.request_delete()
	assert_eq(_progress.profiles().size(), 2, "onaydan önce silinmez")
	assert_true(panel.delete_dialog().visible, "onay kutusu açılmalı")
	panel.confirm_delete()
	assert_eq(_progress.profiles().size(), 1)
	assert_eq(_app.current_scene_name(), "profile_select")
	assert_eq(str(_progress.profiles()[0]["id"]), a)

func test_panel_delete_last_profile_goes_to_create() -> void:
	_login(1)
	var panel: Node = _open_panel()
	panel.request_delete()
	panel.confirm_delete()
	assert_eq(_progress.profiles().size(), 0)
	assert_eq(_app.current_scene_name(), "profile_create")

func test_panel_exit_goes_to_profile_select() -> void:
	_login(1)
	var panel: Node = _open_panel()
	panel.exit_button().pressed.emit()
	assert_eq(_app.current_scene_name(), "profile_select")

func test_panel_outcome_rows_show_mastery_and_last_day() -> void:
	var id: String = _login(1)
	_save.data["profiles"][0]["outcomes"]["TEST.1"] = {"mastery": 0.5, "box": 2, "due": 3, "last_day": 20000}
	var panel: Node = _open_panel()
	var rows: Array[Dictionary] = panel.outcome_rows()
	assert_eq(rows.size(), 1)
	assert_eq(rows[0]["code"], "TEST.1")
	assert_almost_eq(float(rows[0]["mastery"]), 0.5, 0.0001)
	assert_ne(str(rows[0]["last_played"]), "")
	assert_ne(str(rows[0]["text"]), "")
	assert_not_null(id)

func test_panel_load_warning_visibility() -> void:
	_login(1)
	_save.last_load_status = "loaded"
	assert_false(_open_panel().warning_visible())
	_save.last_load_status = "reset"
	assert_true(_open_panel().warning_visible())
	_save.last_load_status = "recovered"
	assert_true(_open_panel().warning_visible())

# --- Yedek ---

func test_export_writes_file_with_day_and_shows_path() -> void:
	_login(1)
	var panel: Node = _open_panel()
	var path: String = panel.export_backup()
	assert_true(path.begins_with(EXPORT_DIR))
	assert_true(path.get_file().begins_with("bilgi-adasi-yedek-"))
	assert_true(path.ends_with(".json"))
	assert_true(FileAccess.file_exists(path))
	assert_true(ProgressExport.from_json(FileAccess.get_file_as_string(path)).has("profiles"))
	assert_true(panel.status_text().contains(path.get_file()))

func test_import_invalid_keeps_current_save() -> void:
	_login(1)
	var before: Dictionary = _save.data.duplicate(true)
	var panel: Node = _open_panel()
	assert_false(panel.import_text("{bozuk"))
	assert_eq(_save.data, before)
	assert_ne(panel.status_text(), "")
	assert_false(panel.import_text(""))
	assert_eq(_save.data, before)

func test_import_valid_replaces_save_and_persists() -> void:
	_login(1)
	var other: Dictionary = SaveSchema.new_save()
	other["profiles"].append(SaveSchema.new_profile("p7", "avatar.kedi", "Z", 2))
	var panel: Node = _open_panel()
	assert_true(panel.import_text(ProgressExport.to_json(other)))
	assert_eq(str(_save.data["profiles"][0]["id"]), "p7")
	var on_disk: Variant = JSON.parse_string(FileAccess.get_file_as_string(SAVE_DIR + "/save_v1.json"))
	assert_eq(str((on_disk as Dictionary)["profiles"][0]["id"]), "p7")

# --- Oturum sonu ---

func test_session_end_button_goes_to_gate_with_panel_next() -> void:
	_login(1)
	_app.goto("session_end")
	assert_true(_fake.said.has("vo.genel.uyku_zamani"))
	_screen().parent_button().pressed.emit()
	assert_eq(_app.current_scene_name(), "parent_gate")
	assert_eq(_screen().args["next"]["scene"], "parent_panel")

func test_session_end_has_replay_voice_button() -> void:
	_login(1)
	_app.goto("session_end")
	var btn: Button = _screen().find_child("ReplayVoiceButton", true, false) as Button
	assert_not_null(btn, "yönerge tekrar dinlenebilir olmalı")
	if btn == null:
		return
	assert_gte(btn.custom_minimum_size.x, 128.0)
	var before: int = _fake.replays
	btn.pressed.emit()
	assert_eq(_fake.replays, before + 1, "uygulamanın anlatıcısına gider")

func test_session_end_big_sleepy_bilge_and_call_grownup_button() -> void:
	_login(1)
	_app.goto("session_end")
	var bilge: Control = _screen().bilge_view()
	assert_eq(str(bilge.get("key")), "char.bilge.sleepy")
	assert_gte(bilge.custom_minimum_size.y, 420.0, "uykulu Bilge büyük olmalı")
	var btn: Button = _screen().parent_button()
	var label: Label = btn.find_child("CallLabel", true, false) as Label
	assert_not_null(label, "düğmede metin olmalı")
	if label != null:
		assert_eq(label.text, Strings.t("session_end.call_grownup"))
	assert_not_null(btn.find_child("CallIcon", true, false), "düğmede simge olmalı")
	assert_gte(btn.custom_minimum_size.y, 128.0)
	assert_not_null(_screen().find_child("NightBackdrop", true, false), "gece zemini")

func test_session_end_not_redirected_when_locked() -> void:
	var id: String = _login(1)
	_save.data["settings"]["daily_limit_min"] = 10
	_save.data["profiles"][0]["usage"]["seconds"] = 9999
	_save.data["profiles"][0]["usage"]["day"] = _timer._effective_day()
	assert_true(_timer.is_locked(id))
	_app.goto("session_end")
	_screen().parent_button().pressed.emit()
	assert_eq(_app.current_scene_name(), "parent_gate")

func _import_rejected(payload: Variant) -> void:
	_login(1)
	var before: Dictionary = _save.data.duplicate(true)
	var panel: Node = _open_panel()
	assert_false(panel.import_text(payload if payload is String else JSON.stringify(payload)))
	assert_eq(_save.data, before)
	assert_ne(panel.status_text(), "")

func _good_profile(id: String = "p1") -> Dictionary:
	return SaveSchema.new_profile(id, "avatar.kedi", "Z", 1)

func test_import_future_version_rejected() -> void:
	_import_rejected({"schema_version": 99, "profiles": []})

func test_import_wrong_field_types_rejected() -> void:
	var p: Dictionary = _good_profile()
	p["usage"] = 5
	_import_rejected({"schema_version": 1, "profiles": [p]})
	var q: Dictionary = _good_profile()
	q["outcomes"] = "x"
	_import_rejected({"schema_version": 1, "profiles": [q]})

func test_import_empty_or_duplicate_ids_rejected() -> void:
	_import_rejected({"schema_version": 1, "profiles": [_good_profile("")]})
	_import_rejected({"schema_version": 1, "profiles": [_good_profile("p1"), _good_profile("p1")]})

func test_import_bad_grade_or_nondict_profile_rejected() -> void:
	var p: Dictionary = _good_profile()
	p["grade"] = 7
	_import_rejected({"schema_version": 1, "profiles": [p]})
	_import_rejected({"schema_version": 1, "profiles": [3]})

func test_import_more_than_four_profiles_rejected() -> void:
	var list: Array = []
	for i: int in 5:
		list.append(_good_profile("p%d" % (i + 1)))
	_import_rejected({"schema_version": 1, "profiles": list})

func test_import_success_clears_warning_and_refreshes_grade() -> void:
	var id: String = _login(1)
	_save.last_load_status = "reset"
	var other: Dictionary = SaveSchema.new_save()
	other["profiles"].append(SaveSchema.new_profile(id, "avatar.kedi", "Z", 3))
	var panel: Node = _open_panel()
	assert_true(panel.warning_visible())
	assert_true(panel.import_text(ProgressExport.to_json(other)))
	assert_false(_screen().warning_visible())
	assert_eq(_app.active_grade, 3)

func test_gate_leaves_bottom_band_for_subtitle() -> void:
	_app.goto("parent_gate", {"next": {"scene": "parent_panel", "args": {}}})
	await wait_frames(3)
	var gate: Node = _screen()
	assert_eq(gate.subtitle_placement(), "bottom")
	var vp: Vector2 = (gate as Control).get_viewport_rect().size
	for b: Node in (gate as Control).find_children("*", "Button", true, false):
		var r: Rect2 = (b as Control).get_global_rect()
		assert_lte(r.end.y, vp.y - ClayStyle.SUBTITLE_BAND + 1.0, "düğme altyazı şeridine girmez")

func test_panel_hides_subtitle_and_marks_selection() -> void:
	_login(1)
	var panel: Node = _open_panel()
	assert_eq(panel.subtitle_placement(), "hidden")
	panel.set_daily_limit(15)
	panel.call("_rebuild")
	var checked: int = 0
	for n: Node in (panel as Control).find_children("*", "Button", true, false):
		var b: Button = n as Button
		if b.toggle_mode and b.button_pressed and b.icon == AssetRegistry.texture(ClayStyle.CHECK_ICON_KEY):
			checked += 1
	assert_eq(checked, 2, "seçili süre ve seçili sınıf onay ikonu taşır")
