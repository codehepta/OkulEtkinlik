extends MiniGame
## Durum seç: üstte durumu gösteren sahne görseli, altta 2–3 davranış kartı. Soru turun
## seslendirmesidir ("Ne yapmalıyız?"). Doğru kart seçilince (varsa) iyi sonucun görseli gelir.
## Yanlış kartta ceza yok: sahne kısa süre nazik sonucu gösterir, varsa sonucu anlatan satır
## okunur, sonra sahne geri döner ve cevap bildirilir (runner'ın satırlarıyla çakışmasın diye).
## Denenen kart soluklaşır ve yeniden seçilemez; aynı yanlış iki kez sayılmaz.

const Widgets: GDScript = preload("res://scenes/games/game_widgets.gd")
const TOKEN_VIEW: PackedScene = preload("res://scenes/games/token_view.tscn")
const ASSET_IMAGE: PackedScene = preload("res://scenes/components/asset_image.tscn")
const MIN_CHOICES: int = 2
const MAX_CHOICES: int = 3
## Zorluğa göre görünen en çok seçenek.
const VISIBLE_BY_DIFFICULTY: Dictionary = {1: 2, 2: 3, 3: 3}

const SCENE_RECT: Rect2 = Rect2(622, 160, 676, 380)
const SCENE_FRAME: float = 22.0
const CARD_SIDE: float = 300.0
const CARD_GAP: float = 80.0
const CARD_Y: float = 590.0
const CARD_COLOR: Color = ClayStyle.PEACH
const TRIED_ALPHA: float = 0.45
const FADED_ALPHA: float = 0.35
## Nazik sonucun ekranda kalma süresi (sesli satır yoksa ya da bittikten sonra).
const CONSEQUENCE_SECONDS: float = 1.2
const REDUCED_CONSEQUENCE_SECONDS: float = 0.6
## Sonuç satırı için en uzun bekleme (anlatıcı bitti sinyali gelmezse).
const VOICE_TIMEOUT_SECONDS: float = 8.0

var _scene_key: String = ""
var _hint_voice: String = ""
## Görünen seçenekler (karışık sırayla).
var _choices: Array[Dictionary] = []
var _cards: Array[Control] = []
var _tried: Array[bool] = []
var _faded: Dictionary = {}
var _scene_view: Control = null
var _shown_key: String = ""

func setup(params: Dictionary, difficulty_value: int, context: RoundContext) -> void:
	_init_round(difficulty_value, context)
	_scene_key = str(params["scene"])
	_hint_voice = str(params.get("hint", ""))
	var correct: Dictionary = {}
	var wrong: Array[Dictionary] = []
	for c: Variant in params["choices"] as Array:
		var d: Dictionary = c as Dictionary
		if bool(d["correct"]):
			correct = d
		else:
			wrong.append(d)
	var k: int = int(VISIBLE_BY_DIFFICULTY.get(clampi(difficulty, 1, 3), MAX_CHOICES))
	var shown: Array = [correct]
	for i: int in mini(k - 1, wrong.size()):
		shown.append(wrong[i])
	Widgets.shuffle(shown, ctx.rng)
	for d: Variant in shown:
		_choices.append(d as Dictionary)
		_tried.append(false)
	_build_scene()
	_build_cards()

func _build_scene() -> void:
	add_child(ClayStyle.make_panel(ClayStyle.tray_box(0.8, 48), SCENE_RECT.grow(SCENE_FRAME)))
	var img: Control = ASSET_IMAGE.instantiate() as Control
	img.name = "Scene"
	img.mouse_filter = Control.MOUSE_FILTER_IGNORE
	img.custom_minimum_size = SCENE_RECT.size
	add_child(img)
	img.position = SCENE_RECT.position
	img.size = SCENE_RECT.size
	img.pivot_offset = img.size / 2.0
	_scene_view = img
	_show_scene(_scene_key)

