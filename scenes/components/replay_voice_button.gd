extends Button
## "Tekrar dinle" düğmesi: son anlatım satırını yeniden okutur. 128×128, sol üstte.

func _ready() -> void:
	custom_minimum_size = Vector2(128, 128)
	size = Vector2(128, 128)
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	Narrator.replay_last()
