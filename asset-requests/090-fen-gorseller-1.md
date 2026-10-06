# 090 · Fen Bilimleri 3 görselleri (ünite 1–3)

**Öncelik: ORTA** (Faz 6, Keşif Laboratuvarı). `content/g3/fen/u01–u03.json` turlarında kullanılan nesne, canlı ve davranış kartları: ünite 1–3: bilgiye ulaşma yolları, bilim insanları, canlılar, duyular, yaşam döngüleri, kayaçlar, fosiller. Her dosya `item.fen.<ad>` anahtarıyla yüklenir; aynı görsel birden çok turda tekrar kullanılır.

Hepsi gelene kadar oyun her görsel için Türkçe adını yazan renkli bir yer tutucu gösterir; dosyayı tablodaki yola koymak yeterlidir, kod değişikliği gerekmez.

- Her görsel bir **sprite**tır: arka planı silinir, şeffaf PNG kaydedilir, 1:1. Oyunda kart üstünde 150–300 px gösterilir; silüet küçükte de okunaklı olmalı.
- Kutulara ayırma ve eşleştirme turlarında yan yana durdukları için **aynı ışık ve aynı bakış açısıyla** üretilmeli. Önce 3–4 tanesini üretip birbirine uyduğunu kontrol et.
- Çocuk ve yetişkin figürleri sevimli kil oyuncak insanlar olarak üretilir; gerçek kişilere benzemez. Tehlikeli davranış kartları (ıslak elle priz, yola koşmak) korkutucu değil, sakin ve sade olmalı.
- Görsellerde yazı, harf ya da rakam yok (kitap kapakları, gazete, saat kadranı boş).

Stil bloğu: `docs/assets/style-guide.md` → `STYLE_SPRITE`. Promptların sonunda tam metin olarak yer alıyor.


## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/items/fen/yol_gozlem.png` | 1:1 | — | Gözlem yapmak (ünite 1, "Bilgiye ulaşma yolları") |
| 2 | `assets/images/items/fen/yol_deney.png` | 1:1 | — | Deney yapmak (ünite 1, "Bilgiye ulaşma yolları") |
| 3 | `assets/images/items/fen/yol_kaynak.png` | 1:1 | — | Kaynaklardan araştırmak (ünite 1, "Bilgiye ulaşma yolları") |
| 4 | `assets/images/items/fen/karinca_yuvasi.png` | 1:1 | — | Karınca yuvası (ünite 1, "Bilgiye ulaşma yolları") |
| 5 | `assets/images/items/fen/hilal_ay.png` | 1:1 | — | Ay (ünite 1, "Bilgiye ulaşma yolları") |
| 6 | `assets/images/items/fen/buz_erime.png` | 1:1 | — | Eriyen buz (ünite 1, "Bilgiye ulaşma yolları") |
| 7 | `assets/images/items/fen/miknatis_atac.png` | 1:1 | — | Mıknatıs ve ataç (ünite 1, "Bilgiye ulaşma yolları") |
| 8 | `assets/images/items/fen/dinozor.png` | 1:1 | — | Dinozor (ünite 1, "Bilgiye ulaşma yolları") |
| 9 | `assets/images/items/fen/derin_deniz.png` | 1:1 | — | Derin deniz balığı (ünite 1, "Bilgiye ulaşma yolları") |
| 10 | `assets/images/items/fen/bilim_deniz.png` | 1:1 | — | Bitki bilimci Deniz Hanım (ünite 1, "Bilim insanları") |
| 11 | `assets/images/items/fen/bilim_kerem.png` | 1:1 | — | Gök bilimci Kerem Bey (ünite 1, "Bilim insanları") |
| 12 | `assets/images/items/fen/saksi_bitki.png` | 1:1 | — | Saksıda bitki (ünite 1, "Bilim insanları") |
| 13 | `assets/images/items/fen/teleskop.png` | 1:1 | — | Teleskop (ünite 1, "Bilim insanları") |
| 14 | `assets/images/items/fen/keman.png` | 1:1 | — | Keman (ünite 1, "Bilim insanları") |
| 15 | `assets/images/items/fen/resim_fircasi.png` | 1:1 | — | Resim fırçası ve palet (ünite 1, "Bilim insanları") |
| 16 | `assets/images/items/fen/papatya.png` | 1:1 | — | Papatya (ünite 2, "Canlıları gruplayalım") |
| 17 | `assets/images/items/fen/agac.png` | 1:1 | — | Ağaç (ünite 2, "Canlıları gruplayalım") |
| 18 | `assets/images/items/fen/kaktus.png` | 1:1 | — | Kaktüs (ünite 2, "Canlıları gruplayalım") |
| 19 | `assets/images/items/fen/bugday.png` | 1:1 | — | Buğday (ünite 2, "Canlıları gruplayalım") |
| 20 | `assets/images/items/fen/kedi.png` | 1:1 | — | Kedi (ünite 2, "Canlıları gruplayalım") |
| 21 | `assets/images/items/fen/balik.png` | 1:1 | — | Balık (ünite 2, "Canlıları gruplayalım") |
| 22 | `assets/images/items/fen/kelebek.png` | 1:1 | — | Kelebek (ünite 2, "Canlıları gruplayalım") |
| 23 | `assets/images/items/fen/kus.png` | 1:1 | — | Kuş (ünite 2, "Canlıları gruplayalım") |
| 24 | `assets/images/items/fen/salyangoz.png` | 1:1 | — | Salyangoz (ünite 2, "Canlıları gruplayalım") |
| 25 | `assets/images/items/fen/sapkali_mantar.png` | 1:1 | — | Şapkalı mantar (ünite 2, "Canlıları gruplayalım") |
| 26 | `assets/images/items/fen/kuflu_ekmek.png` | 1:1 | — | Küflü ekmek (ünite 2, "Canlıları gruplayalım") |
| 27 | `assets/images/items/fen/mikro_gol_suyu.png` | 1:1 | — | Göl suyundaki mikroskobik canlılar (ünite 2, "Canlıları gruplayalım") |
| 28 | `assets/images/items/fen/mikro_yogurt.png` | 1:1 | — | Yoğurttaki mikroskobik canlılar (ünite 2, "Canlıları gruplayalım") |
| 29 | `assets/images/items/fen/mikroskop.png` | 1:1 | — | Mikroskop (ünite 2, "Canlıları gruplayalım") |
| 30 | `assets/images/items/fen/goz.png` | 1:1 | — | Göz (ünite 2, "Duyularla algılama") |
| 31 | `assets/images/items/fen/kulak.png` | 1:1 | — | Kulak (ünite 2, "Duyularla algılama") |
| 32 | `assets/images/items/fen/burun.png` | 1:1 | — | Burun (ünite 2, "Duyularla algılama") |
| 33 | `assets/images/items/fen/dil.png` | 1:1 | — | Dil (ünite 2, "Duyularla algılama") |
| 34 | `assets/images/items/fen/el.png` | 1:1 | — | El (ünite 2, "Duyularla algılama") |
| 35 | `assets/images/items/fen/gokkusagi.png` | 1:1 | — | Gökkuşağı (ünite 2, "Duyularla algılama") |
| 36 | `assets/images/items/fen/zil.png` | 1:1 | — | Zil (ünite 2, "Duyularla algılama") |
| 37 | `assets/images/items/fen/gul.png` | 1:1 | — | Gül (ünite 2, "Duyularla algılama") |
| 38 | `assets/images/items/fen/limon.png` | 1:1 | — | Limon (ünite 2, "Duyularla algılama") |
| 39 | `assets/images/items/fen/kus_tuyu.png` | 1:1 | — | Kuş tüyü (ünite 2, "Duyularla algılama") |
| 40 | `assets/images/items/fen/aycicegi.png` | 1:1 | — | Ayçiçeği (ünite 2, "Duyularla algılama") |
| 41 | `assets/images/items/fen/kopek.png` | 1:1 | — | Köpek (ünite 2, "Duyularla algılama") |
| 42 | `assets/images/items/fen/orumcek.png` | 1:1 | — | Örümcek (ünite 2, "Duyularla algılama") |
| 43 | `assets/images/items/fen/kustum_otu.png` | 1:1 | — | Küstüm otu (ünite 2, "Duyularla algılama") |
| 44 | `assets/images/items/fen/kartal.png` | 1:1 | — | Kartal (ünite 2, "Duyularla algılama") |
| 45 | `assets/images/items/fen/kelebek_yumurta.png` | 1:1 | — | Kelebek yumurtası (ünite 2, "Yaşam döngüleri") |
| 46 | `assets/images/items/fen/tirtil.png` | 1:1 | — | Tırtıl (ünite 2, "Yaşam döngüleri") |
| 47 | `assets/images/items/fen/pupa.png` | 1:1 | — | Pupa (ünite 2, "Yaşam döngüleri") |
| 48 | `assets/images/items/fen/kurbaga_yumurta.png` | 1:1 | — | Kurbağa yumurtası (ünite 2, "Yaşam döngüleri") |
| 49 | `assets/images/items/fen/iribas.png` | 1:1 | — | İribaş (ünite 2, "Yaşam döngüleri") |
| 50 | `assets/images/items/fen/bacakli_iribas.png` | 1:1 | — | Bacaklı iribaş (ünite 2, "Yaşam döngüleri") |
| 51 | `assets/images/items/fen/kurbaga.png` | 1:1 | — | Kurbağa (ünite 2, "Yaşam döngüleri") |
| 52 | `assets/images/items/fen/tavuk_yumurta.png` | 1:1 | — | Tavuk yumurtası (ünite 2, "Yaşam döngüleri") |
| 53 | `assets/images/items/fen/civciv.png` | 1:1 | — | Civciv (ünite 2, "Yaşam döngüleri") |
| 54 | `assets/images/items/fen/pilic.png` | 1:1 | — | Piliç (ünite 2, "Yaşam döngüleri") |
| 55 | `assets/images/items/fen/tavuk.png` | 1:1 | — | Tavuk (ünite 2, "Yaşam döngüleri") |
| 56 | `assets/images/items/fen/granit.png` | 1:1 | — | Granit (ünite 3, "Kayaç, maden, mineral") |
| 57 | `assets/images/items/fen/mermer.png` | 1:1 | — | Mermer (ünite 3, "Kayaç, maden, mineral") |
| 58 | `assets/images/items/fen/komur.png` | 1:1 | — | Kömür (ünite 3, "Kayaç, maden, mineral") |
| 59 | `assets/images/items/fen/kuvars.png` | 1:1 | — | Kuvars (ünite 3, "Kayaç, maden, mineral") |
| 60 | `assets/images/items/fen/bakir.png` | 1:1 | — | Bakır (ünite 3, "Kayaç, maden, mineral") |
| 61 | `assets/images/items/fen/soba.png` | 1:1 | — | Soba (ünite 3, "Kayaç, maden, mineral") |
| 62 | `assets/images/items/fen/heykel.png` | 1:1 | — | Mermer heykel (ünite 3, "Kayaç, maden, mineral") |
| 63 | `assets/images/items/fen/kablo.png` | 1:1 | — | Bakır kablo (ünite 3, "Kayaç, maden, mineral") |
| 64 | `assets/images/items/fen/fosil_1_yasayan.png` | 1:1 | — | Gölde yüzen balık (ünite 3, "Fosiller nasıl oluşur?") |
| 65 | `assets/images/items/fen/fosil_2_dip.png` | 1:1 | — | Göl dibindeki iskelet (ünite 3, "Fosiller nasıl oluşur?") |
| 66 | `assets/images/items/fen/fosil_3_camur.png` | 1:1 | — | Çamurla örtülen iskelet (ünite 3, "Fosiller nasıl oluşur?") |
| 67 | `assets/images/items/fen/fosil_4_katman.png` | 1:1 | — | Katmanlar altında taşlaşma (ünite 3, "Fosiller nasıl oluşur?") |
| 68 | `assets/images/items/fen/fosil_5_bulunur.png` | 1:1 | — | Fosilin bulunması (ünite 3, "Fosiller nasıl oluşur?") |
| 69 | `assets/images/items/fen/paleontolog.png` | 1:1 | — | Paleontolog (ünite 3, "Fosiller nasıl oluşur?") |

