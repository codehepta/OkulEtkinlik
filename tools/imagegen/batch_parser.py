"""asset-requests/NNN-*.md parti dosyalarını görsel öğe listesine çevirir.

İki biçimi de okur:
- yeni: "### N. `assets/images/...png`" başlığı + `- **Oran:**`, `- **Referans görsel:**` satırları
- eski (FAZ1 paketi): `### N. Açıklama` başlığı + `**Dosya:**`, `**Oran:** · **Arka plan:** · **Referans:**` satırı
"""

import re
from dataclasses import dataclass

_PATH_RE = re.compile(r"`(assets/images/[a-z0-9_/]+\.png)`")
_RATIO_RE = re.compile(r"\*\*Oran:\*\*\s*([0-9]+:[0-9]+)")
_REF_RE = re.compile(r"\*\*Referans(?: görsel)?:\*\*\s*`(assets/[^`]+\.png)`")
_BG_RE = re.compile(r"\*\*Arka plan:\*\*\s*(SİL|KALSIN)")
_CODE_RE = re.compile(r"^```[a-z]*\n(.*?)\n```", re.S | re.M)
_HEADING_RE = re.compile(r"^### (\d+)\.", re.M)
_GREY_BG = "plain solid light grey background"

# assets/images altındaki ilk klasör → mantıksal anahtar öneki (docs/assets/naming.md)
_KEY_PREFIX = {
    "characters": "char",
    "avatars": "avatar",
    "regions": "region",
    "map": "map",
    "items": "item",
    "ui": "ui",
    "stickers": "st",
    "decor": "decor",
}


@dataclass(frozen=True)
class BatchItem:
    number: int
    path: str
    ratio: str
    reference: str | None
    prompt: str
    remove_background: bool

    @property
    def key(self) -> str:
        parts = self.path.removeprefix("assets/images/").removesuffix(".png").split("/")
        return ".".join([_KEY_PREFIX.get(parts[0], parts[0])] + parts[1:])


def parse_batch(text: str) -> list[BatchItem]:
    items: list[BatchItem] = []
    starts = [m.start() for m in _HEADING_RE.finditer(text)] + [len(text)]
    for begin, end in zip(starts, starts[1:]):
        section = text[begin:end]
        number = int(_HEADING_RE.match(section).group(1))
        path_match = _PATH_RE.search(section)
        code_match = _CODE_RE.search(section)
        if path_match is None or code_match is None:
            continue
        prompt = " ".join(code_match.group(1).split())
        ratio_match = _RATIO_RE.search(section)
        ref_match = _REF_RE.search(section)
        bg_match = _BG_RE.search(section)
        if bg_match is not None:
            remove_bg = bg_match.group(1) == "SİL"
        else:
            remove_bg = _GREY_BG in prompt
        items.append(BatchItem(
            number=number,
            path=path_match.group(1),
            ratio=ratio_match.group(1) if ratio_match else "1:1",
            reference=ref_match.group(1) if ref_match else None,
            prompt=prompt,
            remove_background=remove_bg,
        ))
    return items
