extends Control
## Veli paneli (yetişkin ekranı). Üstte sabit şerit (başlık plaketi, çocuk seçici ya da
## "ortak" notu, her zaman görünen Çıkış), solda beş bölüm menüsü, sağda yalnızca etkin
## bölüm: İlerleme · Evde (çocuğa özel) · Süre · Ses ve ekran (cihaz geneli) · Profil ve
## yedek. Sayfa kaymaz; yalnızca uzun listeler kendi kartı içinde kayar. Spec §3.6, §4.8, §6.

const HomeActivities: GDScript = preload("res://scripts/core/home_activities.gd")
const ParentSummary: GDScript = preload("res://scripts/core/parent_summary.gd")

## Bölüm kimlikleri (menü sırası) ve başlık anahtarları.
const TABS: Array[Array] = [
	["progress", "parent.tab_progress"],
	["home", "parent.tab_home"],
	["time", "parent.tab_time"],
	["sound", "parent.tab_sound"],
	["profile", "parent.tab_profile"],
]
## Bütün çocuklar için ortak (cihaz geneli) bölümler: çocuk seçici gizlenir.
const SHARED_TABS: Array[String] = ["time", "sound"]
const DEFAULT_TAB: String = "progress"
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
const TEXT_COLOR: Color = ClayStyle.INK
const SOFT_COLOR: Color = ClayStyle.INK_SOFT
const CARD_COLOR: Color = ClayStyle.IVORY
## Yazı ölçeği: başlık, gövde, küçük.
const FONT_TITLE: int = 56
const FONT_BODY: int = 40
const FONT_SMALL: int = 32
const MIN_TOUCH: float = 128.0
## Yerleşim (1920×1080 tabanı).
const MARGIN_X: int = 32
const MARGIN_Y: int = 24
const TOP_BAR_H: float = 136.0
const MENU_W: float = 380.0
const GAP: int = 24
## Çocuk sekmesi: avatar boyu ve en geniş sekme. 4 profil de üst şeride sığar.
const TAB_AVATAR: int = 80
const TAB_MAX_W: float = 300.0
const TAB_ROW_W: float = 1120.0
const EXIT_W: float = 220.0
const VOLUME_LABEL_W: float = 360.0
const SLIDER_W: float = 1000.0
const BAR_W: float = 360.0
const DELETE_MSG_W: float = 900.0
const BACKUP_PREFIX: String = "bilgi-adasi-yedek-"

var app: Node = AppState
var args: Dictionary = {}
## Yedek dosyasının yazılacağı klasör; testlerde değiştirilir.
var export_dir: String = ""
## Evde etkinlik önerileri dosyası; testlerde değiştirilebilir.
var home_activities_path: String = HomeActivities.DEFAULT_PATH

var _pid: String = ""
## Etkin bölüm ve seçili ders: çocuk değişince ve içe aktarmadan sonra korunur, diske yazılmaz.
var _tab: String = DEFAULT_TAB
var _subject: String = ""
var _status: String = ""
## Son işlem mesajının ait olduğu bölüm ("time" | "profile").
var _status_tab: String = ""
var _status_label: Label = null
var _usage_label: Label = null
var _unlock: Button = null
var _warning_strip: PanelContainer = null
var _child_selector: Control = null
var _shared_note: Control = null
var _exit: Button = null
var _delete_card: Control = null
var _delete_message: Label = null
var _delete_cancel: Button = null
var _delete_confirm: Button = null
var _import_dialog: FileDialog = null

func _ready() -> void:
	_pid = app.profile_id
	if _find_profile(_pid).is_empty():
		var list: Array[Dictionary] = app.progress.profiles()
		_pid = str(list[0]["id"]) if not list.is_empty() else ""
	_rebuild()

## AppState.goto bunu _ready'den sonra çağırır: {"tab": "time"} Süre bölümünü açar.
func enter(a: Dictionary) -> void:
	args = a
	if a.has("tab"):
		select_tab(str(a["tab"]))

# --- Sorgular (testler ve arayüz) ---

## Yetişkin ekranı: çocuk altyazı balonu burada gösterilmez.
func subtitle_placement() -> String:
	return "hidden"

