"""İkinci içerik denetimi sonrası değişen/yeni ses satırlarını yerleştirir (onaylı seçimler).
Seçim: tts_select'in önerdiği aday, build/audio/voice_denetim2/owner_picks*.txt ile ezilir.
Yerleştirmeden sonra uğultu temizliği: uv run tools/ttsgen/denoise_voices.py <anahtarlar>.
-18 LUFS, mono 24 kHz Ogg Vorbis (compression_level=1.0); aynı anahtarın eski kaydı yenisiyle değişir."""
import json, hashlib, subprocess
from pathlib import Path
import numpy as np, soundfile as sf
R = Path("/Users/codehepta/Projects/OkulEtkinlik"); A = R / "build/audio/voice_denetim2"
VOICES = json.load(open(R / "build/ttsgen/voices.json"))
def sha(p): return hashlib.sha256(open(p, "rb").read()).hexdigest()[:16]
REFHASH = {k: sha(R / "build/ttsgen" / v["ref"]) for k, v in VOICES.items()}
picks = {}
for sub in ("uzun", "kisa"):
    for x in json.load(open(A / sub / "meta.json")):
        if x.get("chosen"): picks[x["key"]] = (A / sub / x["final"], x, "Whisper otomatik + sahip dinleme")
idx = {}
for sub in ("uzun", "kisa", "fix_uzun", "fix_kisa"):
    if (A / sub / "meta.json").exists():
        for x in json.load(open(A / sub / "meta.json")): idx[f"{sub}/{x['final']}"] = (A / sub / x["final"], x); idx.setdefault(x["final"], (A / sub / x["final"], x))
for f in ("owner_picks.txt", "owner_picks_fix.txt"):
    if not (A / f).exists():
        continue
    for p in open(A / f).read().split():
        k, v = p.split("=")
        if v != "yok": picks[k] = (*idx[v], "sahip")
expected = {x["key"] for x in json.load(open(R / "build/review/ses_yenile.json"))}
missing = sorted(expected - set(picks)); assert not missing, missing
prov = []
for k in sorted(expected):
    src, x, by = picks[k]
    raw = subprocess.run(["ffmpeg", "-hide_banner", "-loglevel", "error", "-i", str(src), "-af", "loudnorm=I=-18:TP=-1.5:LRA=11", "-ar", "24000", "-ac", "1", "-f", "f32le", "-"], capture_output=True, check=True).stdout
    w = np.frombuffer(raw, np.float32)
    dst = R / "assets/audio/voice" / ("/".join(k.split(".")[1:]) + ".ogg"); dst.parent.mkdir(parents=True, exist_ok=True)
    with sf.SoundFile(dst, "w", 24000, 1, format="OGG", subtype="VORBIS", compression_level=1.0) as f:
        for i in range(0, len(w), 16384): f.write(w[i:i + 16384])
    prov.append({"key": k, "file": str(dst.relative_to(R)), "text": json.load(open(R / "content/voice_lines.tr.json"))[k]["text"], "spoken": x["say"], "speaker": x["speaker"],
                 "model": "openbmb/VoxCPM2", "model_license": "Apache-2.0", "runtime": "voxcpm 2.0.3 (MPS)", "seed": x["seed"],
                 "cfg_value": 2.0, "inference_timesteps": 10, "reference_voice": VOICES[x["speaker"]]["ref"].split("/")[-1],
                 "reference_sha256_16": REFHASH[x["speaker"]], "carrier_crop": bool(x.get("carrier")), "whisper_heard": x.get("heard", ""),
                 "selected_by": by, "date": "2026-10-19", "note": "ikinci içerik denetimi düzeltmesi"})
P = R / "docs/assets/voice-provenance.jsonl"
old = [l for l in open(P) if json.loads(l)["key"] not in expected]
with open(P, "w") as fo:
    fo.writelines(old)
    for p in prov: fo.write(json.dumps(p, ensure_ascii=False) + "\n")
print("yerleşti:", len(prov))
