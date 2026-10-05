import tempfile
import unittest
from pathlib import Path

from PIL import Image

from approve import prepare
from batch_parser import BatchItem
from generate import DutyCycle, choose_mask, flood_foreground, is_geometric, select_items


def _item(n: int) -> BatchItem:
    return BatchItem(number=n, path=f"assets/images/items/x/{n}.png", ratio="1:1", reference=None, prompt="p",
                     remove_background=True)


class SelectItemsTest(unittest.TestCase):
    def test_ranges_and_singles(self) -> None:
        items = [_item(n) for n in range(1, 11)]
        self.assertEqual([i.number for i in select_items(items, "2-4,9")], [2, 3, 4, 9])

    def test_empty_spec_keeps_all(self) -> None:
        items = [_item(1), _item(2)]
        self.assertEqual(select_items(items, None), items)


class PrepareTest(unittest.TestCase):
    def test_trims_transparent_border_and_caps_long_side(self) -> None:
        im = Image.new("RGBA", (2000, 2000), (0, 0, 0, 0))
        im.paste((255, 0, 0, 255), (500, 900, 1500, 1100))  # 1000x200 opak şerit
        with tempfile.TemporaryDirectory() as d:
            p = Path(d) / "a.png"
            im.save(p)
            out = prepare(p, trim=True)
        self.assertEqual(out.size, (1000, 200))

    def test_scene_is_not_trimmed_but_downscaled(self) -> None:
        im = Image.new("RGB", (1344, 768), (10, 20, 30))
        with tempfile.TemporaryDirectory() as d:
            p = Path(d) / "s.png"
            im.save(p)
            out = prepare(p, trim=False)
        self.assertEqual(out.size, (1024, 585))
        self.assertEqual(out.mode, "RGB")

    def test_untrimmed_sprite_keeps_canvas_and_alpha(self) -> None:
        im = Image.new("RGBA", (1024, 1024), (0, 0, 0, 0))
        im.paste((0, 0, 255, 255), (450, 450, 574, 574))  # boşlukta küçük kare
        with tempfile.TemporaryDirectory() as d:
            p = Path(d) / "k.png"
            im.save(p)
            out = prepare(p, trim=False)
        self.assertEqual(out.size, (1024, 1024))
        self.assertEqual(out.mode, "RGBA")
        self.assertEqual(out.getpixel((0, 0))[3], 0)


class GeometricTest(unittest.TestCase):
    def test_geometric_prefixes_go_to_blender(self) -> None:
        self.assertTrue(is_geometric("item.sekil.altigen"))
        self.assertTrue(is_geometric("item.cisim.kure"))
        self.assertTrue(is_geometric("item.blok.onluk"))
        self.assertFalse(is_geometric("item.hayvan.kedi"))
        self.assertFalse(is_geometric("item.yapi.ev"))


class DutyCycleTest(unittest.TestCase):
    def test_rests_after_work_window_and_resets(self) -> None:
        slept: list[float] = []
        cycle = DutyCycle(work_s=600, rest_s=900, sleep=slept.append)
        cycle.add_work(400)
        self.assertFalse(cycle.maybe_rest())
        cycle.add_work(250)
        self.assertTrue(cycle.maybe_rest())
        self.assertEqual(slept, [900])
        cycle.add_work(100)
        self.assertFalse(cycle.maybe_rest())

    def test_disabled_when_work_window_is_zero(self) -> None:
        slept: list[float] = []
        cycle = DutyCycle(work_s=0, rest_s=900, sleep=slept.append)
        cycle.add_work(10_000)
        self.assertFalse(cycle.maybe_rest())
        self.assertEqual(slept, [])


class CutoutFallbackTest(unittest.TestCase):
    def _plate(self) -> Image.Image:
        # açık gri zemin üzerinde beyaz tabak (BiRefNet'in kaçırdığı durum)
        im = Image.new("RGB", (200, 200), (228, 228, 230))
        im.paste((246, 246, 246), (50, 50, 150, 150))
        return im

    def test_flood_foreground_finds_light_object_on_grey(self) -> None:
        mask = flood_foreground(self._plate())
        self.assertEqual(mask.getpixel((100, 100)), 255)
        self.assertEqual(mask.getpixel((5, 5)), 0)
        self.assertEqual(mask.getbbox(), (50, 50, 150, 150))

    def test_choose_mask_falls_back_when_model_mask_is_tiny(self) -> None:
        flood = flood_foreground(self._plate())
        tiny = Image.new("L", (200, 200), 0)
        tiny.paste(255, (90, 90, 110, 110))  # yalnızca "gözler"
        chosen, used_fallback = choose_mask(tiny, flood)
        self.assertTrue(used_fallback)
        self.assertEqual(chosen.getpixel((60, 60)), 255)

    def test_choose_mask_keeps_model_mask_when_plausible(self) -> None:
        flood = flood_foreground(self._plate())
        good = Image.new("L", (200, 200), 0)
        good.paste(255, (52, 52, 148, 148))
        chosen, used_fallback = choose_mask(good, flood)
        self.assertFalse(used_fallback)
        self.assertIs(chosen, good)


if __name__ == "__main__":
    unittest.main()
