# 042 · 2. sınıf Matematik: sıvı, ölçme, simetri ve veri nesneleri

**Öncelik: ORTA** (Faz 3d, `content/g2/matematik/u01`, `u02`, `u04`, `u05`). Tahmin turlarında sayılan ölçme birimleri (bardak, kova, metre çubuğu, kilogramlık ağırlık, santimetre küpü), ölçme araçları, `scenario` sahneleri (16:9), simetrik / simetrik olmayan nesneler, kutu simgeleri ve kiraz. Üzüm (`item.meyve.uzum`) 060 partisinde istendi.

Bu görseller gelene kadar oyun renkli yer tutucu kartın üstüne nesnenin adını yazar (`label.<anahtar>` metni); dosyayı tablodaki yola koymak yeterlidir, kod değişikliği gerekmez.

- Her görsel **tek nesne** olarak çizilir; oyun nesneyi kart içinde 128–300 px arasında gösterir.
- Sprite'ların arka planı silinir, şeffaf PNG kaydedilir. Sahne görsellerinde (16:9) arka plan kalır.
- Görselde yazı, harf, rakam, logo ya da marka yok.
- **Simetri:** "simetrik" nesneler dikey eksene göre tam olarak ayna gibi olmalı; "simetrik değil" nesneler (salyangoz, bulut, ayakkabı, çaydanlık) bir bakışta iki yarısı farklı görünmeli.
- **Ölçme birimleri** (metre çubuğu, cetvel, ağırlık) yalnızca çentik taşır; çentiklerin yanında rakam yok.

Stil blokları: `docs/assets/style-guide.md` → `STYLE_SPRITE` (nesneler), `STYLE_SCENE` (`item.sahne.*`), `STYLE_ICON` (`item.simge.*`). Promptların sonunda tam metin olarak yer alıyor.


## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/items/sivi/bardak.png` | 1:1 | — | Su bardağı |
| 2 | `assets/images/items/sivi/kupa.png` | 1:1 | — | Kupa |
| 3 | `assets/images/items/sivi/kova.png` | 1:1 | — | Kova |
| 4 | `assets/images/items/sivi/sise.png` | 1:1 | — | Şişe |
| 5 | `assets/images/items/olcu/metre_cubugu.png` | 1:1 | — | Metre çubuğu |
| 6 | `assets/images/items/olcu/kilo_agirligi.png` | 1:1 | — | Bir kilogramlık ağırlık |
| 7 | `assets/images/items/olcu/santim_kup.png` | 1:1 | — | Santimetre küpü |
| 8 | `assets/images/items/olcu/cetvel.png` | 1:1 | — | Cetvel |
| 9 | `assets/images/items/olcu/terazi.png` | 1:1 | — | Terazi |
| 10 | `assets/images/items/olcu/el.png` | 1:1 | — | Karış |
| 11 | `assets/images/items/sahne/karis_olcum.png` | 16:9 | — | Durum sahnesi: Karışla ölçme |
| 12 | `assets/images/items/sahne/cetvel_olcum.png` | 16:9 | — | Durum sahnesi: Cetvelle ölçme |
| 13 | `assets/images/items/sahne/pazar_tartim.png` | 16:9 | — | Durum sahnesi: Pazarda tartma |
| 14 | `assets/images/items/yol/ayak_izi.png` | 1:1 | — | Ayak izi |
| 15 | `assets/images/items/simetri/kelebek.png` | 1:1 | — | Kelebek |
| 16 | `assets/images/items/simetri/yaprak.png` | 1:1 | — | Yaprak |
| 17 | `assets/images/items/simetri/kalp.png` | 1:1 | — | Kalp |
| 18 | `assets/images/items/simetri/yildiz.png` | 1:1 | — | Yıldız |
| 19 | `assets/images/items/simetri/salyangoz.png` | 1:1 | — | Salyangoz |
| 20 | `assets/images/items/simetri/bulut.png` | 1:1 | — | Bulut |
| 21 | `assets/images/items/simetri/ayakkabi.png` | 1:1 | — | Ayakkabı |
| 22 | `assets/images/items/simetri/cay_demligi.png` | 1:1 | — | Çaydanlık |
| 23 | `assets/images/items/simge/simetrik.png` | 1:1 | — | Kutu simgesi: Simetrik |
| 24 | `assets/images/items/simge/simetrik_degil.png` | 1:1 | — | Kutu simgesi: Simetrik değil |
| 25 | `assets/images/items/simge/madeni_para.png` | 1:1 | — | Kutu simgesi: Madenî para |
| 26 | `assets/images/items/simge/kagit_para.png` | 1:1 | — | Kutu simgesi: Kâğıt para |
| 27 | `assets/images/items/meyve/kiraz.png` | 1:1 | — | Kiraz |

