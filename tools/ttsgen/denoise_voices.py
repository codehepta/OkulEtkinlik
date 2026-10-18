# /// script
# requires-python = ">=3.11,<3.12"
# dependencies = ["deepfilternet==0.5.6", "torch<2.6", "torchaudio<2.6", "soundfile", "numpy<2"]
# ///
"""Yerleşmiş seslerdeki arka plan uğultusunu DeepFilterNet3 ile giderir (MIT / Apache-2.0, yerel, CPU).

VoxCPM2 anlatıcı/Bilge sesleri referans kayıttan gelen geniş bantlı bir zemin gürültüsü taşır; kulaklıkta
konuşmanın altında "uğultu" olarak duyulur. 80 Hz alçak kesme işe yaramaz, durak kapısı yalnız duraklarda
keser; sahip kulaklıkla karşılaştırıp DeepFilterNet3'ün tam ayarını seçti (2026-10-18).

Zincir: Ogg çöz → 48 kHz mono → DeepFilterNet3 (sınırsız bastırma) → loudnorm −18 LUFS / −1.5 dBTP
→ 24 kHz mono Ogg Vorbis (compression_level=1.0; place_*.py ile aynı biçim). İşlenen her satırın
`docs/assets/voice-provenance.jsonl` kaydına `denoise` alanı yazılır; bu alanı olan dosyalar atlanır.

Kullanım:
  uv run tools/ttsgen/denoise_voices.py              # bütün assets/audio/voice
  uv run tools/ttsgen/denoise_voices.py vo.tk.trt …  # yalnızca verilen anahtarlar
"""
import json, subprocess, sys, time
from pathlib import Path
import numpy as np, soundfile as sf, torch
from df.enhance import enhance, init_df

R = Path(__file__).resolve().parents[2]
PROV = R / "docs/assets/voice-provenance.jsonl"
NOTE = "DeepFilterNet3 (deepfilternet 0.5.6, MIT/Apache-2.0), tam bastırma; ardından −18 LUFS"

def _ffmpeg(args: list[str], data: bytes | None = None) -> bytes:
    return subprocess.run(["ffmpeg", "-hide_banner", "-loglevel", "error", *args], input=data, capture_output=True, check=True).stdout

def decode_48k(path: Path) -> np.ndarray:
    """Ogg'u 48 kHz mono çözer. ffmpeg Vorbis'in son sayfa kırpmasını uygulamaz (sona ~20 ms fazladan
    örnek ekler); bu yüzden gerçek uzunluk libsndfile'dan alınır ve fazlası kesilir."""
    n = sf.info(str(path)).frames * 48000 // sf.info(str(path)).samplerate
    return np.frombuffer(_ffmpeg(["-i", str(path), "-ac", "1", "-ar", "48000", "-f", "f32le", "-"]), np.float32)[:n].copy()

_MODEL = None
def denoise_48k(w: np.ndarray) -> np.ndarray:
    """48 kHz mono float32 → gürültüsü giderilmiş 48 kHz mono float32."""
    global _MODEL
    if _MODEL is None:
        _MODEL = init_df(log_level="ERROR")[:2]
    model, state = _MODEL
    return enhance(model, state, torch.from_numpy(w)[None]).squeeze(0).numpy()

def write_voice_ogg(w48: np.ndarray, dst: Path) -> None:
    """−18 LUFS, 24 kHz mono Ogg Vorbis (en yüksek sıkıştırma). Uzunluk girdiyle birebir aynı kalır:
    fazladan örnekli kısa (tek sayfalık) dosyaları Chrome "PTS is not defined" diye çalamıyor."""
    raw = _ffmpeg(["-f", "f32le", "-ar", "48000", "-ac", "1", "-i", "-", "-af", "loudnorm=I=-18:TP=-1.5:LRA=11",
                   "-ar", "24000", "-ac", "1", "-f", "f32le", "-"], w48.astype(np.float32).tobytes())
    w = np.frombuffer(raw, np.float32)[:len(w48) // 2]
    dst.parent.mkdir(parents=True, exist_ok=True)
    tmp = dst.with_suffix(".tmp.ogg")
    with sf.SoundFile(tmp, "w", 24000, 1, format="OGG", subtype="VORBIS", compression_level=1.0) as f:
        for i in range(0, len(w), 16384):
            f.write(w[i:i + 16384])
    if sf.info(str(tmp)).frames != len(w):
        raise RuntimeError(f"uzunluk tutmuyor: {dst}")
    tmp.replace(dst)

def main() -> None:
    rows = [json.loads(l) for l in open(PROV)]
    only = set(sys.argv[1:])
    # Yalnızca VoxCPM2 seslendirmeleri; kaynak sesler (CC0 kayıtlar: hayvan, doğa) gürültü sanılıp silinmesin.
    todo = [r for r in rows if r.get("model") == "openbmb/VoxCPM2" and "denoise" not in r and (not only or r["key"] in only)]
    t0 = time.time()
    for n, r in enumerate(todo, 1):
        p = R / r["file"]
        if not p.exists():
            print("YOK:", r["file"]); continue
        frames = sf.info(str(p)).frames
        write_voice_ogg(denoise_48k(decode_48k(p)), p)
        if sf.info(str(p)).frames != frames:
            raise RuntimeError(f"uzunluk değişti: {p}")
        r["denoise"] = NOTE
        # Her dosyadan sonra kaydet: yarıda kesilirse işlenen dosya ikinci kez işlenmez.
        tmp = PROV.with_suffix(".tmp")
        tmp.write_text("".join(json.dumps(x, ensure_ascii=False) + "\n" for x in rows))
        tmp.replace(PROV)
        if n % 100 == 0 or n == len(todo):
            print(f"{n}/{len(todo)}  {time.time() - t0:.0f} sn", flush=True)

if __name__ == "__main__":
    main()
