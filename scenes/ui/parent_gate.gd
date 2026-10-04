extends Control
## Veli kapısı: çarpım sorusu + 0-9 tuş takımı. Doğru cevapta args.next'e geçilir.
## Yanlışta ceza ya da kilit yok; yeni soru gelir.

const BG_COLOR: Color = Color(0.31, 0.7, 0.53)
const KEY_SIZE: Vector2 = Vector2(144, 144)
const MAX_DIGITS: int = 4

var app: Node = AppState
var args: Dictionary = {}
## Testlerde sabit tohumla değiştirilebilir.
var rng: RandomNumberGenerator = RandomNumberGenerator.new()

var _question: Dictionary = {}
var _count: int = 0
var _typed: String = ""
var _question_label: Label = null
var _typed_label: Label = null
var _hint_label: Label = null
var _digits: Dictionary = {}
var _back: Button = null

func _ready() -> void:
	rng.randomize()
	_build()
	_new_question()
	app.narrator.say("vo.genel.veli_cagir")

func enter(a: Dictionary) -> void:
	args = a

func question() -> Dictionary:
	return _question

func question_count() -> int:
	return _count

func typed() -> String:
	return _typed

func digit_button(d: int) -> Button:
	return _digits[d] as Button

func back_button() -> Button:
	return _back

## Testler ve kurulum için soruyu sabitler.
func set_question(q: Dictionary) -> void:
	_question = q
	_count += 1
	_typed = ""
	_refresh()

func press_digit(d: int) -> void:
	if _typed.length() < MAX_DIGITS:
		_typed += str(d)
		_refresh()

func backspace() -> void:
	if not _typed.is_empty():
		_typed = _typed.substr(0, _typed.length() - 1)
		_refresh()

func submit() -> void:
	if ParentGateQuiz.check(_question, _typed):
		var next: Dictionary = args.get("next", {}) as Dictionary
		app.goto(str(next.get("scene", "profile_select")), next.get("args", {}) as Dictionary)
		return
	_new_question()
	_hint_label.text = Strings.t("gate.wrong")

func _new_question() -> void:
	set_question(ParentGateQuiz.generate(rng))
	if _hint_label != null:
		_hint_label.text = ""

func _refresh() -> void:
	if _question_label != null:
		_question_label.text = str(_question.get("text", ""))
		_typed_label.text = _typed if not _typed.is_empty() else "_"

func _build() -> void:
	var bg: ColorRect = ColorRect.new()
	bg.color = BG_COLOR
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(bg)

	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_preset(Control.PRESET_FULL_RECT)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 24)
	add_child(col)

	_question_label = _label(64)
	col.add_child(_question_label)
	_typed_label = _label(96)
	col.add_child(_typed_label)
	_hint_label = _label(40)
	col.add_child(_hint_label)

	var grid: GridContainer = GridContainer.new()
	grid.columns = 5
	grid.add_theme_constant_override("h_separation", 16)
	grid.add_theme_constant_override("v_separation", 16)
	var holder: CenterContainer = CenterContainer.new()
	holder.add_child(grid)
	col.add_child(holder)
	for d: int in [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]:
		var b: Button = _key(str(d))
		b.pressed.connect(press_digit.bind(d))
		grid.add_child(b)
		_digits[d] = b

	var row: HBoxContainer = HBoxContainer.new()
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.add_theme_constant_override("separation", 24)
	col.add_child(row)
	var del: Button = _big("gate.delete", Color(0.96, 0.78, 0.55))
	del.pressed.connect(backspace)
	row.add_child(del)
	var ok: Button = _big("profile.confirm", Color(0.55, 0.85, 0.6))
	ok.pressed.connect(submit)
	row.add_child(ok)

	_back = _big("map.back", Color(0.7, 0.78, 0.86))
	_back.set_anchors_preset(Control.PRESET_TOP_LEFT)
	_back.position = Vector2(24, 24)
	_back.pressed.connect(func() -> void: app.goto(str(args.get("back", "profile_select"))))
	add_child(_back)

func _label(font_size: int) -> Label:
	var l: Label = Label.new()
	l.add_theme_font_size_override("font_size", font_size)
	l.add_theme_color_override("font_color", Color(0.15, 0.1, 0.05))
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	return l

func _key(text: String) -> Button:
	var b: Button = Button.new()
	b.text = text
	b.custom_minimum_size = KEY_SIZE
	b.focus_mode = Control.FOCUS_NONE
	b.add_theme_font_size_override("font_size", 64)
	return b

func _big(text_key: String, color: Color) -> Button:
	var b: Button = (load("res://scenes/components/big_button.tscn") as PackedScene).instantiate() as Button
	b.set("text_key", text_key)
	b.set("clay_color", color)
	b.custom_minimum_size = Vector2(320, 144)
	return b