func _build_cards() -> void:
	var n: int = _choices.size()
	var total: float = n * CARD_SIDE + (n - 1) * CARD_GAP
	var x0: float = (BASE_SIZE.x - total) / 2.0
	for i: int in n:
		var v: Control = TOKEN_VIEW.instantiate() as Control
		v.name = "Choice%d" % i
		v.set("framed", true)
		v.set("card_color", CARD_COLOR)
		add_child(v)
		v.call("set_token", _choices[i]["token"] as Dictionary)
		v.custom_minimum_size = Vector2(CARD_SIDE, CARD_SIDE)
		v.size = Vector2(CARD_SIDE, CARD_SIDE)
		v.position = Vector2(x0 + i * (CARD_SIDE + CARD_GAP), CARD_Y)
		v.pivot_offset = v.size / 2.0
		v.gui_input.connect(_on_card_input.bind(i))
		_cards.append(v)

## Sahne görselini değiştirir (yumuşak geçiş; hareketi azalt açıkken anında).
func _show_scene(key: String) -> void:
	_shown_key = key
	_scene_view.set("key", key)
	if _reduce_motion() or not is_inside_tree():
		return
	_scene_view.modulate.a = 0.4
	_scene_view.create_tween().tween_property(_scene_view, "modulate:a", 1.0, 0.3)

func _on_card_input(event: InputEvent, index: int) -> void:
	if is_press(event):
		_choose(index)

func _choose(index: int) -> void:
	if not _can_input() or index < 0 or index >= _choices.size() or _tried[index]:
		return
	_tap_feedback(_cards[index])
	var choice: Dictionary = _choices[index]
	if bool(choice["correct"]):
		_tried[index] = true
		_glow(_cards[index])
		if str(choice.get("result", "")) != "":
			_show_scene(str(choice["result"]))
		_submit_answer(true)
	else:
		_play_consequence(index)

## Yanlış seçimin nazik sonucu: kart hafifçe eğilir, sahne sonucu gösterir, satır okunur;
## ardından sahne geri döner, kart soluklaşır ve yanlış cevap bildirilir.
func _play_consequence(index: int) -> void:
	_busy = true
	_tried[index] = true
	var choice: Dictionary = _choices[index]
	_tilt(_cards[index])
	var result_key: String = str(choice.get("result", ""))
	if result_key != "":
		_show_scene(result_key)
	var voice: String = str(choice.get("result_voice", ""))
	if voice != "":
		await _say_and_wait(voice)
	await _wait(REDUCED_CONSEQUENCE_SECONDS if _reduce_motion() else CONSEQUENCE_SECONDS)
	if result_key != "":
		_show_scene(_scene_key)
	_cards[index].modulate.a = TRIED_ALPHA
	_cards[index].mouse_filter = Control.MOUSE_FILTER_IGNORE
	_busy = false
	_submit_answer(false)

## Satırı okutur ve bitmesini (ya da zaman aşımını) bekler.
func _say_and_wait(id: String) -> void:
	var state: Dictionary = {"done": false}
	var cb: Callable = func(finished_id: String) -> void:
		if finished_id == id:
			state["done"] = true
	var can_wait: bool = narrator.has_signal("line_finished")
	if can_wait:
		narrator.connect("line_finished", cb)
	narrator.say(id)
	var waited: float = 0.0
	while can_wait and not bool(state["done"]) and waited < VOICE_TIMEOUT_SECONDS and is_inside_tree():
		await get_tree().process_frame
		waited += get_process_delta_time()
	if can_wait and is_instance_valid(narrator) and narrator.is_connected("line_finished", cb):
		narrator.disconnect("line_finished", cb)

## Yumuşak "hımm" eğilmesi (sallanma değil, ceza hissi yok).
func _tilt(c: Control) -> void:
	if _reduce_motion() or not is_inside_tree():
		return
	var tw: Tween = c.create_tween()
	tw.tween_property(c, "rotation_degrees", -5.0, 0.2)
	tw.tween_property(c, "rotation_degrees", 0.0, 0.3)

func _correct_index() -> int:
	for i: int in _choices.size():
		if bool(_choices[i]["correct"]):
			return i
	return -1

func show_hint(level: int) -> void:
	if _done or _busy:
		return
	if level == 1:
		if _hint_voice != "":
			narrator.say(_hint_voice)
		_glow(_scene_view)
		_fade_one_wrong()
	elif level >= 2:
		_solve()

