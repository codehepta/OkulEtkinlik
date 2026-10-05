"""Geometrik öğeleri (item.sekil.*, item.cisim.*, item.blok.*) Blender'da kil görünümüyle üretir.

Difüzyon modelleri kenar sayısı, eşit kenar ve birim sayısı gibi kesinlik isteyen şekilleri
yanlış çizer; bu öğeler burada prosedürel olarak modellenir.

Kullanım (repo kökünden):
    /Applications/Blender.app/Contents/MacOS/Blender -b --factory-startup \\
        -P tools/imagegen/blender_geometry.py -- [anahtar ...] [--samples 128] [--pause 20] [--res 1024]

Çıktı, generate.py ile aynı düzendedir: build/imagegen/<parti>/<anahtar>/s0_blender.png + .json.
Seçim sonrası: approve.py <parti> <no>=0:blender

Ölçek: her aile (düz şekil, cisim, blok) sabit kamera ölçeğiyle çekilir ve görseller
kırpılmaz ("trim": false). Böylece "küçük kare" küçük, "büyük kare" büyük kalır ve
onluk/yüzlük bloklarında birim küp aynı boyuttadır. Tek istisna birlik küpüdür: ortak
ölçekte okunamayacak kadar küçük kaldığı için kendi yakın kamerasıyla çekilir.
"""

import json
import math
import sys
import time
from pathlib import Path

import bmesh
import bpy
from mathutils import Vector

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
sys.path.insert(0, str(HERE))
from batch_parser import parse_batch  # noqa: E402

RES = 1024
BLENDER_VERSION = ".".join(str(v) for v in bpy.app.version)


def srgb(hex_str: str) -> tuple:
    h = hex_str.lstrip("#")
    c = [int(h[i:i + 2], 16) / 255.0 for i in (0, 2, 4)]
    lin = [(v / 12.92) if v <= 0.04045 else ((v + 0.055) / 1.055) ** 2.4 for v in c]
    return (lin[0], lin[1], lin[2], 1.0)


# ---------- sahne ----------
def reset_scene(samples: int) -> None:
    bpy.ops.wm.read_factory_settings(use_empty=True)
    sc = bpy.context.scene
    sc.render.engine = "CYCLES"
    prefs = bpy.context.preferences.addons["cycles"].preferences
    prefs.compute_device_type = "METAL"
    prefs.get_devices()
    for d in prefs.devices:
        d.use = True
    sc.cycles.device = "GPU"
    sc.cycles.samples = samples
    sc.cycles.use_denoising = True
    sc.render.resolution_x = RES
    sc.render.resolution_y = RES
    sc.render.film_transparent = True
    sc.render.image_settings.file_format = "PNG"
    sc.render.image_settings.color_mode = "RGBA"
    sc.view_settings.view_transform = "Standard"
    sc.view_settings.look = "None"
    sc.view_settings.exposure = -0.3
    world = bpy.data.worlds.new("World")
    sc.world = world
    world.use_nodes = True
    bg = world.node_tree.nodes["Background"]
    bg.inputs["Color"].default_value = srgb("#E9E6F0")
    bg.inputs["Strength"].default_value = 0.22
    add_area("key", (-2.6, -1.8, 5.6), 3.0, 1000, srgb("#FFEBD2"))
    add_area("fill", (4.2, -3.0, 1.2), 4.0, 120, srgb("#DCE6FF"))
    add_area("rim", (2.0, 4.2, 3.2), 2.0, 380, srgb("#FFFFFF"))


def add_area(name: str, loc: tuple, size: float, power: float, color: tuple) -> None:
    light = bpy.data.lights.new(name, "AREA")
    light.size = size
    light.energy = power
    light.color = color[:3]
    ob = bpy.data.objects.new(name, light)
    bpy.context.scene.collection.objects.link(ob)
    ob.location = loc
    ob.rotation_euler = (Vector((0, 0, 0)) - Vector(loc)).to_track_quat("-Z", "Y").to_euler()


