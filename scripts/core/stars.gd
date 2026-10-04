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