func exit_button() -> Button:
	return _exit

## Silme onayı kartı (kil kart katmanı; Godot penceresi değil).
func delete_dialog() -> Control:
	return _delete_card

func delete_cancel_button() -> Button:
	return _delete_cancel

func delete_confirm_button() -> Button:
	return _delete_confirm

func status_text() -> String:
	return _status

func warning_visible() -> bool:
	return _warning_strip != null and _warning_strip.visible

## "Bugünlük süreyi aç" düğmesi (Süre bölümü kurulmadıysa null).
func unlock_button() -> Button:
	return _unlock

## Sekmede görünen ad: takma ad; yoksa Kim oynuyor ekranındaki gibi avatarın adı.
func profile_label(id: String) -> String:
	return _profile_name(_find_profile(id))

func selected_profile() -> String:
	return _pid

func current_tab() -> String:
	return _tab

## Etkin bölümde gösterilen ders (seçili ders bu çocuğun sınıfında yoksa ilk ders).
func current_subject() -> String:
	return _effective_subject(_subjects_for(_tab))

func child_selector_visible() -> bool:
	return _child_selector != null and _child_selector.is_visible_in_tree()

func shared_note_visible() -> bool:
	return _shared_note != null and _shared_note.is_visible_in_tree()

## Süre bölümündeki "Bugün n dk oynandı" satırı.
func usage_text() -> String:
	var u: Dictionary = ParentSummary.usage(int(_settings().get("daily_limit_min", 0)),
		app.session_timer.used_seconds(), app.session_timer.unlocked_today())
	return Strings.t("parent.usage_%s" % str(u["state"]), {"played": u["played_min"], "left": u["left_min"]})

## Seçili profilin çıktı satırları: code, subject, text, mastery, last_day, last_played.
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
			"last_day": day,
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

func select_tab(id: String) -> void:
	for t: Array in TABS:
		if str(t[0]) == id:
			_tab = id
			_rebuild()
			return
	push_warning("Veli paneli: bilinmeyen bölüm: %s" % id)

func select_subject(subject: String) -> void:
	_subject = subject
	_rebuild()

func select_profile_tab(id: String) -> void:
	_pid = id
	_rebuild()

func set_daily_limit(minutes: int) -> void:
	_settings()["daily_limit_min"] = minutes
	app.save.save()
	_refresh_usage()

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
	_set_status(Strings.t("parent.unlocked"), "time")
	_refresh_usage()

## Saat ileri alınıp geri getirildiyse oyun gününü bugüne döndürür (bütün cihaz).
func reset_day() -> void:
	app.session_timer.reset_day()
	_set_status(Strings.t("parent.reset_day_done"), "time")
	_refresh_usage()

## Silme onay kartını açar; silme yalnızca "Sil" ile olur.
func request_delete() -> void:
	if _pid == "":
		return
	_delete_message.text = Strings.t("parent.delete_confirm", {"name": _profile_name(_find_profile(_pid))})
	_delete_card.visible = true

func cancel_delete() -> void:
	_delete_card.visible = false

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
		_set_status(Strings.t("parent.export_failed"), "profile")
		return ""
	f.store_string(ProgressExport.to_json(app.save.data))
	f.close()
	_set_status(Strings.t("parent.export_done", {"path": path}), "profile")
	return path

## Yedek metnini içe alır. Geçersizse mevcut kayıt değişmez ve false döner.
func import_text(text: String) -> bool:
	var result: Dictionary = ProgressExport.prepare_import(text)
	if str(result["error"]) != "":
		_set_status(Strings.t(str(result["error"])), "profile")
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
	_status_tab = "profile"
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
	var avatar_key: String = "label." + str(p.get("avatar", ""))
	if Strings.has(avatar_key):
		return Strings.t(avatar_key)
	return Strings.t("parent.profile_default", {"n": str(p.get("id", "")).trim_prefix("p")})

func _date_text(day: int) -> String:
	return Time.get_date_string_from_unix_time(day * 86400)

func _set_status(text: String, tab: String) -> void:
	_status = text
	_status_tab = tab
	if _status_label != null and _tab == tab:
		_status_label.text = text