# ---------- kil malzemesi ----------
def clay_material(name: str, color: tuple) -> bpy.types.Material:
    mat = bpy.data.materials.new(name)
    mat.use_nodes = True
    nt = mat.node_tree
    n, l = nt.nodes, nt.links
    bsdf = n["Principled BSDF"]
    bsdf.inputs["Base Color"].default_value = color
    bsdf.inputs["Roughness"].default_value = 0.5
    bsdf.inputs["Specular IOR Level"].default_value = 0.35
    bsdf.inputs["Subsurface Weight"].default_value = 0.06
    bsdf.inputs["Subsurface Radius"].default_value = (1.0, 0.45, 0.3)
    bsdf.inputs["Subsurface Scale"].default_value = 0.04
    coord = n.new("ShaderNodeTexCoord")
    # parmak izi halkaları, yalnızca düşük frekanslı bir maskenin açtığı yerlerde
    wave = n.new("ShaderNodeTexWave")
    wave.wave_type = "RINGS"
    wave.rings_direction = "SPHERICAL"
    wave.inputs["Scale"].default_value = 9.0
    wave.inputs["Distortion"].default_value = 6.0
    wave.inputs["Detail"].default_value = 2.0
    l.new(coord.outputs["Object"], wave.inputs["Vector"])
    mask = n.new("ShaderNodeTexNoise")
    mask.inputs["Scale"].default_value = 1.6
    l.new(coord.outputs["Object"], mask.inputs["Vector"])
    ramp = n.new("ShaderNodeMapRange")
    ramp.inputs["From Min"].default_value = 0.52
    ramp.inputs["From Max"].default_value = 0.66
    ramp.inputs["To Max"].default_value = 0.12
    l.new(mask.outputs["Fac"], ramp.inputs["Value"])
    grain = n.new("ShaderNodeTexNoise")
    grain.inputs["Scale"].default_value = 60.0
    grain.inputs["Detail"].default_value = 4.0
    l.new(coord.outputs["Object"], grain.inputs["Vector"])
    gscale = n.new("ShaderNodeMath")
    gscale.operation = "MULTIPLY"
    l.new(grain.outputs["Fac"], gscale.inputs[0])
    gscale.inputs[1].default_value = 0.1
    dents = n.new("ShaderNodeTexVoronoi")
    dents.feature = "SMOOTH_F1"
    dents.inputs["Scale"].default_value = 4.0
    l.new(coord.outputs["Object"], dents.inputs["Vector"])
    mix1 = n.new("ShaderNodeMath")
    mix1.operation = "MULTIPLY_ADD"
    l.new(wave.outputs["Fac"], mix1.inputs[0])
    l.new(ramp.outputs["Result"], mix1.inputs[1])
    l.new(gscale.outputs[0], mix1.inputs[2])
    mix2 = n.new("ShaderNodeMath")
    mix2.operation = "MULTIPLY_ADD"
    l.new(dents.outputs["Distance"], mix2.inputs[0])
    mix2.inputs[1].default_value = 0.8
    l.new(mix1.outputs[0], mix2.inputs[2])
    bump = n.new("ShaderNodeBump")
    bump.inputs["Strength"].default_value = 0.22
    bump.inputs["Distance"].default_value = 0.02
    l.new(mix2.outputs[0], bump.inputs["Height"])
    l.new(bump.outputs["Normal"], bsdf.inputs["Normal"])
    return mat


# ---------- geometri yardımcıları ----------
def link(ob: bpy.types.Object) -> bpy.types.Object:
    bpy.context.scene.collection.objects.link(ob)
    return ob


def soften(ob: bpy.types.Object, bevel: float, voxel: float, lump: float, angle_limit: bool = False) -> None:
    """Pah kır, voksel ağla yoğunlaştır, el yapımı hafif yamukluk ekle."""
    bv = ob.modifiers.new("bevel", "BEVEL")
    bv.width = bevel
    bv.segments = 5
    bv.limit_method = "ANGLE" if angle_limit else "NONE"
    rm = ob.modifiers.new("remesh", "REMESH")
    rm.mode = "VOXEL"
    rm.voxel_size = voxel
    rm.use_smooth_shade = True
    tex = bpy.data.textures.new(ob.name + "_lump", "CLOUDS")
    tex.noise_scale = 0.55
    dp = ob.modifiers.new("lump", "DISPLACE")
    dp.texture = tex
    dp.texture_coords = "OBJECT"
    dp.strength = lump
    sm = ob.modifiers.new("smooth", "CORRECTIVE_SMOOTH")
    sm.iterations = 4


