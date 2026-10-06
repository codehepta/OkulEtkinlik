# 091 · Fen Bilimleri 3 görselleri (ünite 4–6)

**Öncelik: ORTA** (Faz 6, Keşif Laboratuvarı). `content/g3/fen/u04–u06.json` turlarında kullanılan nesne, canlı ve davranış kartları: ünite 4–6: maddenin hâlleri, karışımlar, atıklar, hareket, itme-çekme, davranış kartları, elektrikli araç gereçler. Her dosya `item.fen.<ad>` anahtarıyla yüklenir; aynı görsel birden çok turda tekrar kullanılır.

Hepsi gelene kadar oyun her görsel için Türkçe adını yazan renkli bir yer tutucu gösterir; dosyayı tablodaki yola koymak yeterlidir, kod değişikliği gerekmez.

- Her görsel bir **sprite**tır: arka planı silinir, şeffaf PNG kaydedilir, 1:1. Oyunda kart üstünde 150–300 px gösterilir; silüet küçükte de okunaklı olmalı.
- Kutulara ayırma ve eşleştirme turlarında yan yana durdukları için **aynı ışık ve aynı bakış açısıyla** üretilmeli. Önce 3–4 tanesini üretip birbirine uyduğunu kontrol et.
- Çocuk ve yetişkin figürleri sevimli kil oyuncak insanlar olarak üretilir; gerçek kişilere benzemez. Tehlikeli davranış kartları (ıslak elle priz, yola koşmak) korkutucu değil, sakin ve sade olmalı.
- Görsellerde yazı, harf ya da rakam yok (kitap kapakları, gazete, saat kadranı boş).

Stil bloğu: `docs/assets/style-guide.md` → `STYLE_SPRITE`. Promptların sonunda tam metin olarak yer alıyor.


## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/items/fen/tas.png` | 1:1 | — | Taş (ünite 4, "Katı, sıvı, gaz") |
| 2 | `assets/images/items/fen/tahta_blok.png` | 1:1 | — | Tahta blok (ünite 4, "Katı, sıvı, gaz") |
| 3 | `assets/images/items/fen/buz_kupu.png` | 1:1 | — | Buz küpü (ünite 4, "Katı, sıvı, gaz") |
| 4 | `assets/images/items/fen/su_bardagi.png` | 1:1 | — | Bir bardak su (ünite 4, "Katı, sıvı, gaz") |
| 5 | `assets/images/items/fen/sut.png` | 1:1 | — | Süt (ünite 4, "Katı, sıvı, gaz") |
| 6 | `assets/images/items/fen/zeytinyagi.png` | 1:1 | — | Zeytinyağı (ünite 4, "Katı, sıvı, gaz") |
| 7 | `assets/images/items/fen/buhar.png` | 1:1 | — | Su buharı (ünite 4, "Katı, sıvı, gaz") |
| 8 | `assets/images/items/fen/balon_hava.png` | 1:1 | — | Balondaki hava (ünite 4, "Katı, sıvı, gaz") |
| 9 | `assets/images/items/fen/lastik_bant.png` | 1:1 | — | Lastik bant (ünite 4, "Katı, sıvı, gaz") |
| 10 | `assets/images/items/fen/cam_bardak.png` | 1:1 | — | Cam bardak (ünite 4, "Katı, sıvı, gaz") |
| 11 | `assets/images/items/fen/sunger.png` | 1:1 | — | Sünger (ünite 4, "Katı, sıvı, gaz") |
| 12 | `assets/images/items/fen/miknatis.png` | 1:1 | — | Mıknatısla ayırma (ünite 4, "Karışımları ayıralım") |
| 13 | `assets/images/items/fen/elek.png` | 1:1 | — | Eleme (ünite 4, "Karışımları ayıralım") |
| 14 | `assets/images/items/fen/suzgec.png` | 1:1 | — | Süzme (ünite 4, "Karışımları ayıralım") |
| 15 | `assets/images/items/fen/dinlendirme.png` | 1:1 | — | Dinlendirme (ünite 4, "Karışımları ayıralım") |
| 16 | `assets/images/items/fen/karisim_demir_talas.png` | 1:1 | — | Demir tozu ve talaş (ünite 4, "Karışımları ayıralım") |
| 17 | `assets/images/items/fen/karisim_kum_nohut.png` | 1:1 | — | Kum ve nohut (ünite 4, "Karışımları ayıralım") |
| 18 | `assets/images/items/fen/karisim_su_kum.png` | 1:1 | — | Su ve kum (ünite 4, "Karışımları ayıralım") |
| 19 | `assets/images/items/fen/karisim_su_yag.png` | 1:1 | — | Su ve zeytinyağı (ünite 4, "Karışımları ayıralım") |
| 20 | `assets/images/items/fen/gazete.png` | 1:1 | — | Gazete (ünite 4, "Atıkları ayrıştıralım") |
| 21 | `assets/images/items/fen/karton_kutu.png` | 1:1 | — | Karton kutu (ünite 4, "Atıkları ayrıştıralım") |
| 22 | `assets/images/items/fen/plastik_sise.png` | 1:1 | — | Plastik şişe (ünite 4, "Atıkları ayrıştıralım") |
| 23 | `assets/images/items/fen/yogurt_kabi.png` | 1:1 | — | Plastik yoğurt kabı (ünite 4, "Atıkları ayrıştıralım") |
| 24 | `assets/images/items/fen/cam_kavanoz.png` | 1:1 | — | Cam kavanoz (ünite 4, "Atıkları ayrıştıralım") |
| 25 | `assets/images/items/fen/cam_sise.png` | 1:1 | — | Cam şişe (ünite 4, "Atıkları ayrıştıralım") |
| 26 | `assets/images/items/fen/donme_dolap.png` | 1:1 | — | Dönme dolap (ünite 5, "Hareket durumları") |
| 27 | `assets/images/items/fen/firildak.png` | 1:1 | — | Fırıldak (ünite 5, "Hareket durumları") |
| 28 | `assets/images/items/fen/topac.png` | 1:1 | — | Topaç (ünite 5, "Hareket durumları") |
| 29 | `assets/images/items/fen/salincak.png` | 1:1 | — | Salıncak (ünite 5, "Hareket durumları") |
| 30 | `assets/images/items/fen/besik.png` | 1:1 | — | Beşik (ünite 5, "Hareket durumları") |
| 31 | `assets/images/items/fen/sarkacli_saat.png` | 1:1 | — | Sarkaçlı saat (ünite 5, "Hareket durumları") |
| 32 | `assets/images/items/fen/kaydirak.png` | 1:1 | — | Kaydıraktan kayan çocuk (ünite 5, "Hareket durumları") |
| 33 | `assets/images/items/fen/yokus_top.png` | 1:1 | — | Yokuştan inen top (ünite 5, "Hareket durumları") |
| 34 | `assets/images/items/fen/bisiklet_fren.png` | 1:1 | — | Fren yapan bisikletli (ünite 5, "Hareket durumları") |
| 35 | `assets/images/items/fen/parasut.png` | 1:1 | — | Paraşüt (ünite 5, "Hareket durumları") |
| 36 | `assets/images/items/fen/itme_alisveris.png` | 1:1 | — | Alışveriş arabasını itmek (ünite 5, "İtme ve çekme") |
| 37 | `assets/images/items/fen/itme_salincak.png` | 1:1 | — | Salıncağı itmek (ünite 5, "İtme ve çekme") |
| 38 | `assets/images/items/fen/itme_top.png` | 1:1 | — | Topa vurmak (ünite 5, "İtme ve çekme") |
| 39 | `assets/images/items/fen/cekme_cekmece.png` | 1:1 | — | Çekmeceyi çekmek (ünite 5, "İtme ve çekme") |
| 40 | `assets/images/items/fen/cekme_kizak.png` | 1:1 | — | Kızağı çekmek (ünite 5, "İtme ve çekme") |
| 41 | `assets/images/items/fen/cekme_halat.png` | 1:1 | — | Halat çekmek (ünite 5, "İtme ve çekme") |
| 42 | `assets/images/items/fen/davranis_buyuge_soyle.png` | 1:1 | — | Bir büyüğe haber vermek (ünite 5, "Hareket durumları") |
| 43 | `assets/images/items/fen/davranis_yola_kos.png` | 1:1 | — | Yola koşmak (ünite 5, "Hareket durumları") |
| 44 | `assets/images/items/fen/davranis_el_kurula.png` | 1:1 | — | Elleri kurulamak (ünite 6, "Elektriği güvenle kullanalım") |
| 45 | `assets/images/items/fen/davranis_islak_el_priz.png` | 1:1 | — | Islak elle prize dokunmak (ünite 6, "Elektriği güvenle kullanalım") |
| 46 | `assets/images/items/fen/davranis_kablo_tut.png` | 1:1 | — | Yıpranmış kabloyu tutmak (ünite 6, "Elektriği güvenle kullanalım") |
| 47 | `assets/images/items/fen/davranis_fisten_tut.png` | 1:1 | — | Fişi tutarak çekmek (ünite 6, "Elektriği güvenle kullanalım") |
| 48 | `assets/images/items/fen/davranis_kablodan_cek.png` | 1:1 | — | Kablodan çekmek (ünite 6, "Elektriği güvenle kullanalım") |
| 49 | `assets/images/items/fen/buzdolabi.png` | 1:1 | — | Buzdolabı (ünite 6, "Elektrikli mi?") |
| 50 | `assets/images/items/fen/televizyon.png` | 1:1 | — | Televizyon (ünite 6, "Elektrikli mi?") |
| 51 | `assets/images/items/fen/el_feneri.png` | 1:1 | — | El feneri (ünite 6, "Elektrikli mi?") |
| 52 | `assets/images/items/fen/makas.png` | 1:1 | — | Makas (ünite 6, "Elektrikli mi?") |
| 53 | `assets/images/items/fen/kalem.png` | 1:1 | — | Kalem (ünite 6, "Elektrikli mi?") |
| 54 | `assets/images/items/fen/cali_supurgesi.png` | 1:1 | — | Çalı süpürgesi (ünite 6, "Elektrikli mi?") |
| 55 | `assets/images/items/fen/utu.png` | 1:1 | — | Ütü (ünite 6, "Elektrikli mi?") |
| 56 | `assets/images/items/fen/mikser.png` | 1:1 | — | Mikser (ünite 6, "Elektrikli mi?") |
| 57 | `assets/images/items/fen/kumanda.png` | 1:1 | — | Kumanda (ünite 6, "Elektrikli mi?") |
| 58 | `assets/images/items/fen/kitap.png` | 1:1 | — | Kitap (ünite 6, "Elektrikli mi?") |
| 59 | `assets/images/items/fen/tasarruf_isik_kapat.png` | 1:1 | — | Işığı kapatmak (ünite 6, "Elektriği tasarruflu kullanalım") |
| 60 | `assets/images/items/fen/tasarruf_perde_ac.png` | 1:1 | — | Perdeyi açmak (ünite 6, "Elektriği tasarruflu kullanalım") |
| 61 | `assets/images/items/fen/tasarruf_tv_kapat.png` | 1:1 | — | Televizyonu kapatmak (ünite 6, "Elektriği tasarruflu kullanalım") |
| 62 | `assets/images/items/fen/savurgan_buzdolabi_acik.png` | 1:1 | — | Açık bırakılan buzdolabı (ünite 6, "Elektriği tasarruflu kullanalım") |
| 63 | `assets/images/items/fen/savurgan_bos_oda_isik.png` | 1:1 | — | Boş odada yanan ışık (ünite 6, "Elektriği tasarruflu kullanalım") |
| 64 | `assets/images/items/fen/savurgan_tv_bos.png` | 1:1 | — | Kimse izlemezken açık TV (ünite 6, "Elektriği tasarruflu kullanalım") |

