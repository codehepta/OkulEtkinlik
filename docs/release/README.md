# Yayın rehberi (Faz 9 / 9b)

Bu rehber Bilgi Adası'nın Google Play, App Store ve F-Droid yayınını adım adım anlatır. Repo tarafında hazır olanlar:
- Export ön ayarları: `Android` APK, `Android AAB`, `iOS`.
- Uygulama simgesi: `assets/images/app_icon/`, onaylı Bilge görselinden; `tools/imagegen/make_app_icon.py`.
- Sürüm iş akışı: `.github/workflows/release.yml`.
- Mağaza metinleri:
  - Play ve F-Droid: `fastlane/metadata/android/`.
  - App Store: `fastlane/metadata/ios/`.
- Mağaza görselleri:
  - Play: `fastlane/metadata/android/en-US/images/`.
  - App Store: `fastlane/screenshots/tr/`.
- Gizlilik politikası (`PRIVACY.md`) ve sürüm notları (`CHANGELOG.md`).

**İmza anahtarı, mağaza hesapları, ödemeler ve gönderim Emrah'a aittir.** Hiçbir parola, anahtar ya da hesap bilgisi repoya, issue'ya ya da sohbete yazılmaz.

## Emrah'ın yapacakları (özet sıra)
1. **Android imza anahtarı** üret ve iki güvenli yere yedekle (§1). GitHub gizlerini gir (§2).
2. **Play Console**'da uygulamayı oluştur (§4). Kişisel geliştirici hesabında üretime geçmeden önce **en az 12 test kullanıcısıyla 14 gün kesintisiz kapalı test** şartı vardır. Bunu en başta başlat; en uzun süren adım budur.
3. `v1.0.0` etiketini at (§3). CI imzalı AAB ve APK'yı üretir. AAB'yi kapalı test kanalına yükle.
4. **App Store**: Xcode projesini dışa aktar, cihazda dene, arşivle ve TestFlight'a yükle (§6). App Store Connect formlarını §6'daki yanıtlarla doldur.
5. Kapalı test süresi dolunca Play'de üretime başvur. App Store'da incelemeye gönder.
6. İsteğe bağlı: F-Droid başvurusu (§5).

## 0. Yayından önce
- [ ] `docs/qa-checklist.md` → "Faz 8 — Sürüm adayı ölçütleri" ve "Faz 9b" tamam.
- [ ] Sürüm numaraları aynı. `tests/unit/test_release_metadata.gd` bunu denetler.
  - `project.godot` `config/version`.
  - `export_presets.cfg` Android `version/name`, iki ön ayarda.
  - iOS `application/short_version`.
  - Android `version/code` her yeni sürümde +1 olur ve iki Android ön ayarında aynı tutulur.
- [ ] `CHANGELOG.md` yazıldı. Sürüm notları da yazıldı:
  - Play: `fastlane/metadata/android/{tr-TR,en-US}/changelogs/<version/code>.txt`.
  - App Store: `fastlane/metadata/ios/{tr,en-US}/release_notes.txt`.
- [ ] Arayüz değiştiyse mağaza görsellerini yenile (§7).

## 1. Android imza anahtarı (bir kez, Emrah'ın bilgisayarında)
```bash
keytool -genkeypair -v -keystore bilgi-adasi-release.keystore -alias bilgiadasi \
  -keyalg RSA -keysize 4096 -validity 10000
```
- Anahtar dosyasını ve parolayı **en az iki güvenli yerde** yedekle (ör. parola yöneticisi + şifreli harici disk). Play App Signing açıkken bu anahtar "yükleme anahtarı" olur; kaybolursa Play Console'dan sıfırlatılabilir. F-Droid/GitHub APK'sı için ise yeri doldurulamaz.
- `*.keystore` `.gitignore`'dadır; repoya girmez.

## 2. GitHub gizleri (bir kez)
Repo → Settings → Secrets and variables → Actions → New repository secret:
| Ad | Değer |
|---|---|
| `ANDROID_KEYSTORE_BASE64` | `base64 -i bilgi-adasi-release.keystore` çıktısı (macOS) |
| `ANDROID_KEYSTORE_ALIAS` | `bilgiadasi` (1. adımdaki alias) |
| `ANDROID_KEYSTORE_PASSWORD` | anahtar parolası |

## 3. Sürüm derlemesi
```bash
git checkout main && git pull
git tag v1.0.0 && git push origin v1.0.0
```
"Sürüm" iş akışı iki paket üretir:
- imzalı `bilgi-adasi.apk` (F-Droid / GitHub),
- `bilgi-adasi.aab` (Play Store).

