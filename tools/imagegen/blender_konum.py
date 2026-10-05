"""Konum resimleri (item.konum.*, 030): aynı kedi, aynı kutu; yalnızca kedinin yeri değişir.

Parti kedi ve kutunun her görselde birebir aynı olmasını, sağ/solun resme bakan çocuğa
göre olmasını şart koşuyor. Difüzyon her seferinde başka kedi çizer ve sağ/solu karıştırır.
Burada kedi bir kez klein ile zeminsiz üretilir (arka planı silinmiş PNG), Blender'da
şeffaf panoya konur; kutu, masa ve ev kil olarak modellenir. Kamera her görselde aynıdır,
görseller kırpılmaz (kedi ve kutu her resimde aynı boyutta kalır).

Kullanım (repo kökünden):
    /Applications/Blender.app/Contents/MacOS/Blender -b --factory-startup \\
        -P tools/imagegen/blender_konum.py -- <kedi_cut.png> [--samples 128] [--res 1024] [anahtar ...]
"""

import json
import math
import sys
from pathlib import Path

import bpy
from mathutils import Vector

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
argv = sys.argv[sys.argv.index("--") + 1:]
KITTEN = argv[0]
SAMPLES = int(argv[argv.index("--samples") + 1]) if "--samples" in argv else 128
RES = int(argv[argv.index("--res") + 1]) if "--res" in argv else 1024
ONLY = [a for a in argv[1:] if a.startswith("item.")]

bg_path = HERE / "blender_geometry.py"
bg = {"__file__": str(bg_path), "__name__": "blender_geometry"}
exec(compile(bg_path.read_text(encoding="utf-8").replace("\nmain()\n", "\n"), str(bg_path), "exec"), bg)
sys.path.insert(0, str(HERE))
from batch_parser import parse_batch  # noqa: E402

M, C = bg["clay_material"], bg["srgb"]
BOX = (1.2, 1.0, 0.9)
KITTEN_H = 0.85


def cube(name: str, size: tuple, loc: tuple, color: str, bevel: float = 0.04) -> bpy.types.Object:
    bpy.ops.mesh.primitive_cube_add(size=1.0, location=loc)
    ob = bpy.context.active_object
    ob.name = name
    ob.scale = size
    bpy.ops.object.transform_apply(scale=True)
    bv = ob.modifiers.new("bevel", "BEVEL")
    bv.width = bevel
    bv.segments = 4
    ob.data.materials.append(M(name, C(color)))
    bpy.ops.object.shade_smooth()
    return ob


def box(name: str, x: float, y: float, open_top: bool = False) -> None:
    w, d, h = BOX
    if not open_top:
        cube(name, BOX, (x, y, h / 2), "#C9A06A")
        cube(name + "_bant", (w * 0.18, d + 0.01, 0.02), (x, y, h + 0.005), "#B88D58", bevel=0.005)
        return
    t = 0.06  # açık kutu: dört duvar + taban, kapaksız (içi net görünür)
    cube(name + "_taban", (w, d, t), (x, y, t / 2), "#C9A06A")
    cube(name + "_on", (w, t, h), (x, y - d / 2 + t / 2, h / 2), "#C9A06A")
    cube(name + "_arka", (w, t, h), (x, y + d / 2 - t / 2, h / 2), "#C9A06A")
    cube(name + "_sol", (t, d, h), (x - w / 2 + t / 2, y, h / 2), "#C9A06A")
    cube(name + "_sag", (t, d, h), (x + w / 2 - t / 2, y, h / 2), "#C9A06A")


def table(x: float, y: float) -> None:
    cube("masa_ust", (1.9, 1.1, 0.1), (x, y, 1.15), "#B07A4A")
    for lx in (-0.85, 0.85):
        for ly in (-0.45, 0.45):
            cube(f"masa_ayak{lx}{ly}", (0.1, 0.1, 1.1), (x + lx, y + ly, 0.55), "#9A6B47")


