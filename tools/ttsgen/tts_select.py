"""Check every candidate with Whisper and pick one per line.

Usage: uv run --no-project --python 3.11 --with mlx-whisper --with soundfile \
         python tts_select.py out_dir [--rules rules_tr] [--lang tr]

- Carrier variants ("Now we read: an.") are cropped to the last word using Whisper word timestamps.
- Every output gets a 50 ms lead-in, 20 ms fades and 250 ms tail (avoids clicks and "cut-off" endings).
- Pick per line among takes heard correctly: short lines -> the median-length take (owner tests: the
  longest takes sounded slow/stretched, the shortest clipped); sentences -> the shortest (most fluent).
Writes *_final.wav next to the raw files and marks "chosen" in meta.json.
"""
import argparse, importlib, json, mlx_whisper, numpy as np, soundfile as sf
from pathlib import Path

ap = argparse.ArgumentParser(); ap.add_argument("out")
ap.add_argument("--rules", default="rules_tr"); ap.add_argument("--lang", default="tr")
ap.add_argument("--short-words", type=int, default=2)
a = ap.parse_args()
rules = importlib.import_module(a.rules)
D = Path(a.out); meta = json.load(open(D / "meta.json"))
ASR = "mlx-community/whisper-large-v3-turbo"  # MIT

def finish(w, sr):
    f = int(sr * 0.02); w = w.copy(); w[:f] *= np.linspace(0, 1, f); w[-f:] *= np.linspace(1, 0, f)
    return np.concatenate([np.zeros(int(sr * 0.05), np.float32), w, np.zeros(int(sr * 0.25), np.float32)])

for x in meta:
    if "ok" in x: continue
    w, sr = sf.read(D / x["file"], dtype="float32")
    r = mlx_whisper.transcribe(str(D / x["file"]), path_or_hf_repo=ASR, language=a.lang,
                               word_timestamps=x["carrier"], verbose=None)
    x["asr"] = heard = r["text"].strip()
    if x["carrier"]:
        words = [wd for s in r["segments"] for wd in s.get("words", [])]
        if len(words) >= 2:
            last = words[-1]; heard = last["word"].strip()
            w = w[max(0, int((last["start"] - 0.06) * sr)):min(len(w), int((last["end"] + 0.12) * sr))]
    x["heard"], x["dur"] = heard, round(len(w) / sr, 2)
    x["final"] = x["file"].replace(".wav", "_final.wav"); sf.write(D / x["final"], finish(w, sr), sr)
    x["ok"] = rules.heard_ok(x["text"], x["say"], heard)

best = {}
by = {}
for x in meta: by.setdefault(x["key"], []).append(x)
for k, xs in by.items():
    pool = [x for x in xs if x["ok"]] or xs
    pool.sort(key=lambda x: x["dur"])
    short = len(xs[0]["text"].split()) <= a.short_words
    pick = pool[len(pool) // 2] if short else pool[0]
    best[k] = (None, pick)
for x in meta: x["chosen"] = best[x["key"]][1] is x
json.dump(meta, open(D / "meta.json", "w"), ensure_ascii=False, indent=1)
bad = [k for k, (_, x) in best.items() if not x["ok"]]
# "longest wins" can pick a take with a trailing breath or noise: flag picks much longer than the shortest correct take
long = [k for k, (_, x) in best.items() if x["ok"] and x["dur"] > 2.5 * min(y["dur"] for y in meta if y["key"] == k and y["ok"])]
if long: print("check tails by ear (much longer than other correct takes):", long)
print(f"{len(best)} lines, {len(best) - len(bad)} heard correctly; review by ear: {bad}")