İş akışı paketleri denetler: hedef SDK en az 36, hiç izin yok, içerik var, testler pakette değil, boyut bütçesi. Sonra **taslak** bir GitHub sürümü açar; yayımlamak Emrah'ın elindedir.

Yerelde derlemek istersen önce şunlar kurulu olmalı: Godot, export şablonları, JDK 17 ve Android SDK (platform 36).
```bash
export JAVA_HOME=/opt/homebrew/opt/openjdk@17 ANDROID_HOME=$HOME/Library/Android/sdk
export GODOT_ANDROID_KEYSTORE_RELEASE_PATH=/yol/bilgi-adasi-release.keystore
export GODOT_ANDROID_KEYSTORE_RELEASE_USER=bilgiadasi
export GODOT_ANDROID_KEYSTORE_RELEASE_PASSWORD='…'
godot --headless --path . --export-release "Android" build/android/bilgi-adasi.apk
godot --headless --path . --install-android-build-template --export-release "Android AAB" build/android/bilgi-adasi.aab
```
Not (2026-10-29 yerel deneme):
- Debug AAB 167 MB, hedef SDK 36, en düşük SDK 24 (Android 7), izin yok.
- Play'in AAB sınırı, cihaza inen temel modül için 200 MB'tır.

## 4. Google Play
1. [Play Console](https://play.google.com/console) geliştirici hesabı aç: tek seferlik ücret ve kimlik doğrulaması gerekir.
   - **Kişisel hesap şartı:** 13 Kasım 2023'ten sonra açılan kişisel hesaplarda üretim kanalı kapalıdır. Önce **kapalı testte en az 12 test kullanıcısı, son 14 gün kesintisiz katılımla** gerekir; ardından Kontrol Paneli'nden üretime başvurulur.
   - Öneri: aile, öğretmen ve veli çevresinden 15–20 kişilik bir Google Grubu ya da e-posta listesi. Test kullanıcılarının uygulamayı yükleyip açık tutması yeterlidir.
   - Kuruluş hesabı (D-U-N-S numarası) bu şarttan muaftır.
2. Yeni uygulama:
   - Ad "Bilgi Adası", varsayılan dil Türkçe (tr-TR).
   - Uygulama türü Oyun, ücretsiz.
   - Kategori Eğitici. Etiketler: Eğitim, Çocuk.
3. **Uygulama içeriği** bölümü:
   - Gizlilik politikası URL'si: `https://github.com/codehepta/OkulEtkinlik/blob/main/PRIVACY.md`.
   - Uygulama erişimi: "Bütün işlevler özel erişim olmadan kullanılabilir". Veli kapısı bir hesap değildir; açıklamaya "veli alanı, ekrandaki çarpma sorusunun cevabı tuş takımıyla girilerek açılır" diye not düş.
   - Reklamlar: hayır.
   - Hedef kitle: **6–8** ve **9–12** yaş grupları (5 yaş ve altı değil). Uygulama böylece Aileler Politikası'na tabi olur. Çocukları hedefleyen içerik: evet.
   - Veri güvenliği: "Uygulama kullanıcı verisi toplamıyor ya da paylaşmıyor". Şifreleme ve veri silme soruları veri toplanmadığı için uygulanmaz.
   - İçerik derecelendirmesi (IARC anketi): kategori "Oyun". Şiddet, korku, cinsellik, küfür, uyuşturucu, kumar, satın alma, kullanıcı etkileşimi, konum paylaşımı yok. Sonuç genellikle "3+ / Genel" olur.
   - Haber uygulaması değil, devlet uygulaması değil, finans ve sağlık özelliği yok.
4. **Mağaza girişi:**
   - Metinler: başlık, kısa ve uzun açıklama `fastlane/metadata/android/tr-TR/` dosyalarından kopyalanır. İngilizce giriş eklenirse `en-US/` kullanılır.
   - Görseller `fastlane/metadata/android/en-US/images/` altındadır:

     | Play alanı | Dosya |
     |---|---|
     | Uygulama simgesi (512×512) | `icon.png` |
     | Öne çıkan görsel (1024×500) | `featureGraphic.jpg` |
     | Telefon ekran görüntüleri (8 adet, 1920×1080) | `phoneScreenshots/1…8.jpg` |
     | 7 inç tablet (2560×1600) | `sevenInchScreenshots/` |
     | 10 inç tablet (2560×1600) | `tenInchScreenshots/` |

   - Mağaza görsellerinde yazı yoktur.
5. Sürüm:
   - AAB'yi "Kapalı test" kanalına yükle ve test kullanıcılarını ekle. **Play App Signing**'i kabul et: Google uygulama imza anahtarını saklar, 1. adımdaki anahtar yükleme anahtarı olur.
   - 14 gün dolunca üretime başvur. Onay gelince sürümü "Üretim"e yükselt.
6. Hedef SDK: Play, 31 Ağustos 2026'dan beri yeni uygulama ve güncellemelerde **API 36 (Android 16)** ister. Godot 4.7 varsayılanı 36'dır, AAB ön ayarında da 36 açıkça yazılıdır. Bu şartı CI denetler (`scripts/ci-check-apk.sh`).

## 5. F-Droid
F-Droid uygulamayı **kaynaktan kendisi derler**; bizim imzalı APK'mızı kullanmaz (isteğe bağlı "tekrarlanabilir derleme" ile bizim imzamız korunabilir). Godot oyunları F-Droid'de export şablonlarını da kaynaktan derleyen bir tarifle yayımlanır; bu yüzden ilk başvuru biraz uğraştırır.
1. GitLab hesabı aç, [fdroiddata](https://gitlab.com/fdroid/fdroiddata) deposunu çatalla.
2. `metadata/io.github.codehepta.bilgiadasi.yml` dosyasını aşağıdaki taslakla ekle, `fdroid lint` ve `fdroid build` ile dene (F-Droid'in [Godot derleme örnekleri](https://gitlab.com/fdroid/fdroiddata/-/tree/master/metadata) içinde "godot" araması yap; şablon derleme adımlarını en güncel örnekten kopyala).
3. Birleştirme isteği (MR) aç. Mağaza metinleri ve sürüm notları repodaki `fastlane/metadata/android/` klasöründen otomatik okunur.

```yaml
# metadata/io.github.codehepta.bilgiadasi.yml (taslak; Builds bölümü F-Droid'in güncel Godot örneğine göre tamamlanır)
Categories:
  - Games
  - Science & Education
License: MIT
AuthorName: codehepta
WebSite: https://github.com/codehepta/OkulEtkinlik
SourceCode: https://github.com/codehepta/OkulEtkinlik
IssueTracker: https://github.com/codehepta/OkulEtkinlik/issues
Changelog: https://github.com/codehepta/OkulEtkinlik/blob/main/CHANGELOG.md
AutoName: Bilgi Adası
RepoType: git
Repo: https://github.com/codehepta/OkulEtkinlik.git
Builds:
  - versionName: 1.0.0
    versionCode: 1
    commit: v1.0.0
    # Godot 4.7.2 motoru ve Android şablonu kaynaktan derlenir (srclibs), sonra:
    # godot --headless --path . --export-release "Android" bilgi-adasi.apk
AutoUpdateMode: Version
UpdateCheckMode: Tags
CurrentVersion: 1.0.0
CurrentVersionCode: 1
```
Not: İçerik CC BY 4.0, Andika yazı tipi SIL OFL'dir; F-Droid bunları sorun saymaz. Uygulamada izin, reklam ya da izleyici olmadığı için "Anti-Features" yoktur.

## 6. App Store (iOS / iPadOS)
Gerekenler:
- macOS ve Xcode.
- Apple Developer Program üyeliği (yıllık ücretli). iOS ön ayarındaki Team ID `M94NZZPTQF`; Apple Developer → Membership'teki değerle aynı mı, kontrol et.
- Godot 4.7 editörü ve export şablonları.

Ön ayar ayarları:
- Paket kimliği `io.github.codehepta.bilgiadasi`, iPhone ve iPad, en düşük iOS 15, yalnızca yatay.
- `ITSAppUsesNonExemptEncryption=false`: şifreleme beyanı, her yüklemede sorulmaz.
- Kamera, mikrofon ve fotoğraf açıklamaları "kullanmaz" der. Motor bu API'lere bağlı olduğundan alanlar boş bırakılamaz; uygulama bu izinleri hiç istemez.
- Gizlilik bildirimi (`PrivacyInfo.xcprivacy`) Godot'nun ürettiği gerekçeli API listesidir; izleme yoktur.
- Veli yedeği "Dosyalar" uygulamasında görünür (`user_data/accessible_from_files_app`).

### 6.1 Derleme
```bash
godot --headless --path . --export-release "iOS" build/ios/bilgi-adasi.ipa   # ön ayar yalnızca Xcode projesi üretir
open build/ios/bilgi-adasi.xcodeproj
```
1. Xcode → hedef "bilgi-adasi" → Signing & Capabilities → "Automatically manage signing", takımını seç.
2. Gerçek bir iPhone ya da iPad'i bağla ve çalıştır. **Simülatör çalışmaz:** Godot'nun resmi iOS şablonundaki simülatör kütüphanesi yalnızca x86_64'tür; iOS 26 simülatörü bunu kabul etmez (2026-10-29 denendi). Cihaz yoksa TestFlight kullan.
3. Product → Archive → Distribute App → App Store Connect → Upload.

### 6.2 App Store Connect
1. Apps → "+" → New App:
   - Platform iOS, ad **"Bilgi Adası: 1-3. Sınıf"** ("Bilgi Adası" App Store'da başka bir uygulamada; cihazdaki ad yine "Bilgi Adası"), birincil dil Türkçe.
   - **Durum (2026-10-31):** kayıt açıldı (Apple ID 6829281918). App ID ve App Store profili API anahtarıyla oluşturuldu; 1.0.1 (2) TestFlight'a yüklendi; metinler ve ekran görüntüleri fastlane ile yüklendi.
   - Paket kimliği `io.github.codehepta.bilgiadasi`, SKU `bilgiadasi`.
2. **App Information:**
   - Kategori: birincil Eğitim, ikincil Oyunlar → Eğitici.
   - **Made for Kids / Çocuklar kategorisi:** yaş bandı **6–8**.
   - Telif: "2026 codehepta".
3. **Yaş derecelendirmesi anketi:**
   - Şiddet, korku, cinsellik, küfür, alkol/uyuşturucu, kumar ve tıbbi içerik sorularının hepsine "Yok".
   - Sınırsız web erişimi yok. Kullanıcı üretimi içerik, mesajlaşma ve sohbet yok.
   - Uygulama içi kontroller: veli alanı var ama ebeveyn denetimi özelliği yok. Sosyal medya özelliği yok. Reklam yok.
   - Beklenen sonuç 4+.
4. **App Privacy:**
   - Gizlilik politikası URL'si yukarıdaki ile aynı.
   - Veri toplama: **"Hayır, bu uygulamadan veri toplamıyoruz" (Data Not Collected).**
5. **Sürüm sayfası:**
   - Metinler `fastlane/metadata/ios/tr/` altında: ad, alt başlık, açıklama, anahtar kelimeler, tanıtım metni, sürüm notu, destek, pazarlama ve gizlilik URL'leri. `en-US/` İngilizce yerelleştirmedir.
   - Ekran görüntüleri `fastlane/screenshots/tr/` altında:
     - `iphone_69_*`: iPhone 6.9", 2868×1320.
     - `ipad_13_*`: iPad 13", 2752×2064.
     - Her biri 10 kare, sıra dosya adındadır.
   - fastlane kuruluysa hepsi tek komutla yüklenir:
     `fastlane deliver --metadata_path fastlane/metadata/ios --screenshots_path fastlane/screenshots`
6. **App Review bilgisi:**
   - Giriş gerekmez.
   - Not: "Uygulama ağ kullanmaz; veli alanı ekrandaki çarpma sorusunun cevabıyla açılır (Çocuklar kategorisi veli kapısı)."
7. TestFlight'ta dene → "Add for Review" → Submit.

**Çocuklar kategorisi kuralları:**
- Üçüncü taraf analitik ya da reklam yok.
- Uygulama dışına bağlantı yok.
- Satın alma yok.
- Veli alanı veli kapısının arkasında.

Uygulama bu kuralları sağlar. Yeni sürümlerde bu durum korunmalıdır.

## 7. Mağaza görsellerini yenileme
Arayüz değişince dört cihaz boyutunda ekran görüntüsü alınır. macOS'ta, Retina ekranda pencerenin bu piksel boyutlarına sığması gerekir. Ardından seçili kareler fastlane klasörlerine konur:
```bash
for pair in 2868x1320:iphone_69 2752x2064:ipad_13 1920x1080:android_phone 2560x1600:android_tablet; do
  godot --path . --resolution "${pair%%:*}" -s res://tools/store_screenshots.gd -- "${pair#*:}"
done
uv run --project tools/imagegen python tools/imagegen/make_store_images.py
```
- Seçim ve sıra: `make_store_images.py` içindeki `PLAY` / `APPLE` listeleri.
- Uygulama simgesi değişirse: `uv run --with pillow python tools/imagegen/make_app_icon.py`, ardından `godot --headless --path . --import`.

## 8. Yayından sonra
- GitHub taslak sürümünü yayımla. README'deki durum satırını güncelle.
- Bir sonraki sürüm için:
  - Android `version/code`'u artır (iki ön ayarda). iOS `application/version`'ı da artır.
  - `CHANGELOG.md`'ye yeni başlık aç.
  - Yeni `changelogs/<code>.txt` ve iOS `release_notes.txt` dosyalarını yaz.
