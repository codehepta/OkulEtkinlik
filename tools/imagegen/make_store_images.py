"""Mağaza görselleri: tools/store_screenshots.gd çıktısından (build/store/<cihaz>/) seçilen kareleri
fastlane klasörlerine koyar; Play simgesi ve öne çıkan görseli onaylı görsellerden kurar (yeni görsel üretilmez,
üzerlerinde yazı yoktur).

Çıktılar:
- fastlane/metadata/android/en-US/images/: icon.png (512), featureGraphic.jpg (1024×500),
  phoneScreenshots/, sevenInchScreenshots/, tenInchScreenshots/ (F-Droid bunları okur; en-US öbür
  dillerin yedeğidir, Play Console'a elle yüklenir)
- fastlane/screenshots/tr/: App Store (iPhone 6.9" ve iPad 13"; cihaz boyuttan anlaşılır)

Kullanım: önce dört cihaz için tools/store_screenshots.gd, sonra
    uv run --project tools/imagegen python tools/imagegen/make_store_images.py
"""
from pathlib import Path
from PIL import Image, ImageFilter

R = Path(__file__).resolve().parents[2]
SHOTS = R / "build/store"
ANDROID = R / "fastlane/metadata/android/en-US/images"
IOS = R / "fastlane/screenshots/tr"
JPEG_QUALITY = 90

# Sıra mağazadaki sıradır; ilk üç kare arama sonucunda görünür.
PLAY = ["01_acilis", "02_harita", "04_sayma", "06_eslestirme_fen", "08_saat_para", "10_kodlama",
        "06b_senaryo_fen", "14_veli_paneli"]
APPLE = PLAY + ["11_terazi", "13_album"]


def save_jpeg(src: Path, dst: Path) -> None:
    dst.parent.mkdir(parents=True, exist_ok=True)
    Image.open(src).convert("RGB").save(dst, "JPEG", quality=JPEG_QUALITY, optimize=True)


def screenshots() -> None:
    for d in (ANDROID / "phoneScreenshots", ANDROID / "sevenInchScreenshots", ANDROID / "tenInchScreenshots", IOS):
        if d.exists():
            for f in d.glob("*.jpg"):
                f.unlink()
    for i, name in enumerate(PLAY, 1):
        save_jpeg(SHOTS / "android_phone" / f"{name}.png", ANDROID / "phoneScreenshots" / f"{i}.jpg")
        for sub in ("sevenInchScreenshots", "tenInchScreenshots"):
            save_jpeg(SHOTS / "android_tablet" / f"{name}.png", ANDROID / sub / f"{i}.jpg")
    for device in ("iphone_69", "ipad_13"):
        for i, name in enumerate(APPLE, 1):
            save_jpeg(SHOTS / device / f"{name}.png", IOS / f"{device}_{i:02d}_{name}.jpg")


def play_icon() -> None:
    Image.open(R / "assets/images/app_icon/icon_1024.png").convert("RGB").resize((512, 512), Image.LANCZOS) \
        .save(ANDROID / "icon.png")


def feature_graphic() -> None:
    """1024×500: ada haritası (yükseklik sığar, sağdaki boşluk haritanın deniz kenarı aynalanarak dolar)
    + el sallayan Bilge."""
    W, H = 1024, 500
    isl = Image.open(R / "assets/images/map/island.png").convert("RGBA")
    isl = isl.resize((round(isl.width * H / isl.height), H), Image.LANCZOS)
    c = Image.new("RGBA", (W, H))
    strip = isl.crop((isl.width - 140, 0, isl.width, H))
    for x0 in range(isl.width - 100, W, 140):
        c.alpha_composite(strip if (x0 // 140) % 2 else strip.transpose(Image.FLIP_LEFT_RIGHT), (x0, 0))
    c.alpha_composite(isl.crop((0, 0, isl.width - 60, H)), (-20, 0))
    b = Image.open(R / "assets/images/characters/bilge/wave.png").convert("RGBA")
    b = b.resize((round(b.width * 430 / b.height), 430), Image.LANCZOS)
    sh = Image.new("RGBA", b.size, (0, 0, 0, 0))
    sh.putalpha(b.getchannel("A").point(lambda a: int(a * 0.3)))
    sh = sh.filter(ImageFilter.GaussianBlur(8))
    bx, by = W - b.width - 40, H - 430 - 20
    c.alpha_composite(sh, (bx + 6, by + 8))
    c.alpha_composite(b, (bx, by))
    c.convert("RGB").save(ANDROID / "featureGraphic.jpg", "JPEG", quality=JPEG_QUALITY, optimize=True)


if __name__ == "__main__":
    ANDROID.mkdir(parents=True, exist_ok=True)
    screenshots()
    play_icon()
    feature_graphic()
    n = sum(1 for _ in ANDROID.rglob("*.*")) + sum(1 for _ in IOS.glob("*.jpg"))
    print(f"mağaza görselleri: {n} dosya")