func _refresh_usage() -> void:
	if _usage_label != null:
		_usage_label.text = usage_text()
	# Sınır yokken açılacak bir süre de yok: düğme yalnız sınır seçiliyken görünür.
	if _unlock != null:
		_unlock.visible = int(_settings().get("daily_limit_min", 0)) > 0

func _grade() -> int:
	return int(_find_profile(_pid).get("grade", 0))

func _subject_name(subject: String) -> String:
	var key: String = "subject.%s" % subject
	return Strings.t(key) if subject != "" and Strings.has(key) else Strings.t("parent.subject_other")

## Bölümün ders düğmeleri: İlerleme'de eski sınıftan oynanmış dersler de eklenir.
func _subjects_for(tab: String) -> PackedStringArray:
	var base: PackedStringArray = app.content.subjects_for_grade(_grade())
	if tab == "progress":
		return ParentSummary.subjects(base, outcome_rows())
	return base

func _effective_subject(list: PackedStringArray) -> String:
	if list.has(_subject):
		return _subject
	return list[0] if not list.is_empty() else ""

# --- Arayüz: iskelet ---

func _rebuild() -> void:
	for c: Node in get_children():
		remove_child(c)
		c.free()
	_status_label = null
	_usage_label = null
	_unlock = null
	_child_selector = null
	_shared_note = null

	var bg: TextureRect = TextureRect.new()
	bg.name = "Backdrop"
	bg.texture = ClayStyle.vertical_gradient(ClayStyle.WARM_TOP, ClayStyle.WARM_BOTTOM)
	bg.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	bg.stretch_mode = TextureRect.STRETCH_SCALE
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(bg)

	var margin: MarginContainer = MarginContainer.new()
	margin.set_anchors_preset(Control.PRESET_FULL_RECT)
	for side: String in ["left", "right"]:
		margin.add_theme_constant_override("margin_" + side, MARGIN_X)
	for side: String in ["top", "bottom"]:
		margin.add_theme_constant_override("margin_" + side, MARGIN_Y)
	add_child(margin)
	var page: VBoxContainer = VBoxContainer.new()
	page.add_theme_constant_override("separation", 16)
	margin.add_child(page)

	page.add_child(_build_top_bar())
	page.add_child(_build_warning())

	var body: HBoxContainer = HBoxContainer.new()
	body.name = "Body"
	body.size_flags_vertical = Control.SIZE_EXPAND_FILL
	body.add_theme_constant_override("separation", GAP)
	page.add_child(body)
	body.add_child(_build_menu())
	var content: VBoxContainer = VBoxContainer.new()
	content.name = "SectionContent"
	content.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	content.size_flags_vertical = Control.SIZE_EXPAND_FILL
	content.add_theme_constant_override("separation", 20)
	body.add_child(content)
	match _tab:
		"home":
			_build_home(content)
		"time":
			_build_time(content)
		"sound":
			_build_sound(content)
		"profile":
			_build_profile(content)
		_:
			_build_progress(content)

	_build_delete_card()

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

## Sabit üst şerit: başlık plaketi · çocuk seçici ya da ortak notu · Çıkış.
func _build_top_bar() -> Control:
	var bar: HBoxContainer = HBoxContainer.new()
	bar.name = "TopBar"
	bar.custom_minimum_size = Vector2(0, TOP_BAR_H)
	bar.add_theme_constant_override("separation", GAP)

	var plaque: PanelContainer = PanelContainer.new()
	plaque.name = "TitlePlaque"
	plaque.add_theme_stylebox_override("panel", ClayStyle.plaque_box(ClayStyle.BUTTER, ClayStyle.CARAMEL, 40, 8, 6, 12, 40.0, 4.0))
	plaque.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	plaque.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var title: Label = _label(Strings.t("parent.title"), FONT_TITLE)
	title.add_theme_color_override("font_color", ClayStyle.TITLE_INK)
	ClayStyle.use_bold(title)
	plaque.add_child(title)
	bar.add_child(plaque)

	var middle: HBoxContainer = HBoxContainer.new()
	middle.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	middle.alignment = BoxContainer.ALIGNMENT_CENTER
	bar.add_child(middle)
	if SHARED_TABS.has(_tab):
		middle.add_child(_build_shared_note())
	else:
		middle.add_child(_build_child_selector())

	_exit = _button(Strings.t("parent.exit"))
	_exit.name = "ExitButton"
	ClayStyle.style_button(_exit, ClayStyle.SKY)
	_exit.custom_minimum_size = Vector2(EXIT_W, MIN_TOUCH)
	_exit.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_exit.pressed.connect(func() -> void: app.goto("profile_select"))
	bar.add_child(_exit)
	return bar

