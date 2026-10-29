# Faz 9b — Mağaza Yayın Hazırlığı (Play Store + App Store): Uygulama Planı

> Yürütme: görevler sırayla; her görev sonunda ilgili testler. Dal: `feat/magaza-hazirligi`.

**Goal:** Bilgi Adası 1.0.0'ı Google Play ve App Store'a gönderilebilir hale getirmek: gerçek uygulama simgesi, Play'in 2026 hedef API şartı (API 36), iOS dışa aktarımının simülatörde çalıştığının doğrulanması, mağaza görselleri (simge, öne çıkan görsel, telefon/tablet ekran görüntüleri), App Store metinleri ve güncel mağaza formu yanıtları. Hesap, imza anahtarı, ödeme ve gönderim Emrah'ındır.

**Dayanak:** Faz 9 planı (`2026-10-08-faz9-yayin.md`), `docs/release/README.md`, CLAUDE.md (ağ yok, atıf yok, görsellerde yazı yok, onaysız asset yok).

**Kararlar (Emrah 2026-10-29: "tüm sorularını önerilen şekilde ilerlet"):**
- Uygulama simgesi yeni görsel üretimiyle değil, onaylı Bilge görselinden (`characters/bilge/happy.png`) kırpılarak yapılır; zemin gökyüzü→ada yeşili geçişi. Son onay PR'da Emrah'ındır.
- Sürüm 1.0.0 / versionCode 1 kalır (henüz hiçbir mağazaya yüklenmedi).
- Play: hedef API 36 (yeni uygulamalar için 31 Ağustos 2026'dan beri zorunlu), en düşük API Godot varsayılanı.
- iOS: iPhone + iPad, en düşük iOS 15, yalnızca yatay. App Store kategorisi Eğitim, Çocuklar (6–8 yaş). Şifreleme beyanı: muaf (`ITSAppUsesNonExemptEncryption=false`).
- Mağaza ekran görüntüleri gerçek oyundan, cihaz piksel boyutunda alınır (iPhone 6.9", iPad 13", Android telefon 1920×1080, tablet 2560×1600).
- Mağaza görsellerinde yazı yoktur (oyun görselleriyle aynı kural; yerelleştirme gerektirmez).

## Görevler
- [x] **1. Uygulama simgesi:** 1024 kaynak (alfasız) → `assets/icon/`; Android ana 192, uyarlanabilir ön/arka/tek renk 432; iOS 1024; `config/icon`, açılış (boot splash) arka plan rengi. Test: simge dosyaları var, ön ayarlar onlara işaret ediyor, iOS simgesi alfasız.
- [x] **2. Hedef API 36:** `Android AAB` ve `Android` ön ayarlarında `target_sdk` 36; `release.yml` `platforms;android-36` + `build-tools;36.0.0`. Yerelde debug AAB üret, manifestte `targetSdkVersion=36` ve paket boyutunu doğrula. Test: `test_release_metadata.gd`'ye hedef SDK denetimi.
- [x] **3. iOS dışa aktarımı:** ön ayara şifreleme beyanı, gizlilik açıklamaları (kamera/mikrofon kullanılmaz), yatay yön; Xcode projesi üret, simülatörde derleyip çalıştır. **Sonuç:** proje üretildi ve x86_64 simülatör için derlendi; iOS 26 simülatörü x86_64'ü kabul etmediği, Godot şablonunda da arm64 simülatör kütüphanesi olmadığı için çalıştırılamadı. Deneme gerçek cihazda ya da TestFlight'ta yapılır. Ek: veli yedeği için Dosyalar erişimi.
- [x] **4. Mağaza ekran görüntüleri:** iPhone 6.9" (2868×1320), iPad 13" (2752×2064) masaüstü Godot'da cihaz piksel boyutunda (`tools/store_screenshots.gd`); Android telefon 1920×1080 ve tablet. 6–8 kare: harita, bölge, 3–4 mini oyun, çıkartma albümü/Ağaç Evi, veli paneli. → `fastlane/screenshots/` ve `fastlane/metadata/android/<dil>/images/`.
- [x] **5. Play görselleri:** 512×512 simge, 1024×500 öne çıkan görsel (bölge arka planı + Bilge, yazısız).
- [x] **6. App Store metinleri:** `fastlane/metadata/ios/{tr,en-US}/` ad, alt başlık, açıklama, anahtar kelimeler, tanıtım metni, sürüm notu, destek/gizlilik URL'leri; karakter sınırları testle denetlenir.
- [x] **7. Metin güncellemeleri:** CHANGELOG ("bilinen eksikler" artık geçersiz; güncel durak/tur sayıları), Play açıklamaları, PRIVACY tarihi.
- [x] **8. Yayın rehberi:** `docs/release/README.md` → API 36, Play kapalı test şartı (kişisel hesap), Aileler politikası, Veri güvenliği; App Store: yaş derecelendirmesi anketi yanıtları, Uygulama Gizliliği "Veri Toplanmıyor", Çocuklar kategorisi, ekran görüntüsü yükleme, TestFlight. Emrah'ın adım listesi en başta.
- [x] **8b. Bulunan hata:** dünya haritası 16:9 dışı ekranlarda ikinci ada gösteriyordu; düz deniz + kenar erimesiyle düzeltildi (test: `test_map_has_one_island_over_plain_sea`).
- [x] **9. Doğrulama:** tam GUT paketi, eksik asset raporu, debug AAB/APK derlemesi, iOS simülatörü; PR.
