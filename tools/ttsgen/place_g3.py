"""3. sınıf onaylı sesleri topla, -18 LUFS'a eşitle, mono 24 kHz Ogg Vorbis olarak assets/audio/voice altına koy, kayıt yaz.
Kaynak sırası (sonraki öncekini ezer): tek aday (main) → son grup (last) → sahibin değişiklikleri (owner_picks.txt;
"red:" reddedilenler) → reddedilenlerin yeni adayından sahibin seçimi (regen_picks.txt).
Yerleştirmeden sonra: uv run tools/ttsgen/denoise_voices.py (uğultu temizliği)."""
import json, hashlib, subprocess
from pathlib import Path
import numpy as np, soundfile as sf
R = Path("/Users/codehepta/Projects/OkulEtkinlik"); A = R / "build/audio"; G = A / "voice_g3"
VOICES = json.load(open(R / "build/ttsgen/voices.json"))
def sha(p): return hashlib.sha256(open(p, "rb").read()).hexdigest()[:16]
REFHASH = {k: sha(R / "build/ttsgen" / v["ref"]) for k, v in VOICES.items()}
pairs = lambda f: dict(p.split("=") for p in open(f).read().split() if not p.startswith("red:"))
rejected = lambda f: {p[4:] for p in open(f).read().split() if p.startswith("red:")}
def meta_index(d): return {x["final"]: x for x in json.load(open(d / "meta.json"))}
picks = {}  # key -> (wav, meta, kaynak)
for d in ("main", "last"):
    for f, x in meta_index(G / d).items():
        if x.get("chosen"): picks[x["key"]] = (G / d / f, x, f"voice_g3/{d}")
idx = {**meta_index(G / "main"), **meta_index(G / "last")}
DIRS = {f: d for d in ("main", "last") for f in meta_index(G / d)}
for k, f in pairs(G / "owner_picks.txt").items(): picks[k] = (G / DIRS[f] / f, idx[f], "voice_g3 (sahip)")
red = rejected(G / "owner_picks.txt")
for k in red: picks.pop(k)
rg = meta_index(G / "regen")
for k, f in pairs(G / "regen_picks.txt").items(): picks[k] = (G / "regen" / f, rg[f], "voice_g3/regen (sahip)")
scope = {x["key"] for x in json.load(open(A / "voice_g3_short.json")) + json.load(open(A / "voice_g3_long.json")) + json.load(open(A / "voice_g3_last.json"))}
missing = sorted(scope - set(picks)); assert not missing, missing
prov = []
for k in sorted(scope):
    src, x, origin = picks[k]
    raw = subprocess.run(["ffmpeg", "-hide_banner", "-loglevel", "error", "-i", str(src), "-af", "loudnorm=I=-18:TP=-1.5:LRA=11", "-ar", "24000", "-ac", "1", "-f", "f32le", "-"], capture_output=True, check=True).stdout
    w = np.frombuffer(raw, np.float32)
    dst = R / "assets/audio/voice" / ("/".join(k.split(".")[1:]) + ".ogg"); dst.parent.mkdir(parents=True, exist_ok=True)
    with sf.SoundFile(dst, "w", 24000, 1, format="OGG", subtype="VORBIS", compression_level=1.0) as f:
        for i in range(0, len(w), 16384): f.write(w[i:i + 16384])
    prov.append({"key": k, "file": str(dst.relative_to(R)), "text": x["text"], "spoken": x["say"], "speaker": x["speaker"],
                 "model": "openbmb/VoxCPM2", "model_license": "Apache-2.0", "runtime": "voxcpm 2.0.3 (MPS)", "seed": x["seed"],
                 "cfg_value": 2.0, "inference_timesteps": 10, "reference_voice": VOICES[x["speaker"]]["ref"].split("/")[-1],
                 "reference_sha256_16": REFHASH[x["speaker"]], "carrier_crop": bool(x.get("carrier") or x.get("crop_words")),
                 "whisper_heard": x.get("heard", ""), "selected_by": "sahip" if "sahip" in origin else "Whisper otomatik + sahip dinleme",
                 "date": "2026-10-23"})
P = R / "docs/assets/voice-provenance.jsonl"
old = [l for l in open(P) if json.loads(l)["key"] not in scope]  # aynı anahtarın eski kaydı yenisiyle değişir
with open(P, "w") as fo:
    fo.writelines(old)
    for p in prov: fo.write(json.dumps(p, ensure_ascii=False) + "\n")
print("yerleşti:", len(prov), "ses | kayıt toplamı:", len(old) + len(prov))