func _build_child_selector() -> Control:
	var row: HBoxContainer = HBoxContainer.new()
	row.name = "ChildSelector"
	row.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_theme_constant_override("separation", 12)
	var list: Array[Dictionary] = app.progress.profiles()
	var w: float = minf(TAB_MAX_W, (TAB_ROW_W - 12.0 * maxf(0.0, list.size() - 1.0)) / maxf(1.0, list.size()))
	var group: ButtonGroup = ButtonGroup.new()
	for p: Dictionary in list:
		var id: String = str(p["id"])
		var b: Button = _button(_profile_name(p))
		b.add_theme_font_size_override("font_size", FONT_SMALL)
		b.custom_minimum_size = Vector2(w, MIN_TOUCH)
		b.clip_text = true
		b.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		b.toggle_mode = true
		b.button_pressed = id == _pid
		ClayStyle.make_choice(b, false)
		b.icon = AssetRegistry.texture(str(p.get("avatar", "")))
		b.add_theme_constant_override("icon_max_width", TAB_AVATAR)
		b.pressed.connect(select_profile_tab.call_deferred.bind(id))
		b.button_group = group
		row.add_child(b)
	_child_selector = row
	return row

func _build_shared_note() -> Control:
	var note: PanelContainer = PanelContainer.new()
	note.name = "SharedNote"
	note.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	note.add_theme_stylebox_override("panel", ClayStyle.panel_box(Color(CARD_COLOR, 0.85), 40))
	note.add_child(_label(Strings.t("parent.shared_note"), FONT_BODY, SOFT_COLOR))
	_shared_note = note
	return note

## Kayıt kurtarıldı / sıfırlandı uyarısı: üst şeridin altında ince kırmızı şerit.
func _build_warning() -> Control:
	_warning_strip = PanelContainer.new()
	_warning_strip.name = "WarningStrip"
	var style: StyleBoxFlat = ClayStyle.panel_box(ClayStyle.ROSE.lightened(0.7), 24)
	style.border_color = ClayStyle.ALERT
	style.content_margin_top = 10.0
	style.content_margin_bottom = 10.0
	_warning_strip.add_theme_stylebox_override("panel", style)
	var st: String = str(app.save.last_load_status)
	_warning_strip.visible = st == "reset" or st == "recovered"
	var l: Label = _label(Strings.t("parent.warning_%s" % st) if _warning_strip.visible else "", FONT_SMALL, ClayStyle.ALERT)
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_warning_strip.add_child(l)
	return _warning_strip

## Sol bölüm menüsü.
func _build_menu() -> Control:
	var menu: VBoxContainer = VBoxContainer.new()
	menu.name = "SectionMenu"
	menu.custom_minimum_size = Vector2(MENU_W, 0)
	menu.add_theme_constant_override("separation", 16)
	var group: ButtonGroup = ButtonGroup.new()
	for t: Array in TABS:
		var id: String = str(t[0])
		var b: Button = _button(Strings.t(str(t[1])))
		b.name = "Tab_" + id
		b.custom_minimum_size = Vector2(MENU_W, MIN_TOUCH)
		b.toggle_mode = true
		b.button_pressed = id == _tab
		ClayStyle.make_choice(b, false)
		b.button_group = group
		b.pressed.connect(select_tab.call_deferred.bind(id))
		menu.add_child(b)
	return menu

# --- Arayüz: bölümler ---

