# 032 · 1. sınıf Matematik: yarışçı hayvanlar, küçük oyuncaklar ve hikâye sahneleri

**Öncelik: ORTA** (Faz 3c). Sıra sayısı durağındaki yarışçı hayvanlar (u02 "Kaçıncı sırada?": hepsi sağa bakar, çünkü yarış soldan sağa okunur), "Eşini bul" durağında büyüklük ölçütü için 004'teki ayıcık ve topun küçük hâlleri ve u04 "Arttı mı, azaldı mı?" hikâyelerinin sahneleri.

Hayvanlar ve küçük oyuncaklar sprite'tır (şeffaf PNG, `STYLE_SPRITE`). Küçük oyuncakları 004'teki `ayicik.png` ve `top.png` dosyalarını **referans görsel** vererek üret; aynı nesne olmalı, yalnızca kadrajda yarı boyda durmalı. Hikâye sahneleri (`item.sahne.*`) kare, arka planlı resimlerdir (şeffaflık yok, `STYLE_SCENE`); sayılar resimde nesne olarak görünür (3 balon + 2 balon gibi), rakam yazılmaz.


## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/items/hayvan/tavsan.png` | 1:1 | — | Tavşan (yarışçı) |
| 2 | `assets/images/items/hayvan/kaplumbaga.png` | 1:1 | — | Kaplumbağa (yarışçı) |
| 3 | `assets/images/items/hayvan/kedi.png` | 1:1 | — | Kedi |
| 4 | `assets/images/items/hayvan/kopek.png` | 1:1 | — | Köpek |
| 5 | `assets/images/items/oyuncak/ayicik_kucuk.png` | 1:1 | — | Küçük oyuncak ayı (004'teki ayıcığın aynısı, belirgin biçimde küçük) |
| 6 | `assets/images/items/oyuncak/top_kucuk.png` | 1:1 | — | Küçük top (004'teki topun aynısı, belirgin biçimde küçük) |

## Promptlar

### 1. `assets/images/items/hayvan/tavsan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tavşan (yarışçı)

```
a cute white bunny running, side view facing right. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/items/hayvan/kaplumbaga.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kaplumbağa (yarışçı)

```
a cute green turtle walking, side view facing right. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/items/hayvan/kedi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kedi

```
a cute grey kitten sitting, side view facing right. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 4. `assets/images/items/hayvan/kopek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Köpek

```
a cute brown puppy trotting, side view facing right. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 5. `assets/images/items/oyuncak/ayicik_kucuk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Küçük oyuncak ayı (004'teki ayıcığın aynısı, belirgin biçimde küçük)

```
the same soft brown teddy bear as in item ayicik but drawn noticeably smaller in the frame, about half size, lots of empty space around it. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 6. `assets/images/items/oyuncak/top_kucuk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Küçük top (004'teki topun aynısı, belirgin biçimde küçük)

```
the same colorful toy ball as in item top but drawn noticeably smaller in the frame, about half size, lots of empty space around it. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

## Hikâye sahneleri

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 7 | `assets/images/items/sahne/balonlar.png` | 1:1 | — | Hikâye: Ece'nin üç balonu, annesi iki balon daha veriyor |
| 8 | `assets/images/items/sahne/kuslar.png` | 1:1 | — | Hikâye: dalda yedi kuş, üçü uçup gidiyor |
| 9 | `assets/images/items/sahne/bilyeler.png` | 1:1 | — | Hikâye: Can'ın bilyeleri, arkadaşı dört bilye veriyor |

## Promptlar

### 7. `assets/images/items/sahne/balonlar.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye: Ece'nin üç balonu, annesi iki balon daha veriyor

```
in a sunny park, a little girl on the left holds exactly THREE balloons (red, yellow, blue) on strings in one hand, and her smiling mother on the right holds out exactly TWO more balloons (green, orange) to her; five balloons in total, three with the girl and two with the mother, clearly separated. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. Dominant palette: leafy greens, warm orange and honey yellow accents.
```

### 8. `assets/images/items/sahne/kuslar.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye: dalda yedi kuş, üçü uçup gidiyor

```
one long horizontal tree branch with exactly FOUR small round birds sitting in a row on it, and exactly THREE small birds flying away in the open sky to the right; seven birds in total, four sitting and three flying, clearly separated. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. Dominant palette: leafy greens, warm orange and honey yellow accents.
```

### 9. `assets/images/items/sahne/bilyeler.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye: Can'ın bilyeleri, arkadaşı dört bilye veriyor

```
on a school playground, a little boy kneeling next to a small pile of colorful glass marbles on the ground, and his friend holding out an open hand with exactly FOUR big colorful marbles clearly visible on the palm, giving them to him. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. Dominant palette: leafy greens, warm orange and honey yellow accents.
```


---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Hayvan ve oyuncak sprite'larında arka plan silindi, şeffaf PNG; sahnelerde arka plan var
- [ ] Görselde yazı, harf ya da rakam yok
- [ ] Hikâye sahnelerinde nesne sayıları hikâyeyle aynı (3 + 2 balon, 4 konan + 3 uçan kuş, bilye yığını + 4 bilye)
- [ ] `godot --headless --path . -s res://tools/missing_assets.gd` bu dosyaları artık eksik göstermiyor
- [ ] Commit: `assets: 032 yarışçı hayvanlar, küçük oyuncaklar ve hikâye sahneleri`
