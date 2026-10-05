# 041 · 2. sınıf Matematik: cisim örneği nesneler ve yapılar

**Öncelik: YÜKSEK** (Faz 3d, `content/g2/matematik/u01.json`). Günlük hayattan geometrik cisim örnekleri (zar, koli, konserve kutusu, çadır…) ve bloklarla ya da kâğıt şekillerle yapılmış yapı/model resimleri. Yapı ve model resimleri `scenario` şablonunda üstteki sahne kartında gösterilir; çocuk "kalenin kulesi hangi cisim?" gibi sorulara cevap verir, bu yüzden parçalar **net ve sayılabilir** olmalı.

Bu görseller gelene kadar oyun renkli yer tutucu kartın üstüne nesnenin adını yazar (`label.<anahtar>` metni); dosyayı tablodaki yola koymak yeterlidir, kod değişikliği gerekmez.

- Her görsel **tek nesne** olarak çizilir; oyun nesneyi kart içinde 128–300 px arasında gösterir.
- Sprite'ların arka planı silinir, şeffaf PNG kaydedilir. Sahne görsellerinde (16:9) arka plan kalır.
- Görselde yazı, harf, rakam, logo ya da marka yok.

Stil bloğu: `docs/assets/style-guide.md` → `STYLE_SPRITE` (promptların sonunda tam metin olarak yer alıyor).


## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/items/nesne/zar.png` | 1:1 | — | Zar |
| 2 | `assets/images/items/nesne/koli.png` | 1:1 | — | Koli |
| 3 | `assets/images/items/nesne/hediye_kutusu.png` | 1:1 | — | Hediye kutusu |
| 4 | `assets/images/items/nesne/cadir.png` | 1:1 | — | Çadır |
| 5 | `assets/images/items/nesne/peynir.png` | 1:1 | — | Peynir dilimi |
| 6 | `assets/images/items/nesne/konserve.png` | 1:1 | — | Konserve kutusu |
| 7 | `assets/images/items/nesne/davul.png` | 1:1 | — | Davul |
| 8 | `assets/images/items/nesne/mum.png` | 1:1 | — | Mum |
| 9 | `assets/images/items/yapi/blok_kale.png` | 1:1 | — | Kale |
| 10 | `assets/images/items/yapi/robot.png` | 1:1 | — | Robot |
| 11 | `assets/images/items/yapi/tren.png` | 1:1 | — | Tren |
| 12 | `assets/images/items/yapi/blok_ev.png` | 1:1 | — | Blok ev |
| 13 | `assets/images/items/model/ev.png` | 1:1 | — | Şekillerden ev |
| 14 | `assets/images/items/model/araba.png` | 1:1 | — | Şekillerden araba |
| 15 | `assets/images/items/model/gemi.png` | 1:1 | — | Şekillerden gemi |
| 16 | `assets/images/items/model/robot.png` | 1:1 | — | Şekillerden robot |

## Promptlar

### 1. `assets/images/items/nesne/zar.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Zar

```
a toy die cube with rounded corners and dots made of small clay balls (dots only, no numerals), white and red. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/items/nesne/koli.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Koli

```
a closed brown cardboard box shaped like a long rectangular prism, taped on top. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/items/nesne/hediye_kutusu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hediye kutusu

```
a tall gift box with a square base and square top (square prism), wrapped in striped paper with a ribbon bow. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 4. `assets/images/items/nesne/cadir.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çadır

```
a small camping tent shaped like a triangular prism lying on its side, bright orange fabric, open door flap. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 5. `assets/images/items/nesne/peynir.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Peynir dilimi

```
a wedge of yellow cheese shaped like a triangular prism with a few holes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 6. `assets/images/items/nesne/konserve.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Konserve kutusu

```
a closed tin can shaped like an upright cylinder with a plain colored paper band and no writing. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 7. `assets/images/items/nesne/davul.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Davul

```
a small toy drum shaped like a cylinder, red sides with zigzag cords, white drum skin on top, no sticks. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 8. `assets/images/items/nesne/mum.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Mum

```
a thick round pillar candle shaped like a cylinder with a small flame. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 9. `assets/images/items/yapi/blok_kale.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kale

```
a toy castle built from geometric blocks: two tall cylinder towers on the left and right and a cube block wall between them, no roofs, chunky toy blocks. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 10. `assets/images/items/yapi/robot.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Robot

```
a toy robot built from geometric blocks: a cube head, a long rectangular prism body, cylinder arms and legs, chunky toy blocks. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 11. `assets/images/items/yapi/tren.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tren

```
a toy train built from geometric blocks: rectangular prism wagons, a cylinder boiler on the engine and round cylinder wheels, chunky toy blocks. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 12. `assets/images/items/yapi/blok_ev.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Blok ev

```
a toy house built from geometric blocks: a cube body with a triangular prism roof on top, chunky toy blocks. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 13. `assets/images/items/model/ev.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Şekillerden ev

```
a flat picture of a house made of paper cut-out shapes: a square wall, a triangle roof, a rectangle door and a round circle window, on a plain background. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 14. `assets/images/items/model/araba.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Şekillerden araba

```
a flat picture of a car made of paper cut-out shapes: a long rectangle body, a smaller rectangle cabin and two round circle wheels. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 15. `assets/images/items/model/gemi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Şekillerden gemi

```
a flat picture of a sailboat made of paper cut-out shapes: a rectangle hull and two triangle sails. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 16. `assets/images/items/model/robot.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Şekillerden robot

```
a flat picture of a robot made of paper cut-out shapes: a square head, a tall rectangle body, rectangle arms and two small circle eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```


---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Sprite'larda arka plan silindi, şeffaf PNG
- [ ] Görselde yazı, harf ya da rakam yok
- [ ] Stil önceki partilerle tutarlı (yan yana koyup bak)
- [ ] `godot --headless --path . -s res://tools/missing_assets.gd` bu dosyaları artık eksik göstermiyor
- [ ] Commit: `assets: 041 041 g2 matematik nesne ve yapılar`
