extends Control
## Oturum sonu: süre dolduğunda uyuyan Bilge, tekrar dinle ve tek düğme (veli kapısı -> panel).
## Oyun ekranı değildir; AppState kilit koruması burayı yönlendirmez.

const BG_COLOR: Color = Color(0.2, 0.25, 0.45)

var app: Node = AppState
var args: Dictionary = {}

var _parent_button: Button = null

func _ready() -> void:
	var bg: ColorRect = ColorRect.new()
	bg.color = BG_COLOR
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(bg)

	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_preset(Control.PRESET_FULL_RECT)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 48)
	add_child(col)

	var img: Control = (load("res://scenes/components/asset_image.tscn") as PackedScene).instantiate() as Control
	img.set("key", "char.bilge.sleepy")
	img.custom_minimum_size = Vector2(640, 640)
	img.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(img)

	var holder: CenterContainer = CenterContainer.new()
	col.add_child(holder)
	_parent_button = (load("res://scenes/components/big_button.tscn") as PackedScene).instantiate() as Button
	_parent_button.set("text_key", "label.ui.parent")
	_parent_button.set("icon_key", "ui.parent")
	_parent_button.set("clay_color", Color(0.7, 0.78, 0.86))
	_parent_button.custom_minimum_size = Vector2(420, 160)
	_parent_button.pressed.connect(open_parent_gate)
	holder.add_child(_parent_button)

	# Her yönerge tekrar dinlenebilir: sol üstte "tekrar dinle".
	var replay: Button = (load("res://scenes/components/replay_voice_button.tscn") as PackedScene).instantiate() as Button
	replay.set("narrator", app.narrator)
	replay.position = Vector2(24, 24)
	add_child(replay)

	app.narrator.say("vo.genel.uyku_zamani")

func enter(a: Dictionary) -> void:
	args = a

func parent_button() -> Button:
	return _parent_button

func open_parent_gate() -> void:
	app.goto("parent_gate", {"next": {"scene": "parent_panel", "args": {}}, "back": "profile_select"})
