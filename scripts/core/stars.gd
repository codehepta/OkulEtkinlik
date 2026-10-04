class_name Stars
## Yıldız puanı hesaplama: toplam yanlış cevaplara göre.

## Toplam yanlış cevaplarına göre yıldız sayısını döner.
## 0-1 yanlış → 3 yıldız
## 2-3 yanlış → 2 yıldız
## 4+ yanlış → 1 yıldız
static func compute(total_wrong: int) -> int:
	if total_wrong <= 1:
		return 3
	elif total_wrong <= 3:
		return 2
	else:
		return 1

## Bir turun yıldız hesabına giren yanlış sayısı. Çok adımlı turlarda (sequence, pattern,
## drag_match, chart_build ...) tur başına en çok 1 yanlış sayılır (Faz 3b, S7).
static func round_wrong(wrong: int, multi_step: bool) -> int:
	return mini(wrong, 1) if multi_step else wrong
