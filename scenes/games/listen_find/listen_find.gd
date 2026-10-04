extends MiniGame
## Dinle ve bul: hedefin sesi okunur, çocuk seçeneklerden doğru olanı bulur.

const TOKEN_VIEW: PackedScene = preload("res://scenes/games/token_view.tscn")
const VIEW_SIZE: Vector2 = Vector2(260, 260)
const GAP: float = 70.0
const TOP_Y: float = 400.0

var _target: Dictionary = {}
var _options: Array[Dictionary] = []
var _views: Array[Control] = []
var _faded: Dictionary = {}

func setup(params: Dictionary, difficulty_value: int, context: RoundContext) -> void:
	_init_round(difficulty_value, context)
	_target = params["target"] as Dictionary
	_options.clear()
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
	for i: int in _options.size():
		var v: Control = TOKEN_VIEW.instantiate() as Control
		add_child(v)
		v.call("set_token", _options[i])
		v.size = VIEW_SIZE
		v.position = Vector2(x + i * (VIEW_SIZE.x + GAP), TOP_Y)
		v.pivot_offset = VIEW_SIZE / 2.0
		v.gui_input.connect(_on_view_input.bind(i))
		_views.append(v)
	narrator.say(Token.voice_of(_target))

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
		_fade_one_wrong()
	elif level >= 2:
		_solve()

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
