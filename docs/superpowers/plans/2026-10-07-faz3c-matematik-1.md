# Faz 3c — 1. Sınıf Matematik İçeriği: Uygulama Planı

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [x]`) syntax for tracking.

**Goal:** 1. sınıf Matematiğin yedi temasının hepsini (`themes.json` `g1.matematik.t01`–`t07`) oynanabilir ünitelere dönüştürmek. Her durak `outcomes.json`'daki doğrulanmış bir koda bağlanır, yalnızca `game_map.json`'da o çıktıya eşlenen şablonları kullanır ve `ContentValidator`'dan geçer.

**Architecture:** Yeni kod yok; içerik JSON'u, metin/ses satırları, asset istekleri ve içerik kapısı testleri. Şablonlar Faz 3a, 3b, 4a ve 5a'da birleşti.

**Spec:** `docs/superpowers/specs/2026-10-04-bilgi-adasi-design.md` §2, §3.7, §4.3; "Açık sorular (Faz 1)", "Açık sorular (Faz 2)" (d), "Açık sorular (Faz 3b)".

## Kararlar (sahip onayıyla önerilen seçim)

`/mnt/project-files/plans/kalan-fazlar.md` → Dalga B ortak önerilen seçimleri:

- **Ünite sırası (Faz 2 açık soru d):** ünite dosyaları programın işleniş sırasını izler, `uNN` = `themes.json` `tNN`. Faz 1 ünitesi (Sayılar ve Nicelikler 1 = `t02`) `u01`'den `u02`'ye taşındı, geometri (`t01`) `u01` oldu. Uygulama yayımlanmadığı için kayıt göçü yok.
- **Eşleme kuralı:** spec'teki haliyle onaylı; `full`/`partial` değerleri değişmedi. Bu yüzden `content/home_activities.tr.json` de değişmedi (`partial` kalan MAT.1.1.4, 1.1.8, 1.2.3, 1.4.1 önerileri yerinde).

Uygulama sırasında verilen ek kararlar (spec sessiz, önerilen seçimle ilerlendi):

- **K1 — Faz 1 düğümleri yeni kimlik alır.** `u01.n01`–`n05` → `u02.n01`–`n05`. "Tahmin et!" (`u01.n06`, MAT.1.1.7) programdaki sırasına uysun diye temanın sonuna, `u02.n12`'ye geçti. Metin ve ses anahtarları da taşındı; ses kaydı henüz olmadığı için 007 partisi yeni yollarla güncellendi.
- **K2 — MAT.1.1.7 tahmin moduyla.** Faz 3b kararı gereği "Tahmin et!" durağının turları `count_choose` tahmin moduna (`estimates`: tahmin et → say → yakın/uzak) çevrildi; yönerge satırları buna göre yeniden yazıldı.
- **K3 — Sayı sınırları programdan.** Toplama/çıkarma: 20'ye kadar (s. 36), ayrıca "iki basamaklı + tek basamaklı, eldesiz" (MAT.1.2.1 uygulaması, s. 35). Ritmik sayma: 100'e kadar birer, beşer, onar; 20'ye kadar ikişer; 20'den geriye birer ve ikişer (s. 23). Örüntüde ilk üç adım verilir, en çok altıncı adıma kadar sürer (s. 23).
- **K4 — Konum dili.** MAT.1.3.1 anahtar kavramlarından (s. 39) üstünde, altında, içinde, dışında, önünde, arkasında, sağında, solunda, arasında, yakında, uzakta resimli seçeneklerle; sağ ve sol resme bakana göredir. İleri ve dönme yönergeleri `grid` (`path`, `relative` oklar) ile.
- **K5 — Sıra sayısı soldan okunur.** MAT.1.1.3'te `listen_find` seçenekleri soldan sağa sabit sırada durur; hedef sesi sıra sayısıdır ("üçüncü"), yönerge "soldan say" der. Yarışçı hayvanlar sağa bakar.
- **K6 — Ölçme araçları.** MAT.1.1.8 a) uygun standart olmayan araç (`listen_find`: karış, adım, ataç, birim küp, misket), b–c) kütle tahmini ve yargı `balance` tahmin moduyla (birim küple tartma). Uzunluğu ekranda birim dizerek ölçme adımı yok; spec "Açık sorular (Faz 3b)"daki önerilen seçim gereği 3d/3e'de eklenecek, çıktı `partial` kalır.
- **K7 — Şekil sınıflandırmada kutu rozeti.** `sort_bins` kutu rozetleri tekrarsız şekil ister ve dikdörtgen rozeti yok. Dikdörtgen kutusu `star` rozeti kullanır; kutunun asıl etiketi dikdörtgen resmidir. Kare ile karışmasın diye `diamond` kullanılmadı.
- **K8 — Anahtar önekleri.** Paralel içerik görevleriyle çakışmasın diye yeni ortak satırlar `vo.g1.matematik.*` / `label.g1.matematik.*` altında, çıkartmalar `st.matematik.g1_*` adıyla eklendi.
- **K9 — `story` hoparlörü Bilge köşesinden çıktı.** İçerik turu testi `story` sayfa hoparlörünün (130, 820) Bilge köşesine (x 16–266, y 724–1068) bindiğini gösterdi; hoparlör (290, 820)'ye kaydı. Başka yerleşim değişmedi.
- **K10 — Asset partileri.** 030 konum + ölçme araçları, 031 şekiller + yapı parçaları + eşyalar, 032 yarışçı hayvanlar + küçük oyuncaklar + hikâye sahneleri, 033 çıkartmalar, 034 seslendirme. 035–039 kullanılmadı. Temel üçgen, kare ve dikdörtgen 2. sınıfın 040 partisinde istendiği için 031'den çıkarıldı; 031 yalnızca 1. sınıfın ek çeşitlerini ister.

## Üniteler

| Dosya | Tema (s.) | Duraklar | Çıktılar | Şablonlar |
|---|---|---|---|---|
| `u01.json` | `t01` Nesnelerin Geometrisi (1) (39) | 4 | MAT.1.3.1, 1.3.2 | listen_find, grid, drag_match |
| `u02.json` | `t02` Sayılar ve Nicelikler (1) (20) | 12 (5 Faz 1 + 6 yeni + Tahmin) | MAT.1.1.1–1.1.7 | count_choose, drag_match, listen_find, sort_bins, balance, sequence, pattern |
| `u03.json` | `t03` Sayılar ve Nicelikler (2) (26) | 2 | MAT.1.1.8 | listen_find, balance |
| `u04.json` | `t04` İşlemlerden Cebirsel Düşünmeye (34) | 5 | MAT.1.2.1–1.2.4 | story, balloon_pop, balance, drag_match |
| `u05.json` | `t05` Sayılar ve Nicelikler (3) (31) | 3 | MAT.1.1.9 | listen_find, drag_match, clock_money |
| `u06.json` | `t06` Nesnelerin Geometrisi (2) (43) | 4 | MAT.1.3.3–1.3.5 | sort_bins, drag_match, listen_find, count_choose |
| `u07.json` | `t07` Veriye Dayalı Araştırma (47) | 2 | MAT.1.4.1 | chart_build |

Toplam 32 durak, 123 tur.

## Dosya haritası

| Dosya | Sorumluluk |
|---|---|
| `content/g1/matematik/u01.json`–`u07.json` | Üniteler |
| `content/strings.tr.json`, `content/voice_lines.tr.json` | Ünite/durak adları, metin kartları, hikâyeler; giriş, yönerge ve kısa ses satırları |
| `content/stickers.json` | 26 yeni çıkartma |
| `tests/unit/test_g1_matematik_content.gd` | İşleniş sırası, çıktı kapsamı, eşlenen şablonlar, çıkartmalar |
| `tests/integration/test_g1_matematik_rounds.gd` | Her tur kurulur; dokunma hedefleri ≥128 px, ekranda ve Bilge köşesinin dışında |
| `tests/integration/test_e2e_vertical_slice.gd` | İlk durak artık `u01.n01` (sesle kurulan `listen_find`) |
| `scenes/games/story/story.gd` | K9 |
| `tools/ui_screenshots.gd` | Faz 1 kareleri `u02` kimlikleriyle |
| `asset-requests/007`, `030`–`034`, `README.md` | Asset istekleri |
| `docs/qa-checklist.md` | Faz 3c manuel kontrolleri |

---

### Task 1: İçerik kapısı testleri
- [x] `test_g1_matematik_content.gd` yazıldı → FAIL (tek ünite, eksik temalar)

### Task 2: Üniteler, metin ve ses satırları
- [x] u01–u07 yazıldı, Faz 1 ünitesi u02'ye taşındı → içerik testleri ve `test_all_content_valid` PASS

### Task 3: Tur kurulum testi
- [x] `test_g1_matematik_rounds.gd` → `story` hoparlörü Bilge köşesinde (FAIL) → K9 → PASS

### Task 4: Var olan testler ve araçlar
- [x] Uçtan uca dilim yeni ilk durağa uyarlandı; ekran görüntüsü aracı `u02` kimliklerine geçti; bütün test paketi PASS

### Task 5: Asset partileri, spec, QA
- [x] 030–034 yazıldı, 007 güncellendi, README durum tablosu; spec (d) kararı; `docs/qa-checklist.md` Faz 3c