## Promptlar

### 1. `assets/images/items/sivi/bardak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Su bardağı

```
a clear transparent drinking glass filled to the top with plain light blue water, no face, no objects inside. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/items/sivi/kupa.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kupa

```
a round mug full of milk. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/items/sivi/kova.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kova

```
a small toy bucket full of water. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 4. `assets/images/items/sivi/sise.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Şişe

```
a small bottle full of orange juice, no label. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 5. `assets/images/items/olcu/metre_cubugu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Metre çubuğu

```
a long wooden measuring stick lying horizontally with plain tick marks only (no numbers). 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 6. `assets/images/items/olcu/kilo_agirligi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bir kilogramlık ağırlık

```
a classic dark grey cast-iron kitchen scale weight shaped like a short wide cylinder with a sloped top and a round ring handle on top, plain, no numbers, no face. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 7. `assets/images/items/olcu/santim_kup.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Santimetre küpü

```
a tiny unit cube block, bright green, the kind used to measure length in class. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 8. `assets/images/items/olcu/cetvel.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Cetvel

```
a plastic school ruler with plain tick marks only (no numbers), lying horizontally. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 9. `assets/images/items/olcu/terazi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Terazi

```
a kitchen balance scale with two pans, empty. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 10. `assets/images/items/olcu/el.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Karış

```
a child's open hand with fingers spread wide, seen from above, measuring span. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 11. `assets/images/items/sahne/karis_olcum.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum sahnesi: Karışla ölçme

```
two children measure the same table with their hand spans; one child has big hands, one small hands, both look puzzled, dominant palette: leafy greens, warm orange and honey yellow accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 12. `assets/images/items/sahne/cetvel_olcum.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum sahnesi: Cetvelle ölçme

```
two children measure the same small table with one long bright yellow ruler that lies clearly visible across the tabletop, both smiling at each other, dominant palette: leafy greens, warm orange and honey yellow accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 13. `assets/images/items/sahne/pazar_tartim.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum sahnesi: Pazarda tartma

```
a market stall where a grown-up seller weighs tomatoes on a scale while a child watches. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. dominant palette: leafy greens, warm orange and honey yellow accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 14. `assets/images/items/yol/ayak_izi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ayak izi

```
a single small clay footprint seen from above. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 15. `assets/images/items/simetri/kelebek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kelebek

```
a butterfly seen straight from above with perfectly matching left and right wings. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 16. `assets/images/items/simetri/yaprak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yaprak

```
a single symmetric green leaf seen straight from above, the vein in the middle. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 17. `assets/images/items/simetri/kalp.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kalp

```
a red heart shape, perfectly symmetric, seen from the front. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 18. `assets/images/items/simetri/yildiz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yıldız

```
a five-pointed yellow star, perfectly symmetric, standing on two points. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 19. `assets/images/items/simetri/salyangoz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Salyangoz

```
a snail seen from the side with its spiral shell on the right and head on the left. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 20. `assets/images/items/simetri/bulut.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bulut

```
a lumpy irregular cloud with a bigger bump on one side, clearly not symmetric. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 21. `assets/images/items/simetri/ayakkabi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ayakkabı

```
a single sneaker seen from the side, toe pointing left. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 22. `assets/images/items/simetri/cay_demligi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çaydanlık

```
a teapot seen from the side with the spout on the left and the handle on the right. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 23. `assets/images/items/simge/simetrik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kutu simgesi: Simetrik

```
an icon of a butterfly cut in half by a dashed vertical fold line, both halves the same. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 24. `assets/images/items/simge/simetrik_degil.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kutu simgesi: Simetrik değil

```
an icon of a lumpy uneven blob cut by a dashed vertical line, the two halves clearly different. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 25. `assets/images/items/simge/madeni_para.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kutu simgesi: Madenî para

```
an icon of a stack of three plain round metal coins without any markings. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 26. `assets/images/items/simge/kagit_para.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kutu simgesi: Kâğıt para

```
an icon of a few plain paper banknotes fanned out, no portraits, no numbers, no text. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 27. `assets/images/items/meyve/kiraz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kiraz

```
two red cherries joined at the stem. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```


---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Sprite'larda arka plan silindi, şeffaf PNG
- [ ] Görselde yazı, harf ya da rakam yok
- [ ] Stil önceki partilerle tutarlı (yan yana koyup bak)
- [ ] `godot --headless --path . -s res://tools/missing_assets.gd` bu dosyaları artık eksik göstermiyor
- [ ] Commit: `assets: 042 042 g2 matematik ölçme ve simetri`
