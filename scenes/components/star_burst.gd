extends HBoxContainer
## Sonuç yıldızları: 3 boş yuva, kazanılan yıldızlar tek tek dolar (sfx.star + hafif "pop").

signal finished

const MAX_STARS: int = 3
const STAR_SIZE: Vector2 = Vector2(192, 192)
const POP_SECONDS: float = 0.25

## Testlerde sahte AudioDirector verilir.
var audio: Node = AudioDirector
var reduce_motion: bool = false
## Yıldızlar arası bekleme (sn); testlerde 0.
var step_seconds: float = 0.5

var _slots: Array[Control] = []
var _shown: int = 0

func _ready() -> void:
	alignment = BoxContainer.ALIGNMENT_CENTER
	add_theme_constant_override("separation", 32)
	for i: int in MAX_STARS:
		var slot: Control = (load("res://scenes/components/asset_image.tscn") as PackedScene).instantiate() as Control
		slot.set("key", "ui.star_empty")
		add_child(slot)
		slot.custom_minimum_size = STAR_SIZE
		slot.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_slots.append(slot)

## Dolu yıldız sayısı (testler için).
func shown_count() -> int:
	return _shown

## stars (0–3) yıldızı sırayla gösterir; bitince finished yayılır.
func play(stars: int) -> void:
	for i: int in clampi(stars, 0, MAX_STARS):
		if step_seconds > 0.0 and is_inside_tree():
			await get_tree().create_timer(step_seconds).timeout
		if not is_inside_tree():
			return
		var slot: Control = _slots[i]
		slot.set("key", "ui.star")
		_shown = i + 1
		audio.play_sfx("sfx.star")
		if not reduce_motion:
			slot.pivot_offset = STAR_SIZE / 2.0
			slot.scale = Vector2(0.2, 0.2)
			var tw: Tween = create_tween()
			tw.tween_property(slot, "scale", Vector2.ONE, POP_SECONDS).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	finished.emit()
