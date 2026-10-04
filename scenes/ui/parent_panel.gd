extends Control
## Veli paneli (yetişkin ekranı): ilerleme, günlük sınır, ses, anahtarlar, sınıf,
## profil silme, bugünlük süreyi açma, günü sıfırlama, yedek dışa/içe aktarma ve sınıfa
## göre evde etkinlik önerileri. Spec §3.6, §4.8, §6.

const HomeActivities: GDScript = preload("res://scripts/core/home_activities.gd")

const LIMITS: Array[int] = [0, 10, 15, 20, 30]
const GRADES: Array[int] = [1, 2, 3]
const VOLUMES: Array[Array] = [
	["vol_voice", "parent.volume_voice"],
	["vol_music", "parent.volume_music"],
	["vol_sfx", "parent.volume_sfx"],
]
const TOGGLES: Array[Array] = [
	["show_text_g1", "parent.show_text_g1"],
	["reduce_motion", "parent.reduce_motion"],
]
const BG_COLOR: Color = ClayStyle.PAPER
const TEXT_COLOR: Color = ClayStyle.INK
## Profil sekmelerindeki avatar simgesinin boyu.
const TAB_AVATAR: int = 96
const MIN_TOUCH: float = 128.0
const BACKUP_PREFIX: String = "bilgi-adasi-yedek-"

var app: Node = AppState
var args: Dictionary = {}
## Yedek dosyasının yazılacağı klasör; testlerde değiştirilir.
var export_dir: String = ""
## Evde etkinlik önerileri dosyası; testlerde değiştirilebilir.
var home_activities_path: String = HomeActivities.DEFAULT_PATH

var _pid: String = ""
var _status: String = ""
var _content: VBoxContainer = null
var _status_label: Label = null
var _warning: Label = null
var _exit: Button = null
var _delete_dialog: ConfirmationDialog = null
var _import_dialog: FileDialog = null

func _ready() -> void:
	_pid = app.profile_id
	if _find_profile(_pid).is_empty():
		var list: Array[Dictionary] = app.progress.profiles()
		_pid = str(list[0]["id"]) if not list.is_empty() else ""
	_rebuild()

func enter(a: Dictionary) -> void:
	args = a

# --- Sorgular (testler ve arayüz) ---

## Yetişkin ekranı: çocuk altyazı balonu burada gösterilmez.
func subtitle_placement() -> String:
	return "hidden"

func exit_button() -> Button:
	return _exit

func delete_dialog() -> ConfirmationDialog:
	return _delete_dialog

func status_text() -> String:
	return _status

func warning_visible() -> bool:
	return _warning != null and _warning.visible

func selected_profile() -> String:
	return _pid

## Seçili profilin çıktı satırları: code, subject, text, mastery, last_played.
func outcome_rows() -> Array[Dictionary]:
	var rows: Array[Dictionary] = []
	var outs: Dictionary = _find_profile(_pid).get("outcomes", {})
	for code: String in outs:
		var o: Dictionary = outs[code]
		var info: Dictionary = app.content.outcome_info(code)
		var day: int = int(o.get("last_day", 0))
		rows.append({
			"code": code,
			"subject": str(info.get("subject", "")),
			"text": str(info.get("text", code)),
			"mastery": float(o.get("mastery", 0.0)),
			"last_played": _date_text(day) if day > 0 else Strings.t("parent.never"),
		})
	rows.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a["subject"]) + str(a["code"]) < str(b["subject"]) + str(b["code"]))
	return rows

## Seçili profilin sınıfına ait evde etkinlik önerileri: code, subject, outcome, text.
func home_activity_rows() -> Array[Dictionary]:
	var grade: int = int(_find_profile(_pid).get("grade", 0))
	var outcomes: Dictionary = {}
	var texts: Dictionary = HomeActivities.load_texts(home_activities_path)
	for code: String in texts:
		var info: Dictionary = app.content.outcome_info(code)
		if not info.is_empty():
			outcomes[code] = info
	return HomeActivities.rows_for_grade(texts, outcomes, grade)

# --- Eylemler ---

func select_profile_tab(id: String) -> void:
	_pid = id
	_rebuild()

func set_daily_limit(minutes: int) -> void:
	_settings()["daily_limit_min"] = minutes
	app.save.save()

func set_volume(key: String, value: float) -> void:
	_settings()[key] = value
	app.audio.apply_volumes(_settings())

## Kaydırıcı bırakılınca diske yazılır.
func commit_volumes() -> void:
	app.save.save()

func set_toggle(key: String, on: bool) -> void:
	_settings()[key] = on
	app.save.save()

