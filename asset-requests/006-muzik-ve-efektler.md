# 006 · Müzik ve ses efektleri

**Öncelik: ORTA** (Faz 1 sonunda olması iyi olur; yoksa oyun sessiz çalışır).

Nano Banana ses üretmez. Seçenekler:
- **Müzik:** Google'ın müzik modeli **Lyria** (Gemini uygulaması ya da AI Studio'da kullanılabiliyorsa), başka bir AI müzik aracı ya da CC0 (telifsiz, atıf gerektirmeyen) müzik.
- **Efektler:** CC0 paketler önerilir. Örneğin **Kenney** ses paketleri (kenney.nl, CC0) ya da freesound.org'da **yalnızca CC0** lisanslı sesler.
- Kullandığın her hazır dosyanın kaynağını ve lisansını `assets/audio/LICENSES.md` dosyasına yaz (dosya adı, kaynak bağlantısı, lisans).

## Müzik (döngülenebilir, 60–90 sn, sözsüz)

| Kimlik | Dosya yolu | Prompt (Lyria ya da benzeri araç için) |
|---|---|---|
| `music.menu` | `assets/audio/music/menu.ogg` | `Cheerful gentle children's game menu music, ukulele, glockenspiel and soft hand claps, warm and welcoming, 100 BPM, major key, seamless loop, no vocals` |
| `music.sayi_ormani` | `assets/audio/music/sayi_ormani.ogg` | `Playful light forest adventure music for young children, marimba, pizzicato strings, soft flute and bird-like whistles, 96 BPM, major key, calm but curious, seamless loop, no vocals` |
| `music.harf_vadisi` | `assets/audio/music/harf_vadisi.ogg` | `Dreamy soft children's music, music box, celesta, gentle harp and light pads, 88 BPM, major key, calm and focused for reading, seamless loop, no vocals` |
| `music.hayat_kasabasi` | `assets/audio/music/hayat_kasabasi.ogg` | `Happy small-town children's music, acoustic guitar, xylophone, light accordion and soft percussion, 104 BPM, major key, friendly everyday feeling, seamless loop, no vocals` |
| `music.kesif_laboratuvari` | `assets/audio/music/kesif_laboratuvari.ogg` | `Curious gentle science discovery music for kids, soft synth plucks, bubbly sounds, vibraphone and light bass, 92 BPM, major key, wonder and exploration, seamless loop, no vocals` |
| `music.agac_ev` | `assets/audio/music/agac_ev.ogg` | `Cozy warm lullaby-like children's music, soft piano, kalimba and gentle strings, 80 BPM, major key, relaxing, seamless loop, no vocals` |

Notlar:
- Müzik anlatımın **altında** kalacak. Hareketli melodiler yerine sakin ve tekrar eden parçaları tercih et.
- Döngü sınırında tık sesi ya da boşluk olmamalı. Gerekirse Audacity'de başı ve sonu kırp.
- `.ogg` (Vorbis), stereo, 44.1 kHz, ~128 kbps.

## Ses efektleri (kısa, 0.1–1.5 sn)

| Kimlik | Dosya yolu | Ne olmalı |
|---|---|---|
| `sfx.tap` | `assets/audio/sfx/tap.ogg` | Yumuşak, kısa "pop" ya da baloncuk sesi (her dokunuş) |
| `sfx.correct` | `assets/audio/sfx/correct.ogg` | Parlak ve mutlu "ding" + kısa yükselen arp (2–3 nota) |
| `sfx.wrong` | `assets/audio/sfx/wrong.ogg` | Yumuşak, komik ve kısa "boop" ya da "bwomp". **Asla sert buzzer ya da üzücü ses değil** |
| `sfx.pickup` | `assets/audio/sfx/pickup.ogg` | Nesneyi sürüklemeye başlarken hafif "whoop" |
| `sfx.drop` | `assets/audio/sfx/drop.ogg` | Nesne yerine oturunca yumuşak "tok" ya da kil "squish" |
| `sfx.star` | `assets/audio/sfx/star.ogg` | Yıldız belirirken parıltılı "twinkle" |
| `sfx.sticker` | `assets/audio/sfx/sticker.ogg` | Çıkartma yapışma "fıss-pat" ve kısa parıltı |
| `sfx.unlock` | `assets/audio/sfx/unlock.ogg` | Yeni durak açıldı: sihirli "shimmer" |
| `sfx.whoosh` | `assets/audio/sfx/whoosh.ogg` | Ekran geçişi için yumuşak rüzgâr sesi |
| `sfx.balloon_pop` | `assets/audio/sfx/balloon_pop.ogg` | Balon patlama (sevimli, ürkütücü olmayan) |
| `sfx.celebrate` | `assets/audio/sfx/celebrate.ogg` | Durak bitişi: kısa fanfar, alkış ya da konfeti (≤2 sn) |
| `sfx.bilge_hoot` | `assets/audio/sfx/bilge_hoot.ogg` | Bilge'nin sevimli kısa "hu-hu" sesi |

---
## Teslim kontrol listesi
- [ ] Dosya adları tablodaki ile birebir aynı
- [ ] Hazır dosyaların lisansları `assets/audio/LICENSES.md`'ye yazıldı (yalnızca CC0 ya da açık kaynakla uyumlu lisanslar)
- [ ] Ses seviyeleri birbirine yakın (bir efekt diğerlerinden çok yüksek değil)
- [ ] Commit: `assets: 006 müzik ve efektler`
