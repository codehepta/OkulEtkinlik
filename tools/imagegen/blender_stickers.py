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


def stacked_blocks(n: int, colors: list | None = None) -> None:
    """Tek sütun kule: tam n küp, rozet yüzeyinde aşağıdan yukarı (resimde dik görünür)."""
    colors = colors or ["#4C8FE0", "#6DBE5C", "#F8D45C", "#E5534B", "#B07AE0"]
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


def tally(groups: int, extra: int = 0) -> None:
    """Çetele: her grupta dört dik çizgi ve üzerlerinden geçen bir çapraz çizgi (5'li gruplar),
    sonda `extra` tane tek çizgi."""
    paper = M("kagit", C("#FFF4C9"))
    ink = M("murekkep", C("#3A3A44"))
    bpy.ops.mesh.primitive_cube_add(size=1.0, location=(0, 0, 0.24))
    pg = bpy.context.active_object
    pg.scale = (1.45, 1.15, 0.06)
    pg.data.materials.append(paper)
    shift = -0.22 * (1 if extra else 0)
    for g in range(groups):
        gx = (g - (groups - 1) / 2) * 0.62 + shift
        for k in range(4):
            bpy.ops.mesh.primitive_cylinder_add(vertices=16, radius=0.028, depth=0.62, location=(gx - 0.2 + k * 0.13, 0, 0.3))
            st = bpy.context.active_object
            st.rotation_euler.x = math.radians(90)
            st.data.materials.append(ink)
        bpy.ops.mesh.primitive_cylinder_add(vertices=16, radius=0.028, depth=0.78, location=(gx - 0.005, 0, 0.32))
        cr = bpy.context.active_object
        cr.rotation_euler = (math.radians(90), 0, math.radians(-55))  # kâğıt düzleminde çapraz
        cr.data.materials.append(ink)
    for k in range(extra):
        x = ((groups - 1) / 2) * 0.62 + shift + 0.42 + k * 0.13
        bpy.ops.mesh.primitive_cylinder_add(vertices=16, radius=0.028, depth=0.62, location=(x, 0, 0.3))
        st = bpy.context.active_object
        st.rotation_euler.x = math.radians(90)
        st.data.materials.append(ink)


def ten_bundle() -> None:
    """Onluk demeti: yan yana yatan tam on kil çubuk, ortadan kurdeleyle bağlı."""
    n, r, gap = 10, 0.06, 0.125
    for k in range(n):
        x = (k - (n - 1) / 2) * gap
        bg["block"](f"cubuk{k}", "cyl", (r, 1.45), (x, 0, 0.2 + r), "#E9B96E", axis="Y")
    ribbon = M("kurdele", C("#E5534B"))
    bg["block"]("kurdele", "box", (n * gap + 0.06, 0.13, 2 * r + 0.05), (0, 0, 0.2 + r), "#E5534B")
    for side in (-1, 1):  # fiyonk: iki ilmek
        bpy.ops.mesh.primitive_torus_add(major_radius=0.12, minor_radius=0.045, location=(side * 0.13, 0, 0.2 + 2 * r + 0.06))
        loop = bpy.context.active_object
        loop.rotation_euler = (0, math.radians(90 - side * 25), 0)
        loop.scale = (1.0, 0.7, 1.0)
        loop.data.materials.append(ribbon)
        bpy.ops.object.shade_smooth()
    bpy.ops.mesh.primitive_uv_sphere_add(segments=32, ring_count=16, radius=0.06, location=(0, 0, 0.2 + 2 * r + 0.06))
    knot = bpy.context.active_object
    knot.data.materials.append(ribbon)
    bpy.ops.object.shade_smooth()


def hundred_flat() -> None:
    """Yüzlük blok: 10 x 10 birim küpten açık mavi düz kare (taban-onluk bloklarıyla aynı yapı)."""
    bg["UNIT"] = 0.13
    bg["unit_blocks"]("yuzluk", 10, 10, M("mavi", C("#7DBDEB")), rot_z=0)
    bg["UNIT"] = 0.22
    ob = bpy.data.objects["yuzluk"]
    ob.location.z = 0.2 + 0.13 / 2


def dice_sticker() -> None:
    """Zar: doğru nokta dizilimli beyaz zar (blender_geometry.dice), rozete sığacak ölçekte."""
    before = set(bpy.context.scene.objects)
    bg["dice"]("zar", None, "#E5534B")
    s = 0.62
    for ob in set(bpy.context.scene.objects) - before:
        ob.location = ob.location * s
        ob.scale = ob.scale * s
        ob.location.z += 0.2 + 1.3 * s / 2


def relief_ladder(rungs: int) -> None:
    """Kabartma merdiven: iki dikme, tam `rungs` basamak (rozet yüzeyinde yatık)."""
    honey = "#E9B04F"
    for x in (-0.36, 0.36):
        bg["block"](f"dikme{x}", "cyl", (0.075, 1.5), (x, 0, 0.28), honey, axis="Y")
    gap = 1.2 / (rungs - 1)
    for k in range(rungs):
        bg["block"](f"basamak{k}", "cyl", (0.06, 0.72), (0, -0.6 + k * gap, 0.29), honey, axis="X")


