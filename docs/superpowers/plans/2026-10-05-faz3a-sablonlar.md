# Faz 3a — Altı Yeni Mini Oyun Şablonu: Uygulama Planı

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [x]`) syntax for tracking.

**Goal:** Spec §8 Faz 3'ün şablon kısmı: `sequence`, `balloon_pop`, `pattern`, `balance`, `clock_money`, `fraction_pizza` şablonlarını `MiniGame` sözleşmesiyle (spec §4.4) yazmak, `TemplateRegistry`'ye kaydetmek ve her birini `validate_params` + doğru/yanlış/ipucu testleriyle kapsamak. Ünite içeriği bu planın kapsamı dışındadır (Faz 2 matrisi bitince yazılır).

**Architecture:** Her şablon `scenes/games/<id>/<id>.{gd,tscn}` altında bağımsız bir sahnedir ve `MiniGame`'i genişletir. Ortak cevap / kilit / övgü / `RoundResult` akışı `MiniGame._submit_answer` üzerinden gider; şablonlar kayda ve ilerlemeye dokunmaz. Şablonlar arası küçük ortak çizim ve düzen yardımcıları `scenes/games/game_widgets.gd` (sınıfsız, `preload` ile) içindedir. Para ve saat gibi alan bilgisi saf ve sahnesiz olarak `scripts/core/` altında durur (`money.gd`, `clock_time.gd`) ve birim testlidir. Görseller çoğunlukla kodla kil görünümünde çizilir; asset geldiğinde (para, pizza, saat kadranı) doku kullanılır, yoksa kod çizimi yer tutucudur (spec §4.5).

**Tech Stack:** Godot 4.7.2-stable, GDScript (statik tipli), GUT.

**Spec:** `docs/superpowers/specs/2026-10-04-bilgi-adasi-design.md` (§2, §3.3, §3.5, §3.7, §4.4, §4.5, §4.9, §5.1, §7). Ayrıca `CLAUDE.md`, `docs/assets/naming.md`, `docs/assets/style-guide.md`.

## Global Constraints

- Faz 1 planındaki bütün genel kısıtlar geçerlidir (statik tipli GDScript, 1920×1080 taban, kodda Türkçe sabit metin yok, ağ yok, atıf satırı yok).
- **Dokunma hedefleri ≥128×128 px.** Her şablonun testinde dokunulabilir öğelerin boyutu denetlenir.
- **Renk tek başına anlam taşımaz:** seçili / doğru / ipucu durumları şekil, kenar, konum ya da işaretle de gösterilir. `pattern` şablonunda iki farklı hücre yalnızca renkle ayrılamaz (doğrulama hatası).
- **Yanıp sönme yok.** Parlama `MiniGame._glow` (yavaş, tek yönlü) ile yapılır. `reduce_motion` açıkken salınım ve zıplama kapanır.
- **Süre baskısı yok:** hiçbir şablonda zamanlayıcıya bağlı başarısızlık, kaçan / kaybolan hedef yok.
- **Görsellerde metin / rakam yok:** rakam, kesir, saat ve para değerleri Andika yazı tipiyle kil karolar üzerine çizilir.
- Rakam dışındaki gösterim biçimleri (saat "3.30", "5 TL") `strings.tr.json` içindeki biçim anahtarlarından gelir (`fmt.clock`, `fmt.money.tl`, `fmt.money.kr`).
- Spec dosyası bu dalda **düzenlenmez** (Faz 2 dalı spec sonuna ekleme yapıyor). Kararlar ve açık sorular bu planda ve PR açıklamasında kalır.
- `content/g*/` ve `docs/curriculum/*` dosyalarına dokunulmaz. Test örnekleri `tests/fixtures/` altında.

## Review Focus

1. **Tur asla takılı kalmamalı:** her şablonda 3. yanlıştan sonra `show_hint(2)` turu bitirir (`helped = true`, `finished` yayılır), çok adımlı şablonlarda (sequence, pattern) kalan bütün adımlar otomatik tamamlanır. Test: her şablonun `..._hint2_...` / `..._hints` testleri (her mod), `test_*_debug_answer_paths`, `test_faz3_three_wrong_hint_and_requeue` (LessonRunner).
2. **Doğrulamadan geçen her params oynanabilir olmalı:** ulaşılamayan cevap (ör. saat kurmada dakika adımına uymayan hedef, cüzdanla ödenemeyen tutar, çözümsüz terazi) doğrulamada reddedilmeli ya da şablon adımı uyarlamalı. Test: `test_clock_set_reachable_for_every_difficulty`, `test_money_pay_unpayable_rejected`, `test_balance_missing_negative_rejected`.
3. **Kilit ve çift dokunma:** geri bildirim sırasında gelen dokunmalar yok sayılır; "onayla" düğmeli şablonlarda (saat kur, para öde, pizza seç) art arda basış tek cevap sayılır. Test: `test_check_button_double_press_counts_once`.
4. **Balon oyununda süre baskısı yok:** balonlar ekran içinde kalır, zamanla kaybolmaz; sahnede `Timer` yok. Test: `test_balloons_stay_on_screen_and_never_expire`.
5. **Renk tek başına anlam taşımıyor:** `pattern` doğrulaması yalnızca renkle ayrılan hücreleri reddeder. Test: `test_pattern_color_only_rejected`.

---

## Dosya haritası

| Dosya | Sorumluluk |
|---|---|
| `scenes/games/game_widgets.gd` | Ortak yardımcılar: kil karo, onay düğmesi, karıştırma, şekil çizimi, kesik kenarlı yuva |
| `scripts/core/money.gd` | Türk lirası küpürleri, birim dönüşümü, toplam, ödenebilirlik (DP) |
| `scripts/core/clock_time.gd` | Saat/dakika açıları, adım ilerletme, biçimleme yardımcıları |
| `scenes/games/sequence/sequence.{gd,tscn}` | Kartları sıraya dizme |
| `scenes/games/balloon_pop/balloon_pop.{gd,tscn}` | Doğru cevaplı balonu patlatma |
| `scenes/games/pattern/pattern.{gd,tscn}` | Şekil ve sayı örüntüsü tamamlama |
| `scenes/games/balance/balance.{gd,tscn}` | Terazi (karşılaştırma, eksik değer) ve sayı doğrusu (bul, yerleştir) |
| `scenes/games/clock_money/clock_money.{gd,tscn}` | Saat oku / kur, para say / öde |
| `scenes/games/fraction_pizza/fraction_pizza.{gd,tscn}` | Bütünü eş parçalara bölme, parça seçme |
| `scripts/core/template_registry.gd` | Altı yeni kayıt |
| `content/strings.tr.json` | `err.params.*` doğrulama mesajları, `fmt.*` biçimleri |
| `tests/unit/test_params_faz3.gd` | Altı şablonun `validate_params` testleri |
| `tests/unit/test_money.gd`, `tests/unit/test_clock_time.gd` | Saf mantık testleri |
| `tests/helpers/template_harness.gd` | Oyun testleri için ortak kurulum (sahte Narrator/Audio, sinyal kaydı) |
| `tests/integration/test_play_<id>.gd` | Şablon başına oynanış testleri |
| `tests/integration/test_faz3_runner.gd` | LessonRunner ile altı şablonun ipucu / çözüm / yeniden sorma akışı |
| `tests/fixtures/faz3/params.json` | Örnek params (testler ve ekran görüntüsü aracı) |
| `tests/fixtures/lesson_faz3/g1/matematik/u01.json` | Runner testi için fixture ünite |
| `tools/ui_screenshots.gd` | Yeni şablon kareleri |
| `asset-requests/010-faz3-sablonlar.md` | Para, pizza, saat kadranı görselleri |
| `docs/qa-checklist.md` | Altı şablon için manuel kontrol adımları |

## Ortak test arayüzü

Her yeni şablon, gerçek dokunmayla aynı kod yolunu kullanan şu test kancalarını sunar:

- `func _debug_answer(correct: bool) -> void` — bir sonraki adım için doğru ya da yanlış bir cevabı gerçek girdi yolundan verir (onaylı şablonlarda durumu kurar ve onaylar).
- Şablona özgü kancalar (`_debug_choose`, `_debug_drop`, `_debug_step`, `_debug_toggle`, `_debug_check` ...) aşağıda görevlerde.
- `func touch_targets() -> Array[Control]` — dokunulabilir öğeler (boyut testi için).

---

### Task 1: Ortak yardımcılar ve test altyapısı

**Files:**
- Create: `scenes/games/game_widgets.gd`, `tests/helpers/template_harness.gd`, `tests/fixtures/faz3/params.json`
- Test: `tests/unit/test_params_faz3.gd` (ilk test: altı kimlik `TemplateRegistry.has` → başta FAIL)

**Interfaces:**
- `game_widgets.gd` (statik): `make_tile(parent, text, rect, font_size, color) -> Control`, `make_check_button(parent, rect) -> Control` (nane yeşili kil karo + `ui.check` ikonu; ikon yoksa kodla çizilmiş onay işareti), `shuffle(a: Array, rng) -> void`, `draw_shape(ci, shape, rect, color)` (circle, square, triangle, star, heart, diamond), `draw_well(ci, rect)`.
- `template_harness.gd`: `make(id, params, difficulty = 1, seed = 7) -> MiniGame`, `answers: Array[bool]`, `results: Array[RoundResult]`.

- [x] **Step 1:** Kayıt testini yaz (`test_faz3_templates_registered`): altı kimlik kayıtlı, sahne ve betik yüklenir. → FAIL
- [x] **Step 2:** Yardımcıları yaz. Commit: `feat(games): faz 3 şablonları için ortak yardımcılar ve test düzeni`

### Task 2: `sequence` — kartları sıraya diz

**Mekanik:** Üstte `n` boş yuva (aralarında yön oku), altta karışık kartlar. Kart doğru yuvaya bırakılınca yerine oturur (`answered(true)`); yanlış yuvaya bırakılınca geri seker (`answered(false)`); yuva dışına bırakma cevap sayılmaz. Bütün yuvalar dolunca `finished`.

**params:**
```json
{ "items": [Token, ...] }
```
- `items`: 3–6 geçerli token, **doğru sırayla**, tekrarsız (`Token.same`).

**difficulty:** 1 → ilk ve (n ≥ 4 ise) son kart yerinde başlar; 2 → yalnızca ilk kart yerinde; 3 → hiçbiri. Kartlar her zaman karışık; karışım doğru sırayla aynı çıkarsa bir kaydırılır.

**İpucu 1:** en soldaki boş yuva ve ona ait kart parlar. **İpucu 2:** kalan kartlar sırayla yerine oturur, her biri `answered(true)`; son kartta `finished` (`helped`).

**Spec kullanımları:** sayı dizisi (number token), hikâye olayları ve yaşam döngüsü (item token).

**Test kancaları:** `_debug_drop(card: int, slot: int)`, `_debug_card_for_slot(slot: int) -> int`, `open_slots() -> Array[int]`.

**Testler:** `test_sequence_valid`, `test_sequence_invalid` (2 öğe, 7 öğe, yinelenen, bozuk token), `test_sequence_correct_drops_finish`, `test_sequence_wrong_slot_bounces_and_answers_false`, `test_sequence_drop_outside_is_not_an_answer`, `test_sequence_difficulty_prefills_anchors`, `test_sequence_hint1_glows_next_slot`, `test_sequence_hint2_completes_all`.

- [x] Step 1: params testleri → FAIL · Step 2: oyun testleri → FAIL · Step 3: uygula → PASS · Step 4: Commit `feat(games): sequence şablonu`

### Task 3: `balloon_pop` — doğru cevaplı balonu patlat

**Mekanik:** Üst plakette işlem (`a + b = ?` / `a − b = ?`), altta cevap rakamlı kil balonlar. Balonlar yerinde hafifçe salınır; **kaçmaz, kaybolmaz, zamanlayıcı yok.** Doğru balon yumuşakça patlar (`sfx.balloon_pop`), yanlış balon hafifçe sallanır ve yerinde kalır.

**params:**
```json
{ "a": 7, "op": "+", "b": 5, "choices": [11, 12, 13, 14] }
```
- `a`, `b`: 0–1000 tam sayı; `op`: `"+"` ya da `"-"`; sonuç 0–1000 (çıkarmada `a ≥ b`).
- `choices`: 2–6 tekrarsız tam sayı (0–1000), sonucu içerir.

**difficulty:** görünen balon sayısı 1 → en çok 3, 2 → en çok 4, 3 → hepsi. Seçilen yanlışlar `choices` sırasından alınır (yazar en yakın çeldiriciyi öne koyar), balon yerleri karışıktır.

**İpucu 1:** `a` ve `b` 20'yi geçmiyorsa somut model: toplama için `a` daire + `b` kare; çıkarma için `a` daire, son `b` tanesinin üstü çizili (şekil + işaret, renk tek başına değil). Daha büyük sayılarda yanlış balonların yarısı soluklaşır. **İpucu 2:** doğru balon parlar ve patlar.

**Spec kullanımları:** toplama / çıkarma pratiği.

**Test kancaları:** `_debug_choose(i)`, `_debug_correct_index()`, `balloon_rects() -> Array[Rect2]`.

**Testler:** `test_balloon_pop_valid`, `test_balloon_pop_invalid` (negatif sonuç, choices'ta sonuç yok, 7 seçenek, bilinmeyen op), `test_balloon_correct_pops_and_finishes`, `test_balloon_wrong_stays`, `test_balloon_difficulty_limits_count`, `test_balloons_stay_on_screen_and_never_expire`, `test_balloon_hint1_model_or_fade`, `test_balloon_hint2_pops_correct`.

- [x] Step 1–4 (TDD) · Commit `feat(games): balloon_pop şablonu`

### Task 4: `pattern` — örüntüyü tamamla

**Mekanik:** Üstte bir sıra hücre; sondaki `k` hücre boş ("?"). Çocuk alttaki seçeneklerden sıradaki boş hücreye uyanı seçer; boşluklar soldan sağa dolar. Hepsi dolunca `finished`.

**params (iki tür):**
```json
{ "kind": "repeat", "unit": [Cell, ...], "length": 9 }
{ "kind": "number", "start": 2, "step": 2, "length": 6 }
```
- `Cell`: `{"shape": "circle|square|triangle|star|heart|diamond", "color": "red|blue|yellow|green|purple|orange"}` ya da `{"type": "item", "value": "<asset key>"}`.
- `repeat`: `unit` 2–4 hücre, en az iki farklı hücre; **iki farklı şekil hücresi yalnızca renkle ayrılamaz** (aynı şekil + farklı renk → hata). `length`: `2 × unit + 1` ile 12 arası.
- `number`: `start` 0–1000, `step` sıfırdan farklı, |step| ≤ 100, `length` 4–10; bütün terimler 0–1000.

**difficulty:** boş hücre sayısı 1 → 1, 2 → 2, 3 → 3; görünen kısım `repeat`'te en az iki tam birim, `number`'da en az 3 terim kalacak şekilde kırpılır.

**Seçenekler:** `repeat` → birimdeki farklı hücreler (2–4), her boşlukta aynı set. `number` → her boşluk için doğru terim + `v + step` + `v ± 1` (0–1000 içinde, tekrarsız, 3 seçenek), karışık.

**İpucu 1:** `repeat` → ilk birim parlar ve altına birim çerçevesi çizilir; `number` → görünen terimler arasına adım karoları (`+2`) çıkar. **İpucu 2:** kalan boşluklar sırayla otomatik dolar.

**Spec kullanımları:** şekil örüntüleri, sayı örüntüleri (ritmik sayma).

**Test kancaları:** `_debug_choose(i)`, `_debug_correct_index()`, `blank_count()`, `choice_count()`.

**Testler:** `test_pattern_valid`, `test_pattern_invalid`, `test_pattern_color_only_rejected`, `test_pattern_repeat_fill_blanks_in_order`, `test_pattern_number_choices_contain_answer`, `test_pattern_difficulty_sets_blanks`, `test_pattern_wrong_keeps_blank`, `test_pattern_hint1_repeat_and_number`, `test_pattern_hint2_fills_all`.

- [x] Step 1–4 (TDD) · Commit `feat(games): pattern şablonu`

### Task 5: `balance` — terazi ve sayı doğrusu

**Mekanik ve params (üç biçim):**
```json
{ "mode": "scale", "ask": "compare", "left": [7], "right": [3, 2], "item": "item.meyve.elma" }
{ "mode": "scale", "ask": "missing", "left": [3, 4], "right": [5, null], "choices": [1, 2, 3] }
{ "mode": "number_line", "ask": "find", "min": 0, "max": 10, "tick": 1, "value": 6, "choices": [5, 6, 7] }
{ "mode": "number_line", "ask": "place", "min": 0, "max": 20, "tick": 2, "value": 14 }
```
- `scale/compare`: `left`, `right` 1–3 tam sayı (0–1000). `item` verilirse iki taraf da tek değer ve 1–10 olmalı; değer nesne grubu olarak çizilir (1. sınıf "çok / az / eşit"). Seçenekler sabit üç karo: `<`, `=`, `>` (sol ? sağ). Kefeler başta **destek takozlarıyla** düz durur; doğru cevapta takozlar çekilir ve terazi ağır yana eğilir.
- `scale/missing`: iki tarafta toplam 2–4 değer, **tam olarak bir `null`**; cevap = karşı taraf toplamı − aynı taraftaki bilinenler, 0–1000 olmalı. `choices` 2–4 tekrarsız, cevabı içerir. Terazi başta eksik değer 0 sayılarak eğik durur, doğru sayı konunca dengelenir.
- `number_line`: `min ≥ 0`, `max ≤ 1000`, `tick ≥ 1`, `(max − min)` `tick`'in katı, aralık sayısı 2–10 (her çentik ≥160 px dokunma şeridi), `min < value < max`, `value` çentik üzerinde. `find`: işaretçi bir çentiğin üstünde durur, `choices` (2–4, değeri içerir) karolarından biri seçilir. `place`: sayı üstte gösterilir, çocuk doğru çentiğe dokunur.

**difficulty:** `compare` ve `missing`'de değişmez (zorluk içerikteki sayılardadır). `number_line` etiketleri: 1 → hedef dışındaki bütün çentikler etiketli; 2 → uçlar ve `min`'den itibaren her 5. çentik; 3 → yalnızca uçlar.

**İpucu 1:** `compare` → takozlar yarıya iner, terazi son açısının yarısı kadar eğilir (fiziksel ipucu). `missing` → eksik değeri olmayan tarafın toplamı karoyla gösterilir. `number_line` → hedefin iki komşu çentiğinin etiketi görünür ve parlar. **İpucu 2:** doğru seçenek / çentik parlar ve seçilir.

**Spec kullanımları:** eşitlik, karşılaştırma, sayı doğrusu.

**Test kancaları:** `_debug_choose(i)` (karo ya da çentik indeksi), `_debug_correct_index()`, `beam_angle() -> float`, `labeled_ticks() -> Array[int]`.

**Testler:** `test_balance_valid`, `test_balance_invalid`, `test_balance_missing_negative_rejected`, `test_balance_compare_correct_tilts_beam`, `test_balance_missing_correct_levels_beam`, `test_number_line_find_and_place`, `test_number_line_difficulty_labels`, `test_balance_hints`.

- [x] Step 1–4 (TDD) · Commit `feat(games): balance şablonu (terazi + sayı doğrusu)`

### Task 6: `clock_money` — saat oku / kur, para say / öde

**Karar — tek şablon, iki mod:** Spec §3.7 tabloda tek kimlik (`clock_money`) veriyor ve ikisi de "ölçme" ünitesinin aynı oyun kalıbını (göster → oku / kur → onayla) paylaşıyor. Tek şablon; `mode` alanıyla ayrılır. Alan mantığı ayrı saf dosyalardadır (`clock_time.gd`, `money.gd`), şablon betiği yalnızca düzen ve girdiyi yönetir. Matris ileride iki ayrı şablon gerektirirse kimlik bölünebilir; içerik `mode` alanı sayesinde mekanik olarak taşınır.

**params (dört biçim):**
```json
{ "mode": "clock", "ask": "read", "hour": 3, "minute": 30, "choices": [{"hour": 3, "minute": 30}, {"hour": 6, "minute": 15}] }
{ "mode": "clock", "ask": "set", "hour": 9, "minute": 15 }
{ "mode": "money", "ask": "count", "unit": "tl", "items": ["tl_10", "tl_5", "tl_1"], "choices": [15, 16, 17] }
{ "mode": "money", "ask": "pay", "unit": "kr", "amount": 75, "wallet": ["kr_50", "kr_25", "kr_10", "kr_5"] }
```
- Saat: `hour` 1–12, `minute` 0–55 ve 5'in katı. `read` için `choices` 2–4 tekrarsız `{hour, minute}`, hedefi içerir.
- Para küpürleri (`Money.DENOMS`): madeni `kr_1, kr_5, kr_10, kr_25, kr_50, tl_1`; banknot `tl_5, tl_10, tl_20, tl_50, tl_100, tl_200`. `unit: "tl"` → yalnızca `tl_*`; `unit: "kr"` → `kr_*` ve `tl_1` (= 100 kuruş). Toplam / tutar birim cinsinden 1–1000.
- `count`: `items` 1–10 küpür; `choices` 2–4 tekrarsız, toplamı içerir.
- `pay`: `amount`, `wallet` 1–6 tekrarsız küpür; tutar cüzdandaki küpürlerle tam ödenebilmeli (sınırsız adet, DP).

**Saat oku:** analog saat (kodla çizilmiş kil kadran, rakamlar yazı tipiyle; `ui.clock_face` gelirse kadran zemini olur) + dijital seçenek karoları (`fmt.clock`, ör. "3.30").
**Saat kur:** hedef dijital olarak gösterilir; dört kil düğme (akrep −/+, yelkovan −/+) ve onay düğmesi. Yelkovan gerçek saat gibi akrebi sürükler (55 → 0 geçişi saati ilerletir). Başlangıç 12.00 (hedef 12.00 ise 3.00). Yelkovan adımı zorlukla değişir: 1 → 30 dk, 2 → 15 dk, 3 → 5 dk; hedef dakika bu adımın katı değilse adım hedefe uyan en büyük değere (15, sonra 5) iner — her hedef her zorlukta ulaşılabilir.
**Para say:** küpürler tepside; altta toplam seçenekleri (`fmt.money.tl` / `fmt.money.kr`). Zorluk 1 → küpürler büyükten küçüğe sıralı; 2–3 → karışık.
**Para öde:** üstte hedef tutar, ortada boş tepsi, altta cüzdan küpürleri. Cüzdan küpürüne dokununca tepsiye bir tane eklenir (en çok 12), tepsideki küpüre dokununca geri alınır, onay düğmesi tutarı denetler. Zorluk 1 → tepsi toplamı canlı gösterilir; 2–3 → gizli.

**İpucu 1:** saat oku → akrep ve gösterdiği saat rakamı parlar; saat kur → hedef akrep konumu soluk "gölge" olarak çizilir; para say → küpürler büyükten küçüğe dizilir, altlarına ara toplamlar yazılır; para öde → kalan tutara sığan en büyük cüzdan küpürü parlar (fazla ödendiyse tepsiden çıkarılacak küpür parlar). **İpucu 2:** doğru cevap kurulur / seçilir ve onaylanır.

**Spec kullanımları:** zaman ölçme (tam, yarım, çeyrek saat, 5 dakikalık), paralarımız (tanıma, sayma, ödeme).

**Test kancaları:** `_debug_choose(i)`, `_debug_correct_index()`, `_debug_step(hand: String, dir: int)`, `_debug_add(wallet_index)`, `_debug_remove(tray_index)`, `_debug_check()`, `shown_time() -> Vector2i`, `tray_total() -> int`.

**Testler:** `test_money_*` ve `test_clock_time_*` (saf), `test_clock_money_valid`, `test_clock_money_invalid`, `test_money_pay_unpayable_rejected`, `test_clock_read_correct_and_wrong`, `test_clock_set_steps_and_check`, `test_clock_set_reachable_for_every_difficulty`, `test_money_count_correct`, `test_money_pay_add_remove_check`, `test_check_button_double_press_counts_once`, `test_clock_money_hints`.

- [x] Step 1–4 (TDD) · Commit `feat(games): clock_money şablonu (saat + para)`

### Task 7: `fraction_pizza` — bütünü parçala ve seç

**params (iki biçim):**
```json
{ "ask": "split", "parts": 4 }
{ "ask": "select", "parts": 8, "take": 3 }
```
- `split`: `parts` 2–8. Seçenekler şablonca üretilir: doğru (eş `parts` parça), eşit olmayan `parts` parça, farklı sayıda eş parça, hafif eşit olmayan `parts` parça.
- `select`: `parts` 2–12, `take` 1–`parts`.

**split:** üstte `parts` sayısı (kil karo), altta pizza seçenekleri; "eş parçalara bölünmüş" olan seçilir. Zorluk: 1 → 2 seçenek (doğru + belirgin eşit olmayan), 2 → 3 (+ farklı sayıda eş parça), 3 → 4 (+ hafif eşit olmayan).
**select:** üstte kesir (pay / çizgi / payda, yazı tipiyle), ortada eş parçalı pizza. Dilime dokununca seçilir / bırakılır: seçili dilim dışa kayar, kenarı kalınlaşır ve üstüne onay işareti çizilir (renk tek başına değil). Onay düğmesi seçili sayıyı `take` ile karşılaştırır. Zorluk: 1 → seçili dilim sayısı karoda gösterilir; 2 → sayaç yok; 3 → sayaç yok ve pizza yarım dilim döndürülmüş başlar.

**İpucu 1:** `split` → yanlış seçeneklerden biri soluklaşır; `select` → dilimler sırayla zıplayıp sayılır (`vo.sayi.<n>`), ardından pay parlar. **İpucu 2:** doğru seçenek seçilir / tam `take` dilim seçili hale getirilip onaylanır.

**Pizza görseli:** `item.yiyecek.pizza` (üstten, dilimsiz) varsa dilimler doku koordinatlarıyla bu görselden kesilir; yoksa kodla kil pizza çizilir.

**Spec kullanımları:** 3. sınıf kesirler (bütün, eş parça, birim kesir, kesrin parçalarını seçme).

**Test kancaları:** `_debug_choose(i)`, `_debug_correct_index()`, `_debug_toggle(slice)`, `_debug_check()`, `selected_count()`, `slice_at(local_pos) -> int`.

**Testler:** `test_fraction_pizza_valid`, `test_fraction_pizza_invalid`, `test_pizza_split_correct_and_wrong`, `test_pizza_split_difficulty_option_count`, `test_pizza_select_toggle_and_check`, `test_pizza_slice_hit_test`, `test_pizza_hints`.

- [x] Step 1–4 (TDD) · Commit `feat(games): fraction_pizza şablonu`

### Task 8: Runner entegrasyonu, ekran görüntüleri, asset partisi, QA

- [x] `tests/integration/test_faz3_runner.gd` (`test_faz3_templates_play_through_runner`, `test_faz3_three_wrong_hint_and_requeue`): fixture ünitede her şablonun bir turu LessonRunner ile oynanır; 3 yanlış → ipucu 1, çözüm (`show_hint(2)`), tur yardımlı ve bir kez yeniden eklenir; ders tamamlanır.
- [x] `tools/ui_screenshots.gd`: her şablon/mod için kare (`29_..` sonrası).
- [x] `asset-requests/010-faz3-sablonlar.md` + README durum tablosu; `tools/missing_assets.gd` hatasız.
- [x] `docs/qa-checklist.md`: Faz 3a bölümü.
- [x] Commit `test: faz 3 şablonları LessonRunner entegrasyonu`, `docs: faz 3a asset partisi ve QA adımları`

---

## Kararlar (spec'in sessiz kaldığı konular)

- **K1 — `clock_money` tek şablon, iki mod** (`mode: clock | money`). Gerekçe Task 6'da.
- **K2 — Zorluk içerik sayılarını değiştirmez**, yalnızca sunumu (görünen seçenek sayısı, ön yerleştirilmiş kart, boşluk sayısı, etiket yoğunluğu, adım büyüklüğü, sayaç). Sayıların kendisi içerik yazarının elindedir; böylece öğrenme çıktısıyla eşleme bozulmaz.
- **K3 — Çok adımlı turlarda (sequence, pattern) her doğru adım `answered(true)` yayar**; tur sonu yalnızca son adımda. Yanlış adımlar tur içi yanlış sayacını artırır (drag_match ile aynı).
- **K4 — Onay düğmeli etkileşim** (saat kur, para öde, pizza seç): ara durum değişiklikleri cevap sayılmaz, yalnızca onay basışı sayılır. Yanlış onaydan sonra çocuğun kurduğu durum korunur (yeniden başlamaz).
- **K5 — Teraziyle karşılaştırmada destek takozları:** terazi cevaptan önce eğik görünseydi soru kendini yanıtlardı; takozlar terazinin neden düz durduğunu fiziksel olarak açıklar, doğru cevapta çekilir.
- **K6 — Sayı doğrusu en çok 10 aralık:** 1080p tabanında ≥128 px dokunma şeridi için. 0–100 gibi geniş aralıklar `tick: 10` ile verilir.
- **K7 — Para değerleri birim cinsinden yazılır** (`unit: tl | kr`), içerikte kuruş/lira karışık aritmetik yok; `kr` biriminde yalnızca `tl_1` (= 100 kuruş) karışabilir.
- **K8 — Saat gösterimi `fmt.clock` = "{h}.{m}"** (TDK: saat ve dakika arasında nokta). Biçim metin dosyasında olduğu için sahip değiştirebilir.
- **K9 — `pattern` sayı seçenekleri şablonca üretilir** (`v`, `v + step`, `v ± 1`): çok boşluklu turlarda her boşluk farklı seçenek gerektirdiği için yazara bırakılmadı.
- **K10 — `fraction_pizza` `take = parts` (bütün) kabul edilir**; "bütün" kavramı da sorulabilsin.
- **K11 — Para, pizza ve saat kadranı görselleri gelene kadar kodla çizilir**; `AssetImage`'ın etiketli kart yer tutucusu bu şablonlarda kullanılmaz, çünkü sayı ve dilim bilgisi zaten çizimin parçasıdır.

## Açık sorular (sahibe)

- **S1 — Karşılaştırma sembolleri:** `balance/compare` seçenekleri `<`, `=`, `>` sembolleri. 1. sınıfta sembol yerine "çok / az / eşit" sözcükleri (ya da ağır kefe ikonu) mı istenir? Şu an 1. sınıf için `item` gruplarıyla somut gösterim var ama seçenekler yine sembol.
- **S2 — Saat biçimi:** dijital gösterim "3.30" (TDK) mi, okul kitaplarındaki "3:30" mı? (`fmt.clock` değiştirilerek çözülür.) 1. sınıfta dijital gösterim hiç olmasın, yalnızca "saat 3 buçuk" sesi mi olsun?
- **S3 — 1 kuruş:** 1 kuruş tedavülde neredeyse yok; küpür listesinde kalsın mı?
- **S4 — Banknot görselleri:** gerçek banknotlara benzerlik (renk, boyut) öğretici ama sahte para izlenimi vermemeli; portre ve rakam istemedik. Renk eşlemesi yeterli mi, yoksa yalnızca "oyuncak para" mı olsun?
- **S5 — Faz 1 açık sorusu (MAT.1.1.4 karşılaştırma):** `balance/compare` + `item` gruplarıyla iki grubu yan yana karşılaştırma artık mümkün. MAT.1.1.4 bu şablonla karşılansın mı? (İçerik Faz 2 matrisinden sonra.) Tahmin (MAT.1.1.7) için ayrı mod hâlâ yok.
- **S6 — `balloon_pop` kapsamı:** şu an yalnızca toplama/çıkarma işlemi. Spec "doğru cevabı taşıyan balon" diyor; ileride "hedef harfi / sayıyı taşıyan balon" gibi işlem dışı sorular da gerekir mi?
- **S7 — `pattern` ve `sequence` için çok adımlı turlarda yıldız:** her yanlış adım durak yanlış sayısına ekleniyor (drag_match ile aynı). 3 boşluklu bir örüntüde yıldız eşikleri (≤1 / ≤3 yanlış) sert kalabilir; adım başına değil tur başına mı sayılsın?