def regular(n: int, r: float, rot_deg: float = 90.0) -> list[tuple[float, float]]:
    return [(r * math.cos(math.radians(rot_deg + 360 * i / n)), r * math.sin(math.radians(rot_deg + 360 * i / n)))
            for i in range(n)]


def rect(w: float, h: float) -> list[tuple[float, float]]:
    return [(-w / 2, -h / 2), (w / 2, -h / 2), (w / 2, h / 2), (-w / 2, h / 2)]


def rotated(pts: list[tuple[float, float]], deg: float) -> list[tuple[float, float]]:
    c, s = math.cos(math.radians(deg)), math.sin(math.radians(deg))
    return [(x * c - y * s, x * s + y * c) for x, y in pts]


def centered(pts: list[tuple[float, float]]) -> list[tuple[float, float]]:
    xs, ys = [p[0] for p in pts], [p[1] for p in pts]
    cx, cy = (min(xs) + max(xs)) / 2, (min(ys) + max(ys)) / 2
    return [(x - cx, y - cy) for x, y in pts]


FLAT_THICKNESS = 0.24


def flat_tile(name: str, pts: list[tuple[float, float]], mat: bpy.types.Material) -> None:
    pts = centered(pts)
    me = bpy.data.meshes.new(name)
    me.from_pydata([(x, y, 0.0) for x, y in pts], [], [list(range(len(pts)))])
    ob = link(bpy.data.objects.new(name, me))
    sol = ob.modifiers.new("solid", "SOLIDIFY")
    sol.thickness = FLAT_THICKNESS
    sol.offset = 0.0
    ob.data.materials.append(mat)
    soften(ob, bevel=0.035, voxel=0.008, lump=0.012)


def flat_ring(name: str, outer: float, inner: float, mat: bpy.types.Material) -> None:
    bm = bmesh.new()
    seg = 96
    o = [bm.verts.new((outer * math.cos(2 * math.pi * i / seg), outer * math.sin(2 * math.pi * i / seg), 0)) for i in range(seg)]
    n = [bm.verts.new((inner * math.cos(2 * math.pi * i / seg), inner * math.sin(2 * math.pi * i / seg), 0)) for i in range(seg)]
    for i in range(seg):
        j = (i + 1) % seg
        bm.faces.new((o[i], o[j], n[j], n[i]))
    me = bpy.data.meshes.new(name)
    bm.to_mesh(me)
    ob = link(bpy.data.objects.new(name, me))
    sol = ob.modifiers.new("solid", "SOLIDIFY")
    sol.thickness = FLAT_THICKNESS
    sol.offset = 0.0
    ob.data.materials.append(mat)
    soften(ob, bevel=0.035, voxel=0.008, lump=0.012)


def box(name: str, sx: float, sy: float, sz: float, mat: bpy.types.Material, rot_z: float = -28) -> None:
    bm = bmesh.new()
    bmesh.ops.create_cube(bm, size=1.0)
    bmesh.ops.scale(bm, vec=(sx, sy, sz), verts=bm.verts)
    me = bpy.data.meshes.new(name)
    bm.to_mesh(me)
    ob = link(bpy.data.objects.new(name, me))
    ob.rotation_euler.z = math.radians(rot_z)
    ob.data.materials.append(mat)
    soften(ob, bevel=min(sx, sy, sz) * 0.09, voxel=min(0.011, min(sx, sy, sz) / 40), lump=min(0.03, min(sx, sy, sz) * 0.025))


def prism(name: str, mat: bpy.types.Material) -> None:
    s, L = 1.3, 1.7
    h = s * math.sqrt(3) / 2
    v = []
    for y in (-L / 2, L / 2):
        v += [(-s / 2, y, -h / 2), (s / 2, y, -h / 2), (0.0, y, h / 2)]
    f = [(0, 2, 1), (3, 4, 5), (0, 1, 4, 3), (1, 2, 5, 4), (2, 0, 3, 5)]
    me = bpy.data.meshes.new(name)
    me.from_pydata(v, [], f)
    ob = link(bpy.data.objects.new(name, me))
    ob.rotation_euler.z = math.radians(65)
    ob.data.materials.append(mat)
    soften(ob, bevel=0.09, voxel=0.011, lump=0.03)