def relief_flower(petals: int) -> None:
    """Kabartma çiçek: tam `petals` yaprak (dönüşümlü pastel), gülen sarı göbek."""
    colors = ["#F5A3BC", "#F8DA74", "#9ED9B5", "#B9A2EC", "#8EC5F0", "#F7BE95"]
    for k in range(petals):
        a = math.radians(90 + k * 360 / petals)
        bpy.ops.mesh.primitive_uv_sphere_add(segments=48, ring_count=24, radius=0.3,
                                             location=(0.5 * math.cos(a), 0.5 * math.sin(a), 0.26))
        pt = bpy.context.active_object
        pt.scale = (1.3, 0.85, 0.3)
        pt.rotation_euler.z = a
        pt.data.materials.append(M(f"yaprak{k}", C(colors[k % len(colors)])))
        bpy.ops.object.shade_smooth()
    bpy.ops.mesh.primitive_uv_sphere_add(segments=48, ring_count=24, radius=0.3, location=(0, 0, 0.3))
    c = bpy.context.active_object
    c.scale = (1, 1, 0.45)
    c.data.materials.append(M("gobek", C("#F8D45C")))
    bpy.ops.object.shade_smooth()
    dark = M("goz", C("#2B2B33"))
    for x in (-0.1, 0.1):
        bpy.ops.mesh.primitive_uv_sphere_add(segments=24, ring_count=12, radius=0.035, location=(x, 0.06, 0.43))
        e = bpy.context.active_object
        e.data.materials.append(dark)
    bpy.ops.mesh.primitive_torus_add(major_radius=0.1, minor_radius=0.018, location=(0, 0.02, 0.42))
    sm = bpy.context.active_object
    sm.data.materials.append(dark)
    bpy.ops.object.mode_set(mode="EDIT")  # gülümseme: halkanın üst yarısını sil
    import bmesh
    bm = bmesh.from_edit_mesh(sm.data)
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if v.co.y > -0.02], context="VERTS")
    bmesh.update_edit_mesh(sm.data)
    bpy.ops.object.mode_set(mode="OBJECT")


def relief_train(wagons: int) -> None:
    """Kabartma tren (yandan görünüş): lokomotif ve tam `wagons` vagon, rozet yüzeyinde."""
    red, teal = "#E5534B", "#3FB8AF"
    total = 0.62 + wagons * 0.52
    x0 = total / 2 - 0.31
    z = 0.26
    bg["block"]("lok_govde", "box", (0.62, 0.34, 0.1), (x0, -0.02, z), red)
    bg["block"]("lok_kabin", "box", (0.26, 0.3, 0.1), (x0 - 0.18, 0.28, z + 0.01), red)
    bg["block"]("lok_baca", "box", (0.1, 0.18, 0.1), (x0 + 0.18, 0.23, z + 0.01), teal)
    wheels = [x0 - 0.18, x0 + 0.18]
    for w in range(wagons):
        cx = x0 - 0.57 - w * 0.52
        bg["block"](f"vagon{w}", "box", (0.44, 0.3, 0.1), (cx, -0.04, z), teal)
        bg["block"](f"bag{w}", "box", (0.1, 0.05, 0.06), (cx + 0.26, -0.08, z - 0.01), "#5A5A64")
        wheels += [cx - 0.12, cx + 0.12]
    for k, x in enumerate(wheels):
        bg["block"](f"teker{k}", "cyl", (0.085, 0.1), (x, -0.24, z + 0.03), "#2F4E8C")
    bpy.ops.object.select_all(action="DESELECT")


STICKERS = {
    "st.turkce.g1_uc_dort": ("063-g1-turkce-cikartmalar", lambda: stacked_blocks(4)),
    "st.turkce.g1_bes_alti_yedi": ("063-g1-turkce-cikartmalar", lambda: ladybug(7)),
    "st.matematik.g1_grafik": ("033-g1-matematik-cikartmalar",
                               lambda: picture_graph([2, 4, 3], ["#E5534B", "#F8D45C", "#4C8FE0"])),
    "st.matematik.g1_defter": ("033-g1-matematik-cikartmalar", lambda: tally(2)),
    "st.matematik.g2_zar": ("043-g2-matematik-cikartmalar", dice_sticker),
    "st.matematik.g2_onluk": ("043-g2-matematik-cikartmalar", ten_bundle),
    "st.matematik.g2_cetele": ("043-g2-matematik-cikartmalar", lambda: tally(1, extra=3)),
    "st.matematik.yuzluk_blok": ("051-g3-matematik-cikartmalar", hundred_flat),
    "st.matematik.kup_kule": ("051-g3-matematik-cikartmalar",
                              lambda: stacked_blocks(4, ["#F28AA8", "#F6C945", "#7FCB8E", "#6FB3EA"])),
    "st.matematik.merdiven": ("051-g3-matematik-cikartmalar", lambda: relief_ladder(5)),
    "st.matematik.carpim_cicegi": ("051-g3-matematik-cikartmalar", lambda: relief_flower(6)),
    "st.matematik.tren": ("051-g3-matematik-cikartmalar", lambda: relief_train(2)),
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
