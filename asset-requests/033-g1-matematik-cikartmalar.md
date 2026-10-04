# 033 · 1. sınıf Matematik çıkartmaları (Faz 3c, 26)

**Öncelik: ORTA** (Faz 3c). Yeni 26 durağın çıkartmaları (`content/stickers.json` sırasıyla). 008'deki altı çıkartmayla aynı setten çıkmış gibi görünmeli: yuvarlak rozet, kalın beyaz kesim kenarı, sade ve kalın silüet.

Hepsinin arka planı silinir, şeffaf PNG kaydedilir. Stil bloğu: `STYLE_ICON`.


## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/stickers/matematik/g1_kedi.png` | 1:1 | — | Çıkartma: turuncu kedicik (u01 durak 1, Kedi nerede?) |
| 2 | `assets/images/stickers/matematik/g1_pusula.png` | 1:1 | — | Çıkartma: pusula (u01 durak 2, Yolu izle) |
| 3 | `assets/images/stickers/matematik/g1_bayrak.png` | 1:1 | — | Çıkartma: hedef bayrağı (u01 durak 3, Hedefe git) |
| 4 | `assets/images/stickers/matematik/g1_eldiven.png` | 1:1 | — | Çıkartma: bir çift eş eldiven (u01 durak 4, Eşini bul) |
| 5 | `assets/images/stickers/matematik/g1_sepet.png` | 1:1 | — | Çıkartma: meyve ve oyuncak sepeti (u02 durak 6, Grubu parçalara ayır) |
| 6 | `assets/images/stickers/matematik/g1_kupa.png` | 1:1 | — | Çıkartma: yarış kupası (u02 durak 7, Kaçıncı sırada?) |
| 7 | `assets/images/stickers/matematik/g1_terazi.png` | 1:1 | — | Çıkartma: eşit kollu terazi (u02 durak 8, Hangisi daha çok?) |
| 8 | `assets/images/stickers/matematik/g1_davul.png` | 1:1 | — | Çıkartma: davul (u02 durak 9, Ritmik sayalım) |
| 9 | `assets/images/stickers/matematik/g1_roket.png` | 1:1 | — | Çıkartma: roket (u02 durak 10, Geriye sayalım) |
| 10 | `assets/images/stickers/matematik/g1_kolye.png` | 1:1 | — | Çıkartma: boncuk kolye (u02 durak 11, Örüntüyü tamamla) |
| 11 | `assets/images/stickers/matematik/g1_cetvel.png` | 1:1 | — | Çıkartma: karış ölçen el (u03 durak 1, Neyle ölçeriz?) |
| 12 | `assets/images/stickers/matematik/g1_kantar.png` | 1:1 | — | Çıkartma: küplerle tartı (u03 durak 2, Tahmin et, tart) |
| 13 | `assets/images/stickers/matematik/g1_hikaye.png` | 1:1 | — | Çıkartma: açık hikâye kitabı (u04 durak 1, Arttı mı, azaldı mı?) |
| 14 | `assets/images/stickers/matematik/g1_ucan_balon.png` | 1:1 | — | Çıkartma: uçan balonlar (u04 durak 2, Balon patlat) |
| 15 | `assets/images/stickers/matematik/g1_baykus.png` | 1:1 | — | Çıkartma: bilge baykuş (u04 durak 3, Tahmin et, hesapla) |
| 16 | `assets/images/stickers/matematik/g1_tahterevalli.png` | 1:1 | — | Çıkartma: dengede tahterevalli (u04 durak 4, Terazi dengede) |
| 17 | `assets/images/stickers/matematik/g1_aile.png` | 1:1 | — | Çıkartma: kardeş kalpler (u04 durak 5, İşlem ailesi) |
| 18 | `assets/images/stickers/matematik/g1_kumbara.png` | 1:1 | — | Çıkartma: domuzcuk kumbara (u05 durak 1, Parayı tanı) |
| 19 | `assets/images/stickers/matematik/g1_cuzdan.png` | 1:1 | — | Çıkartma: cüzdan (u05 durak 2, Para ve sayı) |
| 20 | `assets/images/stickers/matematik/g1_altin.png` | 1:1 | — | Çıkartma: parlak madeni paralar (u05 durak 3, Kumbarada ne var?) |
| 21 | `assets/images/stickers/matematik/g1_tekerlek.png` | 1:1 | — | Çıkartma: tekerlek (u06 durak 1, Yuvarlak mı, köşeli mi?) |
| 22 | `assets/images/stickers/matematik/g1_ev.png` | 1:1 | — | Çıkartma: şekillerden ev (u06 durak 2, Yapılardaki şekiller) |
| 23 | `assets/images/stickers/matematik/g1_ucurtma.png` | 1:1 | — | Çıkartma: uçurtma (u06 durak 3, Şekilleri sınıflandır) |
| 24 | `assets/images/stickers/matematik/g1_mozaik.png` | 1:1 | — | Çıkartma: renkli şekil mozaiği (u06 durak 4, Aynı şekil, farklı renk) |
| 25 | `assets/images/stickers/matematik/g1_defter.png` | 1:1 | — | Çıkartma: çetele defteri (u07 durak 1, Çetele tut) |
| 26 | `assets/images/stickers/matematik/g1_grafik.png` | 1:1 | — | Çıkartma: nesne grafiği (u07 durak 2, Nesne grafiği) |

