import unittest

from batch_parser import parse_batch

NEW_FORMAT = """# 040 · Cisimler

## Promptlar

### 4. `assets/images/items/cisim/ucgen_prizma.png`

- **Oran:** 1:1
- **Referans görsel:** yok
- **Açıklama:** Üçgen prizma

```
a plain triangular prism, soft pastel purple clay. isolated on a plain solid light grey background (#EEEEEE), no text.
```

### 5. `assets/images/regions/sayi_ormani/bg.png`

- **Oran:** 16:9
- **Referans görsel:** `assets/images/characters/bilge/sheet.png` (Bilge karakter sayfası)
- **Açıklama:** Orman

```
3D claymation diorama of a forest, no text.
```
"""

OLD_FORMAT = """# Faz 1 paketi

### 3. Tekrar dinle ikonu.

- [ ] **Dosya:** `assets/images/ui/replay.png`
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a circular arrow, turquoise clay, isolated on a plain solid light grey background (#EEEEEE).
```

### 4. Harita.

- [ ] **Dosya:** `assets/images/map/island.png`
  **Oran:** 16:9 · **Arka plan:** KALSIN · **Referans:** yok

```
island diorama, isolated on a plain solid light grey background (#EEEEEE).
```
"""


class ParseBatchTest(unittest.TestCase):
    def test_new_format_fields(self) -> None:
        items = parse_batch(NEW_FORMAT)
        self.assertEqual([i.number for i in items], [4, 5])
        prism = items[0]
        self.assertEqual(prism.path, "assets/images/items/cisim/ucgen_prizma.png")
        self.assertEqual(prism.ratio, "1:1")
        self.assertIsNone(prism.reference)
        self.assertTrue(prism.prompt.startswith("a plain triangular prism"))
        self.assertTrue(prism.remove_background)

    def test_new_format_reference_and_scene(self) -> None:
        scene = parse_batch(NEW_FORMAT)[1]
        self.assertEqual(scene.ratio, "16:9")
        self.assertEqual(scene.reference, "assets/images/characters/bilge/sheet.png")
        # gri zemin istenmeyen sahnelerde arka plan kalır
        self.assertFalse(scene.remove_background)

    def test_old_format_background_flag_wins(self) -> None:
        items = parse_batch(OLD_FORMAT)
        self.assertEqual([i.path for i in items], ["assets/images/ui/replay.png", "assets/images/map/island.png"])
        self.assertTrue(items[0].remove_background)
        # prompt gri zemin istese de "KALSIN" açıkça yazılmışsa arka plan silinmez
        self.assertFalse(items[1].remove_background)

    def test_sections_without_prompt_are_skipped(self) -> None:
        text = "### 1. `assets/images/ui/x.png`\n\n- **Oran:** 1:1\n\nkod bloğu yok\n"
        self.assertEqual(parse_batch(text), [])

    def test_key_from_path(self) -> None:
        prism = parse_batch(NEW_FORMAT)[0]
        self.assertEqual(prism.key, "item.cisim.ucgen_prizma")


if __name__ == "__main__":
    unittest.main()
