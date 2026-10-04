extends RefCounted
## Türk lirası küpürleri ve para hesapları (saf; clock_money şablonu kullanır).
## Değerler içerikte birim cinsinden yazılır: unit "tl" → lira, unit "kr" → kuruş.

const UNITS: PackedStringArray = ["tl", "kr"]
## Küpür -> kuruş cinsinden değer. Görsel anahtarı: item.para.<küpür>.
## 1 kuruş tedavülde neredeyse olmadığı için listede yok (Faz 3b, S3).
const KURUS: Dictionary = {
	"kr_5": 5, "kr_10": 10, "kr_25": 25, "kr_50": 50, "tl_1": 100,
	"tl_5": 500, "tl_10": 1000, "tl_20": 2000, "tl_50": 5000, "tl_100": 10000, "tl_200": 20000,
}
## Madeni paralar; geri kalanı banknot.
const COINS: PackedStringArray = ["kr_5", "kr_10", "kr_25", "kr_50", "tl_1"]
## Görsel anahtarları (eksik asset taramasının bulabilmesi için açık yazılır).
const IMAGE_KEYS: Dictionary = {
	"kr_5": "item.para.kr_5", "kr_10": "item.para.kr_10",
	"kr_25": "item.para.kr_25", "kr_50": "item.para.kr_50", "tl_1": "item.para.tl_1",
	"tl_5": "item.para.tl_5", "tl_10": "item.para.tl_10", "tl_20": "item.para.tl_20",
	"tl_50": "item.para.tl_50", "tl_100": "item.para.tl_100", "tl_200": "item.para.tl_200",
}

static func is_denom(d: Variant) -> bool:
	return d is String and KURUS.has(d as String)

static func is_coin(d: String) -> bool:
	return COINS.has(d)

## Küpür bu birimde kullanılabilir mi? tl: yalnızca lira küpürleri; kr: kuruşlar ve 1 lira (100 kuruş).
static func allowed(unit: String, d: String) -> bool:
	if not KURUS.has(d):
		return false
	if unit == "tl":
		return d.begins_with("tl_")
	return d.begins_with("kr_") or d == "tl_1"

## Küpürün birim cinsinden değeri.
static func value_in(unit: String, d: String) -> int:
	var k: int = int(KURUS[d])
	return k / 100 if unit == "tl" else k

static func total(unit: String, items: Array) -> int:
	var s: int = 0
	for d: Variant in items:
		s += value_in(unit, str(d))
	return s

## Tutarı verilen değerlerle (sınırsız adet) en az parçayla öder; büyükten küçüğe değer listesi.
## Ödenemiyorsa boş dizi döner (amount 0 ise de boş).
static func min_pieces(amount: int, values: Array[int]) -> Array[int]:
	if amount <= 0:
		return []
	var inf: int = amount + 1
	var best: PackedInt32Array = PackedInt32Array()
	var last: PackedInt32Array = PackedInt32Array()
	best.resize(amount + 1)
	last.resize(amount + 1)
	best.fill(inf)
	last.fill(0)
	best[0] = 0
	for a: int in range(1, amount + 1):
		for v: int in values:
			if v > 0 and v <= a and best[a - v] + 1 < best[a]:
				best[a] = best[a - v] + 1
				last[a] = v
	if best[amount] >= inf:
		return []
	var res: Array[int] = []
	var rest: int = amount
	while rest > 0:
		res.append(last[rest])
		rest -= last[rest]
	res.sort()
	res.reverse()
	return res
