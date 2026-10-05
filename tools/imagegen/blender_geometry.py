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


# ---------- bileşik öğeler: zar, bloklardan yapılar, kâğıt kesme modeller ----------
def rotate_all_z(deg: float) -> None:
    """Sahnedeki bütün nesneleri orijin etrafında birlikte döndürür (ebeveyn kullanmadan)."""
    from mathutils import Matrix
    rot = Matrix.Rotation(math.radians(deg), 4, "Z")
    for ob in [o for o in bpy.context.scene.objects if o.type == "MESH"]:
        ob.location = rot @ ob.location
        ob.rotation_euler.z += math.radians(deg)


def block(name: str, kind: str, dims: tuple, loc: tuple, color: str, axis: str = "Z") -> None:
    """Tek bir kil blok: box (x,y,z), cyl (yarıçap, uzunluk), tri (genişlik, derinlik, yükseklik)."""
    mat = clay_material(name, srgb(color))
    if kind == "box":
        bm = bmesh.new()
        bmesh.ops.create_cube(bm, size=1.0)
        bmesh.ops.scale(bm, vec=dims, verts=bm.verts)
        smallest = min(dims)
    elif kind == "cyl":
        bm = bmesh.new()
        bmesh.ops.create_cone(bm, cap_ends=True, segments=64, radius1=dims[0], radius2=dims[0], depth=dims[1])
        smallest = min(dims[0] * 2, dims[1])
    else:  # tri: üçgen prizma, üçgen yüzler ±Y'de
        w, dep, h = dims
        bm = bmesh.new()
        vs = [bm.verts.new(v) for v in [(-w / 2, -dep / 2, -h / 2), (w / 2, -dep / 2, -h / 2), (0, -dep / 2, h / 2),
                                        (-w / 2, dep / 2, -h / 2), (w / 2, dep / 2, -h / 2), (0, dep / 2, h / 2)]]
        for f in [(0, 2, 1), (3, 4, 5), (0, 1, 4, 3), (1, 2, 5, 4), (2, 0, 3, 5)]:
            bm.faces.new([vs[i] for i in f])
        smallest = min(w, dep, h)
    me = bpy.data.meshes.new(name)
    bm.to_mesh(me)
    ob = link(bpy.data.objects.new(name, me))
    ob.location = loc
    if axis == "X":
        ob.rotation_euler.y = math.radians(90)
    elif axis == "Y":
        ob.rotation_euler.x = math.radians(90)
    ob.data.materials.append(mat)
    soften(ob, bevel=smallest * 0.08, voxel=min(0.011, smallest / 30), lump=min(0.02, smallest * 0.02),
           angle_limit=(kind == "cyl"))


def dice(name: str, _mat: bpy.types.Material) -> None:
    """Görünen yüzlerde doğru nokta dizilimi: üstte 1, önde 2, sağda 3 (karşı yüzler toplamı 7)."""
    e = 1.3
    block(name, "box", (e, e, e), (0, 0, 0), "#F7F4EE")
    pip_mat = clay_material(name + "_nokta", srgb("#E5534B"))
    d = e * 0.27
    faces = {
        (0, 0, 1): [(0, 0)],
        (0, -1, 0): [(-d, d), (d, -d)],
        (1, 0, 0): [(-d, d), (0, 0), (d, -d)],
    }
    for normal, pips in faces.items():
        n = Vector(normal)
        # yüz düzleminde iki eksen
        u = Vector((1, 0, 0)) if abs(n.x) < 0.5 else Vector((0, 1, 0))
        v = n.cross(u)
        for a, b in pips:
            bpy.ops.mesh.primitive_uv_sphere_add(segments=32, ring_count=16, radius=e * 0.085)
            pip = bpy.context.active_object
            pip.scale = (1, 1, 0.45)
            pip.rotation_euler = n.to_track_quat("Z", "Y").to_euler()
            pip.location = n * (e / 2 + 0.005) + u * a + v * b
            pip.data.materials.append(pip_mat)
            bpy.ops.object.shade_smooth()
    rotate_all_z(-28)


def toy_castle(name: str, _mat: bpy.types.Material) -> None:
    for x, c in ((-1.0, "#9FD0F2"), (1.0, "#F5B3C8")):
        block(f"{name}_kule{x}", "cyl", (0.3, 1.5), (x, 0, 0.75), c)
    colors = ["#F8DA74", "#A8DDB5", "#F7B57A", "#B79FE8", "#F8DA74", "#A8DDB5"]
    k = 0
    for row in range(2):
        for i in range(3):
            block(f"{name}_duvar{k}", "box", (0.46, 0.46, 0.46), ((i - 1) * 0.48, 0, 0.23 + row * 0.48), colors[k])
            k += 1
    rotate_all_z(-18)


