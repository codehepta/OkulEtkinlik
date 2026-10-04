# 004 · Sayma ve eşleştirme nesneleri (genel kütüphane)

**Öncelik: YÜKSEK** (Faz 1, 1. sınıf Matematik dikey dilimi). Bu nesneler sayma, eşleştirme, sınıflandırma ve dinle-bul oyunlarında tekrar tekrar kullanılacak.

- Her nesne **tek başına** olmalı (ör. "üç elma" değil, **bir** elma). Oyun nesneyi kopyalayıp sayıyı kendisi oluşturur.
- Hepsinin arka planı silinir, şeffaf PNG kaydedilir.
- Nesneler aynı ışık açısıyla ve benzer "tombulluk"ta olmalı; yan yana dizildiklerinde aynı setten çıkmış gibi görünmeliler.


## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/items/meyve/elma.png` | 1:1 | — | Elma |
| 2 | `assets/images/items/meyve/armut.png` | 1:1 | — | Armut |
| 3 | `assets/images/items/meyve/muz.png` | 1:1 | — | Muz |
| 4 | `assets/images/items/meyve/cilek.png` | 1:1 | — | Çilek |
| 5 | `assets/images/items/meyve/portakal.png` | 1:1 | — | Portakal |
| 6 | `assets/images/items/meyve/karpuz.png` | 1:1 | — | Karpuz dilimi |
| 7 | `assets/images/items/oyuncak/top.png` | 1:1 | — | Top |
| 8 | `assets/images/items/oyuncak/balon_kirmizi.png` | 1:1 | — | Kırmızı balon |
| 9 | `assets/images/items/oyuncak/balon_mavi.png` | 1:1 | — | Mavi balon |
| 10 | `assets/images/items/oyuncak/balon_sari.png` | 1:1 | — | Sarı balon |
| 11 | `assets/images/items/oyuncak/araba.png` | 1:1 | — | Oyuncak araba |
| 12 | `assets/images/items/oyuncak/kup.png` | 1:1 | — | Oyuncak küp |
| 13 | `assets/images/items/oyuncak/ayicik.png` | 1:1 | — | Oyuncak ayı |
| 14 | `assets/images/items/hayvan/kus.png` | 1:1 | — | Kuş |
| 15 | `assets/images/items/hayvan/kelebek.png` | 1:1 | — | Kelebek |
| 16 | `assets/images/items/hayvan/balik.png` | 1:1 | — | Balık |
| 17 | `assets/images/items/hayvan/tavuk.png` | 1:1 | — | Tavuk |
| 18 | `assets/images/items/hayvan/civciv.png` | 1:1 | — | Civciv |
| 19 | `assets/images/items/hayvan/ordek.png` | 1:1 | — | Ördek |
| 20 | `assets/images/items/hayvan/ari.png` | 1:1 | — | Arı |
| 21 | `assets/images/items/okul/kalem.png` | 1:1 | — | Kalem |
| 22 | `assets/images/items/okul/kitap.png` | 1:1 | — | Kitap |
| 23 | `assets/images/items/okul/silgi.png` | 1:1 | — | Silgi |
| 24 | `assets/images/items/okul/canta.png` | 1:1 | — | Okul çantası |
| 25 | `assets/images/items/doga/cicek.png` | 1:1 | — | Çiçek |
| 26 | `assets/images/items/doga/yaprak.png` | 1:1 | — | Yaprak |
| 27 | `assets/images/items/doga/mantar.png` | 1:1 | — | Mantar |
| 28 | `assets/images/items/doga/tas.png` | 1:1 | — | Taş |

## Promptlar

### 1. `assets/images/items/meyve/elma.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Elma

```
a shiny red apple with a small green leaf. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/items/meyve/armut.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Armut

```
a yellow-green pear with a brown stem. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/items/meyve/muz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Muz

```
a single curved yellow banana. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 4. `assets/images/items/meyve/cilek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çilek

```
a red strawberry with green leaves and tiny seeds. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 5. `assets/images/items/meyve/portakal.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Portakal

```
a round orange with a small leaf. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 6. `assets/images/items/meyve/karpuz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Karpuz dilimi

```
a triangular watermelon slice with black seeds. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 7. `assets/images/items/oyuncak/top.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Top

```
a round beach ball with colorful panels. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 8. `assets/images/items/oyuncak/balon_kirmizi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kırmızı balon

```
a single red party balloon with a curly string. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 9. `assets/images/items/oyuncak/balon_mavi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Mavi balon

```
a single blue party balloon with a curly string. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 10. `assets/images/items/oyuncak/balon_sari.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sarı balon

```
a single yellow party balloon with a curly string. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 11. `assets/images/items/oyuncak/araba.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Oyuncak araba

```
a small round toy car, bright red with black wheels. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 12. `assets/images/items/oyuncak/kup.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Oyuncak küp

```
a single toy building block cube, bright blue, blank faces. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 13. `assets/images/items/oyuncak/ayicik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Oyuncak ayı

```
a small teddy bear toy. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 14. `assets/images/items/hayvan/kus.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kuş

```
a small round blue songbird. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 15. `assets/images/items/hayvan/kelebek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kelebek

```
a butterfly with orange and pink wings. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 16. `assets/images/items/hayvan/balik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Balık

```
a small round orange fish. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 17. `assets/images/items/hayvan/tavuk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tavuk

```
a round white hen with a red comb. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 18. `assets/images/items/hayvan/civciv.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Civciv

```
a tiny round yellow chick. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 19. `assets/images/items/hayvan/ordek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ördek

```
a small yellow rubber-duck-like duckling. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 20. `assets/images/items/hayvan/ari.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Arı

```
a round friendly bumblebee. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 21. `assets/images/items/okul/kalem.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kalem

```
a short chunky yellow pencil with a pink eraser. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 22. `assets/images/items/okul/kitap.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kitap

```
a closed chunky book with a green cover, blank cover. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 23. `assets/images/items/okul/silgi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Silgi

```
a rounded pink eraser. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 24. `assets/images/items/okul/canta.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Okul çantası

```
a small red school backpack. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 25. `assets/images/items/doga/cicek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çiçek

```
a single daisy-like flower with pink petals and a yellow center. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 26. `assets/images/items/doga/yaprak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yaprak

```
a single green leaf. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 27. `assets/images/items/doga/mantar.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Mantar

```
a small red mushroom with white dots. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 28. `assets/images/items/doga/tas.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Taş

```
a smooth round grey pebble. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```



---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Sprite'larda arka plan silindi, şeffaf PNG
- [ ] Görselde yazı, harf ya da rakam yok
- [ ] Stil önceki partilerle tutarlı (yan yana koyup bak)
- [ ] Commit: `assets: <parti no> <kısa açıklama>`
