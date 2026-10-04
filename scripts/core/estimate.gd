extends RefCounted
## "Tahmin et → kontrol et → karşılaştır (yakın / uzak)" modunun saf mantığı (Faz 3b).
## count_choose ve balance şablonları kullanır. Tahmin seçimi doğru/yanlış sayılmaz; çocuk
## sonucu sayarak, tartarak ya da işlem yaparak kontrol eder, sonra tahmininin sonuca yakın mı
## uzak mı olduğunu seçer. Yargı sorusunun doğru cevabı tahmin ile sonucun farkından gelir.

const NEAR: int = 0
const FAR: int = 1
const MIN_ESTIMATES: int = 2
const MAX_ESTIMATES: int = 4
## Varsayılan "yakın" sınırı sonucun beşte biri (en az 1).
const TOLERANCE_RATIO: float = 0.2

static func tolerance(actual: int) -> int:
	return maxi(1, roundi(absf(float(actual)) * TOLERANCE_RATIO))

static func is_near(estimate: int, actual: int, tol: int) -> bool:
	return absi(estimate - actual) <= tol

## Yargı kartlarının doğru indeksi: NEAR (yakın) ya da FAR (uzak).
static func judge_index(estimate: int, actual: int, tol: int) -> int:
	return NEAR if is_near(estimate, actual, tol) else FAR

## Tahmin seçenekleri: 2–4 tekrarsız, artan sırada, 0–max_value tam sayı.
static func valid_estimates(v: Variant, max_value: int) -> bool:
	if not (v is Array) or (v as Array).size() < MIN_ESTIMATES or (v as Array).size() > MAX_ESTIMATES:
		return false
	var prev: int = -1
	for e: Variant in v as Array:
		if not ContentValidator.is_int_like(e) or int(e) < 0 or int(e) > max_value or int(e) <= prev:
			return false
		prev = int(e)
	return true

## Seçeneklerden en az biri yakın ve en az biri uzak olmalı; yoksa yargı her zaman aynı çıkar.
static func both_judgements_possible(estimates: Array, actual: int, tol: int) -> bool:
	var near: bool = false
	var far: bool = false
	for e: Variant in estimates:
		if is_near(int(e), actual, tol):
			near = true
		else:
			far = true
	return near and far
