extends MiniGame
## Hikâye: 1–4 sayfalık resimli hikâye, ardından 1–3 anlama sorusu.
## Okuma evresi: solda sayfanın resmi, sağda metni; "sonraki" oku sayfaları çevirir.
## Soru evresi: soru seslendirilir (metni varsa yazılı da durur), seçeneklerden biri seçilir;
## kitap düğmesi hikâyeye geri döndürür (cevap sayılmaz).
##
## Okuma kipi (`read`):
## - "listen" (varsayılan): her sayfa açılınca seslendirilir; hoparlör düğmesi yeniden okutur.
##   Son sayfanın sesi bitince soru kendiliğinden gelir (ok düğmesi de çalışır).
## - "silent" (sessiz okuma, T.O.* durakları): yönerge ve sorular yine seslendirilir, ama okuma
##   parçasının sesi ilk cevaba kadar tutulur. İlk cevaptan sonra sayfalarda hoparlör belirir;
##   ikinci yanlışta (ipucu 1) ilgili sayfa kendiliğinden seslendirilir.

const Widgets: GDScript = preload("res://scenes/games/game_widgets.gd")
const TOKEN_VIEW: PackedScene = preload("res://scenes/games/token_view.tscn")
const ASSET_IMAGE: PackedScene = preload("res://scenes/components/asset_image.tscn")
const MIN_PAGES: int = 1
const MAX_PAGES: int = 4
const MIN_QUESTIONS: int = 1
const MAX_QUESTIONS: int = 3
const MIN_OPTIONS: int = 2
const MAX_OPTIONS: int = 4
const READ_MODES: PackedStringArray = ["listen", "silent"]
const PICTURE_RECT: Rect2 = Rect2(130, 190, 580, 580)
const TEXT_RECT_WITH_PICTURE: Rect2 = Rect2(760, 190, 1030, 580)
const TEXT_RECT_FULL: Rect2 = Rect2(130, 190, 1660, 580)
const PAGE_FONT: int = 64
const BUTTON_SIDE: float = 170.0
## Bilge sol alt köşede durur (x 16–266, y 724–1068); hoparlör onun sağında kalır.
const SPEAKER_POS: Vector2 = Vector2(290, 820)
const NEXT_POS: Vector2 = Vector2(1620, 820)
const BOOK_POS: Vector2 = Vector2(1620, 840)
const QUESTION_RECT: Rect2 = Rect2(330, 190, 1460, 200)
const QUESTION_SPEAKER_POS: Vector2 = Vector2(130, 205)
const QUESTION_FONT: int = 60
const OPTION_SIZE: Vector2 = Vector2(250, 250)
const OPTION_Y: float = 500.0
const OPTION_GAP: float = 64.0
const TEXT_OPTION_SIZE: Vector2 = Vector2(760, 150)
const TEXT_OPTION_GAP: Vector2 = Vector2(48, 36)
const TEXT_OPTION_FONT: int = 56
const STAGE_MARGIN: float = 40.0
const NEXT_QUESTION_DELAY: float = 0.9
## Dinleme kipinde son sayfanın sesi bittikten sonra soruya geçmeden önceki kısa bekleme (sn).
const AUTO_QUESTION_DELAY: float = 0.8

var _pages: Array[Dictionary] = []
var _questions: Array[Dictionary] = []
var _silent: bool = false
var _voice_unlocked: bool = true
var _page: int = 0
var _question: int = 0
## "read" ya da "question".
var _phase: String = "read"
var _faded: Dictionary = {}
## Her sayfa/soru gösteriminde artar; bekleyen otomatik geçiş eskiyse iptal olur.
var _view_gen: int = 0

var _read_layer: Control = null
var _question_layer: Control = null
var _picture: Control = null
var _page_label: Label = null
var _speaker: Control = null
var _next: Control = null
var _book: Control = null
var _question_label: Label = null
var _question_panel: Panel = null
var _question_speaker: Control = null
var _option_views: Array[Control] = []
var _options_root: Control = null

