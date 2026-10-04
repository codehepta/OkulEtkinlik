extends Control
# Açılış ekranı.

@onready var _title: Label = $Title


func _ready() -> void:
	_title.text = Strings.t("app.title")
