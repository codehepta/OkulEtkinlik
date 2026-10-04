class_name Leitner
## Leitner kartı sistemi: 5 kutu, günlük tekrar programı.

const INTERVALS: Array[int] = [0, 1, 3, 7, 14]

## Kutuyu ilerletir. Maksimum kutu 5'tir.
static func promote(box: int) -> int:
	return mini(box + 1, 5)

## Başarısız olduktan sonra kutu 1'e döner.
static func reset() -> int:
	return 1

## Belirtilen kutu ve bugünün tarihine göre tekrar yapılması gereken günü döner.
## due_day = today + INTERVALS[box-1]
static func due_day(box: int, today: int) -> int:
	var clamped_box: int = clampi(box, 1, 5)
	return today + INTERVALS[clamped_box - 1]

## Kartın bugün tekrar yapılması gerekip gerekmediğini kontrol eder.
## due <= today ise true
static func is_due(due: int, today: int) -> bool:
	return due <= today