func setup(params: Dictionary, difficulty_value: int, context: RoundContext) -> void:
	_init_round(difficulty_value, context)
	for pg: Variant in params["pages"] as Array:
		_pages.append(pg as Dictionary)
	for q: Variant in params["questions"] as Array:
		_questions.append(q as Dictionary)
	_silent = str(params.get("read", "listen")) == "silent"
	_voice_unlocked = not _silent
	_build_read_layer()
	_build_question_layer()
	if narrator.has_signal("line_finished") and not narrator.is_connected("line_finished", _on_line_finished):
		narrator.connect("line_finished", _on_line_finished)
	_show_page(0)

func _exit_tree() -> void:
	if is_instance_valid(narrator) and narrator.has_signal("line_finished") \
			and narrator.is_connected("line_finished", _on_line_finished):
		narrator.disconnect("line_finished", _on_line_finished)

func _build_read_layer() -> void:
	_read_layer = _layer("ReadLayer")
	var has_picture: bool = false
	for pg: Dictionary in _pages:
		if str(pg.get("image", "")) != "":
			has_picture = true
	var text_rect: Rect2 = TEXT_RECT_WITH_PICTURE if has_picture else TEXT_RECT_FULL
	if has_picture:
		_read_layer.add_child(ClayStyle.make_panel(ClayStyle.card_box(ClayStyle.IVORY, 40), PICTURE_RECT))
		_picture = ASSET_IMAGE.instantiate() as Control
		_picture.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_read_layer.add_child(_picture)
		_picture.position = PICTURE_RECT.position + Vector2(30, 30)
		_picture.size = PICTURE_RECT.size - Vector2(60, 60)
	_read_layer.add_child(ClayStyle.make_panel(ClayStyle.card_box(ClayStyle.PAPER, 40), text_rect))
	_page_label = _label(text_rect.grow(-44.0), PAGE_FONT)
	_read_layer.add_child(_page_label)
	_speaker = Widgets.make_icon_button(_read_layer, Rect2(SPEAKER_POS, Vector2(BUTTON_SIDE, BUTTON_SIDE)),
		"ui.replay", Callable(Widgets, "draw_speaker"), _on_speaker)
	_speaker.name = "PageSpeaker"
	_next = Widgets.make_icon_button(_read_layer, Rect2(NEXT_POS, Vector2(BUTTON_SIDE, BUTTON_SIDE)),
		"ui.page_next", Callable(Widgets, "draw_next_arrow"), _on_next, ClayStyle.MINT)
	_next.name = "NextButton"

func _build_question_layer() -> void:
	_question_layer = _layer("QuestionLayer")
	_question_speaker = Widgets.make_icon_button(_question_layer,
		Rect2(QUESTION_SPEAKER_POS, Vector2(BUTTON_SIDE, BUTTON_SIDE)), "ui.replay", Callable(Widgets, "draw_speaker"),
		_on_question_speaker)
	_question_speaker.name = "QuestionSpeaker"
	_question_panel = ClayStyle.make_panel(ClayStyle.card_box(ClayStyle.PAPER, 40), QUESTION_RECT)
	_question_layer.add_child(_question_panel)
	_question_label = _label(QUESTION_RECT.grow(-28.0), QUESTION_FONT)
	_question_layer.add_child(_question_label)
	_options_root = Control.new()
	_options_root.name = "Options"
	_options_root.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_options_root.size = BASE_SIZE
	_question_layer.add_child(_options_root)
	_book = Widgets.make_icon_button(_question_layer, Rect2(BOOK_POS, Vector2(BUTTON_SIDE, BUTTON_SIDE)),
		"ui.book", Callable(Widgets, "draw_book"), _on_book)
	_book.name = "BookButton"
	_question_layer.visible = false

func _layer(layer_name: String) -> Control:
	var c: Control = Control.new()
	c.name = layer_name
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	c.size = BASE_SIZE
	add_child(c)
	return c

func _label(rect: Rect2, font_size: int) -> Label:
	var l: Label = Label.new()
	l.position = rect.position
	l.size = rect.size
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.add_theme_font_size_override("font_size", font_size)
	l.add_theme_color_override("font_color", ClayStyle.INK)
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l

# --- okuma evresi ---

