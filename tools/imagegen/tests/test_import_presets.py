import tempfile
import unittest
from pathlib import Path

from import_presets import apply_preset, preset_for

SAMPLE = """[remap]

importer="texture"
type="CompressedTexture2D"

[deps]

source_file="res://assets/images/items/hayvan/kedi.png"

[params]

compress/mode=0
compress/high_quality=false
compress/lossy_quality=0.7
mipmaps/generate=false
process/size_limit=0
"""


class PresetForTest(unittest.TestCase):
    def test_sprites_are_capped_at_512(self) -> None:
        self.assertEqual(preset_for("assets/images/items/hayvan/kedi.png")["process/size_limit"], 512)
        self.assertEqual(preset_for("assets/images/stickers/matematik/elma.png")["process/size_limit"], 512)

    def test_characters_and_backgrounds_keep_more_pixels(self) -> None:
        self.assertEqual(preset_for("assets/images/characters/bilge/idle.png")["process/size_limit"], 768)
        self.assertEqual(preset_for("assets/images/regions/agac_ev/bg.png")["process/size_limit"], 2048)

    def test_everything_is_lossy(self) -> None:
        self.assertEqual(preset_for("assets/images/ui/star.png")["compress/mode"], 1)


class ApplyPresetTest(unittest.TestCase):
    def test_rewrites_params_and_reports_change(self) -> None:
        with tempfile.TemporaryDirectory() as d:
            p = Path(d) / "kedi.png.import"
            p.write_text(SAMPLE, encoding="utf-8")
            changed = apply_preset(p, preset_for("assets/images/items/hayvan/kedi.png"))
            text = p.read_text(encoding="utf-8")
        self.assertTrue(changed)
        self.assertIn("compress/mode=1\n", text)
        self.assertIn("process/size_limit=512\n", text)
        self.assertIn("compress/lossy_quality=0.8\n", text)
        self.assertIn('source_file="res://assets/images/items/hayvan/kedi.png"', text)

    def test_is_idempotent(self) -> None:
        with tempfile.TemporaryDirectory() as d:
            p = Path(d) / "kedi.png.import"
            p.write_text(SAMPLE, encoding="utf-8")
            preset = preset_for("assets/images/items/hayvan/kedi.png")
            apply_preset(p, preset)
            self.assertFalse(apply_preset(p, preset))


if __name__ == "__main__":
    unittest.main()