def toy_robot(name: str, _mat: bpy.types.Material) -> None:
    block(f"{name}_bas", "box", (0.55, 0.55, 0.55), (0, 0, 1.95), "#F8DA74")
    block(f"{name}_govde", "box", (0.75, 0.45, 0.95), (0, 0, 1.15), "#9FD0F2")
    for x in (-0.52, 0.52):
        block(f"{name}_kol{x}", "cyl", (0.12, 0.8), (x, 0, 1.2), "#F5B3C8")
    for x in (-0.2, 0.2):
        block(f"{name}_bacak{x}", "cyl", (0.14, 0.65), (x, 0, 0.33), "#A8DDB5")
    rotate_all_z(60)  # ön yüz kameraya dönük: iki kol da görünür (deneyerek bulundu)


def toy_train(name: str, _mat: bpy.types.Material) -> None:
    block(f"{name}_lokomotif", "box", (0.9, 0.6, 0.45), (0.55, 0, 0.42), "#F5B3C8")
    block(f"{name}_kazan", "cyl", (0.24, 0.62), (0.7, 0, 0.88), "#9FD0F2", axis="X")
    block(f"{name}_kabin", "box", (0.38, 0.6, 0.5), (0.25, 0, 0.9), "#F8DA74")
    block(f"{name}_vagon", "box", (0.95, 0.6, 0.55), (-0.6, 0, 0.47), "#A8DDB5")
    for x in (0.25, 0.85, -0.9, -0.3):
        for y in (-0.33, 0.33):
            block(f"{name}_teker{x}{y}", "cyl", (0.17, 0.1), (x, y, 0.2), "#B79FE8", axis="Y")
    rotate_all_z(-22)


def toy_block_house(name: str, _mat: bpy.types.Material) -> None:
    block(f"{name}_kup", "box", (1.1, 1.1, 1.1), (0, 0, 0.55), "#F8DA74")
    block(f"{name}_cati", "tri", (1.3, 1.2, 0.7), (0, 0, 1.45), "#F2846F")
    rotate_all_z(-30)


def paper_model(name: str, parts: list) -> None:
    """Kâğıt kesme model: (tür, geometri, renk) katmanları üst üste, sırayla biraz yükseltilerek dizilir."""
    for layer, (kind, geo, color) in enumerate(parts):
        mat = clay_material(f"{name}_{layer}", srgb(color))
        if kind == "poly":
            pts = geo
        else:  # circle: (cx, cy, r)
            cx, cy, r = geo
            pts = [(cx + p[0], cy + p[1]) for p in regular(64, r)]
        me = bpy.data.meshes.new(f"{name}_{layer}")
        me.from_pydata([(x, y, 0.0) for x, y in pts], [], [list(range(len(pts)))])
        ob = link(bpy.data.objects.new(me.name, me))
        ob.location.z = layer * 0.06
        sol = ob.modifiers.new("solid", "SOLIDIFY")
        sol.thickness = 0.12
        sol.offset = 0.0
        ob.data.materials.append(mat)
        soften(ob, bevel=0.025, voxel=0.007, lump=0.008)


def rect_at(cx: float, cy: float, w: float, h: float) -> list:
    return [(cx - w / 2, cy - h / 2), (cx + w / 2, cy - h / 2), (cx + w / 2, cy + h / 2), (cx - w / 2, cy + h / 2)]


MODELS_2D = {
    "item.model.ev": [("poly", rect_at(0, -0.35, 1.4, 1.3), "#F8DA74"),
                      ("poly", [(-0.9, 0.3), (0.9, 0.3), (0, 1.15)], "#F2846F"),
                      ("poly", rect_at(-0.25, -0.7, 0.38, 0.6), "#9FD0F2"),
                      ("circle", (0.35, -0.2, 0.2), "#A8DDB5")],
    "item.model.araba": [("poly", rect_at(0, -0.15, 2.4, 0.62), "#F2846F"),
                         ("poly", rect_at(-0.1, 0.42, 1.15, 0.55), "#9FD0F2"),
                         ("circle", (-0.7, -0.5, 0.3), "#B79FE8"),
                         ("circle", (0.7, -0.5, 0.3), "#B79FE8")],
    "item.model.gemi": [("poly", rect_at(0, -0.75, 2.2, 0.5), "#74A9E8"),
                        ("poly", [(0.05, -0.45), (0.05, 1.0), (0.95, -0.45)], "#F8DA74"),
                        ("poly", [(-0.05, -0.45), (-0.05, 0.75), (-0.8, -0.45)], "#F5B3C8")],
    "item.model.robot": [("poly", rect_at(0, -0.3, 0.95, 1.3), "#9FD0F2"),
                         ("poly", rect_at(0, 0.75, 0.72, 0.72), "#F8DA74"),
                         ("poly", rect_at(-0.68, -0.25, 0.28, 0.95), "#F5B3C8"),
                         ("poly", rect_at(0.68, -0.25, 0.28, 0.95), "#F5B3C8"),
                         ("circle", (-0.16, 0.8, 0.09), "#FFFFFF"),
                         ("circle", (0.16, 0.8, 0.09), "#FFFFFF")],
}


