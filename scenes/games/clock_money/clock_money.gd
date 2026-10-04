extends MiniGame
## Saat ve para (tek şablon, iki mod — bkz. Faz 3a planı K1).
## clock/read: analog saatin gösterdiği zamanı dijital seçeneklerden seç.
## clock/set: akrep ve yelkovanı düğmelerle hedef saate kur, onayla.
## money/count: tepsideki paraların toplamını seç.
## money/pay: cüzdandan küpür ekleyip çıkararak hedef tutarı öde, onayla.
## Rakamlar ve para değerleri yazı tipiyle çizilir; görsellerde rakam yoktur (spec §5.1).

const Widgets: GDScript = preload("res://scenes/games/game_widgets.gd")
const Money: GDScript = preload("res://scripts/core/money.gd")
const ClockTime: GDScript = preload("res://scripts/core/clock_time.gd")
const MODES: PackedStringArray = ["clock", "money"]
const CLOCK_ASKS: PackedStringArray = ["read", "set"]
const MONEY_ASKS: PackedStringArray = ["count", "pay"]
const MIN_CHOICES: int = 2
const MAX_CHOICES: int = 4
const MAX_ITEMS: int = 10
const MAX_WALLET: int = 6
const MAX_TRAY: int = 10
const MAX_AMOUNT: int = 1000
const CLOCK_FACE_KEY: String = "ui.clock_face"

# --- Saat ölçüleri ---
const READ_CENTER: Vector2 = Vector2(960, 432)
const SET_CENTER: Vector2 = Vector2(620, 470)
const CLOCK_RADIUS: float = 270.0
const NUMERAL_FONT: int = 56
const HOUR_HAND: Color = ClayStyle.INK
const MINUTE_HAND: Color = ClayStyle.EMBER
const FACE_COLOR: Color = ClayStyle.IVORY
const RIM_COLOR: Color = ClayStyle.TEAL
const TARGET_RECT: Rect2 = Rect2(1230, 150, 420, 170)
const STEP_SIZE: Vector2 = Vector2(170, 150)
const STEP_ROWS_Y: Array[float] = [380.0, 570.0]
const STEP_LEFT_X: float = 1150.0
const STEP_RIGHT_X: float = 1560.0
const STEP_ICON_RECT: Rect2 = Rect2(1345, 0, 190, 150)
const SET_CHECK_RECT: Rect2 = Rect2(1335, 760, 220, 150)
# --- Para ölçüleri ---
const COUNT_TRAY: Rect2 = Rect2(240, 150, 1440, 560)
const PAY_TRAY: Rect2 = Rect2(240, 320, 1440, 380)
const PAY_TARGET_RECT: Rect2 = Rect2(760, 140, 400, 150)
const PAY_TOTAL_RECT: Rect2 = Rect2(300, 140, 340, 150)
const PAY_CHECK_RECT: Rect2 = Rect2(1440, 140, 220, 150)
const WALLET_Y: float = 735.0
const WALLET_H: float = 170.0
const WALLET_GAP: float = 22.0
const PIECE_GAP: float = 20.0
const RUNNING_H: float = 54.0
const NOTE_SIZE: Vector2 = Vector2(300, 150)
## Madeni para çapı (en küçüğü de ≥128 px dokunma hedefi).
const COIN_DIAMETER: Dictionary = {"kr_1": 128.0, "kr_5": 134.0, "kr_10": 140.0, "kr_25": 148.0, "kr_50": 156.0, "tl_1": 170.0}
## Kod çizimi yer tutucu renkleri: [gövde, kenar]. Değer her zaman yazıyla da yazılır.
const PIECE_COLORS: Dictionary = {
	"kr_1": [Color(0.86, 0.6, 0.38), Color(0.62, 0.4, 0.22)],
	"kr_5": [Color(0.9, 0.72, 0.42), Color(0.66, 0.5, 0.26)],
	"kr_10": [Color(0.95, 0.8, 0.42), Color(0.72, 0.56, 0.24)],
	"kr_25": [Color(0.96, 0.84, 0.48), Color(0.74, 0.6, 0.28)],
	"kr_50": [Color(0.86, 0.87, 0.88), Color(0.6, 0.62, 0.64)],
	"tl_1": [Color(0.96, 0.82, 0.42), Color(0.75, 0.77, 0.79)],
	"tl_5": [Color(0.78, 0.62, 0.8), Color(0.55, 0.4, 0.58)],
	"tl_10": [Color(0.95, 0.6, 0.62), Color(0.7, 0.38, 0.4)],
	"tl_20": [Color(0.6, 0.82, 0.6), Color(0.36, 0.58, 0.38)],
	"tl_50": [Color(0.99, 0.72, 0.45), Color(0.75, 0.48, 0.24)],
	"tl_100": [Color(0.55, 0.72, 0.92), Color(0.32, 0.48, 0.7)],
	"tl_200": [Color(0.9, 0.62, 0.82), Color(0.66, 0.4, 0.6)],
}
const CHOICE_SIZE: Vector2 = Vector2(280, 170)
const CHOICE_GAP: float = 50.0
const CHOICE_Y: float = 745.0
const CHOICE_FONT: int = 72
const AUTO_STEP_SECONDS: float = 0.25

