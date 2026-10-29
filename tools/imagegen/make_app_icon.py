"""Uygulama simgesi: onaylı Bilge görselinden (characters/bilge/happy.png) baş-göğüs kırpımı,
gökyüzü→ada yeşili geçişli zemin. Yeni görsel üretilmez; çıktılar assets/images/app_icon/ altına yazılır.
- icon_1024.png: iOS + proje simgesi (saydamlık yok; App Store şartı)
- android_main_192.png: eski Android simgesi
- android_{foreground,background,monochrome}_432.png: uyarlanabilir simge katmanları. Ön katmanda Bilge
  108 dp'lik tuvalin ortadaki güvenli alanına sığar; tek renk katman Bilge'nin silüetidir.
Kullanım: uv run --with pillow python tools/imagegen/make_app_icon.py"""
from pathlib import Path
from PIL import Image, ImageDraw, ImageFilter

R = Path(__file__).resolve().parents[2]
OUT = R / "assets/images/app_icon"
TOP, BOT = (132, 206, 235), (79, 178, 134)
bilge = Image.open(R / "assets/images/characters/bilge/happy.png").convert("RGBA")

def gradient(n: int) -> Image.Image:
    g = Image.new("RGBA", (n, n)); d = ImageDraw.Draw(g)
    for y in range(n):
        t = y / (n - 1)
        d.line([(0, y), (n, y)], fill=tuple(int(TOP[i] * (1 - t) + BOT[i] * t) for i in range(3)) + (255,))
    return g

def fit(im: Image.Image, box: float) -> Image.Image:
    s = box / max(im.size)
    return im.resize((round(im.width * s), round(im.height * s)), Image.LANCZOS)

def with_shadow(canvas: Image.Image, im: Image.Image, x: int, y: int) -> None:
    n = canvas.width
    sh = Image.new("RGBA", im.size, (0, 0, 0, 0)); sh.putalpha(im.getchannel("A").point(lambda a: int(a * 0.25)))
    sh = sh.filter(ImageFilter.GaussianBlur(n * 0.012))
    canvas.alpha_composite(sh, (x, y + int(n * 0.012))); canvas.alpha_composite(im, (x, y))

OUT.mkdir(parents=True, exist_ok=True)
# Tam simge: büst alttan taşar (kesik kenar görünmez).
full = gradient(1024)
b = fit(bilge.crop((0, 0, bilge.width, int(bilge.height * 0.78))), 1024 * 0.86)
with_shadow(full, b, (1024 - b.width) // 2, int(1024 * 0.16))
full.convert("RGB").save(OUT / "icon_1024.png")
full.convert("RGB").resize((192, 192), Image.LANCZOS).save(OUT / "android_main_192.png")

# Uyarlanabilir katmanlar (432 px = 108 dp @4x; maske ortadaki ≈72 dp'yi gösterir).
gradient(432).convert("RGB").save(OUT / "android_background_432.png")
whole = fit(bilge, 250)
pos = ((432 - whole.width) // 2, (432 - whole.height) // 2)
fg = Image.new("RGBA", (432, 432), (0, 0, 0, 0))
with_shadow(fg, whole, *pos)
fg.save(OUT / "android_foreground_432.png")
sil = Image.new("RGBA", whole.size, (255, 255, 255, 255)); sil.putalpha(whole.getchannel("A"))
mono = Image.new("RGBA", (432, 432), (0, 0, 0, 0)); mono.alpha_composite(sil, pos)
mono.save(OUT / "android_monochrome_432.png")
print("simge dosyaları:", sorted(p.name for p in OUT.glob("*.png")))