def cylinder(name: str, mat: bpy.types.Material, lying: bool = False) -> None:
    bm = bmesh.new()
    bmesh.ops.create_cone(bm, cap_ends=True, segments=96, radius1=0.62, radius2=0.62, depth=1.45)
    me = bpy.data.meshes.new(name)
    bm.to_mesh(me)
    ob = link(bpy.data.objects.new(name, me))
    if lying:
        ob.rotation_euler.y = math.radians(90)
    ob.data.materials.append(mat)
    soften(ob, bevel=0.11, voxel=0.011, lump=0.03, angle_limit=True)


def sphere(name: str, mat: bpy.types.Material) -> None:
    bpy.ops.mesh.primitive_uv_sphere_add(segments=96, ring_count=48, radius=0.85)
    ob = bpy.context.active_object
    ob.name = name
    ob.data.materials.append(mat)
    bpy.ops.object.shade_smooth()
    tex = bpy.data.textures.new(name + "_lump", "CLOUDS")
    tex.noise_scale = 0.55
    dp = ob.modifiers.new("lump", "DISPLACE")
    dp.texture = tex
    dp.strength = 0.03


UNIT = 0.22  # taban-onluk birim küpü: birlik, onluk ve yüzlükte aynı boyut


def unit_blocks(name: str, nx: int, ny: int, mat: bpy.types.Material, rot_z: float = -42) -> None:
    parts = []
    for i in range(nx):
        for j in range(ny):
            bm = bmesh.new()
            bmesh.ops.create_cube(bm, size=UNIT * 0.985)
            me = bpy.data.meshes.new(f"{name}_{i}_{j}")
            bm.to_mesh(me)
            ob = link(bpy.data.objects.new(me.name, me))
            ob.location = ((i - (nx - 1) / 2) * UNIT, (j - (ny - 1) / 2) * UNIT, 0)
            bv = ob.modifiers.new("bevel", "BEVEL")
            bv.width = UNIT * 0.14
            bv.segments = 4
            parts.append(ob)
    bpy.ops.object.select_all(action="DESELECT")
    for p in parts:
        bpy.context.view_layer.objects.active = p
        bpy.ops.object.modifier_apply(modifier="bevel")
        p.select_set(True)
    bpy.context.view_layer.objects.active = parts[0]
    bpy.ops.object.join()
    ob = bpy.context.view_layer.objects.active
    ob.name = name
    ob.rotation_euler.z = math.radians(rot_z)
    ob.data.materials.append(mat)
    rm = ob.modifiers.new("remesh", "REMESH")
    rm.mode = "VOXEL"
    rm.voxel_size = UNIT / 50
    rm.use_smooth_shade = True
    tex = bpy.data.textures.new(name + "_lump", "CLOUDS")
    tex.noise_scale = 0.4
    dp = ob.modifiers.new("lump", "DISPLACE")
    dp.texture = tex
    dp.strength = UNIT * 0.04
    sm = ob.modifiers.new("smooth", "CORRECTIVE_SMOOTH")
    sm.iterations = 3


# ---------- öğe tanımları: (aile, kurucu, renk) ----------
def F(pts: list) -> callable:
    return lambda name, mat: flat_tile(name, pts, mat)


EQ = lambda side: [(-side / 2, -side * math.sqrt(3) / 4), (side / 2, -side * math.sqrt(3) / 4), (0, side * math.sqrt(3) / 4)]  # noqa: E731