var _mode: String = "clock"
var _ask: String = "read"
var _correct: int = -1
var _choice_labels: Array[String] = []
var _choice_views: Array[Control] = []
var _check: Control = null
# Saat
var _target: Vector2i = Vector2i(12, 0)
var _time: Vector2i = Vector2i(12, 0)
var _minute_step: int = 5
var _center: Vector2 = READ_CENTER
var _hands: Control = null
var _numerals: Dictionary = {}
var _steppers: Array[Control] = []
var _hour_hint: bool = false
var _ghost: bool = false
# Para
var _unit: String = "tl"
var _amount: int = 0
var _pieces: Array[String] = []
var _piece_views: Array[Control] = []
var _running: Array[int] = []
var _running_views: Array[Control] = []
var _wallet: Array[String] = []
var _wallet_views: Array[Control] = []
var _tray: Array[String] = []
var _tray_views: Array[Control] = []
var _total_tile: Control = null
var _hinted_wallet: String = ""
var _hinted_tray: int = -1

func setup(params: Dictionary, difficulty_value: int, context: RoundContext) -> void:
	_init_round(difficulty_value, context)
	_mode = str(params["mode"])
	_ask = str(params["ask"])
	if _mode == "clock":
		_setup_clock(params)
	else:
		_setup_money(params)

## "3.30" biçimi (fmt.clock; dakika iki haneli).
static func time_label(t: Vector2i) -> String:
	return Strings.t("fmt.clock", {"h": str(t.x), "m": "%02d" % t.y})

## "5 TL" / "50 kr" biçimi.
static func money_label(unit: String, n: int) -> String:
	return Strings.t("fmt.money." + unit, {"n": str(n)})

# ================= Saat =================

func _setup_clock(params: Dictionary) -> void:
	_target = Vector2i(int(params["hour"]), int(params["minute"]))
	if _ask == "read":
		_center = READ_CENTER
		_time = _target
		_build_face()
		var times: Array[Vector2i] = []
		for c: Variant in params["choices"] as Array:
			times.append(Vector2i(int((c as Dictionary)["hour"]), int((c as Dictionary)["minute"])))
			_choice_labels.append(time_label(times[-1]))
		_correct = times.find(_target)
		_build_choices()
	else:
		_center = SET_CENTER
		_time = ClockTime.start_time(_target)
		_minute_step = ClockTime.minute_step_for(difficulty, _target.y)
		_build_face()
		var t: Control = Widgets.make_tile(self, time_label(_target), TARGET_RECT, 104, ClayStyle.BUTTER)
		t.mouse_filter = Control.MOUSE_FILTER_IGNORE
		for row: int in 2:
			var hand: String = "hour" if row == 0 else "minute"
			var y: float = STEP_ROWS_Y[row]
			for dir: int in [-1, 1]:
				var x: float = STEP_LEFT_X if dir < 0 else STEP_RIGHT_X
				var b: Control = Widgets.make_tile(self, "−" if dir < 0 else "+", Rect2(Vector2(x, y), STEP_SIZE), 96, ClayStyle.CREAM)
				b.name = "Step_%s_%d" % [hand, dir]
				b.gui_input.connect(_on_step_input.bind(hand, dir, b))
				_steppers.append(b)
			var icon: Control = Control.new()
			icon.mouse_filter = Control.MOUSE_FILTER_IGNORE
			icon.position = Vector2(STEP_ICON_RECT.position.x, y)
			icon.size = STEP_ICON_RECT.size
			icon.draw.connect(_draw_hand_icon.bind(icon, row == 0))
			add_child(icon)
		_check = Widgets.make_check_button(self, SET_CHECK_RECT)
		_check.gui_input.connect(_on_check_input)

