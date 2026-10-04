class_name MiniGame
extends Control
## Bütün mini oyun şablonlarının ortak tabanı (spec §4.4).
## Ortak davranış: cevap sonrası kilit, doğru cevap geri bildirimi, RoundResult üretimi.

## Her deneme sonrası.
signal answered(correct: bool)
## Tur bitti.
signal finished(result: RoundResult)

const BASE_SIZE: Vector2 = Vector2(1920, 1080)
const CORRECT_LOCK_SECONDS: float = 0.8
const WRONG_LOCK_SECONDS: float = 0.6
const REDUCED_LOCK_SECONDS: float = 0.3
const POP_SECONDS: float = 0.1
const PRAISE_COUNT: int = 5

## Girdi kilitliyken şablon dokunmaları yok saymalıdır.
var input_locked: bool = false
## Anlatıcı ve ses yöneticisi; testlerde sahte düğümle değiştirilir.
var narrator: Node = Narrator
var audio: Node = AudioDirector

var difficulty: int = 1
var ctx: RoundContext = RoundContext.new()
var attempts: int = 0
var wrong_count: int = 0
var helped: bool = false

var _done: bool = false
var _busy: bool = false
var _lock_gen: int = 0

func setup(_params: Dictionary, _difficulty: int, _ctx: RoundContext) -> void:
	pass

## 1: ipucu, 2: çözümü göster.
func show_hint(_level: int) -> void:
	pass

static func validate_params(_p: Dictionary) -> Array[String]:
	return []

## Girdiyi verilen süre boyunca kilitler, sonra açar.
func _lock_input(seconds: float) -> void:
	input_locked = true
	if not is_inside_tree():
		input_locked = false
		return
	_lock_gen += 1
	var gen: int = _lock_gen
	await get_tree().create_timer(seconds).timeout
	if gen == _lock_gen and not _done:
		input_locked = false

## Ortak başlangıç: parametre dışı durumu saklar.
func _init_round(difficulty_value: int, context: RoundContext) -> void:
	difficulty = difficulty_value
	ctx = context
	attempts = 0
	wrong_count = 0
	helped = false
	_done = false
	_busy = false
	input_locked = false

## Dokunma kabul edilebilir mi?
func _can_input() -> bool:
	return not (input_locked or _busy or _done)

func _reduce_motion() -> bool:
	var settings: Variant = SaveService.data.get("settings", {})
	return settings is Dictionary and bool((settings as Dictionary).get("reduce_motion", false))

## Sol tık ya da dokunma basışı mı?
static func is_press(event: InputEvent) -> bool:
	if event is InputEventMouseButton:
		var mb: InputEventMouseButton = event as InputEventMouseButton
		return mb.pressed and mb.button_index == MOUSE_BUTTON_LEFT
	return event is InputEventScreenTouch and (event as InputEventScreenTouch).pressed

## Dokunma geri bildirimi: ses + 0.1 sn ölçek "pop".
func _tap_feedback(c: Control) -> void:
	audio.play_sfx("sfx.tap")
	if _reduce_motion():
		return
	c.pivot_offset = c.size / 2.0
	var tw: Tween = c.create_tween()
	tw.tween_property(c, "scale", Vector2(1.1, 1.1), POP_SECONDS / 2.0)
	tw.tween_property(c, "scale", Vector2.ONE, POP_SECONDS / 2.0)

## Yumuşak parlama (yanıp sönme yok): hafif büyüme + aydınlanma.
func _glow(c: Control) -> void:
	c.pivot_offset = c.size / 2.0
	var tw: Tween = c.create_tween().set_parallel(true)
	tw.tween_property(c, "modulate", Color(1.25, 1.25, 0.9), 0.4)
	if not _reduce_motion():
		tw.tween_property(c, "scale", Vector2(1.08, 1.08), 0.4)

## Bir cevabı işler: sayaçlar, sinyal, kilit ve (tur bittiyse) övgü + finished.
func _submit_answer(correct: bool, round_done: bool = true) -> void:
	if _done:
		return
	attempts += 1
	if not correct:
		wrong_count += 1
	var finishing: bool = correct and round_done
	if finishing:
		_done = true
	input_locked = true
	_lock_gen += 1
	var gen: int = _lock_gen
	answered.emit(correct)
	if correct:
		audio.play_sfx("sfx.correct")
	if finishing:
		narrator.say("vo.genel.aferin_%d" % ctx.rng.randi_range(1, PRAISE_COUNT))
	var seconds: float = CORRECT_LOCK_SECONDS
	if not correct:
		seconds = REDUCED_LOCK_SECONDS if _reduce_motion() else WRONG_LOCK_SECONDS
	await _wait(seconds)
	if finishing:
		finished.emit(_make_result())
	elif gen == _lock_gen:
		input_locked = false

func _make_result() -> RoundResult:
	var r: RoundResult = RoundResult.new()
	r.attempts = attempts
	r.wrong = wrong_count
	r.helped = helped
	r.outcomes = ctx.outcomes
	return r

func _wait(seconds: float) -> void:
	if is_inside_tree():
		await get_tree().create_timer(seconds).timeout
