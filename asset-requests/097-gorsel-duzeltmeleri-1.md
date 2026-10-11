# 097 · Görsel düzeltmeleri 1 (karışıklık yaratanlar)

**Öncelik: YÜKSEK.** Sahibin bildirdiği ve taramada çıkan, öğretimi karıştıran görseller yeniden üretilir. Mevcut dosyaların yerine geçer (`generate.py --force`).

- **"Kim yapar?" kutuları:** seslendirme "çocuk eline / büyük ele koy" diyor; kutularda el olmalı.
- **Halı hikâyesi:** metin "kırmızı, mavi ve sarı" diyor, soru "Halıda hangi renk yok?" (cevap yeşil). Üç halı görselinde de yeşil olmamalı.
- **Canlı/cansız soruları:** cansız nesnelerde (taş, bulut, kum, su damlası, küflü ekmek) ve "cansız" simgesinde yüz var. Yüzsüz olmalı.
- **Çığ / karlı dağ** aynı eşleştirme turunda; birbirine çok benziyorlar. Çığ hareketli kar dalgası, karlı dağ durgun olmalı.

Kural (sahip kararı, 2026-10-12): cansız nesnelere yüz eklenmez. Var olan yüzlü cansızlar (`docs/assets/yuzlu-cansizlar.md`) yalnız karışıklık yaratıyorsa yenilenir. Bu partide `STYLE_SPRITE`'ın "big expressive eyes" cümlesi çıkarıldı ve "It has no face" eklendi; insanlı sahnelerde göz yalnız insanlara verilir.

## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/items/simge/cocuk_gorevi.png` | 1:1 | — | Çocuk eli ("Senin görevin" kutusu). Seslendirme: "çocuk eline koy". |
| 2 | `assets/images/items/simge/buyuk_gorevi.png` | 1:1 | — | Büyük eli ("Büyüklerin görevi" kutusu). Seslendirme: "büyük ele koy". |
| 3 | `assets/images/items/esya/hali.png` | 1:1 | — | Halı: yalnız kırmızı, mavi ve sarı (yeşil yok). Soru: "Halıda hangi renk yok?" → yeşil. |
| 4 | `assets/images/items/sahne/nine_hali.png` | 1:1 | — | Hikâye sayfası: Ninem halı dokur. Halı yalnız kırmızı, mavi ve sarı. |
| 5 | `assets/images/items/sahne/aile_hali.png` | 1:1 | — | Hikâye sayfası: Bu halı bize ninemden yadigâr kalacak. Halı yalnız kırmızı, mavi ve sarı. |
| 6 | `assets/images/items/doga/tas.png` | 1:1 | — | Taş (canlı/cansız sorusu). |
| 7 | `assets/images/items/doga/bulut.png` | 1:1 | — | Bulut (canlı/cansız sorusu). |
| 8 | `assets/images/items/doga/kum.png` | 1:1 | — | Kum (canlı/cansız sorusu). |
| 9 | `assets/images/items/doga/su_damlasi.png` | 1:1 | — | Su damlası (canlı/cansız sorusu). |
| 10 | `assets/images/items/simge/cansiz.png` | 1:1 | — | "Cansız" kutu simgesi; doga/tas ile karışmasın diye birkaç cansız nesne. |
| 11 | `assets/images/items/fen/kuflu_ekmek.png` | 1:1 | — | Küflü ekmek (canlıları gruplayalım). |
| 12 | `assets/images/items/afet/cig.png` | 1:1 | — | Çığ: karlı dağdan açıkça ayrılsın; hareket hâlinde kar kütlesi. |
| 13 | `assets/images/items/neden/karli_dag.png` | 1:1 | — | Çok karlı dik dağ (çığın nedeni): durgun, sakin. |

## Promptlar

### 1. `assets/images/items/simge/cocuk_gorevi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çocuk eli ("Senin görevin" kutusu). Seslendirme: "çocuk eline koy".

```
a small chubby child's hand, open palm facing the viewer, short little fingers, with the cuff of a bright yellow kid's sweater sleeve at the wrist, a hand only, nothing in it. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/items/simge/buyuk_gorevi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Büyük eli ("Büyüklerin görevi" kutusu). Seslendirme: "büyük ele koy".

```
a big grown-up's hand, open palm facing the viewer, long large fingers, with the cuff of a blue adult shirt sleeve and a simple wristwatch at the wrist, a hand only, nothing in it. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/items/esya/hali.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Halı: yalnız kırmızı, mavi ve sarı (yeşil yok). Soru: "Halıda hangi renk yok?" → yeşil.

```
a small rectangular handwoven Turkish rug seen from the top, simple geometric pattern made ONLY of red, blue and yellow on a cream base, there is no green anywhere on the rug. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 4. `assets/images/items/sahne/nine_hali.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye sayfası: Ninem halı dokur. Halı yalnız kırmızı, mavi ve sarı.

```
a small claymation vignette: a grandmother weaving a carpet on a wooden loom, the carpet uses ONLY red, blue and yellow yarn, there is no green anywhere in the carpet or the yarn. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes on people only, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 5. `assets/images/items/sahne/aile_hali.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye sayfası: Bu halı bize ninemden yadigâr kalacak. Halı yalnız kırmızı, mavi ve sarı.

```
a small claymation vignette: a family sitting together on a carpet, the carpet pattern uses ONLY red, blue and yellow, there is no green anywhere on the carpet. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes on people only, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 6. `assets/images/items/doga/tas.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Taş (canlı/cansız sorusu).

```
a smooth round plain grey pebble. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 7. `assets/images/items/doga/bulut.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bulut (canlı/cansız sorusu).

```
a fluffy plain white cloud. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 8. `assets/images/items/doga/kum.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kum (canlı/cansız sorusu).

```
a small pile of plain golden sand. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 9. `assets/images/items/doga/su_damlasi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Su damlası (canlı/cansız sorusu).

```
a big shiny plain blue water drop. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 10. `assets/images/items/simge/cansiz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** "Cansız" kutu simgesi; doga/tas ile karışmasın diye birkaç cansız nesne.

```
a small group of three non-living things side by side: a plain grey pebble, a wooden toy block and a metal spoon, symbol of non-living things. None of them has a face, eyes or a mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 11. `assets/images/items/fen/kuflu_ekmek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Küflü ekmek (canlıları gruplayalım).

```
a slice of bread with soft fuzzy green-blue mold spots on one corner. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 12. `assets/images/items/afet/cig.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çığ: karlı dağdan açıkça ayrılsın; hareket hâlinde kar kütlesi.

```
a big white snow avalanche rushing down a steep mountain slope, a huge rolling wave of snow with a powdery snow cloud bursting behind it, strong sense of motion, a few small pine trees in its path. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 13. `assets/images/items/neden/karli_dag.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çok karlı dik dağ (çığın nedeni): durgun, sakin.

```
a calm still steep mountain covered with a very thick heavy layer of snow, bare rocky lower slopes, clear sky feeling, nothing moving. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```