## Kil kadran: kenar, çentikler, 1–12 rakamları (yazı tipi), akrep ve yelkovan.
func _build_face() -> void:
	var face: Control = Control.new()
	face.name = "ClockFace"
	face.mouse_filter = Control.MOUSE_FILTER_IGNORE
	face.position = _center - Vector2(CLOCK_RADIUS, CLOCK_RADIUS)
	face.size = Vector2(CLOCK_RADIUS, CLOCK_RADIUS) * 2.0
	face.draw.connect(_draw_face.bind(face))
	add_child(face)
	for h: int in range(1, 13):
		var l: Label = Label.new()
		l.name = "Numeral%d" % h
		l.mouse_filter = Control.MOUSE_FILTER_IGNORE
		l.text = str(h)
		l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		l.add_theme_font_size_override("font_size", NUMERAL_FONT)
		l.add_theme_color_override("font_color", ClayStyle.INK)
		ClayStyle.use_bold(l)
		l.size = Vector2(90, 80)
		var a: float = ClockTime.hour_angle(h, 0)
		var p: Vector2 = _center + Vector2(sin(a), -cos(a)) * CLOCK_RADIUS * 0.64
		l.position = p - l.size / 2.0
		l.pivot_offset = l.size / 2.0
		add_child(l)
		_numerals[h] = l
	_hands = Control.new()
	_hands.name = "Hands"
	_hands.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_hands.size = BASE_SIZE
	_hands.draw.connect(_draw_hands)
	add_child(_hands)

func _draw_face(face: Control) -> void:
	var c: Vector2 = face.size / 2.0
	face.draw_circle(c + Vector2(0, 10), CLOCK_RADIUS, ClayStyle.SHADOW, true, -1.0, true)
	var tex: Texture2D = AssetRegistry.texture(CLOCK_FACE_KEY)
	if tex != null:
		face.draw_texture_rect(tex, Rect2(Vector2.ZERO, face.size), false)
	else:
		face.draw_circle(c, CLOCK_RADIUS, RIM_COLOR, true, -1.0, true)
		face.draw_circle(c, CLOCK_RADIUS - 26.0, FACE_COLOR, true, -1.0, true)
		face.draw_circle(c + Vector2(-60, -70), CLOCK_RADIUS * 0.35, Color(1, 1, 1, 0.25), true, -1.0, true)
	for k: int in 60:
		var a: float = TAU * k / 60.0
		var dir: Vector2 = Vector2(sin(a), -cos(a))
		var r0: float = CLOCK_RADIUS - (58.0 if k % 5 == 0 else 46.0)
		face.draw_line(c + dir * r0, c + dir * (CLOCK_RADIUS - 36.0), ClayStyle.COCOA, 7.0 if k % 5 == 0 else 3.0, true)

func _draw_hands() -> void:
	if _ghost:
		_draw_hand(ClockTime.hour_angle(_target.x, _target.y), CLOCK_RADIUS * 0.5, 26.0, Color(HOUR_HAND, 0.25))
	if _hour_hint:
		_draw_hand(ClockTime.hour_angle(_time.x, _time.y), CLOCK_RADIUS * 0.5, 44.0, Color(ClayStyle.HONEY, 0.8))
	_draw_hand(ClockTime.minute_angle(_time.y), CLOCK_RADIUS * 0.78, 14.0, MINUTE_HAND)
	_draw_hand(ClockTime.hour_angle(_time.x, _time.y), CLOCK_RADIUS * 0.5, 26.0, HOUR_HAND)
	_hands.draw_circle(_center, 22.0, ClayStyle.HONEY, true, -1.0, true)
	_hands.draw_circle(_center, 22.0, ClayStyle.HONEY.darkened(0.35), false, 5.0, true)

func _draw_hand(angle: float, length: float, width: float, color: Color) -> void:
	var tip: Vector2 = _center + Vector2(sin(angle), -cos(angle)) * length
	_hands.draw_line(_center, tip, color, width, true)
	_hands.draw_circle(tip, width / 2.0, color, true, -1.0, true)