## Promptlar

### 1. `assets/images/stickers/matematik/g1_kedi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: turuncu kedicik (u01 durak 1, Kedi nerede?)

```
a round sticker badge with a thick white die-cut border, showing a cute orange tabby kitten peeking out of a cardboard box. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/stickers/matematik/g1_pusula.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: pusula (u01 durak 2, Yolu izle)

```
a round sticker badge with a thick white die-cut border, showing a cute round compass with a red needle. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/stickers/matematik/g1_bayrak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: hedef bayrağı (u01 durak 3, Hedefe git)

```
a round sticker badge with a thick white die-cut border, showing a small red flag on a pole stuck in a green grass mound. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 4. `assets/images/stickers/matematik/g1_eldiven.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: bir çift eş eldiven (u01 durak 4, Eşini bul)

```
a round sticker badge with a thick white die-cut border, showing a matching pair of identical striped mittens. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 5. `assets/images/stickers/matematik/g1_sepet.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: meyve ve oyuncak sepeti (u02 durak 6, Grubu parçalara ayır)

```
a round sticker badge with a thick white die-cut border, showing a woven basket holding an apple, a pear and a toy ball. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 6. `assets/images/stickers/matematik/g1_kupa.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: yarış kupası (u02 durak 7, Kaçıncı sırada?)

```
a round sticker badge with a thick white die-cut border, showing a shiny golden trophy cup with two handles. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 7. `assets/images/stickers/matematik/g1_terazi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: eşit kollu terazi (u02 durak 8, Hangisi daha çok?)

```
a round sticker badge with a thick white die-cut border, showing a cute balance scale with two pans, perfectly level. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 8. `assets/images/stickers/matematik/g1_davul.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: davul (u02 durak 9, Ritmik sayalım)

```
a round sticker badge with a thick white die-cut border, showing a small red toy drum with two drumsticks. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 9. `assets/images/stickers/matematik/g1_roket.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: roket (u02 durak 10, Geriye sayalım)

```
a round sticker badge with a thick white die-cut border, showing a cute toy rocket taking off with a small puff of smoke. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 10. `assets/images/stickers/matematik/g1_kolye.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: boncuk kolye (u02 durak 11, Örüntüyü tamamla)

```
a round sticker badge with a thick white die-cut border, showing a bead necklace with a repeating pattern of round red and square blue beads. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 11. `assets/images/stickers/matematik/g1_cetvel.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: karış ölçen el (u03 durak 1, Neyle ölçeriz?)

```
a round sticker badge with a thick white die-cut border, showing a child's open hand measuring a hand span next to a yellow pencil. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 12. `assets/images/stickers/matematik/g1_kantar.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: küplerle tartı (u03 durak 2, Tahmin et, tart)

