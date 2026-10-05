# Ses miksajı ve seviyeler (Faz 8)

Seslendirme, müzik ve efektler farklı araçlarla ve farklı zamanlarda üretildiği için seviyeleri birbirini tutmaz. Çocuk her satırı aynı rahatlıkta duymalı; müzik anlatımı bastırmamalı, "doğru" sesi kulak tırmalamamalı. Bu yüzden dosyalar repoya girmeden önce aşağıdaki hedeflere çekilir.

## Hedef seviyeler
| Tür | Klasör | Biçim | Hedef ses yüksekliği | Tepe |
|---|---|---|---|---|
| Seslendirme | `assets/audio/voice/` | mono, 22–44 kHz, `.ogg` ya da `.wav` | −16 LUFS | −1.5 dBTP |
| Müzik | `assets/audio/music/` | stereo, 44.1 kHz, `.ogg` ~128 kbps, kesintisiz döngü | −23 LUFS | −2 dBTP |
| Efekt | `assets/audio/sfx/` | mono, 44.1 kHz, `.ogg` | −18 LUFS (kısa seslerde tepe değerine bak) | −3 dBTP |

Oyun içinde ayrıca:
- Anlatım sürerken müzik 12 dB kısılır (`AudioDirector.DUCK_DB`).
- Ana kanalda −1 dB tavanlı bir sınırlayıcı (`default_bus_layout.tres`, `MasterLimiter`) üst üste binen seslerin patlamasını önler. Sınırlayıcı seviye düzeltmenin yerini tutmaz; dosyalar yine de hedeflere çekilir.
- Veli panelindeki üç kaydırıcı (anlatım, müzik, efekt) bu seviyelerin üstüne uygulanır.

## Dosyaları hedefe çekmek (ffmpeg)
Tek dosya, seslendirme:
```bash
ffmpeg -i girdi.wav -af loudnorm=I=-16:TP=-1.5:LRA=7 -ac 1 -ar 44100 -c:a libvorbis -q:a 4 assets/audio/voice/<ad>.ogg
```
Müzik (stereo):
```bash
ffmpeg -i girdi.wav -af loudnorm=I=-23:TP=-2:LRA=9 -ar 44100 -c:a libvorbis -b:a 128k assets/audio/music/<ad>.ogg
```
Efekt:
```bash
ffmpeg -i girdi.wav -af loudnorm=I=-18:TP=-3 -ac 1 -ar 44100 -c:a libvorbis -q:a 4 assets/audio/sfx/<ad>.ogg
```
Bir klasörü toplu işlemek (seslendirme örneği, dosya adları korunur):
```bash
mkdir -p out && for f in *.wav; do ffmpeg -y -i "$f" -af loudnorm=I=-16:TP=-1.5:LRA=7 -ac 1 -ar 44100 -c:a libvorbis -q:a 4 "out/${f%.wav}.ogg"; done
```
Ölçmek için: `ffmpeg -i dosya.ogg -af ebur128 -f null - 2>&1 | tail -12` ("I:" satırı LUFS değeridir).

## Cihazda dinleme
`docs/qa-checklist.md` → "Faz 8": telefon hoparlöründe orta seste ve kulaklıkla; müzik açıkken anlatım anlaşılıyor mu, "yanlış" efekti sert mi?
