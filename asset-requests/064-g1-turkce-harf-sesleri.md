# 064 · 1. sınıf Türkçe: harf sesleri, heceler, sözcükler, ses kaynakları

**Öncelik: EN YÜKSEK** (Faz 4b). Ses temelli ilk okuma yazmanın temeli: her harfin **sesi** (adı değil), hece ve sözcük okumaları, "Sesin sahibi kim?" durağının ses kaynakları.

> Bu dosya eklenmeden de oyun çalışır: eksik satırları cihazın Türkçe sesiyle okur. Gerçek kayıtlar geldiğinde kalite çok artar.

## Nasıl üretilir
1. **Google AI Studio → "Generate speech"** (Gemini TTS) ekranını aç. Tek konuşmacı kullan.
2. **Ses seçimi:** 005'in sonundaki "Seçilen sesler" bölümündeki **aynı iki sesi** kullan (Anlatıcı ve Bilge).
3. Her satır için ilgili **üslup talimatını** "Style instructions" alanına, **Metin** sütununu konuşma metnine yapıştır.
4. Çıktıyı **Dosya yolu** sütunundaki isimle kaydet; klasörler yoksa oluştur. `.wav` kabul edilir, istersen `.ogg`'ye çevir (mono, 22–44 kHz).
5. Dinleyip kontrol et: Türkçe telaffuz doğru mu, tempo 6 yaşındaki bir çocuk için yeterince yavaş mı?

## Ortak üslup talimatları
- **ANLATICI:** `Sıcak, sakin ve net bir sesle, 6-8 yaşındaki bir çocuğa konuşur gibi, yavaş ve anlaşılır oku. Kelimeleri tane tane söyle, cümle sonlarında kısa bir duraklama yap.`
- **BILGE:** `Neşeli, sevimli ve enerjik bir çizgi film karakteri gibi konuş. Gülümseyerek, coşkulu ama anlaşılır ve çok hızlı olmayan bir tempoyla söyle.`

## Bu partiye özel notlar
- **Harf sesleri (`vo.g1.turkce.ses.*`):** Harfin **adını değil sesini** söyle. Ünlüler (a, e, ı, i, o, ö, u, ü) kısa ve net; ünsüzler (n, t, l, k, r, m, s, y, d, z, ç, b, g, c, ş, p, h, v, f, j) ünlü eklemeden, yalnızca ses olarak: "nnn", "sss", "fff" gibi uzatılabilen sesler hafifçe uzatılır, "t", "k", "p", "b", "d", "g", "c", "ç" gibi patlamalı sesler tek ve kısa söylenir. `ğ` için kayıt "yumuşak g" diye adını söyler (kendi sesi yoktur). Gemini TTS sesi tek harften doğru çıkaramazsa sahip kendi sesiyle kaydedebilir.
- **Ses kaynakları (`vo.g1.turkce.kaynak.*`):** Metindeki taklit sesi okumak yeterli. İstenirse aynı dosya adıyla gerçek hayvan/nesne sesi (özgür lisanslı, ör. CC0) konabilir.
- **Hece ve sözcükler:** Tane tane, doğal vurguyla oku; heceyi bölme.

## Satırlar

