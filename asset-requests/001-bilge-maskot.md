# 001 · Bilge (maskot) — karakter sayfası ve pozlar

**Öncelik: EN YÜKSEK.** Bu parti, sonraki bütün partilerin referansıdır.

**Akış:**
1. Önce 1 numaralı karakter sayfasını üret. Beğenene kadar tekrar et; bu görsel karakterin "kimliği" olacak.
2. Sayfayı `assets/images/characters/bilge/sheet.png` olarak kaydet. Bu görselin arka planı silinmez.
3. 2–10 numaralı pozları üretirken karakter sayfasını **referans görsel olarak ekle**.
4. Pozların arka planını sil ve şeffaf PNG olarak kaydet.

Stil ayrıntıları: `docs/assets/style-guide.md`


## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/characters/bilge/sheet.png` | 16:9 | — | Karakter sayfası: önden, yandan, arkadan + 3 yüz ifadesi. Tüm sonraki Bilge görsellerinin referansı. |
| 2 | `assets/images/characters/bilge/idle.png` | 1:1 | `assets/images/characters/bilge/sheet.png` | Bekleme: dik duruyor, hafif gülümsüyor. |
| 3 | `assets/images/characters/bilge/happy.png` | 1:1 | `assets/images/characters/bilge/sheet.png` | Sevinç: gözler kısılmış, kocaman gülümseme. |
| 4 | `assets/images/characters/bilge/cheer.png` | 1:1 | `assets/images/characters/bilge/sheet.png` | Kutlama: kanatlar havada zıplıyor. |
| 5 | `assets/images/characters/bilge/thinking.png` | 1:1 | `assets/images/characters/bilge/sheet.png` | Düşünme: kanadı çenesinde. |
| 6 | `assets/images/characters/bilge/encourage.png` | 1:1 | `assets/images/characters/bilge/sheet.png` | Cesaretlendirme: şefkatli gülümseme, bir kanat ileri. |
| 7 | `assets/images/characters/bilge/point_right.png` | 1:1 | `assets/images/characters/bilge/sheet.png` | Göstermek: kanadıyla sağı işaret ediyor. |
| 8 | `assets/images/characters/bilge/wave.png` | 1:1 | `assets/images/characters/bilge/sheet.png` | Selam: kanat sallıyor. |
| 9 | `assets/images/characters/bilge/sleepy.png` | 1:1 | `assets/images/characters/bilge/sheet.png` | Uyku zamanı: esniyor, gözleri yarı kapalı, kepin yerinde gece başlığı. |
| 10 | `assets/images/characters/bilge/surprised.png` | 1:1 | `assets/images/characters/bilge/sheet.png` | Şaşırma: gözler kocaman, kanatlar açık. |

## Promptlar

### 1. `assets/images/characters/bilge/sheet.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Karakter sayfası: önden, yandan, arkadan + 3 yüz ifadesi. Tüm sonraki Bilge görsellerinin referansı.

```
Character turnaround reference sheet. Bilge: a small chubby round baby owl made of clay, honey-orange feathers, cream belly, huge friendly green eyes, tiny orange beak, small purple graduation cap tilted on the head, red scarf around the neck, short stubby wings, tiny orange feet. Show the same character five times in a row on one sheet, evenly spaced: front view, three-quarter view, side view, back view, and a close-up of the face with three small expression insets (happy, surprised, thinking). Consistent proportions and colors in every view, neutral standing pose. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, all views fully visible and not overlapping, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/characters/bilge/idle.png`

- **Oran:** 1:1  
- **Referans görsel:** `assets/images/characters/bilge/sheet.png`  
- **Açıklama:** Bekleme: dik duruyor, hafif gülümsüyor.

```
Use the attached reference image for the exact character design. Bilge: a small chubby round baby owl made of clay, honey-orange feathers, cream belly, huge friendly green eyes, tiny orange beak, small purple graduation cap tilted on the head, red scarf around the neck, short stubby wings, tiny orange feet. Pose: standing upright, calm gentle smile, wings relaxed at the sides, looking at the viewer. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/characters/bilge/happy.png`

- **Oran:** 1:1  
- **Referans görsel:** `assets/images/characters/bilge/sheet.png`  
- **Açıklama:** Sevinç: gözler kısılmış, kocaman gülümseme.

