# 010 · Faz 3 şablonları: paralar, pizza ve saat kadranı

**Öncelik: ORTA** (Faz 3a, yeni mini oyun şablonları). `clock_money` (saat / para) ve `fraction_pizza` şablonlarının görselleri. Diğer dört şablon (`sequence`, `balloon_pop`, `pattern`, `balance`) kodla çizilen kil öğeler ve mevcut nesne görselleriyle çalışır; yeni görsel istemez. Balon patlama efekti `sfx.balloon_pop` zaten 006'da istendi.

Bu görseller gelene kadar oyun kendi çizdiği yer tutucuları kullanır (kodla kil para / banknot, kil pizza, kil kadran). Dosyayı tablodaki yola koymak yeterlidir; kod değişikliği gerekmez.

- **Görsellerde asla rakam, harf ya da yazı yok.** Paranın değeri, saatin rakamları ve çentikleri oyunda yazı tipiyle ve kodla çizilir. Paranın ve banknotun **ortası boş** kalmalı: oyun değeri ("5 TL", "50 kr") oraya yazar.
- Paralar **oyuncak para** görünümünde olmalı: gerçek banknot / madeni paranın kopyası değil; portre, yüz, bina, arma ya da sembol yok. Renkler gerçek paralara yaklaşık olarak uyar (çocuk tanıyabilsin); sahip gerçek paralarla karşılaştırıp gerekirse renk cümlesini düzeltir.
- Madeni paralar ve pizza **tam üstten**, saat kadranı **tam önden** görünmeli ve **çerçeveyi kenardan kenara** doldurmalı: oyun pizzayı dilimlere bu görselin çemberinden keser, kadranın üstüne rakam ve ibre çizer.
- Hepsinin arka planı silinir, şeffaf PNG kaydedilir. Banknotlar 2:1 (ör. 1024×512), diğerleri 1:1.

Stil blokları: `docs/assets/style-guide.md` → `STYLE_ICON` (paralar, kadran) ve `STYLE_SPRITE` (pizza). Promptların sonunda tam metin olarak yer alıyor.


## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/items/para/kr_1.png` | 1:1 | — | Madeni para: 1 kuruş (en küçük, bakır-bronz). |
| 2 | `assets/images/items/para/kr_5.png` | 1:1 | — | Madeni para: 5 kuruş (küçük, pirinç sarısı). |
| 3 | `assets/images/items/para/kr_10.png` | 1:1 | — | Madeni para: 10 kuruş (pirinç sarısı, 5 kuruştan biraz büyük). |
| 4 | `assets/images/items/para/kr_25.png` | 1:1 | — | Madeni para: 25 kuruş (koyu pirinç, orta boy). |
| 5 | `assets/images/items/para/kr_50.png` | 1:1 | — | Madeni para: 50 kuruş (iki renkli: gümüş orta, altın kenar). |
| 6 | `assets/images/items/para/tl_1.png` | 1:1 | — | Madeni para: 1 lira (en büyük; iki renkli: altın orta, gümüş halka). |
| 7 | `assets/images/items/para/tl_5.png` | 2:1 | — | Banknot: 5 TL (mor-kahve tonlu oyuncak para). |
| 8 | `assets/images/items/para/tl_10.png` | 2:1 | — | Banknot: 10 TL (kırmızı-pembe tonlu oyuncak para). |
| 9 | `assets/images/items/para/tl_20.png` | 2:1 | — | Banknot: 20 TL (yeşil tonlu oyuncak para). |
| 10 | `assets/images/items/para/tl_50.png` | 2:1 | — | Banknot: 50 TL (turuncu tonlu oyuncak para). |
| 11 | `assets/images/items/para/tl_100.png` | 2:1 | — | Banknot: 100 TL (mavi tonlu oyuncak para). |
| 12 | `assets/images/items/para/tl_200.png` | 2:1 | — | Banknot: 200 TL (pembe-mor tonlu oyuncak para). |
| 13 | `assets/images/items/yiyecek/pizza.png` | 1:1 | — | Bütün pizza, tam üstten, dilimsiz (oyun dilimleri kendisi keser). |
| 14 | `assets/images/ui/clock_face.png` | 1:1 | — | Saat kadranı zemini: rakamsız, ibresiz, çentiksiz (oyun hepsini kendisi çizer). |