ITEMS: dict[str, tuple[str, callable, str]] = {
    # 031 · 1. sınıf şekil çeşitleri
    "item.sekil.ucgen_2": ("flat", F([(-1.1, 0.55), (1.1, 0.55), (0, -0.75)]), "#F8D45C"),
    "item.sekil.ucgen_3": ("flat", F([(-0.5, -0.45), (0.55, -0.45), (-0.5, 0.55)]), "#A88BE0"),
    "item.sekil.kare_2": ("flat", F(rect(1.0, 1.0)), "#F5A04A"),
    "item.sekil.kare_3": ("flat", F(rect(2.0, 2.0)), "#8FD9B6"),
    "item.sekil.dikdortgen_2": ("flat", F(rect(0.9, 1.8)), "#F4A6C4"),
    "item.sekil.dikdortgen_3": ("flat", F(rect(2.4, 0.8)), "#74A9E8"),
    "item.sekil.cember": ("flat", lambda n, m: flat_ring(n, 1.0, 0.66, m), "#F5A04A"),
    "item.sekil.cember_2": ("flat", lambda n, m: flat_ring(n, 0.55, 0.36, m), "#A88BE0"),
    # 040 · 2. sınıf şekiller
    "item.sekil.ucgen": ("flat", F(EQ(2.0)), "#F2846F"),
    "item.sekil.ucgen_ters": ("flat", F(rotated(EQ(2.0), 180)), "#F2846F"),
    "item.sekil.ucgen_kucuk": ("flat", F(rotated(EQ(0.6), -90)), "#F2846F"),
    "item.sekil.kare": ("flat", F(rect(1.6, 1.6)), "#8EC5F0"),
    "item.sekil.kare_egik": ("flat", F(rotated(rect(1.6, 1.6), 45)), "#8EC5F0"),
    "item.sekil.kare_kucuk": ("flat", F(rect(0.55, 0.55)), "#8EC5F0"),
    "item.sekil.dikdortgen": ("flat", F(rect(2.2, 1.1)), "#A3E3C4"),
    "item.sekil.dikdortgen_dik": ("flat", F(rect(1.1, 2.2)), "#A3E3C4"),
    "item.sekil.daire": ("flat", F(regular(128, 0.9)), "#F8DC72"),
    "item.sekil.daire_kucuk": ("flat", F(regular(96, 0.3)), "#F8DC72"),
    # 050 · 3. sınıf şekiller
    "item.sekil.ucgen_dik": ("flat", F([(-0.9, -0.8), (0.9, -0.8), (-0.9, 0.9)]), "#4FB9AF"),
    "item.sekil.ucgen_genis": ("flat", F([(-1.2, -0.4), (1.2, -0.4), (-0.5, 0.45)]), "#C4A8E8"),
    "item.sekil.yamuk": ("flat", F([(-1.1, -0.6), (1.1, -0.6), (0.6, 0.6), (-0.6, 0.6)]), "#F7B98F"),
    "item.sekil.besgen": ("flat", F(regular(5, 1.0)), "#84C2EE"),
    "item.sekil.besgen_ev": ("flat", F([(-0.75, -0.8), (0.75, -0.8), (0.75, 0.25), (0, 1.0), (-0.75, 0.25)]), "#F3A0BE"),
    "item.sekil.altigen": ("flat", F(regular(6, 1.0)), "#EDA02A"),
    "item.sekil.altigen_uzun": ("flat", F([(-1.25, 0), (-0.75, 0.55), (0.75, 0.55), (1.25, 0), (0.75, -0.55), (-0.75, -0.55)]), "#F38A75"),
    "item.sekil.sekizgen": ("flat", F(regular(8, 1.0, 22.5)), "#E5534B"),
    # 040 · cisimler
    "item.cisim.kup": ("solid", lambda n, m: box(n, 1.4, 1.4, 1.4, m), "#9CC3EE"),
    "item.cisim.kare_prizma": ("solid", lambda n, m: box(n, 1.0, 1.0, 1.9, m), "#A8DDB5"),
    "item.cisim.dikdortgen_prizma": ("solid", lambda n, m: box(n, 2.2, 1.0, 0.9, m), "#F7B57A"),
    "item.cisim.ucgen_prizma": ("solid", prism, "#B79FE8"),
    "item.cisim.kure": ("solid", sphere, "#F5B3C8"),
    "item.cisim.silindir": ("solid", cylinder, "#F8DA74"),
    "item.cisim.silindir_yatik": ("solid", lambda n, m: cylinder(n, m, lying=True), "#F8DA74"),
    "item.cisim.kup_kucuk": ("solid", lambda n, m: box(n, 0.45, 0.45, 0.45, m), "#9CC3EE"),
    # 050 · taban-onluk blokları
    # birlik ortak ölçekte birkaç piksele düşer; kendi yakın kamerasıyla çekilir
    "item.blok.birlik": ("block_unit", lambda n, m: unit_blocks(n, 1, 1, m, rot_z=-28), "#F7CF4A"),
    "item.blok.onluk": ("block", lambda n, m: unit_blocks(n, 10, 1, m), "#F6973F"),
    "item.blok.yuzluk": ("block", lambda n, m: unit_blocks(n, 10, 10, m, rot_z=-20), "#9FD0F2"),
}