func set_grade(grade: int) -> void:
	if _pid == "":
		return
	app.progress.set_grade(_pid, grade)
	if _pid == app.profile_id:
		app.active_grade = grade

func unlock_today() -> void:
	if _pid == "":
		return
	app.session_timer.parent_unlock_today()
	_set_status(Strings.t("parent.unlocked"))

## Saat ileri alınıp geri getirildiyse oyun gününü bugüne döndürür (bütün cihaz).
func reset_day() -> void:
	app.session_timer.reset_day()
	_set_status(Strings.t("parent.reset_day_done"))

func request_delete() -> void:
	if _pid == "":
		return
	_delete_dialog.dialog_text = Strings.t("parent.delete_confirm", {"name": _profile_name(_find_profile(_pid))})
	_delete_dialog.popup_centered()

## İkinci onaydan sonra çağrılır.
func confirm_delete() -> void:
	if _pid == "":
		return
	var id: String = _pid
	if id == app.profile_id:
		app.session_timer.stop()
		app.profile_id = ""
		app.active_grade = 0
	app.progress.delete_profile(id)
	if app.progress.profiles().is_empty():
		app.goto("profile_create")
	else:
		app.goto("profile_select")

## Yedeği user:// (OS.get_user_data_dir()) altına yazar; yolu döndürür ("" = hata).
func export_backup() -> String:
	var dir: String = export_dir if export_dir != "" else OS.get_user_data_dir()
	var path: String = dir.path_join("%s%s.json" % [BACKUP_PREFIX, _date_text(app.progress.clock.today())])
	var f: FileAccess = FileAccess.open(path, FileAccess.WRITE)
	if f == null:
		_set_status(Strings.t("parent.export_failed"))
		return ""
	f.store_string(ProgressExport.to_json(app.save.data))
	f.close()
	_set_status(Strings.t("parent.export_done", {"path": path}))
	return path

## Yedek metnini içe alır. Geçersizse mevcut kayıt değişmez ve false döner.
func import_text(text: String) -> bool:
	var result: Dictionary = ProgressExport.prepare_import(text)
	if str(result["error"]) != "":
		_set_status(Strings.t(str(result["error"])))
		return false
	app.save.data = result["data"]
	app.save.last_load_status = "loaded"
	app.save.save()
	app.audio.apply_volumes(_settings())
	if _find_profile(app.profile_id).is_empty():
		app.session_timer.stop()
		app.profile_id = ""
		app.active_grade = 0
	else:
		app.active_grade = int(_find_profile(app.profile_id)["grade"])
	_pid = app.profile_id
	if _pid == "" and not app.progress.profiles().is_empty():
		_pid = str(app.progress.profiles()[0]["id"])
	_status = Strings.t("parent.import_ok")
	_rebuild()
	return true

func _on_import_file(path: String) -> void:
	import_text(FileAccess.get_file_as_string(path))

# --- Yardımcılar ---

func _settings() -> Dictionary:
	return app.save.data["settings"]

func _find_profile(id: String) -> Dictionary:
	for p: Dictionary in app.progress.profiles():
		if str(p["id"]) == id:
			return p
	return {}

func _profile_name(p: Dictionary) -> String:
	var nick: String = str(p.get("nickname", ""))
	if nick != "":
		return nick
	return Strings.t("parent.profile_default", {"n": str(p.get("id", "")).trim_prefix("p")})

func _date_text(day: int) -> String:
	return Time.get_date_string_from_unix_time(day * 86400)

func _set_status(text: String) -> void:
	_status = text
	if _status_label != null:
		_status_label.text = text

# --- Arayüz ---

