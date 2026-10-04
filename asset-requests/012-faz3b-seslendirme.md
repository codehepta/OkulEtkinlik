# 012 · Faz 3b seslendirmesi: tahmin modu ve 1. sınıf saatleri (Gemini TTS)

**Öncelik: ORTA** (Faz 3b). Tahmin modunun adım yönergeleri (`vo.tahmin.*`: sayarak kontrol, tartma, işlem, "yakın mı uzak mı?") ve 1. sınıfta dijital saat gösterilmediği için saat okuma / kurma oyununda seslendirilen tam ve yarım saatler (`vo.saat.<saat>_<dakika>`).

> Bu dosya eklenmeden de oyun çalışır: eksik satırları cihazın Türkçe sesiyle okur.

## Nasıl üretilir
007'deki adımların aynısı: Google AI Studio → "Generate speech", tek konuşmacı, 005'te seçilen **aynı iki ses** (Anlatıcı, Bilge). Her satırı **Dosya yolu** sütunundaki isimle `.wav` (ya da mono `.ogg`) kaydet; klasörler yoksa oluştur.

## Ortak üslup talimatları
- **ANLATICI:** `Sıcak, sakin ve net bir sesle, 6-8 yaşındaki bir çocuğa konuşur gibi, yavaş ve anlaşılır oku. Kelimeleri tane tane söyle, cümle sonlarında kısa bir duraklama yap.`
- **BILGE:** `Neşeli, sevimli ve enerjik bir çizgi film karakteri gibi konuş. Gülümseyerek, coşkulu ama anlaşılır ve çok hızlı olmayan bir tempoyla söyle.`

Ek not (saatler): Saat adını ("üç", "on iki") ve "buçuk" sözcüğünü net söyle; çocuk saati yalnızca sesten tanıyacak.

## Satırlar

| # | Kimlik (anahtar) | Dosya yolu | Konuşmacı | Metin |
|---|---|---|---|---|
| 1 | `vo.tahmin.say` | `assets/audio/voice/tahmin/say.wav` | BILGE | Şimdi sayarak kontrol edelim. Her birine dokun. |
| 2 | `vo.tahmin.tart` | `assets/audio/voice/tahmin/tart.wav` | BILGE | Şimdi tartalım. Küpleri teraziye koy, terazi düz olunca dur. |
| 3 | `vo.tahmin.islem` | `assets/audio/voice/tahmin/islem.wav` | BILGE | Şimdi işlemi yap. Terazinin doğru sayısını seç. |
| 4 | `vo.tahmin.karsilastir` | `assets/audio/voice/tahmin/karsilastir.wav` | BILGE | Tahminin sonuca yakın mı, uzak mı? |
| 5 | `vo.saat.1_00` | `assets/audio/voice/saat/1_00.wav` | ANLATICI | Saat bir. |
| 6 | `vo.saat.1_30` | `assets/audio/voice/saat/1_30.wav` | ANLATICI | Saat bir buçuk. |
| 7 | `vo.saat.2_00` | `assets/audio/voice/saat/2_00.wav` | ANLATICI | Saat iki. |
| 8 | `vo.saat.2_30` | `assets/audio/voice/saat/2_30.wav` | ANLATICI | Saat iki buçuk. |
| 9 | `vo.saat.3_00` | `assets/audio/voice/saat/3_00.wav` | ANLATICI | Saat üç. |
| 10 | `vo.saat.3_30` | `assets/audio/voice/saat/3_30.wav` | ANLATICI | Saat üç buçuk. |
| 11 | `vo.saat.4_00` | `assets/audio/voice/saat/4_00.wav` | ANLATICI | Saat dört. |
| 12 | `vo.saat.4_30` | `assets/audio/voice/saat/4_30.wav` | ANLATICI | Saat dört buçuk. |
| 13 | `vo.saat.5_00` | `assets/audio/voice/saat/5_00.wav` | ANLATICI | Saat beş. |
| 14 | `vo.saat.5_30` | `assets/audio/voice/saat/5_30.wav` | ANLATICI | Saat beş buçuk. |
| 15 | `vo.saat.6_00` | `assets/audio/voice/saat/6_00.wav` | ANLATICI | Saat altı. |
| 16 | `vo.saat.6_30` | `assets/audio/voice/saat/6_30.wav` | ANLATICI | Saat altı buçuk. |
| 17 | `vo.saat.7_00` | `assets/audio/voice/saat/7_00.wav` | ANLATICI | Saat yedi. |
| 18 | `vo.saat.7_30` | `assets/audio/voice/saat/7_30.wav` | ANLATICI | Saat yedi buçuk. |
| 19 | `vo.saat.8_00` | `assets/audio/voice/saat/8_00.wav` | ANLATICI | Saat sekiz. |
| 20 | `vo.saat.8_30` | `assets/audio/voice/saat/8_30.wav` | ANLATICI | Saat sekiz buçuk. |
| 21 | `vo.saat.9_00` | `assets/audio/voice/saat/9_00.wav` | ANLATICI | Saat dokuz. |
| 22 | `vo.saat.9_30` | `assets/audio/voice/saat/9_30.wav` | ANLATICI | Saat dokuz buçuk. |
| 23 | `vo.saat.10_00` | `assets/audio/voice/saat/10_00.wav` | ANLATICI | Saat on. |
| 24 | `vo.saat.10_30` | `assets/audio/voice/saat/10_30.wav` | ANLATICI | Saat on buçuk. |
| 25 | `vo.saat.11_00` | `assets/audio/voice/saat/11_00.wav` | ANLATICI | Saat on bir. |
| 26 | `vo.saat.11_30` | `assets/audio/voice/saat/11_30.wav` | ANLATICI | Saat on bir buçuk. |
| 27 | `vo.saat.12_00` | `assets/audio/voice/saat/12_00.wav` | ANLATICI | Saat on iki. |
| 28 | `vo.saat.12_30` | `assets/audio/voice/saat/12_30.wav` | ANLATICI | Saat on iki buçuk. |

---
## Teslim kontrol listesi
- [ ] Dosya adları ve klasörler tablodakiyle birebir aynı (`assets/audio/voice/tahmin/`, `assets/audio/voice/saat/`)
- [ ] 005'teki seslerle aynı Anlatıcı ve Bilge sesi kullanıldı
- [ ] Saatlerde "buçuk" ve saat adı net duyuluyor
- [ ] `godot --headless --path . -s res://tools/missing_assets.gd` bu satırları artık eksik göstermiyor
- [ ] Commit: `assets: 012 faz 3b seslendirmesi`
