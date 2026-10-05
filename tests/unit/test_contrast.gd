extends GutTest
## Faz 8 erişilebilirlik denetimi: metin renkleri arka planlarıyla WCAG 2.2 AA kontrastını
## sağlar. Çocuk ekranlarındaki metin en az 32 px (büyük metin, eşik 3:1) olsa da hedef
## gövde metni eşiği 4.5:1'dir. Yeni bir metin/zemin çifti eklenince buraya yazılır.

const AA: float = 4.5

## Göreli parlaklık (WCAG 2.x).
static func luminance(c: Color) -> float:
	var ch: Array[float] = [c.r, c.g, c.b]
	var lin: Array[float] = []
	for v: float in ch:
		lin.append(v / 12.92 if v <= 0.04045 else pow((v + 0.055) / 1.055, 2.4))
	return 0.2126 * lin[0] + 0.7152 * lin[1] + 0.0722 * lin[2]

static func ratio(a: Color, b: Color) -> float:
	var la: float = luminance(a)
	var lb: float = luminance(b)
	return (maxf(la, lb) + 0.05) / (minf(la, lb) + 0.05)

## Yarı saydam rengi zemin üstünde birleştirir.
static func over(fg: Color, bg: Color) -> Color:
	return Color(lerpf(bg.r, fg.r, fg.a), lerpf(bg.g, fg.g, fg.a), lerpf(bg.b, fg.b, fg.a))

func test_ratio_reference_values() -> void:
	assert_almost_eq(ratio(Color.BLACK, Color.WHITE), 21.0, 0.01)
	assert_almost_eq(ratio(Color.WHITE, Color.WHITE), 1.0, 0.001)

## Kil düğme, karo ve panel dolguları üzerindeki koyu mürekkep (INK).
func test_ink_on_every_clay_fill() -> void:
	var fills: Dictionary = {
		"CREAM": ClayStyle.CREAM, "APRICOT": ClayStyle.APRICOT, "MINT": ClayStyle.MINT,
		"SKY": ClayStyle.SKY, "HONEY": ClayStyle.HONEY, "ROSE": ClayStyle.ROSE,
		"PAPER": ClayStyle.PAPER, "MEADOW": ClayStyle.MEADOW, "BUTTER": ClayStyle.BUTTER,
		"CARAMEL": ClayStyle.CARAMEL, "IVORY": ClayStyle.IVORY, "SAND": ClayStyle.SAND,
		"PEACH": ClayStyle.PEACH, "TANGERINE": ClayStyle.TANGERINE, "EMBER": ClayStyle.EMBER,
		"TEAL": ClayStyle.TEAL, "WARM_TOP": ClayStyle.WARM_TOP, "WARM_BOTTOM": ClayStyle.WARM_BOTTOM,
		"DAY_TOP": ClayStyle.DAY_TOP, "DAY_BOTTOM": ClayStyle.DAY_BOTTOM,
	}
	for k: String in fills:
		assert_gte(ratio(ClayStyle.INK, fills[k]), AA, "INK / %s" % k)

## Başlık mürekkebi (açılış, albüm) sıcak zeminlerde.
func test_title_ink_on_warm_backgrounds() -> void:
	for bg: Color in [ClayStyle.WARM_TOP, ClayStyle.WARM_BOTTOM, ClayStyle.CREAM, ClayStyle.PAPER, ClayStyle.BUTTER]:
		assert_gte(ratio(ClayStyle.TITLE_INK, bg), AA, "TITLE_INK / %s" % bg)

## Veli paneli: ikincil başlık ve uyarı metni kâğıt zeminde.
func test_parent_panel_secondary_text() -> void:
	for bg: Color in [ClayStyle.PAPER, ClayStyle.CREAM, ClayStyle.IVORY]:
		assert_gte(ratio(ClayStyle.INK_SOFT, bg), AA, "INK_SOFT / %s" % bg)
		assert_gte(ratio(ClayStyle.ALERT, bg), AA, "ALERT / %s" % bg)

## Altyazı balonu yarı saydamdır: en açık zeminde (beyaz) bile okunur kalmalı.
func test_subtitle_bubble_over_lightest_background() -> void:
	for bg: Color in [Color.WHITE, ClayStyle.IVORY, ClayStyle.DAY_TOP]:
		assert_gte(ratio(ClayStyle.BUBBLE_TEXT, over(ClayStyle.BUBBLE_BG, bg)), AA, "altyazı / %s" % bg)
