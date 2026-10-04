extends RefCounted
## "Tahmin et → kontrol et → karşılaştır" modunun ortak görsel parçaları (Faz 3b): tahmin karoları,
## "yakın / uzak" yargı kartları ve fark ipucu. Mantık `scripts/core/estimate.gd`'dedir; adım
## sırasını şablon (count_choose, balance) yönetir. Paylaşılan tip değil, `preload` ile kullanılır.

const Widgets: GDScript = preload("res://scenes/games/game_widgets.gd")
const Estimate: GDScript = preload("res://scripts/core/estimate.gd")
const ESTIMATE_COLOR: Color = ClayStyle.SKY
const RESULT_COLOR: Color = ClayStyle.MINT
const JUDGE_COLOR: Color = ClayStyle.BUTTER
const JUDGE_SIZE: Vector2 = Vector2(300, 190)
const JUDGE_FONT: int = 56
const JUDGE_ICON_H: float = 64.0
const JUDGE_KEYS: Array[String] = ["est.near", "est.far"]
## Kontrol ve yargı adımlarının yönergeleri (şablon adım değişince okur).
const VOICE_COUNT: String = "vo.tahmin.say"
const VOICE_WEIGH: String = "vo.tahmin.tart"
const VOICE_CALC: String = "vo.tahmin.islem"
const VOICE_JUDGE: String = "vo.tahmin.karsilastir"

## Tahmin karosu: "≈N" (fmt.estimate).
static func estimate_text(value: int) -> String:
	return Strings.t("fmt.estimate", {"n": str(value)})

static func make_estimate_tile(parent: Control, value: int, rect: Rect2, font: int = 84) -> Control:
	return Widgets.make_tile(parent, estimate_text(value), rect, font, ESTIMATE_COLOR)

## Satır halinde tahmin karoları (ortalanmış).
static func make_estimate_row(parent: Control, estimates: Array[int], y: float, tile: Vector2, gap: float) -> Array[Control]:
	var res: Array[Control] = []
	var total: float = estimates.size() * tile.x + (estimates.size() - 1) * gap
	var x0: float = (MiniGame.BASE_SIZE.x - total) / 2.0
	for i: int in estimates.size():
		var font: int = 84 if estimates[i] < 100 else 64
		var t: Control = make_estimate_tile(parent, estimates[i], Rect2(Vector2(x0 + i * (tile.x + gap), y), tile), font)
		t.name = "Estimate%d" % i
		res.append(t)
	return res

## "yakın" ve "uzak" kartları; üstlerinde iki kil nokta (yakın: bitişik, uzak: araları açık) ikonu
## vardır, sözcük okunamasa da anlam şekilden gelir. center_x çevresinde yan yana dizilir.
static func make_judge_cards(parent: Control, center_x: float, y: float, gap: float = 40.0) -> Array[Control]:
	var res: Array[Control] = []
	var x0: float = center_x - JUDGE_SIZE.x - gap / 2.0
	for i: int in 2:
		var t: Control = Widgets.make_tile(parent, Strings.t(JUDGE_KEYS[i]), Rect2(Vector2(x0 + i * (JUDGE_SIZE.x + gap), y), JUDGE_SIZE), JUDGE_FONT, JUDGE_COLOR)
		t.name = "Judge%d" % i
		var label: Control = t.get_node_or_null("Label") as Control
		if label != null:
			label.offset_top = JUDGE_ICON_H
		var icon: Control = Control.new()
		icon.name = "JudgeIcon"
		icon.mouse_filter = Control.MOUSE_FILTER_IGNORE
		icon.position = Vector2(0, 16)
		icon.size = Vector2(JUDGE_SIZE.x, JUDGE_ICON_H)
		var far: bool = i == Estimate.FAR
		icon.draw.connect(func() -> void:
			var c: Vector2 = Vector2(icon.size.x / 2.0, icon.size.y / 2.0)
			var half: float = 100.0 if far else 22.0
			if far:
				icon.draw_dashed_line(c - Vector2(half - 24.0, 0), c + Vector2(half - 24.0, 0), ClayStyle.COCOA, 5.0, 12.0)
			icon.draw_circle(c - Vector2(half, 0), 20.0, ESTIMATE_COLOR.darkened(0.25), true, -1.0, true)
			icon.draw_circle(c + Vector2(half, 0), 20.0, RESULT_COLOR.darkened(0.25), true, -1.0, true))
		t.add_child(icon)
		res.append(t)
	return res

## Fark ipucu karosu: |tahmin − sonuç|, iki kartın üstünde.
static func make_diff_tile(parent: Control, estimate: int, actual: int, rect: Rect2) -> Control:
	var t: Control = Widgets.make_tile(parent, str(absi(estimate - actual)), rect, 72, ClayStyle.IVORY)
	t.name = "DiffHint"
	t.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return t