# ---------- ulusal semboller: 2893 sayılı Türk Bayrağı Kanunu ölçüleri ----------
# G = bayrak genişliği (yüksekliği). A = G/2 (gönderden dış hilal çemberi merkezine), dış çember çapı G/2,
# C = G/16 (iki çember merkezi arası), iç çember çapı 0,4 G, E = G/3 (iç çemberin solundan yıldız çemberinin
# soluna), yıldız çemberi çapı G/4, L = 1,5 G, M = G/30 (beyaz kol). Yıldızın bir ucu sola (hilale) bakar;
# sağlama: yıldızın sol ucu hilalin uç çizgisini ≈0,0154 G geçer.
FLAG_RED = "#E30A17"
FLAG_WHITE = "#F8F6F2"


def crescent_star_shapes(g: float, ox: float, oy: float) -> tuple[list, list]:
    """Hilal ve yıldız çokgenleri (bayrak koordinatı: x gönderden, y orta çizgiden)."""
    a, c, r_out, r_in = g / 2, g / 16, g / 4, 0.2 * g
    cx_out, cx_in = a, a + c
    # uç noktaları: iki çemberin kesişimi
    dx = cx_in - cx_out
    xt = cx_out + (r_out ** 2 - r_in ** 2 + dx ** 2) / (2 * dx)
    yt = math.sqrt(r_out ** 2 - (xt - cx_out) ** 2)
    t_out = math.atan2(yt, xt - cx_out)
    t_in = math.atan2(yt, xt - cx_in)
    # hilal = aynı uçlarda birleşen iki yay; ikisi de üst uçtan sola dolaşıp alt uca gider
    n = 96
    outer = [(cx_out + r_out * math.cos(t_out + (2 * math.pi - 2 * t_out) * i / n) + ox,
              r_out * math.sin(t_out + (2 * math.pi - 2 * t_out) * i / n) + oy) for i in range(n + 1)]
    inner = [(cx_in + r_in * math.cos(t_in + (2 * math.pi - 2 * t_in) * i / n) + ox,
              r_in * math.sin(t_in + (2 * math.pi - 2 * t_in) * i / n) + oy) for i in range(n + 1)]
    crescent = (outer, inner)
    star_r = g / 8
    star_cx = cx_in - r_in + g / 3 + star_r
    inner = star_r * 0.381966
    star = []
    for k in range(10):
        ang = math.pi + k * math.pi / 5  # ilk uç sola
        rr = star_r if k % 2 == 0 else inner
        star.append((star_cx + rr * math.cos(ang) + ox, rr * math.sin(ang) + oy))
    return crescent, star


def _dense_flat(name: str, pts: list, mat: bpy.types.Material, z: float, thickness: float,
                wave=None) -> bpy.types.Object:
    """Düz çokgeni yoğun üçgen ağa çevirir, isteğe bağlı dalga uygular ve kalınlık verir."""
    bm = bmesh.new()
    if isinstance(pts, tuple):
        # hilal: dış ve iç yay arasında dörtgen şerit; bmesh üçgenlemesi bu içbükey çokgende
        # üst üste binen üçgenler üretiyordu (alan 0,073 yerine 0,305)
        outer, inner = pts
        ov = [bm.verts.new((x, y, 0.0)) for x, y in outer]
        iv = [ov[0]] + [bm.verts.new((x, y, 0.0)) for x, y in inner[1:-1]] + [ov[-1]]
        for i in range(len(ov) - 1):
            quad = [ov[i], ov[i + 1], iv[i + 1], iv[i]]
            if len(set(quad)) == 3:
                bm.faces.new(list(dict.fromkeys(quad)))
            else:
                bm.faces.new(quad)
    else:
        vs = [bm.verts.new((x, y, 0.0)) for x, y in pts]
        bm.faces.new(vs)
    bmesh.ops.triangulate(bm, faces=bm.faces[:])
    for _ in range(5):
        bmesh.ops.subdivide_edges(bm, edges=bm.edges[:], cuts=1, use_grid_fill=True)
    if wave is not None:
        for v in bm.verts:
            v.co.z = wave(v.co.x, v.co.y)
    for v in bm.verts:
        v.co.z += z
    me = bpy.data.meshes.new(name)
    bm.to_mesh(me)
    ob = link(bpy.data.objects.new(name, me))
    ob.data.materials.append(mat)
    sol = ob.modifiers.new("solid", "SOLIDIFY")
    sol.thickness = thickness
    sol.offset = 0.0
    bv = ob.modifiers.new("bevel", "BEVEL")
    bv.width = thickness * 0.35
    bv.segments = 3
    bpy.ops.object.select_all(action="DESELECT")
    ob.select_set(True)
    bpy.context.view_layer.objects.active = ob
    bpy.ops.object.shade_smooth()
    return ob