def house(x: float, y: float) -> None:
    cube("ev", (1.4, 1.1, 1.1), (x, y, 0.55), "#F5D37E")
    bg["block"]("ev_cati", "tri", (1.6, 1.25, 0.65), (x, y, 1.42), "#C8584A")
    cube("ev_kapi", (0.34, 0.04, 0.6), (x + 0.25, y - 0.56, 0.3), "#8A5A3C", bevel=0.01)
    cube("ev_pencere", (0.3, 0.04, 0.28), (x - 0.35, y - 0.56, 0.68), "#BFE3F7", bevel=0.01)


def kitten(x: float, y: float, z: float = 0.0, scale: float = 1.0) -> None:
    img = bpy.data.images.load(KITTEN, check_existing=True)
    w, h = img.size
    hh = KITTEN_H * scale
    bpy.ops.mesh.primitive_plane_add(size=1.0, location=(x, y, z + hh / 2))
    ob = bpy.context.active_object
    ob.name = "kedi"
    ob.scale = (hh * w / h, hh, 1.0)
    ob.rotation_euler = (math.radians(90), 0, 0)
    mat = bpy.data.materials.new("kedi_pano")
    mat.use_nodes = True
    n, l = mat.node_tree.nodes, mat.node_tree.links
    for node in list(n):
        if node.type != "OUTPUT_MATERIAL":
            n.remove(node)
    tex = n.new("ShaderNodeTexImage")
    tex.image = img
    emit = n.new("ShaderNodeEmission")
    emit.inputs["Strength"].default_value = 0.95
    transp = n.new("ShaderNodeBsdfTransparent")
    mix = n.new("ShaderNodeMixShader")
    l.new(tex.outputs["Color"], emit.inputs["Color"])
    l.new(tex.outputs["Alpha"], mix.inputs["Fac"])
    l.new(transp.outputs[0], mix.inputs[1])
    l.new(emit.outputs[0], mix.inputs[2])
    l.new(mix.outputs[0], n["Material Output"].inputs["Surface"])
    ob.data.materials.append(mat)


def ground(sx: float = 3.6, sy: float = 2.6, y: float = 0.0) -> None:
    bpy.ops.mesh.primitive_cylinder_add(vertices=96, radius=1.0, depth=0.12, location=(0, y, -0.06))
    g = bpy.context.active_object
    g.name = "zemin"
    g.scale = (sx / 2, sy / 2, 1)
    bpy.ops.object.transform_apply(scale=True)
    bv = g.modifiers.new("bevel", "BEVEL")
    bv.width = 0.05
    bv.segments = 4
    g.data.materials.append(M("zemin", C("#9FD58A")))
    bpy.ops.object.shade_smooth()


SHOTS = {
    "item.konum.ustunde": lambda: (box("kutu", 0, 0), kitten(0, 0, BOX[2])),
    "item.konum.altinda": lambda: (table(0, 0), kitten(0, 0)),
    "item.konum.icinde": lambda: (box("kutu", 0, 0, open_top=True), kitten(0, 0.05, 0.32)),
    "item.konum.disinda": lambda: (box("kutu", -0.45, 0, open_top=True), kitten(0.85, -0.1)),
    "item.konum.onunde": lambda: (box("kutu", 0, 0.35), kitten(0, -0.65)),
    "item.konum.arkasinda": lambda: (box("kutu", 0, -0.2), kitten(0, 0.55, 0.38)),
    "item.konum.saginda": lambda: (box("kutu", -0.45, 0), kitten(0.85, 0)),
    "item.konum.solunda": lambda: (box("kutu", 0.45, 0), kitten(-0.85, 0)),
    "item.konum.arasinda": lambda: (box("kutu1", -1.05, 0), box("kutu2", 1.05, 0), kitten(0, 0)),
    "item.konum.yakinda": lambda: (house(-0.3, 0.2), kitten(0.25, -0.75)),
    "item.konum.uzakta": None,  # ayrı kurulur (uzun yol, perspektif)
}