## Promptlar

### 1. `assets/images/items/fen/tas.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Taş (ünite 4, "Katı, sıvı, gaz").

```
a smooth round grey stone. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/items/fen/tahta_blok.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tahta blok (ünite 4, "Katı, sıvı, gaz").

```
a light wooden toy building block. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/items/fen/buz_kupu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Buz küpü (ünite 4, "Katı, sıvı, gaz").

```
a single clear ice cube. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 4. `assets/images/items/fen/su_bardagi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bir bardak su (ünite 4, "Katı, sıvı, gaz").

```
a clear glass of water. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 5. `assets/images/items/fen/sut.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Süt (ünite 4, "Katı, sıvı, gaz").

```
a glass of white milk. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 6. `assets/images/items/fen/zeytinyagi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Zeytinyağı (ünite 4, "Katı, sıvı, gaz").

```
a small glass bottle of golden olive oil with an olive branch beside. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 7. `assets/images/items/fen/buhar.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Su buharı (ünite 4, "Katı, sıvı, gaz").

```
a white kettle with soft white steam rising from its spout. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 8. `assets/images/items/fen/balon_hava.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Balondaki hava (ünite 4, "Katı, sıvı, gaz").

```
a red balloon being blown up with a hand pump: on the left a small upright hand air pump with a T-shaped handle, a thin flexible tube running from the pump to the neck of a round red balloon on the right, the balloon half inflated. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 9. `assets/images/items/fen/lastik_bant.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Lastik bant (ünite 4, "Katı, sıvı, gaz").