| # | Kimlik (anahtar) | Dosya yolu | Konuşmacı | Metin |
|---|---|---|---|---|
| 1 | `vo.g1.turkce.ses.a` | `assets/audio/voice/g1/turkce/ses/a.wav` | ANLATICI | a |
| 2 | `vo.g1.turkce.ses.n` | `assets/audio/voice/g1/turkce/ses/n.wav` | ANLATICI | n |
| 3 | `vo.g1.turkce.ses.e` | `assets/audio/voice/g1/turkce/ses/e.wav` | ANLATICI | e |
| 4 | `vo.g1.turkce.ses.t` | `assets/audio/voice/g1/turkce/ses/t.wav` | ANLATICI | t |
| 5 | `vo.g1.turkce.ses.i` | `assets/audio/voice/g1/turkce/ses/i.wav` | ANLATICI | i |
| 6 | `vo.g1.turkce.ses.l` | `assets/audio/voice/g1/turkce/ses/l.wav` | ANLATICI | l |
| 7 | `vo.g1.turkce.ses.o` | `assets/audio/voice/g1/turkce/ses/o.wav` | ANLATICI | o |
| 8 | `vo.g1.turkce.ses.k` | `assets/audio/voice/g1/turkce/ses/k.wav` | ANLATICI | k |
| 9 | `vo.g1.turkce.ses.u` | `assets/audio/voice/g1/turkce/ses/u.wav` | ANLATICI | u |
| 10 | `vo.g1.turkce.ses.r` | `assets/audio/voice/g1/turkce/ses/r.wav` | ANLATICI | r |
| 11 | `vo.g1.turkce.ses.ii` | `assets/audio/voice/g1/turkce/ses/ii.wav` | ANLATICI | ı |
| 12 | `vo.g1.turkce.ses.m` | `assets/audio/voice/g1/turkce/ses/m.wav` | ANLATICI | m |
| 13 | `vo.g1.turkce.ses.uu` | `assets/audio/voice/g1/turkce/ses/uu.wav` | ANLATICI | ü |
| 14 | `vo.g1.turkce.ses.s` | `assets/audio/voice/g1/turkce/ses/s.wav` | ANLATICI | s |
| 15 | `vo.g1.turkce.ses.oo` | `assets/audio/voice/g1/turkce/ses/oo.wav` | ANLATICI | ö |
| 16 | `vo.g1.turkce.ses.y` | `assets/audio/voice/g1/turkce/ses/y.wav` | ANLATICI | y |
| 17 | `vo.g1.turkce.ses.d` | `assets/audio/voice/g1/turkce/ses/d.wav` | ANLATICI | d |
| 18 | `vo.g1.turkce.ses.z` | `assets/audio/voice/g1/turkce/ses/z.wav` | ANLATICI | z |
| 19 | `vo.g1.turkce.ses.cc` | `assets/audio/voice/g1/turkce/ses/cc.wav` | ANLATICI | ç |
| 20 | `vo.g1.turkce.ses.b` | `assets/audio/voice/g1/turkce/ses/b.wav` | ANLATICI | b |
| 21 | `vo.g1.turkce.ses.g` | `assets/audio/voice/g1/turkce/ses/g.wav` | ANLATICI | g |
| 22 | `vo.g1.turkce.ses.c` | `assets/audio/voice/g1/turkce/ses/c.wav` | ANLATICI | c |
| 23 | `vo.g1.turkce.ses.ss` | `assets/audio/voice/g1/turkce/ses/ss.wav` | ANLATICI | ş |
| 24 | `vo.g1.turkce.ses.p` | `assets/audio/voice/g1/turkce/ses/p.wav` | ANLATICI | p |
| 25 | `vo.g1.turkce.ses.h` | `assets/audio/voice/g1/turkce/ses/h.wav` | ANLATICI | h |
| 26 | `vo.g1.turkce.ses.v` | `assets/audio/voice/g1/turkce/ses/v.wav` | ANLATICI | v |
| 27 | `vo.g1.turkce.ses.gg` | `assets/audio/voice/g1/turkce/ses/gg.wav` | ANLATICI | ğ |
| 28 | `vo.g1.turkce.ses.f` | `assets/audio/voice/g1/turkce/ses/f.wav` | ANLATICI | f |
| 29 | `vo.g1.turkce.ses.j` | `assets/audio/voice/g1/turkce/ses/j.wav` | ANLATICI | j |
| 30 | `vo.g1.turkce.hece.an` | `assets/audio/voice/g1/turkce/hece/an.wav` | ANLATICI | an |
| 31 | `vo.g1.turkce.kelime.anne` | `assets/audio/voice/g1/turkce/kelime/anne.wav` | ANLATICI | anne |
| 32 | `vo.g1.turkce.kelime.at` | `assets/audio/voice/g1/turkce/kelime/at.wav` | ANLATICI | at |
| 33 | `vo.g1.turkce.kelime.et` | `assets/audio/voice/g1/turkce/kelime/et.wav` | ANLATICI | et |
| 34 | `vo.g1.turkce.kelime.nine` | `assets/audio/voice/g1/turkce/kelime/nine.wav` | ANLATICI | nine |
| 35 | `vo.g1.turkce.kelime.lale` | `assets/audio/voice/g1/turkce/kelime/lale.wav` | ANLATICI | lale |
| 36 | `vo.g1.turkce.kelime.el` | `assets/audio/voice/g1/turkce/kelime/el.wav` | ANLATICI | el |
| 37 | `vo.g1.turkce.kelime.olta` | `assets/audio/voice/g1/turkce/kelime/olta.wav` | ANLATICI | olta |
| 38 | `vo.g1.turkce.kelime.kale` | `assets/audio/voice/g1/turkce/kelime/kale.wav` | ANLATICI | kale |
| 39 | `vo.g1.turkce.kelime.kutu` | `assets/audio/voice/g1/turkce/kelime/kutu.wav` | ANLATICI | kutu |
| 40 | `vo.g1.turkce.kelime.okul` | `assets/audio/voice/g1/turkce/kelime/okul.wav` | ANLATICI | okul |
| 41 | `vo.g1.turkce.kelime.tarak` | `assets/audio/voice/g1/turkce/kelime/tarak.wav` | ANLATICI | tarak |
| 42 | `vo.g1.turkce.kelime.ari` | `assets/audio/voice/g1/turkce/kelime/ari.wav` | ANLATICI | arı |
| 43 | `vo.g1.turkce.kelime.elma` | `assets/audio/voice/g1/turkce/kelime/elma.wav` | ANLATICI | elma |
| 44 | `vo.g1.turkce.kelime.utu` | `assets/audio/voice/g1/turkce/kelime/utu.wav` | ANLATICI | ütü |
| 45 | `vo.g1.turkce.kelime.masa` | `assets/audio/voice/g1/turkce/kelime/masa.wav` | ANLATICI | masa |
| 46 | `vo.g1.turkce.kelime.ortu` | `assets/audio/voice/g1/turkce/kelime/ortu.wav` | ANLATICI | örtü |
| 47 | `vo.g1.turkce.kelime.ayi` | `assets/audio/voice/g1/turkce/kelime/ayi.wav` | ANLATICI | ayı |
| 48 | `vo.g1.turkce.kelime.kedi` | `assets/audio/voice/g1/turkce/kelime/kedi.wav` | ANLATICI | kedi |
| 49 | `vo.g1.turkce.kelime.uzum` | `assets/audio/voice/g1/turkce/kelime/uzum.wav` | ANLATICI | üzüm |
| 50 | `vo.g1.turkce.kelime.deniz` | `assets/audio/voice/g1/turkce/kelime/deniz.wav` | ANLATICI | deniz |
| 51 | `vo.g1.turkce.kelime.canta` | `assets/audio/voice/g1/turkce/kelime/canta.wav` | ANLATICI | çanta |
| 52 | `vo.g1.turkce.kelime.bebek` | `assets/audio/voice/g1/turkce/kelime/bebek.wav` | ANLATICI | bebek |
| 53 | `vo.g1.turkce.kelime.gozluk` | `assets/audio/voice/g1/turkce/kelime/gozluk.wav` | ANLATICI | gözlük |
| 54 | `vo.g1.turkce.kelime.cuzdan` | `assets/audio/voice/g1/turkce/kelime/cuzdan.wav` | ANLATICI | cüzdan |
| 55 | `vo.g1.turkce.kelime.gunes` | `assets/audio/voice/g1/turkce/kelime/gunes.wav` | ANLATICI | güneş |
| 56 | `vo.g1.turkce.kelime.cocuk` | `assets/audio/voice/g1/turkce/kelime/cocuk.wav` | ANLATICI | çocuk |
| 57 | `vo.g1.turkce.kelime.kirpi` | `assets/audio/voice/g1/turkce/kelime/kirpi.wav` | ANLATICI | kirpi |
| 58 | `vo.g1.turkce.kelime.hali` | `assets/audio/voice/g1/turkce/kelime/hali.wav` | ANLATICI | halı |
| 59 | `vo.g1.turkce.kelime.havuc` | `assets/audio/voice/g1/turkce/kelime/havuc.wav` | ANLATICI | havuç |
| 60 | `vo.g1.turkce.kelime.agac` | `assets/audio/voice/g1/turkce/kelime/agac.wav` | ANLATICI | ağaç |
| 61 | `vo.g1.turkce.kelime.fare` | `assets/audio/voice/g1/turkce/kelime/fare.wav` | ANLATICI | fare |
| 62 | `vo.g1.turkce.kelime.pijama` | `assets/audio/voice/g1/turkce/kelime/pijama.wav` | ANLATICI | pijama |
| 63 | `vo.g1.turkce.kelime.kaplumbaga` | `assets/audio/voice/g1/turkce/kelime/kaplumbaga.wav` | ANLATICI | kaplumbağa |
| 64 | `vo.g1.turkce.kelime.firca` | `assets/audio/voice/g1/turkce/kelime/firca.wav` | ANLATICI | fırça |
| 65 | `vo.g1.turkce.kelime.davul` | `assets/audio/voice/g1/turkce/kelime/davul.wav` | ANLATICI | davul |
| 66 | `vo.g1.turkce.kelime.karinca` | `assets/audio/voice/g1/turkce/kelime/karinca.wav` | ANLATICI | karınca |
| 67 | `vo.g1.turkce.kelime.kelebek` | `assets/audio/voice/g1/turkce/kelime/kelebek.wav` | ANLATICI | kelebek |
| 68 | `vo.g1.turkce.kelime.topac` | `assets/audio/voice/g1/turkce/kelime/topac.wav` | ANLATICI | topaç |
| 69 | `vo.g1.turkce.kelime.sandik` | `assets/audio/voice/g1/turkce/kelime/sandik.wav` | ANLATICI | sandık |
| 70 | `vo.g1.turkce.kelime.fidan` | `assets/audio/voice/g1/turkce/kelime/fidan.wav` | ANLATICI | fidan |
| 71 | `vo.g1.turkce.kelime.tabak` | `assets/audio/voice/g1/turkce/kelime/tabak.wav` | ANLATICI | tabak |
| 72 | `vo.g1.turkce.kaynak.kedi` | `assets/audio/voice/g1/turkce/kaynak/kedi.wav` | ANLATICI | Miyav, miyav! |
| 73 | `vo.g1.turkce.kaynak.kus` | `assets/audio/voice/g1/turkce/kaynak/kus.wav` | ANLATICI | Cik cik cik! |
| 74 | `vo.g1.turkce.kaynak.inek` | `assets/audio/voice/g1/turkce/kaynak/inek.wav` | ANLATICI | Möö, möö! |
| 75 | `vo.g1.turkce.kaynak.saat` | `assets/audio/voice/g1/turkce/kaynak/saat.wav` | ANLATICI | Tik tak, tik tak! |
| 76 | `vo.g1.turkce.kaynak.horoz` | `assets/audio/voice/g1/turkce/kaynak/horoz.wav` | ANLATICI | Ü-ürü-üüü! |
| 77 | `vo.g1.turkce.kaynak.davul` | `assets/audio/voice/g1/turkce/kaynak/davul.wav` | ANLATICI | Dum, dum, dum! |

---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı
- [ ] Telaffuz ve tempo dinlenerek kontrol edildi
- [ ] Commit: `assets: 064 g1 turkce harf sesleri`
