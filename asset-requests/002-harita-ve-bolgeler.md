# 002 · Ada haritası, bölge arka planları ve ikonlar

**Öncelik: YÜKSEK** (Faz 1 dikey dilimi için harita, Sayı Ormanı ve Ağaç Evi gerekiyor).

- Arka planlarda (`map/island.png`, `regions/*/bg.png`) **arka plan silinmez.**
- İkon ve duraklarda arka planı sil, şeffaf PNG kaydet.
- Harita ve arka planlarda ortada boş alan bırakılması önemli; oyun butonları ve kartları oraya gelecek.


## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/map/island.png` | 16:9 | — | Ada haritası: kuşbakışı (3/4 açı) ada, 4 bölge + ortada ağaç ev. Arka plan silinmez. |
| 2 | `assets/images/regions/sayi_ormani/bg.png` | 16:9 | — | Sayı Ormanı arka planı (Matematik). |
| 3 | `assets/images/regions/harf_vadisi/bg.png` | 16:9 | — | Harf Vadisi arka planı (Türkçe). |
| 4 | `assets/images/regions/hayat_kasabasi/bg.png` | 16:9 | — | Hayat Kasabası arka planı (Hayat Bilgisi). |
| 5 | `assets/images/regions/kesif_laboratuvari/bg.png` | 16:9 | — | Keşif Laboratuvarı arka planı (Fen, 3. sınıf). |
| 6 | `assets/images/regions/agac_ev/bg.png` | 16:9 | — | Bilge'nin Ağaç Evi iç mekânı (dekorasyon odası). |
| 7 | `assets/images/regions/sayi_ormani/icon.png` | 1:1 | — | Sayı Ormanı bölge ikonu. |
| 8 | `assets/images/regions/harf_vadisi/icon.png` | 1:1 | — | Harf Vadisi bölge ikonu. |
| 9 | `assets/images/regions/hayat_kasabasi/icon.png` | 1:1 | — | Hayat Kasabası bölge ikonu. |
| 10 | `assets/images/regions/kesif_laboratuvari/icon.png` | 1:1 | — | Keşif Laboratuvarı bölge ikonu. |
| 11 | `assets/images/regions/agac_ev/icon.png` | 1:1 | — | Ağaç Evi ikonu. |
| 12 | `assets/images/map/stop_open.png` | 1:1 | — | Patika durağı — açık (oynanabilir). |
| 13 | `assets/images/map/stop_done.png` | 1:1 | — | Patika durağı — tamamlandı. |
| 14 | `assets/images/map/stop_locked.png` | 1:1 | — | Patika durağı — kilitli. |
| 15 | `assets/images/map/stop_review.png` | 1:1 | — | Tekrar Bulutu durağı. |

## Promptlar

### 1. `assets/images/map/island.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Ada haritası: kuşbakışı (3/4 açı) ada, 4 bölge + ortada ağaç ev. Arka plan silinmez.

```
A whimsical round island floating in a calm turquoise sea, seen from a high three-quarter top-down angle, divided into four clearly separated themed areas around a big cozy tree house in the center: top-left a lush green forest with orange and yellow fruit trees; top-right a soft purple and pink valley with gentle hills and flowers; bottom-left a sunny little town with yellow houses, blue roofs and red brick paths; bottom-right a turquoise and white science corner with a small dome observatory and bubbling pools. Winding sandy paths connect each area to the central tree house. Each area has open flat space for game buttons. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/regions/sayi_ormani/bg.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sayı Ormanı arka planı (Matematik).

```
Game background scene: a friendly clay forest clearing with round fruit trees, mushrooms, a little wooden bridge over a stream, soft hills. dominant palette: leafy greens, warm orange and honey yellow accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/regions/harf_vadisi/bg.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Harf Vadisi arka planı (Türkçe).

```
Game background scene: a gentle clay valley with rolling lavender hills, giant soft flowers, a winding stream, floating balloons and small clouds. dominant palette: soft lavender purple, bubblegum pink and cream accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 4. `assets/images/regions/hayat_kasabasi/bg.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Hayat Kasabası arka planı (Hayat Bilgisi).

```
Game background scene: a cozy clay small town street with a school building, a park, a bakery, a pedestrian crossing and trees. dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 5. `assets/images/regions/kesif_laboratuvari/bg.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Keşif Laboratuvarı arka planı (Fen, 3. sınıf).

```
Game background scene: a bright clay nature science lab outdoors-indoors mix with plant pots, a magnifying glass stand, a small telescope, colorful flasks on shelves and a window to a garden. dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 6. `assets/images/regions/agac_ev/bg.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Bilge'nin Ağaç Evi iç mekânı (dekorasyon odası).

```
Game background scene: the cozy interior of a round tree house room with wooden walls, a big round window, empty shelves, an empty rug area in the middle and empty wall spots for decorations. dominant palette: warm wood browns, cozy orange light, soft green leaves. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 7. `assets/images/regions/sayi_ormani/icon.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sayı Ormanı bölge ikonu.

```
a small round clay tree with orange fruits growing on a grassy mound. dominant palette: leafy greens, warm orange and honey yellow accents. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 8. `assets/images/regions/harf_vadisi/icon.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Harf Vadisi bölge ikonu.

```
a small clay purple hill with a big pink flower and a tiny cloud. dominant palette: soft lavender purple, bubblegum pink and cream accents. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 9. `assets/images/regions/hayat_kasabasi/icon.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hayat Kasabası bölge ikonu.

```
a tiny clay yellow house with a blue roof and a little red door. dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 10. `assets/images/regions/kesif_laboratuvari/icon.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Keşif Laboratuvarı bölge ikonu.

```
a clay round-bottom flask with turquoise bubbling liquid next to a small magnifying glass. dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 11. `assets/images/regions/agac_ev/icon.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ağaç Evi ikonu.

```
a tiny cozy clay tree house with a round window and warm light. dominant palette: warm wood browns, cozy orange light, soft green leaves. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 12. `assets/images/map/stop_open.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Patika durağı — açık (oynanabilir).

```
a round flat clay stepping stone button, glossy bright orange with a soft glow rim. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 13. `assets/images/map/stop_done.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Patika durağı — tamamlandı.

```
a round flat clay stepping stone button, mint green with a small embossed checkmark shape made of clay. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 14. `assets/images/map/stop_locked.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Patika durağı — kilitli.

```
a round flat clay stepping stone button, muted grey with a tiny clay padlock on top. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 15. `assets/images/map/stop_review.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tekrar Bulutu durağı.

```
a fluffy round clay cloud, soft white and light blue, with a gentle circular arrow shape on it made of clay. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```



---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Sprite'larda arka plan silindi, şeffaf PNG
- [ ] Görselde yazı, harf ya da rakam yok
- [ ] Stil önceki partilerle tutarlı (yan yana koyup bak)
- [ ] Commit: `assets: <parti no> <kısa açıklama>`