func _build_progress(c: VBoxContainer) -> void:
	var summary: Label = _label(Strings.t("parent.summary_line", {
		"grade": _grade(),
		"stars": app.progress.total_stars(_pid),
		"stickers": app.progress.stickers(_pid).size(),
		"due": app.progress.due_outcomes(_pid).size(),
	}), FONT_BODY)
	summary.name = "SummaryLine"
	c.add_child(summary)
	var subjects: PackedStringArray = _subjects_for("progress")
	var subject: String = _effective_subject(subjects)
	c.add_child(_subject_row(subjects, subject))

	var all_rows: Array[Dictionary] = outcome_rows()
	var s: Dictionary = ParentSummary.subject_summary(all_rows, subject,
		ParentSummary.subject_codes(app.content.units(_grade(), subject)))
	var card_box: VBoxContainer = _scroll_card(c)
	var head: HBoxContainer = HBoxContainer.new()
	head.add_theme_constant_override("separation", GAP)
	var avg: float = float(s["average"])
	var head_text: String = Strings.t("parent.subject_summary", {"played": s["played"], "total": s["total"], "pct": int(round(avg * 100.0))}) \
		if avg >= 0.0 else Strings.t("parent.subject_summary_none", {"played": s["played"], "total": s["total"]})
	var head_label: Label = _label(head_text, FONT_BODY)
	head_label.name = "SubjectSummary"
	ClayStyle.use_bold(head_label)
	head_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	head.add_child(head_label)
	var day: int = int(s["last_day"])
	if day > 0:
		head.add_child(_label(Strings.t("parent.last_played", {"date": _date_text(day)}), FONT_SMALL, SOFT_COLOR))
	(card_box.get_meta("header") as VBoxContainer).add_child(head)

	var rows: Array[Dictionary] = ParentSummary.rows_of(all_rows, subject)
	if rows.is_empty():
		card_box.add_child(_wrap_label(Strings.t("parent.no_progress_subject"), FONT_SMALL, SOFT_COLOR))
		return
	for r: Dictionary in rows:
		var item: VBoxContainer = VBoxContainer.new()
		item.add_theme_constant_override("separation", 6)
		var text: Label = _wrap_label(str(r["text"]), FONT_SMALL)
		text.max_lines_visible = 2
		text.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		item.add_child(text)
		var line: HBoxContainer = HBoxContainer.new()
		line.add_theme_constant_override("separation", GAP)
		var bar: ProgressBar = ProgressBar.new()
		bar.min_value = 0.0
		bar.max_value = 1.0
		bar.value = float(r["mastery"])
		bar.show_percentage = false
		bar.custom_minimum_size = Vector2(BAR_W, 32)
		bar.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		line.add_child(bar)
		line.add_child(_label(Strings.t("parent.mastery", {"pct": int(round(float(r["mastery"]) * 100.0))}), FONT_SMALL))
		var last: Label = _label(Strings.t("parent.last_played", {"date": str(r["last_played"])}), FONT_SMALL, SOFT_COLOR)
		last.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		line.add_child(last)
		line.add_child(_label(str(r["code"]), FONT_SMALL, SOFT_COLOR))
		item.add_child(line)
		card_box.add_child(item)

func _build_home(c: VBoxContainer) -> void:
	c.add_child(_wrap_label(Strings.t("parent.home_activities_hint"), FONT_SMALL, SOFT_COLOR))
	var subjects: PackedStringArray = _subjects_for("home")
	var subject: String = _effective_subject(subjects)
	c.add_child(_subject_row(subjects, subject))
	var card_box: VBoxContainer = _scroll_card(c)
	var rows: Array[Dictionary] = []
	for r: Dictionary in home_activity_rows():
		if str(r["subject"]) == subject:
			rows.append(r)
	if rows.is_empty():
		card_box.add_child(_wrap_label(Strings.t("parent.home_activities_none_subject"), FONT_SMALL, SOFT_COLOR))
		return
	for r: Dictionary in rows:
		var item: VBoxContainer = VBoxContainer.new()
		item.add_theme_constant_override("separation", 6)
		var head: HBoxContainer = HBoxContainer.new()
		head.add_theme_constant_override("separation", GAP)
		var title: Label = _wrap_label(str(r["outcome"]), FONT_SMALL, SOFT_COLOR)
		title.max_lines_visible = 2
		title.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		title.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		head.add_child(title)
		var code: Label = _label(str(r["code"]), FONT_SMALL, SOFT_COLOR)
		code.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
		head.add_child(code)
		item.add_child(head)
		item.add_child(_wrap_label(str(r["text"]), FONT_BODY))
		card_box.add_child(item)