## Düğme simgesi: küçük kadran, ilgili ibre koyu (akrep kısa-kalın, yelkovan uzun-ince).
func _draw_hand_icon(icon: Control, hour: bool) -> void:
	var c: Vector2 = icon.size / 2.0
	var r: float = minf(icon.size.x, icon.size.y) * 0.42
	icon.draw_circle(c, r, FACE_COLOR, true, -1.0, true)
	icon.draw_circle(c, r, RIM_COLOR, false, 8.0, true)
	var faint: Color = Color(ClayStyle.INK_SOFT, 0.35)
	if hour:
		icon.draw_line(c, c + Vector2(0, -r * 0.82), faint, 6.0, true)
		icon.draw_line(c, c + Vector2(r * 0.55, 0), HOUR_HAND, 16.0, true)
	else:
		icon.draw_line(c, c + Vector2(r * 0.45, 0), faint, 10.0, true)
		icon.draw_line(c, c + Vector2(0, -r * 0.85), MINUTE_HAND, 9.0, true)
	icon.draw_circle(c, 8.0, ClayStyle.HONEY, true, -1.0, true)

func _on_step_input(event: InputEvent, hand: String, dir: int, b: Control) -> void:
	if is_press(event):
		_step(hand, dir, b)

func _step(hand: String, dir: int, b: Control = null) -> void:
	if not _can_input():
		return
	if b != null:
		_tap_feedback(b)
	if hand == "hour":
		_time = ClockTime.step_hour(_time.x, _time.y, dir)
	else:
		_time = ClockTime.step_minute(_time.x, _time.y, dir * _minute_step)
	_hands.queue_redraw()

# ================= Para =================

func _setup_money(params: Dictionary) -> void:
	_unit = str(params["unit"])
	if _ask == "count":
		for d: Variant in params["items"] as Array:
			_pieces.append(str(d))
		if difficulty <= 1:
			_sort_desc(_pieces)
		else:
			var tmp: Array = _pieces.duplicate()
			Widgets.shuffle(tmp, ctx.rng)
			_pieces.assign(tmp)
		add_child(ClayStyle.make_panel(ClayStyle.tray_box(0.75), COUNT_TRAY))
		_layout_count()
		_amount = Money.total(_unit, _pieces)
		var values: Array[int] = []
		for c: Variant in params["choices"] as Array:
			values.append(int(c))
			_choice_labels.append(money_label(_unit, int(c)))
		_correct = values.find(_amount)
		_build_choices()
	else:
		_amount = int(params["amount"])
		for d: Variant in params["wallet"] as Array:
			_wallet.append(str(d))
		_sort_desc(_wallet)
		var t: Control = Widgets.make_tile(self, money_label(_unit, _amount), PAY_TARGET_RECT, 84, ClayStyle.BUTTER)
		t.mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(ClayStyle.make_panel(ClayStyle.tray_box(0.75), PAY_TRAY))
		if difficulty <= 1:
			_total_tile = Widgets.make_tile(self, money_label(_unit, 0), PAY_TOTAL_RECT, 64, ClayStyle.IVORY)
			_total_tile.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_check = Widgets.make_check_button(self, PAY_CHECK_RECT)
		_check.gui_input.connect(_on_check_input)
		_build_wallet()

func _sort_desc(list: Array[String]) -> void:
	list.sort_custom(func(a: String, b: String) -> bool: return int(Money.KURUS[a]) > int(Money.KURUS[b]))

static func piece_size(d: String) -> Vector2:
	if Money.is_coin(d):
		var dia: float = float(COIN_DIAMETER[d])
		return Vector2(dia, dia)
	return NOTE_SIZE

## Para parçası: görsel varsa doku, yoksa kodla çizilmiş kil para / banknot + değer etiketi.
func _make_piece(d: String, scale_value: float) -> Control:
	var p: Control = Control.new()
	p.name = "Piece_" + d
	p.size = piece_size(d) * scale_value
	p.pivot_offset = p.size / 2.0
	p.draw.connect(_draw_piece.bind(p, d))
	add_child(p)
	var tag: Control = Widgets.make_tile(p, money_label(_unit, Money.value_in(_unit, d)),
		Rect2(Vector2(p.size.x / 2.0 - 70.0, p.size.y / 2.0 - 34.0), Vector2(140, 68)), 34, ClayStyle.IVORY)
	tag.custom_minimum_size = Vector2.ZERO
	tag.size = Vector2(minf(140.0, p.size.x - 16.0), 64)
	tag.position = (p.size - tag.size) / 2.0
	tag.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return p