func _show_page(i: int) -> void:
	_view_gen += 1
	_phase = "read"
	_page = clampi(i, 0, _pages.size() - 1)
	_read_layer.visible = true
	_question_layer.visible = false
	var pg: Dictionary = _pages[_page]
	_page_label.text = Strings.t(str(pg["text"]))
	if _picture != null:
		_picture.set("key", str(pg.get("image", "")))
		_picture.visible = str(pg.get("image", "")) != ""
	_speaker.visible = _voice_unlocked
	if not _silent:
		narrator.say(str(pg["voice"]))

## Dinleme kipinde son sayfanın sesi bitince kısa bir beklemeden sonra soruya geçilir;
## çocuk ok düğmesini bulamasa da hikâye takılı kalmaz.
func _on_line_finished(id: String) -> void:
	if _silent or _done or _phase != "read" or _page != _pages.size() - 1:
		return
	if id != str(_pages[_page]["voice"]):
		return
	var gen: int = _view_gen
	await _wait(AUTO_QUESTION_DELAY)
	if gen != _view_gen or _phase != "read" or not _can_input():
		return
	_show_question()

func _on_speaker() -> void:
	if not _can_input() or not _voice_unlocked or _phase != "read":
		return
	_tap_feedback(_speaker)
	narrator.say(str(_pages[_page]["voice"]))

func _on_next() -> void:
	if not _can_input() or _phase != "read":
		return
	_tap_feedback(_next)
	audio.play_sfx("sfx.page_turn")
	if _page + 1 < _pages.size():
		_show_page(_page + 1)
	else:
		_show_question()

func _on_book() -> void:
	if not _can_input() or _phase != "question":
		return
	_tap_feedback(_book)
	audio.play_sfx("sfx.page_turn")
	_show_page(0)

# --- soru evresi ---

func _show_question() -> void:
	_view_gen += 1
	_phase = "question"
	_read_layer.visible = false
	_question_layer.visible = true
	var q: Dictionary = _questions[_question]
	_question_label.text = Strings.t(str(q["text"])) if q.has("text") else ""
	_question_panel.visible = q.has("text")
	_build_options(q)
	narrator.say(str(q["voice"]))

func _on_question_speaker() -> void:
	if not _can_input() or _phase != "question":
		return
	_tap_feedback(_question_speaker)
	narrator.say(str(_questions[_question]["voice"]))

func _build_options(q: Dictionary) -> void:
	for c: Node in _options_root.get_children():
		_options_root.remove_child(c)
		c.queue_free()
	_option_views.clear()
	_faded.clear()
	var options: Array = q["options"] as Array
	if is_text_options(options):
		_build_text_options(options)
	else:
		_build_token_options(options)

## Bütün seçenekler metin token'ıysa iki sütunlu metin karoları kullanılır.
static func is_text_options(options: Array) -> bool:
	for o: Variant in options:
		if str((o as Dictionary).get("type", "")) != "text":
			return false
	return true

func _build_token_options(options: Array) -> void:
	var total_w: float = options.size() * OPTION_SIZE.x + (options.size() - 1) * OPTION_GAP
	var x: float = (BASE_SIZE.x - total_w) / 2.0
	_options_root.add_child(ClayStyle.make_panel(ClayStyle.tray_box(),
		Rect2(x - STAGE_MARGIN, OPTION_Y - STAGE_MARGIN, total_w + STAGE_MARGIN * 2.0, OPTION_SIZE.y + STAGE_MARGIN * 2.0)))
	for i: int in options.size():
		var v: Control = TOKEN_VIEW.instantiate() as Control
		v.set("framed", true)
		_options_root.add_child(v)
		v.call("set_token", options[i] as Dictionary)
		v.size = OPTION_SIZE
		v.position = Vector2(x + i * (OPTION_SIZE.x + OPTION_GAP), OPTION_Y)
		v.pivot_offset = OPTION_SIZE / 2.0
		v.gui_input.connect(_on_option_input.bind(i))
		_option_views.append(v)

