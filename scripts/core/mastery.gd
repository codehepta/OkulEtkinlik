class_name Mastery
## Ustalık derecesi ve zorluk düzeyi hesapları. Eşikler `adaptive_config.gd`'dedir.

const Config := preload("res://scripts/core/adaptive_config.gd")

## Tek bir deneme için başarı değerini döner.
## attempt 1'den başlar. helped ise yardım alındı demektir.
static func result_value(attempt: int, helped: bool) -> float:
	var values: Array[float] = Config.RESULT_BY_ATTEMPT
	if attempt <= 1:
		return values[0]
	if attempt == 2:
		return values[1]
	return Config.RESULT_HELPED if helped else values[2]

## Ustalık derecesini günceller: m = m*0.7 + r*0.3
static func update(m: float, r: float) -> float:
	return m * Config.EMA_KEEP + r * (1.0 - Config.EMA_KEEP)

## Ustalık tahmini: 0.0'dan başlayan ortalamanın sapması düzeltilir, m / (1 - 0.7^n).
## Tek kusursuz turdan sonra m = 0.3 olsa da tahmin 1.0'dır. n bilinmiyorsa (eski kayıt) m döner.
static func estimate(m: float, n: int) -> float:
	if n <= 0:
		return m
	return clampf(m / (1.0 - pow(Config.EMA_KEEP, n)), 0.0, 1.0)

## Ustalık tahmini, oynanan tur sayısı ve önceki ayara göre zorluk ayarı (−1, 0, +1).
static func difficulty_adjust(est: float, n: int, prev: int) -> int:
	if n <= 0:
		return Config.COLD_ADJUST
	if est >= Config.UP_AT and n >= Config.MIN_ROUNDS_UP:
		return 1
	if est <= Config.DOWN_AT:
		return -1
	return clampi(prev, -1, 1)

## Taban zorluk ve ayara göre oynanan zorluk: clamp(base + adj, 1, 3).
static func played_difficulty(base: int, adj: int) -> int:
	return clampi(base + adj, Config.MIN_LEVEL, Config.MAX_LEVEL)

## Bir çıktı kaydına ({"mastery", "n", "adj"}) tek turun sonucunu işler.
static func apply_result(rec: Dictionary, r: float) -> void:
	var m: float = update(float(rec.get("mastery", 0.0)), r)
	var n: int = int(rec.get("n", 0)) + 1
	rec["mastery"] = m
	rec["n"] = n
	rec["adj"] = difficulty_adjust(estimate(m, n), n, int(rec.get("adj", 0)))
