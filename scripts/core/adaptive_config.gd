extends RefCounted
## Uyarlanabilir motorun bütün eşikleri tek yerde (spec §3.4, Faz 7b).
## Değerler sahte oyuncu simülasyonuyla seçildi: `tests/integration/test_adaptive_sim.gd`,
## rapor: `godot --headless --path . -s res://tools/adaptive_report.gd`.
## Bir eşiği değiştiren, simülasyon testini ve raporu yeniden çalıştırır.

## Ustalık: m = m * EMA_KEEP + sonuç * (1 - EMA_KEEP).
const EMA_KEEP: float = 0.7
## Deneme başına sonuç değeri: 1., 2., 3. deneme; yardımlı tur 0.0.
const RESULT_BY_ATTEMPT: Array[float] = [1.0, 0.6, 0.3]
const RESULT_HELPED: float = 0.0

## Zorluk ayarı ustalık tahminine (m'nin başlangıç sapması düzeltilmiş hali) bakar.
## Tahmin ≥ UP_AT ve en az MIN_ROUNDS_UP tur oynanmışsa +1; ≤ DOWN_AT ise −1; arada
## önceki ayar korunur (gidip gelmeyi önleyen ölü bölge).
const UP_AT: float = 0.9
const DOWN_AT: float = 0.78
const MIN_ROUNDS_UP: int = 3
## Hiç oynanmamış çıktı içerikteki taban zorlukla başlar.
const COLD_ADJUST: int = 0

## Zorluk seviyesi aralığı.
const MIN_LEVEL: int = 1
const MAX_LEVEL: int = 3

## Yıldız: durağın toplam yanlışı ≤ STAR3_MAX_WRONG → 3, ≤ STAR2_MAX_WRONG → 2, yoksa 1.
const STAR3_MAX_WRONG: int = 1
const STAR2_MAX_WRONG: int = 3

## Leitner kutularının tekrar aralıkları (gün).
const LEITNER_INTERVALS: Array[int] = [0, 1, 3, 7, 14]