## Promptlar

### 1. `assets/images/items/para/kr_1.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Madeni para: 1 kuruş (en küçük, bakır-bronz).

```
a tiny toy coin made of warm copper-bronze clay, the smallest coin of the set, seen straight from above, perfectly round and filling the whole frame edge to edge, the flat center area left plain and smooth (the game prints the value there), only a simple raised rim and a few soft abstract dots or leaf swirls near the edge, no portrait, no face, no symbols, no writing, toy play-money look, not a realistic replica. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/items/para/kr_5.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Madeni para: 5 kuruş (küçük, pirinç sarısı).

```
a small toy coin made of light brass-yellow clay, seen straight from above, perfectly round and filling the whole frame edge to edge, the flat center area left plain and smooth (the game prints the value there), only a simple raised rim and a few soft abstract dots or leaf swirls near the edge, no portrait, no face, no symbols, no writing, toy play-money look, not a realistic replica. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/items/para/kr_10.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Madeni para: 10 kuruş (pirinç sarısı, 5 kuruştan biraz büyük).

```
a small toy coin made of golden brass-yellow clay with a slightly thicker rim, seen straight from above, perfectly round and filling the whole frame edge to edge, the flat center area left plain and smooth (the game prints the value there), only a simple raised rim and a few soft abstract dots or leaf swirls near the edge, no portrait, no face, no symbols, no writing, toy play-money look, not a realistic replica. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 4. `assets/images/items/para/kr_25.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Madeni para: 25 kuruş (koyu pirinç, orta boy).

```
a medium toy coin made of deep golden brass clay with a reeded rim, seen straight from above, perfectly round and filling the whole frame edge to edge, the flat center area left plain and smooth (the game prints the value there), only a simple raised rim and a few soft abstract dots or leaf swirls near the edge, no portrait, no face, no symbols, no writing, toy play-money look, not a realistic replica. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 5. `assets/images/items/para/kr_50.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Madeni para: 50 kuruş (iki renkli: gümüş orta, altın kenar).

```
a medium-large two-colour toy coin: a silver-grey clay center disc inside a golden brass clay ring, seen straight from above, perfectly round and filling the whole frame edge to edge, the flat center area left plain and smooth (the game prints the value there), only a simple raised rim and a few soft abstract dots or leaf swirls near the edge, no portrait, no face, no symbols, no writing, toy play-money look, not a realistic replica. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 6. `assets/images/items/para/tl_1.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Madeni para: 1 lira (en büyük; iki renkli: altın orta, gümüş halka).

```
the largest toy coin of the set, two-colour: a golden brass clay center disc inside a silver-grey clay ring, seen straight from above, perfectly round and filling the whole frame edge to edge, the flat center area left plain and smooth (the game prints the value there), only a simple raised rim and a few soft abstract dots or leaf swirls near the edge, no portrait, no face, no symbols, no writing, toy play-money look, not a realistic replica. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 7. `assets/images/items/para/tl_5.png`

- **Oran:** 2:1  
- **Referans görsel:** yok  
- **Açıklama:** Banknot: 5 TL (mor-kahve tonlu oyuncak para).

```
a toy banknote made of soft lilac-purple and warm brown clay, seen straight from above, perfectly flat rectangle filling the whole frame edge to edge with slightly rounded corners, a plain lighter oval area in the middle left empty (the game prints the value there), soft abstract wavy clay patterns and a simple flower or leaf motif near the edges, no portrait, no face, no building, no symbols, no writing, toy play-money look, not a realistic replica. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 8. `assets/images/items/para/tl_10.png`

- **Oran:** 2:1  
- **Referans görsel:** yok  
- **Açıklama:** Banknot: 10 TL (kırmızı-pembe tonlu oyuncak para).