func _draw_piece(p: Control, d: String) -> void:
	var tex: Texture2D = AssetRegistry.texture(str(Money.IMAGE_KEYS[d]))
	var r: Rect2 = Rect2(Vector2.ZERO, p.size)
	if tex != null:
		p.draw_texture_rect(tex, r, false)
		return
	var colors: Array = PIECE_COLORS[d]
	var body: Color = colors[0]
	var edge: Color = colors[1]
	if Money.is_coin(d):
		var c: Vector2 = p.size / 2.0
		var rad: float = p.size.x / 2.0 - 3.0
		p.draw_circle(c + Vector2(0, 5), rad, ClayStyle.SHADOW, true, -1.0, true)
		p.draw_circle(c, rad, edge, true, -1.0, true)
		p.draw_circle(c, rad * 0.8, body, true, -1.0, true)
		p.draw_circle(c, rad * 0.8, body.darkened(0.15), false, 3.0, true)
	else:
		p.draw_style_box(ClayStyle.plaque_box(body, edge, 18, 4, 6, 8), r)
		var inner: StyleBoxFlat = ClayStyle.soft_box(Color(0, 0, 0, 0), 12)
		inner.draw_center = false
		inner.border_color = Color(edge, 0.7)
		inner.set_border_width_all(4)
		p.draw_style_box(inner, r.grow(-14.0))
		p.draw_circle(Vector2(p.size.x * 0.82, p.size.y * 0.5), p.size.y * 0.2, Color(edge, 0.5), true, -1.0, true)

## Satır satır akış düzeni; sığmazsa ölçek küçülür. Dönüş: her parçanın konumu ve ölçek.
func _flow(denoms: Array[String], area: Rect2, extra_h: float) -> Dictionary:
	for s: float in [1.0, 0.9, 0.8, 0.7, 0.6]:
		var pos: Array[Vector2] = []
		var rows: Array = []
		var x: float = 0.0
		var row: Array[int] = []
		var row_w: Array[float] = []
		for i: int in denoms.size():
			var w: float = piece_size(denoms[i]).x * s
			if not row.is_empty() and x + w > area.size.x - 40.0:
				rows.append(row)
				row_w.append(x - PIECE_GAP)
				row = []
				x = 0.0
			row.append(i)
			x += w + PIECE_GAP
		if not row.is_empty():
			rows.append(row)
			row_w.append(x - PIECE_GAP)
		var heights: Array[float] = []
		var total_h: float = 0.0
		for rw: Variant in rows:
			var h: float = 0.0
			for i: int in rw as Array:
				h = maxf(h, piece_size(denoms[i]).y * s)
			heights.append(h)
			total_h += h + extra_h + PIECE_GAP
		total_h -= PIECE_GAP
		if total_h > area.size.y - 30.0 and s > 0.6:
			continue
		pos.resize(denoms.size())
		var y: float = area.position.y + (area.size.y - total_h) / 2.0
		for k: int in rows.size():
			var xx: float = area.position.x + (area.size.x - row_w[k]) / 2.0
			for i: int in rows[k] as Array:
				var sz: Vector2 = piece_size(denoms[i]) * s
				pos[i] = Vector2(xx, y + (heights[k] - sz.y) / 2.0)
				xx += sz.x + PIECE_GAP
			y += heights[k] + extra_h + PIECE_GAP
		return {"pos": pos, "scale": s}
	return {"pos": [], "scale": 1.0}

func _layout_count() -> void:
	for v: Control in _piece_views:
		v.queue_free()
	for v: Control in _running_views:
		v.queue_free()
	_piece_views.clear()
	_running_views.clear()
	var extra: float = RUNNING_H + 8.0 if not _running.is_empty() else 0.0
	var f: Dictionary = _flow(_pieces, COUNT_TRAY, extra)
	var pos: Array = f["pos"]
	for i: int in _pieces.size():
		var p: Control = _make_piece(_pieces[i], float(f["scale"]))
		p.mouse_filter = Control.MOUSE_FILTER_IGNORE
		p.position = pos[i]
		_piece_views.append(p)
		if i < _running.size():
			var r: Control = Widgets.make_tile(self, str(_running[i]), Rect2(Vector2(p.position.x + p.size.x / 2.0 - 64.0, p.position.y + p.size.y + 6.0), Vector2(128, RUNNING_H)), 36, ClayStyle.BUTTER)
			r.custom_minimum_size = Vector2.ZERO
			r.size = Vector2(128, RUNNING_H)
			r.mouse_filter = Control.MOUSE_FILTER_IGNORE
			_running_views.append(r)

