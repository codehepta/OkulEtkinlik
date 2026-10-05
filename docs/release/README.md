# Yayın rehberi (Faz 9)

Bu rehber Bilgi Adası'nın Android (F-Droid, Play Store) ve iOS yayınını adım adım anlatır. Repo tarafında her şey hazır: export ön ayarları (`Android` APK, `Android AAB`, `iOS`), sürüm iş akışı (`.github/workflows/release.yml`), mağaza metinleri (`fastlane/metadata/android/`), gizlilik politikası (`PRIVACY.md`) ve sürüm notları (`CHANGELOG.md`).

**İmza anahtarı, mağaza hesapları ve iOS derlemesi sahibe aittir.** Hiçbir parola, anahtar ya da hesap bilgisi repoya, issue'ya ya da sohbete yazılmaz.

Önerilen sıra (spec "Açık sorular (Faz 9)"): önce F-Droid + Play Store, iOS sahibin Mac'i hazır olunca. 3D maskot v1.0 sonrasına ertelendi.

## 0. Yayından önce
- [ ] `docs/qa-checklist.md` → "Faz 8 — Sürüm adayı ölçütleri" tamam.
- [ ] Sürüm numarası: `project.godot` `config/version`, `export_presets.cfg` Android `version/name` (iki ön ayarda) ve iOS `application/short_version` aynı; Android `version/code` her yeni sürümde +1 (iki Android ön ayarında aynı). `tests/unit/test_release_metadata.gd` bunu denetler.
- [ ] `CHANGELOG.md` ve `fastlane/metadata/android/{tr-TR,en-US}/changelogs/<version/code>.txt` yazıldı.

## 1. Android imza anahtarı (bir kez, sahibin bilgisayarında)
```bash
keytool -genkeypair -v -keystore bilgi-adasi-release.keystore -alias bilgiadasi \
  -keyalg RSA -keysize 4096 -validity 10000
```
- Anahtar dosyasını ve parolayı **en az iki güvenli yerde** yedekle (ör. parola yöneticisi + şifreli harici disk). Anahtar kaybolursa uygulama aynı adla güncellenemez.
- `*.keystore` `.gitignore`'dadır; repoya girmez.

## 2. GitHub gizleri (bir kez)
Repo → Settings → Secrets and variables → Actions → New repository secret:
| Ad | Değer |
|---|---|
| `ANDROID_KEYSTORE_BASE64` | `base64 -w0 bilgi-adasi-release.keystore` çıktısı (macOS: `base64 -i dosya`) |
| `ANDROID_KEYSTORE_ALIAS` | `bilgiadasi` (1. adımdaki alias) |
| `ANDROID_KEYSTORE_PASSWORD` | anahtar parolası |

## 3. Sürüm derlemesi
```bash
git checkout main && git pull
git tag v1.0.0 && git push origin v1.0.0
```
"Sürüm" iş akışı imzalı `bilgi-adasi.apk` (F-Droid / GitHub) ve `bilgi-adasi.aab` (Play Store) üretir, izin ve içerik denetiminden geçirir ve **taslak** bir GitHub sürümü açar. Taslağı kontrol edip "Publish release" demek sahibin elindedir.

Yerelde derlemek istersen (Godot, export şablonları, JDK 17 ve Android SDK kurulu olmalı):
```bash
export GODOT_ANDROID_KEYSTORE_RELEASE_PATH=/yol/bilgi-adasi-release.keystore
export GODOT_ANDROID_KEYSTORE_RELEASE_USER=bilgiadasi
export GODOT_ANDROID_KEYSTORE_RELEASE_PASSWORD='…'
godot --headless --path . --export-release "Android" build/android/bilgi-adasi.apk
godot --headless --path . --install-android-build-template --export-release "Android AAB" build/android/bilgi-adasi.aab
```

## 4. Play Store
1. [Play Console](https://play.google.com/console) geliştirici hesabı aç (tek seferlik ücret, kimlik doğrulama gerekir). Kişisel hesaplarda yayından önce kapalı test şartı olabilir; Console'un o anki yönergesini izle.
2. Yeni uygulama: ad "Bilgi Adası", dil Türkçe, ücretsiz, oyun → Eğitici.
3. **Uygulama içeriği** bölümü:
   - Gizlilik politikası URL'si: `https://github.com/codehepta/OkulEtkinlik/blob/main/PRIVACY.md`
   - Reklamlar: hayır.
   - Hedef kitle: 5 yaş ve altı değil; **6–8** ve **9–12** yaş grupları. Uygulama Aileler politikasına tabi olur (çocuklara yönelik uygulamalar için Google'ın Aileler Politikası).
   - Veri güvenliği: "Uygulama kullanıcı verisi toplamıyor ya da paylaşmıyor" (veri toplanmaz, şifreleme sorusu uygulanmaz, veri silme isteği sorusu: veri toplanmadığı için uygulanmaz).
   - İçerik derecelendirmesi (IARC anketi): şiddet, korku, kumar, satın alma, kullanıcı etkileşimi yok → genellikle "3+ / Genel".
   - Haber uygulaması değil, devlet uygulaması değil, finans özelliği yok.
4. **Mağaza girişi:** başlık, kısa ve uzun açıklama `fastlane/metadata/android/tr-TR/` dosyalarından kopyalanır. Gerekli görseller: 512×512 simge, 1024×500 öne çıkan görsel, en az 2 telefon ekran görüntüsü (asset'ler gelince `tools/ui_screenshots.gd` ile alınır). Mağaza görselleri oyun asset'i sayılmaz; üzerlerinde başlık yazısı olabilir.
5. Sürüm: "Dahili test" → AAB'yi yükle → kendi cihazında dene → "Üretim"e yükselt. Play App Signing'i kabul et (Google uygulama imza anahtarını saklar; 1. adımdaki anahtar yükleme anahtarı olur).

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

## 6. iOS (sahibin Mac'i hazır olunca)
Gerekenler: macOS + Xcode, Apple Developer Program üyeliği (yıllık ücretli), Godot 4.7.2 editörü ve export şablonları.
1. `export_presets.cfg` iOS ön ayarında `application/app_store_team_id` kendi Team ID'n mi, kontrol et (Apple Developer → Membership). Paket kimliği `io.github.codehepta.bilgiadasi`.
2. Godot editöründe Proje → Dışa Aktar → iOS → "Projeyi dışa aktar" (ön ayar yalnızca Xcode projesi üretir).
3. Xcode'da projeyi aç → Signing & Capabilities → takımını seç → gerçek iPad/iPhone'da çalıştır.
4. App Store Connect'te uygulama oluştur: kategori Eğitim, **Çocuklar kategorisi** (6–8 ve 9–11 yaş). Gizlilik "Veri Toplanmıyor" (Data Not Collected). Gizlilik politikası URL'si yukarıdaki ile aynı.
5. Xcode → Product → Archive → Distribute → App Store Connect → TestFlight'ta dene → incelemeye gönder.
Not: Ön ayar `targeted_device_family=2` (iPhone + iPad) ve en düşük iOS 15'tir.

## 7. Yayından sonra
- GitHub taslak sürümünü yayımla; README'deki durum satırını güncelle.
- Bir sonraki sürüm için `version/code`'u artır, `CHANGELOG.md`'ye yeni başlık aç.