## Promptlar

### 1. `assets/images/items/fen/yol_gozlem.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Gözlem yapmak (ünite 1, "Bilgiye ulaşma yolları").

```
a curious child kneeling and looking closely at a green leaf through a big round magnifying glass, a small blank notebook and pencil beside. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/items/fen/yol_deney.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Deney yapmak (ünite 1, "Bilgiye ulaşma yolları").

```
a child wearing small safety goggles doing a simple experiment, pouring water from a clear jug into exactly TWO clear cups on a little table. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/items/fen/yol_kaynak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kaynaklardan araştırmak (ünite 1, "Bilgiye ulaşma yolları").

```
a child sitting cross-legged reading a big open picture encyclopedia, a small stack of colorful books with blank covers beside. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 4. `assets/images/items/fen/karinca_yuvasi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Karınca yuvası (ünite 1, "Bilgiye ulaşma yolları").

```
a small sandy anthill with a few cute tiny ants walking in a line into the hole. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 5. `assets/images/items/fen/hilal_ay.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ay (ünite 1, "Bilgiye ulaşma yolları").

```
a smiling crescent moon floating among a few soft stars. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 6. `assets/images/items/fen/buz_erime.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Eriyen buz (ünite 1, "Bilgiye ulaşma yolları").

```
an ice cube melting into a small puddle on a white plate, a soft sun shining above it. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 7. `assets/images/items/fen/miknatis_atac.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Mıknatıs ve ataç (ünite 1, "Bilgiye ulaşma yolları").