## İpucu 1: en az iki denenmemiş yanlış varsa biri soluklaşır (tek yanlış kalınca cevabı vermez).
func _fade_one_wrong() -> void:
	var open: Array[int] = []
	for i: int in _choices.size():
		if not bool(_choices[i]["correct"]) and not _tried[i] and not _faded.has(i):
			open.append(i)
	if open.size() < 2:
		return
	var i: int = open[open.size() - 1]
	_faded[i] = true
	_cards[i].mouse_filter = Control.MOUSE_FILTER_IGNORE
	_cards[i].create_tween().tween_property(_cards[i], "modulate:a", FADED_ALPHA, 0.4)

## İpucu 2: doğru kart parlar ve seçilir.
func _solve() -> void:
	_busy = true
	helped = true
	var idx: int = _correct_index()
	_glow(_cards[idx])
	await _wait(0.6)
	_busy = false
	if _done:
		return
	_tried[idx] = true
	var result_key: String = str(_choices[idx].get("result", ""))
	if result_key != "":
		_show_scene(result_key)
	_submit_answer(true)

# --- Test kancaları ---

func _debug_choose(index: int) -> void:
	_choose(index)

func _debug_correct_index() -> int:
	return _correct_index()

## Doğru kartı ya da denenmemiş ilk yanlış kartı seçer.
func _debug_answer(correct: bool) -> void:
	if correct:
		_choose(_correct_index())
		return
	for i: int in _choices.size():
		if not bool(_choices[i]["correct"]) and not _tried[i]:
			_choose(i)
			return

## Görünen kartların token değerleri (karışık sırayla).
func choice_keys() -> Array[String]:
	var res: Array[String] = []
	for c: Dictionary in _choices:
		res.append(str((c["token"] as Dictionary)["value"]))
	return res

func scene_key() -> String:
	return _shown_key

func is_tried(index: int) -> bool:
	return _tried[index]

func faded_count() -> int:
	return _faded.size()

func choice_views() -> Array[Control]:
	return _cards.duplicate()

func touch_targets() -> Array[Control]:
	var res: Array[Control] = []
	for i: int in _cards.size():
		if not _tried[i] and not _faded.has(i):
			res.append(_cards[i])
	return res

static func validate_params(p: Dictionary) -> Array[String]:
	var errs: Array[String] = []
	var scene: Variant = p.get("scene")
	if not (scene is String) or (scene as String).is_empty():
		errs.append(ContentValidator.msg("err.params.sc_scene"))
	if p.has("hint") and not _non_empty(p["hint"]):
		errs.append(ContentValidator.msg("err.params.sc_hint"))
	var choices: Variant = p.get("choices")
	if not (choices is Array) or (choices as Array).size() < MIN_CHOICES or (choices as Array).size() > MAX_CHOICES:
		errs.append(ContentValidator.msg("err.params.sc_choices"))
		return errs
	var list: Array = choices as Array
	var correct_count: int = 0
	for c: Variant in list:
		if not (c is Dictionary) or not Token.is_valid((c as Dictionary).get("token")) or not ((c as Dictionary).get("correct") is bool):
			errs.append(ContentValidator.msg("err.params.sc_choices"))
			return errs
		var d: Dictionary = c as Dictionary
		if bool(d["correct"]):
			correct_count += 1
		for field: String in ["result", "result_voice"]:
			if d.has(field) and not _non_empty(d[field]):
				errs.append(ContentValidator.msg("err.params.sc_result"))
				return errs
	for i: int in list.size():
		for j: int in range(i + 1, list.size()):
			if Token.same((list[i] as Dictionary)["token"] as Dictionary, (list[j] as Dictionary)["token"] as Dictionary):
				errs.append(ContentValidator.msg("err.params.sc_choices_dup"))
				return errs
	if correct_count != 1:
		errs.append(ContentValidator.msg("err.params.sc_correct"))
	return errs

static func _non_empty(v: Variant) -> bool:
	return v is String and not (v as String).is_empty()
