"""1. sınıf onaylı sesleri topla, -18 LUFS'a eşitle, mono 24 kHz Ogg Vorbis olarak assets/audio/voice altına koy, kayıt yaz."""
import json, hashlib, subprocess, sys
from pathlib import Path
import numpy as np, soundfile as sf
R = Path("/Users/codehepta/Projects/OkulEtkinlik"); A = R / "build/audio"
KAYNAK = set(json.load(open(A / "voice_g1_kaynak_sesleri.json")))
VOICES = json.load(open(R / "build/ttsgen/voices.json"))
def sha(p): return hashlib.sha256(open(p, "rb").read()).hexdigest()[:16]
REFHASH = {k: sha(R / "build/ttsgen" / v["ref"]) for k, v in VOICES.items()}
pairs = lambda f: dict(p.split("=") for p in open(f).read().split())
picks = {}  # key -> (wav path, meta)
def add(key, path, meta, src):
    picks[key] = (path, meta, src)
def meta_index(d):
    return {x["final"] if "final" in x else x["out"]: x for x in json.load(open(d / "meta.json"))}
# 1) tek aday kısa + uzun (Whisper seçimi)
for d in ("short", "long", "last"):
    D = A / "voice_full" / d; idx = meta_index(D)
    for f, x in idx.items():
        if x.get("chosen"): add(x["key"], D / f, x, f"voice_full/{d}")
    if d == "last":
        for k, f in pairs(D / "owner_overrides.txt").items(): add(k, D / f, idx[f], "voice_full/last (sahip)")
# 2) sahibin yeniden seçtikleri
for d in ("voice_fix1", "voice_fix2"):
    D = A / d; idx = meta_index(D)
    pf = D / "owner_picks.txt"
    if pf.exists():
        for k, f in pairs(pf).items(): add(k, D / f, idx[f], d + " (sahip)")
# 3) pilotta onaylananlar
op = json.load(open(A / "voice_pilot/rules/owner_picks.json"))
idx = meta_index(A / "voice_pilot/rules")
for k, f in op["approved"].items(): add(k, A / "voice_pilot/rules" / f, idx[f], "pilot (sahip)")
idx = meta_index(A / "voice_pilot/retry")
for k, f in op["approved_retry"].items(): add(k, A / "voice_pilot/retry" / f, idx[f], "pilot (sahip)")
idx = meta_index(A / "voice_pilot/top20")
for k, f in pairs(A / "voice_pilot/top20/owner_picks.txt").items(): add(k, A / "voice_pilot/top20" / f, idx[f], "en sık 20 (sahip)")
for k in KAYNAK: picks.pop(k, None)
# 1. sınıf kapsamı + pilotta onaylananlar
scope = set(json.load(open(A / "voice_g1_short.json")) and [i["key"] for i in json.load(open(A / "voice_g1_short.json")) + json.load(open(A / "voice_g1_long.json")) + json.load(open(A / "voice_g1_last.json"))])
scope |= set(op["approved"]) | set(op["approved_retry"]) | set(pairs(A / "voice_pilot/top20/owner_picks.txt"))
scope -= KAYNAK
missing = sorted(scope - set(picks)); assert not missing, missing
prov = []
for k in sorted(scope):
    src, x, origin = picks[k]
    raw = subprocess.run(["ffmpeg", "-hide_banner", "-loglevel", "error", "-i", str(src), "-af", "loudnorm=I=-18:TP=-1.5:LRA=11", "-ar", "24000", "-ac", "1", "-f", "f32le", "-"], capture_output=True, check=True).stdout
    w = np.frombuffer(raw, np.float32)
    dst = R / "assets/audio/voice" / ("/".join(k.split(".")[1:]) + ".ogg"); dst.parent.mkdir(parents=True, exist_ok=True)
    with sf.SoundFile(dst, "w", 24000, 1, format="OGG", subtype="VORBIS") as f:
        for i in range(0, len(w), 16384): f.write(w[i:i + 16384])
    prov.append({"key": k, "file": str(dst.relative_to(R)), "text": x["text"], "spoken": x["say"], "speaker": x["speaker"],
                 "model": "openbmb/VoxCPM2", "model_license": "Apache-2.0", "runtime": "voxcpm 2.0.3 (MPS)", "seed": x["seed"],
                 "cfg_value": 2.0, "inference_timesteps": 10, "reference_voice": VOICES[x["speaker"]]["ref"].split("/")[-1],
                 "reference_sha256_16": REFHASH[x["speaker"]], "carrier_crop": bool(x.get("carrier") or x.get("crop_words")),
                 "whisper_heard": x.get("heard", ""), "selected_by": "sahip" if "sahip" in origin else "Whisper otomatik + sahip örnek dinleme",
                 "date": "2026-10-08"})
with open(R / "docs/assets/voice-provenance.jsonl", "a") as fo:
    for p in prov: fo.write(json.dumps(p, ensure_ascii=False) + "\n")
print("yerleşti:", len(prov), "ses")