func _build_text_options(options: Array) -> void:
	var cols: int = 1 if options.size() <= 2 else 2
	var rows: int = ceili(options.size() / float(cols))
	var total: Vector2 = Vector2(cols * TEXT_OPTION_SIZE.x + (cols - 1) * TEXT_OPTION_GAP.x,
		rows * TEXT_OPTION_SIZE.y + (rows - 1) * TEXT_OPTION_GAP.y)
	var origin: Vector2 = Vector2((BASE_SIZE.x - total.x) / 2.0, OPTION_Y - 70.0)
	_options_root.add_child(ClayStyle.make_panel(ClayStyle.tray_box(),
		Rect2(origin - Vector2(STAGE_MARGIN, STAGE_MARGIN), total + Vector2(STAGE_MARGIN, STAGE_MARGIN) * 2.0)))
	for i: int in options.size():
		var col: int = i % cols
		var row: int = i / cols
		var pos: Vector2 = origin + Vector2(col * (TEXT_OPTION_SIZE.x + TEXT_OPTION_GAP.x), row * (TEXT_OPTION_SIZE.y + TEXT_OPTION_GAP.y))
		var label: String = Strings.t(str((options[i] as Dictionary)["value"]))
		var tile: Control = Widgets.make_tile(_options_root, label, Rect2(pos, TEXT_OPTION_SIZE), TEXT_OPTION_FONT, ClayStyle.PEACH)
		tile.gui_input.connect(_on_option_input.bind(i))
		_option_views.append(tile)

func _on_option_input(event: InputEvent, index: int) -> void:
	if is_press(event):
		_choose(index)

func _correct_index() -> int:
	return int(_questions[_question]["answer"]) if _question < _questions.size() else -1

func _choose(index: int) -> void:
	if not _can_input() or _phase != "question" or index < 0 or index >= _option_views.size():
		return
	_tap_feedback(_option_views[index])
	_unlock_voice()
	var last: bool = _question + 1 >= _questions.size()
	if index == _correct_index():
		_submit_answer(true, last)
		if not last:
			_next_question()
	else:
		_submit_answer(false, false)

func _next_question() -> void:
	_busy = true
	await _wait(NEXT_QUESTION_DELAY)
	_busy = false
	if _done:
		return
	_question += 1
	_show_question()

## Sessiz okumada okuma parçasının sesi ilk cevaptan sonra açılır.
func _unlock_voice() -> void:
	if _voice_unlocked:
		return
	_voice_unlocked = true
	if _speaker != null:
		_speaker.visible = _phase == "read"

## Sorunun dayandığı sayfa (verilmemişse son sayfa).
func _question_page() -> int:
	var q: Dictionary = _questions[mini(_question, _questions.size() - 1)]
	return clampi(int(q.get("page", _pages.size() - 1)), 0, _pages.size() - 1)

func show_hint(level: int) -> void:
	if _done or _busy:
		return
	if level == 1:
		_unlock_voice()
		if _phase == "question":
			_fade_one_wrong()
		narrator.say(str(_pages[_question_page()]["voice"]))
	elif level >= 2:
		_solve()

## İpucu 1: henüz soluklaşmamış yanlış seçeneklerden biri soluklaşır.
func _fade_one_wrong() -> void:
	var correct: int = _correct_index()
	for i: int in _option_views.size():
		if i != correct and not _faded.has(i):
			_faded[i] = true
			_option_views[i].create_tween().tween_property(_option_views[i], "modulate:a", 0.3, 0.4)
			return

## İpucu 2: soru evresine geçilir; kalan sorularda doğru seçenek parlar ve seçilir.
func _solve() -> void:
	_busy = true
	helped = true
	_unlock_voice()
	if _phase != "question":
		_show_question()
	while not _done and _question < _questions.size():
		var i: int = _correct_index()
		_glow(_option_views[i])
		await _wait(0.6)
		if _done:
			return
		var last: bool = _question + 1 >= _questions.size()
		_submit_answer(true, last)
		if last:
			break
		await _wait(NEXT_QUESTION_DELAY)
		_question += 1
		_show_question()
	_busy = false

# --- test kancaları ---

func phase() -> String:
	return _phase

func page_index() -> int:
	return _page

func question_index() -> int:
	return _question

