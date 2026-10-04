# 024 · Faz 7a seslendirmesi: Tekrar Bulutu ve Ağaç Evi (Gemini TTS)

**Öncelik: ORTA** (Faz 7a, ödül ve tekrar döngüsü). Tekrar Bulutu oturumunun girişi ve Ağaç Evi'nin iki yeni satırı.

> Bu dosya eklenmeden de oyun çalışır: eksik satırları cihazın Türkçe sesiyle okur.

Şu satırlar 005'te zaten istendi, burada tekrar edilmez: `vo.genel.tekrar_bulutu` (patikada bulut belirince), `vo.genel.agac_ev_giris` (Ağaç Evi'ne giriş), `vo.genel.hediye` (yeni süs kazanınca), `vo.bolge.agac_ev`.

## Nasıl üretilir
1. **Google AI Studio → "Generate speech"** (Gemini TTS) ekranını aç. Çoklu konuşmacı modunu kapat, tek konuşmacı kullan.
2. **Ses seçimi:** 005'in en altındaki "Seçilen sesler" bölümüne yazdığın **aynı sesi** kullan (Bilge).
3. **Üslup talimatı** alanını "Style instructions / system" kısmına, **Metin** alanını konuşma metnine yapıştır.
4. Çıktıyı (`.wav`) **Dosya yolu** sütunundaki isimle kaydet. `.wav` kabul edilir; istersen `.ogg`'ye çevirebilirsin (mono, 22–44 kHz).
5. Dinleyip kontrol et: Türkçe telaffuz doğru mu, tempo 6 yaşındaki bir çocuk için yeterince yavaş mı?

## Ortak üslup talimatı
- **BILGE:** `Neşeli, sevimli ve enerjik bir çizgi film karakteri gibi konuş. Gülümseyerek, coşkulu ama anlaşılır ve çok hızlı olmayan bir tempoyla söyle.`

## Satırlar

| # | Kimlik (anahtar) | Dosya yolu | Konuşmacı | Metin |
|---|---|---|---|---|
| 1 | `vo.genel.tekrar_giris` | `assets/audio/voice/genel/tekrar_giris.wav` | BILGE | Tekrar zamanı! Öğrendiklerimizi birlikte hatırlayalım. |
| 2 | `vo.genel.agac_ev_bos` | `assets/audio/voice/genel/agac_ev_bos.wav` | BILGE | Ağaç evim şimdilik boş. Yıldız topladıkça buraya güzel süsler gelecek! |
| 3 | `vo.genel.agac_ev_kilitli` | `assets/audio/voice/genel/agac_ev_kilitli.wav` | BILGE | Bu süs için biraz daha yıldız toplayalım! |

---
## Teslim kontrol listesi
- [ ] Dosya adları ve yolları tablodaki ile birebir aynı
- [ ] Ses 005'teki Bilge sesiyle aynı
- [ ] Oyunda kontrol: patikada Tekrar Bulutu'na dokununca giriş satırı, boş Ağaç Evi'nde ve kilitli süs yuvasına dokununca ilgili satır çalıyor
- [ ] Commit: `assets: 024 faz 7a seslendirmesi`
