"""assets/images altındaki görsellerin Godot içe aktarma ayarlarını APK boyut bütçesine göre ayarlar.

Kaynak PNG'ler repoda olduğu gibi kalır; yalnızca pakete giren doku küçülür:
kayıplı WebP (kalite 0.8) ve klasöre göre uzun kenar sınırı. Oyun görselleri
EXPAND_IGNORE_SIZE + KEEP_ASPECT ile gösterdiği için yerleşim çözünürlükten bağımsızdır.

Kullanım (repo kökünden), ardından yeniden içe aktar:
    uv run --project tools/imagegen python tools/imagegen/import_presets.py
    godot --headless --path . --import
"""

import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
LOSSY_QUALITY = 0.8

# ilk klasör → uzun kenar sınırı (px). Telefonda bir nesne kartı birkaç yüz pikseli geçmez.
SIZE_LIMITS = {
    "characters": 768,
    "regions": 2048,
    "map": 2048,
}
DEFAULT_LIMIT = 512
# items/ altındaki geniş sahneler (16:9 "Sahne: ..." görselleri) ekranın büyük kısmını kaplar
SCENE_LIMIT = 1280
WIDE_RATIO = 1.5


def preset_for(path: str, size: tuple[int, int] | None = None) -> dict:
    parts = Path(path).parts
    folder = parts[parts.index("images") + 1] if "images" in parts else ""
    limit = SIZE_LIMITS.get(folder, DEFAULT_LIMIT)
    if size and folder not in SIZE_LIMITS and size[0] >= WIDE_RATIO * size[1]:
        limit = SCENE_LIMIT
    return {
        "compress/mode": 1,
        "compress/lossy_quality": LOSSY_QUALITY,
        "process/size_limit": limit,
    }


def _png_size(path: Path) -> tuple[int, int] | None:
    """PNG başlığından genişlik/yükseklik (Pillow gerektirmez)."""
    try:
        head = path.read_bytes()[:24]
    except OSError:
        return None
    if head[:8] != b"\x89PNG\r\n\x1a\n":
        return None
    return int.from_bytes(head[16:20], "big"), int.from_bytes(head[20:24], "big")


def _fmt(value: object) -> str:
    return str(value).lower() if isinstance(value, bool) else str(value)


def apply_preset(import_file: Path, preset: dict) -> bool:
    """[params] bölümündeki anahtarları ayarlar; değişiklik olduysa True döner."""
    text = import_file.read_text(encoding="utf-8")
    new = text
    for key, value in preset.items():
        line = f"{key}={_fmt(value)}"
        pattern = re.compile(rf"^{re.escape(key)}=.*$", re.M)
        if pattern.search(new):
            new = pattern.sub(line, new)
        else:
            new = new.rstrip("\n") + "\n" + line + "\n"
    if new != text:
        import_file.write_text(new, encoding="utf-8")
        return True
    return False


def main() -> None:
    files = sorted((REPO / "assets" / "images").rglob("*.png.import"))
    changed = 0
    for f in files:
        png = Path(str(f).removesuffix(".import"))
        changed += apply_preset(f, preset_for(str(png.relative_to(REPO)), _png_size(png)))
    print(f"{changed}/{len(files)} içe aktarma dosyası güncellendi")
    if changed:
        print("Şimdi yeniden içe aktar: godot --headless --path . --import", file=sys.stderr)


if __name__ == "__main__":
    main()
