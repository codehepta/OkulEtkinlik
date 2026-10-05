# Faz 7b — Uyarlanabilir Zorluk İnce Ayarı: Uygulama Planı

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [x]`) syntax for tracking.

**Goal:** Spec §3.4'teki ilk zorluk kuralını bütün içerik (328 durak, 1258 tur) üzerinde sahte oyuncu simülasyonuyla ölçmek, sorunlarını düzeltmek ve bütün eşikleri tek bir yapılandırma dosyasında toplamak.

**Dayanak:** proje dosyası `plans/kalan-fazlar.md` (Faz 7b, önerilen seçim: "ince ayar sahte oyuncu simülasyonuyla (GUT entegrasyon testi) yapılır; eşikler tek bir yapılandırma dosyasında toplanır"); spec §3.4, §8 Faz 7.

**Tech Stack:** Godot 4.7.2-stable, GDScript (statik tipli), GUT.

## Eski kuralın ölçülen sorunları
Simülasyon (`tools/adaptive_report.gd`, 8 tohum, 1.→3. sınıf bütün dersler) eski kuralla:
1. **Soğuk başlangıç:** Ustalık 0.0'dan başladığı için her yeni çıktı −1 ile açılıyordu; güçlü oyuncu turların %35'ini tabanın altında oynuyordu (ortalama seviye farkı +0.02, yani hiç zorlanmıyordu).
2. **Yavaş tepki:** Tek kusursuz turdan sonra m = 0.3 (≤ 0.4, hâlâ −1); +1 için aynı çıktıda 5 kusursuz tur gerekiyordu, çoğu çıktı o kadar tur görmüyor.
3. **Durak içi tepki yok:** Ustalık yalnızca durak sonunda kaydedildiği için zorlanan çocuk aynı durağın sonraki turlarında rahatlamıyordu.
4. **Gidip gelme riski:** Ölü bölge olmadığı için eşik çevresindeki ustalık her turda seviyeyi değiştirebiliyordu.

## Görevler
- [x] **1. Yapılandırma dosyası:** `scripts/core/adaptive_config.gd` (ustalık ortalaması, deneme sonuç değerleri, zorluk eşikleri, yıldız eşikleri, Leitner aralıkları). `Mastery`, `Stars`, `Leitner` buradan okur.
- [x] **2. Ustalık tahmini ve ölü bölge:** `Mastery.estimate`, `Mastery.difficulty_adjust(tahmin, n, önceki)`, `Mastery.apply_result`. Test: `tests/unit/test_mastery.gd`.
- [x] **3. Kayıt:** çıktı kaydına `n` (tur sayısı) ve `adj` (güncel ayar); `Progress.outcome_record`; `SaveSchema` tamsayı alanları. Test: `tests/unit/test_progress.gd`.
- [x] **4. Durak içi canlı ayar:** `LessonRunner` her turdan sonra kaydın kopyasını günceller, sonraki turun zorluğu buna göre seçilir; kalıcı kayıt durak sonunda aynı hesapla yazılır. Test: `tests/integration/test_lesson_runner.gd`.
- [x] **5. Simülasyon:** `tools/adaptive_sim.gd` (pakete girmez), GUT entegrasyon testi `tests/integration/test_adaptive_sim.gd`, rapor `tools/adaptive_report.gd`.
- [x] **6. Belgeler:** spec §3.4 ve "Açık sorular (Faz 7b)", `docs/qa-checklist.md` Faz 7b.

## Kararlar
- Ustalık tahmini m / (1 − 0.7ⁿ) (başlangıç sapması düzeltmesi). Eski kayıtta `n` yoksa ham m kullanılır.
- Hiç oynanmamış çıktı tabanla başlar (`COLD_ADJUST = 0`). İçerikte çoğu çıktının ilk turu zaten taban 1'dedir; simülasyonda −1 ile başlamak zorlanan oyuncuya ölçülebilir fayda sağlamadı.
- +1 için tahmin ≥ 0.9 ve en az 3 tur; −1 için tahmin ≤ 0.78; arada önceki ayar korunur. "Yavaş yüksel, hızlı düş": yardımlı tek tur bile seviyeyi düşürebilir.
- Ayar turun ilk çıktısına bakar (spec'teki gibi); birden çok çıktılı turlarda bütün çıktıların kaydı güncellenir.
- Ustalık formülü, sonuç değerleri, yıldız ve Leitner kuralları değişmedi; yalnızca yapılandırma dosyasına taşındı.
- Veli panelindeki ustalık çubuğu ham m'yi gösterir.

## Simülasyon sonucu (8 tohum)
| kural | oyuncu | ilk deneme | çözüm | seviye farkı | taban altı | taban üstü | 3 yıldız | 1 yıldız |
|---|---|---|---|---|---|---|---|---|
| yeni | güçlü | 0.93 | 0.00 | +0.43 | 0.03 | 0.46 | 0.98 | 0.00 |
| yeni | orta | 0.81 | 0.00 | +0.27 | 0.13 | 0.41 | 0.77 | 0.01 |
| yeni | zorlanan | 0.65 | 0.02 | −0.07 | 0.35 | 0.28 | 0.46 | 0.15 |
| eski | güçlü | 0.97 | 0.00 | +0.02 | 0.35 | 0.37 | 0.99 | 0.00 |
| eski | orta | 0.86 | 0.00 | −0.01 | 0.35 | 0.34 | 0.87 | 0.00 |
| eski | zorlanan | 0.66 | 0.02 | −0.11 | 0.36 | 0.25 | 0.52 | 0.13 |

Okuma: güçlü oyuncu artık tabanın üstünde zorlanıyor, orta oyuncunun ilk deneme başarısı akış bölgesinde (%72–90) kalıyor, zorlanan oyuncu tabanın üstüne itilmiyor ve çözüm gösterilen tur oranı değişmedi. Zorlanan profilin 1 yıldız oranı oyuncu modelinin sınırıdır: en kolay seviyede bile ilk deneme başarısı %60 varsayıldı.