```
a colorful stretchy rubber band being stretched between two fingers. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 10. `assets/images/items/fen/cam_bardak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Cam bardak (ünite 4, "Katı, sıvı, gaz").

```
an empty clear drinking glass. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 11. `assets/images/items/fen/sunger.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sünger (ünite 4, "Katı, sıvı, gaz").

```
a soft yellow kitchen sponge. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 12. `assets/images/items/fen/miknatis.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Mıknatısla ayırma (ünite 4, "Karışımları ayıralım").

```
a red and blue horseshoe magnet. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 13. `assets/images/items/fen/elek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Eleme (ünite 4, "Karışımları ayıralım").

```
a round kitchen sieve with a wooden rim and mesh. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 14. `assets/images/items/fen/suzgec.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Süzme (ünite 4, "Karışımları ayıralım").

```
a clear funnel with a folded white filter paper on top of a glass jar. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 15. `assets/images/items/fen/dinlendirme.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dinlendirme (ünite 4, "Karışımları ayıralım").

```
a clear jar resting on a table, a golden oil layer floating calmly on top of water. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 16. `assets/images/items/fen/karisim_demir_talas.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Demir tozu ve talaş (ünite 4, "Karışımları ayıralım").

```
a small pile of mixed dark grey iron filings and light wood shavings on a plate. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 17. `assets/images/items/fen/karisim_kum_nohut.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kum ve nohut (ünite 4, "Karışımları ayıralım").

```
a small bowl of sand mixed with round beige chickpeas. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 18. `assets/images/items/fen/karisim_su_kum.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Su ve kum (ünite 4, "Karışımları ayıralım").

```
a clear glass of cloudy water mixed with sand. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 19. `assets/images/items/fen/karisim_su_yag.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Su ve zeytinyağı (ünite 4, "Karışımları ayıralım").

```
a clear glass with water and golden olive oil just poured in, swirling together. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 20. `assets/images/items/fen/gazete.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Gazete (ünite 4, "Atıkları ayrıştıralım").

```
a folded newspaper with plain grey blocks instead of text. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 21. `assets/images/items/fen/karton_kutu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Karton kutu (ünite 4, "Atıkları ayrıştıralım").

```
a flattened brown cardboard box. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 22. `assets/images/items/fen/plastik_sise.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Plastik şişe (ünite 4, "Atıkları ayrıştıralım").

```
an empty clear plastic water bottle with a blue cap. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 23. `assets/images/items/fen/yogurt_kabi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Plastik yoğurt kabı (ünite 4, "Atıkları ayrıştıralım").

```
an empty white plastic yogurt cup without label. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 24. `assets/images/items/fen/cam_kavanoz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Cam kavanoz (ünite 4, "Atıkları ayrıştıralım").

```
an empty clear glass jar with a lid. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 25. `assets/images/items/fen/cam_sise.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Cam şişe (ünite 4, "Atıkları ayrıştıralım").

