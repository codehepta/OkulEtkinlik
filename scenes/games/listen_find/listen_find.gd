extends MiniGame
## Dinle ve bul: hedefin sesi okunur, çocuk seçeneklerden doğru olanı bulur.
## Üstte büyük hoparlör düğmesi hedefin sesini yeniden okutur (cevap sayılmaz).
## Yazma modu (`answer: "digits"`, Faz 3b): hedef bir sayıdır; çocuk duyduğu sayıyı rakam
## karolarıyla yazar ve onaylar (2–3. sınıfta çok basamaklı sayı yazma, MAT.2.1.1 c, MAT.3.1.1 c).

const TOKEN_VIEW: PackedScene = preload("res://scenes/games/token_view.tscn")
const VIEW_SIZE: Vector2 = Vector2(250, 250)
const GAP: float = 64.0
const TOP_Y: float = 540.0
const STAGE_MARGIN: float = 44.0
const SPEAKER_SIZE: float = 260.0
const SPEAKER_Y: float = 196.0
const SPEAKER_DISC: Color = ClayStyle.IVORY
const SPEAKER_INK: Color = ClayStyle.TEAL
const DIGIT_INPUT: GDScript = preload("res://scenes/components/digit_input.gd")
const Widgets: GDScript = preload("res://scenes/games/game_widgets.gd")
const MAX_WRITE_VALUE: int = 9999
const SLOTS_CENTER: Vector2 = Vector2(960, 570)
const KEYS_CENTER: Vector2 = Vector2(860, 830)
const WRITE_CHECK_RECT: Rect2 = Rect2(1300, 730, 200, 200)

var _target: Dictionary = {}
var _options: Array[Dictionary] = []
var _views: Array[Control] = []
var _faded: Dictionary = {}
var _speaker: Button = null
var _input: Control = null
var _check: Control = null

func setup(params: Dictionary, difficulty_value: int, context: RoundContext) -> void:
	_init_round(difficulty_value, context)
	_target = params["target"] as Dictionary
	_options.clear()
	if str(params.get("answer", "")) == "digits":
		_setup_write()
		return
	for o: Variant in params["options"] as Array:
		_options.append(o as Dictionary)
	# Karıştır (Fisher-Yates, bağlamın rng'siyle).
	for i: int in range(_options.size() - 1, 0, -1):
		var j: int = ctx.rng.randi_range(0, i)
		var t: Dictionary = _options[i]
		_options[i] = _options[j]
		_options[j] = t
	var total_w: float = _options.size() * VIEW_SIZE.x + (_options.size() - 1) * GAP
	var x: float = (BASE_SIZE.x - total_w) / 2.0
	var stage: Rect2 = Rect2(x - STAGE_MARGIN, TOP_Y - STAGE_MARGIN, total_w + STAGE_MARGIN * 2.0, VIEW_SIZE.y + STAGE_MARGIN * 2.0)
	add_child(ClayStyle.make_panel(ClayStyle.tray_box(), stage))
	_build_speaker()
	for i: int in _options.size():
		var v: Control = TOKEN_VIEW.instantiate() as Control
		v.set("framed", true)
		add_child(v)
		v.call("set_token", _options[i])
		v.size = VIEW_SIZE
		v.position = Vector2(x + i * (VIEW_SIZE.x + GAP), TOP_Y)
		v.pivot_offset = VIEW_SIZE / 2.0
		v.gui_input.connect(_on_view_input.bind(i))
		_views.append(v)
	narrator.say(Token.voice_of(_target))

# ================= Yazma modu =================

func _setup_write() -> void:
	_build_speaker()
	var value: int = int(_target["value"])
	_input = DIGIT_INPUT.new()
	_input.name = "DigitInput"
	add_child(_input)
	_input.set("audio", audio)
	_input.set("can_input", _can_input)
	_input.call("build", str(value).length(), SLOTS_CENTER, KEYS_CENTER)
	_check = Widgets.make_check_button(self, WRITE_CHECK_RECT)
	_check.gui_input.connect(func(event: InputEvent) -> void:
		if is_press(event):
			_check_written())
	narrator.say(Token.voice_of(_target))