func _rebuild() -> void:
	for c: Node in get_children():
		remove_child(c)
		c.free()
	_delete_dialog = null
	var bg: ColorRect = ColorRect.new()
	bg.color = BG_COLOR
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(bg)

	var scroll: ScrollContainer = ScrollContainer.new()
	scroll.set_anchors_preset(Control.PRESET_FULL_RECT)
	scroll.offset_left = 48.0
	scroll.offset_right = -48.0
	scroll.offset_top = 24.0
	scroll.offset_bottom = -24.0
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	add_child(scroll)
	_content = VBoxContainer.new()
	_content.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_content.add_theme_constant_override("separation", 24)
	scroll.add_child(_content)

	_content.add_child(_label(Strings.t("parent.title"), 72))
	_warning = _label("", 40)
	_warning.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_warning.add_theme_color_override("font_color", ClayStyle.ALERT)
	var st: String = str(app.save.last_load_status)
	_warning.visible = st == "reset" or st == "recovered"
	if _warning.visible:
		_warning.text = Strings.t("parent.warning_%s" % st)
	_content.add_child(_warning)

	_build_profile_tabs()
	_build_progress()
	_build_limit()
	_build_volumes()
	_build_toggles()
	_build_grade()
	_build_home_activities()
	_build_actions()

	_exit = _button(Strings.t("parent.exit"))
	ClayStyle.style_button(_exit, ClayStyle.SKY)
	_exit.pressed.connect(func() -> void: app.goto("profile_select"))
	_content.add_child(_exit)

	_delete_dialog = ConfirmationDialog.new()
	_delete_dialog.title = Strings.t("parent.delete_profile")
	_delete_dialog.ok_button_text = Strings.t("parent.delete_ok")
	_delete_dialog.cancel_button_text = Strings.t("parent.cancel")
	_delete_dialog.confirmed.connect(confirm_delete)
	_delete_dialog.get_ok_button().custom_minimum_size = Vector2(MIN_TOUCH, MIN_TOUCH)
	_delete_dialog.get_cancel_button().custom_minimum_size = Vector2(MIN_TOUCH, MIN_TOUCH)
	add_child(_delete_dialog)

	_import_dialog = FileDialog.new()
	_import_dialog.title = Strings.t("parent.import")
	_import_dialog.access = FileDialog.ACCESS_FILESYSTEM
	_import_dialog.file_mode = FileDialog.FILE_MODE_OPEN_FILE
	_import_dialog.filters = PackedStringArray(["*.json"])
	_import_dialog.use_native_dialog = false
	_import_dialog.get_ok_button().custom_minimum_size = Vector2(MIN_TOUCH, MIN_TOUCH)
	_import_dialog.get_cancel_button().custom_minimum_size = Vector2(MIN_TOUCH, MIN_TOUCH)
	_import_dialog.file_selected.connect(_on_import_file.call_deferred)
	add_child(_import_dialog)

func _build_profile_tabs() -> void:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 16)
	var group: ButtonGroup = ButtonGroup.new()
	for p: Dictionary in app.progress.profiles():
		var id: String = str(p["id"])
		var b: Button = _button(_profile_name(p))
		b.toggle_mode = true
		b.button_pressed = id == _pid
		ClayStyle.make_choice(b, false)
		b.icon = AssetRegistry.texture(str(p.get("avatar", "")))
		b.add_theme_constant_override("icon_max_width", TAB_AVATAR)
		b.pressed.connect(select_profile_tab.call_deferred.bind(id))
		b.button_group = group
		row.add_child(b)
	_content.add_child(row)

func _build_progress() -> void:
	_content.add_child(_label(Strings.t("parent.progress"), 56))
	var rows: Array[Dictionary] = outcome_rows()
	if rows.is_empty():
		_content.add_child(_label(Strings.t("parent.no_progress"), 36))
		return
	var last_subject: String = "-"
	for r: Dictionary in rows:
		var subject: String = str(r["subject"])
		if subject != last_subject:
			last_subject = subject
			var key: String = "subject.%s" % subject
			_content.add_child(_label(Strings.t(key) if subject != "" and Strings.has(key) else Strings.t("parent.subject_other"), 48))
		var l: Label = _label("%s  (%s)" % [str(r["text"]), str(r["code"])], 32)
		l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		_content.add_child(l)
		var line: HBoxContainer = HBoxContainer.new()
		line.add_theme_constant_override("separation", 24)
		var bar: ProgressBar = ProgressBar.new()
		bar.min_value = 0.0
		bar.max_value = 1.0
		bar.value = float(r["mastery"])
		bar.show_percentage = false
		bar.custom_minimum_size = Vector2(640, 40)
		line.add_child(bar)
		line.add_child(_label(Strings.t("parent.mastery", {"pct": int(round(float(r["mastery"]) * 100.0))}), 32))
		line.add_child(_label(Strings.t("parent.last_played", {"date": str(r["last_played"])}), 32))
		_content.add_child(line)

func _build_limit() -> void:
	_content.add_child(_label(Strings.t("parent.daily_limit"), 56))
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 16)
	var current: int = int(_settings().get("daily_limit_min", 0))
	var group: ButtonGroup = ButtonGroup.new()
	for m: int in LIMITS:
		var b: Button = _button(Strings.t("parent.limit_off") if m == 0 else Strings.t("parent.limit_min", {"n": m}))
		b.toggle_mode = true
		b.button_pressed = m == current
		ClayStyle.make_choice(b)
		b.button_group = group
		b.pressed.connect(set_daily_limit.bind(m))
		row.add_child(b)
	_content.add_child(row)