func _build_time(c: VBoxContainer) -> void:
	var limit_card: VBoxContainer = _card(c)
	limit_card.add_child(_heading(Strings.t("parent.daily_limit")))
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
	limit_card.add_child(row)
	var usage_row: HBoxContainer = HBoxContainer.new()
	usage_row.add_theme_constant_override("separation", GAP)
	_usage_label = _wrap_label(usage_text(), FONT_BODY)
	_usage_label.name = "UsageLabel"
	_usage_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_usage_label.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	usage_row.add_child(_usage_label)
	_unlock = _button(Strings.t("parent.unlock_today"))
	ClayStyle.style_button(_unlock, ClayStyle.MINT)
	_unlock.pressed.connect(unlock_today)
	usage_row.add_child(_unlock)
	limit_card.add_child(usage_row)
	_refresh_usage()

	var reset_card: VBoxContainer = _card(c)
	var reset_row: HBoxContainer = HBoxContainer.new()
	reset_row.add_theme_constant_override("separation", GAP)
	var hint: Label = _wrap_label(Strings.t("parent.reset_day_hint"), FONT_SMALL, SOFT_COLOR)
	hint.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	hint.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	reset_row.add_child(hint)
	var reset: Button = _button(Strings.t("parent.reset_day"))
	reset.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	reset.pressed.connect(reset_day)
	reset_row.add_child(reset)
	reset_card.add_child(reset_row)

	_status_label = _wrap_label(_status if _status_tab == "time" else "", FONT_SMALL)
	_status_label.name = "TimeStatus"
	c.add_child(_status_label)

func _build_sound(c: VBoxContainer) -> void:
	var card: VBoxContainer = _card(c)
	card.add_theme_constant_override("separation", 12)
	for v: Array in VOLUMES:
		var key: String = str(v[0])
		var row: HBoxContainer = HBoxContainer.new()
		row.add_theme_constant_override("separation", GAP)
		var l: Label = _label(Strings.t(str(v[1])), FONT_BODY)
		l.custom_minimum_size = Vector2(VOLUME_LABEL_W, 0)
		l.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		row.add_child(l)
		var s: HSlider = HSlider.new()
		s.name = "Slider_" + key
		s.min_value = 0.0
		s.max_value = 1.0
		s.step = 0.05
		s.value = float(_settings().get(key, 1.0))
		s.custom_minimum_size = Vector2(SLIDER_W, MIN_TOUCH)
		s.value_changed.connect(func(val: float) -> void: set_volume(key, val))
		s.drag_ended.connect(func(_changed: bool) -> void: commit_volumes())
		row.add_child(s)
		card.add_child(row)
	for t: Array in TOGGLES:
		var key: String = str(t[0])
		var cb: CheckButton = CheckButton.new()
		cb.text = Strings.t(str(t[1]))
		cb.add_theme_font_size_override("font_size", FONT_BODY)
		cb.custom_minimum_size = Vector2(VOLUME_LABEL_W + GAP + SLIDER_W, MIN_TOUCH)
		cb.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
		cb.focus_mode = Control.FOCUS_NONE
		cb.button_pressed = bool(_settings().get(key, false))
		cb.toggled.connect(func(on: bool) -> void: set_toggle(key, on))
		card.add_child(cb)