def turkish_flag(name: str, _mat: bpy.types.Material) -> None:
    g = 1.4
    length = 1.5 * g
    red = clay_material(name + "_al", srgb(FLAG_RED))
    white = clay_material(name + "_beyaz", srgb(FLAG_WHITE))

    def wave(x: float, y: float) -> float:
        return 0.09 * math.sin(2 * math.pi * x / (0.85 * g) + 0.4) * (x / length + 0.15)

    # bayrak düzlemi XY'de kurulur, sonra dik konuma döndürülür
    _dense_flat(name + "_zemin", rect_at(length / 2, 0, length, g), red, 0.0, 0.05, wave)
    _dense_flat(name + "_kol", rect_at(-g / 60, 0, g / 30, g), white, 0.0, 0.06, wave)
    crescent, star = crescent_star_shapes(g, 0.0, 0.0)
    _dense_flat(name + "_hilal", crescent, white, 0.035, 0.03, wave)
    _dense_flat(name + "_yildiz", star, white, 0.035, 0.03, wave)
    for ob in [o for o in bpy.context.scene.objects if o.type == "MESH"]:
        ob.rotation_euler.x = math.radians(90)  # XY → XZ: bayrak kameraya (-Y) bakar
        ob.location.z += g / 2 + 1.2  # bayrağın üst kenarı gönderin tepesinin hemen altında
    block(name + "_gonder", "cyl", (0.045, g + 1.3), (-g / 30 - 0.05, 0, (g + 1.3) / 2 - 0.05), "#C9A27A")
    block(name + "_topuz", "box", (0.12, 0.12, 0.12), (-g / 30 - 0.05, 0, g + 1.3), "#E8C46A")
    rotate_all_z(8)


def crescent_badge(name: str, _mat: bpy.types.Material) -> None:
    g = 1.6  # rozet çapı ≈ bayrak genişliği; hilal-yıldız oranları bayrakla aynı
    red = clay_material(name + "_al", srgb(FLAG_RED))
    white = clay_material(name + "_beyaz", srgb(FLAG_WHITE))
    _dense_flat(name + "_rozet", regular(128, 1.0), red, 0.0, 0.16)
    crescent, star = crescent_star_shapes(g, 0.0, 0.0)
    # amblemi rozetin ortasına al: hilal-yıldız grubunun yatay merkezi
    xs = [p[0] for p in crescent[0] + star]
    shift = -(min(xs) + max(xs)) / 2
    crescent = tuple([(x + shift, y) for x, y in arc] for arc in crescent)
    star = [(x + shift, y) for x, y in star]
    _dense_flat(name + "_hilal", crescent, white, 0.1, 0.05)
    _dense_flat(name + "_yildiz", star, white, 0.1, 0.05)


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
    # 041 · cisim örneği zar, bloklardan yapılar, kâğıt kesme modeller (şekiller tarifle birebir)
    "item.nesne.zar": ("solid", dice, "#F7F4EE"),
    "item.yapi.blok_kale": ("solid", toy_castle, "#F8DA74"),
    "item.yapi.robot": ("solid", toy_robot, "#F8DA74"),
    "item.yapi.tren": ("solid", toy_train, "#F8DA74"),
    "item.yapi.blok_ev": ("solid", toy_block_house, "#F8DA74"),
    **{k: ("flat", (lambda parts: lambda n, m: paper_model(n, parts))(v), "#FFFFFF") for k, v in MODELS_2D.items()},
    # 080 · ulusal semboller (Bayrak Kanunu ölçüleriyle)
    "item.ulke.turk_bayragi": ("flag", turkish_flag, FLAG_RED),
    "item.simge.ay_yildiz": ("flat", crescent_badge, FLAG_RED),
}

# Aile kameraları: sabit yön ve ölçek (görseller arası boyut karşılaştırılabilir kalır)
CAMERAS = {
    # düz şekillerin üst yüzü doğrudan ana ışığa bakar; renk solmasın diye daha düşük pozlama
    "flat": {"view": (0.0, -0.6, 1.0), "ortho": 3.0, "exposure": -1.1},
    "solid": {"view": (0.9, -1.6, 0.85), "lens": 85, "distance": 7.2},
    "block": {"view": (0.25, -1.2, 1.35), "lens": 85, "distance": 8.6},
    "block_unit": {"view": (0.9, -1.6, 0.85), "lens": 85, "distance": 1.9},
    "flag": {"view": (0.15, -1.6, 0.28), "lens": 85, "distance": 10.5},
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