func _build_wallet() -> void:
	var widths: Array[float] = []
	var total: float = 0.0
	for d: String in _wallet:
		var w: float = maxf(piece_size(d).x * 0.85, 128.0) + 24.0
		widths.append(w)
		total += w
	total += WALLET_GAP * (_wallet.size() - 1)
	var x: float = (BASE_SIZE.x - total) / 2.0
	add_child(ClayStyle.make_panel(ClayStyle.tray_box(0.6), Rect2(x - 24.0, WALLET_Y - 14.0, total + 48.0, WALLET_H + 28.0)))
	for i: int in _wallet.size():
		var holder: Control = Control.new()
		holder.name = "Wallet_" + _wallet[i]
		holder.position = Vector2(x, WALLET_Y)
		holder.size = Vector2(widths[i], WALLET_H)
		holder.pivot_offset = holder.size / 2.0
		add_child(holder)
		var p: Control = _make_piece(_wallet[i], 0.85)
		p.mouse_filter = Control.MOUSE_FILTER_IGNORE
		remove_child(p)
		holder.add_child(p)
		p.position = (holder.size - p.size) / 2.0
		holder.gui_input.connect(_on_wallet_input.bind(i))
		_wallet_views.append(holder)
		x += widths[i] + WALLET_GAP

func _layout_tray() -> void:
	for v: Control in _tray_views:
		v.queue_free()
	_tray_views.clear()
	var f: Dictionary = _flow(_tray, PAY_TRAY, 0.0)
	var pos: Array = f["pos"]
	for i: int in _tray.size():
		var p: Control = _make_piece(_tray[i], float(f["scale"]))
		p.position = pos[i]
		p.gui_input.connect(_on_tray_input.bind(i))
		_tray_views.append(p)
	if _total_tile != null:
		_total_tile.set("text", money_label(_unit, tray_total()))

func _on_wallet_input(event: InputEvent, index: int) -> void:
	if is_press(event):
		_add(index)

func _on_tray_input(event: InputEvent, index: int) -> void:
	if is_press(event):
		_remove(index)

func _add(index: int) -> void:
	if not _can_input() or index < 0 or index >= _wallet.size() or _tray.size() >= MAX_TRAY:
		return
	_tap_feedback(_wallet_views[index])
	_tray.append(_wallet[index])
	_sort_desc(_tray)
	_layout_tray()

func _remove(index: int) -> void:
	if not _can_input() or index < 0 or index >= _tray.size():
		return
	audio.play_sfx("sfx.tap")
	_tray.remove_at(index)
	_layout_tray()

func tray_total() -> int:
	return Money.total(_unit, _tray)

# ================= Ortak seçim ve onay =================

func _build_choices() -> void:
	var total: float = _choice_labels.size() * CHOICE_SIZE.x + (_choice_labels.size() - 1) * CHOICE_GAP
	var x0: float = (BASE_SIZE.x - total) / 2.0
	for i: int in _choice_labels.size():
		var t: Control = Widgets.make_tile(self, _choice_labels[i], Rect2(Vector2(x0 + i * (CHOICE_SIZE.x + CHOICE_GAP), CHOICE_Y), CHOICE_SIZE),
			CHOICE_FONT if _choice_labels[i].length() <= 5 else CHOICE_FONT - 16, ClayStyle.PEACH)
		t.name = "Choice%d" % i
		t.gui_input.connect(_on_choice_input.bind(i))
		_choice_views.append(t)

func _on_choice_input(event: InputEvent, index: int) -> void:
	if is_press(event):
		_choose(index)

func _choose(index: int) -> void:
	if not _can_input() or index < 0 or index >= _choice_views.size():
		return
	_tap_feedback(_choice_views[index])
	_submit_answer(index == _correct)

func _on_check_input(event: InputEvent) -> void:
	if is_press(event):
		_check_answer()

## Onay: kurulan saat / tepsideki tutar hedefle karşılaştırılır. Yanlışta durum korunur.
func _check_answer() -> void:
	if not _can_input():
		return
	_tap_feedback(_check)
	_submit_answer(_is_state_correct())

func _is_state_correct() -> bool:
	if _mode == "clock":
		return _time == _target
	return tray_total() == _amount

func show_hint(level: int) -> void:
	if _done or _busy:
		return
	if level == 1:
		_hint_one()
	elif level >= 2:
		_solve()

