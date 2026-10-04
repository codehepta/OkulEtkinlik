# Faz 4a — Türkçe Şablonları: Uygulama Planı

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [x]`) syntax for tracking.

**Goal:** Spec §3.7'deki Türkçe şablonlarını (#5 `trace`, #6 `syllable_build`, #12 `story`) `MiniGame` sözleşmesiyle (spec §4.4) yazmak, `TemplateRegistry`'ye kaydetmek ve `story` ile `drag_match` için **sessiz okuma kipini** eklemek (spec "Açık sorular (Faz 2)" (e)). Ünite içeriği bu planın kapsamı dışındadır (Faz 4b, 4c).

**Architecture:** Faz 3a ile aynı düzen: her şablon `scenes/games/<id>/<id>.{gd,tscn}`, ortak cevap / kilit / övgü akışı `MiniGame._submit_answer`, ortak çizim yardımcıları `scenes/games/game_widgets.gd`. Harf izlemenin saf mantığı (glif verisini örnekleme, yerleşim, iz takibi) `scripts/core/trace_path.gd` içinde sahnesiz ve birim testlidir. Dik temel harf yolları **veri** olarak `content/trace/glyphs.json` dosyasındadır (spec §4.9: "dik temel harf yolları vektör olarak `trace` şablonunda tanımlanır"); öğretmen gözden geçirmesiyle kod değişmeden düzeltilebilir.

**Tech Stack:** Godot 4.7.2-stable, GDScript (statik tipli), GUT.

**Dayanak:** spec §2 (ses temelli cümle yöntemi, dik temel harf), §3.3, §3.7 #5, #6, #12, §4.4, §4.9; "Açık sorular (Faz 2)" (e) ve yazma maddesi; `/mnt/project-files/plans/kalan-fazlar.md` Faz 4a.

## Global Constraints

- Faz 1 ve Faz 3a planlarındaki genel kısıtlar geçerlidir (statik tipli GDScript, 1920×1080 taban, kodda Türkçe sabit metin yok, ağ yok, atıf satırı yok, dokunma hedefleri ≥128 px, renk tek başına anlam taşımaz, yanıp sönme yok, süre baskısı yok).
- Spec'te yalnızca bu görevin açık soru / karar satırları eklenir; §3.7 tablosuna dokunulmaz (o 3b'nin).
- Asset partileri yalnızca 015–018 aralığından.

## Review Focus

1. **Tur asla takılı kalmamalı:** her şablonda `show_hint(2)` turu bitirir (`test_trace_hint2_completes_all`, `test_syllable_hint2_completes`, `test_story_hint2_solves_from_read_phase`, `test_faz4a_three_wrong_hint_and_requeue`).
2. **Her glif baştan sona izlenebilir:** `test_trace_every_glyph_traceable` (68 glif, en dar tolerans); yaylar kalemden başlar (`test_arcs_start_at_pen`).
3. **İz takibi atlamaya ve ters yöne izin vermez, ama cömerttir:** `test_tracker_cannot_jump_ahead`, `test_tracker_reverse_direction_not_done`, `test_trace_generous_tolerance`.
4. **Sessiz okuma:** yönerge ve sorular her zaman seslendirilir; okuma parçası ilk cevaba kadar okunmaz, ipucu 1'de okunur (`test_story_silent_*`, `test_silent_*`, `test_faz4a_silent_story_voice_flow`).
5. **Faz 1 içeriğinde davranış değişmez:** `read` verilmeyen `drag_match`'te sol kartlarda ses yoksa hiçbir şey okunmaz (`test_default_without_voices_stays_quiet`).

---

## Dosya haritası

| Dosya | Sorumluluk |
|---|---|
| `content/trace/glyphs.json` | 29 küçük, 29 büyük harf ve 10 rakamın dik temel harf iz yolları (vuruş sırası ve yönüyle) |
| `scripts/core/trace_path.gd` | Glif okuma ve doğrulama, örnekleme, yerleşim, `Tracker` (iz takibi) |
| `scenes/games/trace/trace.{gd,tscn}` | İz sür şablonu |
| `scenes/games/syllable_build/syllable_build.{gd,tscn}` | Hece / harf karolarıyla kelime kurma |
| `scenes/games/story/story.{gd,tscn}` | Resimli hikâye + anlama soruları, dinleme ve sessiz okuma kipleri |
| `scenes/games/drag_match/drag_match.gd` | `read` kipi (dinleme / sessiz okuma), `_debug_answer` |
| `scenes/games/game_widgets.gd` | Simgeli düğme, hoparlör / ok / kitap çizimleri |
| `scripts/core/content_validator.gd` | params içindeki `voice` / `text` / metin token anahtarlarının denetimi |
| `scripts/core/template_registry.gd` | Üç yeni kayıt |
| `scenes/ui/lesson_runner.gd` | `story` kurulumdan önce yönergeyi okutur (`SPEAKS_ON_SETUP`) |
| `content/strings.tr.json` | `err.params.*` mesajları, ekran görüntüsü / test için örnek hikâye (`ornek.hikaye.*`) |
| `tests/unit/test_trace_path.gd`, `tests/unit/test_params_faz4a.gd` | Saf mantık ve params testleri |
| `tests/integration/test_play_{trace,syllable_build,story}.gd`, `test_drag_match_read_mode.gd` | Oynanış testleri |
| `tests/integration/test_faz4a_runner.gd` | LessonRunner ile dört şablonun ipucu / çözüm / yeniden sorma akışı |
| `tests/fixtures/faz4a/params.json`, `tests/fixtures/lesson_faz4a/` | Örnek params ve runner fixture ünitesi |
| `tools/ui_screenshots.gd` | Yeni kareler (44–55) |
| `asset-requests/015-*.md`, `016-*.md` | İz kalemi, sayfa oku, kitap ikonu; sayfa çevirme sesi |
| `docs/qa-checklist.md` | Faz 4a bölümü |

---

### Task 1: Dik temel harf yolları ve iz takibi (saf mantık)

**Veri biçimi:** `glyphs.<karakter>.strokes` = vuruş listesi; her vuruş komut listesi. Birimler: y=0 üst çizgi, 1 orta çizgi, 2 taban, 3 alt çizgi (dört çizgili defter). Komutlar: `M x y` (başla), `L x y` (çizgi), `A cx cy rx ry a0 a1` (yay; derece, 0 sağ, 90 aşağı; a1 < a0 saat yönünün tersi), `D x y` (nokta, tek dokunuş). Küçük harfler orta bantta, büyük harfler ve rakamlar üst iki bantta; noktalar ve şapkalar bandın üstüne taşabilir.

**Tracker:** Parmak yalnızca bulunduğu noktanın 0.6 birim ilerisine kadar olan yol parçasını ilerletebilir (atlama ve ters yön yok). Bu pencereden `tolerans × 1.8` uzaklaşmak "yoldan çıktı" (OFF) demektir; ilerleme korunur. Bitişe `tolerans × 0.6` yaklaşınca vuruş tamamdır. Hızlı kaydırmada ara noktalar beslenir.

- [x] Testler: `test_trace_path.gd` (alfabe tam, glifler geçerli ve bant içinde, yaylar kalemden başlar, yerleşim, takip / yoldan çıkma / atlama / kapalı döngü / nokta).
- [x] Uygula. Commit: `feat(core): dik temel harf iz yolları ve iz takibi`

### Task 2: `trace` — iz sür

**params:** `{ "chars": "a", "item"?: "item.meyve.armut" }` — `chars` 1–4 karakter, her biri `glyphs.json`'da tanımlı (Türk alfabesi büyük/küçük ve rakamlar); `item` verilirse sol üstte kelime resmi (ses temelli yöntemde harfin sesini taşıyan nesne).

**Mekanik:** Dört çizgili kâğıt; soluk iz yolu; sıradaki vuruşun başlangıcında numaralı nane yeşili nokta. Başlangıca (ya da kalınan yere) yakın basış izlemeyi başlatır, başka yere basış cevap değildir (nokta nabız gibi büyür). Vuruş tamamlanınca mürekkeple boyanır ve `answered(true)`; son vuruşta tur biter (K3). Yoldan çıkmak `answered(false)` + yön ipucu canlandırması; ilerleme korunur.

**difficulty:** tolerans 1 → 0.34, 2 → 0.27, 3 → 0.21 birim (1 birim ≈ 180 px). Zorluk 1'de başlangıçta yön oku; zorluk 3'te iz yolu daha soluk.

**İpucu 1:** başlangıç noktası nabız gibi büyür, kalem sıradaki vuruşu baştan sona çizer. **İpucu 2:** kalan vuruşlar sırayla kalemle çizilip yerine oturur.

- [x] Testler: `test_play_trace.gd` · Uygula · Commit: `feat(games): trace şablonu`

### Task 3: `syllable_build` — hecelerden kelime kur

**params:** `{ "parts": ["el", "ma"], "distractors"?: ["al"], "item"?: "item.meyve.elma", "voice"?: "vo...." }` — `parts` 2–5, her biri 1–4 Türkçe harf (harf karolarıyla hece kurmak da aynı şablon: `["a", "t"]`); `distractors` 0–3, tekrarsız ve `parts`'tan farklı; bütün karolar bir sıraya sığmalı.

**Mekanik:** Üstte (varsa) resim ve boş yuvalar, altta karışık karolar. Karoya dokununca sıradaki yuvanın parçasıysa yuvaya uçar (`answered(true)`), değilse sallanır ve yerinde kalır (`answered(false)`). Aynı parça birden çok kez geçebilir (`["ba", "ba"]`); eşleşme metinle yapılır. Kelime tamamlanınca `voice` okunur.

**difficulty:** görünen çeldirici 1 → 0, 2 → en çok 1, 3 → hepsi.

**İpucu 1:** sıradaki yuva ve doğru karo parlar. **İpucu 2:** kalan parçalar sırayla yerleşir.

- [x] Testler: `test_play_syllable_build.gd` · Uygula · Commit: `feat(games): syllable_build şablonu`

### Task 4: `story` — sesli etkileşimli hikâye + anlama soruları, sessiz okuma

**params:**
```json
{ "read": "listen | silent",
  "pages": [ { "text": "<metin anahtarı>", "voice": "<ses anahtarı>", "image"?: "item.*" } ],
  "questions": [ { "voice": "<ses anahtarı>", "text"?: "<metin anahtarı>", "options": [Token, ...], "answer": 0, "page"?: 0 } ] }
