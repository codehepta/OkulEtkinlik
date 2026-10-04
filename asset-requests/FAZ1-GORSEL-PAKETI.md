# Faz 1 Görsel Paketi — Nano Banana

Oyunun şu an beklediği bütün görseller, tek dosyada, üretim sırasıyla: **53 görsel**. Liste `tools/missing_assets.gd` çıktısından (2026-10-04) alındı; promptlar `asset-requests/001–008` dosyalarıyla birebir aynıdır.

## Nasıl çalışılır
1. Gemini'de **Nano Banana** (görsel üretim) modelini aç.
2. Aşağıdaki sırayla ilerle. Her başlıktaki kod bloğunu olduğu gibi kopyala-yapıştır yap ve **Oran** değerini seç.
3. "Referans" yazanlarda önce o görseli sohbete ekle, sonra promptu yapıştır.
4. Sonucu indir:
   - **Arka planı sil**: "Arka plan: SİL" yazan görsellerde (remove.bg, Photoshop, Pixelmator, macOS Önizleme → Anında Alfa vb.) şeffaf PNG kaydet.
   - "Arka plan: KALSIN" yazanlara dokunma.
5. Dosyayı **Dosya** satırındaki yola, aynı adla koy (repo kökünden itibaren). Klasör yoksa oluştur.
6. Kutucuğu işaretle (`- [x]`). Bir adım bitince haber ver: commit'leyip telefona yeni sürümü gönderelim.

**Boyut:** Sprite'lar 1024 px civarı yeterli; arka planlar 16:9 ve en az 1920 px genişlik. Daha büyükse sorun değil.
**Tutarlılık ipucu:** Bir adımda ilk 2 görseli üretince yan yana koyup bak. Stil kaydıysa, beğendiğin görseli referans olarak ekleyip "same style as the reference image" diye başlat.
**Asla:** görselde yazı, harf ya da rakam olmamalı. Model eklerse yeniden üret.

## İlerleme