func _hint_one() -> void:
	match _ask:
		"read":
			_hour_hint = true
			_hands.queue_redraw()
			_glow(_numerals[_time.x])
		"set":
			_ghost = true
			_hands.queue_redraw()
		"count":
			_sort_desc(_pieces)
			_running.clear()
			var s: int = 0
			for d: String in _pieces:
				s += Money.value_in(_unit, d)
				_running.append(s)
			_layout_count()
		"pay":
			var rest: int = _amount - tray_total()
			if rest < 0:
				_hinted_tray = _tray.size() - 1
				for i: int in _tray.size():
					if Money.value_in(_unit, _tray[i]) >= -rest:
						_hinted_tray = i
				_glow(_tray_views[_hinted_tray])
				return
			for i: int in _wallet.size():
				if Money.value_in(_unit, _wallet[i]) <= rest:
					_hinted_wallet = _wallet[i]
					_glow(_wallet_views[i])
					return

## İpucu 2: doğru cevap kurulur / seçilir ve onaylanır.
func _solve() -> void:
	_busy = true
	helped = true
	match _ask:
		"read", "count":
			_glow(_choice_views[_correct])
			await _wait(0.6)
		"set":
			_ghost = true
			_time = _target
			_hands.queue_redraw()
			await _wait(0.6)
		"pay":
			_tray.clear()
			for v: int in _payment():
				for d: String in _wallet:
					if Money.value_in(_unit, d) == v:
						_tray.append(d)
						break
			_layout_tray()
			await _wait(0.6)
	_busy = false
	if _done:
		return
	_submit_answer(true)

## Cüzdanla en az parçalı ödeme (birim değerleri, büyükten küçüğe).
func _payment() -> Array[int]:
	var values: Array[int] = []
	for d: String in _wallet:
		values.append(Money.value_in(_unit, d))
	return Money.min_pieces(_amount, values)

# --- Test kancaları ---

func _debug_choose(index: int) -> void:
	_choose(index)

func _debug_correct_index() -> int:
	return _correct

func _debug_step(hand: String, dir: int) -> void:
	_step(hand, dir)

func _debug_add(wallet_index: int) -> void:
	_add(wallet_index)

func _debug_remove(tray_index: int) -> void:
	_remove(tray_index)

func _debug_check() -> void:
	_check_answer()

## Gerçek girdi yolundan doğru ya da yanlış bir cevap verir.
func _debug_answer(correct: bool) -> void:
	match _ask:
		"read", "count":
			_choose(_correct if correct else (0 if _correct != 0 else 1))
		"set":
			if correct:
				while _time.y != _target.y:
					_step("minute", 1)
				while _time.x != _target.x:
					_step("hour", 1)
			elif _time == _target:
				_step("minute", 1)
			_check_answer()
		"pay":
			if correct:
				while not _tray.is_empty():
					_remove(0)
				for v: int in _payment():
					for i: int in _wallet.size():
						if Money.value_in(_unit, _wallet[i]) == v:
							_add(i)
							break
			elif tray_total() == _amount:
				_add(_wallet.size() - 1)
			_check_answer()

func shown_time() -> Vector2i:
	return _time

func choice_labels() -> Array[String]:
	return _choice_labels.duplicate()

func piece_count() -> int:
	return _pieces.size()

func piece_denoms() -> Array[String]:
	return _pieces.duplicate()

func running_totals() -> Array[int]:
	return _running.duplicate()

func wallet_denoms() -> Array[String]:
	return _wallet.duplicate()

func is_total_shown() -> bool:
	return _total_tile != null

func is_hour_hint_shown() -> bool:
	return _hour_hint

func is_ghost_shown() -> bool:
	return _ghost

func hinted_wallet() -> String:
	return _hinted_wallet

func hinted_tray() -> int:
	return _hinted_tray

func touch_targets() -> Array[Control]:
	var res: Array[Control] = []
	res.append_array(_choice_views)
	res.append_array(_steppers)
	res.append_array(_wallet_views)
	if _check != null:
		res.append(_check)
	return res

# ================= Doğrulama =================

static func validate_params(p: Dictionary) -> Array[String]:
	var errs: Array[String] = []
	var mode: Variant = p.get("mode")
	if not (mode is String) or not MODES.has(mode as String):
		errs.append(ContentValidator.msg("err.params.cm_mode"))
		return errs
	var ask: Variant = p.get("ask")
	var asks: PackedStringArray = CLOCK_ASKS if mode == "clock" else MONEY_ASKS
	if not (ask is String) or not asks.has(ask as String):
		errs.append(ContentValidator.msg("err.params.cm_ask"))
		return errs
	if mode == "clock":
		return _validate_clock(p, ask as String)
	return _validate_money(p, ask as String)

