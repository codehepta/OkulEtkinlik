"""Sahibin seçtiği adayları assets/ altına yerleştirir ve kaynak kaydını tutar.

Kullanım (repo kökünden):
    uv run --project tools/imagegen python tools/imagegen/approve.py 060 1=1000 4=1001 7=1000:klein

Her seçim için: aday (arka planı silinmişse _cut sürümü) şeffaf kenarları kırpılarak,
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
from generate import OUT_ROOT, REPO, find_batch

PROVENANCE = REPO / "docs" / "assets" / "image-provenance.jsonl"
MAX_SIDE = 1024


def prepare(src: Path, trim: bool) -> Image.Image:
    im = Image.open(src)
    im = im.convert("RGBA") if trim else im.convert("RGB")
    if trim:
        bbox = im.getchannel("A").point(lambda a: 255 if a > 8 else 0).getbbox()
        if bbox:
            im = im.crop(bbox)
    if max(im.size) > MAX_SIDE:
        im.thumbnail((MAX_SIDE, MAX_SIDE), Image.LANCZOS)
    return im


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("batch")
    ap.add_argument("choices", nargs="+", help="öğe=tohum[:model], ör. 3=1001 ya da 3=1001:klein")
    ap.add_argument("--overwrite", action="store_true", help="assets/ içindeki mevcut dosyanın üzerine yaz")
    args = ap.parse_args()

    batch_file = find_batch(args.batch)
    items = {i.number: i for i in parse_batch(batch_file.read_text(encoding="utf-8"))}
    out_dir = OUT_ROOT / batch_file.stem

    records: list[dict] = []
    for choice in args.choices:
        number_s, rest = choice.split("=")
        seed_s, _, model = rest.partition(":")
        model = model or "zimage"
        item = items.get(int(number_s))
        if item is None:
            sys.exit(f"{batch_file.name} içinde {number_s} numaralı öğe yok")
        base = out_dir / item.key / f"s{int(seed_s)}_{model}"
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
        prepare(src, trim=src == cut).save(target)
        records.append({**meta, "approved": date.today().isoformat(), "source_file": str(src.relative_to(REPO))})
        print(f"{item.number} {item.key} → {item.path}")

    PROVENANCE.parent.mkdir(parents=True, exist_ok=True)
    with PROVENANCE.open("a", encoding="utf-8") as f:
        for r in records:
            f.write(json.dumps(r, ensure_ascii=False) + "\n")
    print(f"Kayıt: {PROVENANCE.relative_to(REPO)} (+{len(records)})")


if __name__ == "__main__":
    main()
