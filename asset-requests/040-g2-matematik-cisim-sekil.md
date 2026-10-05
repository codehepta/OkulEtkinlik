# 040 · 2. sınıf Matematik: geometrik cisim ve şekiller

**Öncelik: YÜKSEK** (Faz 3d, `content/g2/matematik/u01.json`). Geometrik cisim modelleri (küp, kare prizma, dikdörtgen prizma, üçgen prizma, küre, silindir) ve düzlem şekiller (üçgen, kare, dikdörtgen, daire). Dönmüş ya da küçük çeşitleri, "yön ve büyüklük değişse de şekil aynı kalır" (MAT.2.3.4) turlarında kullanılır: çeşitler aynı rengi ve dokuyu korumalı, yalnızca yönü ya da boyutu değişmeli. Bu anahtarlar 1. ve 3. sınıf geometrisinde de ortak kullanılır.

Bu görseller gelene kadar oyun renkli yer tutucu kartın üstüne nesnenin adını yazar (`label.<anahtar>` metni); dosyayı tablodaki yola koymak yeterlidir, kod değişikliği gerekmez.

- Her görsel **tek nesne** olarak çizilir; oyun nesneyi kart içinde 128–300 px arasında gösterir.
- Sprite'ların arka planı silinir, şeffaf PNG kaydedilir. Sahne görsellerinde (16:9) arka plan kalır.
- Görselde yazı, harf, rakam, logo ya da marka yok.

Stil bloğu: `docs/assets/style-guide.md` → `STYLE_SPRITE` (promptların sonunda tam metin olarak yer alıyor).


## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/items/cisim/kup.png` | 1:1 | — | Küp |
| 2 | `assets/images/items/cisim/kare_prizma.png` | 1:1 | — | Kare prizma |
| 3 | `assets/images/items/cisim/dikdortgen_prizma.png` | 1:1 | — | Dikdörtgen prizma |
| 4 | `assets/images/items/cisim/ucgen_prizma.png` | 1:1 | — | Üçgen prizma |
| 5 | `assets/images/items/cisim/kure.png` | 1:1 | — | Küre |
| 6 | `assets/images/items/cisim/silindir.png` | 1:1 | — | Silindir |
| 7 | `assets/images/items/cisim/silindir_yatik.png` | 1:1 | — | Yatık silindir |
| 8 | `assets/images/items/cisim/kup_kucuk.png` | 1:1 | — | Küçük küp |
| 9 | `assets/images/items/sekil/ucgen.png` | 1:1 | — | Üçgen |
| 10 | `assets/images/items/sekil/ucgen_ters.png` | 1:1 | — | Ters üçgen |
| 11 | `assets/images/items/sekil/ucgen_kucuk.png` | 1:1 | — | Küçük üçgen |
| 12 | `assets/images/items/sekil/kare.png` | 1:1 | — | Kare |
| 13 | `assets/images/items/sekil/kare_egik.png` | 1:1 | — | Eğik kare |
| 14 | `assets/images/items/sekil/kare_kucuk.png` | 1:1 | — | Küçük kare |
| 15 | `assets/images/items/sekil/dikdortgen.png` | 1:1 | — | Dikdörtgen |
| 16 | `assets/images/items/sekil/dikdortgen_dik.png` | 1:1 | — | Dik dikdörtgen |
| 17 | `assets/images/items/sekil/daire.png` | 1:1 | — | Daire |
| 18 | `assets/images/items/sekil/daire_kucuk.png` | 1:1 | — | Küçük daire |

## Promptlar

### 1. `assets/images/items/cisim/kup.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Küp

```
a plain cube geometric solid model, all six faces equal squares, soft pastel blue clay, slightly turned to show three faces. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/items/cisim/kare_prizma.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kare prizma

```
a plain square prism geometric solid model, tall block with square top and bottom and four equal rectangular sides, soft pastel green clay, slightly turned to show three faces. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/items/cisim/dikdortgen_prizma.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dikdörtgen prizma

```
a plain rectangular prism (cuboid) geometric solid model, long brick-like block, soft pastel orange clay, slightly turned to show three faces. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 4. `assets/images/items/cisim/ucgen_prizma.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Üçgen prizma

```
a plain triangular prism geometric solid model, lying on a rectangular face with the triangle ends visible, soft pastel purple clay. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 5. `assets/images/items/cisim/kure.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Küre

```
a plain sphere geometric solid model, perfectly round ball shape without any pattern, soft pastel pink clay. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 6. `assets/images/items/cisim/silindir.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Silindir

```
a plain upright cylinder geometric solid model, round flat top and bottom, soft pastel yellow clay. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 7. `assets/images/items/cisim/silindir_yatik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yatık silindir

```
the same plain cylinder geometric solid model lying on its side, round ends facing left and right, soft pastel yellow clay. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 8. `assets/images/items/cisim/kup_kucuk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Küçük küp

```
a very small plain cube geometric solid model drawn small in the middle of a lot of empty space, soft pastel blue clay. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 9. `assets/images/items/sekil/ucgen.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Üçgen

```
a flat equilateral triangle cut out of thick clay, pointing up, soft coral red, simple and flat, seen from the front. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 10. `assets/images/items/sekil/ucgen_ters.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ters üçgen

```
a flat equilateral triangle cut out of thick clay, pointing down (upside down), soft coral red, seen from the front. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 11. `assets/images/items/sekil/ucgen_kucuk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Küçük üçgen

```
a very small flat triangle cut out of thick clay drawn small in the middle of a lot of empty space, pointing right, soft coral red. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 12. `assets/images/items/sekil/kare.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kare

```
a flat square cut out of thick clay, sides level, soft sky blue, seen from the front. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 13. `assets/images/items/sekil/kare_egik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Eğik kare

```
a flat square cut out of thick clay turned 45 degrees so it stands on one corner, soft sky blue, seen from the front. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 14. `assets/images/items/sekil/kare_kucuk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Küçük kare

```
a very small flat square cut out of thick clay drawn small in the middle of a lot of empty space, soft sky blue. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 15. `assets/images/items/sekil/dikdortgen.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dikdörtgen

```
a flat wide rectangle cut out of thick clay, lying horizontally, soft mint green, seen from the front. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 16. `assets/images/items/sekil/dikdortgen_dik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dik dikdörtgen

```
a flat tall rectangle cut out of thick clay, standing vertically, soft mint green, seen from the front. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 17. `assets/images/items/sekil/daire.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Daire

```
a flat round disc cut out of thick clay, soft sunny yellow, seen from the front. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 18. `assets/images/items/sekil/daire_kucuk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Küçük daire

```
a very small flat round disc cut out of thick clay drawn small in the middle of a lot of empty space, soft sunny yellow. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```


---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Sprite'larda arka plan silindi, şeffaf PNG
- [ ] Görselde yazı, harf ya da rakam yok
- [ ] Stil önceki partilerle tutarlı (yan yana koyup bak)
- [ ] `godot --headless --path . -s res://tools/missing_assets.gd` bu dosyaları artık eksik göstermiyor
- [ ] Commit: `assets: 040 040 g2 matematik cisim ve şekiller`
