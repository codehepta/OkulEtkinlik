extends Control
## Açılış ekranı: logo + hoş geldin sesi; ardından profil yoksa ProfileCreate, varsa ProfileSelect.

var app: Node = AppState

@onready var _title: Label = $Title as Label

func _ready() -> void:
	_title.text = Strings.t("app.title")
	app.adopt_scene("splash", self)
	app.narrator.say("vo.genel.hosgeldin")
	await get_tree().create_timer(app.splash_delay).timeout
	if not is_inside_tree():
		return
	if app.progress.profiles().is_empty():
		app.goto("profile_create")
	else:
		app.goto("profile_select")
