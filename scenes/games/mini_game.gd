class_name MiniGame
extends Control
## Bütün mini oyun şablonlarının ortak tabanı (spec §4.4).

## Her deneme sonrası.
signal answered(correct: bool)
## Tur bitti.
signal finished(result: RoundResult)

## Girdi kilitliyken şablon dokunmaları yok saymalıdır.
var input_locked: bool = false

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
	await get_tree().create_timer(seconds).timeout
	input_locked = false