```
an empty green glass bottle. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 26. `assets/images/items/fen/donme_dolap.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dönme dolap (ünite 5, "Hareket durumları").

```
a small colorful Ferris wheel. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 27. `assets/images/items/fen/firildak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Fırıldak (ünite 5, "Hareket durumları").

```
a colorful paper pinwheel on a stick spinning. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 28. `assets/images/items/fen/topac.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Topaç (ünite 5, "Hareket durumları").

```
a colorful wooden spinning top spinning on its tip. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 29. `assets/images/items/fen/salincak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Salıncak (ünite 5, "Hareket durumları").

```
a wooden swing hanging from a tree branch on two ropes. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 30. `assets/images/items/fen/besik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Beşik (ünite 5, "Hareket durumları").

```
a small wooden rocking cradle. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 31. `assets/images/items/fen/sarkacli_saat.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sarkaçlı saat (ünite 5, "Hareket durumları").

```
a tall wooden pendulum wall clock: a round face with only tick marks and two hands and no numbers at the top, a long glass case below with a round brass pendulum swinging inside. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 32. `assets/images/items/fen/kaydirak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kaydıraktan kayan çocuk (ünite 5, "Hareket durumları").

```
a happy child sliding down a playground slide with motion lines. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 33. `assets/images/items/fen/yokus_top.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yokuştan inen top (ünite 5, "Hareket durumları").

```
a green grassy slope going down from left to right with a pink ball rolling down it, curved motion lines behind the ball. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 34. `assets/images/items/fen/bisiklet_fren.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Fren yapan bisikletli (ünite 5, "Hareket durumları").

```
a child on a bicycle pressing the brakes and slowing down before a puddle. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 35. `assets/images/items/fen/parasut.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Paraşüt (ünite 5, "Hareket durumları").

```
a colorful round parachute canopy with strings holding a small wooden crate gently floating down through the air. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 36. `assets/images/items/fen/itme_alisveris.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Alışveriş arabasını itmek (ünite 5, "İtme ve çekme").

```
a child pushing a small shopping cart. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 37. `assets/images/items/fen/itme_salincak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Salıncağı itmek (ünite 5, "İtme ve çekme").

```
a child pushing a friend on a swing from behind. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 38. `assets/images/items/fen/itme_top.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Topa vurmak (ünite 5, "İtme ve çekme").

```
a child kicking a soccer ball. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 39. `assets/images/items/fen/cekme_cekmece.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çekmeceyi çekmek (ünite 5, "İtme ve çekme").

```
a child pulling open a drawer by its knob. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 40. `assets/images/items/fen/cekme_kizak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kızağı çekmek (ünite 5, "İtme ve çekme").

```
a child pulling a wooden sled with a rope in the snow. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 41. `assets/images/items/fen/cekme_halat.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Halat çekmek (ünite 5, "İtme ve çekme").

```
exactly TWO children pulling a thick rope in a friendly tug of war. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 42. `assets/images/items/fen/davranis_buyuge_soyle.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bir büyüğe haber vermek (ünite 5, "Hareket durumları").

```
a child pointing and calmly telling a grown-up about something, the grown-up listening. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 43. `assets/images/items/fen/davranis_yola_kos.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yola koşmak (ünite 5, "Hareket durumları").

```
a child starting to run towards a street after a ball. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 44. `assets/images/items/fen/davranis_el_kurula.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Elleri kurulamak (ünite 6, "Elektriği güvenle kullanalım").

```
a small round claymation diorama vignette: a small child standing at a bathroom sink and drying both hands with a soft towel, the hands fully dry before touching anything. The child is a small young child with child proportions. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 45. `assets/images/items/fen/davranis_islak_el_priz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Islak elle prize dokunmak (ünite 6, "Elektriği güvenle kullanalım").

```
a small round claymation diorama vignette: in a home hallway a small child with dripping wet hands, water drops falling, reaching one hand towards a white wall electrical socket. The child is a small young child with child proportions. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 46. `assets/images/items/fen/davranis_kablo_tut.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yıpranmış kabloyu tutmak (ünite 6, "Elektriği güvenle kullanalım").