```
a U-shaped horseshoe magnet standing upright with its open end at the top: two straight parallel arms joined by a curved bottom, one arm red and one arm blue, shiny silver tips at both arm ends, several small silver paper clips hanging from the two tips. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 8. `assets/images/items/fen/dinozor.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dinozor (ünite 1, "Bilgiye ulaşma yolları").

```
a friendly long-necked green dinosaur, cute and smiling. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 9. `assets/images/items/fen/derin_deniz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Derin deniz balığı (ünite 1, "Bilgiye ulaşma yolları").

```
a cute deep sea anglerfish with a small glowing lure, soft dark blue water bubbles around it, friendly face. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 10. `assets/images/items/fen/bilim_deniz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bitki bilimci Deniz Hanım (ünite 1, "Bilim insanları").

```
a friendly woman botanist scientist with short dark hair and a white lab coat, holding a magnifying glass over a potted plant. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 11. `assets/images/items/fen/bilim_kerem.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Gök bilimci Kerem Bey (ünite 1, "Bilim insanları").

```
a friendly man astronomer scientist with glasses and a white lab coat, standing next to a small telescope on a tripod. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 12. `assets/images/items/fen/saksi_bitki.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Saksıda bitki (ünite 1, "Bilim insanları").

```
a small green leafy plant in a terracotta pot. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 13. `assets/images/items/fen/teleskop.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Teleskop (ünite 1, "Bilim insanları").

```
a small toy telescope: one long straight pastel yellow tube pointing up at an angle, mounted on a slim three-legged wooden tripod stand. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 14. `assets/images/items/fen/keman.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Keman (ünite 1, "Bilim insanları").

```
a small brown violin with its bow. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 15. `assets/images/items/fen/resim_fircasi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Resim fırçası ve palet (ünite 1, "Bilim insanları").

```
a wooden paint palette with soft color blobs and a paintbrush. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 16. `assets/images/items/fen/papatya.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Papatya (ünite 2, "Canlıları gruplayalım").

```
a single white daisy flower with a yellow center and two green leaves. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 17. `assets/images/items/fen/agac.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ağaç (ünite 2, "Canlıları gruplayalım").

```
a round leafy green tree with a brown trunk. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 18. `assets/images/items/fen/kaktus.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kaktüs (ünite 2, "Canlıları gruplayalım").

```
a cute green cactus in a small pot with a tiny pink flower on top. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 19. `assets/images/items/fen/bugday.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Buğday (ünite 2, "Canlıları gruplayalım").

```
a small bundle of golden wheat stalks. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 20. `assets/images/items/fen/kedi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kedi (ünite 2, "Canlıları gruplayalım").

```
a cute orange tabby cat sitting. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 21. `assets/images/items/fen/balik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Balık (ünite 2, "Canlıları gruplayalım").

```
a cute orange fish with big eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 22. `assets/images/items/fen/kelebek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kelebek (ünite 2, "Canlıları gruplayalım").

```
a colorful butterfly with orange and purple wings and two curly antennae. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 23. `assets/images/items/fen/kus.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kuş (ünite 2, "Canlıları gruplayalım").

```
a small round blue songbird. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 24. `assets/images/items/fen/salyangoz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Salyangoz (ünite 2, "Canlıları gruplayalım").

```
a cute snail with a swirly brown shell. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 25. `assets/images/items/fen/sapkali_mantar.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Şapkalı mantar (ünite 2, "Canlıları gruplayalım").