func _build_profile(c: VBoxContainer) -> void:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", GAP)
	c.add_child(row)

	# Çocuk kartı: seçili çocuk, sınıf, profili sil.
	var child: VBoxContainer = _card(row)
	(child.get_parent() as Control).size_flags_horizontal = Control.SIZE_EXPAND_FILL
	(child.get_parent() as Control).size_flags_stretch_ratio = 1.6
	(child.get_parent() as Control).name = "ChildCard"
	var p: Dictionary = _find_profile(_pid)
	var head: HBoxContainer = HBoxContainer.new()
	head.add_theme_constant_override("separation", GAP)
	var avatar: TextureRect = TextureRect.new()
	avatar.texture = AssetRegistry.texture(str(p.get("avatar", "")))
	avatar.custom_minimum_size = Vector2(96, 96)
	avatar.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	avatar.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	head.add_child(avatar)
	var name_label: Label = _heading(_profile_name(p) if not p.is_empty() else "")
	name_label.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	head.add_child(name_label)
	child.add_child(head)
	child.add_child(_label(Strings.t("parent.grade"), FONT_SMALL, SOFT_COLOR))
	var grades: HBoxContainer = HBoxContainer.new()
	grades.add_theme_constant_override("separation", 16)
	var group: ButtonGroup = ButtonGroup.new()
	for g: int in GRADES:
		var b: Button = _button(Strings.t("parent.grade_n", {"n": g}))
		b.toggle_mode = true
		b.button_pressed = g == _grade()
		ClayStyle.make_choice(b)
		b.add_theme_constant_override("icon_max_width", 48)
		b.button_group = group
		b.pressed.connect(set_grade.bind(g))
		grades.add_child(b)
	child.add_child(grades)
	var spacer: Control = Control.new()
	spacer.size_flags_vertical = Control.SIZE_EXPAND_FILL
	child.add_child(spacer)
	var del: Button = _button(Strings.t("parent.delete_profile"))
	del.name = "DeleteButton"
	ClayStyle.style_button(del, ClayStyle.ROSE)
	del.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	del.pressed.connect(request_delete)
	child.add_child(del)

	# Cihaz yedeği kartı: dışa / içe aktar ve son işlemin mesajı.
	var backup: VBoxContainer = _card(row)
	(backup.get_parent() as Control).size_flags_horizontal = Control.SIZE_EXPAND_FILL
	(backup.get_parent() as Control).name = "BackupCard"
	backup.add_child(_heading(Strings.t("parent.backup_title")))
	backup.add_child(_wrap_label(Strings.t("parent.backup_hint"), FONT_SMALL, SOFT_COLOR))
	var export_b: Button = _button(Strings.t("parent.export"))
	export_b.pressed.connect(export_backup)
	backup.add_child(export_b)
	var import_b: Button = _button(Strings.t("parent.import"))
	import_b.pressed.connect(func() -> void: _import_dialog.popup_centered_ratio(0.8))
	backup.add_child(import_b)
	_status_label = _label(_status if _status_tab == "profile" else "", FONT_SMALL)
	_status_label.name = "BackupStatus"
	_status_label.autowrap_mode = TextServer.AUTOWRAP_ARBITRARY
	backup.add_child(_status_label)

## Ders seçimi (ButtonGroup): seçili ders onay ikonu taşır.
func _subject_row(subjects: PackedStringArray, selected: String) -> Control:
	var row: HBoxContainer = HBoxContainer.new()
	row.name = "SubjectRow"
	row.add_theme_constant_override("separation", 16)
	var group: ButtonGroup = ButtonGroup.new()
	for s: String in subjects:
		var b: Button = _button(_subject_name(s))
		b.toggle_mode = true
		b.button_pressed = s == selected
		ClayStyle.make_choice(b)
		b.button_group = group
		b.pressed.connect(select_subject.call_deferred.bind(s))
		row.add_child(b)
	return row

# --- Arayüz: silme onayı ---

