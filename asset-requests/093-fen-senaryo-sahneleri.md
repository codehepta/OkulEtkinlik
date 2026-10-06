# 093 · Fen Bilimleri 3 durum sahneleri

**Öncelik: ORTA** (Faz 6, Keşif Laboratuvarı). `scenario` turlarının üstünde, çerçeve içinde gösterilen durum sahneleri (`item.fen.sahne.<ad>`). Çocuk sahneye bakıp alttaki kartlardan birini seçer.

Hepsi gelene kadar oyun her görsel için Türkçe adını yazan renkli bir yer tutucu gösterir; dosyayı tablodaki yola koymak yeterlidir, kod değişikliği gerekmez.

- Sahneler 16:9 üretilir, arka planı **silinmez**. Oyunda yaklaşık 680×380 px gösterilir: ana konu ortada ve büyük, ayrıntı az olmalı.
- Keşif Laboratuvarı paleti her sahne promptunun sonuna eklendi; doğa sahnelerinde (göl, orman) bu palet yalnızca vurgu renklerini belirler.
- Grafik sahnesinde (`tuketim_grafik`) sütunlarda sayı ya da yazı olmamalı; soldaki sütun uzun, sağdaki belirgin biçimde kısa olmalı.
- `alti_lamba` sahnesinde tam altı pencere ışıklı olmalı; çocuk sayabilir.

Stil bloğu: `docs/assets/style-guide.md` → `STYLE_SCENE`. Promptların sonunda tam metin olarak yer alıyor.


## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/items/fen/sahne/dinozor_merak.png` | 16:9 | — | Dinozorları merak eden çocuk (ünite 1, "Bilgiye ulaşma yolları") |
| 2 | `assets/images/items/fen/sahne/yuzen_oyuncaklar.png` | 16:9 | — | Su dolu leğen ve oyuncaklar (ünite 1, "Bilgiye ulaşma yolları") |
| 3 | `assets/images/items/fen/sahne/kus_yemlik.png` | 16:9 | — | Kuş yemliği (ünite 1, "Bilgiye ulaşma yolları") |
| 4 | `assets/images/items/fen/sahne/karisik_cop.png` | 16:9 | — | Karışık çöp kutusu (ünite 4, "Atıkları ayrıştıralım") |
| 5 | `assets/images/items/fen/sahne/cam_kagit_kutusu.png` | 16:9 | — | Kâğıt kutusunda cam şişe (ünite 4, "Atıkları ayrıştıralım") |
| 6 | `assets/images/items/fen/sahne/top_duvar.png` | 16:9 | — | Duvara çarpan top (ünite 5, "Hareket durumları") |
| 7 | `assets/images/items/fen/sahne/top_yola.png` | 16:9 | — | Yola yuvarlanan top (ünite 5, "Hareket durumları") |
| 8 | `assets/images/items/fen/sahne/oyun_hamuru.png` | 16:9 | — | Oyun hamuruna bastırma (ünite 5, "İtme ve çekme") |
| 9 | `assets/images/items/fen/sahne/durgun_top.png` | 16:9 | — | Çimende duran top (ünite 5, "İtme ve çekme") |
| 10 | `assets/images/items/fen/sahne/iki_vurus.png` | 16:9 | — | Yavaş ve güçlü vuruş (ünite 5, "İtme ve çekme") |
| 11 | `assets/images/items/fen/sahne/islak_el.png` | 16:9 | — | Islak eller ve saç kurutma makinesi (ünite 6, "Elektriği güvenle kullanalım") |
| 12 | `assets/images/items/fen/sahne/yipranmis_kablo.png` | 16:9 | — | Yıpranmış kablo (ünite 6, "Elektriği güvenle kullanalım") |
| 13 | `assets/images/items/fen/sahne/fis_cekme.png` | 16:9 | — | Prize takılı lamba fişi (ünite 6, "Elektriği güvenle kullanalım") |
| 14 | `assets/images/items/fen/sahne/alti_lamba.png` | 16:9 | — | Altı lambası yanan ev (ünite 6, "Elektriği tasarruflu kullanalım") |
| 15 | `assets/images/items/fen/sahne/bosa_yanan_lamba.png` | 16:9 | — | Boşa yanan koridor lambası (ünite 6, "Elektriği tasarruflu kullanalım") |
| 16 | `assets/images/items/fen/sahne/tuketim_grafik.png` | 16:9 | — | Elektrik tüketim grafiği (ünite 6, "Elektriği tasarruflu kullanalım") |
| 17 | `assets/images/items/fen/sahne/gol_cop.png` | 16:9 | — | Çöplü göl (ünite 8, "Yaşam alanlarını koruyalım") |
| 18 | `assets/images/items/fen/sahne/kesilmis_orman.png` | 16:9 | — | Ağaçları kesilmiş orman (ünite 8, "Yaşam alanlarını koruyalım") |
| 19 | `assets/images/items/fen/sahne/temiz_gol.png` | 16:9 | — | Temizlenen göl (ünite 8, "Yaşam alanlarını koruyalım") |

## Promptlar

