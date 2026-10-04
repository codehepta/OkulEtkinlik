# Bilgi Adası (OkulEtkinlik)

MEB 1., 2. ve 3. sınıf öğretim programlarıyla uyumlu, 6–9 yaş çocuklar için **ücretsiz ve açık kaynak** bir mobil eğitim oyunu.

Çocuklar, kil görünümlü maskot **Bilge** baykuşla birlikte **Bilgi Adası**'nı keşfeder. Ada dört bölgeden oluşur: Sayı Ormanı (Matematik), Harf Vadisi (Türkçe), Hayat Kasabası (Hayat Bilgisi) ve Keşif Laboratuvarı (Fen Bilimleri). İçerik, profilde seçilen sınıfa göre değişir.

- 🎮 **Motor:** Godot 4.7 (GDScript) · 📱 **Hedef:** Android ve iOS
- 🧸 **Görsel stil:** 3D kil / oyuncak (claymation)
- 🔊 Bütün yönergeler seslendirilir; okuma bilmeyen çocuk da tek başına oynayabilir
- 🔒 İnternet bağlantısı, reklam, satın alma ve veri toplama yok; her şey cihazda kalır

> **Durum:** Faz 1 tamam — oynanabilir dikey dilim (1. sınıf Matematik, Ünite 1: 6 durak, 3 mini oyun). Görsel ve sesler yer tutucu/TTS ile çalışır; gerçek asset'ler sahibin üretimini bekler.

## Çalıştırma ve test
```bash
scripts/setup-godot.sh && export PATH="$HOME/.local/bin:$PATH"
godot --headless --path . --import
# Testler (aynı anda yalnızca bir godot süreci)
godot --headless --path . -s addons/gut/gut_cmdln.gd -gdir=res://tests -ginclude_subdirs -gexit
```
Gerçek cihazda elle kontrol için [QA kontrol listesi](docs/qa-checklist.md). Debug APK, her PR'da CI ile üretilir.

## Öncelikli asset partileri
Sırayla: [001](asset-requests/001-bilge-maskot.md) (Bilge), [003](asset-requests/003-avatarlar-ve-arayuz.md) (avatarlar ve arayüz), [002](asset-requests/002-harita-ve-bolgeler.md) (harita), [004](asset-requests/004-sayma-nesneleri.md) (sayma nesneleri), [005](asset-requests/005-genel-seslendirme.md) (genel seslendirme); sonra 006 (müzik/efekt), 007 (Ünite 1 seslendirme), 008 (çıkartmalar). Ayrıntı: [asset-requests/README.md](asset-requests/README.md).

## Dokümanlar
- [Tasarım (spec)](docs/superpowers/specs/2026-10-04-bilgi-adasi-design.md)
- [Uygulama planları](docs/superpowers/plans/)
- [QA kontrol listesi (gerçek cihaz)](docs/qa-checklist.md)
- [Görsel stil rehberi](docs/assets/style-guide.md) · [İsimlendirme](docs/assets/naming.md)
- [Asset istekleri (Nano Banana / Gemini TTS promptları)](asset-requests/README.md)

## Katkı
Katkılarını bekliyoruz! Başlamadan önce [Katkı Rehberi](CONTRIBUTING.md)'ni ve [Davranış Kuralları](CODE_OF_CONDUCT.md)'nı oku. Hata ya da öneri için [issue aç](../../issues/new/choose); güvenlik/gizlilik sorunları için [SECURITY.md](SECURITY.md).

## Lisans
- **Kod:** [MIT](LICENSE)
- **İçerik, görseller ve dokümanlar** (`content/`, `assets/`, `docs/`): [CC BY 4.0](LICENSE-CONTENT.md)
- **Yazı tipi Andika:** SIL Open Font License 1.1 ([ayrıntı](assets/fonts/LICENSES.md))
- **GUT** test eklentisi (`addons/gut/`): MIT, kendi lisansıyla
