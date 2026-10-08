"""Generate voice-over candidates with VoxCPM2 (Apache-2.0) on Apple Silicon.

Usage (inside a venv with `pip install voxcpm soundfile`):
    PYTORCH_ENABLE_MPS_FALLBACK=1 python tts_generate.py items.json voices.json out_dir [--rules rules_tr]

items.json : [{"key": "vo.sayi.11", "text": "on bir", "speaker": "NARRATOR"}, ...]
voices.json: {"NARRATOR": {"ref": "voices/narrator.wav", "ref_text": "<exact transcript of ref>"}, ...}
Each line's spoken variants come from the rules module (variants(key, text) -> [{"say", "carrier"}]).
Short lines (<= --short-words, default 2) get 4 seeds per variant, long lines 2. Resumable: existing wavs are skipped.
Writes out_dir/meta.json for tts_select.py.
"""
import argparse, importlib, json, numpy as np, soundfile as sf, torch
from pathlib import Path
from voxcpm import VoxCPM

ap = argparse.ArgumentParser()
ap.add_argument("items"); ap.add_argument("voices"); ap.add_argument("out")
ap.add_argument("--rules", default="rules_tr")
ap.add_argument("--short-seeds", type=int, default=4); ap.add_argument("--long-seeds", type=int, default=2)
ap.add_argument("--short-words", type=int, default=2, help="lines with at most this many words count as short")
ap.add_argument("--work-minutes", type=float, default=0, help="duty cycle: generate this long, then rest (0 = off)")
ap.add_argument("--rest-minutes", type=float, default=10)
a = ap.parse_args()
rules = importlib.import_module(a.rules)
out = Path(a.out); out.mkdir(parents=True, exist_ok=True)
items = json.load(open(a.items)); voices = json.load(open(a.voices))
m = VoxCPM.from_pretrained("openbmb/VoxCPM2", load_denoiser=False, optimize=False, device="mps")
sr = m.tts_model.sample_rate
import time
meta = []; work_start = time.time()
for it in items:
    if a.work_minutes and time.time() - work_start > a.work_minutes * 60:   # keep the laptop cool on long runs
        print(time.strftime("%H:%M"), f"rest {a.rest_minutes:g} min", flush=True)
        time.sleep(a.rest_minutes * 60); work_start = time.time()
    v = voices[it["speaker"]]
    n_seeds = a.short_seeds if len(it["text"].split()) <= a.short_words else a.long_seeds
    for vi, var in enumerate(rules.variants(it["key"], it["text"])):
        for s in range(n_seeds):
            name = f'{it["key"].replace(".", "_")}__v{vi}_s{s}.wav'
            if not (out / name).exists():
                torch.manual_seed(s); np.random.seed(s)
                # continuation (prompt_wav + prompt_text) keeps the reference's language and accent;
                # reference_wav keeps the timbre. Both together were needed for short words.
                w = m.generate(text=var["say"], prompt_wav_path=v["ref"], prompt_text=v["ref_text"],
                               reference_wav_path=v["ref"], cfg_value=2.0, inference_timesteps=10)
                sf.write(out / name, np.asarray(w, np.float32), sr)
            meta.append({**it, "say": var["say"], "carrier": var["carrier"], "seed": s, "file": name})
    print("done", it["key"], flush=True)
    json.dump(meta, open(out / "meta.json", "w"), ensure_ascii=False, indent=1)  # checkpoint every line
json.dump(meta, open(out / "meta.json", "w"), ensure_ascii=False, indent=1)