func voice_unlocked() -> bool:
	return _voice_unlocked

func speaker_visible() -> bool:
	return _speaker.visible and _read_layer.visible

func touch_targets() -> Array[Control]:
	var res: Array[Control] = []
	if _phase == "read":
		res.append(_next)
		if _speaker.visible:
			res.append(_speaker)
	else:
		res.append(_book)
		res.append(_question_speaker)
		res.append_array(_option_views)
	return res

func _debug_next() -> void:
	_on_next()

func _debug_book() -> void:
	_on_book()

func _debug_speaker() -> void:
	_on_speaker()

func _debug_choose(index: int) -> void:
	_choose(index)

func _debug_correct_index() -> int:
	return _correct_index()

## Test için: sayfaları çevirip soruya gelir, sonra doğru ya da yanlış seçer.
func _debug_answer(correct: bool) -> void:
	while _phase == "read":
		var before: String = _phase + str(_page)
		_on_next()
		if before == _phase + str(_page):
			return
	var c: int = _correct_index()
	if correct:
		_choose(c)
	else:
		_choose(0 if c != 0 else 1)

static func validate_params(p: Dictionary) -> Array[String]:
	var errs: Array[String] = []
	var read: Variant = p.get("read", "listen")
	if not (read is String) or not READ_MODES.has(read as String):
		errs.append(ContentValidator.msg("err.params.read_mode"))
	var pages: Variant = p.get("pages")
	if not (pages is Array) or (pages as Array).size() < MIN_PAGES or (pages as Array).size() > MAX_PAGES:
		errs.append(ContentValidator.msg("err.params.st_pages"))
		return errs
	for pg: Variant in pages as Array:
		if not (pg is Dictionary) or not _non_empty((pg as Dictionary).get("text")) \
				or not _non_empty((pg as Dictionary).get("voice")) \
				or ((pg as Dictionary).has("image") and not _non_empty((pg as Dictionary)["image"])):
			errs.append(ContentValidator.msg("err.params.st_pages"))
			return errs
	var questions: Variant = p.get("questions")
	if not (questions is Array) or (questions as Array).size() < MIN_QUESTIONS or (questions as Array).size() > MAX_QUESTIONS:
		errs.append(ContentValidator.msg("err.params.st_questions"))
		return errs
	for q_v: Variant in questions as Array:
		if not (q_v is Dictionary) or not _non_empty((q_v as Dictionary).get("voice")) \
				or ((q_v as Dictionary).has("text") and not _non_empty((q_v as Dictionary)["text"])):
			errs.append(ContentValidator.msg("err.params.st_questions"))
			return errs
		var q: Dictionary = q_v
		var options: Variant = q.get("options")
		if not (options is Array) or (options as Array).size() < MIN_OPTIONS or (options as Array).size() > MAX_OPTIONS:
			errs.append(ContentValidator.msg("err.params.options"))
			return errs
		var list: Array = options as Array
		for o: Variant in list:
			if not Token.is_valid(o):
				errs.append(ContentValidator.msg("err.params.token", {"field": "options"}))
				return errs
		for i: int in list.size():
			for j: int in range(i + 1, list.size()):
				if Token.same(list[i] as Dictionary, list[j] as Dictionary):
					errs.append(ContentValidator.msg("err.params.options_dup"))
					return errs
		var texts: int = 0
		for o: Variant in list:
			if str((o as Dictionary)["type"]) == "text":
				texts += 1
		if texts > 0 and texts < list.size():
			errs.append(ContentValidator.msg("err.params.st_mixed_options"))
		var answer: Variant = q.get("answer")
		if not ContentValidator.is_int_like(answer) or int(answer) < 0 or int(answer) >= list.size():
			errs.append(ContentValidator.msg("err.params.st_answer"))
		if q.has("page"):
			var pg_i: Variant = q["page"]
			if not ContentValidator.is_int_like(pg_i) or int(pg_i) < 0 or int(pg_i) >= (pages as Array).size():
				errs.append(ContentValidator.msg("err.params.st_page"))
	return errs

static func _non_empty(v: Variant) -> bool:
	return v is String and not (v as String).is_empty()