```
a plain brown cap mushroom growing from a little patch of soil (no face). 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 26. `assets/images/items/fen/kuflu_ekmek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Küflü ekmek (ünite 2, "Canlıları gruplayalım").

```
a slice of bread with soft fuzzy green-blue mold spots on one corner. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 27. `assets/images/items/fen/mikro_gol_suyu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Göl suyundaki mikroskobik canlılar (ünite 2, "Canlıları gruplayalım").

```
a round microscope view circle showing several tiny cute transparent single-celled creatures swimming in green-tinted pond water. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 28. `assets/images/items/fen/mikro_yogurt.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yoğurttaki mikroskobik canlılar (ünite 2, "Canlıları gruplayalım").

```
a round microscope view circle showing many tiny cute rod-shaped and round bacteria in creamy white background. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 29. `assets/images/items/fen/mikroskop.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Mikroskop (ünite 2, "Canlıları gruplayalım").

```
a simple toy microscope in mint and white: a heavy round base, a curved arm, a flat stage with a glass slide and one straight eyepiece tube on top. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 30. `assets/images/items/fen/goz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Göz (ünite 2, "Duyularla algılama").

```
a single friendly cartoon eye with long lashes, simple and cute. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 31. `assets/images/items/fen/kulak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kulak (ünite 2, "Duyularla algılama").

```
a single cute cartoon human ear, simple rounded shape. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 32. `assets/images/items/fen/burun.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Burun (ünite 2, "Duyularla algılama").

```
a single clay human nose shown alone in side view, soft peach skin tone, like a toy body-part model for learning the senses. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 33. `assets/images/items/fen/dil.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dil (ünite 2, "Duyularla algılama").

```
a cute cartoon mouth sticking out a pink tongue playfully. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 34. `assets/images/items/fen/el.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** El (ünite 2, "Duyularla algılama").

```
a single cute cartoon child's open hand. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 35. `assets/images/items/fen/gokkusagi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Gökkuşağı (ünite 2, "Duyularla algılama").

```
a soft rainbow arc with two little white clouds at its ends. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 36. `assets/images/items/fen/zil.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Zil (ünite 2, "Duyularla algılama").

```
a shiny golden hand bell with a wooden handle, little sound lines around it. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 37. `assets/images/items/fen/gul.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Gül (ünite 2, "Duyularla algılama").

```
a single pink rose with soft scent swirls. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 38. `assets/images/items/fen/limon.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Limon (ünite 2, "Duyularla algılama").

```
a bright yellow lemon cut in half. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 39. `assets/images/items/fen/kus_tuyu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kuş tüyü (ünite 2, "Duyularla algılama").

```
a single soft fluffy white feather. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 40. `assets/images/items/fen/aycicegi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ayçiçeği (ünite 2, "Duyularla algılama").

```
a tall sunflower turning its face towards a small smiling sun. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 41. `assets/images/items/fen/kopek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Köpek (ünite 2, "Duyularla algılama").

```
a cute puppy sniffing the ground with its nose. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 42. `assets/images/items/fen/orumcek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Örümcek (ünite 2, "Duyularla algılama").

```
a cute friendly small spider sitting on a round web, tiny hairs on its legs. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 43. `assets/images/items/fen/kustum_otu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Küstüm otu (ünite 2, "Duyularla algılama").

```
a mimosa pudica plant with feathery leaves, some leaflets folded closed. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 44. `assets/images/items/fen/kartal.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kartal (ünite 2, "Duyularla algılama").

```
a majestic eagle with dark brown feathers, a white head, a strong hooked yellow beak and yellow talons, wings slightly spread. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 45. `assets/images/items/fen/kelebek_yumurta.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kelebek yumurtası (ünite 2, "Yaşam döngüleri").

```
a few tiny round pale yellow butterfly eggs on a green leaf. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 46. `assets/images/items/fen/tirtil.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tırtıl (ünite 2, "Yaşam döngüleri").

```
a cute chubby green caterpillar on a leaf. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 47. `assets/images/items/fen/pupa.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Pupa (ünite 2, "Yaşam döngüleri").

```
a green butterfly chrysalis hanging from a twig. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 48. `assets/images/items/fen/kurbaga_yumurta.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kurbağa yumurtası (ünite 2, "Yaşam döngüleri").

```
a clump of round transparent frog eggs with dark dots floating in water. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 49. `assets/images/items/fen/iribas.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** İribaş (ünite 2, "Yaşam döngüleri").