```
Use the attached reference image for the exact character design. Bilge: a small chubby round baby owl made of clay, honey-orange feathers, cream belly, huge friendly green eyes, tiny orange beak, small purple graduation cap tilted on the head, red scarf around the neck, short stubby wings, tiny orange feet. Pose: very happy, big open smile, eyes squeezed into happy arcs, slight bounce pose. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 4. `assets/images/characters/bilge/cheer.png`

- **Oran:** 1:1  
- **Referans görsel:** `assets/images/characters/bilge/sheet.png`  
- **Açıklama:** Kutlama: kanatlar havada zıplıyor.

```
Use the attached reference image for the exact character design. Bilge: a small chubby round baby owl made of clay, honey-orange feathers, cream belly, huge friendly green eyes, tiny orange beak, small purple graduation cap tilted on the head, red scarf around the neck, short stubby wings, tiny orange feet. Pose: jumping in the air with both wings raised high in celebration, joyful open beak, feet off the ground. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 5. `assets/images/characters/bilge/thinking.png`

- **Oran:** 1:1  
- **Referans görsel:** `assets/images/characters/bilge/sheet.png`  
- **Açıklama:** Düşünme: kanadı çenesinde.

```
Use the attached reference image for the exact character design. Bilge: a small chubby round baby owl made of clay, honey-orange feathers, cream belly, huge friendly green eyes, tiny orange beak, small purple graduation cap tilted on the head, red scarf around the neck, short stubby wings, tiny orange feet. Pose: thinking pose, one wing tip touching the beak, eyes looking up, head slightly tilted, curious expression. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 6. `assets/images/characters/bilge/encourage.png`

- **Oran:** 1:1  
- **Referans görsel:** `assets/images/characters/bilge/sheet.png`  
- **Açıklama:** Cesaretlendirme: şefkatli gülümseme, bir kanat ileri.

```
Use the attached reference image for the exact character design. Bilge: a small chubby round baby owl made of clay, honey-orange feathers, cream belly, huge friendly green eyes, tiny orange beak, small purple graduation cap tilted on the head, red scarf around the neck, short stubby wings, tiny orange feet. Pose: warm encouraging smile, one wing stretched forward gently as if saying you can do it, kind eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 7. `assets/images/characters/bilge/point_right.png`

- **Oran:** 1:1  
- **Referans görsel:** `assets/images/characters/bilge/sheet.png`  
- **Açıklama:** Göstermek: kanadıyla sağı işaret ediyor.

```
Use the attached reference image for the exact character design. Bilge: a small chubby round baby owl made of clay, honey-orange feathers, cream belly, huge friendly green eyes, tiny orange beak, small purple graduation cap tilted on the head, red scarf around the neck, short stubby wings, tiny orange feet. Pose: pointing to the right side with one wing, looking in the same direction, friendly expression. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 8. `assets/images/characters/bilge/wave.png`

- **Oran:** 1:1  
- **Referans görsel:** `assets/images/characters/bilge/sheet.png`  
- **Açıklama:** Selam: kanat sallıyor.

```
Use the attached reference image for the exact character design. Bilge: a small chubby round baby owl made of clay, honey-orange feathers, cream belly, huge friendly green eyes, tiny orange beak, small purple graduation cap tilted on the head, red scarf around the neck, short stubby wings, tiny orange feet. Pose: waving hello with one wing raised, cheerful smile. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 9. `assets/images/characters/bilge/sleepy.png`

- **Oran:** 1:1  
- **Referans görsel:** `assets/images/characters/bilge/sheet.png`  
- **Açıklama:** Uyku zamanı: esniyor, gözleri yarı kapalı, kepin yerinde gece başlığı.

```
Use the attached reference image for the exact character design. Bilge: a small chubby round baby owl made of clay, honey-orange feathers, cream belly, huge friendly green eyes, tiny orange beak, small purple graduation cap tilted on the head, red scarf around the neck, short stubby wings, tiny orange feet. Pose: sleepy and yawning, eyes half closed, wearing a soft blue nightcap instead of the graduation cap, holding a tiny pillow. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 10. `assets/images/characters/bilge/surprised.png`

- **Oran:** 1:1  
- **Referans görsel:** `assets/images/characters/bilge/sheet.png`  
- **Açıklama:** Şaşırma: gözler kocaman, kanatlar açık.

```
Use the attached reference image for the exact character design. Bilge: a small chubby round baby owl made of clay, honey-orange feathers, cream belly, huge friendly green eyes, tiny orange beak, small purple graduation cap tilted on the head, red scarf around the neck, short stubby wings, tiny orange feet. Pose: surprised and amazed, eyes extra wide, small round open beak, wings slightly spread. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```



---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Sprite'larda arka plan silindi, şeffaf PNG
- [ ] Görselde yazı, harf ya da rakam yok
- [ ] Stil önceki partilerle tutarlı (yan yana koyup bak)
- [ ] Commit: `assets: <parti no> <kısa açıklama>`
