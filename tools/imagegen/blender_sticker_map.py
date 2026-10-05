"""Türkiye harita çıkartması (st.hayat_bilgisi.harita): beyaz kil rozet üzerinde gerçek sınırlı
kırmızı Türkiye silüeti ve beyaz ay-yıldız. Difüzyon ülke şeklini uydurduğu için sınır
Natural Earth verisinden (data/turkiye_bolge.json, kamu malı) gelir; ay-yıldız Bayrak
Kanunu oranlarıyla blender_geometry'deki crescent_star_shapes'ten çizilir.

Kullanım (repo kökünden):
    /Applications/Blender.app/Contents/MacOS/Blender -b --factory-startup \\
        -P tools/imagegen/blender_sticker_map.py -- [--samples 128]
"""

import json
import math
import sys
from pathlib import Path

import bpy
from mathutils import Vector

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
SAMPLES = int(argv[argv.index("--samples") + 1]) if "--samples" in argv else 128

bg_path = HERE / "blender_geometry.py"
bg = {"__file__": str(bg_path), "__name__": "blender_geometry"}
exec(compile(bg_path.read_text(encoding="utf-8").replace("\nmain()\n", "\n"), str(bg_path), "exec"), bg)
sys.path.insert(0, str(HERE))
from batch_parser import parse_batch  # noqa: E402

KEY = "st.hayat_bilgisi.harita"
data = json.loads((HERE / "data" / "turkiye_bolge.json").read_text(encoding="utf-8"))
LAT_C, LON_C = 38.9, 35.2
KX = math.cos(math.radians(LAT_C))
SCALE = 1.62 / ((45.0 - 26.0) * KX)  # Türkiye rozetin içinde ~1,62 birim genişlik


def project(lon: float, lat: float) -> tuple[float, float]:
    return (lon - LON_C) * KX * SCALE, (lat - LAT_C) * SCALE


bg["reset_scene"](SAMPLES)
sc = bpy.context.scene
sc.view_settings.exposure = -0.6
red = bg["clay_material"]("kirmizi", bg["srgb"]("#E3342C"))
white = bg["clay_material"]("beyaz", bg["srgb"]("#F8F6F2"))

# beyaz kil rozet (kalın kesim kenarı)
bg["_dense_flat"]("rozet", bg["regular"](128, 1.08), white, 0.0, 0.2)

# Türkiye: en büyük halka (anakara) + Trakya; kalın, pahlı kil
cu = bpy.data.curves.new("turkiye", "CURVE")
cu.dimensions = "2D"
cu.fill_mode = "BOTH"
cu.extrude = 0.06
cu.bevel_depth = 0.03
cu.bevel_resolution = 3
for ring in data["countries"]["TUR"]["rings"]:
    pts = [project(lon, lat) for lon, lat in ring[:-1]]
    xs = [p[0] for p in pts]
    if max(xs) - min(xs) < 0.05:
        continue  # küçük adalar küçük ölçekte okunmaz
    sp = cu.splines.new("POLY")
    sp.points.add(len(pts) - 1)
    for p, (x, y) in zip(sp.points, pts):
        p.co = (x, y, 0.0, 1.0)
    sp.use_cyclic_u = True
tr = bpy.data.objects.new("turkiye", cu)
sc.collection.objects.link(tr)
tr.location.z = 0.2
tr.data.materials.append(red)

# beyaz ay-yıldız, haritanın ortasında
g = 0.42
crescent, star = bg["crescent_star_shapes"](g, 0.0, 0.0)
xs = [p[0] for p in crescent[0] + star]
shift = -(min(xs) + max(xs)) / 2
crescent = tuple([(x + shift, y + 0.03) for x, y in arc] for arc in crescent)
star = [(x + shift, y + 0.03) for x, y in star]
bg["_dense_flat"]("hilal", crescent, white, 0.3, 0.03)
bg["_dense_flat"]("yildiz", star, white, 0.3, 0.03)

# kamera: önden hafif yukarıdan, diğer çıkartmalarla aynı açı
cam_d = bpy.data.cameras.new("cam")
cam_d.type = "ORTHO"
cam_d.ortho_scale = 2.5
cam = bpy.data.objects.new("cam", cam_d)
sc.collection.objects.link(cam)
sc.camera = cam
d = Vector((0.0, -0.35, 1.0)).normalized()
cam.location = Vector((0, 0, 0.1)) + d * 10
cam.rotation_euler = (-d).to_track_quat("-Z", "Y").to_euler()

it = {i.key: i for i in parse_batch((REPO / "asset-requests" / "083-hb-cikartmalar.md").read_text(encoding="utf-8"))}[KEY]
out = REPO / "build" / "imagegen" / "083-hb-cikartmalar" / KEY
out.mkdir(parents=True, exist_ok=True)
sc.render.filepath = str(out / "s0_blender.png")
bpy.ops.render.render(write_still=True)
meta = {"key": KEY, "target": it.path, "batch": "083-hb-cikartmalar.md", "number": it.number,
        "model": "blender-procedural", "model_license": "n/a; sınır verisi Natural Earth 1:50m (kamu malı)",
        "blender": ".".join(map(str, bpy.app.version)), "generator": "tools/imagegen/blender_sticker_map.py",
        "seed": 0, "size": [sc.render.resolution_x, sc.render.resolution_y], "prompt": it.prompt,
        "references": [], "background_removed": False, "trim": True}
(out / "s0_blender.json").write_text(json.dumps(meta, ensure_ascii=False, indent=2), encoding="utf-8")
print("ÇIKARTMA", out / "s0_blender.png")