static func _valid_time(h: Variant, m: Variant) -> bool:
	return ContentValidator.is_int_like(h) and int(h) >= 1 and int(h) <= 12 \
		and ContentValidator.is_int_like(m) and int(m) >= 0 and int(m) <= 55 and int(m) % 5 == 0

static func _validate_clock(p: Dictionary, ask: String) -> Array[String]:
	var errs: Array[String] = []
	if not _valid_time(p.get("hour"), p.get("minute")):
		errs.append(ContentValidator.msg("err.params.cm_time"))
		return errs
	if ask == "set":
		return errs
	var choices: Variant = p.get("choices")
	var ok: bool = choices is Array and (choices as Array).size() >= MIN_CHOICES and (choices as Array).size() <= MAX_CHOICES
	var seen: Dictionary = {}
	if ok:
		for c: Variant in choices as Array:
			if not (c is Dictionary) or not _valid_time((c as Dictionary).get("hour"), (c as Dictionary).get("minute")):
				ok = false
				break
			var key: int = int((c as Dictionary)["hour"]) * 100 + int((c as Dictionary)["minute"])
			if seen.has(key):
				ok = false
				break
			seen[key] = true
	if not ok:
		errs.append(ContentValidator.msg("err.params.cm_time_choices"))
	elif not seen.has(int(p["hour"]) * 100 + int(p["minute"])):
		errs.append(ContentValidator.msg("err.params.cm_time_choices_missing"))
	return errs

static func _validate_money(p: Dictionary, ask: String) -> Array[String]:
	var errs: Array[String] = []
	var unit: Variant = p.get("unit")
	if not (unit is String) or not Money.UNITS.has(unit as String):
		errs.append(ContentValidator.msg("err.params.cm_unit"))
		return errs
	var u: String = unit as String
	if ask == "count":
		var items: Variant = p.get("items")
		var ok: bool = items is Array and not (items as Array).is_empty() and (items as Array).size() <= MAX_ITEMS
		if ok:
			for d: Variant in items as Array:
				ok = ok and Money.is_denom(d) and Money.allowed(u, d as String)
		if not ok:
			errs.append(ContentValidator.msg("err.params.cm_items"))
			return errs
		var total: int = Money.total(u, items as Array)
		if total > MAX_AMOUNT:
			errs.append(ContentValidator.msg("err.params.cm_total"))
			return errs
		var choices: Variant = p.get("choices")
		var c_ok: bool = choices is Array and (choices as Array).size() >= MIN_CHOICES and (choices as Array).size() <= MAX_CHOICES
		var seen: Dictionary = {}
		if c_ok:
			for c: Variant in choices as Array:
				if not ContentValidator.is_int_like(c) or int(c) < 0 or int(c) > MAX_AMOUNT or seen.has(int(c)):
					c_ok = false
					break
				seen[int(c)] = true
		if not c_ok:
			errs.append(ContentValidator.msg("err.params.cm_choices"))
		elif not seen.has(total):
			errs.append(ContentValidator.msg("err.params.cm_choices_missing"))
		return errs
	var amount: Variant = p.get("amount")
	if not ContentValidator.is_int_like(amount) or int(amount) < 1 or int(amount) > MAX_AMOUNT:
		errs.append(ContentValidator.msg("err.params.cm_total"))
		return errs
	var wallet: Variant = p.get("wallet")
	var w_ok: bool = wallet is Array and not (wallet as Array).is_empty() and (wallet as Array).size() <= MAX_WALLET
	var values: Array[int] = []
	if w_ok:
		for d: Variant in wallet as Array:
			if not Money.is_denom(d) or not Money.allowed(u, d as String) or values.has(Money.value_in(u, d as String)):
				w_ok = false
				break
			values.append(Money.value_in(u, d as String))
	if not w_ok:
		errs.append(ContentValidator.msg("err.params.cm_wallet"))
		return errs
	var pieces: Array[int] = Money.min_pieces(int(amount), values)
	if pieces.is_empty() or pieces.size() > MAX_TRAY:
		errs.append(ContentValidator.msg("err.params.cm_unpayable"))
	return errs
