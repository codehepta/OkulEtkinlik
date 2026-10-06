"""Sayı öğreten çıkartmalar: beyaz kil rozet üzerinde tam sayıda nesne.

Difüzyon "tam dört blok" ya da "yedi nokta" isteğinde sayıyı tutturamıyor (3 blok, 5 nokta
çizdi). Bu çıkartmalar Blender'da sayısı kodla belirlenerek modellenir.

Kullanım (repo kökünden):
    /Applications/Blender.app/Contents/MacOS/Blender -b --factory-startup \\
        -P tools/imagegen/blender_stickers.py -- [anahtar ...] [--samples 128]
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
ONLY = [a for a in argv if a.startswith("st.")]

bg_path = HERE / "blender_geometry.py"
bg = {"__file__": str(bg_path), "__name__": "blender_geometry"}
exec(compile(bg_path.read_text(encoding="utf-8").replace("\nmain()\n", "\n"), str(bg_path), "exec"), bg)
sys.path.insert(0, str(HERE))
from batch_parser import parse_batch  # noqa: E402

M, C = bg["clay_material"], bg["srgb"]


def badge() -> None:
    bg["_dense_flat"]("rozet", bg["regular"](128, 1.08), M("beyaz", C("#F8F6F2")), 0.0, 0.2)


def stacked_blocks(n: int) -> None:
    """Tek sütun kule: tam n küp, rozet yüzeyinde aşağıdan yukarı (resimde dik görünür)."""
    colors = ["#4C8FE0", "#6DBE5C", "#F8D45C", "#E5534B", "#B07AE0"]
    e = 0.4
    y0 = -(n - 1) * (e + 0.02) / 2
    for i in range(n):
        bg["block"](f"kup{i}", "box", (e, e, e), (0, y0 + i * (e + 0.02), 0.2 + e / 2), colors[i % len(colors)])


def ladybug(dots: int) -> None:
    """Üstten uğur böceği: iki kanat, siyah baş, tam `dots` nokta (3 + 3 + ortada 1)."""
    red, black = M("kirmizi", C("#E3342C")), M("siyah", C("#26262C"))
    bpy.ops.mesh.primitive_uv_sphere_add(segments=64, ring_count=32, radius=0.62, location=(0, -0.05, 0.2))
    body = bpy.context.active_object
    body.scale = (1.0, 1.1, 0.42)
    body.data.materials.append(red)
    bpy.ops.object.shade_smooth()
    bpy.ops.mesh.primitive_uv_sphere_add(segments=48, ring_count=24, radius=0.27, location=(0, 0.66, 0.24))
    head = bpy.context.active_object
    head.scale = (1.0, 0.8, 0.6)
    head.data.materials.append(black)
    bpy.ops.object.shade_smooth()
    bpy.ops.mesh.primitive_cube_add(size=1.0, location=(0, -0.05, 0.47))
    seam = bpy.context.active_object
    seam.scale = (0.035, 1.25, 0.04)
    seam.data.materials.append(black)
    side = [(0.32, 0.25), (0.40, -0.12), (0.28, -0.45)]
    spots = [(-x, y) for x, y in side] + [(x, y) for x, y in side]
    if dots % 2:
        spots.append((0.0, -0.62))
    assert len(spots) == dots, (len(spots), dots)
    for k, (x, y) in enumerate(spots):
        z = 0.2 + 0.42 * 0.62 * math.sqrt(max(0.0, 1 - (x / 0.62) ** 2 - ((y + 0.05) / 0.68) ** 2)) + 0.01
        bpy.ops.mesh.primitive_uv_sphere_add(segments=32, ring_count=16, radius=0.09, location=(x, y, z))
        dot = bpy.context.active_object
        dot.scale = (1, 1, 0.45)
        dot.data.materials.append(black)
        bpy.ops.object.shade_smooth()


def picture_graph(heights: list, colors: list) -> None:
    """Resim grafiği: ortak taban çizgisi, her sütunda tam `heights[i]` kare blok."""
    e = 0.3
    base_y = -0.62
    bpy.ops.mesh.primitive_cube_add(size=1.0, location=(0, base_y - 0.05, 0.22))
    line = bpy.context.active_object
    line.scale = (len(heights) * (e + 0.12) + 0.2, 0.05, 0.04)
    line.data.materials.append(M("taban", C("#5A5A64")))
    for c, (n, col) in enumerate(zip(heights, colors)):
        x = (c - (len(heights) - 1) / 2) * (e + 0.12)
        for k in range(n):
            bg["block"](f"g{c}_{k}", "box", (e, e, 0.16), (x, base_y + e / 2 + k * (e + 0.02), 0.28), col)


def tally(groups: int) -> None:
    """Çetele: her grupta dört dik çizgi ve üzerlerinden geçen bir çapraz çizgi (5'li gruplar)."""
    paper = M("kagit", C("#FFF4C9"))
    ink = M("murekkep", C("#3A3A44"))
    bpy.ops.mesh.primitive_cube_add(size=1.0, location=(0, 0, 0.24))
    pg = bpy.context.active_object
    pg.scale = (1.45, 1.15, 0.06)
    pg.data.materials.append(paper)
    for g in range(groups):
        gx = (g - (groups - 1) / 2) * 0.62
        for k in range(4):
            bpy.ops.mesh.primitive_cylinder_add(vertices=16, radius=0.028, depth=0.62, location=(gx - 0.2 + k * 0.13, 0, 0.3))
            st = bpy.context.active_object
            st.rotation_euler.x = math.radians(90)
            st.data.materials.append(ink)
        bpy.ops.mesh.primitive_cylinder_add(vertices=16, radius=0.028, depth=0.78, location=(gx - 0.005, 0, 0.32))
        cr = bpy.context.active_object
        cr.rotation_euler = (math.radians(90), 0, math.radians(-55))  # kâğıt düzleminde çapraz
        cr.data.materials.append(ink)


STICKERS = {
    "st.turkce.g1_uc_dort": ("063-g1-turkce-cikartmalar", lambda: stacked_blocks(4)),
    "st.turkce.g1_bes_alti_yedi": ("063-g1-turkce-cikartmalar", lambda: ladybug(7)),
    "st.matematik.g1_grafik": ("033-g1-matematik-cikartmalar",
                               lambda: picture_graph([2, 4, 3], ["#E5534B", "#F8D45C", "#4C8FE0"])),
    "st.matematik.g1_defter": ("033-g1-matematik-cikartmalar", lambda: tally(2)),
}


def main() -> None:
    for key, (batch, build) in STICKERS.items():
        if ONLY and key not in ONLY:
            continue
        bg["reset_scene"](SAMPLES)
        sc = bpy.context.scene
        sc.view_settings.exposure = -0.6
        badge()
        build()
        cam_d = bpy.data.cameras.new("cam")
        cam_d.type = "ORTHO"
        cam_d.ortho_scale = 2.5
        cam = bpy.data.objects.new("cam", cam_d)
        sc.collection.objects.link(cam)
        sc.camera = cam
        d = Vector((0.0, -0.35, 1.0)).normalized()
        cam.location = Vector((0, 0, 0.1)) + d * 10
        cam.rotation_euler = (-d).to_track_quat("-Z", "Y").to_euler()
        it = {i.key: i for i in parse_batch((REPO / "asset-requests" / f"{batch}.md").read_text(encoding="utf-8"))}[key]
        out = REPO / "build" / "imagegen" / batch / key
        out.mkdir(parents=True, exist_ok=True)
        sc.render.filepath = str(out / "s0_blender.png")
        bpy.ops.render.render(write_still=True)
        meta = {"key": key, "target": it.path, "batch": batch + ".md", "number": it.number,
                "model": "blender-procedural", "model_license": "n/a (prosedürel, CC BY 4.0 içerik)",
                "blender": ".".join(map(str, bpy.app.version)), "generator": "tools/imagegen/blender_stickers.py",
                "seed": 0, "size": [sc.render.resolution_x, sc.render.resolution_y], "prompt": it.prompt,
                "references": [], "background_removed": False, "trim": True}
        (out / "s0_blender.json").write_text(json.dumps(meta, ensure_ascii=False, indent=2), encoding="utf-8")
        print("ÇIKARTMA", it.number, key, flush=True)


main()
