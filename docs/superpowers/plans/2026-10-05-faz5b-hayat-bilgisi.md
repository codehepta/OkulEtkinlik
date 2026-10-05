# Faz 5b — Hayat Bilgisi 1–3 İçeriği (Hayat Kasabası): Uygulama Planı

**Goal:** Hayat Kasabası'nı tamamlamak: üç sınıfın Hayat Bilgisi temalarındaki oynanabilir (`fit` full/partial) her öğrenme çıktısını en az bir durakla oyuna almak. Görev listesi: `/mnt/project-files/plans/kalan-fazlar.md` → Faz 5b.

**Spec:** `docs/superpowers/specs/2026-10-04-bilgi-adasi-design.md` (§3.7, §4.3, "Açık sorular (Faz 2)" eşleme kuralı, "Açık sorular (Faz 5b)").

**Dayanak:** `docs/curriculum/outcomes.json` (HB.* kodları, `tymm-hayat-bilgisi.pdf` sayfalarıyla doğrulanmış), `themes.json` (işleniş sırası), `game_map.json` (uyum ve şablon önerileri). Yeni çıktı kodu yazılmadı.

## Kararlar (sahip onayıyla önerilen seçim)

`/mnt/project-files/plans/kalan-fazlar.md` → Dalga B ortak seçimleri:

- **Ünite sırası:** `uNN` = `themes.json`'daki `tNN` (programın işleniş sırası).
- **Eşleme kuralı:** Faz 2'deki haliyle; `full`/`partial` değerleri değişmedi. Konusu çocuğun kendisi ya da kendi çevresi olan (`fit: none`) çıktılar oyuna girmez, veli panelindeki evde etkinlik önerisinde kalır.

Uygulamada verilen ek kararlar (spec sessiz, önerilen seçimle ilerlendi; spec "Açık sorular (Faz 5b)" bölümüne de yazıldı):

- **K1 — Kapsam:** Oynanabilir 53 HB çıktısının her biri için bir durak, durak başına 3–5 tur, zorluk durak içinde artar. Toplam 17 ünite, 53 durak, 173 tur. 1. sınıf 6. tema (Bilim, Teknoloji ve Sanat) üç çıktısı da `none` olduğu için ünite dosyası yok; 1. sınıf Hayat Kasabası 5 üniteden oluşur.
- **K2 — Gerçek kişi görseli yok:** Atatürk, Mehmet Akif Ersoy ve sanatçılar görselle gösterilmez (stil rehberi §5). Yerler ve semboller kullanılır (Atatürk'ün doğduğu ev, Anıtkabir, Birinci Meclis, Türk bayrağı).
- **K3 — Okumaya dayanmayan seçenekler:** 1. sınıfta seçenekler görsel karttır; tek istisna Atatürk'ün anne ve baba adlarını soran hikâye turudur (HB.1.4.3). Bu turda ve 2–3. sınıftaki bazı hikâye sorularında seçenekler metindir; `story` seçenekleri seslendirmediği için soru cümlesi iki seçeneği de sesli söyler ("Zübeyde Hanım mı, Ayşe Hanım mı?"). Metin etiketlerinin (`label.hb.*`) sesi `vo.ad.etiket.*`, kutu etiketleri ve sürüklenen kartların adı `vo.ad.*` satırlarıdır.
- **K4 — Şablon seçimi:** `game_map.json`'daki şablon listesi öneri sayıldı. Ayrılan yerler: HB.1.5.2'de büyüklük karşılaştırması için `sequence` ve özellik soruları için `scenario`; HB.3.2.2 a'da `listen_find` yerine `scenario` (`listen_find` hedefin adını seslendirdiği için "tehlikeli durumu bul" sorusunda cevabı söylerdi); HB.3.6.1'de hikâyelere ek `drag_match` (gelişme ↔ etki); HB.3.4.2'de kaynağı seçtikten sonra o kaynaktan bilgi bulma (`story`). `game_map.json` değişmedi.
- **K5 — Kaynaktan bilgi toplama çıktıları** (HB.2.4.2, 2.5.3, 2.6.1, 3.4.2, 3.5.4, 3.6.3): oyun yalnızca a) uygun kaynağı seçme (ve 3.5.4'te c) bilginin doğruluğunu sınama yolunu seçme) bileşenini oynatır; gerçek araştırma ve kayıt evde etkinlik önerisinde kalır.
- **K6 — Asset partileri:** 080–082 sınıf başına görseller (570 yeni görsel: nesne, davranış kartı, sahne), 083 çıkartmalar (53), 084–086 sınıf başına seslendirme (539 satır). 087–089 kullanılmadı. Asset gelene kadar yer tutucu ve cihazın Türkçe sesi kullanılır.

## Dosya haritası

| Dosya | Sorumluluk |
|---|---|
| `content/g1/hayat_bilgisi/u01–u05.json`, `content/g2/hayat_bilgisi/u01–u06.json`, `content/g3/hayat_bilgisi/u01–u06.json` | Üniteler |
| `content/strings.tr.json` | `unit.*`, `node.*`, `hikaye.*`, `label.hb.*` |
| `content/voice_lines.tr.json` | `vo.gN.hayat_bilgisi.*` (giriş, tur, ipucu, hikâye), `vo.ad.*` |
| `content/stickers.json` | `hayat_bilgisi` çıkartma listesi (53) |
| `tests/unit/test_hayat_bilgisi_content.gd` | Kapsam kapısı |
| `asset-requests/080–086` | Görsel, çıkartma ve ses partileri |
| `docs/qa-checklist.md` | Faz 5b manuel kontrolleri |

## Görevler

- [x] Kapsam testi (`test_hayat_bilgisi_content.gd`): oynanabilir her HB çıktısının durağı var, `none` çıktı oyunda yok, ünite numarası tema sırasını izliyor, ünite kaynağı tema sayfasıyla aynı, her durağın çıkartması albümde ve tekil. Önce başarısız (ünite yok) → içerikten sonra geçti.
- [x] 1. sınıf 5 ünite (15 durak), 2. sınıf 6 ünite (21 durak), 3. sınıf 6 ünite (17 durak).
- [x] `ContentValidator` (`test_all_content_valid.gd`) ve tam test paketi yeşil.
- [x] Asset partileri 080–086, `asset-requests/README.md` durum tablosu.
- [x] `docs/qa-checklist.md` Faz 5b bölümü; spec "Açık sorular (Faz 5b)".
