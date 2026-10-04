# Faz 5a — `sort_bins` ve `scenario` Şablonları: Uygulama Planı

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [x]`) syntax for tracking.

**Goal:** Spec §3.7 #4 (`sort_bins`) ve #13 (`scenario`) şablonlarını `MiniGame` sözleşmesiyle (spec §4.4) yazmak, `TemplateRegistry`'ye kaydetmek, `validate_params` + oynanış + LessonRunner testleriyle kapsamak. Hayat Bilgisi, Matematik ve Fen içerikleri (Faz 3c–3e, 5b, 6) bu şablonlara bağlı. Ünite içeriği bu planın kapsamı dışındadır.

**Architecture:** Faz 3a planıyla aynı: her şablon `scenes/games/<id>/<id>.{gd,tscn}`, ortak akış `MiniGame._submit_answer`, ortak çizimler `scenes/games/game_widgets.gd`. Öğeler ortak `Token` biçimini ve `token_view` sahnesini kullanır.

**Spec:** `docs/superpowers/specs/2026-10-04-bilgi-adasi-design.md` (§3.3, §3.7, §4.4, §4.9) ve "Açık sorular (Faz 2)" eşleme kuralı (davranış çıktılarında doğru davranışı durum içinde seçmek `scenario` ile oynanabilir).

## Kararlar (sahip onayıyla önerilen seçim)

`/mnt/project-files/plans/kalan-fazlar.md` → Faz 5a "Önerilen seçimler":

- **`scenario`:** her durumda 2–3 seçenek. Yanlış seçimde ceza yok: kısa, nazik bir sonuç animasyonu (kart hafifçe eğilir, sahne sonucu gösterir, varsa sonucu anlatan satır okunur) ve LessonRunner'ın olağan ipucu akışı.
- **`sort_bins`:** 2–3 kutu. Kutular şekil simgesi + renk ile ayrılır; renk tek başına anlam taşımaz (iki kutu aynı şekli kullanamaz, doğrulama hatası).

Uygulama sırasında verilen ek kararlar (spec sessiz, önerilen seçimle ilerlendi):

- **K1 — Denenen yanlış kart kapanır (`scenario`).** Yanlış seçilen kart soluklaşır ve yeniden seçilemez; aynı yanlış iki kez sayılmaz. Sonuç: 2 seçenekte en çok 1, 3 seçenekte en çok 2 yanlış olur; 2. yanlışta ipucu 1 gelir ve geriye yalnızca doğru kart kalır. Çözüm adımı (`show_hint(2)`) içerik açısından erişilmez ama çalışır (test edildi). Gerekçe: "ceza yok" ilkesi; çocuk aynı kartı tekrar tekrar deneyip yanlış biriktirmez.
- **K2 — Nazik sonuç, cevaptan önce.** Yanlış seçimde şablon önce sonucu oynatır (ses satırı bitene kadar), sonra `answered(false)` yayar. Böylece LessonRunner'ın "tekrar dene" ve yönerge satırları sonuç satırını kesmez.
- **K3 — Zorluk.** `scenario`: 1 → doğru + ilk yanlış (2 seçenek), 2–3 → hepsi. `sort_bins`: 1 → en az iki öğesi olan her kutuda ilk öğe örnek olarak baştan kutuda durur; 2 → yalnızca ilk kutuda örnek; 3 → örnek yok. Tek öğeli kutudan örnek alınmaz.
- **K4 — Kutu etiketi.** Her kutunun üstünde ne topladığını gösteren bir etiket token'ı vardır (görsel, sayı ya da metin anahtarı). Kutuya dokunmak etiketin `voice` satırını okutur, cevap sayılmaz.
- **K5 — Yeni asset yok.** Kutular ve rozetler kodla kil görünümünde çizilir. Sahne ve davranış görselleri içerik görevlerinin (5b, 3c–3e, 6) kendi asset partilerinde istenir. 5a'ya ayrılan 019–022 parti numaraları kullanılmadı.

## Dosya haritası

| Dosya | Sorumluluk |
|---|---|
| `scenes/games/sort_bins/sort_bins.{gd,tscn}` | Öğeleri kutulara ayırma |
| `scenes/games/scenario/scenario.{gd,tscn}` | Durumu görüp doğru davranışı seçme |
| `scripts/core/template_registry.gd` | İki yeni kayıt |
| `content/strings.tr.json` | `err.params.sb_*`, `err.params.sc_*` doğrulama mesajları |
| `tests/unit/test_params_faz5.gd` | Kayıt + `validate_params` testleri |
| `tests/integration/test_play_sort_bins.gd`, `test_play_scenario.gd` | Oynanış testleri |
| `tests/integration/test_faz5_runner.gd` + `tests/fixtures/lesson_faz5/` | LessonRunner akışı |
| `tools/ui_screenshots.gd` | Kareler 60–63 |
| `docs/qa-checklist.md` | Manuel kontrol adımları |

---

### Task 1: `sort_bins` — kutulara ayır

**Mekanik:** Üst tepside karışık öğeler, altta 2–3 kutu. Öğe doğru kutuya bırakılınca kutunun iç bölmesine küçülerek oturur (`answered(true)`); yanlış kutuda geri seker (`answered(false)`); kutu dışına bırakma cevap sayılmaz. Bütün öğeler yerleşince `finished`.

**params:**
```json
{
  "bins": [ { "label": Token, "shape": "circle", "color": "green" }, ... ],
  "items": [ { "token": Token, "bin": 0 }, ... ]
}
```
- `bins`: 2–3 kutu; `label` geçerli token; `shape` `game_widgets.SHAPES`'ten ve kutular arasında farklı; `color` isteğe bağlı (`red|blue|yellow|green|purple|orange`, verilmezse turuncu, mavi, yeşil).
- `items`: 4–9 öğe; `token` geçerli ve tekrarsız; `bin` var olan kutunun sırası; her kutuya en az bir öğe düşer.

**İpucu 1:** tepsideki sıradaki öğe ve onun kutusu parlar. **İpucu 2:** kalan öğeler sırayla kutularına yerleşir (`helped`).

**Test kancaları:** `_debug_drop(item, bin)`, `_debug_bin_of(item)`, `_debug_next_item()`, `_debug_tap_bin(bin)`, `open_items()`, `bin_contents(bin)`, `bin_views()`, `item_views()`, `bin_shapes()`, `touch_targets()`.

- [x] Step 1: params testleri → FAIL · Step 2: oyun testleri → FAIL · Step 3: uygula → PASS · Commit `feat(games): sort_bins ve scenario şablonları` (iki şablon tek commit'te; doğrulama mesajları ve kayıt ortak dosyalarda)

### Task 2: `scenario` — durum seç

**Mekanik:** Üstte sahne görseli (durum), altta 2–3 davranış kartı; soru turun seslendirmesidir. Doğru kart: (varsa) iyi sonucun görseli, övgü, `finished`. Yanlış kart: K1, K2.

**params:**
```json
{
  "scene": "item.sahne.yaya_gecidi",
  "hint": "vo.<...>.ipucu",
  "choices": [
    { "token": Token, "correct": true, "result": "item.sahne.karsiya_gecti" },
    { "token": Token, "correct": false, "result": "item.sahne.korna", "result_voice": "vo.<...>.sonuc" }
  ]
}
```
- `scene`: boş olmayan görsel anahtarı. `hint`: isteğe bağlı ses satırı.
- `choices`: 2–3 tekrarsız token, `correct` bool ve tam olarak bir doğru. `result` (görsel) ve `result_voice` (ses) isteğe bağlı, verilirse boş olmayan metin.

**İpucu 1:** `hint` satırı okunur, sahne parlar; en az iki denenmemiş yanlış varsa biri soluklaşır (tek yanlış kalınca cevabı vermemek için soluklaşmaz). **İpucu 2:** doğru kart parlar ve seçilir (`helped`).

**Test kancaları:** `_debug_choose(i)`, `_debug_correct_index()`, `_debug_answer(correct)`, `choice_keys()`, `scene_key()`, `is_tried(i)`, `faded_count()`, `touch_targets()`.

- [x] Step 1–3 (TDD) · Task 1 ile aynı commit

### Task 3: LessonRunner, ekran görüntüsü, QA

- [x] `test_faz5_runner.gd`: iki şablon runner içinde baştan sona oynanır (3 yıldız); `sort_bins` 3 yanlışta çözülüp bir kez sona eklenir; `scenario` 2 yanlışta ipucu verir, geriye yalnızca doğru kart kalır.
- [x] `tools/ui_screenshots.gd` kareleri 60–63; kareler gözle kontrol edildi (yuvarlak göstergeyle çakışma yok, etiket kartı taşmıyor).
- [x] `docs/qa-checklist.md` Faz 5a bölümü.
- [x] Tam test paketi yeşil.
