# 023 · Bilge'nin Ağaç Evi: süs eşyaları

**Öncelik: ORTA** (Faz 7a, ödül döngüsü). Toplam yıldız eşiklerinde (5, 15, 30, sonra 20'şer) açılan ve çocuğun Ağaç Evi odasına sürükleyip yerleştirdiği 12 süs eşyası. Açılma sırası `content/tree_house.json` dosyasındaki sıradır.

Bu görseller gelene kadar oyun her süs için adını yazan renkli bir yer tutucu gösterir. Dosyayı tablodaki yola koymak yeterlidir; kod değişikliği gerekmez. Oda arka planı (`region.agac_ev.bg`) ve Tekrar Bulutu durağı (`map.stop_review`) 002'de zaten istendi; burada tekrar edilmez.

- Her süs bir **sprite**tır: arka planı silinir, şeffaf PNG kaydedilir, 1:1. Oyunda yaklaşık 200 px gösterilir; silüet küçükte de okunaklı olmalı.
- Süsler oda içinde yan yana duracağı için **aynı ışık ve aynı bakış açısıyla** (hafif önden, hafif yukarıdan) üretilmeli. Önce 2–3 tanesini üretip birbirine uyduğunu kontrol et.
- Görsellerde yazı, harf ya da rakam yok (kitap kapakları ve tuval boş). Yanıp sönen ya da parlayan ışık efekti yok; lamba ve fener yumuşak ışıkla.

Stil bloğu: `docs/assets/style-guide.md` → `STYLE_SPRITE`. Promptların sonunda tam metin olarak yer alıyor. Ağaç Evi paleti (sıcak ahşap kahveleri, turuncu ışık, yumuşak yeşiller) odada geçerli; süsler bu odaya uyan pastel tonlarda.


## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/decor/mantar_lamba.png` | 1:1 | — | Mantar lamba: kırmızı benekli mantar biçiminde sıcak ışıklı masa lambası. (eşik: 5 yıldız) |
| 2 | `assets/images/decor/yuvarlak_hali.png` | 1:1 | — | Yuvarlak halı: yumuşak, renkli halkalı yuvarlak örgü halı (hafif yukarıdan). (eşik: 15 yıldız) |
| 3 | `assets/images/decor/saksi_cicek.png` | 1:1 | — | Saksıda çiçek: terrakota saksıda üç neşeli papatya. (eşik: 30 yıldız) |
| 4 | `assets/images/decor/kitap_yigini.png` | 1:1 | — | Kitap yığını: renkli kapaklı üç dört kitaplık yığın (kapaklarda yazı yok). (eşik: 50 yıldız) |
| 5 | `assets/images/decor/teleskop.png` | 1:1 | — | Teleskop: üç ayaklı küçük oyuncak teleskop. (eşik: 70 yıldız) |
| 6 | `assets/images/decor/dunya_kuresi.png` | 1:1 | — | Dünya küresi: ayaklı küçük küre (kıtalar yeşil lekeler, yazı yok). (eşik: 90 yıldız) |
| 7 | `assets/images/decor/minder.png` | 1:1 | — | Minder: kabarık, düğmeli yuvarlak yer minderi. (eşik: 110 yıldız) |
| 8 | `assets/images/decor/balik_kavanozu.png` | 1:1 | — | Balık kavanozu: içinde turuncu bir balık olan yuvarlak cam kavanoz. (eşik: 130 yıldız) |
| 9 | `assets/images/decor/ruzgar_cani.png` | 1:1 | — | Rüzgâr çanı: tahta halkadan sarkan pastel boru çanlar. (eşik: 150 yıldız) |
| 10 | `assets/images/decor/oyuncak_roket.png` | 1:1 | — | Oyuncak roket: yuvarlak pencereli küçük oyuncak roket. (eşik: 170 yıldız) |
| 11 | `assets/images/decor/resim_sehpasi.png` | 1:1 | — | Resim sehpası: üstünde boş tuval olan küçük ahşap şövale ve palet. (eşik: 190 yıldız) |
| 12 | `assets/images/decor/yildiz_fener.png` | 1:1 | — | Yıldız fener: yumuşak ışık saçan yıldız biçimli asma fener. (eşik: 210 yıldız) |

## Promptlar

### 1. `assets/images/decor/mantar_lamba.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Mantar lamba: kırmızı benekli mantar biçiminde sıcak ışıklı masa lambası.

```
a small cozy table lamp shaped like a cute toadstool mushroom, a round red clay cap with soft white dots glowing with a warm gentle light from underneath, a short chubby cream stem on a small round wooden base. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/decor/yuvarlak_hali.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yuvarlak halı: yumuşak, renkli halkalı yuvarlak örgü halı (hafif yukarıdan).

```
a round braided floor rug seen from a gentle high angle, soft concentric rings in warm orange, butter yellow, mint green and sky blue clay, slightly puffy and soft looking, cozy and inviting, no pattern of letters or symbols. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/decor/saksi_cicek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Saksıda çiçek: terrakota saksıda üç neşeli papatya.

```
a small terracotta clay flower pot with three cheerful daisy-like flowers on green stems, white petals with sunny yellow centers, two round green leaves, chunky and cute. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 4. `assets/images/decor/kitap_yigini.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kitap yığını: renkli kapaklı üç dört kitaplık yığın (kapaklarda yazı yok).

```
a small tidy stack of four chunky clay books with plain colorful covers in coral, mint, lavender and honey yellow, completely blank covers and spines, a tiny cream bookmark ribbon peeking out of the top book. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 5. `assets/images/decor/teleskop.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Teleskop: üç ayaklı küçük oyuncak teleskop.

```
a small toy telescope on a short wooden tripod, a chubby sky blue clay tube with a golden rim at the front lens, pointing slightly upward, friendly and simple. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 6. `assets/images/decor/dunya_kuresi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dünya küresi: ayaklı küçük küre (kıtalar yeşil lekeler, yazı yok).

```
a small desk globe on a curved golden stand and round wooden base, a soft blue clay sphere with simple rounded green clay landmass blobs, no country borders, no writing, no labels. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 7. `assets/images/decor/minder.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Minder: kabarık, düğmeli yuvarlak yer minderi.

```
a big puffy round floor cushion made of soft peach clay with a single button in the middle and gentle tufted folds, cozy and squishy looking. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 8. `assets/images/decor/balik_kavanozu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Balık kavanozu: içinde turuncu bir balık olan yuvarlak cam kavanoz.

```
a round glass fishbowl with clear light blue water, one cute chubby orange clay goldfish with big friendly eyes, a few small pebbles and a tiny green water plant at the bottom. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 9. `assets/images/decor/ruzgar_cani.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Rüzgâr çanı: tahta halkadan sarkan pastel boru çanlar.

```
a hanging wind chime with a small round wooden top ring and five short pastel clay tubes in mint, lavender, peach, sky blue and butter yellow hanging on thin strings, a small leaf-shaped clay charm at the bottom. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 10. `assets/images/decor/oyuncak_roket.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Oyuncak roket: yuvarlak pencereli küçük oyuncak roket.

```
a small standing toy rocket made of clay, rounded white body with coral red fins and nose cone, one round sky blue porthole window, three stubby legs, playful and friendly. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 11. `assets/images/decor/resim_sehpasi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Resim sehpası: üstünde boş tuval olan küçük ahşap şövale ve palet.

```
a small wooden painting easel holding a blank cream canvas with a few soft colorful paint dabs on it, a round clay paint palette with colorful paint blobs leaning against its legs, no drawn letters or numbers. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 12. `assets/images/decor/yildiz_fener.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yıldız fener: yumuşak ışık saçan yıldız biçimli asma fener.

```
a hanging lantern shaped like a puffy five-pointed star, warm butter-yellow clay glowing softly from inside, hanging from a short loop of string, calm and gentle light, no sparkles or flashes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```


---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Arka plan silindi, şeffaf PNG
- [ ] Görselde yazı, harf ya da rakam yok
- [ ] 12 süs aynı ışık ve bakış açısında; yan yana uyumlu
- [ ] Oyunda kontrol: Ağaç Evi rafında ve odada süsler kırpılmadan görünüyor, sürüklenince düzgün taşınıyor
- [ ] Commit: `assets: 023 ağaç evi süs eşyaları`