```
a cute small black tadpole with a round head and a tail. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 50. `assets/images/items/fen/bacakli_iribas.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bacaklı iribaş (ünite 2, "Yaşam döngüleri").

```
a dark grey tadpole seen from the side: a round head-body, a long flat tail and two tiny back legs sprouting near the tail, no front legs. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 51. `assets/images/items/fen/kurbaga.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kurbağa (ünite 2, "Yaşam döngüleri").

```
a cute green frog sitting. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 52. `assets/images/items/fen/tavuk_yumurta.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tavuk yumurtası (ünite 2, "Yaşam döngüleri").

```
a single brown hen egg in a little straw nest. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 53. `assets/images/items/fen/civciv.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Civciv (ünite 2, "Yaşam döngüleri").

```
a fluffy yellow baby chick. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 54. `assets/images/items/fen/pilic.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Piliç (ünite 2, "Yaşam döngüleri").

```
a young half-grown chicken with some yellow fluff and new white feathers. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 55. `assets/images/items/fen/tavuk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tavuk (ünite 2, "Yaşam döngüleri").

```
a plump white hen with a red comb. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 56. `assets/images/items/fen/granit.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Granit (ünite 3, "Kayaç, maden, mineral").

```
a chunk of speckled pink, grey and black granite rock. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 57. `assets/images/items/fen/mermer.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Mermer (ünite 3, "Kayaç, maden, mineral").

```
a smooth block of white marble with soft grey veins. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 58. `assets/images/items/fen/komur.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kömür (ünite 3, "Kayaç, maden, mineral").

```
a small pile of shiny black coal lumps. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 59. `assets/images/items/fen/kuvars.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kuvars (ünite 3, "Kayaç, maden, mineral").

```
a cluster of clear pointed quartz crystals. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 60. `assets/images/items/fen/bakir.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bakır (ünite 3, "Kayaç, maden, mineral").

```
a few shiny orange-brown copper nuggets. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 61. `assets/images/items/fen/soba.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Soba (ünite 3, "Kayaç, maden, mineral").

```
a small round cast iron wood stove with a warm glow and a chimney pipe. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 62. `assets/images/items/fen/heykel.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Mermer heykel (ünite 3, "Kayaç, maden, mineral").

```
a small white marble statue of a sitting cat on a pedestal. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 63. `assets/images/items/fen/kablo.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bakır kablo (ünite 3, "Kayaç, maden, mineral").

```
a coiled electric cable with shiny copper wire ends visible. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 64. `assets/images/items/fen/fosil_1_yasayan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Gölde yüzen balık (ünite 3, "Fosiller nasıl oluşur?").

```
a cute fish swimming in a clear lake among water plants. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 65. `assets/images/items/fen/fosil_2_dip.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Göl dibindeki iskelet (ünite 3, "Fosiller nasıl oluşur?").

```
a small fish skeleton lying on the sandy bottom of a lake, calm and gentle, not scary. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 66. `assets/images/items/fen/fosil_3_camur.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çamurla örtülen iskelet (ünite 3, "Fosiller nasıl oluşur?").

```
a cross-section of a lake bottom where a small fish skeleton is being covered by a soft layer of mud and sand. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 67. `assets/images/items/fen/fosil_4_katman.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Katmanlar altında taşlaşma (ünite 3, "Fosiller nasıl oluşur?").

```
a cross-section of many colorful earth layers stacked on top, a small fish skeleton turned to stone deep inside the bottom layer. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 68. `assets/images/items/fen/fosil_5_bulunur.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Fosilin bulunması (ünite 3, "Fosiller nasıl oluşur?").

```
a fish fossil imprint on a flat stone being uncovered with a soft brush by a gloved hand. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 69. `assets/images/items/fen/paleontolog.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Paleontolog (ünite 3, "Fosiller nasıl oluşur?").

```
a friendly grown-up woman paleontologist, a tall adult with adult body proportions, wearing a sun hat and a khaki vest, kneeling and brushing a fossil on a rock. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```


---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Arka plan silindi, şeffaf PNG
- [ ] Görselde yazı, harf ya da rakam yok
- [ ] Stil önceki partilerle tutarlı (yan yana koyup bak)
- [ ] Commit: `assets: 090 fen görselleri 1 (ünite 1-3)`