```
a small round claymation diorama vignette: in a living room a small child reaching to touch a damaged lamp cable on the floor, the cable cover is torn and shiny copper wires are showing. The child is a small young child with child proportions. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 47. `assets/images/items/fen/davranis_fisten_tut.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Fişi tutarak çekmek (ünite 6, "Elektriği güvenle kullanalım").

```
a small round claymation diorama vignette: a grown-up hand safely pulling a plug out of a white wall electrical socket by holding the plug body itself firmly, the cord hanging loose. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 48. `assets/images/items/fen/davranis_kablodan_cek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kablodan çekmek (ünite 6, "Elektriği güvenle kullanalım").

```
a small round claymation diorama vignette: a hand wrongly yanking a plug out of a white wall electrical socket by pulling only the cord, the cord stretched tight, the plug half out of the socket. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 49. `assets/images/items/fen/buzdolabi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Buzdolabı (ünite 6, "Elektrikli mi?").

```
a small rounded white refrigerator. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 50. `assets/images/items/fen/televizyon.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Televizyon (ünite 6, "Elektrikli mi?").

```
a small modern television with a blank screen. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 51. `assets/images/items/fen/el_feneri.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** El feneri (ünite 6, "Elektrikli mi?").

```
a yellow battery flashlight lying on its side, a soft cone of warm light beam coming out of its front lens. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 52. `assets/images/items/fen/makas.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Makas (ünite 6, "Elektrikli mi?").

```
a pair of child safety scissors with blue handles. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 53. `assets/images/items/fen/kalem.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kalem (ünite 6, "Elektrikli mi?").

```
a yellow pencil with a pink eraser. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 54. `assets/images/items/fen/cali_supurgesi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çalı süpürgesi (ünite 6, "Elektrikli mi?").

```
a traditional straw broom with a wooden handle. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 55. `assets/images/items/fen/utu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ütü (ünite 6, "Elektrikli mi?").

```
a light blue electric clothes iron with its cord. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 56. `assets/images/items/fen/mikser.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Mikser (ünite 6, "Elektrikli mi?").

```
a white electric hand mixer with its cord. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 57. `assets/images/items/fen/kumanda.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kumanda (ünite 6, "Elektrikli mi?").

```
a small TV remote control with blank round buttons. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 58. `assets/images/items/fen/kitap.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kitap (ünite 6, "Elektrikli mi?").

```
a closed book with a plain colorful cover. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 59. `assets/images/items/fen/tasarruf_isik_kapat.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Işığı kapatmak (ünite 6, "Elektriği tasarruflu kullanalım").

```
a child switching off the light when leaving an empty room. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 60. `assets/images/items/fen/tasarruf_perde_ac.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Perdeyi açmak (ünite 6, "Elektriği tasarruflu kullanalım").

```
a child opening the curtains to let daylight in, lamps off. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 61. `assets/images/items/fen/tasarruf_tv_kapat.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Televizyonu kapatmak (ünite 6, "Elektriği tasarruflu kullanalım").

```
a child switching off a television that nobody is watching. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 62. `assets/images/items/fen/savurgan_buzdolabi_acik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Açık bırakılan buzdolabı (ünite 6, "Elektriği tasarruflu kullanalım").

```
a small round claymation diorama vignette: a kitchen with a refrigerator whose door is left wide open, cold white mist coming out, nobody in the kitchen. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 63. `assets/images/items/fen/savurgan_bos_oda_isik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Boş odada yanan ışık (ünite 6, "Elektriği tasarruflu kullanalım").

```
an empty bedroom with all the lamps switched on in the daytime. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 64. `assets/images/items/fen/savurgan_tv_bos.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kimse izlemezken açık TV (ünite 6, "Elektriği tasarruflu kullanalım").

```
a small round claymation diorama vignette: an empty living room with an empty sofa and a television that is switched on and glowing, nobody in the room. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```


---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Arka plan silindi, şeffaf PNG
- [ ] Görselde yazı, harf ya da rakam yok
- [ ] Stil önceki partilerle tutarlı (yan yana koyup bak)
- [ ] Commit: `assets: 091 fen görselleri 2 (ünite 4-6)`