- **Adım 1 · Bilge (referans önce!)** — 2 görsel
- **Adım 2 · Arayüz ikonları** — 10 görsel
- **Adım 3 · Profil avatarları** — 6 görsel
- **Adım 4 · Harita ve patika** — 14 görsel
- **Adım 5 · Sayma nesneleri (Ünite 1'de kullanılanlar)** — 15 görsel
- **Adım 6 · Ünite 1 çıkartmaları** — 6 görsel


---

## Adım 1 · Bilge (referans önce!)

Önce karakter sayfasını üret, beğenene kadar tekrarla. Sonraki her Bilge görselinde bu sayfayı **referans görsel olarak ekle**. Karakter sayfasının arka planı silinmez.

### 1. Karakter sayfası: önden, yandan, arkadan + 3 yüz ifadesi. Tüm sonraki Bilge görsellerinin referansı.

- [ ] **Dosya:** `assets/images/characters/bilge/sheet.png`  
  **Oran:** 16:9 · **Arka plan:** KALSIN · **Referans:** yok

```
Character turnaround reference sheet. Bilge: a small chubby round baby owl made of clay, honey-orange feathers, cream belly, huge friendly green eyes, tiny orange beak, small purple graduation cap tilted on the head, red scarf around the neck, short stubby wings, tiny orange feet. Show the same character five times in a row on one sheet, evenly spaced: front view, three-quarter view, side view, back view, and a close-up of the face with three small expression insets (happy, surprised, thinking). Consistent proportions and colors in every view, neutral standing pose. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, all views fully visible and not overlapping, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 2. Uyku zamanı: esniyor, gözleri yarı kapalı, kepin yerinde gece başlığı.

- [ ] **Dosya:** `assets/images/characters/bilge/sleepy.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** `assets/images/characters/bilge/sheet.png`

```
Use the attached reference image for the exact character design. Bilge: a small chubby round baby owl made of clay, honey-orange feathers, cream belly, huge friendly green eyes, tiny orange beak, small purple graduation cap tilted on the head, red scarf around the neck, short stubby wings, tiny orange feet. Pose: sleepy and yawning, eyes half closed, wearing a soft blue nightcap instead of the graduation cap, holding a tiny pillow. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```


---

## Adım 2 · Arayüz ikonları

Oyunun her ekranında görünen ikonlar. En büyük görsel farkı bunlar yaratır.

### 3. Tekrar dinle / tekrar oyna ikonu (dönen ok). Yönergeyi yeniden çalan düğmede kullanılır.

- [ ] **Dosya:** `assets/images/ui/replay.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a single thick rounded circular arrow curving clockwise, turquoise clay, replay symbol. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 4. Ana sayfa / harita ikonu.

- [ ] **Dosya:** `assets/images/ui/home.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a chunky clay little house shape, bright red roof and yellow walls. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 5. Geri ikonu.

- [ ] **Dosya:** `assets/images/ui/back.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a chunky rounded clay arrow pointing left, bright green. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 6. Dolu yıldız.

- [ ] **Dosya:** `assets/images/ui/star.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a plump shiny golden yellow five-pointed star made of clay. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 7. Boş yıldız (kazanılmamış).

- [ ] **Dosya:** `assets/images/ui/star_empty.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a plump five-pointed star made of pale grey matte clay, slightly flat. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 8. Kilit ikonu.

- [ ] **Dosya:** `assets/images/ui/lock.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a chunky clay padlock, soft grey with a golden shackle. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 9. Onay (tik) ikonu.

- [ ] **Dosya:** `assets/images/ui/check.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a chunky rounded clay checkmark, bright mint green. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 10. Veli bölümü ikonu (dişli).

- [ ] **Dosya:** `assets/images/ui/parent.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a chunky clay gear cog, soft grey-blue, friendly rounded teeth. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 11. Çıkartma albümü ikonu.

- [ ] **Dosya:** `assets/images/ui/album.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a chunky clay scrapbook album with a heart on the cover, pink and purple. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 12. Çıkartma çerçevesi (boş yuva).

- [ ] **Dosya:** `assets/images/ui/sticker_frame.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
an empty rounded square clay frame slot with a soft dashed border pressed into clay, cream color. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```


---

## Adım 3 · Profil avatarları

Altısı yan yana konduğunda aynı setten çıkmış gibi görünmeli.

### 13. Profil avatarı: Tavşan (baş ve omuz portresi).

- [ ] **Dosya:** `assets/images/avatars/tavsan.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
Head-and-shoulders portrait of a cute clay bunny with long floppy ears, white and soft pink, big friendly eyes, happy smile, facing the viewer. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 14. Profil avatarı: Kedi (baş ve omuz portresi).

- [ ] **Dosya:** `assets/images/avatars/kedi.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
Head-and-shoulders portrait of a cute clay kitten, ginger orange with white muzzle, big friendly eyes, happy smile, facing the viewer. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 15. Profil avatarı: Ayı yavrusu (baş ve omuz portresi).

- [ ] **Dosya:** `assets/images/avatars/ayi.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
Head-and-shoulders portrait of a cute clay bear cub, warm brown with a light tan snout, big friendly eyes, happy smile, facing the viewer. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 16. Profil avatarı: Tilki (baş ve omuz portresi).

- [ ] **Dosya:** `assets/images/avatars/tilki.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
Head-and-shoulders portrait of a cute clay fox cub, bright orange with white cheeks and a fluffy tail peeking, big friendly eyes, happy smile, facing the viewer. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 17. Profil avatarı: Penguen (baş ve omuz portresi).

- [ ] **Dosya:** `assets/images/avatars/penguen.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
Head-and-shoulders portrait of a cute clay penguin chick, navy and white with a tiny yellow beak, big friendly eyes, happy smile, facing the viewer. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 18. Profil avatarı: Kaplumbağa (baş ve omuz portresi).

- [ ] **Dosya:** `assets/images/avatars/kaplumbaga.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
Head-and-shoulders portrait of a cute clay baby turtle, green with a rounded patterned shell, big friendly eyes, happy smile, facing the viewer. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```


---

## Adım 4 · Harita ve patika

`map/island.png` ve bölge arka planlarında (`bg.png`) **arka plan silinmez**; ikon ve duraklarda silinir.

### 19. Ada haritası: kuşbakışı (3/4 açı) ada, 4 bölge + ortada ağaç ev. Arka plan silinmez.

- [ ] **Dosya:** `assets/images/map/island.png`  
  **Oran:** 16:9 · **Arka plan:** KALSIN · **Referans:** yok

```
A whimsical round island floating in a calm turquoise sea, seen from a high three-quarter top-down angle, divided into four clearly separated themed areas around a big cozy tree house in the center: top-left a lush green forest with orange and yellow fruit trees; top-right a soft purple and pink valley with gentle hills and flowers; bottom-left a sunny little town with yellow houses, blue roofs and red brick paths; bottom-right a turquoise and white science corner with a small dome observatory and bubbling pools. Winding sandy paths connect each area to the central tree house. Each area has open flat space for game buttons. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 20. Patika durağı — açık (oynanabilir).

- [ ] **Dosya:** `assets/images/map/stop_open.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a round flat clay stepping stone button, glossy bright orange with a soft glow rim. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 21. Patika durağı — tamamlandı.

- [ ] **Dosya:** `assets/images/map/stop_done.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a round flat clay stepping stone button, mint green with a small embossed checkmark shape made of clay. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 22. Patika durağı — kilitli.

- [ ] **Dosya:** `assets/images/map/stop_locked.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a round flat clay stepping stone button, muted grey with a tiny clay padlock on top. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 23. Tekrar Bulutu durağı.

- [ ] **Dosya:** `assets/images/map/stop_review.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a fluffy round clay cloud, soft white and light blue, with a gentle circular arrow shape on it made of clay. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 24. Sayı Ormanı arka planı (Matematik).

- [ ] **Dosya:** `assets/images/regions/sayi_ormani/bg.png`  
  **Oran:** 16:9 · **Arka plan:** KALSIN · **Referans:** yok

```
Game background scene: a friendly clay forest clearing with round fruit trees, mushrooms, a little wooden bridge over a stream, soft hills. dominant palette: leafy greens, warm orange and honey yellow accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 25. Harf Vadisi arka planı (Türkçe).

- [ ] **Dosya:** `assets/images/regions/harf_vadisi/bg.png`  
  **Oran:** 16:9 · **Arka plan:** KALSIN · **Referans:** yok

```
Game background scene: a gentle clay valley with rolling lavender hills, giant soft flowers, a winding stream, floating balloons and small clouds. dominant palette: soft lavender purple, bubblegum pink and cream accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 26. Hayat Kasabası arka planı (Hayat Bilgisi).

- [ ] **Dosya:** `assets/images/regions/hayat_kasabasi/bg.png`  
  **Oran:** 16:9 · **Arka plan:** KALSIN · **Referans:** yok

```
Game background scene: a cozy clay small town street with a school building, a park, a bakery, a pedestrian crossing and trees. dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 27. Keşif Laboratuvarı arka planı (Fen, 3. sınıf).

- [ ] **Dosya:** `assets/images/regions/kesif_laboratuvari/bg.png`  
  **Oran:** 16:9 · **Arka plan:** KALSIN · **Referans:** yok

```
Game background scene: a bright clay nature science lab outdoors-indoors mix with plant pots, a magnifying glass stand, a small telescope, colorful flasks on shelves and a window to a garden. dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 28. Sayı Ormanı bölge ikonu.

- [ ] **Dosya:** `assets/images/regions/sayi_ormani/icon.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a small round clay tree with orange fruits growing on a grassy mound. dominant palette: leafy greens, warm orange and honey yellow accents. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 29. Harf Vadisi bölge ikonu.

- [ ] **Dosya:** `assets/images/regions/harf_vadisi/icon.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a small clay purple hill with a big pink flower and a tiny cloud. dominant palette: soft lavender purple, bubblegum pink and cream accents. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 30. Hayat Kasabası bölge ikonu.

- [ ] **Dosya:** `assets/images/regions/hayat_kasabasi/icon.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a tiny clay yellow house with a blue roof and a little red door. dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 31. Keşif Laboratuvarı bölge ikonu.

- [ ] **Dosya:** `assets/images/regions/kesif_laboratuvari/icon.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a clay round-bottom flask with turquoise bubbling liquid next to a small magnifying glass. dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 32. Ağaç Evi ikonu.

- [ ] **Dosya:** `assets/images/regions/agac_ev/icon.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a tiny cozy clay tree house with a round window and warm light. dominant palette: warm wood browns, cozy orange light, soft green leaves. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```


---

## Adım 5 · Sayma nesneleri (Ünite 1'de kullanılanlar)

Her görselde **tek** nesne olmalı; oyun nesneyi çoğaltıp sayıyı kendisi oluşturur. Aynı ışık ve benzer tombullukta olmalılar.

### 33. Elma

- [ ] **Dosya:** `assets/images/items/meyve/elma.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a shiny red apple with a small green leaf. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 34. Çilek

- [ ] **Dosya:** `assets/images/items/meyve/cilek.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a red strawberry with green leaves and tiny seeds. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 35. Top

- [ ] **Dosya:** `assets/images/items/oyuncak/top.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a round beach ball with colorful panels. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 36. Oyuncak küp

- [ ] **Dosya:** `assets/images/items/oyuncak/kup.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a single toy building block cube, bright blue, blank faces. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 37. Arı

- [ ] **Dosya:** `assets/images/items/hayvan/ari.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a round friendly bumblebee. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 38. Balık

- [ ] **Dosya:** `assets/images/items/hayvan/balik.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a small round orange fish. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 39. Civciv

- [ ] **Dosya:** `assets/images/items/hayvan/civciv.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a tiny round yellow chick. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 40. Kelebek

- [ ] **Dosya:** `assets/images/items/hayvan/kelebek.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a butterfly with orange and pink wings. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 41. Ördek

- [ ] **Dosya:** `assets/images/items/hayvan/ordek.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a small yellow rubber-duck-like duckling. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 42. Kalem

- [ ] **Dosya:** `assets/images/items/okul/kalem.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a short chunky yellow pencil with a pink eraser. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 43. Kitap

- [ ] **Dosya:** `assets/images/items/okul/kitap.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a closed chunky book with a green cover, blank cover. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 44. Silgi

- [ ] **Dosya:** `assets/images/items/okul/silgi.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a rounded pink eraser. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 45. Çiçek

- [ ] **Dosya:** `assets/images/items/doga/cicek.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a single daisy-like flower with pink petals and a yellow center. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 46. Mantar

- [ ] **Dosya:** `assets/images/items/doga/mantar.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a small red mushroom with white dots. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 47. Taş

- [ ] **Dosya:** `assets/images/items/doga/tas.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a smooth round grey pebble. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```


---

## Adım 6 · Ünite 1 çıkartmaları

Albümde küçük gösterilir; kalın ve sade siluet.

### 48. Çıkartma: gülümseyen elma (durak 1, 1'den 5'e sayalım).

- [ ] **Dosya:** `assets/images/stickers/matematik/elma.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a round sticker badge with a thick white die-cut border, showing a cute smiling shiny red apple with a small green leaf and big friendly eyes. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 49. Çıkartma: oyuncak ayıcık (durak 2, Çubuklar ve sayılar).

- [ ] **Dosya:** `assets/images/stickers/matematik/ayicik.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a round sticker badge with a thick white die-cut border, showing a cute soft brown teddy bear waving one paw. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 50. Çıkartma: üç renkli balon demeti (durak 3, Sayıyı dinle, bul).

- [ ] **Dosya:** `assets/images/stickers/matematik/balon.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a round sticker badge with a thick white die-cut border, showing a small bunch of three happy balloons in red, blue and yellow with curly strings. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 51. Çıkartma: renkli kelebek (durak 4, 6'dan 10'a sayalım).

- [ ] **Dosya:** `assets/images/stickers/matematik/kelebek.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a round sticker badge with a thick white die-cut border, showing a cheerful butterfly with big orange and purple wings and a smiling face. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 52. Çıkartma: gülümseyen çilek (durak 5, 20'ye kadar sayalım).

- [ ] **Dosya:** `assets/images/stickers/matematik/cilek.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a round sticker badge with a thick white die-cut border, showing a cute smiling red strawberry with green leaves and tiny seeds. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 53. Çıkartma: benekli mantar (durak 6, Tahmin et!).

- [ ] **Dosya:** `assets/images/stickers/matematik/mantar.png`  
  **Oran:** 1:1 · **Arka plan:** SİL · **Referans:** yok

```
a round sticker badge with a thick white die-cut border, showing a cute small red mushroom with white dots and a happy face. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```


---

## Daha sonra (şimdilik gerekmiyor)
Bu görseller istek dosyalarında var ama oyunun şu anki sürümü kullanmıyor; ilgili ekranlar geldikçe sırası gelecek:
- Bilge'nin diğer pozları (idle, happy, cheer, thinking, encourage, point_right, wave, surprised) → `001-bilge-maskot.md`
- Ağaç Evi iç mekânı `regions/agac_ev/bg.png` → `002-harita-ve-bolgeler.md`
- `ui/speaker`, `ui/gift`, `ui/hint` → `003-avatarlar-ve-arayuz.md`
- Kullanılmayan sayma nesneleri (armut, muz, portakal, karpuz, balonlar, araba, ayıcık, kuş, tavuk, çanta, yaprak) → `004-sayma-nesneleri.md`