func is_write_mode() -> bool:
	return _input != null

## Onay: eksik yuva varsa cevap sayılmaz; yazılan sayı hedefle karşılaştırılır.
## Yanlışta yazılan rakamlar yerinde kalır (K4).
func _check_written() -> void:
	if not _can_input() or not bool(_input.call("is_complete")):
		return
	_tap_feedback(_check)
	_submit_answer(int(_input.call("value")) == int(_target["value"]))

func _debug_key(d: int) -> void:
	_input.call("press_key", d)

func _debug_clear(i: int) -> void:
	_input.call("clear_slot", i)

func _debug_check() -> void:
	_check_written()

func written() -> int:
	return int(_input.call("value"))

func touch_targets() -> Array[Control]:
	if _input != null:
		var res: Array[Control] = _input.call("touch_targets")
		res.append(_check)
		return res
	return _views.duplicate()

## Test için: yazma modunda doğru ya da yanlış sayıyı yazıp onaylar.
func _debug_answer(correct: bool) -> void:
	if _input == null:
		var right: int = _correct_index()
		_choose(right if correct else (0 if right != 0 else 1))
		return
	var v: int = int(_target["value"])
	var n: int = str(v).length()
	var wrong: int = (v + 1) % int(pow(10, n))
	if str(wrong).length() != n:
		wrong = int(pow(10, n - 1)) if v != int(pow(10, n - 1)) else int(pow(10, n - 1)) + 1
	_input.call("set_value", v if correct else wrong)
	_check_written()

## Hoparlör düğmesi: yuvarlak kil disk üzerinde çizilmiş hoparlör ve ses dalgaları.
func _build_speaker() -> void:
	_speaker = Button.new()
	_speaker.name = "SpeakerButton"
	_speaker.focus_mode = Control.FOCUS_NONE
	var box: StyleBoxFlat = ClayStyle.card_box(SPEAKER_DISC, int(SPEAKER_SIZE / 2.0))
	_speaker.add_theme_stylebox_override("normal", box)
	_speaker.add_theme_stylebox_override("hover", box)
	_speaker.add_theme_stylebox_override("focus", StyleBoxEmpty.new())
	var pressed_box: StyleBoxFlat = ClayStyle.card_box(SPEAKER_DISC.darkened(0.06), int(SPEAKER_SIZE / 2.0))
	pressed_box.border_width_bottom = 6
	pressed_box.shadow_offset = Vector2(0, 3)
	_speaker.add_theme_stylebox_override("pressed", pressed_box)
	add_child(_speaker)
	_speaker.size = Vector2(SPEAKER_SIZE, SPEAKER_SIZE)
	_speaker.position = Vector2((BASE_SIZE.x - SPEAKER_SIZE) / 2.0, SPEAKER_Y)
	_speaker.pivot_offset = _speaker.size / 2.0
	var icon: Control = Control.new()
	icon.mouse_filter = Control.MOUSE_FILTER_IGNORE
	icon.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	icon.draw.connect(_draw_speaker.bind(icon))
	_speaker.add_child(icon)
	_speaker.pressed.connect(_replay_target)

func _draw_speaker(ci: Control) -> void:
	var c: Vector2 = ci.size / 2.0 + Vector2(-26, -4)
	var u: float = ci.size.x / 260.0
	var body: PackedVector2Array = PackedVector2Array([
		c + Vector2(-58, -30) * u, c + Vector2(-22, -30) * u, c + Vector2(26, -72) * u,
		c + Vector2(26, 72) * u, c + Vector2(-22, 30) * u, c + Vector2(-58, 30) * u,
	])
	var shadow: PackedVector2Array = PackedVector2Array()
	for p: Vector2 in body:
		shadow.append(p + Vector2(0, 6) * u)
	ci.draw_colored_polygon(shadow, Color(0.05, 0.25, 0.3, 0.3))
	ci.draw_colored_polygon(body, SPEAKER_INK)
	ci.draw_polyline(body + PackedVector2Array([body[0]]), SPEAKER_INK.darkened(0.25), 6.0 * u, true)
	for k: int in 2:
		var r: float = (62.0 + k * 34.0) * u
		ci.draw_arc(c + Vector2(30, 0) * u, r, -0.75, 0.75, 24, SPEAKER_INK, 16.0 * u, true)

