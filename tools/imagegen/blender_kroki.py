"""Mahalle krokisi (item.kroki.*): aynı mahalle, yalnızca kırmızı yıldızın yeri değişir.

Parti beş görselin birebir aynı çizim olmasını istiyor; difüzyon her seferinde başka
bir mahalle çizer. Burada mahalle bir kez kurulur, yıldız taşınarak beş kez çekilir.
Kâğıt üzerinde kalın pastel boya çizgisi görünümü: krem kâğıt, alçak kil şeritler.

Kullanım (repo kökünden):
    /Applications/Blender.app/Contents/MacOS/Blender -b --factory-startup \\
        -P tools/imagegen/blender_kroki.py -- [--samples 128] [--res 1600]
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
RES = int(argv[argv.index("--res") + 1]) if "--res" in argv else 1600

bg_path = HERE / "blender_geometry.py"
bg = {"__file__": str(bg_path), "__name__": "blender_geometry"}
exec(compile(bg_path.read_text(encoding="utf-8").replace("\nmain()\n", "\n"), str(bg_path), "exec"), bg)
sys.path.insert(0, str(HERE))
from batch_parser import parse_batch  # noqa: E402

M = bg["clay_material"]
C = bg["srgb"]


def box(name: str, size: tuple, loc: tuple, color: str) -> bpy.types.Object:
    """Hafif kil kutu: yalnızca pah. Voksel ağ ince/geniş kutularda milyonlarca köşe üretiyordu."""
    bpy.ops.mesh.primitive_cube_add(size=1.0, location=loc)
    ob = bpy.context.active_object
    ob.name = name
    ob.scale = size
    bpy.ops.object.transform_apply(scale=True)
    bv = ob.modifiers.new("bevel", "BEVEL")
    bv.width = min(size) * 0.3
    bv.segments = 4
    ob.data.materials.append(M(name, C(color)))
    bpy.ops.object.shade_smooth()
    return ob


def strip(name: str, x0: float, y0: float, x1: float, y1: float, w: float, color: str) -> None:
    """Yol: iki nokta arasında alçak, kenarları yumuşak kil şerit."""
    # yalnızca yatay/dikey yollar: kutu doğrudan doğru boyutta kurulur (döndürme yok)
    size = (abs(x1 - x0) + w, w, 0.05) if abs(y1 - y0) < 1e-6 else (w, abs(y1 - y0) + w, 0.05)
    box(name, size, ((x0 + x1) / 2, (y0 + y1) / 2, 0.025), color)


def tree(name: str, x: float, y: float) -> None:
    bpy.ops.mesh.primitive_cylinder_add(vertices=24, radius=0.06, depth=0.22, location=(x, y, 0.11))
    trunk = bpy.context.active_object
    trunk.name = name + "_govde"
    trunk.data.materials.append(M(name + "_kahve", C("#9A6B47")))
    bpy.ops.mesh.primitive_uv_sphere_add(segments=32, ring_count=16, radius=0.2, location=(x, y, 0.32))
    top = bpy.context.active_object
    top.name = name + "_yaprak"
    top.data.materials.append(M(name + "_yesil", C("#6DB55C")))
    bpy.ops.object.shade_smooth()


def star(name: str, x: float, y: float) -> None:
    pts = []
    for k in range(10):
        r = 0.48 if k % 2 == 0 else 0.2
        a = math.pi / 2 + k * math.pi / 5
        pts.append((x + r * math.cos(a), y + r * math.sin(a)))
    me = bpy.data.meshes.new(name)
    me.from_pydata([(px, py, 0.0) for px, py in pts], [], [list(range(10))])
    ob = bpy.data.objects.new(name, me)
    bpy.context.scene.collection.objects.link(ob)
    ob.location.z = 1.15  # binaların ve ağaçların üstünde, her zaman görünür
    sol = ob.modifiers.new("solid", "SOLIDIFY")
    sol.thickness = 0.1
    bv = ob.modifiers.new("bevel", "BEVEL")
    bv.width = 0.03
    bv.segments = 3
    ob.data.materials.append(M(name, C("#E5302B")))


def build_neighbourhood() -> None:
    bg["reset_scene"](SAMPLES)
    sc = bpy.context.scene
    sc.render.film_transparent = False
    sc.view_settings.exposure = -0.4
    # kâğıt
    box("kagit", (13.0, 9.0, 0.06), (0, 0, -0.03), "#F6EEDC")  # çerçevenin tamamını kaplar
    # yollar: bir ana cadde, iki ara sokak
    for i, (a, b) in enumerate([((-4.4, -0.4), (4.4, -0.4)), ((-1.2, -2.5), (-1.2, 2.5)), ((1.9, -2.5), (1.9, 2.5))]):
        strip(f"yol{i}", a[0], a[1], b[0], b[1], 0.5, "#A9A9A9")
    # okul: solda üstte, bayraklı
    box("okul", (1.5, 0.95, 0.55), (-2.9, 1.25, 0.28), "#F2B6A0")
    box("okul_cati", (1.6, 1.05, 0.12), (-2.9, 1.25, 0.6), "#5B8DD6")
    bpy.ops.mesh.primitive_cylinder_add(vertices=16, radius=0.025, depth=0.7, location=(-2.25, 1.25, 0.95))
    bpy.context.active_object.data.materials.append(M("gonder", C("#C9A27A")))
    box("bayrak", (0.32, 0.03, 0.2), (-2.08, 1.25, 1.18), "#E30A17")
    for wx in (-3.4, -2.9, -2.4):
        box(f"okul_pencere{wx}", (0.22, 0.04, 0.18), (wx, 1.25 - 0.48, 0.36), "#BFE3F7")
    box("okul_kapi", (0.24, 0.04, 0.3), (-2.9, 1.25 - 0.48, 0.15), "#8A5A3C")
    box("firin_vitrin", (0.6, 0.04, 0.22), (3.1, -1.65 - 0.43, 0.3), "#BFE3F7")
    # park: ortada üstte, ağaçlar ve bank
    box("park", (2.1, 1.7, 0.04), (0.35, 1.25, 0.02), "#9FD58A")
    for j, (tx, ty) in enumerate([(-0.3, 1.7), (0.35, 1.85), (1.0, 1.6), (-0.15, 0.75), (0.95, 0.8)]):
        tree(f"agac{j}", tx, ty)
    box("bank", (0.5, 0.15, 0.12), (0.4, 1.15, 0.08), "#B07A4A")
    # fırın: sağda altta
    box("firin", (1.2, 0.85, 0.5), (3.1, -1.65, 0.25), "#F5D37E")
    box("firin_cati", (1.3, 0.95, 0.1), (3.1, -1.65, 0.55), "#E58B3A")
    bpy.ops.mesh.primitive_cylinder_add(vertices=32, radius=0.09, depth=0.3, location=(3.1, -2.1, 0.3), rotation=(0, math.radians(90), 0))
    bpy.context.active_object.data.materials.append(M("ekmek", C("#D9954A")))
    bpy.ops.object.shade_smooth()
    # birkaç ev
    for k, (hx, hy, col) in enumerate([(-2.9, -1.6, "#B9D7F0"), (0.35, -1.65, "#D7C2EE"), (3.15, 1.3, "#F5C6D6")]):
        box(f"ev{k}", (0.9, 0.7, 0.45), (hx, hy, 0.22), col)
        box(f"ev{k}_cati", (1.0, 0.8, 0.1), (hx, hy, 0.5), "#C8584A")
    # yumuşak ortam + güneş
    for ob in [o for o in sc.objects if o.type == "LIGHT"]:
        bpy.data.objects.remove(ob, do_unlink=True)
    sc.world.node_tree.nodes["Background"].inputs["Strength"].default_value = 0.8
    sun_d = bpy.data.lights.new("gunes", "SUN")
    sun_d.energy = 2.6
    sun_d.angle = math.radians(10)
    sun = bpy.data.objects.new("gunes", sun_d)
    sc.collection.objects.link(sun)
    sun.rotation_euler = Vector((-0.4, -0.7, 1.0)).to_track_quat("Z", "Y").to_euler()


STAR_AT = {"park": (0.35, 1.25), "okul": (-2.9, 1.25), "firin": (3.1, -1.65)}
SHOTS = {
    "item.kroki.park": ("park", "16:9"), "item.kroki.okul": ("okul", "16:9"),
    "item.kroki.firin_k": ("firin", "1:1"), "item.kroki.park_k": ("park", "1:1"), "item.kroki.okul_k": ("okul", "1:1"),
}


def shoot(key: str, where: str, ratio: str, items: dict) -> None:
    sc = bpy.context.scene
    for ob in [o for o in sc.objects if o.name.startswith("yildiz") or o.name == "cam"]:
        bpy.data.objects.remove(ob, do_unlink=True)
    sx, sy = STAR_AT[where]
    star("yildiz", sx, sy)
    cam_d = bpy.data.cameras.new("cam")
    cam_d.type = "ORTHO"
    cam = bpy.data.objects.new("cam", cam_d)
    sc.collection.objects.link(cam)
    sc.camera = cam
    d = Vector((0.0, -0.8, 1.0)).normalized()  # cepheler görünsün: yalnız çatılar birbirine benziyordu
    if ratio == "16:9":
        sc.render.resolution_x, sc.render.resolution_y = RES, round(RES * 9 / 16)
        cam_d.ortho_scale = 9.9
        target = Vector((0, 0.05, 0))
    else:
        sc.render.resolution_x = sc.render.resolution_y = round(RES * 0.64)
        cam_d.ortho_scale = 5.8  # kart: mahallenin yıldızlı bölgesi + çevresi
        target = Vector((max(-1.9, min(1.9, sx)), max(-0.9, min(0.9, sy)), 0))
    cam.location = target + d * 20
    cam.rotation_euler = (-d).to_track_quat("-Z", "Y").to_euler()
    it = items[key]
    out = REPO / "build" / "imagegen" / "082-hb-g3-gorseller" / key
    out.mkdir(parents=True, exist_ok=True)
    sc.render.filepath = str(out / "s0_blender.png")
    bpy.ops.render.render(write_still=True)
    meta = {"key": key, "target": it.path, "batch": "082-hb-g3-gorseller.md", "number": it.number,
            "model": "blender-procedural", "model_license": "n/a (prosedürel, CC BY 4.0 içerik)",
            "blender": ".".join(map(str, bpy.app.version)), "generator": "tools/imagegen/blender_kroki.py",
            "star": where, "seed": 0, "size": [sc.render.resolution_x, sc.render.resolution_y],
            "prompt": it.prompt, "references": [], "background_removed": False, "trim": False}
    (out / "s0_blender.json").write_text(json.dumps(meta, ensure_ascii=False, indent=2), encoding="utf-8")
    print("KROKİ", it.number, key, flush=True)


items = {i.key: i for i in parse_batch((REPO / "asset-requests" / "082-hb-g3-gorseller.md").read_text(encoding="utf-8"))}
build_neighbourhood()
for key, (where, ratio) in SHOTS.items():
    shoot(key, where, ratio, items)