def camera(target: Vector, offset: Vector, lens: float) -> None:
    sc = bpy.context.scene
    cam_d = bpy.data.cameras.new("cam")
    cam_d.lens = lens
    cam = bpy.data.objects.new("cam", cam_d)
    sc.collection.objects.link(cam)
    sc.camera = cam
    cam.location = target + offset
    cam.rotation_euler = (target - cam.location).to_track_quat("-Z", "Y").to_euler()


def far_scene() -> None:
    # ev solda önde, kedi sağda uzakta; aralarında uzun boş çim yol (perspektifle küçülür)
    sc = bpy.context.scene
    for ob in [o for o in sc.objects if o.type == "LIGHT"]:
        bpy.data.objects.remove(ob, do_unlink=True)  # stüdyo ışıkları büyük zeminde leke yapar
    sc.world.node_tree.nodes["Background"].inputs["Strength"].default_value = 0.75
    sun_d = bpy.data.lights.new("gunes", "SUN")
    sun_d.energy = 3.0
    sun_d.angle = math.radians(8)
    sun = bpy.data.objects.new("gunes", sun_d)
    sc.collection.objects.link(sun)
    sun.rotation_euler = Vector((-0.5, -0.7, 1.0)).to_track_quat("Z", "Y").to_euler()
    bpy.ops.mesh.primitive_cylinder_add(vertices=128, radius=1.0, depth=0.12, location=(0.3, 2.6, -0.06))
    g = bpy.context.active_object
    g.scale = (3.3, 5.0, 1)
    g.data.materials.append(M("cim", C("#9FD58A")))
    bpy.ops.object.shade_smooth()
    bpy.ops.mesh.primitive_plane_add(size=1.0, location=(0.15, 2.3, 0.005))
    lane = bpy.context.active_object
    lane.scale = (0.7, 7.0, 1)
    lane.rotation_euler.z = math.radians(-26)
    lane.data.materials.append(M("yol", C("#E6D3A3")))
    house(-1.9, -1.4)
    kitten(1.75, 5.6, scale=1.8)
    camera(Vector((0.1, 2.3, 0.6)), Vector((0.0, -9.6, 4.2)), 40)


def main() -> None:
    items = {i.key: i for i in parse_batch((REPO / "asset-requests" / "030-g1-matematik-konum-olcu.md").read_text(encoding="utf-8"))}
    for key, build in SHOTS.items():
        if ONLY and key not in ONLY:
            continue
        bg["reset_scene"](SAMPLES)
        sc = bpy.context.scene
        sc.render.resolution_x = sc.render.resolution_y = RES
        sc.view_settings.exposure = -0.5
        if build is None:
            far_scene()
        else:
            ground()
            build()
            camera(Vector((0, 0, 0.62)), Vector((0.0, -6.2, 2.6)), 62)
        out = REPO / "build" / "imagegen" / "030-g1-matematik-konum-olcu" / key
        out.mkdir(parents=True, exist_ok=True)
        sc.render.filepath = str(out / "s0_blender.png")
        bpy.ops.render.render(write_still=True)
        it = items[key]
        meta = {"key": key, "target": it.path, "batch": "030-g1-matematik-konum-olcu.md", "number": it.number,
                "model": "flux2-klein-4b + blender-procedural", "model_license": "Apache-2.0 (kedi) / prosedürel sahne",
                "generator": "tools/imagegen/blender_konum.py", "character_image": str(Path(KITTEN).relative_to(REPO)),
                "blender": ".".join(map(str, bpy.app.version)), "seed": 0, "size": [RES, RES], "prompt": it.prompt,
                "references": [], "background_removed": False, "trim": False}
        (out / "s0_blender.json").write_text(json.dumps(meta, ensure_ascii=False, indent=2), encoding="utf-8")
        print("KONUM", it.number, key, flush=True)


main()