func _build_volumes() -> void:
	for v: Array in VOLUMES:
		var key: String = str(v[0])
		_content.add_child(_label(Strings.t(str(v[1])), 40))
		var s: HSlider = HSlider.new()
		s.min_value = 0.0
		s.max_value = 1.0
		s.step = 0.05
		s.value = float(_settings().get(key, 1.0))
		s.custom_minimum_size = Vector2(900, MIN_TOUCH)
		s.value_changed.connect(func(val: float) -> void: set_volume(key, val))
		s.drag_ended.connect(func(_changed: bool) -> void: commit_volumes())
		_content.add_child(s)

func _build_toggles() -> void:
	for t: Array in TOGGLES:
		var key: String = str(t[0])
		var c: CheckButton = CheckButton.new()
		c.text = Strings.t(str(t[1]))
		c.add_theme_font_size_override("font_size", 40)
		c.custom_minimum_size = Vector2(0, MIN_TOUCH)
		c.button_pressed = bool(_settings().get(key, false))
		c.toggled.connect(func(on: bool) -> void: set_toggle(key, on))
		_content.add_child(c)

func _build_grade() -> void:
	_content.add_child(_label(Strings.t("parent.grade"), 56))
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 16)
	var current: int = int(_find_profile(_pid).get("grade", 0))
	var group: ButtonGroup = ButtonGroup.new()
	for g: int in GRADES:
		var b: Button = _button(Strings.t("parent.grade_n", {"n": g}))
		b.toggle_mode = true
		b.button_pressed = g == current
		ClayStyle.make_choice(b)
		b.button_group = group
		b.pressed.connect(set_grade.bind(g))
		row.add_child(b)
	_content.add_child(row)

func _build_home_activities() -> void:
	_content.add_child(_label(Strings.t("parent.home_activities"), 56))
	var hint: Label = _label(Strings.t("parent.home_activities_hint"), 32)
	hint.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_content.add_child(hint)
	var rows: Array[Dictionary] = home_activity_rows()
	if rows.is_empty():
		_content.add_child(_label(Strings.t("parent.home_activities_none"), 32))
		return
	var last_subject: String = "-"
	for r: Dictionary in rows:
		var subject: String = str(r["subject"])
		if subject != last_subject:
			last_subject = subject
			var key: String = "subject.%s" % subject
			_content.add_child(_label(Strings.t(key) if Strings.has(key) else Strings.t("parent.subject_other"), 44))
		var title: Label = _label("%s  (%s)" % [str(r["outcome"]), str(r["code"])], 32)
		title.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		title.add_theme_color_override("font_color", ClayStyle.INK_SOFT)
		_content.add_child(title)
		var body: Label = _label(str(r["text"]), 34)
		body.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		_content.add_child(body)

func _build_actions() -> void:
	var unlock: Button = _button(Strings.t("parent.unlock_today"))
	unlock.pressed.connect(unlock_today)
	_content.add_child(unlock)
	var reset_hint: Label = _label(Strings.t("parent.reset_day_hint"), 32)
	reset_hint.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_content.add_child(reset_hint)
	var reset: Button = _button(Strings.t("parent.reset_day"))
	reset.pressed.connect(reset_day)
	_content.add_child(reset)
	var export_b: Button = _button(Strings.t("parent.export"))
	export_b.pressed.connect(export_backup)
	_content.add_child(export_b)
	var import_b: Button = _button(Strings.t("parent.import"))
	import_b.pressed.connect(func() -> void: _import_dialog.popup_centered_ratio(0.8))
	_content.add_child(import_b)
	_status_label = _label(_status, 32)
	_status_label.autowrap_mode = TextServer.AUTOWRAP_ARBITRARY
	_content.add_child(_status_label)
	var del: Button = _button(Strings.t("parent.delete_profile"))
	ClayStyle.style_button(del, ClayStyle.ROSE)
	del.pressed.connect(request_delete)
	_content.add_child(del)

func _label(text: String, font_size: int) -> Label:
	var l: Label = Label.new()
	l.text = text
	l.add_theme_font_size_override("font_size", font_size)
	l.add_theme_color_override("font_color", TEXT_COLOR)
	return l

func _button(text: String) -> Button:
	var b: Button = Button.new()
	b.text = text
	b.custom_minimum_size = Vector2(MIN_TOUCH, MIN_TOUCH)
	b.focus_mode = Control.FOCUS_NONE
	b.add_theme_font_size_override("font_size", 40)
	return b
