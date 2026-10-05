"""Bir asset-requests partisindeki görseller için yerel aday üretir.

Kullanım (repo kökünden):
    uv run --project tools/imagegen python tools/imagegen/generate.py 060 --items 1-5 --seeds 2
    uv run --project tools/imagegen python tools/imagegen/generate.py 040 --model klein --style-ref assets/images/items/oyuncak/kup.png

Çıktı: build/imagegen/<parti>/<anahtar>/s<tohum>.png (ham) + s<tohum>_cut.png (arka planı silinmiş)
       + s<tohum>.json (model, sürüm, tohum, prompt) + build/imagegen/<parti>/sheet.png (seçim sayfası).
Adaylar assets/'e otomatik girmez; seçim sahibindir (bkz. approve.py).
"""

import argparse
import json
import sys
import time
from pathlib import Path

from PIL import Image, ImageDraw

from batch_parser import BatchItem, parse_batch

REPO = Path(__file__).resolve().parents[2]
OUT_ROOT = REPO / "build" / "imagegen"
MFLUX_VERSION = "0.20.0"
BIREFNET_REPO = "ZhengPeng7/BiRefNet"
BIREFNET_REVISION = "e2bf8e4460fc8fa32bba5ea4d94b3233d367b0e4"
GREY = (0xEE, 0xEE, 0xEE)

# Oran → üretim boyutu (16'nın katları, ~1 MP)
SIZES: dict[str, tuple[int, int]] = {
    "1:1": (1024, 1024),
    "16:9": (1344, 768),
    "2:1": (1408, 704),
    "3:4": (864, 1152),
    "4:3": (1152, 864),
}

MODELS: dict[str, dict] = {
    "zimage": {"registry": "z-image-turbo", "license": "Apache-2.0", "steps": 9},
    "klein": {"registry": "flux2-klein-4b", "license": "Apache-2.0", "steps": 4},
}


def find_batch(batch_id: str) -> Path:
    matches = sorted((REPO / "asset-requests").glob(f"{batch_id}-*.md"))
    if not matches:
        sys.exit(f"Parti bulunamadı: asset-requests/{batch_id}-*.md")
    return matches[0]


def select_items(items: list[BatchItem], spec: str | None) -> list[BatchItem]:
    if not spec:
        return items
    wanted: set[int] = set()
    for part in spec.split(","):
        if "-" in part:
            a, b = part.split("-")
            wanted.update(range(int(a), int(b) + 1))
        else:
            wanted.add(int(part))
    return [i for i in items if i.number in wanted]


class Generator:
    def __init__(self, model: str, quantize: int | None, lora: list[str]) -> None:
        from mflux.models.common.resolution.config_resolution import ConfigResolution

        self.model = model
        lora_paths = [l.split(":")[0] for l in lora] or None
        lora_scales = [float(l.split(":")[1]) if ":" in l else 1.0 for l in lora] or None
        registry = MODELS[model]["registry"]
        if model == "zimage":
            from mflux.models.z_image.variants.z_image import ZImage

            self.pipe = ZImage(
                model_config=ConfigResolution.resolve_restricted(registry, registry),
                quantize=quantize,
                lora_paths=lora_paths,
                lora_scales=lora_scales,
            )
        else:
            from mflux.models.flux2.variants import Flux2KleinEdit

            self.pipe = Flux2KleinEdit(
                model_config=ConfigResolution.resolve_restricted(registry, registry),
                quantize=quantize,
                lora_paths=lora_paths,
                lora_scales=lora_scales,
            )

    def generate(self, prompt: str, seed: int, size: tuple[int, int], steps: int, refs: list[Path]) -> Image.Image:
        w, h = size
        if self.model == "zimage":
            result = self.pipe.generate_image(seed=seed, prompt=prompt, width=w, height=h, num_inference_steps=steps)
        else:
            result = self.pipe.generate_image(
                seed=seed, prompt=prompt, width=w, height=h, num_inference_steps=steps,
                image_paths=[str(r) for r in refs] or None,
            )
        return result.image


