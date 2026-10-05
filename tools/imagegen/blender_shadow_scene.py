"""Gölge öğreten sahneler: klein ile üretilmiş, arka planı silinmiş bir karakteri Blender'da
kil bir çim diskinin üzerine pano olarak koyar ve alçak güneşle gerçek, uzun bir gölge düşürür.

Difüzyon modelleri "uzun gölge" ya da "gölgesi de zıplıyor" gibi ışık-gölge ilişkisini
güvenilir çizemiyor; gölge burada fizik olarak hesaplanır.

Kullanım (repo kökünden):
    /Applications/Blender.app/Contents/MacOS/Blender -b --factory-startup \\
        -P tools/imagegen/blender_shadow_scene.py -- <karakter_cut.png> <çıktı.png> [yükseklik] [--samples 128]

yükseklik: karakterin zeminden yüksekliği (0 = yürüyor, 0.6 = zıplıyor).
"""

import math
import sys
from pathlib import Path

import bpy
from mathutils import Vector

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

argv = sys.argv[sys.argv.index("--") + 1:]
SRC, OUT = argv[0], argv[1]
LIFT = float(argv[2]) if len(argv) > 2 and not argv[2].startswith("--") else 0.0
SAMPLES = int(argv[argv.index("--samples") + 1]) if "--samples" in argv else 128

# blender_geometry'deki kil malzemesi ve yumuşatma yardımcılarını yeniden kullan
bg_path = HERE / "blender_geometry.py"
bg_src = bg_path.read_text(encoding="utf-8").replace("\nmain()\n", "\n")  # yalnızca yardımcıları yükle
bg = {"__file__": str(bg_path), "__name__": "blender_geometry"}
exec(compile(bg_src, str(HERE / "blender_geometry.py"), "exec"), bg)

bg["reset_scene"](SAMPLES)
sc = bpy.context.scene
sc.view_settings.exposure = 0.0
# stüdyo ışıklarını kapat: gölgeyi yalnızca güneş versin, ortam ışığı yumuşak dolgu yapsın
for ob in [o for o in sc.objects if o.type == "LIGHT"]:
    ob.data.energy *= 0.15
sc.world.node_tree.nodes["Background"].inputs["Strength"].default_value = 0.6

# çim diski: gölge yönüne doğru uzatılmış elips
bpy.ops.mesh.primitive_cylinder_add(vertices=96, radius=1.0, depth=0.18, location=(0.85, 1.0, -0.09))
disc = bpy.context.active_object
disc.scale = (2.2, 1.9, 1.0)
bpy.ops.object.transform_apply(scale=True)
disc.data.materials.append(bg["clay_material"]("cim", bg["srgb"]("#6DB55C")))
bg["soften"](disc, bevel=0.06, voxel=0.012, lump=0.015, angle_limit=True)

# karakter panosu (kameraya dönük, alfa ile)
img = bpy.data.images.load(SRC)
w, h = img.size
height = 2.0
bpy.ops.mesh.primitive_plane_add(size=1.0, location=(0, 0, height / 2 + LIFT))
board = bpy.context.active_object
board.scale = (height * w / h, height, 1.0)  # düzlemin yerel Y ekseni dönünce dikey olur
board.rotation_euler = (math.radians(90), 0, 0)
mat = bpy.data.materials.new("pano")
mat.use_nodes = True
nt = mat.node_tree
n, l = nt.nodes, nt.links
for node in list(n):
    if node.type != "OUTPUT_MATERIAL":
        n.remove(node)
tex = n.new("ShaderNodeTexImage")
tex.image = img
emit = n.new("ShaderNodeEmission")
transp = n.new("ShaderNodeBsdfTransparent")
mix = n.new("ShaderNodeMixShader")
l.new(tex.outputs["Color"], emit.inputs["Color"])
l.new(tex.outputs["Alpha"], mix.inputs["Fac"])
l.new(transp.outputs[0], mix.inputs[1])
l.new(emit.outputs[0], mix.inputs[2])
l.new(mix.outputs[0], n["Material Output"].inputs["Surface"])
board.data.materials.append(mat)

# alçak güneş soldan-önden: pano ışığa yüzünü döner, geniş ve uzun gölge sağa-arkaya düşer
sun_data = bpy.data.lights.new("gunes", "SUN")
sun_data.energy = 4.0
sun_data.angle = math.radians(1.5)
sun = bpy.data.objects.new("gunes", sun_data)
sc.collection.objects.link(sun)
sun.rotation_euler = (Vector((-0.75, -1.0, 0.72))).to_track_quat("Z", "Y").to_euler()

# kamera: önden, hafif yukarıdan
cam_data = bpy.data.cameras.new("cam")
cam_data.lens = 50
cam = bpy.data.objects.new("cam", cam_data)
sc.collection.objects.link(cam)
sc.camera = cam
target = Vector((0.75, 0.9, 0.75 + LIFT / 2))
cam.location = target + Vector((-0.6, -7.2, 3.4))
cam.rotation_euler = (target - cam.location).to_track_quat("-Z", "Y").to_euler()

sc.render.filepath = OUT
bpy.ops.render.render(write_still=True)
print("GÖLGE SAHNESİ", OUT)
