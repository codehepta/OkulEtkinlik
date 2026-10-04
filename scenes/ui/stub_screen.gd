extends Control
## GEÇİCİ YER TUTUCU ekran (Görev 14–15 gerçek ekranlarla değiştirir): enter() argümanı saklar.

var app: Node = null
var args: Dictionary = {}

func enter(a: Dictionary) -> void:
	args = a
