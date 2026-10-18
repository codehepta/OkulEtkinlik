"""Sahibin seçtiği adayları assets/ altına yerleştirir ve kaynak kaydını tutar.

Kullanım (repo kökünden):
    uv run --project tools/imagegen python tools/imagegen/approve.py 060 1=1000 4=1001 7=1000:klein
    uv run --project tools/imagegen python tools/imagegen/approve.py 100 2=1000:ernie 3=1001:ernie_real
    uv run --project tools/imagegen python tools/imagegen/approve.py 040 9=0:blender

Her seçim için: aday (arka planı silinmişse _cut sürümü) şeffaf kenarları kırpılarak
(kayıtta "trim": false ise kırpılmadan),
uzun kenarı en fazla 1024 px olacak şekilde hedef yola yazılır; üretim bilgisi
docs/assets/image-provenance.jsonl dosyasına eklenir.
"""

import argparse
import json
import sys
from datetime import date
from pathlib import Path

from PIL import Image

from batch_parser import parse_batch
from generate import MODELS, OUT_ROOT, REPO, find_batch
from styles import REAL_SUFFIX

PROVENANCE = REPO / "docs" / "assets" / "image-provenance.jsonl"
MAX_SIDE = 1024


def prepare(src: Path, trim: bool) -> Image.Image:
    im = Image.open(src)
    has_alpha = im.mode in ("RGBA", "LA") or (im.mode == "P" and "transparency" in im.info)
    im = im.convert("RGBA") if (trim or has_alpha) else im.convert("RGB")
    if trim:
        bbox = im.getchannel("A").point(lambda a: 255 if a > 8 else 0).getbbox()
        if bbox:
            im = im.crop(bbox)
    if max(im.size) > MAX_SIDE:
        im.thumbnail((MAX_SIDE, MAX_SIDE), Image.LANCZOS)
    return im


def parse_choice(choice: str) -> tuple[int, int, str, str]:
    """"3=1001", "3=1001:klein", "3=1001:ernie_real" → (öğe, tohum, model, son ek)."""
    number_s, eq, rest = choice.partition("=")
    seed_s, _, model = rest.partition(":")
    if not eq or not number_s.isdigit() or not seed_s.lstrip("-").isdigit():
        sys.exit(f"Seçim biçimi öğe=tohum[:model], ör. 3=1001:ernie_real (verilen: {choice})")
    model = model or "zimage"
    suffix = REAL_SUFFIX if model.endswith(REAL_SUFFIX) else ""
    return int(number_s), int(seed_s), model.removesuffix(REAL_SUFFIX), suffix


def provenance_record(meta: dict, model: str, source_file: str, approved: str) -> dict:
    """Kaynak kaydı satırı; bilinen modellerde eksik model/lisans/HF commit'i tablodan tamamlanır."""
    record = {**meta, "approved": approved, "source_file": source_file}
    info = MODELS.get(model)
    if info is not None:
        record.setdefault("model", info["registry"])
        record.setdefault("model_license", info["license"])
        if "revision" in info:
            record.setdefault("hf_revision", info["revision"])
    return record


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("batch")
    ap.add_argument("choices", nargs="+",
                    help="öğe=tohum[:model], ör. 3=1001, 3=1001:klein, 3=1001:ernie ya da kilsiz aday için "
                         "3=1001:ernie_real")
    ap.add_argument("--overwrite", action="store_true", help="assets/ içindeki mevcut dosyanın üzerine yaz")
    args = ap.parse_args()

    batch_file = find_batch(args.batch)
    items = {i.number: i for i in parse_batch(batch_file.read_text(encoding="utf-8"))}
    out_dir = OUT_ROOT / batch_file.stem

    records: list[dict] = []
    for choice in args.choices:
        number, seed, model, suffix = parse_choice(choice)
        item = items.get(number)
        if item is None:
            sys.exit(f"{batch_file.name} içinde {number} numaralı öğe yok")
        base = out_dir / item.key / f"s{seed}_{model}{suffix}"
        meta_path = base.with_suffix(".json")
        if not meta_path.exists():
            sys.exit(f"Aday bulunamadı: {meta_path.relative_to(REPO)}")
        meta = json.loads(meta_path.read_text(encoding="utf-8"))
        cut = base.parent / f"{base.name}_cut.png"
        src = cut if meta.get("background_removed") and cut.exists() else base.with_suffix(".png")
        target = REPO / item.path
        if target.exists() and not args.overwrite:
            sys.exit(f"Hedef zaten var (üzerine yazmak için --overwrite): {item.path}")
        target.parent.mkdir(parents=True, exist_ok=True)
        # Blender öğeleri sabit ölçekle çekilir; kırpılırsa "küçük" ile "büyük" aynı boyuta gelir
        trim = meta.get("trim", src == cut)
        prepare(src, trim=trim).save(target)
        records.append(provenance_record(meta, model, str(src.relative_to(REPO)), date.today().isoformat()))
        print(f"{item.number} {item.key} → {item.path}")

    PROVENANCE.parent.mkdir(parents=True, exist_ok=True)
    with PROVENANCE.open("a", encoding="utf-8") as f:
        for r in records:
            f.write(json.dumps(r, ensure_ascii=False) + "\n")
    print(f"Kayıt: {PROVENANCE.relative_to(REPO)} (+{len(records)})")


if __name__ == "__main__":
    main()
