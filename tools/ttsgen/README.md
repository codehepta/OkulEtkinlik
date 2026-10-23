# Yerel seslendirme adayı üretimi (VoxCPM2)

Seslendirme adayları yerelde, ücretsiz ve Apache-2.0 lisanslı **VoxCPM2** (`openbmb/VoxCPM2`) ile üretilir. Kontrol için `mlx-whisper` (`whisper-large-v3-turbo`, MIT) kullanılır. Seçimi ve onayı sahip yapar; onaylanmamış ses `assets/`'e girmez.

Ayrıntılı yöntem ve dersler: `~/.claude/skills/generating-speech-locally-with-voxcpm2/SKILL.md`.

## Dosyalar
- `voices/anlatici.wav`, `voices/bilge.wav`: sahibin onayladığı tasarlanmış referans sesler. `voices.json` bunların metnini tutar; her satır bu seslerden klonlanır.
- `rules.py`: Türkçe yazım kuralları.
  - Harfler: `Aaa.`, `Ne.`
  - Giriş cümleli kesim: `Şimdi okuyalım: …`
  - `SAY_AS` okunuş düzeltmeleri, ör. altmış → atmış.
  - `ABBR` kısaltmaların açık okunuşu (kg → kilogram, Dr. → Doktor), satır içinde de. Harf kısaltmaları aralıksız harf adlarıyla, tamamı büyük harf: TDK → TEDEKA, TRT → TERETE.
  - Kart ekleri ('ye, 'dan) giriş cümlesiyle üretilir, son kelime kesilir.
  - `PARTICLE` tek başına soru ekleri ve kart ekleri ('de, 'dan): giriş cümlesiyle üretilir (`Şimdi okuyalım: mı?`), son kelime kesilir. Fiilli biçimde (`Yazdın mı?`) kesilen ekin başında ı/u/ü duyuluyordu (3. sınıf pilotu).
  - `PUNCT` noktalama kartları adıyla okunur: `Soru işareti.`, `Ünlem işareti.`, `Nokta.` (Emrah onayladı, 2026-10-23).
  - Whisper'ın rakamlarını sözcüğe çeviren karşılaştırma.
- `rules_single.py`: tek aday kipi. Cümle ve iki kelimelik satırlar için.
- `rules_plain.py`: sayı, saat, para ve tek kelime için düz biçimler (`X!`, `X.`).
- `tts_generate.py`, `tts_select.py`: üretim (çalışma/mola döngülü, kaldığı yerden devam eder) ve Whisper ile seçim.
- `denoise_voices.py`: yerleşmiş seslerdeki arka plan uğultusunu (referans sesten gelen geniş bantlı zemin gürültüsü) DeepFilterNet3 ile giderir ve −18 LUFS'e yeniden normalleştirir. Her yeni yerleştirmeden sonra çalıştırılır; işlenen satırlar kayıtta `denoise` alanıyla işaretlenir ve atlanır (`uv run tools/ttsgen/denoise_voices.py`).
- `place_g1.py`, `place_g2.py`, `place_g3.py`: sınıfın onaylı seslerini −18 LUFS, mono 24 kHz Ogg Vorbis (en yüksek sıkıştırma, ≈42 kbps; APK bütçesi) olarak `assets/audio/voice/` altına koyar ve `docs/assets/voice-provenance.jsonl` kaydını yazar.

## Kurulum
```bash
uv venv --python 3.11 build/ttsgen/voxcpm/.venv && uv pip install --python build/ttsgen/voxcpm/.venv voxcpm soundfile
PYTORCH_ENABLE_MPS_FALLBACK=1 build/ttsgen/voxcpm/.venv/bin/python tools/ttsgen/tts_generate.py items.json tools/ttsgen/voices.json out/ --rules rules_single
uv run --no-project --python 3.11 --with mlx-whisper --with soundfile python tools/ttsgen/tts_select.py out/ --rules rules_single
```

## Sahiple belirlenen iş akışı
1. Bir sınıf bitmeden diğerine geçilmez.
2. Cümleler ve iki kelimelik satırlar tek adayla üretilir. Whisper'ın işaretlediklerini ve rastgele bir örneği sahip dinler; beğenmediği satırlar 3 yazım × 4 tohumla yeniden denenir.
3. Harf, hece, sayı, saat, para ve tek kelime satırları en son, 2 yazım × 3 tohumla üretilir; önerilen aday seçili gelir.
4. Hayvan ve nesne sesleri seslendirilmez. Gerçek CC0 kayıtlar aynı anahtarla konur (bkz. `assets/audio/LICENSES.md`).
