import re
import unittest

from batch_parser import BatchItem
from generate import REPO
from styles import STYLE_BLOCKS, STYLE_ICON, STYLE_REAL, STYLE_SCENE, STYLE_SPRITE, prompt_style, real_prompt, \
    variants_for

SUBJECT = "A clear drinking glass with sand at the bottom. It has no face, no eyes and no mouth."


def _item(prompt: str, has_human: bool | None = None, style: str | None = None) -> BatchItem:
    return BatchItem(number=1, path="assets/images/items/fen/bardak.png", ratio="1:1", reference=None,
                     prompt=prompt, remove_background=True, style=style, has_human=has_human)


class StyleBlocksMatchGuideTest(unittest.TestCase):
    """Bloklar style-guide.md'den kopyalandı; rehber değişirse bu test kırılır."""

    def test_blocks_match_style_guide(self) -> None:
        guide = (REPO / "docs" / "assets" / "style-guide.md").read_text(encoding="utf-8")
        found = {m.group(1): " ".join(m.group(2).split())
                 for m in re.finditer(r"^### 2\.\d `(STYLE_[A-Z]+)`.*?\n```\n(.*?)\n```", guide, re.S | re.M)}
        for name in ("STYLE_SPRITE", "STYLE_SCENE", "STYLE_ICON"):
            self.assertEqual(found[name], STYLE_BLOCKS[name], name)
        if "STYLE_REAL" in found:  # PR #56 birleşince rehberde de olur
            self.assertEqual(found["STYLE_REAL"], STYLE_BLOCKS["STYLE_REAL"])


class PromptStyleTest(unittest.TestCase):
    def test_detects_each_block(self) -> None:
        for name, block in STYLE_BLOCKS.items():
            self.assertEqual(prompt_style(f"{SUBJECT} {block}"), name)

    def test_unknown_prompt(self) -> None:
        self.assertIsNone(prompt_style(SUBJECT))


class RealPromptTest(unittest.TestCase):
    def test_sprite_block_is_swapped_and_subject_kept(self) -> None:
        out = real_prompt(f"{SUBJECT} {STYLE_SPRITE}")
        self.assertEqual(out, f"{SUBJECT} {STYLE_REAL}")
        self.assertNotIn("claymation", out)

    def test_icon_block_is_swapped(self) -> None:
        self.assertEqual(real_prompt(f"{STYLE_ICON} {SUBJECT}"), f"{STYLE_REAL} {SUBJECT}")

    def test_real_prompt_keeps_grey_background_for_cutout(self) -> None:
        self.assertIn("plain solid light grey background", real_prompt(f"{SUBJECT} {STYLE_SPRITE}"))

    def test_scene_is_not_swapped(self) -> None:
        # STYLE_REAL tek nesne bloğudur (gri zemin); sahne arka planına uymaz
        self.assertIsNone(real_prompt(f"{SUBJECT} {STYLE_SCENE}"))

    def test_already_real_or_unknown_is_not_swapped(self) -> None:
        self.assertIsNone(real_prompt(f"{SUBJECT} {STYLE_REAL}"))
        self.assertIsNone(real_prompt(SUBJECT))


class VariantsTest(unittest.TestCase):
    def test_clay_only_by_default(self) -> None:
        self.assertEqual(variants_for(_item(f"{SUBJECT} {STYLE_SPRITE}"), dual_style=False),
                         [("", f"{SUBJECT} {STYLE_SPRITE}")])

    def test_no_human_marker_adds_real_variant(self) -> None:
        clay = f"{SUBJECT} {STYLE_SPRITE}"
        self.assertEqual(variants_for(_item(clay, has_human=False), dual_style=False),
                         [("", clay), ("_real", f"{SUBJECT} {STYLE_REAL}")])

    def test_dual_flag_adds_real_variant_for_unmarked_items(self) -> None:
        clay = f"{SUBJECT} {STYLE_SPRITE}"
        self.assertEqual([s for s, _ in variants_for(_item(clay), dual_style=True)], ["", "_real"])

    def test_items_with_humans_stay_clay_even_with_flag(self) -> None:
        clay = f"{SUBJECT} {STYLE_SPRITE}"
        self.assertEqual([s for s, _ in variants_for(_item(clay, has_human=True), dual_style=True)], [""])

    def test_scene_without_human_stays_clay(self) -> None:
        scene = f"{SUBJECT} {STYLE_SCENE}"
        self.assertEqual(variants_for(_item(scene, has_human=False), dual_style=True), [("", scene)])

    def test_real_prompt_is_single_real_variant(self) -> None:
        real = f"{SUBJECT} {STYLE_REAL}"
        self.assertEqual(variants_for(_item(real, has_human=False), dual_style=True), [("_real", real)])

    def test_style_real_marker_converts_clay_prompt(self) -> None:
        # "Stil: STYLE_REAL" satırı varken prompt hâlâ kil bloğuyla bitiyorsa tek aday gerçekçi üretilir
        item = _item(f"{SUBJECT} {STYLE_SPRITE}", style="STYLE_REAL")
        self.assertEqual(variants_for(item, dual_style=False), [("_real", f"{SUBJECT} {STYLE_REAL}")])


if __name__ == "__main__":
    unittest.main()
