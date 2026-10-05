# Faz 3d — 2. Sınıf Matematik İçeriği: Uygulama Planı

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [x]`) syntax for tracking.

**Goal:** 2. sınıf Matematik öğretim programının altı temasını (`docs/curriculum/themes.json` `g2.matematik.t01`–`t06`) Faz 3a/3b şablonlarıyla oynanabilir ünitelere çevirmek; Faz 3b'de bu faza bırakılan `grid` döndürme/büyütme kopyasını (MAT.2.3.4 b) ve 2. sınıf tahmin kontrol adımlarını eklemek.

**Dayanak:** proje dosyası `plans/kalan-fazlar.md` (Faz 3d önerilen seçimleri, asset aralığı 040–049); spec "Açık sorular (Faz 3b)"; `docs/curriculum/outcomes.json` (MEB 2. sınıf Matematik programı, sayfa numaralarıyla).

**Tech Stack:** Godot 4.7.2-stable, GDScript (statik tipli), GUT.

## Kararlar (sahip talimatıyla önerilen seçimler)
- **Ünite = tema:** `content/g2/matematik/uNN.json` ↔ `themes.json` `g2.matematik.tNN`, programdaki sırayla. Her temadaki her öğrenme çıktısı en az bir durakta çalışılır; durak şablonları yalnızca `game_map.json`'da o çıktıya eşlenen şablonlardan seçilir.
- **Döndürme ve büyütme:** yeni şablon değil, `grid` `paint/copy` moduna `transform: rotate | scale` ve `reference`. Döndürmede hedef referansın 90/180/270° döndürülmüş hâllerinden biri, yer serbest; büyütmede her kare 2 × 2 olur.
- **Tahmin kontrol adımları (2. sınıf):** yeni mod eklenmedi; sıvı için bardak, uzunluk için metre çubuğu / santimetre küpü, kütle için kilogramlık ağırlık resimleri `count_choose` tahmin modunda sayılır; çarpma/bölme tahmini `balance` tahmininde tekrarlı toplama olarak yazıldı. `fit` değerleri değişmedi (`partial`): gerçek ölçme etkinliği ev etkinliği olarak kalır.
- **Sayı sesleri:** `vo.sayi.21`–`vo.sayi.100` bu fazda eklendi (1. ve 3. sınıf da kullanır).
- **Ortak görsel anahtarlar:** `item.cisim.*` ve `item.sekil.*` 1. ve 3. sınıfla ortaktır; aynı anahtarı ikinci birleştiren PR yinelenen `label.*` ve asset satırlarını düşer. Çıkartmalar `st.matematik.g2_*` önekini kullanır.
- **Veri (MAT.2.4.1):** program "en çok iki veri grubu" dediği için grafik turları iki kategoriyle yazıldı (bkz. spec "Açık sorular (Faz 3d)").

## Üniteler

| Ünite | Tema (program sayfası) | Çıktılar | Durak | Tur | Şablonlar |
|---|---|---|---|---|---|
| u01 | Nesnelerin Geometrisi (1), s. 72 | MAT.2.3.1–2.3.5 | 8 | 36 | listen_find, drag_match, sort_bins, scenario, grid, count_choose |
| u02 | Sayılar ve Nicelikler (1), s. 51 | MAT.2.1.1–2.1.6 | 9 | 42 | listen_find, drag_match, sort_bins, sequence, pattern, balance, count_choose |
| u03 | İşlemlerden Cebirsel Düşünmeye, s. 66 | MAT.2.2.1–2.2.6 | 9 | 37 | story, balloon_pop, balance, drag_match, sort_bins, listen_find, count_choose |
| u04 | Sayılar ve Nicelikler (2), s. 58 | MAT.2.1.7–2.1.11 | 8 | 36 | fraction_pizza, clock_money, drag_match, sort_bins, scenario, listen_find, count_choose |
| u05 | Nesnelerin Geometrisi (2), s. 77 | MAT.2.3.6–2.3.7 | 4 | 14 | grid, sort_bins, listen_find, count_choose |
| u06 | Veriye Dayalı Araştırma, s. 81 | MAT.2.4.1 | 4 | 11 | chart_build, sort_bins, listen_find |

## Görevler

### Task 1: `grid` döndürme ve büyütme kopyası
- [x] `GridLogic.normalized / rotated / scaled / transform_shapes / matches_transform`.
- [x] `grid` `paint/copy` + `transform` + `reference`; doğrulama: `grid_transform`, `grid_transform_same`, `grid_transform_target`.
- [x] Testler: `test_params_grid` (geçerli/geçersiz örnekler, yardımcılar), `test_play_grid` (`test_paint_copy_rotate_any_place`, `test_paint_copy_scale`). · Commit `feat(games): grid kopyada döndürme ve büyütme (MAT.2.3.4 b)`

### Task 2: Ünite içerikleri
- [x] `content/g2/matematik/u01`–`u06.json` (42 durak, 176 tur); `strings.tr.json` (`node.*`, `label.*`, `txt.*`), `voice_lines.tr.json` (`vo.sayi.21`–`100`, `vo.mat2.*`, `vo.g2.matematik.*`), `stickers.json` (42 çıkartma).
- [x] `game_map.json`: MAT.2.1.2 `listen_find`, MAT.2.2.5 `balance`, MAT.2.3.2 / 2.3.3 `scenario`; MAT.2.1.11, 2.2.5, 2.3.4, 2.3.5 `proposed` kaldırıldı; `matrix.md` yeniden üretildi.
- [x] Test: `tests/unit/test_g2_matematik_content.gd` (ünite = tema, çıktı kapsamı, eşlenen şablonlar, çıkartmalar, sayı sesleri). `ContentValidator` (`test_all_content_valid`) yeşil.

### Task 3: Asset partileri (040–045)
- [x] 040 cisim ve şekiller, 041 nesne ve yapılar, 042 ölçme / simetri / sahneler, 043 çıkartmalar, 044 sayı ve kart sesleri, 045 ünite seslendirmesi. `asset-requests/README.md` durum tablosu güncellendi.

### Task 4: Belgeler
- [x] Spec "Açık sorular (Faz 3b)" kararları ve "Açık sorular (Faz 3d)"; `docs/qa-checklist.md` Faz 3d bölümü.
