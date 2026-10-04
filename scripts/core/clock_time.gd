extends RefCounted
## Analog saat hesapları (saf; clock_money şablonu kullanır). Saat 1–12, dakika 0–59.

const MINUTES_PER_TURN: int = 720
## Zorluğa göre yelkovan adımı (dakika): 1 → yarım saat, 2 → çeyrek, 3 → 5 dakika.
const STEP_BY_DIFFICULTY: Dictionary = {1: 30, 2: 15, 3: 5}

## Yelkovan açısı (radyan, saat 12 yönünden saat yönünde).
static func minute_angle(minute: int) -> float:
	return TAU * minute / 60.0

## Akrep açısı: dakikayla birlikte ilerler (gerçek saat gibi).
static func hour_angle(hour: int, minute: int) -> float:
	return TAU * ((hour % 12) + minute / 60.0) / 12.0

## Yelkovanı delta dakika döndürür; 60'ı geçince saat ilerler. Dönüş: (saat 1–12, dakika).
static func step_minute(hour: int, minute: int, delta: int) -> Vector2i:
	var t: int = posmod((hour % 12) * 60 + minute + delta, MINUTES_PER_TURN)
	return _from_total(t)

## Akrebi bir saat ileri / geri alır, dakika değişmez.
static func step_hour(hour: int, minute: int, dir: int) -> Vector2i:
	return _from_total(posmod((hour % 12) * 60 + minute + dir * 60, MINUTES_PER_TURN))

static func _from_total(t: int) -> Vector2i:
	var h: int = t / 60
	return Vector2i(12 if h == 0 else h, t % 60)

## Hedef dakikaya ulaşılabilen yelkovan adımı: zorluk adımı uymuyorsa 15, o da uymuyorsa 5.
static func minute_step_for(difficulty: int, target_minute: int) -> int:
	var base: int = int(STEP_BY_DIFFICULTY.get(clampi(difficulty, 1, 3), 5))
	for s: int in [base, 15, 5]:
		if s <= base and target_minute % s == 0:
			return s
	return 5

## Saat kurma başlangıcı: 12.00; hedef zaten 12.00 ise 3.00.
static func start_time(target: Vector2i) -> Vector2i:
	return Vector2i(3, 0) if target == Vector2i(12, 0) else Vector2i(12, 0)
