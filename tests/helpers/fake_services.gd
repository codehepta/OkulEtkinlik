extends Node
## Testler için sahte Narrator/AudioDirector: çağrıları kaydeder, hiçbir ses çalmaz.

var said: Array[String] = []
var sfx: Array[String] = []

func say(id: String) -> void:
	said.append(id)

func play_sfx(key: String) -> void:
	sfx.append(key)