func _replay_target() -> void:
	if not _can_input():
		return
	_tap_feedback(_speaker)
	narrator.say(Token.voice_of(_target))

## Test için: hoparlör düğmesine basmakla aynı kod yolu.
func _debug_replay() -> void:
	_replay_target()

func _on_view_input(event: InputEvent, index: int) -> void:
	if is_press(event):
		_choose(index)

## Test için: gerçek dokunmayla aynı kod yolu.
func _debug_choose(index: int) -> void:
	_choose(index)

## Test için: doğru seçeneğin (karıştırılmış) indeksi.
func _debug_correct_index() -> int:
	return _correct_index()

func _correct_index() -> int:
	for i: int in _options.size():
		if Token.same(_options[i], _target):
			return i
	return -1

func _choose(index: int) -> void:
	if not _can_input() or index < 0 or index >= _options.size():
		return
	_tap_feedback(_views[index])
	_submit_answer(index == _correct_index())

func show_hint(level: int) -> void:
	if _done or _busy:
		return
	if level == 1:
		if _input != null:
			_hint_digit()
		else:
			_fade_one_wrong()
	elif level >= 2:
		_solve()

## Yazma modu ipucu 1: hedefle uyuşmayan ilk yuva ve oraya gereken rakam karosu parlar.
func _hint_digit() -> void:
	var v: int = int(_target["value"])
	var i: int = int(_input.call("first_mismatch", v))
	if i < 0:
		return
	_glow(_input.call("slot_view", i) as Control)
	_glow(_input.call("key_view", int(_input.call("digit_for", v, i))) as Control)

## İpucu 1: henüz soluklaşmamış yanlış seçeneklerden biri soluklaşır.
func _fade_one_wrong() -> void:
	var correct: int = _correct_index()
	for i: int in _views.size():
		if i != correct and not _faded.has(i):
			_faded[i] = true
			_views[i].create_tween().tween_property(_views[i], "modulate:a", 0.3, 0.4)
			return

## İpucu 2: doğru seçenek parlar ve otomatik seçilir.
func _solve() -> void:
	_busy = true
	helped = true
	if _input != null:
		_input.call("set_value", int(_target["value"]))
		_glow(_check)
	else:
		_glow(_views[_correct_index()])
	await _wait(0.6)
	_busy = false
	if _done:
		return
	_submit_answer(true)

static func validate_params(p: Dictionary) -> Array[String]:
	var errs: Array[String] = []
	var target: Variant = p.get("target")
	if not Token.is_valid(target):
		errs.append(ContentValidator.msg("err.params.token", {"field": "target"}))
		return errs
	if str((target as Dictionary).get("voice", "")).is_empty():
		errs.append(ContentValidator.msg("err.params.target_voice"))
	if p.has("answer"):
		var t: Dictionary = target as Dictionary
		var ok: bool = p["answer"] == "digits" and t.get("type") == "number" and ContentValidator.is_int_like(t.get("value")) \
			and int(t["value"]) >= 0 and int(t["value"]) <= MAX_WRITE_VALUE
		if not ok:
			errs.append(ContentValidator.msg("err.params.write_target"))
		return errs
	var options: Variant = p.get("options")
	if not (options is Array) or (options as Array).size() < 2 or (options as Array).size() > 4:
		errs.append(ContentValidator.msg("err.params.options"))
		return errs
	var has_target: bool = false
	for o: Variant in options as Array:
		if not Token.is_valid(o):
			errs.append(ContentValidator.msg("err.params.token", {"field": "options"}))
			return errs
		if Token.same(o as Dictionary, target as Dictionary):
			has_target = true
	if not has_target:
		errs.append(ContentValidator.msg("err.params.options_missing_target"))
	var list: Array = options as Array
	for i: int in list.size():
		for j: int in range(i + 1, list.size()):
			if Token.same(list[i] as Dictionary, list[j] as Dictionary):
				errs.append(ContentValidator.msg("err.params.options_dup"))
				return errs
	return errs