```
a toy banknote made of soft coral-red and pink clay, seen straight from above, perfectly flat rectangle filling the whole frame edge to edge with slightly rounded corners, a plain lighter oval area in the middle left empty (the game prints the value there), soft abstract wavy clay patterns and a simple flower or leaf motif near the edges, no portrait, no face, no building, no symbols, no writing, toy play-money look, not a realistic replica. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 9. `assets/images/items/para/tl_20.png`

- **Oran:** 2:1  
- **Referans görsel:** yok  
- **Açıklama:** Banknot: 20 TL (yeşil tonlu oyuncak para).

```
a toy banknote made of soft leaf-green clay, seen straight from above, perfectly flat rectangle filling the whole frame edge to edge with slightly rounded corners, a plain lighter oval area in the middle left empty (the game prints the value there), soft abstract wavy clay patterns and a simple flower or leaf motif near the edges, no portrait, no face, no building, no symbols, no writing, toy play-money look, not a realistic replica. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 10. `assets/images/items/para/tl_50.png`

- **Oran:** 2:1  
- **Referans görsel:** yok  
- **Açıklama:** Banknot: 50 TL (turuncu tonlu oyuncak para).

```
a toy banknote made of soft tangerine-orange clay, seen straight from above, perfectly flat rectangle filling the whole frame edge to edge with slightly rounded corners, a plain lighter oval area in the middle left empty (the game prints the value there), soft abstract wavy clay patterns and a simple flower or leaf motif near the edges, no portrait, no face, no building, no symbols, no writing, toy play-money look, not a realistic replica. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 11. `assets/images/items/para/tl_100.png`

- **Oran:** 2:1  
- **Referans görsel:** yok  
- **Açıklama:** Banknot: 100 TL (mavi tonlu oyuncak para).

```
a toy banknote made of soft sky-blue clay, seen straight from above, perfectly flat rectangle filling the whole frame edge to edge with slightly rounded corners, a plain lighter oval area in the middle left empty (the game prints the value there), soft abstract wavy clay patterns and a simple flower or leaf motif near the edges, no portrait, no face, no building, no symbols, no writing, toy play-money look, not a realistic replica. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 12. `assets/images/items/para/tl_200.png`

- **Oran:** 2:1  
- **Referans görsel:** yok  
- **Açıklama:** Banknot: 200 TL (pembe-mor tonlu oyuncak para).

```
a toy banknote made of soft rose-pink and violet clay, seen straight from above, perfectly flat rectangle filling the whole frame edge to edge with slightly rounded corners, a plain lighter oval area in the middle left empty (the game prints the value there), soft abstract wavy clay patterns and a simple flower or leaf motif near the edges, no portrait, no face, no building, no symbols, no writing, toy play-money look, not a realistic replica. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 13. `assets/images/items/yiyecek/pizza.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bütün pizza, tam üstten, dilimsiz (oyun dilimleri kendisi keser).

```
a whole round cheese pizza seen exactly from straight above, a perfect circle filling the whole frame edge to edge, golden crust ring, red tomato sauce edge, melted yellow cheese, about ten evenly spread round red pepperoni slices, absolutely no slices, no cut lines and no missing pieces, flat top-down view with no perspective. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 14. `assets/images/ui/clock_face.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Saat kadranı zemini: rakamsız, ibresiz, çentiksiz (oyun hepsini kendisi çizer).

```
a plain round wall-clock face seen exactly from the front, a perfect circle filling the whole frame edge to edge, a thick smooth teal clay rim around a soft cream clay face, the face completely empty: no numbers, no tick marks, no hands, no center pin, no writing, flat front view with no perspective. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```


---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Arka plan silindi, şeffaf PNG
- [ ] Görselde yazı, harf ya da rakam yok; paraların ortası boş
- [ ] Paralar oyuncak para görünümünde; portre / gerçek banknot kopyası yok
- [ ] Pizza ve kadran çerçeveyi kenardan kenara dolduran tam bir çember; pizzada dilim çizgisi yok
- [ ] Oyunda kontrol: `clock_money` (para say / öde, saat oku / kur) ve `fraction_pizza` (böl / seç) ekranlarında değer etiketleri ve dilimler doğru oturuyor
- [ ] Commit: `assets: 010 faz 3 paralar, pizza ve saat kadranı`
