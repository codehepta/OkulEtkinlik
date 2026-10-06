"""Tam üstten (ya da tam önden) çekilen düz kil öğeler: oyuncak paralar, banknotlar, pizza,
saat kadranı (010); çevre ızgaraları ve simetri şekilleri (050).

Parti bu görsellerin tam çember / tam dikdörtgen olmasını ve çerçeveyi kenardan kenara
doldurmasını istiyor: oyun pizzayı bu çemberden dilimler, kadranın üstüne rakam ve ibre,
paraların ortasına değer yazar. Izgara ve simetri görselleri sayılabilir kare ve tam
köşegen ister. Difüzyon perspektif ve yaklaşık şekil verdiği için hepsi burada modellenir.
Görsellerde rakam, harf ya da sembol yoktur.

Kullanım (repo kökünden):
    /Applications/Blender.app/Contents/MacOS/Blender -b --factory-startup \\
        -P tools/imagegen/blender_flat_items.py -- [anahtar ...] [--samples 128] [--res 1024]
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
RES = int(argv[argv.index("--res") + 1]) if "--res" in argv else 1024
ONLY = [a for a in argv if a.startswith(("item.", "ui."))]

bg_path = HERE / "blender_geometry.py"
bg = {"__file__": str(bg_path), "__name__": "blender_geometry"}
exec(compile(bg_path.read_text(encoding="utf-8").replace("\nmain()\n", "\n"), str(bg_path), "exec"), bg)
sys.path.insert(0, str(HERE))
from batch_parser import parse_batch  # noqa: E402

M, C = bg["clay_material"], bg["srgb"]


# ---------- yardımcılar ----------
def disc(name: str, r: float, h: float, z: float, color: str, segments: int = 128,
         x: float = 0.0, y: float = 0.0) -> bpy.types.Object:
    bpy.ops.mesh.primitive_cylinder_add(vertices=segments, radius=r, depth=h, location=(x, y, z + h / 2))
    ob = bpy.context.active_object
    ob.name = name
    bv = ob.modifiers.new("bevel", "BEVEL")
    bv.width = min(h * 0.45, 0.04)
    bv.segments = 4
    bv.limit_method = "ANGLE"
    ob.data.materials.append(M(name, C(color)))
    bpy.ops.object.shade_smooth()
    return ob


def ring(name: str, r_major: float, r_minor: float, z: float, color: str) -> bpy.types.Object:
    bpy.ops.mesh.primitive_torus_add(major_radius=r_major, minor_radius=r_minor, major_segments=128,
                                     minor_segments=24, location=(0, 0, z))
    ob = bpy.context.active_object
    ob.name = name
    ob.scale.z = 0.55
    ob.data.materials.append(M(name, C(color)))
    bpy.ops.object.shade_smooth()
    return ob


def bump(name: str, x: float, y: float, z: float, r: float, color: str, flat: float = 0.5) -> None:
    bpy.ops.mesh.primitive_uv_sphere_add(segments=24, ring_count=12, radius=r, location=(x, y, z))
    ob = bpy.context.active_object
    ob.name = name
    ob.scale.z = flat
    ob.data.materials.append(M(name, C(color)))
    bpy.ops.object.shade_smooth()


def slab(name: str, sx: float, sy: float, h: float, x: float, y: float, z: float, color: str,
         bevel: float = 0.04, rot: float = 0.0) -> bpy.types.Object:
    bpy.ops.mesh.primitive_cube_add(size=1.0, location=(x, y, z + h / 2))
    ob = bpy.context.active_object
    ob.name = name
    ob.scale = (sx, sy, h)
    # yalnızca ölçek uygulanır; varsayılan transform_apply konumu da sıfırlar ve dönme merkezi kayar
    bpy.ops.object.transform_apply(location=False, rotation=False, scale=True)
    ob.rotation_euler.z = rot
    bv = ob.modifiers.new("bevel", "BEVEL")
    bv.width = bevel
    bv.segments = 4
    ob.data.materials.append(M(name, C(color)))
    bpy.ops.object.shade_smooth()
    return ob


def flat_poly(name: str, pts: list, h: float, z: float, color: str) -> None:
    me = bpy.data.meshes.new(name)
    me.from_pydata([(x, y, 0.0) for x, y in pts], [], [list(range(len(pts)))])
    ob = bpy.data.objects.new(name, me)
    bpy.context.scene.collection.objects.link(ob)
    ob.location.z = z
    sol = ob.modifiers.new("solid", "SOLIDIFY")
    sol.thickness = h
    sol.offset = 1.0
    bv = ob.modifiers.new("bevel", "BEVEL")
    bv.width = 0.03
    bv.segments = 4
    ob.data.materials.append(M(name, C(color)))


def dashed(name: str, a: tuple, b: tuple, z: float, color: str = "#3A3A44", n: int = 9) -> None:
    """a→b arasında n kısa çizgi (kesik çizgi)."""
    ax, ay = a
    bx, by = b
    L = math.hypot(bx - ax, by - ay)
    ang = math.atan2(by - ay, bx - ax)
    seg = L / (2 * n - 1)
    for k in range(n):
        t = (2 * k + 0.5) * seg / L
        slab(f"{name}{k}", seg, 0.045, 0.03, ax + (bx - ax) * t, ay + (by - ay) * t, z, color, bevel=0.012, rot=ang)


# ---------- paralar ----------
COINS = {
    "item.para.kr_1": ("#B8734A", None, False),
    "item.para.kr_5": ("#E6C566", None, False),
    "item.para.kr_10": ("#D9AE3F", None, False),
    "item.para.kr_25": ("#C99A2E", None, True),
    "item.para.kr_50": ("#D4A93A", "#C3C7CE", False),   # altın halka, gümüş orta
    "item.para.tl_1": ("#C3C7CE", "#D9AE3F", False),     # gümüş halka, altın orta
}


def coin(name: str, rim_color: str, center_color: str | None, reeded: bool) -> None:
    base = disc(name + "_govde", 1.0, 0.16, 0.0, rim_color)
    if center_color:
        disc(name + "_orta", 0.62, 0.17, 0.0, center_color)
    ring(name + "_kenar", 0.93, 0.07, 0.16, rim_color)
    if reeded:  # tırtıklı kenar: dış çevrede küçük oluklar
        for k in range(72):
            a = 2 * math.pi * k / 72
            slab(f"{name}_tirtik{k}", 0.05, 0.022, 0.15, 0.985 * math.cos(a), 0.985 * math.sin(a), 0.005,
                 "#A87F22", bevel=0.006, rot=a)
    # ortadaki düz alan boş kalır; kenara yakın birkaç soyut nokta
    dot_col = center_color or rim_color
    for k in range(10):
        a = 2 * math.pi * (k + 0.5) / 10
        bump(f"{name}_nokta{k}", 0.78 * math.cos(a), 0.78 * math.sin(a), 0.17, 0.035, "#FFF4D6" if center_color else dot_col, 0.45)
    _ = base


# ---------- banknotlar ----------
NOTES = {
    "item.para.tl_5": ("#B79ACF", "#9A6E52"),
    "item.para.tl_10": ("#EE8B84", "#F7B6C2"),
    "item.para.tl_20": ("#8FC97A", "#5FA352"),
    "item.para.tl_50": ("#F4A456", "#E07B2A"),
    "item.para.tl_100": ("#86C3EA", "#4F97CF"),
    "item.para.tl_200": ("#E79BC0", "#9A78D0"),
}


def banknote(name: str, main: str, accent: str) -> None:
    W, H = 2.0, 1.0
    slab(name + "_kagit", W, H, 0.06, 0, 0, 0, main, bevel=0.06)
    bpy.ops.mesh.primitive_cylinder_add(vertices=96, radius=1.0, depth=0.02, location=(0, 0, 0.065))
    oval = bpy.context.active_object
    oval.scale = (0.46, 0.3, 1)
    oval.data.materials.append(M(name + "_oval", C("#FFF6EA")))
    bpy.ops.object.shade_smooth()
    # üst ve alt kenarda dalgalı şeritler (her biri kısa kil parçalarından)
    for side, y0 in (("ust", H / 2 - 0.13), ("alt", -H / 2 + 0.13)):
        n = 28
        for k in range(n):
            x = -W / 2 + 0.12 + k * (W - 0.24) / (n - 1)
            y = y0 + 0.04 * math.sin(k / n * 4 * math.pi)
            bump(f"{name}_{side}{k}", x, y, 0.07, 0.03, accent, 0.4)
    # köşelerde basit çiçek motifi (5 yaprak + orta)
    for cx, cy in ((-0.78, 0.0), (0.78, 0.0)):
        for p in range(5):
            a = 2 * math.pi * p / 5
            bump(f"{name}_cicek{cx}{p}", cx + 0.08 * math.cos(a), cy + 0.08 * math.sin(a), 0.07, 0.055, accent, 0.4)
        bump(f"{name}_cicek{cx}o", cx, cy, 0.075, 0.045, "#FFF6EA", 0.45)


# ---------- pizza ve kadran ----------
def pizza(name: str) -> None:
    disc(name + "_hamur", 1.0, 0.1, 0.0, "#E3A75A")
    ring(name + "_kenar", 0.93, 0.085, 0.12, "#D08F43")
    disc(name + "_sos", 0.86, 0.11, 0.0, "#D9452F")
    disc(name + "_peynir", 0.8, 0.12, 0.0, "#F4C94F")  # düz üst: sucuklar gömülmesin
    spots = [(0.0, 0.0)] + [(0.42 * math.cos(2 * math.pi * k / 3 + 0.3), 0.42 * math.sin(2 * math.pi * k / 3 + 0.3)) for k in range(3)] \
        + [(0.62 * math.cos(2 * math.pi * k / 6 + 0.9), 0.62 * math.sin(2 * math.pi * k / 6 + 0.9)) for k in range(6)]
    for k, (x, y) in enumerate(spots):  # tam 10 sucuk
        disc(f"{name}_sucuk{k}", 0.11, 0.04, 0.12, "#B8312A", segments=48, x=x, y=y)


def clock_face(name: str) -> None:
    disc(name + "_yuz", 0.9, 0.08, 0.0, "#FFF4DE")
    ring(name + "_cerceve", 0.92, 0.1, 0.07, "#2FA39A")


# ---------- 050: çevre ızgarası ve simetri ----------
U = 0.36  # birim kare


def grid_paper(name: str, nx: int, ny: int) -> None:
    W, H = nx * U, ny * U
    slab(name + "_kagit", W + 0.08, H + 0.08, 0.03, 0, 0, 0, "#FBF8EF", bevel=0.015)
    for i in range(nx + 1):
        slab(f"{name}_dik{i}", 0.012, H, 0.008, -W / 2 + i * U, 0, 0.03, "#9FC3E6", bevel=0.002)
    for j in range(ny + 1):
        slab(f"{name}_yatay{j}", W, 0.012, 0.008, 0, -H / 2 + j * U, 0.03, "#9FC3E6", bevel=0.002)


def grid_shape(name: str, w: int, h: int, color: str, paper: tuple = (7, 6)) -> None:
    grid_paper(name, *paper)
    # şekil ızgaraya oturur: sol-alt köşe bir kare çizgisinde
    ox = -paper[0] * U / 2 + U * ((paper[0] - w) // 2)
    oy = -paper[1] * U / 2 + U * ((paper[1] - h) // 2)
    slab(name + "_sekil", w * U - 0.02, h * U - 0.02, 0.07, ox + w * U / 2, oy + h * U / 2, 0.04, color, bevel=0.02)
    for i in range(1, w):  # birim kareler sayılabilsin: şekil üstünde ince ayraçlar
        slab(f"{name}_ad{i}", 0.014, h * U - 0.06, 0.012, ox + i * U, oy + h * U / 2, 0.11, "#5A5A64", bevel=0.003)
    for j in range(1, h):
        slab(f"{name}_ay{j}", w * U - 0.06, 0.014, 0.012, ox + w * U / 2, oy + j * U, 0.11, "#5A5A64", bevel=0.003)


YELLOW, MINT, CORAL = "#F6D66A", "#9EDDB8", "#F2846F"
SQ = [(-0.8, -0.8), (0.8, -0.8), (0.8, 0.8), (-0.8, 0.8)]
RECT = [(-1.1, -0.6), (1.1, -0.6), (1.1, 0.6), (-1.1, 0.6)]


def sym_square(name, diag=False, off=False):
    flat_poly(name, SQ, 0.16, 0.0, YELLOW)
    if diag:
        dashed(name + "_cizgi", (-0.74, -0.74), (0.74, 0.74), 0.17)
    if off:
        dashed(name + "_cizgi", (-0.25, -0.76), (0.45, 0.76), 0.17)


def sym_rect(name, diag=False):
    flat_poly(name, RECT, 0.16, 0.0, MINT)
    if diag:
        dashed(name + "_cizgi", (-1.04, -0.54), (1.04, 0.54), 0.17, n=11)


def sym_house(name):
    flat_poly(name + "_govde", [(-0.7, -0.9), (0.7, -0.9), (0.7, 0.3), (-0.7, 0.3)], 0.16, 0.0, "#F7C76B")
    flat_poly(name + "_cati", [(-0.9, 0.3), (0.9, 0.3), (0.0, 1.1)], 0.18, 0.0, "#E5675A")
    flat_poly(name + "_kapi", [(-0.18, -0.9), (0.18, -0.9), (0.18, -0.3), (-0.18, -0.3)], 0.2, 0.0, "#8A5A3C")


def lopsided_kite(name):
    flat_poly(name, [(0.0, 1.0), (0.75, 0.25), (0.05, -0.85), (-0.38, 0.05)], 0.16, 0.0, "#7FB7EC")
    # kuyruk yalnızca bir yana kıvrılır
    for k in range(9):
        t = k / 8
        x = 0.05 + 0.55 * t + 0.12 * math.sin(t * 5)
        y = -0.85 - 0.35 * t
        bump(f"{name}_kuyruk{k}", x, y, 0.06, 0.045, "#F2846F", 0.5)


ITEMS = {**{k: ("010-faz3-sablonlar", (lambda k=k, v=v: coin(k, *v))) for k, v in COINS.items()},
         **{k: ("010-faz3-sablonlar", (lambda k=k, v=v: banknote(k, *v))) for k, v in NOTES.items()},
         "item.yiyecek.pizza": ("010-faz3-sablonlar", lambda: pizza("pizza")),
         "ui.clock_face": ("010-faz3-sablonlar", lambda: clock_face("kadran")),
         "item.cevre.dikdortgen_3x2": ("050-g3-matematik-nesneler", lambda: grid_shape("izgara", 3, 2, CORAL)),
         "item.cevre.kare_3": ("050-g3-matematik-nesneler", lambda: grid_shape("izgara", 3, 3, "#4FB9AF")),
         "item.simetri.kare": ("050-g3-matematik-nesneler", lambda: sym_square("kare")),
         "item.simetri.dikdortgen": ("050-g3-matematik-nesneler", lambda: sym_rect("dikdortgen")),
         "item.simetri.daire": ("050-g3-matematik-nesneler", lambda: flat_poly("daire", bg["regular"](96, 0.85), 0.16, 0.0, CORAL)),
         "item.simetri.kare_kosegen": ("050-g3-matematik-nesneler", lambda: sym_square("kare", diag=True)),
         "item.simetri.dikdortgen_kosegen": ("050-g3-matematik-nesneler", lambda: sym_rect("dikdortgen", diag=True)),
         "item.simetri.kare_yamuk_cizgi": ("050-g3-matematik-nesneler", lambda: sym_square("kare", off=True)),
         "item.simetri.ev": ("050-g3-matematik-nesneler", lambda: sym_house("ev")),
         "item.simetri.ruzgar_gulu": ("050-g3-matematik-nesneler", lambda: lopsided_kite("ucurtma")),
         }


def top_camera(ratio_w: int, ratio_h: int) -> None:
    sc = bpy.context.scene
    bpy.context.view_layer.update()
    dg = bpy.context.evaluated_depsgraph_get()
    xs, ys = [], []
    for ob in [o for o in sc.objects if o.type == "MESH"]:
        ev = ob.evaluated_get(dg)
        for c in ev.bound_box:
            w = ev.matrix_world @ Vector(c)
            xs.append(w.x)
            ys.append(w.y)
    cx, cy = (min(xs) + max(xs)) / 2, (min(ys) + max(ys)) / 2
    span = max((max(xs) - min(xs)) / ratio_w * ratio_h, max(ys) - min(ys))
    cam_d = bpy.data.cameras.new("cam")
    cam_d.type = "ORTHO"
    cam_d.ortho_scale = span * 1.03 * (ratio_w / ratio_h if ratio_w > ratio_h else 1)
    cam = bpy.data.objects.new("cam", cam_d)
    sc.collection.objects.link(cam)
    sc.camera = cam
    cam.location = (cx, cy, 10)
    cam.rotation_euler = (0, 0, 0)  # tam üstten (kadran için "tam önden" ile aynı)


def main() -> None:
    for key, (batch, build) in ITEMS.items():
        if ONLY and key not in ONLY:
            continue
        bg["reset_scene"](SAMPLES)
        sc = bpy.context.scene
        sc.view_settings.exposure = -0.7
        note = key.startswith("item.para.tl_") and key != "item.para.tl_1"
        sc.render.resolution_x = RES
        sc.render.resolution_y = RES // 2 if note else RES
        build()
        top_camera(2 if note else 1, 1)
        it = {i.key: i for i in parse_batch((REPO / "asset-requests" / f"{batch}.md").read_text(encoding="utf-8"))}[key]
        out = REPO / "build" / "imagegen" / batch / key
        out.mkdir(parents=True, exist_ok=True)
        sc.render.filepath = str(out / "s0_blender.png")
        bpy.ops.render.render(write_still=True)
        meta = {"key": key, "target": it.path, "batch": batch + ".md", "number": it.number,
                "model": "blender-procedural", "model_license": "n/a (prosedürel, CC BY 4.0 içerik)",
                "blender": ".".join(map(str, bpy.app.version)), "generator": "tools/imagegen/blender_flat_items.py",
                "seed": 0, "size": [sc.render.resolution_x, sc.render.resolution_y], "prompt": it.prompt,
                "references": [], "background_removed": False, "trim": True}
        (out / "s0_blender.json").write_text(json.dumps(meta, ensure_ascii=False, indent=2), encoding="utf-8")
        print("DÜZ", it.number, key, flush=True)


main()