## Kil onay kartı: karartılmış zemin, ortada mesaj, "Vazgeç" ve "Sil".
func _build_delete_card() -> void:
	_delete_card = Control.new()
	_delete_card.name = "DeleteConfirm"
	_delete_card.set_anchors_preset(Control.PRESET_FULL_RECT)
	_delete_card.mouse_filter = Control.MOUSE_FILTER_STOP
	_delete_card.visible = false
	add_child(_delete_card)
	var dim: ColorRect = ColorRect.new()
	dim.color = Color(ClayStyle.INK, 0.55)
	dim.set_anchors_preset(Control.PRESET_FULL_RECT)
	dim.mouse_filter = Control.MOUSE_FILTER_STOP
	_delete_card.add_child(dim)
	var center: CenterContainer = CenterContainer.new()
	center.set_anchors_preset(Control.PRESET_FULL_RECT)
	center.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_delete_card.add_child(center)
	var card: PanelContainer = PanelContainer.new()
	card.add_theme_stylebox_override("panel", ClayStyle.plaque_box(CARD_COLOR, ClayStyle.CLAY_EDGE, 40, 6, 8, 20, 56.0, 40.0))
	center.add_child(card)
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 40)
	card.add_child(box)
	var title: Label = _heading(Strings.t("parent.delete_profile"))
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(title)
	_delete_message = _wrap_label("", FONT_BODY)
	_delete_message.custom_minimum_size = Vector2(DELETE_MSG_W, 0)
	_delete_message.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(_delete_message)
	var buttons: HBoxContainer = HBoxContainer.new()
	buttons.alignment = BoxContainer.ALIGNMENT_CENTER
	buttons.add_theme_constant_override("separation", 40)
	box.add_child(buttons)
	_delete_cancel = _button(Strings.t("parent.cancel"))
	_delete_cancel.name = "DeleteCancel"
	ClayStyle.style_button(_delete_cancel, ClayStyle.SKY)
	_delete_cancel.custom_minimum_size = Vector2(320, MIN_TOUCH)
	_delete_cancel.pressed.connect(cancel_delete)
	buttons.add_child(_delete_cancel)
	_delete_confirm = _button(Strings.t("parent.delete_ok"))
	_delete_confirm.name = "DeleteOk"
	ClayStyle.style_button(_delete_confirm, ClayStyle.ROSE)
	_delete_confirm.custom_minimum_size = Vector2(320, MIN_TOUCH)
	_delete_confirm.pressed.connect(confirm_delete)
	buttons.add_child(_delete_confirm)

# --- Arayüz: yapı taşları ---

## Kil kart; içerik VBox'ını döndürür.
func _card(parent: Control) -> VBoxContainer:
	var card: PanelContainer = PanelContainer.new()
	card.add_theme_stylebox_override("panel", _card_style())
	parent.add_child(card)
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 16)
	card.add_child(box)
	return box

## Kalan yüksekliği dolduran, içi kayan kil kart. Satır VBox'ını döndürür; başlık kutusu
## "header" metasında durur.
func _scroll_card(parent: Control) -> VBoxContainer:
	var card: PanelContainer = PanelContainer.new()
	card.name = "ListCard"
	card.size_flags_vertical = Control.SIZE_EXPAND_FILL
	card.add_theme_stylebox_override("panel", _card_style())
	parent.add_child(card)
	var outer: VBoxContainer = VBoxContainer.new()
	outer.add_theme_constant_override("separation", 16)
	card.add_child(outer)
	var header: VBoxContainer = VBoxContainer.new()
	outer.add_child(header)
	var scroll: ScrollContainer = ScrollContainer.new()
	scroll.name = "ListScroll"
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	outer.add_child(scroll)
	# Sağ boşluk: satır sonundaki kod kaydırma çubuğuna yapışmasın.
	var pad: MarginContainer = MarginContainer.new()
	pad.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	pad.add_theme_constant_override("margin_right", 36)
	scroll.add_child(pad)
	var rows: VBoxContainer = VBoxContainer.new()
	rows.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	rows.add_theme_constant_override("separation", 28)
	pad.add_child(rows)
	rows.set_meta("header", header)
	return rows

func _card_style() -> StyleBoxFlat:
	return ClayStyle.plaque_box(CARD_COLOR, ClayStyle.SAND.darkened(0.15), 32, 4, 6, 10, 28.0, 20.0)

func _heading(text: String) -> Label:
	var l: Label = _label(text, FONT_BODY)
	ClayStyle.use_bold(l)
	return l

func _label(text: String, font_size: int, color: Color = TEXT_COLOR) -> Label:
	var l: Label = Label.new()
	l.text = text
	l.add_theme_font_size_override("font_size", font_size)
	l.add_theme_color_override("font_color", color)
	return l

func _wrap_label(text: String, font_size: int, color: Color = TEXT_COLOR) -> Label:
	var l: Label = _label(text, font_size, color)
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	return l

func _button(text: String) -> Button:
	var b: Button = Button.new()
	b.text = text
	b.custom_minimum_size = Vector2(MIN_TOUCH, MIN_TOUCH)
	b.focus_mode = Control.FOCUS_NONE
	b.add_theme_font_size_override("font_size", FONT_BODY)
	return b
