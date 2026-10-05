import tempfile
import unittest
from pathlib import Path

from PIL import Image

from approve import prepare
from batch_parser import BatchItem
from generate import select_items


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


if __name__ == "__main__":
    unittest.main()
