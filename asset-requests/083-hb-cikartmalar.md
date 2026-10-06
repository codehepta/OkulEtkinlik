# 083 · Hayat Bilgisi çıkartmaları

**Öncelik: ORTA** (Faz 5b, Hayat Kasabası). Hayat Bilgisi duraklarının çıkartmaları (`content/stickers.json` → `hayat_bilgisi` sırasıyla, 53 adet). Albümde küçük gösterilecekleri için sade ve kalın siluetli olmalı; hepsi aynı setten çıkmış gibi görünmeli. Arka planı silinir, şeffaf PNG kaydedilir.

Stil bloğu: `docs/assets/style-guide.md` → `STYLE_ICON` (promptların sonunda tam metin olarak yer alıyor).

## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/stickers/hayat_bilgisi/okul_zili.png` | 1:1 | — | Çıkartma: Okul zili (g1.u01.n01, Okul kurallarımız) |
| 2 | `assets/images/stickers/hayat_bilgisi/havuc.png` | 1:1 | — | Çıkartma: Gülen havuç (g1.u02.n01, Sağlıklı büyüyorum) |
| 3 | `assets/images/stickers/hayat_bilgisi/kalkan.png` | 1:1 | — | Çıkartma: Kalkan (g1.u02.n02, Bedenim bana ait) |
| 4 | `assets/images/stickers/hayat_bilgisi/trafik_lambasi.png` | 1:1 | — | Çıkartma: Trafik lambası (g1.u02.n03, Trafikte güvendeyim) |
| 5 | `assets/images/stickers/hayat_bilgisi/ilk_yardim.png` | 1:1 | — | Çıkartma: İlk yardım çantası (g1.u02.n04, Acil durumda ne yaparım?) |
| 6 | `assets/images/stickers/hayat_bilgisi/ev.png` | 1:1 | — | Çıkartma: Sıcak yuva (g1.u03.n01, Benim ailem) |
| 7 | `assets/images/stickers/hayat_bilgisi/cicek_demeti.png` | 1:1 | — | Çıkartma: Çiçek demeti (g1.u03.n02, Nazik olalım) |
| 8 | `assets/images/stickers/hayat_bilgisi/sulama_kabi.png` | 1:1 | — | Çıkartma: Sulama kabı (g1.u03.n03, Evde görevlerim) |
| 9 | `assets/images/stickers/hayat_bilgisi/harita.png` | 1:1 | — | Çıkartma: Türkiye haritası (g1.u04.n01, Ülkemiz Türkiye) |
| 10 | `assets/images/stickers/hayat_bilgisi/bayrak.png` | 1:1 | — | Çıkartma: Türk bayrağı (g1.u04.n02, Bayrağım ve marşım) |
| 11 | `assets/images/stickers/hayat_bilgisi/anitkabir.png` | 1:1 | — | Çıkartma: Anıtkabir (g1.u04.n03, Atatürk'ün hayatı) |
| 12 | `assets/images/stickers/hayat_bilgisi/buyutec.png` | 1:1 | — | Çıkartma: Büyüteç (g1.u05.n01, Doğayı gözlemliyorum) |
| 13 | `assets/images/stickers/hayat_bilgisi/ay.png` | 1:1 | — | Çıkartma: Uykucu Ay (g1.u05.n02, Güneş, Dünya ve Ay) |
| 14 | `assets/images/stickers/hayat_bilgisi/duduk.png` | 1:1 | — | Çıkartma: Düdük (g1.u05.n03, Afetleri tanıyorum) |
| 15 | `assets/images/stickers/hayat_bilgisi/geri_donusum.png` | 1:1 | — | Çıkartma: Geri dönüşüm (g1.u05.n04, Geri dönüşüm) |
| 16 | `assets/images/stickers/hayat_bilgisi/takvim.png` | 1:1 | — | Çıkartma: Gün planı (g2.u01.n01, Planlı bir gün) |
| 17 | `assets/images/stickers/hayat_bilgisi/konusma_balonu.png` | 1:1 | — | Çıkartma: Konuşma balonu (g2.u01.n02, Dinliyorum, konuşuyorum) |
| 18 | `assets/images/stickers/hayat_bilgisi/el_ele.png` | 1:1 | — | Çıkartma: El ele (g2.u01.n03, Arkadaşlık) |
| 19 | `assets/images/stickers/hayat_bilgisi/bisiklet.png` | 1:1 | — | Çıkartma: Bisiklet (g2.u02.n01, Sağlıklı alışkanlıklar) |
| 20 | `assets/images/stickers/hayat_bilgisi/kilit.png` | 1:1 | — | Çıkartma: Kilit (g2.u02.n02, İnternette güvendeyim) |
| 21 | `assets/images/stickers/hayat_bilgisi/levha.png` | 1:1 | — | Çıkartma: Trafik levhası (g2.u02.n03, Trafik levhaları) |
| 22 | `assets/images/stickers/hayat_bilgisi/telefon.png` | 1:1 | — | Çıkartma: Acil telefon (g2.u02.n04, 112 ile konuşuyorum) |
| 23 | `assets/images/stickers/hayat_bilgisi/kalp_ev.png` | 1:1 | — | Çıkartma: Kalpli ev (g2.u03.n01, Ailemiz neden önemli?) |
| 24 | `assets/images/stickers/hayat_bilgisi/otobus.png` | 1:1 | — | Çıkartma: Otobüs (g2.u03.n02, Toplumda nezaket) |
| 25 | `assets/images/stickers/hayat_bilgisi/fidan.png` | 1:1 | — | Çıkartma: Fidan (g2.u03.n03, Çevremde sorumluluklarım) |
| 26 | `assets/images/stickers/hayat_bilgisi/muhtarlik.png` | 1:1 | — | Çıkartma: Muhtarlık (g2.u04.n01, Bilgiyi nereden bulurum?) |
| 27 | `assets/images/stickers/hayat_bilgisi/kalem_defter.png` | 1:1 | — | Çıkartma: Kalem ve defter (g2.u04.n02, Atatürk'ün okul yılları) |
| 28 | `assets/images/stickers/hayat_bilgisi/fener.png` | 1:1 | — | Çıkartma: Fener (g2.u04.n03, Millî bayramlarımız) |
| 29 | `assets/images/stickers/hayat_bilgisi/seker_kasesi.png` | 1:1 | — | Çıkartma: Bayram şekeri (g2.u04.n04, Dinî bayramlarımız) |
| 30 | `assets/images/stickers/hayat_bilgisi/semsiye.png` | 1:1 | — | Çıkartma: Şemsiye (g2.u05.n01, Mevsimler ve hava) |
| 31 | `assets/images/stickers/hayat_bilgisi/pusula.png` | 1:1 | — | Çıkartma: Pusula (g2.u05.n02, Doğada yön bulma) |
| 32 | `assets/images/stickers/hayat_bilgisi/baret.png` | 1:1 | — | Çıkartma: Baret (g2.u05.n03, Afetlere hazırlık) |
| 33 | `assets/images/stickers/hayat_bilgisi/damla.png` | 1:1 | — | Çıkartma: Su damlası (g2.u05.n04, Tasarruf ediyorum) |
| 34 | `assets/images/stickers/hayat_bilgisi/mikroskop.png` | 1:1 | — | Çıkartma: Mikroskop (g2.u06.n01, Bilim insanlarını araştırıyorum) |
| 35 | `assets/images/stickers/hayat_bilgisi/ampul.png` | 1:1 | — | Çıkartma: Ampul (g2.u06.n02, Teknoloji nasıl değişiyor?) |
| 36 | `assets/images/stickers/hayat_bilgisi/palet.png` | 1:1 | — | Çıkartma: Boya paleti (g2.u06.n03, Hayatımızda sanat) |
| 37 | `assets/images/stickers/hayat_bilgisi/rozet.png` | 1:1 | — | Çıkartma: Sorumluluk rozeti (g3.u01.n01, Haklarım ve sorumluluklarım) |
| 38 | `assets/images/stickers/hayat_bilgisi/atki.png` | 1:1 | — | Çıkartma: Atkı ve bere (g3.u02.n01, Sağlığımı koruyorum) |
| 39 | `assets/images/stickers/hayat_bilgisi/fener_el.png` | 1:1 | — | Çıkartma: El feneri (g3.u02.n02, Güvenliğim için sorguluyorum) |
| 40 | `assets/images/stickers/hayat_bilgisi/kask.png` | 1:1 | — | Çıkartma: Bisiklet kaskı (g3.u02.n03, Trafik kuralları hayat kurtarır) |
| 41 | `assets/images/stickers/hayat_bilgisi/mahalle.png` | 1:1 | — | Çıkartma: Mahalle (g3.u03.n01, Aileden topluma) |
| 42 | `assets/images/stickers/hayat_bilgisi/stetoskop.png` | 1:1 | — | Çıkartma: Stetoskop (g3.u03.n02, Meslekler ve toplum) |
| 43 | `assets/images/stickers/hayat_bilgisi/kale.png` | 1:1 | — | Çıkartma: Tarihî kale (g3.u04.n01, Tarihi ve doğayı koruyorum) |
| 44 | `assets/images/stickers/hayat_bilgisi/meclis.png` | 1:1 | — | Çıkartma: Meclis (g3.u04.n02, Yönetim şeklimizi araştırıyorum) |
| 45 | `assets/images/stickers/hayat_bilgisi/yildiz.png` | 1:1 | — | Çıkartma: Parlak yıldız (g3.u04.n03, Atatürk'ün kişiliği) |
| 46 | `assets/images/stickers/hayat_bilgisi/el_ele_halka.png` | 1:1 | — | Çıkartma: Birlik halkası (g3.u04.n04, Birlik ve beraberlik) |
| 47 | `assets/images/stickers/hayat_bilgisi/ari.png` | 1:1 | — | Çıkartma: Bal arısı (g3.u05.n01, Doğa bize neler verir?) |
| 48 | `assets/images/stickers/hayat_bilgisi/kroki.png` | 1:1 | — | Çıkartma: Kroki (g3.u05.n02, Krokiyle yolumu bulurum) |
| 49 | `assets/images/stickers/hayat_bilgisi/afet_cantasi.png` | 1:1 | — | Çıkartma: Afet çantası (g3.u05.n03, Afet öncesi, anı ve sonrası) |
| 50 | `assets/images/stickers/hayat_bilgisi/dunya.png` | 1:1 | — | Çıkartma: Yeşil Dünya (g3.u05.n04, Çevremizi araştırıyorum) |
| 51 | `assets/images/stickers/hayat_bilgisi/deney_tupu.png` | 1:1 | — | Çıkartma: Deney tüpü (g3.u06.n01, Bilim hayatımızı değiştirir) |
| 52 | `assets/images/stickers/hayat_bilgisi/robot.png` | 1:1 | — | Çıkartma: Robot (g3.u06.n02, Teknoloji ve günlük yaşam) |
| 53 | `assets/images/stickers/hayat_bilgisi/baglama.png` | 1:1 | — | Çıkartma: Bağlama (g3.u06.n03, Sanatçıları araştırıyorum) |

## Promptlar

### 1. `assets/images/stickers/hayat_bilgisi/okul_zili.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Okul zili (g1.u01.n01, Okul kurallarımız)

```
a round sticker badge with a thick white die-cut border, showing a shiny golden school bell. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/stickers/hayat_bilgisi/havuc.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Gülen havuç (g1.u02.n01, Sağlıklı büyüyorum)

```
a round sticker badge with a thick white die-cut border, showing a cute smiling carrot with green leaves. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/stickers/hayat_bilgisi/kalkan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Kalkan (g1.u02.n02, Bedenim bana ait)

```
a round sticker badge with a thick white die-cut border, showing a cute round shield with a heart in the middle. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 4. `assets/images/stickers/hayat_bilgisi/trafik_lambasi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Trafik lambası (g1.u02.n03, Trafikte güvendeyim)

```
a round sticker badge with a thick white die-cut border, showing a cute traffic light with red, yellow and green lamps. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 5. `assets/images/stickers/hayat_bilgisi/ilk_yardim.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: İlk yardım çantası (g1.u02.n04, Acil durumda ne yaparım?)

```
a round sticker badge with a thick white die-cut border, showing a cute white first aid bag with a red plus sign. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 6. `assets/images/stickers/hayat_bilgisi/ev.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Sıcak yuva (g1.u03.n01, Benim ailem)

```
a round sticker badge with a thick white die-cut border, showing a cute cozy little house with a heart shaped window. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 7. `assets/images/stickers/hayat_bilgisi/cicek_demeti.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Çiçek demeti (g1.u03.n02, Nazik olalım)

```
a round sticker badge with a thick white die-cut border, showing a small cute bouquet of colorful flowers with a ribbon. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 8. `assets/images/stickers/hayat_bilgisi/sulama_kabi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Sulama kabı (g1.u03.n03, Evde görevlerim)

```
a round sticker badge with a thick white die-cut border, showing a cute small watering can with water drops. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 9. `assets/images/stickers/hayat_bilgisi/harita.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Türkiye haritası (g1.u04.n01, Ülkemiz Türkiye)

```
a round sticker badge with a thick white die-cut border, showing a simple cute rounded map shape of Türkiye in red with a tiny white crescent and star. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 10. `assets/images/stickers/hayat_bilgisi/bayrak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Türk bayrağı (g1.u04.n02, Bayrağım ve marşım)

```
a round sticker badge with a thick white die-cut border, showing a small waving Turkish flag: red with a white crescent and star. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 11. `assets/images/stickers/hayat_bilgisi/anitkabir.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Anıtkabir (g1.u04.n03, Atatürk'ün hayatı)

```
a round sticker badge with a thick white die-cut border, showing a tiny cute clay model of Anıtkabir mausoleum with columns. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 12. `assets/images/stickers/hayat_bilgisi/buyutec.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Büyüteç (g1.u05.n01, Doğayı gözlemliyorum)

```
a round sticker badge with a thick white die-cut border, showing a cute magnifying glass looking at a small leaf. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 13. `assets/images/stickers/hayat_bilgisi/ay.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Uykucu Ay (g1.u05.n02, Güneş, Dünya ve Ay)

```
a round sticker badge with a thick white die-cut border, showing a cute sleepy crescent moon with a tiny star. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 14. `assets/images/stickers/hayat_bilgisi/duduk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Düdük (g1.u05.n03, Afetleri tanıyorum)

```
a round sticker badge with a thick white die-cut border, showing a classic orange sports whistle seen from the side (a round barrel body with a short square mouthpiece) hanging on a short string loop. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 15. `assets/images/stickers/hayat_bilgisi/geri_donusum.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Geri dönüşüm (g1.u05.n04, Geri dönüşüm)

```
a round sticker badge with a thick white die-cut border, showing a cute green recycling bin with three chasing arrows, no text. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 16. `assets/images/stickers/hayat_bilgisi/takvim.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Gün planı (g2.u01.n01, Planlı bir gün)

```
a round sticker badge with a thick white die-cut border, showing a cute wall calendar page with colorful blank boxes and a smiling sun sticker, no numbers. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 17. `assets/images/stickers/hayat_bilgisi/konusma_balonu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Konuşma balonu (g2.u01.n02, Dinliyorum, konuşuyorum)

```
a round sticker badge with a thick white die-cut border, showing two cute overlapping empty speech bubbles, one pink one blue, no text. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 18. `assets/images/stickers/hayat_bilgisi/el_ele.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: El ele (g2.u01.n03, Arkadaşlık)

```
a round sticker badge with a thick white die-cut border, showing two cute small hands holding each other with a tiny heart. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 19. `assets/images/stickers/hayat_bilgisi/bisiklet.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Bisiklet (g2.u02.n01, Sağlıklı alışkanlıklar)

```
a round sticker badge with a thick white die-cut border, showing a cute small bicycle with a bell. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 20. `assets/images/stickers/hayat_bilgisi/kilit.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Kilit (g2.u02.n02, İnternette güvendeyim)

```
a round sticker badge with a thick white die-cut border, showing a cute golden padlock with a heart shaped keyhole. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 21. `assets/images/stickers/hayat_bilgisi/levha.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Trafik levhası (g2.u02.n03, Trafik levhaları)

```
a round sticker badge with a thick white die-cut border, showing a cute round blue road sign with a white walking person pictogram, no text. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 22. `assets/images/stickers/hayat_bilgisi/telefon.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Acil telefon (g2.u02.n04, 112 ile konuşuyorum)

```
a round sticker badge with a thick white die-cut border, showing a cute red old-style telephone with a heart. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 23. `assets/images/stickers/hayat_bilgisi/kalp_ev.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Kalpli ev (g2.u03.n01, Ailemiz neden önemli?)

```
a round sticker badge with a thick white die-cut border, showing a cute little house with a big red heart on the roof. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 24. `assets/images/stickers/hayat_bilgisi/otobus.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Otobüs (g2.u03.n02, Toplumda nezaket)

```
a round sticker badge with a thick white die-cut border, showing a cute small yellow city bus. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 25. `assets/images/stickers/hayat_bilgisi/fidan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Fidan (g2.u03.n03, Çevremde sorumluluklarım)

```
a round sticker badge with a thick white die-cut border, showing a cute small sapling growing from a pot with two leaves. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 26. `assets/images/stickers/hayat_bilgisi/muhtarlik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Muhtarlık (g2.u04.n01, Bilgiyi nereden bulurum?)

```
a round sticker badge with a thick white die-cut border, showing a cute small neighborhood office building with a tiny Turkish flag. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 27. `assets/images/stickers/hayat_bilgisi/kalem_defter.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Kalem ve defter (g2.u04.n02, Atatürk'ün okul yılları)

```
a round sticker badge with a thick white die-cut border, showing a cute pencil resting on an open notebook with blank pages. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 28. `assets/images/stickers/hayat_bilgisi/fener.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Fener (g2.u04.n03, Millî bayramlarımız)

```
a round sticker badge with a thick white die-cut border, showing a cute red paper lantern with a white crescent and star. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 29. `assets/images/stickers/hayat_bilgisi/seker_kasesi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Bayram şekeri (g2.u04.n04, Dinî bayramlarımız)

```
a round sticker badge with a thick white die-cut border, showing a cute small bowl of colorful wrapped candies. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 30. `assets/images/stickers/hayat_bilgisi/semsiye.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Şemsiye (g2.u05.n01, Mevsimler ve hava)

```
a round sticker badge with a thick white die-cut border, showing a cute colorful umbrella with raindrops. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 31. `assets/images/stickers/hayat_bilgisi/pusula.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Pusula (g2.u05.n02, Doğada yön bulma)

```
a round sticker badge with a thick white die-cut border, showing a cute round compass with a red needle, no letters. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 32. `assets/images/stickers/hayat_bilgisi/baret.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Baret (g2.u05.n03, Afetlere hazırlık)

```
a round sticker badge with a thick white die-cut border, showing a cute yellow safety helmet. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 33. `assets/images/stickers/hayat_bilgisi/damla.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Su damlası (g2.u05.n04, Tasarruf ediyorum)

```
a round sticker badge with a thick white die-cut border, showing a cute smiling blue water drop. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 34. `assets/images/stickers/hayat_bilgisi/mikroskop.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Mikroskop (g2.u06.n01, Bilim insanlarını araştırıyorum)

```
a round sticker badge with a thick white die-cut border, showing a cute small microscope. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 35. `assets/images/stickers/hayat_bilgisi/ampul.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Ampul (g2.u06.n02, Teknoloji nasıl değişiyor?)

```
a round sticker badge with a thick white die-cut border, showing a cute glowing light bulb with a happy sparkle. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 36. `assets/images/stickers/hayat_bilgisi/palet.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Boya paleti (g2.u06.n03, Hayatımızda sanat)

```
a round sticker badge with a thick white die-cut border, showing a cute painter's palette with colorful paint blobs. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 37. `assets/images/stickers/hayat_bilgisi/rozet.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Sorumluluk rozeti (g3.u01.n01, Haklarım ve sorumluluklarım)

```
a round sticker badge with a thick white die-cut border, showing a cute round golden badge with a star, no text. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 38. `assets/images/stickers/hayat_bilgisi/atki.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Atkı ve bere (g3.u02.n01, Sağlığımı koruyorum)

```
a round sticker badge with a thick white die-cut border, showing a cute knitted scarf and beanie set. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 39. `assets/images/stickers/hayat_bilgisi/fener_el.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: El feneri (g3.u02.n02, Güvenliğim için sorguluyorum)

```
a round sticker badge with a thick white die-cut border, showing a cute yellow flashlight shining a soft beam. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 40. `assets/images/stickers/hayat_bilgisi/kask.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Bisiklet kaskı (g3.u02.n03, Trafik kuralları hayat kurtarır)

```
a round sticker badge with a thick white die-cut border, showing a cute shiny blue bicycle helmet. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 41. `assets/images/stickers/hayat_bilgisi/mahalle.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Mahalle (g3.u03.n01, Aileden topluma)

```
a round sticker badge with a thick white die-cut border, showing a cute cluster of three tiny colorful houses with a tree. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 42. `assets/images/stickers/hayat_bilgisi/stetoskop.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Stetoskop (g3.u03.n02, Meslekler ve toplum)

```
a round sticker badge with a thick white die-cut border, showing a cute doctor's stethoscope in a heart shape. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 43. `assets/images/stickers/hayat_bilgisi/kale.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Tarihî kale (g3.u04.n01, Tarihi ve doğayı koruyorum)

```
a round sticker badge with a thick white die-cut border, showing a cute tiny stone castle with a flag. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 44. `assets/images/stickers/hayat_bilgisi/meclis.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Meclis (g3.u04.n02, Yönetim şeklimizi araştırıyorum)

```
a round sticker badge with a thick white die-cut border, showing a cute tiny clay parliament building with a Turkish flag. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 45. `assets/images/stickers/hayat_bilgisi/yildiz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Parlak yıldız (g3.u04.n03, Atatürk'ün kişiliği)

```
a round sticker badge with a thick white die-cut border, showing a cute shining golden star. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 46. `assets/images/stickers/hayat_bilgisi/el_ele_halka.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Birlik halkası (g3.u04.n04, Birlik ve beraberlik)

```
a round sticker badge with a thick white die-cut border, showing a cute ring of small colorful hands holding each other. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 47. `assets/images/stickers/hayat_bilgisi/ari.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Bal arısı (g3.u05.n01, Doğa bize neler verir?)

```
a round sticker badge with a thick white die-cut border, showing a cute fuzzy honey bee. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 48. `assets/images/stickers/hayat_bilgisi/kroki.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Kroki (g3.u05.n02, Krokiyle yolumu bulurum)

```
a round sticker badge with a thick white die-cut border, showing a cute rolled paper map with a red star, no text. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 49. `assets/images/stickers/hayat_bilgisi/afet_cantasi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Afet çantası (g3.u05.n03, Afet öncesi, anı ve sonrası)

```
a round sticker badge with a thick white die-cut border, showing a cute orange emergency backpack. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 50. `assets/images/stickers/hayat_bilgisi/dunya.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Yeşil Dünya (g3.u05.n04, Çevremizi araştırıyorum)

```
a round sticker badge with a thick white die-cut border, showing a cute small green and blue Earth with a leaf. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 51. `assets/images/stickers/hayat_bilgisi/deney_tupu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Deney tüpü (g3.u06.n01, Bilim hayatımızı değiştirir)

```
a round sticker badge with a thick white die-cut border, showing a cute bubbling test tube with green liquid. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 52. `assets/images/stickers/hayat_bilgisi/robot.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Robot (g3.u06.n02, Teknoloji ve günlük yaşam)

```
a round sticker badge with a thick white die-cut border, showing a cute small friendly toy robot that clearly looks like a robot: a boxy silver-grey body with colored round buttons, a square head with a short antenna and round button eyes, tube arms. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 53. `assets/images/stickers/hayat_bilgisi/baglama.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çıkartma: Bağlama (g3.u06.n03, Sanatçıları araştırıyorum)

```
a round sticker badge with a thick white die-cut border, showing a cute small Turkish bağlama (saz): a small pear-shaped wooden body and a very long thin straight neck about twice as long as the body, with tuning pegs on the head. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```


---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Sprite'larda arka plan silindi, şeffaf PNG; sahneler (16:9) arka planlı kalır
- [ ] Görselde yazı, harf ya da rakam yok
- [ ] Stil önceki partilerle tutarlı (yan yana koyup bak)
- [ ] Commit: `assets: 083 083 hb cikartmalar`
