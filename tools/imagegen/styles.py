"""docs/assets/style-guide.md §2'deki sabit stil blokları ve kil → STYLE_REAL dönüşümü.

Bloklar ayrıştırıcının yaptığı gibi tek satıra indirilmiş hâlde tutulur; rehberle eşitliği
tests/test_styles.py denetler. İnsansız öğelerde kil adayının yanında aynı tohumla kilsiz
(STYLE_REAL) aday üretilir (style-guide §1.9).
"""

from batch_parser import BatchItem

STYLE_SPRITE = (
    "3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, "
    "smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel "
    "colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light "
    "grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, "
    "no watermark."
)
STYLE_SCENE = (
    "3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, "
    "subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, "
    "cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game "
    "elements, no characters unless described, no text, no letters, no numbers, no watermark."
)
STYLE_ICON = (
    "3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded "
    "shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a "
    "plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark."
)
STYLE_REAL = (
    "Clean realistic studio photograph-style render, true-to-life materials and colors, soft even lighting, simple "
    "and easy to read at small size, child-friendly, single subject centered and fully visible, isolated on a plain "
    "solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, "
    "no numbers, no watermark."
)

STYLE_BLOCKS: dict[str, str] = {
    "STYLE_SPRITE": STYLE_SPRITE,
    "STYLE_SCENE": STYLE_SCENE,
    "STYLE_ICON": STYLE_ICON,
    "STYLE_REAL": STYLE_REAL,
}

# STYLE_REAL tek nesne bloğudur; yalnızca tek nesne/ikon kil blokları onunla değiştirilir.
# Sahne (STYLE_SCENE) gri zeminli tek nesneye dönüşeceği için değiştirilmez.
_SWAPPABLE = ("STYLE_SPRITE", "STYLE_ICON")

REAL_SUFFIX = "_real"


def prompt_style(prompt: str) -> str | None:
    """Prompt'un içerdiği stil bloğunun adı (yoksa None)."""
    for name, block in STYLE_BLOCKS.items():
        if block in prompt:
            return name
    return None


def real_prompt(prompt: str) -> str | None:
    """Kil nesne/ikon bloğunu STYLE_REAL ile değiştirir; değiştirilemiyorsa None."""
    name = prompt_style(prompt)
    if name not in _SWAPPABLE:
        return None
    return prompt.replace(STYLE_BLOCKS[name], STYLE_REAL)


def wants_real_variant(item: BatchItem, dual_style: bool) -> bool:
    """İnsanlı görseller karakter tutarlılığı için kilde kalır; bayrak yalnızca işaretsiz öğeleri genişletir."""
    return item.has_human is False or (dual_style and item.has_human is None)


def variants_for(item: BatchItem, dual_style: bool) -> list[tuple[str, str]]:
    """Öğe için üretilecek (dosya son eki, prompt) çiftleri: kil "" ve/veya gerçekçi "_real"."""
    prompt = item.prompt
    if item.style == "STYLE_REAL" and prompt_style(prompt) != "STYLE_REAL":
        converted = real_prompt(prompt)
        if converted is not None:
            prompt = converted
    if prompt_style(prompt) == "STYLE_REAL":
        return [(REAL_SUFFIX, prompt)]
    variants = [("", prompt)]
    real = real_prompt(prompt) if wants_real_variant(item, dual_style) else None
    if real is not None:
        variants.append((REAL_SUFFIX, real))
    return variants
