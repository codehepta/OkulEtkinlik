# Katkı Rehberi — Bilgi Adası

Bilgi Adası'na katkı vermek istediğin için teşekkürler! Bu proje 6–9 yaş çocuklar için **ücretsiz ve açık kaynak** bir eğitim oyunu. Bu yüzden bazı kurallarımız pazarlık konusu değildir; lütfen önce onları oku.

## İçindekiler
1. [Pazarlık konusu olmayan kurallar](#1-pazarlık-konusu-olmayan-kurallar)
2. [Nasıl katkı verebilirim?](#2-nasıl-katkı-verebilirim)
3. [Geliştirme ortamı](#3-geliştirme-ortamı)
4. [Dal, commit ve PR akışı](#4-dal-commit-ve-pr-akışı)
5. [Kod kuralları](#5-kod-kuralları)
6. [İçerik ve müfredat katkısı](#6-içerik-ve-müfredat-katkısı)
7. [Görsel ve ses katkısı](#7-görsel-ve-ses-katkısı)
8. [İnceleme ve birleştirme](#8-inceleme-ve-birleştirme)
9. [Etiketler](#9-etiketler)

---

## 1. Pazarlık konusu olmayan kurallar
- **Ağ yok.** Uygulama hiçbir ağ isteği yapmaz. Analitik, reklam, uygulama içi satın alma, hesap ya da üçüncü taraf SDK eklenmez. Android'de INTERNET dahil hiçbir izin açılmaz (CI bunu her APK'da denetler).
- **Kişisel veri yok.** Yalnızca isteğe bağlı takma ad tutulur ve cihazda kalır.
- **Çocuk UX'i:** ceza, can kaybı, süre baskısı, şans kutusu, seri (streak) baskısı ya da sosyal karşılaştırma yok. Bütün yönergeler seslendirilir ve tekrar dinlenebilir. Dokunma hedefleri en az 128×128 px (1080p tabanında). Renk tek başına anlam taşımaz. Yanıp sönen animasyon yok; "hareketi azalt" ayarına uyulur.
- **Müfredat kodu uydurulmaz.** Her öğrenme çıktısı resmi MEB kaynağından (PDF adı ve sayfası) doğrulanır. Ayrıntı: [§6](#6-içerik-ve-müfredat-katkısı).
- **Görsellerde metin, harf ya da rakam olmaz.** Harf ve rakamlar oyun içinde yazı tipiyle çizilir.
- **Atıf satırı yok.** Commit mesajlarına ve PR açıklamalarına `Co-Authored-By`, "Generated with …" ya da benzeri satır eklenmez.

## 2. Nasıl katkı verebilirim?
- **Hata bildir:** [Hata bildirimi](../../issues/new?template=bug_report.yml) şablonunu kullan.
- **Öneri getir:** [Özellik önerisi](../../issues/new?template=feature_request.yml).
- **İçerik ya da müfredat hatası:** [İçerik / müfredat](../../issues/new?template=content_issue.yml) şablonu. Öğretmenlerin geri bildirimi özellikle değerli!
- **Kod, içerik, görsel ya da ses katkısı:** önce bir issue açarak ne yapmak istediğini konuş; büyük işlerde boşa emek harcanmasın.
- **Güvenlik ya da gizlilik açığı:** herkese açık issue açma; [SECURITY.md](SECURITY.md)'deki yolu izle.

Tüm katılımcılardan [Davranış Kuralları](CODE_OF_CONDUCT.md)'na uymalarını bekliyoruz.

## 3. Geliştirme ortamı
Gerekenler: Git, Bash (Linux/macOS; Windows'ta WSL ya da Git Bash). Godot'yu betik kurar.

```bash
git clone https://github.com/codehepta/OkulEtkinlik.git
cd OkulEtkinlik
scripts/setup-godot.sh                  # Godot 4.7.2 (yalnızca editör/headless)
export PATH="$HOME/.local/bin:$PATH"
godot --headless --path . --import       # ilk içe aktarma
godot --headless --path . -s addons/gut/gut_cmdln.gd -gdir=res://tests -ginclude_subdirs -gexit
```
- Tek test dosyası: komuta `-gselect=test_dosya_adi.gd` ekle.
- Testleri **sıralı** çalıştır: aynı anda yalnızca bir `godot` süreci (paralel süreçler `user://` test dizinlerini bozar).
- Eksik asset raporu: `godot --headless --path . -s res://tools/missing_assets.gd`
- Bütün ekranların görüntüsü (`build/screens/`): `godot --path . -s res://tools/ui_screenshots.gd` (sunucuda: `xvfb-run -a -s "-screen 0 1920x1080x24" godot --path . --rendering-method gl_compatibility --rendering-driver opengl3 --resolution 1920x1080 -s res://tools/ui_screenshots.gd`)
- Android debug APK (export şablonları gerekir: `scripts/setup-godot.sh --with-templates`):
  `godot --headless --path . --export-debug "Android" build/android/bilgi-adasi-debug.apk`

Projenin tasarımı için önce [spec](docs/superpowers/specs/2026-10-04-bilgi-adasi-design.md)'i oku; tek doğruluk kaynağı odur.

## 4. Dal, commit ve PR akışı
1. `main` korumalıdır; doğrudan push edilmez. Her iş için `main`'den bir dal aç:
   | Önek | Ne için | Örnek |
   |---|---|---|
   | `feat/` | yeni özellik, şablon, ekran | `feat/sablon-sequence` |
   | `fix/` | hata düzeltme | `fix/altyazi-tasmasi` |
   | `content/` | ünite içeriği, metin, ses satırı | `content/g1-turkce-u01` |
   | `assets/` | görsel/ses dosyası, asset isteği | `assets/faz1-sesler` |
   | `docs/` | doküman | `docs/katki-rehberi` |
   | `ci/`, `chore/` | CI, araçlar, bakım | `ci/actions-guncelle` |
2. **Küçük ve anlamlı commit'ler.** Biçim: `tür(kapsam): kısa açıklama` — tür: `feat`, `fix`, `content`, `assets`, `docs`, `test`, `ci`, `chore`, `ui`, `tools`. Açıklama Türkçe olabilir. Örnek: `feat(games): sequence şablonu ve testleri`.
3. **TDD:** önce başarısız testi yaz, sonra kodu.
4. Push et ve `main`'e PR aç. PR şablonu otomatik gelir; bütün kutuları doldur.
5. CI (`test` + `android-debug`) yeşil olmadan PR birleştirilmez.
6. Birleştirme yöntemi: **merge commit** (görev başına commit geçmişi korunur). Birleşen dal silinir.
7. Spec'le çelişen ya da spec'in sessiz kaldığı bir konuda varsayım yapma; PR açıklamasına **"Açık soru"** olarak yaz ve sahibin kararını bekle.

## 5. Kod kuralları
- **Godot 4.7.2 + GDScript**, .NET yok. Değişken, parametre ve dönüş tipleri **statik** belirtilir.
- **Kullanıcıya görünen metin kodda yazılmaz:** arayüz metinleri `content/strings.tr.json`, ses satırları `content/voice_lines.tr.json` içinde. İstisna: yalnızca geliştiriciye çıktı veren `tools/*` ve `push_error`/`push_warning` günlükleri.
- Dokümanlar ve kod yorumları **Türkçe**; tanımlayıcılar (değişken, fonksiyon, dosya, sınıf) **İngilizce**.
- Dosya/klasör adları `snake_case`, Türkçe karakter yok.
- Saf mantık `scripts/core/` altında, sahnesiz ve test edilebilir; autoload'lar ince kalır.
- `class_name` yalnızca gerçekten paylaşılan tipler için.
- Stil: renk ve kutu stilleri `scripts/ui/clay_style.gd` (ClayStyle) üzerinden; ekranlarda yeni `StyleBoxFlat` üretme.
- Godot'nun ürettiği `.uid` ve `.import` dosyalarını ilgili dosyayla birlikte commit'le.
- `res://` dosya varlığını `ResourceLoader.exists()` ile kontrol et (export sonrası `FileAccess.file_exists()` yanıltır).

## 6. İçerik ve müfredat katkısı
- İçerik Türkiye Yüzyılı Maarif Modeli (TYMM) öğretim programlarına göre eşlenir. Resmi PDF'ler ve metin dökümleri `docs/curriculum/sources/` altındadır (URL'ler o klasörün README'sinde).
- Her öğrenme çıktısı `docs/curriculum/outcomes.json`'a **resmi koduyla, birebir metniyle, PDF adı ve sayfa numarasıyla** girilir. Doğrulayamadığın kodu yazma; issue aç.
- Ünite dosyaları `content/g<sınıf>/<ders>/uNN.json`. Biçim: spec §4.3. Her durak en az bir doğrulanmış çıktıya bağlıdır; 3–5 tur, zorluk durak içinde artar.
- İçerik JSON'u `ContentValidator`'dan geçmeden commit edilmez — `tests/unit/test_all_content_valid.gd` CI'da bunu zorunlu kılar.
- Ses satırı metinleri kısa, somut, sıcak ve yaşa uygun olmalı; baskı ya da ceza dili kullanılmaz.

## 7. Görsel ve ses katkısı
- Stil: [stil rehberi](docs/assets/style-guide.md) (3D kil/oyuncak). Dosya yolları: [isimlendirme](docs/assets/naming.md) — doğru yola doğru adla konan dosyayı oyun kendisi bulur.
- Görseller PNG (sprite'larda şeffaf arka plan); sesler `.ogg` (tercih), `.wav` ya da `.mp3`.
- Yeni asset ihtiyacı `asset-requests/NNN-konu.md` parti dosyasıyla tanımlanır (mevcut dosyaların biçiminde; promptlar İngilizce, stil bloğu tam metin). [asset-requests/README.md](asset-requests/README.md) durum tablosunu güncelle.
- Katkı verdiğin asset'lerin lisansı **CC BY 4.0** ile uyumlu olmalı; üçüncü taraf kaynak kullandıysan kaynağı ve lisansı PR'da belirt (`assets/audio/LICENSES.md`, `assets/fonts/LICENSES.md`).
- Asset eksikliği geliştirmeyi durdurmaz: `AssetRegistry` yer tutucu gösterir, `Narrator` cihazın Türkçe TTS sesine düşer.

## 8. İnceleme ve birleştirme
- Her PR'ı en az bir bakımcı inceler (`.github/CODEOWNERS`).
- İnceleyici; kuralları (§1), testleri, ekran görüntülerini (UI değişikliklerinde PR'a ekle) ve spec uyumunu kontrol eder.
- UI değişikliği yapan PR'lar önce/sonra ekran görüntüsü içermelidir (`tools/ui_screenshots.gd`).
- Gerçek cihaz kontrolü için [QA kontrol listesi](docs/qa-checklist.md) kullanılır; fazların sonunda güncellenir.

## 9. Etiketler
| Etiket | Anlamı |
|---|---|
| `hata` | Bir şey bozuk |
| `öneri` | Yeni özellik ya da iyileştirme |
| `içerik` | Ünite içeriği, metin, ses satırı |
| `müfredat` | Öğrenme çıktısı / TYMM eşlemesi |
| `asset` | Görsel ya da ses |
| `arayüz` | Ekran tasarımı, erişilebilirlik |
| `şablon` | Mini oyun şablonu |
| `ci` | CI, derleme, APK |
| `doküman` | Doküman |
| `açık-soru` | Sahibin kararını bekliyor |
| `ilk-katkı-için-uygun` | Yeni katkıcılar için uygun küçük iş |
| `yardım-aranıyor` | Katkı bekleniyor |

---
Sorun mu var? Bir issue aç; birlikte çözelim. 🦉
