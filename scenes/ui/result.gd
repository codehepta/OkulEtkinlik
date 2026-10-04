extends Control
## Ders sonucu: yıldızlar tek tek gelir, yeni çıkartma varsa görünür; "Devam" ve "Tekrar oyna".

const NarrationWait: GDScript = preload("res://scripts/ui/narration_wait.gd")

const BG_COLOR: Color = ClayStyle.MEADOW
const STICKER_SIZE: Vector2 = Vector2(256, 256)
const STEP_SECONDS: float = 0.5

## Sıra bittiğinde (yıldızlar, ses, çıkartma) yayılır.
signal sequence_finished

var app: Node = AppState
var args: Dictionary = {}

var _continue: Button = null
var _replay: Button = null
var _burst: Control = null
var _sticker: Control = null
var _done: bool = false
var _limit_hit: bool = false

func _ready() -> void:
	app.session_timer.limit_reached.connect(_on_limit_reached)

func _exit_tree() -> void:
	if app != null and app.session_timer.limit_reached.is_connected(_on_limit_reached):
		app.session_timer.limit_reached.disconnect(_on_limit_reached)

## Süre dolunca: animasyon sürüyorsa bitmesi beklenir, sonra session_end.
func _on_limit_reached() -> void:
	_limit_hit = true
	if _done:
		app.goto("session_end")

func enter(a: Dictionary) -> void:
	args = a
	if bool(a.get("time_up", false)):
		app.goto("session_end")
		return
	_build()
	_run()

## Altyazı balonu üstte: alttaki düğmelerle çakışmaz.
func subtitle_placement() -> String:
	return "top"

func continue_button() -> Button:
	return _continue

func replay_button() -> Button:
	return _replay

func is_sequence_done() -> bool:
	return _done

func _run() -> void:
	var stars: int = clampi(int(args.get("stars", 0)), 0, 3)
	await _burst.play(stars)
	if not is_inside_tree():
		return
	if stars > 0:
		await NarrationWait.say(self, app.narrator, "vo.genel.yildiz_%d" % stars)
		if not is_inside_tree():
			return
	var sticker: String = str(args.get("new_sticker", ""))
	if sticker != "":
		_sticker.set("key", sticker)
		_sticker.visible = true
		app.audio.play_sfx("sfx.sticker")
		if not app.reduce_motion():
			_sticker.pivot_offset = STICKER_SIZE / 2.0
			_sticker.scale = Vector2(0.1, 0.1)
			var tw: Tween = create_tween()
			tw.tween_property(_sticker, "scale", Vector2.ONE, 0.4).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		await NarrationWait.say(self, app.narrator, "vo.genel.cikartma")
		if not is_inside_tree():
			return
	_done = true
	sequence_finished.emit()
	if _limit_hit:
		app.goto("session_end")

func _build() -> void:
	var bg: ColorRect = ColorRect.new()
	bg.color = BG_COLOR
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(bg)

	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_preset(Control.PRESET_FULL_RECT)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 40)
	add_child(col)

	_burst = (load("res://scenes/components/star_burst.tscn") as PackedScene).instantiate() as Control
	_burst.set("audio", app.audio)
	_burst.set("reduce_motion", app.reduce_motion())
	_burst.set("step_seconds", STEP_SECONDS * float(app.anim_scale))
	col.add_child(_burst)

	var sticker_row: CenterContainer = CenterContainer.new()
	sticker_row.custom_minimum_size = STICKER_SIZE
	col.add_child(sticker_row)
	_sticker = (load("res://scenes/components/asset_image.tscn") as PackedScene).instantiate() as Control
	sticker_row.add_child(_sticker)
	_sticker.custom_minimum_size = STICKER_SIZE
	_sticker.visible = false

	var row: HBoxContainer = HBoxContainer.new()
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.add_theme_constant_override("separation", 48)
	col.add_child(row)
	_replay = _button("result.replay", "ui.back", ClayStyle.APRICOT)
	_replay.pressed.connect(_on_replay)
	row.add_child(_replay)
	_continue = _button("result.continue", "ui.check", ClayStyle.MINT)
	_continue.pressed.connect(_on_continue)
	row.add_child(_continue)

	var voice: Button = (load("res://scenes/components/replay_voice_button.tscn") as PackedScene).instantiate() as Button
	voice.position = Vector2(24, 24)
	add_child(voice)

func _button(text_key: String, icon_key: String, color: Color) -> Button:
	var b: Button = (load("res://scenes/components/big_button.tscn") as PackedScene).instantiate() as Button
	b.set("text_key", text_key)
	b.set("icon_key", icon_key)
	b.set("clay_color", color)
	b.custom_minimum_size = Vector2(520, 160)
	return b

func _on_continue() -> void:
	app.goto("region_path", {"subject": str(args.get("subject", "")), "highlight": str(args.get("unlocked", ""))})

func _on_replay() -> void:
	app.goto("lesson", {"node_id": str(args.get("node_id", ""))})
