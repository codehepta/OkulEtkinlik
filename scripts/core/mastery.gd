class_name Mastery
## Ustalık derecesi ve zorluk düzeyi hesapları.

## Tek bir deneme için başarı değerini döner.
## attempt 1'den başlar. helped ise yardım alındı demektir.
static func result_value(attempt: int, helped: bool) -> float:
	match attempt:
		1:
			return 1.0
		2:
			return 0.6
		3, _:
			if helped:
				return 0.0
			else:
				return 0.3

## Ustalık derecesini günceller: m = m*0.7 + r*0.3
static func update(m: float, r: float) -> float:
	return m * 0.7 + r * 0.3

## Ustalık derecesine göre zorluk düzeyi düzeltmesi döner.
static func difficulty_adjust(m: float) -> int:
	if m >= 0.8:
		return 1
	elif m <= 0.4:
		return -1
	else:
		return 0

## Temel zorluk ve ustalığa göre oynanan zorluk seviyesini döner.
## clamp(base + adj, 1, 3)
static func played_difficulty(base: int, m: float) -> int:
	var adj: int = difficulty_adjust(m)
	return clampi(base + adj, 1, 3)