```
- `pages` 1–4, `questions` 1–3, `options` 2–4 tekrarsız token; seçeneklerin ya hepsi metin ya hiçbiri metin. `answer` seçenek sırası; `page` sorunun dayandığı sayfa (yoksa son sayfa).

**Okuma evresi:** resim + metin; "sonraki" oku sayfa çevirir; son sayfadan sonra soru evresi. **Soru evresi:** soru seslendirilir (metni varsa yazılır), hoparlör soruyu yeniden okutur, kitap düğmesi hikâyeye döndürür (cevap değil). Metin seçenekleri iki sütunlu geniş karolar, diğerleri 250 px token kartları.

**Kipler:** `listen` her sayfayı açılınca okur. `silent` okuma parçasının sesini ilk cevaba kadar tutar; ilk cevaptan sonra sayfalarda hoparlör belirir (kendiliğinden okumaz); ipucu 1 sorunun sayfasını okur. Yönerge (tur sesi, runner kurulumdan önce okur) ve sorular her iki kipte seslendirilir.

**İpucu 1:** ses açılır, sorunun sayfası okunur, bir yanlış seçenek soluklaşır. **İpucu 2:** soru evresine geçilir, kalan soruların doğru seçeneği parlar ve seçilir.

- [x] Testler: `test_play_story.gd` · Uygula · Commit: `feat(games): story şablonu ve sessiz okuma kipi`

### Task 5: `drag_match` okuma kipi

- `read` (isteğe bağlı): `listen` (varsayılan) sol kart tutulunca sesi (varsa) okunur; `silent` ilk cevaba (ya da ipucu 1'e) kadar okunmaz. İpucu 1 sıradaki çiftin sesini okur (sol kartta yoksa sağ kartınki). `silent` için en az bir kartta `voice` zorunlu.
- Faz 1 içeriğinde sol kartlarda ses yok; davranış değişmez.

- [x] Testler: `test_drag_match_read_mode.gd`, `test_drag_match_read_mode` (params) · Uygula · Commit: `feat(games): drag_match sessiz okuma kipi`

### Task 6: Doğrulama, runner, ekran görüntüleri, asset partileri, QA

- [x] `ContentValidator`: params içindeki `voice` alanları ses satırı, `text` alanları ve metin token değerleri metin anahtarı olmalı (`test_validator_checks_param_keys`).
- [x] `LessonRunner.SPEAKS_ON_SETUP` += `story`.
- [x] `tests/integration/test_faz4a_runner.gd` (oynanış, 3 yanlış → ipucu + çözüm + yeniden sorma, sessiz hikâye ses akışı).
- [x] `tools/ui_screenshots.gd` kareler 44–55.
- [x] `asset-requests/015`, `016` + README; `docs/qa-checklist.md` Faz 4a bölümü; spec karar satırları.

---

## Kararlar (sahip onayıyla önerilen seçimler; `kalan-fazlar.md`)

- **K1 — Sessiz okuma kipi eklendi** (`story`, `drag_match`; `read: silent`). Yönerge her zaman seslendirilir; okuma parçasının sesi ilk cevaptan sonra (hoparlörle) ya da ikinci yanlışta ipucu olarak açılır. T.O.* durakları bu kipi kullanır.
- **K2 — `trace` toleransı cömert, yön ve sıra ipucu canlandırmalı;** yanlış iz ceza değildir: ilerleme silinmez, yön ipucu hemen oynar. Yine de runner akışı için bir yanlış sayılır (2. yanlışta ipucu, 3.'de çözüm).
- **K3 — Çok adımlı turlar:** `trace` her vuruşta, `syllable_build` her parçada, `story` her soruda `answered(true)` yayar (Faz 3a K3 ile aynı).
- **K4 — İz yolları veridir** (`content/trace/glyphs.json`), kod değildir; lisanslı bir dik temel harf yazı tipi gerekmez. Ekrandaki harfler yazı tipiyle değil, bu yollarla çizilir.
- **K5 — Hece ve harf karoları params'ta düz metindir** (`"parts": ["el", "ma"]`), `strings.tr.json` anahtarı değildir: bunlar arayüz metni değil, rakamlar gibi öğrenme malzemesidir. Hikâye sayfaları, sorular ve metin seçenekleri ise `strings.tr.json` anahtarıdır.
- **K6 — `syllable_build` tıklamayla yerleştirir** (sürükleme yok): 6 yaş için daha kolay ve sıra zaten soldan sağa.

## Açık sorular (sahibe; önerilen seçimle ilerlendi, spec'e eklendi)

- **S1 — Harf yollarının vuruş sırası ve yönü** MEB 1. sınıf dik temel harf yazım yönergesiyle karşılaştırılmadı (resmi bir vektör kaynak bulunamadı). Öneri: bir sınıf öğretmeni `tools/ui_screenshots.gd` kareleri ya da cihazda `trace` ile 68 glifi gözden geçirir; düzeltme yalnızca `glyphs.json`'da yapılır. Özellikle: `T` (önce yatay mı dikey mi), `5` (üst çizgi en son), `k` / `K` (kol tek vuruş), `y` (iki vuruş), büyük harflerde noktanın ve şapkanın yeri.