class BackgroundRemover:
    def __init__(self) -> None:
        import torch
        from torchvision import transforms
        from transformers import AutoModelForImageSegmentation

        self.torch = torch
        self.device = "mps" if torch.backends.mps.is_available() else "cpu"
        # trust_remote_code: kod sabit commit'ten gelir (BIREFNET_REVISION); o sürüm incelendi
        self.net = AutoModelForImageSegmentation.from_pretrained(
            BIREFNET_REPO, revision=BIREFNET_REVISION, trust_remote_code=True,
        ).to(self.device).float().eval()
        self.tf = transforms.Compose([
            transforms.Resize((1024, 1024)),
            transforms.ToTensor(),
            transforms.Normalize([0.485, 0.456, 0.406], [0.229, 0.224, 0.225]),
        ])
        self.to_pil = transforms.ToPILImage()

    def cut(self, image: Image.Image) -> Image.Image:
        rgb = image.convert("RGB")
        with self.torch.no_grad():
            pred = self.net(self.tf(rgb).unsqueeze(0).to(self.device))[-1].sigmoid().cpu()[0].squeeze()
        out = rgb.copy()
        out.putalpha(self.to_pil(pred).resize(rgb.size))
        return out


def contact_sheet(rows: list[tuple[str, list[Path]]], dest: Path, cell: int = 300) -> None:
    """Geliştirici seçim sayfası: her satır bir öğe, her sütun bir tohum."""
    if not rows:
        return
    cols = max(len(paths) for _, paths in rows)
    label_h = 28
    sheet = Image.new("RGB", (cols * (cell + 12) + 12, len(rows) * (cell + label_h + 12) + 12), GREY)
    draw = ImageDraw.Draw(sheet)
    for r, (title, paths) in enumerate(rows):
        y0 = 12 + r * (cell + label_h + 12)
        draw.text((12, y0 + 6), title, fill=(60, 60, 60))
        for c, p in enumerate(paths):
            im = Image.open(p).convert("RGBA")
            bbox = im.getbbox()
            if bbox:
                im = im.crop(bbox)
            im.thumbnail((cell, cell), Image.LANCZOS)
            x = 12 + c * (cell + 12) + (cell - im.width) // 2
            y = y0 + label_h + (cell - im.height) // 2
            sheet.paste(im, (x, y), im)
            draw.text((12 + c * (cell + 12), y0 + label_h - 2), p.stem.split("_")[0], fill=(120, 120, 120))
    sheet.save(dest)


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("batch", help="parti numarası, ör. 060")
    ap.add_argument("--items", help="öğe numaraları: 1-5,8")
    ap.add_argument("--model", choices=sorted(MODELS), default="zimage")
    ap.add_argument("--seeds", type=int, default=2, help="öğe başına aday sayısı")
    ap.add_argument("--seed-base", type=int, default=1000)
    ap.add_argument("--steps", type=int)
    ap.add_argument("--quantize", type=int, default=8, choices=[4, 6, 8])
    ap.add_argument("--lora", action="append", default=[], help="yol[:ölçek]")
    ap.add_argument("--style-ref", action="append", default=[], help="klein için ek stil referansı (repo yolu)")
    ap.add_argument("--force", action="store_true", help="assets/ içinde zaten olan öğeleri de üret")
    ap.add_argument("--no-cut", action="store_true", help="arka plan silmeyi atla")
    args = ap.parse_args()

    batch_file = find_batch(args.batch)
    items = select_items(parse_batch(batch_file.read_text(encoding="utf-8")), args.items)
    if not args.force:
        items = [i for i in items if not (REPO / i.path).exists()]
    if not items:
        print("Üretilecek öğe yok.")
        return
    style_refs = [REPO / s for s in args.style_ref]
    steps = args.steps or MODELS[args.model]["steps"]
    out_dir = OUT_ROOT / batch_file.stem

    # 1. aşama: üretim. MLX ile PyTorch aynı anda bellekte kalırsa ikisinin tampon önbellekleri
    # birleşik belleği doldurur, sistem swap'a düşer ve üretim ~3 kat yavaşlar. Bu yüzden önce
    # bütün ham görseller üretilir, model bellekten atılır, arka plan silme sonra yapılır.
    import gc

    import mlx.core as mx

    mx.set_cache_limit(2 * 1024**3)
    t0 = time.time()
    gen = Generator(args.model, args.quantize, args.lora)
    print(f"Model yüklendi: {time.time() - t0:.0f} sn")

    planned: list[tuple[BatchItem, list[Path]]] = []
    to_cut: list[tuple[Path, Path, Path]] = []  # (ham, kesilmiş, kayıt)
    for item in items:
        refs: list[Path] = []
        if item.reference:
            ref = REPO / item.reference
            if not ref.exists():
                print(f"ATLANDI {item.number} {item.key}: referans yok ({item.reference})")
                continue
            if args.model != "klein":
                print(f"ATLANDI {item.number} {item.key}: referanslı öğe için --model klein gerekir")
                continue
            refs.append(ref)
        if args.model == "klein":
            refs += style_refs
        size = SIZES.get(item.ratio, SIZES["1:1"])
        item_dir = out_dir / item.key
        item_dir.mkdir(parents=True, exist_ok=True)
        shown: list[Path] = []
        for k in range(args.seeds):
            seed = args.seed_base + k
            t = time.time()
            image = gen.generate(item.prompt, seed, size, steps, refs)
            raw = item_dir / f"s{seed}_{args.model}.png"
            image.save(raw)
            mx.clear_cache()
            cut_requested = not args.no_cut and item.remove_background
            cut_path = item_dir / f"s{seed}_{args.model}_cut.png"
            meta = {
                "key": item.key, "target": item.path, "batch": batch_file.name, "number": item.number,
                "model": MODELS[args.model]["registry"], "model_license": MODELS[args.model]["license"],
                "mflux": MFLUX_VERSION, "quantize": args.quantize, "steps": steps, "seed": seed,
                "size": list(size), "prompt": item.prompt, "lora": args.lora,
                "references": [str(r.relative_to(REPO)) for r in refs],
                "background_removed": cut_requested,
                "birefnet": f"{BIREFNET_REPO}@{BIREFNET_REVISION}" if cut_requested else None,
            }
            meta_path = raw.with_suffix(".json")
            meta_path.write_text(json.dumps(meta, ensure_ascii=False, indent=2), encoding="utf-8")
            if cut_requested:
                to_cut.append((raw, cut_path, meta_path))
            shown.append(cut_path if cut_requested else raw)
            print(f"{item.number:>3} {item.key} s{seed}: {time.time() - t:.0f} sn", flush=True)
        planned.append((item, shown))

    del gen
    gc.collect()
    mx.clear_cache()

    # 2. aşama: arka plan silme (PyTorch / MPS)
    if to_cut:
        t = time.time()
        remover = BackgroundRemover()
        for raw, cut_path, _ in to_cut:
            remover.cut(Image.open(raw)).save(cut_path)
            if remover.device == "mps":
                remover.torch.mps.empty_cache()
        print(f"Arka plan silindi: {len(to_cut)} görsel, {time.time() - t:.0f} sn", flush=True)

    rows = [(f"{item.number}. {item.key}", shown) for item, shown in planned]
    sheet = out_dir / f"sheet_{args.model}.png"
    contact_sheet(rows, sheet)
    print(f"Seçim sayfası: {sheet.relative_to(REPO)}  (toplam {time.time() - t0:.0f} sn)")


if __name__ == "__main__":
    main()
