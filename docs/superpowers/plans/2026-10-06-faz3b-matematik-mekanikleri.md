# Faz 3b — Matematik İçin Yeni Mekanikler: Uygulama Planı

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [x]`) syntax for tracking.

**Goal:** Faz 2 matrisinin önerdiği mekanikleri (`compare_groups`, `estimate_then_count`, `grid_path`, `grid_draw`, `free_build`, `chart_build`) şablon ya da mod olarak yazmak, PR #8'in açık sorularını (S1–S7) önerilen seçimlerle uygulamak, spec §3.7'yi ve `game_map.json`'u güncellemek. Ünite içeriği bu planın kapsamı dışındadır (Faz 3c–3e).

**Dayanak:** spec "Açık sorular (Faz 1)" ilk madde, "Açık sorular (Faz 2)" (a) ve `trace` maddesi; Faz 3a planı S1–S7; `docs/curriculum/game_map.json` `proposed` alanları; proje dosyası `plans/kalan-fazlar.md` (Faz 3b önerilen seçimleri).

**Tech Stack:** Godot 4.7.2-stable, GDScript (statik tipli), GUT.

## Global Constraints

Faz 3a planının bütün kısıtları geçerlidir (dokunma hedefi ≥128 px, renk tek başına anlam taşımaz, yanıp sönme yok, süre baskısı yok, görsellerde rakam yok, kodda sabit metin yok). Ek olarak:
- Yeni mekanikler mümkün olduğunca **mevcut şablonun modu** olur; yalnızca `grid` ve `chart_build` yeni şablondur (§3.7 #15, #16).
- Tahmin seçimi **doğru/yanlış sayılmaz**; cevap ve ustalık yalnızca kontrol (işlemli tahminde) ve yargı adımından gelir.
- Asset partisi numaraları: 011–014 (bu görev bloğu).

## Dosya haritası

| Dosya | Sorumluluk |
|---|---|
| `scripts/core/round_context.gd` | `grade` (düğüm kimliğinden; LessonRunner doldurur) |
| `scripts/core/round_result.gd`, `scripts/core/stars.gd`, `autoload/progress.gd` | `multi_step`, `Stars.round_wrong` (S7) |
| `scenes/games/mini_game.gd` | `_is_multi_step()` (sequence, pattern, drag_match, chart_build true; balance işlemli tahminde true) |
| `scripts/core/estimate.gd` | Tahmin modunun saf mantığı (yakınlık sınırı, yargı, doğrulama) |
| `scenes/games/estimate_flow.gd` | Tahmin karoları, "yakın / uzak" kartları, fark ipucu |
| `scenes/games/count_choose/count_choose.gd` | Tahmin modu: dokunarak sayma |
| `scenes/games/balance/balance.gd` | 1. sınıf sözcük kartları (S1), bire bir eşleme ipucu, tahmin modu (tartma, işlem) |
| `scenes/components/digit_input.gd` | Rakam karosu girişi (ortak bileşen) |
| `scenes/games/listen_find/listen_find.gd` | Yazma modu (`answer: digits`) |
| `scenes/games/clock_money/clock_money.gd`, `scripts/core/money.gd` | S2 (1. sınıf sesli saat), S3 (1 kuruş yok) |
| `scenes/games/grid/grid.{gd,tscn}` | Yeni şablon: yol ve boyama modları |
| `scenes/games/chart_build/chart_build.{gd,tscn}` | Yeni şablon: çetele, tablo, nesne/nokta grafiği + sorular |
| `content/strings.tr.json`, `content/voice_lines.tr.json` | `err.params.est_* / grid_* / chart_* / write_target`, `fmt.estimate`, `est.*`, `bal.word.*`; `vo.tahmin.*`, `vo.saat.*` |
| `docs/curriculum/game_map.json`, `matrix.md`, `tools/curriculum/curriculum_check.gd` | Eşleme güncellemesi, 16 şablon |
| `tests/fixtures/faz3b/*.json`, `tools/ui_screenshots.gd` | Örnek params ve ekran görüntüsü kareleri |
| `asset-requests/011-*.md`, `012-*.md` | Grid görselleri, Faz 3b seslendirmesi |

## Görevler

### Task 1: Ortak altyapı
- [x] `RoundContext.grade` + `LessonRunner.grade_of(node_id)`; `RoundResult.multi_step`, `MiniGame._is_multi_step()`, `Stars.round_wrong()` ve `Progress.record_node` (S7). Testler: `test_stars`, `test_progress` (`test_record_node_multi_step_round_counts_one_wrong`), `test_lesson_runner` (`test_grade_of_node_id`). · Commit `feat(core): …`

### Task 2: `balance` karşılaştırma (compare_groups, S1, S5)
- [x] 1. sınıfta seçenekler "daha az / eşit / daha çok" sözcük kartı; üstünde ağır kefeyi gösteren minik terazi ikonu (ağır kefede ağırlık topu). 2. sınıftan itibaren `<`, `=`, `>`.
- [x] `item` gruplarında ipucu 1: iki kefedeki nesneler bire bir çizgiyle eşlenir, eşi olmayanlar parlar (terazi eğilmez).
- Testler: `test_balance_compare_words_in_grade_one`, `test_balance_compare_items_pairing_hint`.

### Task 3: Tahmin modu (estimate_then_count)
**Akış:** tahmin (2–4 artan `estimates`, cevap sayılmaz) → kontrol → yargı ("yakın" / "uzak" kartları, iki kil nokta ikonu). Yakınlık sınırı `near` (yoksa sonucun beşte biri, en az 1). Doğrulama: seçenekler arasında en az bir yakın ve bir uzak tahmin olmalı.
- [x] `count_choose` + `estimates`: nesneler dağınık dizilir (onluk dizilişe geçmez), kontrol adımında her nesneye dokunulur, sıra numarası rozeti ve `vo.sayi.N`; sayaç karosu. Yargı ipucu 1: fark karosu. İpucu 2: bütün adımları tamamlar.
- [x] `balance` `ask: estimate`:
  - `item` + `value` (1–15): sol kefede nesne, sağ kefeye "+" düğmesiyle birim küp eklenir, terazi her küpte yeniden eğilir, dengelenince yargı. Küp eklemek cevap sayılmaz.
  - `left` / `right` + tek `null` + `choices` (missing kuralları): zihinden işlem sonucu seçilir (cevap), terazi dengelenir, sonra yargı. Çok adımlı tur.
- Testler: `tests/unit/test_estimate.gd`, `tests/integration/test_play_estimate.gd`.

### Task 4: Rakam karosu girişi
- [x] `scenes/components/digit_input.gd`: basamak sayısı kadar yuva + 0–9 karoları (2 × 5); karo sıradaki boş yuvayı doldurur, dolu yuvaya dokunmak boşaltır. Cevabı şablonun onay düğmesi denetler; eksik yuvayla onay cevap sayılmaz, yanlışta rakamlar kalır (K4).
- [x] `listen_find` `answer: digits`: hedef sayı (0–9999) seslendirilir, çocuk yazar. İpucu 1: uyuşmayan ilk yuva ve gereken karo parlar. İpucu 2: sayı yazılır ve onaylanır.
- Testler: `tests/integration/test_play_digit_input.gd`.

### Task 5: S2, S3
- [x] S2: `clock_money` 1. sınıfta dijital gösterim yok. `read`: seçenekler hoparlörlü karo; dokununca saat okunur (`vo.saat.<h>_<mm>`) ve seçilir (karo kalkar, kesik çerçeve), onay düğmesi denetler. `set`: hedef karoda yazı yok, dokununca hedef okunur. Ses satırları tam ve yarım saatler için (24).
- [x] S3: `kr_1` küpürlerden çıktı (`Money`, çizim renkleri, 010 partisi).
- Testler: `test_clock_read_grade_one_voice_choices`, `test_clock_set_grade_one_target_by_voice`, `test_one_kurus_removed`.

### Task 6: `grid` şablonu (§3.7 #15)
- [x] `mode: path` — `ask: build` (ok kartlarından program kur, oynat; duvar/kenar ya da hedef dışı bitiş yanlış, karakter başa döner, program korunur; `shortest: true` en kısa programı ister) ve `ask: follow` (verilen programın bitiş karesine dokun). `arrows: relative` (ileri, sola dön, sağa dön) ya da `absolute` (yukarı, aşağı, sol, sağ). Hedef BFS ile ulaşılabilir olmalı.
- [x] `mode: paint` — `copy`, `symmetry` (dikey eksen, verilen yarı kilitli), `code` (yön + adım kodu), `silhouette` ve `pieces` (free_build'in denetlenebilir hedefleri: silüeti eşle, tam N bitişik kare). Onay düğmesiyle denetlenir.
- Zorluk: yol kurmada 1 → program izi; boyamada 1 → sayaç. Döndürme / büyütme (MAT.2.3.4 b) yok.
- Testler: `tests/unit/test_params_grid.gd`, `tests/integration/test_play_grid.gd`.

### Task 7: `chart_build` şablonu (§3.7 #16)
- [x] `kind`: `tally` (beşli çetele), `table` (sıklık tablosu), `object` (nesne grafiği), `dot` (nokta grafiği). 2–4 kategori, sayılar 1–8, toplam 3–15. Kurma: nesne kendi kategorisine sürüklenir (yanlış kategori yanlış cevap). Sorular (1–3, her biri kendi ses satırıyla): `most`, `least`, `count`, `diff`, `total`. Çok adımlı tur.
- Testler: `tests/unit/test_params_chart_build.gd`, `tests/integration/test_play_chart_build.gd`.

### Task 8: Eşleme, spec, asset, QA
- [x] `game_map.json`: `compare_groups`, `grid_path`, `grid_draw`, `free_build`, `chart_build` önerileri gerçek şablonlara taşındı; kontrol adımı olmayan tahmin çıktıları ve döndürme `proposed` olarak kaldı. `matrix.md` yeniden üretildi; `curriculum_check` 16 şablonu tanır.
- [x] Spec §3.7 (#15, #16, şablon modları), açık sorulara "Karar" satırları, "Açık sorular (Faz 3b)".
- [x] `asset-requests/011-grid-gorselleri.md`, `012-faz3b-seslendirme.md`, README durum tablosu; 010'da 1 kuruş iptal.
- [x] `tools/ui_screenshots.gd` kareleri, `docs/qa-checklist.md` Faz 3b bölümü.

## Kararlar (sahip onayıyla önerilen seçimler)

- **K1 — `compare_groups` ayrı şablon değil:** `balance` `scale/compare` + `item` (1–10 nesne). MAT.1.1.4 bununla eşlenir.
- **K2 — Tahmin ortak bir moddur** (`count_choose`, `balance`); ayrı şablon yok. Tahmin seçimi cevap sayılmaz (doğru tahmin yoktur); yargı ("yakın / uzak") doğru/yanlışlıdır.
- **K3 — Yakınlık sınırı** varsayılan olarak sonucun %20'si (en az 1); içerik `near` ile değiştirebilir. Yargının her iki cevabı da mümkün olmalı (doğrulama).
- **K4 — Tahmin modunda sayma dokunarak yapılır** ve hata üretmez: sayma "kontrol"dür, ölçülen beceri tahmin ile sonucu karşılaştırmaktır.
- **K5 — `grid` tek şablon, iki mod** (`path`, `paint`); `free_build` `paint/silhouette` ve `paint/pieces` ile denetlenebilir hedef alır, ustalık hesabına girer. Döndürme/büyütme ilk sürümde yok.
- **K6 — `chart_build` yeni şablon**; kurma adımı sürükle-bırak (sınıflandırma), sorular kapalı seçenekli.
- **K7 — Rakam karosu girişi** ortak bileşendir; ilk kullanım `listen_find` yazma modu. 1. sınıfta rakam yazımı `trace` (Faz 4a) ile kalır.
- **K8 — S1:** 1. sınıf sözcük kartı + ikon, 2. sınıftan sembol. Sınıf, içeriğin düğüm kimliğinden (`g<N>.`) gelir; profil sınıfı değil.
- **K9 — S2:** `fmt.clock` "3.30" kalır; 1. sınıfta dijital saat yok (sesli seçenek ve hedef).
- **K10 — S3:** 1 kuruş yok. **S4:** oyuncak para (renk ipucu, portre ve rakam yok). **S6:** `balloon_pop` yalnızca işlem.
- **K11 — S7:** çok adımlı turlar yıldızda tur başına en çok 1 yanlış sayılır; ustalık (deneme sayısı) değişmez.

## Açık sorular

Spec "Açık sorular (Faz 3b)" bölümünde: tahmin modunun diğer kontrol adımları (doldurma, cetvel, saat, çevre, çarpma/bölme, 20'den büyük çokluk) ve `grid` döndürme/büyütme.
