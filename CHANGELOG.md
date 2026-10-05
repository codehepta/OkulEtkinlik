# Sürüm notları

Biçim: [Keep a Changelog](https://keepachangelog.com/tr/1.1.0/). Sürüm numaraları: `project.godot` `config/version`, Android `version/name` ve iOS `short_version` aynı tutulur; Android `version/code` her sürümde bir artar. Mağaza sürüm notu: `fastlane/metadata/android/<dil>/changelogs/<version/code>.txt`.

## [1.0.0] — sürüm adayı
### Eklendi
- Bilgi Adası: Sayı Ormanı (Matematik 1–3), Harf Vadisi (Türkçe 1–3), Hayat Kasabası (Hayat Bilgisi 1–3), Keşif Laboratuvarı (Fen Bilimleri 3; 1–2. sınıfta kilitli bulut).
- 16 mini oyun şablonu; MEB öğrenme çıktılarına bağlı 328 durak, 1258 tur.
- Uyarlanabilir zorluk (Faz 7b), Leitner tekrarı ve Tekrar Bulutu, çıkartma albümü, Bilge'nin Ağaç Evi.
- 4 çocuk profili; veli kapısı ve veli paneli (ilerleme, günlük süre sınırı, ses ayarları, evde etkinlik önerileri, dışa/içe aktarma).
- Erişilebilirlik: bütün yönergeler seslendirilir, 128 px dokunma hedefleri, WCAG AA kontrast, "hareketi azalt".

### Bilinen eksikler
- Görsel ve seslerin çoğu yer tutucu / cihaz TTS'i; asset partileri sahibin üretimini bekliyor (`asset-requests/README.md`).
- Öğretmen gözden geçirmesi bekleyen metinler: Türkçe hikâyeleri, Hayat Bilgisi (Atatürk, güvenlik), harf vuruş sırası (`docs/qa-checklist.md`).
