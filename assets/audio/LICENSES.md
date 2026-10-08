# Ses dosyalarının kaynak ve lisansları

Bu klasördeki hazır sesler aşağıdaki kaynaklardan alınmıştır. Yalnızca CC0 ya da projenin CC BY 4.0 lisansıyla uyumlu lisanslar kullanılır.

## Efektler (`sfx/`)

Kaynak dosyalar tepe seviyesi −3 dBFS olacak şekilde normalize edilip 44,1 kHz stereo Ogg Vorbis olarak yeniden kodlandı.

| Dosya | Kaynak paket | Özgün dosya | Lisans |
|---|---|---|---|
| `sfx/tap.ogg` | Kenney · [interface-sounds](https://kenney.nl/assets/interface-sounds) | `click_001.ogg` | CC0 1.0 |
| `sfx/correct.ogg` | Kenney · [interface-sounds](https://kenney.nl/assets/interface-sounds) | `confirmation_001.ogg` | CC0 1.0 |
| `sfx/wrong.ogg` | Kenney · [interface-sounds](https://kenney.nl/assets/interface-sounds) | `error_007.ogg` | CC0 1.0 |
| `sfx/pickup.ogg` | Kenney · [interface-sounds](https://kenney.nl/assets/interface-sounds) | `select_001.ogg` | CC0 1.0 |
| `sfx/drop.ogg` | Kenney · [impact-sounds](https://kenney.nl/assets/impact-sounds) | `impactSoft_medium_002.ogg` | CC0 1.0 |
| `sfx/star.ogg` | Kenney · [music-jingles](https://kenney.nl/assets/music-jingles) | `jingles_STEEL00.ogg` | CC0 1.0 |
| `sfx/sticker.ogg` | Kenney · [casino-audio](https://kenney.nl/assets/casino-audio) | `card-place-2.ogg` | CC0 1.0 |
| `sfx/balloon_pop.ogg` | Kenney · [impact-sounds](https://kenney.nl/assets/impact-sounds) | `impactGeneric_light_002.ogg` | CC0 1.0 |
| `sfx/page_turn.ogg` | Kenney · [casino-audio](https://kenney.nl/assets/casino-audio) | `card-slide-3.ogg` | CC0 1.0 |

Kenney (www.kenney.nl) paketleri CC0 1.0 (kamu malı) lisanslıdır; atıf zorunlu değildir, yine de teşekkür ederiz.

## Müzik (`music/`)

Geçici seçim (2026-10-07): sahip parçaları daha sonra yeniden değerlendirecek. Kaynaklar −22 LUFS'a normalize edildi (anlatımın altında kalsın diye), 44,1 kHz stereo Ogg Vorbis olarak yeniden kodlandı; Godot içe aktarmasında döngü açık.

| Dosya | Parça | Besteci | Kaynak | Lisans |
|---|---|---|---|---|
| `music/menu.ogg` | Good Morning | Cakeflaps (You're Perfect Studio) | [OpenGameArt](https://opengameart.org/content/good-morning) | CC0 1.0 (CC-BY 4.0 / OGA-BY 3.0 / CC0 üçlü lisanstan CC0 seçildi) |
| `music/sayi_ormani.ogg` | Minimalistic Flute & Strings Tune | Spring Spring | [OpenGameArt](https://opengameart.org/content/minimalistic-flute-strings-tune) | CC0 1.0 |
| `music/harf_vadisi.ogg` | Happy Lullaby (song17) | cynicmusic | [OpenGameArt](https://opengameart.org/node/20594) | CC0 1.0 (besteci isim yazılmasını rica ediyor) |
| `music/hayat_kasabasi.ogg` | Village, 2018 | Komiku (Loyalty Freak Music) | [OpenGameArt](https://opengameart.org/node/83183) | CC0 1.0 |
| `music/kesif_laboratuvari.ogg` | Sci-fi Puzzle In-Game 2 | MintoDog | [OpenGameArt](https://opengameart.org/content/sci-fi-puzzle-in-game-2) | CC0 1.0 |
| `music/agac_ev.ogg` | Bluebonnet (looped) | Kistol | [OpenGameArt](https://opengameart.org/content/bluebonnet) | CC0 1.0 |

## Ses kaynakları (`voice/g1/turkce/kaynak/`)

"Sesin sahibi kim?" durağındaki hayvan ve nesne sesleri gerçek kayıtlardır (seslendirme değil). -18 LUFS'a eşitlenip mono Ogg Vorbis olarak kodlandı.

| Dosya | Kayıt | Kaydeden | Kaynak | Lisans |
|---|---|---|---|---|
| `voice/g1/turkce/kaynak/kedi.ogg` | Meow Cat #2 | Joseph SARDIN | [BigSoundBank](https://bigsoundbank.com/meow-cat-2-s1890.html) | CC0 1.0 |
| `voice/g1/turkce/kaynak/kus.ogg` | Robin #4 | Joseph SARDIN | [BigSoundBank](https://bigsoundbank.com/robin-4-s1670.html) | CC0 1.0 |
| `voice/g1/turkce/kaynak/inek.ogg` | Cow moos #3 | Joseph SARDIN | [BigSoundBank](https://bigsoundbank.com/cow-moos-3-s2383.html) | CC0 1.0 |
| `voice/g1/turkce/kaynak/saat.ogg` | Tic Tac Mechanical Alarm Clock #3 (ilk 4 sn) | Joseph SARDIN | [BigSoundBank](https://bigsoundbank.com/tic-tac-mechanical-alarm-clock-3-s2656.html) | CC0 1.0 |
| `voice/g1/turkce/kaynak/horoz.ogg` | Rooster Song | DenisChardonnet | [BigSoundBank](https://bigsoundbank.com/song-of-rooster-s0283.html) | CC0 1.0 |
| `voice/g1/turkce/kaynak/davul.ogg` | Bass Tom #1 (tek vuruş ×3) | Joseph SARDIN | [BigSoundBank](https://bigsoundbank.com/bass-tom-1-s2338.html) | CC0 1.0 |

## Seslendirme (`voice/`)

Yerel VoxCPM2 (openbmb/VoxCPM2, Apache-2.0) ile üretildi; seçim ve onay sahibindir. Satır başına kayıt: `docs/assets/voice-provenance.jsonl`. Referans sesler: `tools/ttsgen/voices/`.