# Aile kameraları: sabit yön ve ölçek (görseller arası boyut karşılaştırılabilir kalır)
CAMERAS = {
    # düz şekillerin üst yüzü doğrudan ana ışığa bakar; renk solmasın diye daha düşük pozlama
    "flat": {"view": (0.0, -0.6, 1.0), "ortho": 3.0, "exposure": -1.1},
    "solid": {"view": (0.9, -1.6, 0.85), "lens": 85, "distance": 7.2},
    "block": {"view": (0.25, -1.2, 1.35), "lens": 85, "distance": 8.6},
    "block_unit": {"view": (0.9, -1.6, 0.85), "lens": 85, "distance": 1.9},
}


def place_camera(family: str) -> None:
    spec = CAMERAS[family]
    cam_data = bpy.data.cameras.new("cam")
    cam = link(bpy.data.objects.new("cam", cam_data))
    bpy.context.scene.camera = cam
    d = Vector(spec["view"]).normalized()
    if "ortho" in spec:
        cam_data.type = "ORTHO"
        cam_data.ortho_scale = spec["ortho"]
        cam.location = d * 10
    else:
        cam_data.lens = spec["lens"]
        cam.location = d * spec["distance"]
    cam.rotation_euler = (-d).to_track_quat("-Z", "Y").to_euler()
    if "exposure" in spec:
        bpy.context.scene.view_settings.exposure = spec["exposure"]


def center_scene_objects() -> None:
    """Nesneleri sınır kutusu merkezi orijine gelecek şekilde taşır (ölçek değişmez)."""
    bpy.context.view_layer.update()
    dg = bpy.context.evaluated_depsgraph_get()
    pts = []
    meshes = [o for o in bpy.context.scene.objects if o.type == "MESH"]
    for ob in meshes:
        ev = ob.evaluated_get(dg)
        pts += [ev.matrix_world @ Vector(c) for c in ev.bound_box]
    lo = Vector((min(p.x for p in pts), min(p.y for p in pts), min(p.z for p in pts)))
    hi = Vector((max(p.x for p in pts), max(p.y for p in pts), max(p.z for p in pts)))
    mid = (lo + hi) / 2
    for ob in meshes:
        ob.location -= mid


def batch_index() -> dict[str, tuple[str, int, str, str]]:
    """anahtar → (parti dosyası adı, öğe no, hedef yol, prompt)"""
    index: dict[str, tuple[str, int, str, str]] = {}
    for f in sorted((REPO / "asset-requests").glob("[0-9]*.md")):
        for it in parse_batch(f.read_text(encoding="utf-8")):
            if it.key in ITEMS and it.key not in index:
                index[it.key] = (f.stem, it.number, it.path, it.prompt)
    return index


def main() -> None:
    argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
    global RES
    samples, pause, keys = 128, 0.0, []
    it = iter(argv)
    for a in it:
        if a == "--samples":
            samples = int(next(it))
        elif a == "--pause":
            pause = float(next(it))
        elif a == "--res":
            RES = int(next(it))
        else:
            keys.append(a)
    index = batch_index()
    keys = keys or [k for k in ITEMS if k in index and not (REPO / index[k][2]).exists()]
    for k in keys:
        family, build, color = ITEMS[k]
        batch_stem, number, target, prompt = index[k]
        t = time.time()
        reset_scene(samples)
        build(k.split(".")[-1], clay_material(k, srgb(color)))
        center_scene_objects()
        place_camera(family)
        out = REPO / "build" / "imagegen" / batch_stem / k
        out.mkdir(parents=True, exist_ok=True)
        png = out / "s0_blender.png"
        bpy.context.scene.render.filepath = str(png)
        bpy.ops.render.render(write_still=True)
        meta = {
            "key": k, "target": target, "batch": batch_stem + ".md", "number": number,
            "model": "blender-procedural", "model_license": "n/a (prosedürel, CC BY 4.0 içerik)",
            "blender": BLENDER_VERSION, "generator": "tools/imagegen/blender_geometry.py",
            "family": family, "color": color, "samples": samples, "seed": 0, "size": [RES, RES],
            "prompt": prompt, "references": [], "background_removed": False, "trim": False,
        }
        (out / "s0_blender.json").write_text(json.dumps(meta, ensure_ascii=False, indent=2), encoding="utf-8")
        print(f"BLENDER {number:>2} {k}: {time.time() - t:.0f} sn", flush=True)
        if pause:
            time.sleep(pause)


main()
