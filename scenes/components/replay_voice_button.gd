extends Button
## "Tekrar dinle" düğmesi: son anlatım satırını yeniden okutur. 128×128, sol üstte.

## Satırı yeniden okutacak anlatıcı; boşsa Narrator autoload'u (ekranlar app.narrator atayabilir).
var narrator: Node = null

func _ready() -> void:
	custom_minimum_size = Vector2(128, 128)
	size = Vector2(128, 128)
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	var n: Node = narrator if narrator != null else Narrator
	n.replay_last()