### 1. `assets/images/items/fen/sahne/dinozor_merak.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Dinozorları merak eden çocuk (ünite 1, "Bilgiye ulaşma yolları").

```
a child in a natural history museum hall looking up in wonder at a big friendly dinosaur skeleton model, dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/items/fen/sahne/yuzen_oyuncaklar.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Su dolu leğen ve oyuncaklar (ünite 1, "Bilgiye ulaşma yolları").

```
a child next to a big tub of water, holding a toy boat, a rubber duck, a small stone and a wooden spoon, wondering which will float, dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/items/fen/sahne/kus_yemlik.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Kuş yemliği (ünite 1, "Bilgiye ulaşma yolları").

```
a garden bird feeder with exactly THREE small bowls of different seeds, a few small birds around it, a child watching from a window, dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 4. `assets/images/items/fen/sahne/karisik_cop.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Karışık çöp kutusu (ünite 4, "Atıkları ayrıştıralım").

```
a single school trash bin overflowing with mixed paper, plastic bottles and glass jars all together, dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 5. `assets/images/items/fen/sahne/cam_kagit_kutusu.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Kâğıt kutusunda cam şişe (ünite 4, "Atıkları ayrıştıralım").

```
a blue paper recycling bin with newspapers and a green glass bottle wrongly thrown inside, dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 6. `assets/images/items/fen/sahne/top_duvar.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Duvara çarpan top (ünite 5, "Hareket durumları").

```
a ball bouncing off a brick wall with curved motion lines showing it going back, dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 7. `assets/images/items/fen/sahne/top_yola.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Yola yuvarlanan top (ünite 5, "Hareket durumları").

```
a ball rolling fast from a park towards a street with a car coming in the distance, a child standing on the grass, dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 8. `assets/images/items/fen/sahne/oyun_hamuru.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Oyun hamuruna bastırma (ünite 5, "İtme ve çekme").

```
a child's hand pressing down on a ball of colorful play dough, flattening it, dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 9. `assets/images/items/fen/sahne/durgun_top.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Çimende duran top (ünite 5, "İtme ve çekme").

```
a ball resting still on green grass on a calm day, no wind, dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 10. `assets/images/items/fen/sahne/iki_vurus.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Yavaş ve güçlü vuruş (ünite 5, "İtme ve çekme").

```
exactly TWO lanes on a field: in the top lane a ball kicked softly stopped close, in the bottom lane a ball kicked hard went far, exactly TWO little flags marking where the balls stopped, dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 11. `assets/images/items/fen/sahne/islak_el.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Islak eller ve saç kurutma makinesi (ünite 6, "Elektriği güvenle kullanalım").

```
a child in a bathroom with wet dripping hands looking at a hair dryer plugged near the sink, dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 12. `assets/images/items/fen/sahne/yipranmis_kablo.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Yıpranmış kablo (ünite 6, "Elektriği güvenle kullanalım").

```
a table lamp on the floor with its long cable running along the floor to a wall socket; in the middle of the cable the outer cover is torn open and red and blue inner wires stick out of the damaged spot, clearly visible, dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 13. `assets/images/items/fen/sahne/fis_cekme.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Prize takılı lamba fişi (ünite 6, "Elektriği güvenle kullanalım").

```
a desk lamp plugged into a wall socket, the plug and cord clearly visible, dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 14. `assets/images/items/fen/sahne/alti_lamba.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Altı lambası yanan ev (ünite 6, "Elektriği tasarruflu kullanalım").

```
a cozy two-story house at dusk seen from outside with exactly SIX windows glowing with warm light, exactly TWO of those six showing empty rooms with nobody inside, dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 15. `assets/images/items/fen/sahne/bosa_yanan_lamba.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Boşa yanan koridor lambası (ünite 6, "Elektriği tasarruflu kullanalım").

```
an empty hallway in daylight with a ceiling lamp switched on and nobody around, dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 16. `assets/images/items/fen/sahne/tuketim_grafik.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Elektrik tüketim grafiği (ünite 6, "Elektriği tasarruflu kullanalım").

```
a simple bar chart drawn on a little chalkboard: a tall turquoise bar on the left and a shorter turquoise bar on the right, a light bulb icon above, no numbers, no letters, dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 17. `assets/images/items/fen/sahne/gol_cop.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Çöplü göl (ünite 8, "Yaşam alanlarını koruyalım").

```
a lake with a few fish, a plastic bag and a bottle floating on the water, dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 18. `assets/images/items/fen/sahne/kesilmis_orman.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Ağaçları kesilmiş orman (ünite 8, "Yaşam alanlarını koruyalım").

```
a forest clearing with many tree stumps, a worried squirrel and a little bird looking around, dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 19. `assets/images/items/fen/sahne/temiz_gol.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Temizlenen göl (ünite 8, "Yaşam alanlarını koruyalım").

```
a clean sparkling lake with young saplings newly planted around its shore, children waving, dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```


---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Sahne tam kare değil 16:9, arka plan silinmez (sahne görseli)
- [ ] Görselde yazı, harf ya da rakam yok
- [ ] Stil önceki partilerle tutarlı (yan yana koyup bak)
- [ ] Commit: `assets: 093 fen senaryo sahneleri`