```
a round sticker badge with a thick white die-cut border, showing a balance scale with an apple on one pan and small green cubes on the other. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 13. `assets/images/stickers/matematik/g1_hikaye.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: açık hikâye kitabı (u04 durak 1, Arttı mı, azaldı mı?)

```
a round sticker badge with a thick white die-cut border, showing an open picture book with a balloon drawn on the page. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 14. `assets/images/stickers/matematik/g1_ucan_balon.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: uçan balonlar (u04 durak 2, Balon patlat)

```
a round sticker badge with a thick white die-cut border, showing two bright party balloons floating up with curly strings. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 15. `assets/images/stickers/matematik/g1_baykus.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: bilge baykuş (u04 durak 3, Tahmin et, hesapla)

```
a round sticker badge with a thick white die-cut border, showing a cute round owl with big glasses thinking. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 16. `assets/images/stickers/matematik/g1_tahterevalli.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: dengede tahterevalli (u04 durak 4, Terazi dengede)

```
a round sticker badge with a thick white die-cut border, showing a playground seesaw perfectly level. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 17. `assets/images/stickers/matematik/g1_aile.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: kardeş kalpler (u04 durak 5, İşlem ailesi)

```
a round sticker badge with a thick white die-cut border, showing two small hearts holding hands, one orange and one blue. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 18. `assets/images/stickers/matematik/g1_kumbara.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: domuzcuk kumbara (u05 durak 1, Parayı tanı)

```
a round sticker badge with a thick white die-cut border, showing a cute pink piggy bank with a coin going into the slot, coin without any marks. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 19. `assets/images/stickers/matematik/g1_cuzdan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: cüzdan (u05 durak 2, Para ve sayı)

```
a round sticker badge with a thick white die-cut border, showing a small green wallet with a plain paper note peeking out, no marks on the note. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 20. `assets/images/stickers/matematik/g1_altin.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: parlak madeni paralar (u05 durak 3, Kumbarada ne var?)

```
a round sticker badge with a thick white die-cut border, showing a small stack of shiny plain golden coins without any marks. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 21. `assets/images/stickers/matematik/g1_tekerlek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: tekerlek (u06 durak 1, Yuvarlak mı, köşeli mi?)

```
a round sticker badge with a thick white die-cut border, showing a round toy wheel next to a square toy block. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 22. `assets/images/stickers/matematik/g1_ev.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: şekillerden ev (u06 durak 2, Yapılardaki şekiller)

```
a round sticker badge with a thick white die-cut border, showing a tiny house made of a triangle roof, a square window and a rectangle door. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 23. `assets/images/stickers/matematik/g1_ucurtma.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: uçurtma (u06 durak 3, Şekilleri sınıflandır)

```
a round sticker badge with a thick white die-cut border, showing a colorful kite with a wavy tail. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 24. `assets/images/stickers/matematik/g1_mozaik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: renkli şekil mozaiği (u06 durak 4, Aynı şekil, farklı renk)

```
a round sticker badge with a thick white die-cut border, showing a small mosaic of a red triangle, a blue square and an orange circle. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 25. `assets/images/stickers/matematik/g1_defter.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: çetele defteri (u07 durak 1, Çetele tut)

```
a round sticker badge with a thick white die-cut border, showing a small notebook with tally marks drawn as groups of short lines, no numbers. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 26. `assets/images/stickers/matematik/g1_grafik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: nesne grafiği (u07 durak 2, Nesne grafiği)

```
a round sticker badge with a thick white die-cut border, showing three short columns of stacked toy blocks of different heights, like a picture graph. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```


---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Sprite'larda arka plan silindi, şeffaf PNG
- [ ] Görselde yazı, harf ya da rakam yok
- [ ] Stil önceki partilerle tutarlı (yan yana koyup bak)
- [ ] `godot --headless --path . -s res://tools/missing_assets.gd` bu dosyaları artık eksik göstermiyor
- [ ] Commit: `assets: 033 matematik çıkartmaları (faz 3c)`
