"""Türkiye haritası (item.ulke.harita): gerçek sınırlarla kil kabartma.

Difüzyon modelleri bir ülkenin şeklini doğru çizemez; sınırlar Natural Earth
1:50m verisinden gelir (kamu malı, data/turkiye_bolge.json). Türkiye sıcak
yeşil-sarı kabartma, komşular alçak ve nötr kum rengi, denizler mavi kil
zemindir. Etiket ve yazı yoktur.

Kullanım (repo kökünden):
    /Applications/Blender.app/Contents/MacOS/Blender -b --factory-startup \\
        -P tools/imagegen/blender_turkiye_map.py -- <çıktı.png> [--samples 128] [--res 1920]
"""

import json
import math
import sys
from pathlib import Path

import bpy
from mathutils import Vector

HERE = Path(__file__).resolve().parent
argv = sys.argv[sys.argv.index("--") + 1:]
OUT = argv[0]
SAMPLES = int(argv[argv.index("--samples") + 1]) if "--samples" in argv else 128
RES_X = int(argv[argv.index("--res") + 1]) if "--res" in argv else 1920

bg_path = HERE / "blender_geometry.py"
bg = {"__file__": str(bg_path), "__name__": "blender_geometry"}
exec(compile(bg_path.read_text(encoding="utf-8").replace("\nmain()\n", "\n"), str(bg_path), "exec"), bg)

data = json.loads((HERE / "data" / "turkiye_bolge.json").read_text(encoding="utf-8"))
LAT_C, LON_C = 38.9, 35.1
KX = math.cos(math.radians(LAT_C))


def project(lon: float, lat: float) -> tuple[float, float]:
    """Basit eş-dikdörtgen izdüşüm (orta enlemde boylam daraltılır)."""
    return (lon - LON_C) * KX, lat - LAT_C


def country_curve(name: str, rings: list, height: float, bevel: float, color: str) -> bpy.types.Object:
    cu = bpy.data.curves.new(name, "CURVE")
    cu.dimensions = "2D"
    cu.fill_mode = "BOTH"
    cu.extrude = height
    cu.bevel_depth = bevel
    cu.bevel_resolution = 3
    for ring in rings:
        sp = cu.splines.new("POLY")
        pts = [project(lon, lat) for lon, lat in ring[:-1]]
        sp.points.add(len(pts) - 1)
        for p, (x, y) in zip(sp.points, pts):
            p.co = (x, y, 0.0, 1.0)
        sp.use_cyclic_u = True
    ob = bpy.data.objects.new(name, cu)
    bpy.context.scene.collection.objects.link(ob)
    ob.location.z = height
    ob.data.materials.append(bg["clay_material"](name, bg["srgb"](color)))
    return ob


bg["reset_scene"](SAMPLES)
sc = bpy.context.scene
sc.render.resolution_x = RES_X
sc.render.resolution_y = round(RES_X * 9 / 16)
sc.render.film_transparent = False
sc.view_settings.exposure = -0.4
# stüdyo ışıkları küçük nesneler için konumlu; ~16 birimlik haritada leke ve sahte gölge yapar.
# Harita yönlü güneş + yumuşak ortam ışığıyla aydınlatılır.
for ob in [o for o in sc.objects if o.type == "LIGHT"]:
    bpy.data.objects.remove(ob, do_unlink=True)
sc.world.node_tree.nodes["Background"].inputs["Strength"].default_value = 0.7
sun_data = bpy.data.lights.new("gunes", "SUN")
sun_data.energy = 3.2
sun_data.angle = math.radians(8)
sun_data.color = (1.0, 0.95, 0.88)
sun = bpy.data.objects.new("gunes", sun_data)
sc.collection.objects.link(sun)
sun.rotation_euler = Vector((-0.5, -0.6, 1.0)).to_track_quat("Z", "Y").to_euler()

# deniz: dalga dokulu mavi kil zemin
bpy.ops.mesh.primitive_plane_add(size=1.0, location=(0, 0, 0))
sea = bpy.context.active_object
sea.scale = (24, 14, 1)
sea.data.materials.append(bg["clay_material"]("deniz", bg["srgb"]("#6CAADF")))

for iso, c in data["countries"].items():
    if iso == "TUR":
        continue
    country_curve(f"komsu_{iso}", c["rings"], 0.05, 0.03, "#D6C8AE")

tr = country_curve("turkiye", data["countries"]["TUR"]["rings"], 0.16, 0.05, "#9BCB66")
# kabartma: eğriyi ağa çevir, hafif tepeler ekle
bpy.context.view_layer.objects.active = tr
tr.select_set(True)
bpy.ops.object.convert(target="MESH")
rm = tr.modifiers.new("remesh", "REMESH")
rm.mode = "VOXEL"
rm.voxel_size = 0.035
rm.use_smooth_shade = True
tex = bpy.data.textures.new("tepeler", "CLOUDS")
tex.noise_scale = 0.9
dp = tr.modifiers.new("tepeler", "DISPLACE")
dp.texture = tex
dp.texture_coords = "GLOBAL"
dp.direction = "Z"
dp.strength = 0.18
dp.mid_level = 0.35
sm = tr.modifiers.new("smooth", "CORRECTIVE_SMOOTH")
sm.iterations = 4

# sıcak yeşil-sarı: kabartma yüksekliğine göre renk geçişi
mat = tr.data.materials[0]
nt = mat.node_tree
bsdf = nt.nodes["Principled BSDF"]
geo = nt.nodes.new("ShaderNodeNewGeometry")
sep = nt.nodes.new("ShaderNodeSeparateXYZ")
nt.links.new(geo.outputs["Position"], sep.inputs[0])
ramp = nt.nodes.new("ShaderNodeValToRGB")
ramp.color_ramp.elements[0].position = 0.30
ramp.color_ramp.elements[0].color = bg["srgb"]("#7FBF57")
ramp.color_ramp.elements[1].position = 0.46
ramp.color_ramp.elements[1].color = bg["srgb"]("#E2C76A")
nt.links.new(sep.outputs["Z"], ramp.inputs["Fac"])
nt.links.new(ramp.outputs["Color"], bsdf.inputs["Base Color"])

# kamera: üstten, hafif eğik; Türkiye çerçeveyi yatayda doldurur
x0, _ = project(25.4, LAT_C)
x1, _ = project(45.2, LAT_C)
cam_data = bpy.data.cameras.new("cam")
cam_data.type = "ORTHO"
cam_data.ortho_scale = (x1 - x0) * 1.04
cam = bpy.data.objects.new("cam", cam_data)
sc.collection.objects.link(cam)
sc.camera = cam
d = Vector((0.0, -0.32, 1.0)).normalized()
center = Vector((((x0 + x1) / 2), 0.15, 0.0))
cam.location = center + d * 30
cam.rotation_euler = (-d).to_track_quat("-Z", "Y").to_euler()

sc.render.filepath = OUT
bpy.ops.render.render(write_still=True)
print("HARİTA", OUT)
