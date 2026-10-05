# 050 · 3. sınıf Matematik nesne görselleri

**Öncelik: ORTA** (Faz 3e). `content/g3/matematik/u01–u06.json` turlarında kullanılan ve henüz istenmemiş 55 nesne: onluk taban blokları (`item.blok.*`), olay ve süre kartları (`item.olay.*`), uzunluk ve kütle karşılaştırma nesneleri (`item.olcu.*`), düzlemsel şekiller (`item.sekil.*`), çizim araçları (`item.arac.*`), çevre ölçme kartları (`item.cevre.*`), sıvı kapları (`item.kap.*`) ve simetri kartları (`item.simetri.*`).

Ortak anahtarlar: `item.cisim.*` (6 cisim) ile `item.sekil.ucgen`, `item.sekil.kare`, `item.sekil.dikdortgen` ve `item.simetri.kalp` 2. sınıf partilerinde (040, 042) istendi; burada tekrar edilmez.

> Bu dosya eklenmeden de oyun çalışır: eksik görsellerin yerinde Türkçe etiketli yer tutucu görünür.

Hepsinin arka planı silinir, şeffaf PNG kaydedilir. Şekil ve cisim kartları birbirine karıştırılmayacak kadar net olmalı: köşe ve kenar sayısı ilk bakışta okunmalı. Cetvel, şerit metre ve kareli kâğıtta **rakam yok**, yalnızca çentik ve çizgi var.

Stil bloğu: `docs/assets/style-guide.md` → `STYLE_SPRITE` (promptların sonunda tam metin olarak yer alıyor).

## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/items/blok/yuzluk.png` | 1:1 | — | yüzlük (`label.item.blok.yuzluk`). |
| 2 | `assets/images/items/blok/onluk.png` | 1:1 | — | onluk (`label.item.blok.onluk`). |
| 3 | `assets/images/items/blok/birlik.png` | 1:1 | — | birlik (`label.item.blok.birlik`). |
| 4 | `assets/images/items/olay/goz_kirpma.png` | 1:1 | — | göz kırpmak (`label.item.olay.goz_kirpma`). |
| 5 | `assets/images/items/olay/hapsirma.png` | 1:1 | — | hapşırmak (`label.item.olay.hapsirma`). |
| 6 | `assets/images/items/olay/dis_fircalama.png` | 1:1 | — | diş fırçalamak (`label.item.olay.dis_fircalama`). |
| 7 | `assets/images/items/olay/el_yikama.png` | 1:1 | — | el yıkamak (`label.item.olay.el_yikama`). |
| 8 | `assets/images/items/olay/ayakkabi_baglama.png` | 1:1 | — | ayakkabı bağlamak (`label.item.olay.ayakkabi_baglama`). |
| 9 | `assets/images/items/olay/yemek_yeme.png` | 1:1 | — | yemek yemek (`label.item.olay.yemek_yeme`). |
| 10 | `assets/images/items/olay/uyku.png` | 1:1 | — | gece uykusu (`label.item.olay.uyku`). |
| 11 | `assets/images/items/olay/okul_gunu.png` | 1:1 | — | okul günü (`label.item.olay.okul_gunu`). |
| 12 | `assets/images/items/olay/otobus_yolculugu.png` | 1:1 | — | uzun otobüs yolculuğu (`label.item.olay.otobus_yolculugu`). |
| 13 | `assets/images/items/olay/kamp.png` | 1:1 | — | kamp tatili (`label.item.olay.kamp`). |
| 14 | `assets/images/items/olay/bayram_tatili.png` | 1:1 | — | bayram tatili (`label.item.olay.bayram_tatili`). |
| 15 | `assets/images/items/olay/yaz_tatili.png` | 1:1 | — | yaz tatili (`label.item.olay.yaz_tatili`). |
| 16 | `assets/images/items/olcu/kapi.png` | 1:1 | — | kapı (`label.item.olcu.kapi`). |
| 17 | `assets/images/items/olcu/otobus.png` | 1:1 | — | otobüs (`label.item.olcu.otobus`). |
| 18 | `assets/images/items/olcu/sehirler_arasi_yol.png` | 1:1 | — | şehirler arası yol (`label.item.olcu.sehirler_arasi_yol`). |
| 19 | `assets/images/items/olcu/karpuz.png` | 1:1 | — | karpuz (`label.item.olcu.karpuz`). |
| 20 | `assets/images/items/olcu/un_cuvali.png` | 1:1 | — | un çuvalı (`label.item.olcu.un_cuvali`). |
| 21 | `assets/images/items/olcu/fil.png` | 1:1 | — | fil (`label.item.olcu.fil`). |
| 22 | `assets/images/items/olcu/kamyon.png` | 1:1 | — | kamyon (`label.item.olcu.kamyon`). |
| 23 | `assets/images/items/sekil/ucgen_dik.png` | 1:1 | — | dik üçgen (`label.item.sekil.ucgen_dik`). |
| 24 | `assets/images/items/sekil/ucgen_genis.png` | 1:1 | — | geniş üçgen (`label.item.sekil.ucgen_genis`). |
| 25 | `assets/images/items/sekil/yamuk.png` | 1:1 | — | yamuk (`label.item.sekil.yamuk`). |
| 26 | `assets/images/items/sekil/besgen.png` | 1:1 | — | beşgen (`label.item.sekil.besgen`). |
| 27 | `assets/images/items/sekil/besgen_ev.png` | 1:1 | — | ev biçiminde beşgen (`label.item.sekil.besgen_ev`). |
| 28 | `assets/images/items/sekil/altigen.png` | 1:1 | — | altıgen (`label.item.sekil.altigen`). |
| 29 | `assets/images/items/sekil/altigen_uzun.png` | 1:1 | — | uzun altıgen (`label.item.sekil.altigen_uzun`). |
| 30 | `assets/images/items/sekil/sekizgen.png` | 1:1 | — | sekizgen (`label.item.sekil.sekizgen`). |
| 31 | `assets/images/items/arac/cetvel.png` | 1:1 | — | cetvel (`label.item.arac.cetvel`). |
| 32 | `assets/images/items/arac/kareli_kagit.png` | 1:1 | — | kareli kâğıt (`label.item.arac.kareli_kagit`). |
| 33 | `assets/images/items/arac/geometri_tahtasi.png` | 1:1 | — | geometri tahtası (`label.item.arac.geometri_tahtasi`). |
| 34 | `assets/images/items/arac/tablet.png` | 1:1 | — | tablet (`label.item.arac.tablet`). |
| 35 | `assets/images/items/arac/makas.png` | 1:1 | — | makas (`label.item.arac.makas`). |
| 36 | `assets/images/items/arac/yapistirici.png` | 1:1 | — | yapıştırıcı (`label.item.arac.yapistirici`). |
| 37 | `assets/images/items/arac/kasik.png` | 1:1 | — | kaşık (`label.item.arac.kasik`). |
| 38 | `assets/images/items/cevre/dikdortgen_3x2.png` | 1:1 | — | dikdörtgen (3 × 2 birim) (`label.item.cevre.dikdortgen_3x2`). |
| 39 | `assets/images/items/cevre/kare_3.png` | 1:1 | — | kare (kenarı 3 birim) (`label.item.cevre.kare_3`). |
| 40 | `assets/images/items/cevre/kitap_karis.png` | 1:1 | — | kitap ve karış (`label.item.cevre.kitap_karis`). |
| 41 | `assets/images/items/kap/bardak.png` | 1:1 | — | su bardağı (`label.item.kap.bardak`). |
| 42 | `assets/images/items/kap/cay_bardagi.png` | 1:1 | — | çay bardağı (`label.item.kap.cay_bardagi`). |
| 43 | `assets/images/items/kap/fincan.png` | 1:1 | — | fincan (`label.item.kap.fincan`). |
| 44 | `assets/images/items/kap/su_sisesi.png` | 1:1 | — | su şişesi (1 L) (`label.item.kap.su_sisesi`). |
| 45 | `assets/images/items/kap/kova.png` | 1:1 | — | kova (`label.item.kap.kova`). |
| 46 | `assets/images/items/kap/kuvet.png` | 1:1 | — | küvet (`label.item.kap.kuvet`). |
| 47 | `assets/images/items/kap/akvaryum.png` | 1:1 | — | akvaryum (`label.item.kap.akvaryum`). |
| 48 | `assets/images/items/simetri/kare.png` | 1:1 | — | kare (`label.item.simetri.kare`). |
| 49 | `assets/images/items/simetri/dikdortgen.png` | 1:1 | — | dikdörtgen (`label.item.simetri.dikdortgen`). |
| 50 | `assets/images/items/simetri/daire.png` | 1:1 | — | daire (`label.item.simetri.daire`). |
| 51 | `assets/images/items/simetri/kare_kosegen.png` | 1:1 | — | köşegeni çizili kare (`label.item.simetri.kare_kosegen`). |
| 52 | `assets/images/items/simetri/dikdortgen_kosegen.png` | 1:1 | — | köşegeni çizili dikdörtgen (`label.item.simetri.dikdortgen_kosegen`). |
| 53 | `assets/images/items/simetri/kare_yamuk_cizgi.png` | 1:1 | — | yamuk çizgili kare (`label.item.simetri.kare_yamuk_cizgi`). |
| 54 | `assets/images/items/simetri/ev.png` | 1:1 | — | ev çizimi (`label.item.simetri.ev`). |
| 55 | `assets/images/items/simetri/ruzgar_gulu.png` | 1:1 | — | yamuk çizim (`label.item.simetri.ruzgar_gulu`). |

## Promptlar

### 1. `assets/images/items/blok/yuzluk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** yüzlük (`label.item.blok.yuzluk`).

```
a flat square plate made of ten by ten small attached unit cubes (a base-ten hundred flat), light blue clay, cubes clearly visible as a grid of little bumps. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/items/blok/onluk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** onluk (`label.item.blok.onluk`).

```
a straight rod made of ten small attached unit cubes in a single row (a base-ten ten rod), orange clay, each little cube clearly visible. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/items/blok/birlik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** birlik (`label.item.blok.birlik`).

```
one single small unit cube (a base-ten one), yellow clay, soft rounded edges. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 4. `assets/images/items/olay/goz_kirpma.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** göz kırpmak (`label.item.olay.goz_kirpma`).

```
a cute child character winking one eye with a happy smile, close-up head and shoulders. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 5. `assets/images/items/olay/hapsirma.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** hapşırmak (`label.item.olay.hapsirma`).

```
a cute child character sneezing into the crook of the elbow, eyes closed, small soft puff cloud. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 6. `assets/images/items/olay/dis_fircalama.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** diş fırçalamak (`label.item.olay.dis_fircalama`).

```
a cute child character brushing teeth with a toothbrush and foam, standing at a small sink. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 7. `assets/images/items/olay/el_yikama.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** el yıkamak (`label.item.olay.el_yikama`).

```
a cute child character washing hands with soap bubbles under a tap. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 8. `assets/images/items/olay/ayakkabi_baglama.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** ayakkabı bağlamak (`label.item.olay.ayakkabi_baglama`).

```
a cute child character kneeling and tying the laces of one sneaker. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 9. `assets/images/items/olay/yemek_yeme.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** yemek yemek (`label.item.olay.yemek_yeme`).

```
a cute child character sitting at a table eating soup with a spoon. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 10. `assets/images/items/olay/uyku.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** gece uykusu (`label.item.olay.uyku`).

```
a cute child character sleeping in a cozy bed under a blanket, a crescent moon shaped night lamp. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 11. `assets/images/items/olay/okul_gunu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** okul günü (`label.item.olay.okul_gunu`).

```
a cute child character with a backpack walking into a small friendly school building. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 12. `assets/images/items/olay/otobus_yolculugu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** uzun otobüs yolculuğu (`label.item.olay.otobus_yolculugu`).

```
a cute intercity bus driving on a long winding road between hills. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 13. `assets/images/items/olay/kamp.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** kamp tatili (`label.item.olay.kamp`).

```
a small camping tent by a lake with a tiny campfire, cozy evening. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 14. `assets/images/items/olay/bayram_tatili.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** bayram tatili (`label.item.olay.bayram_tatili`).

```
a cute family of clay characters visiting grandparents, a table with a candy bowl, festive bunting without any symbols. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 15. `assets/images/items/olay/yaz_tatili.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** yaz tatili (`label.item.olay.yaz_tatili`).

```
a beach scene with a sand bucket, a beach umbrella and calm sea waves. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 16. `assets/images/items/olcu/kapi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** kapı (`label.item.olcu.kapi`).

```
a friendly wooden clay door with a round knob, standing upright. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 17. `assets/images/items/olcu/otobus.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** otobüs (`label.item.olcu.otobus`).

```
a cute yellow city bus seen from the side. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 18. `assets/images/items/olcu/sehirler_arasi_yol.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** şehirler arası yol (`label.item.olcu.sehirler_arasi_yol`).

```
a long road winding from a tiny village to a faraway tiny town over green hills, seen from above. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 19. `assets/images/items/olcu/karpuz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** karpuz (`label.item.olcu.karpuz`).

```
a whole round striped green watermelon. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 20. `assets/images/items/olcu/un_cuvali.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** un çuvalı (`label.item.olcu.un_cuvali`).

```
a plump cloth flour sack tied at the top, cream colored, a small wheat ear decoration. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 21. `assets/images/items/olcu/fil.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** fil (`label.item.olcu.fil`).

```
a cute big grey elephant standing, friendly smile. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 22. `assets/images/items/olcu/kamyon.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** kamyon (`label.item.olcu.kamyon`).

```
a big friendly dump truck loaded with round stones, seen from the side. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 23. `assets/images/items/sekil/ucgen_dik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** dik üçgen (`label.item.sekil.ucgen_dik`).

```
a flat right angled triangle in teal cut out of thick smooth clay like a cookie, seen straight from above, clean straight edges and sharp visible corners. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 24. `assets/images/items/sekil/ucgen_genis.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** geniş üçgen (`label.item.sekil.ucgen_genis`).

```
a flat wide flat obtuse triangle in lavender cut out of thick smooth clay like a cookie, seen straight from above, clean straight edges and sharp visible corners. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 25. `assets/images/items/sekil/yamuk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** yamuk (`label.item.sekil.yamuk`).

```
a flat trapezoid (four sided, top side shorter than bottom) in peach cut out of thick smooth clay like a cookie, seen straight from above, clean straight edges and sharp visible corners. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 26. `assets/images/items/sekil/besgen.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** beşgen (`label.item.sekil.besgen`).

```
a flat regular pentagon in sky blue cut out of thick smooth clay like a cookie, seen straight from above, clean straight edges and sharp visible corners. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 27. `assets/images/items/sekil/besgen_ev.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** ev biçiminde beşgen (`label.item.sekil.besgen_ev`).

```
a flat house shaped pentagon (a square with a triangular roof as one single flat piece) in pink cut out of thick smooth clay like a cookie, seen straight from above, clean straight edges and sharp visible corners. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 28. `assets/images/items/sekil/altigen.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** altıgen (`label.item.sekil.altigen`).

```
a flat regular hexagon in honey yellow like a honeycomb cell cut out of thick smooth clay like a cookie, seen straight from above, clean straight edges and sharp visible corners. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 29. `assets/images/items/sekil/altigen_uzun.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** uzun altıgen (`label.item.sekil.altigen_uzun`).

```
a flat stretched long hexagon in coral cut out of thick smooth clay like a cookie, seen straight from above, clean straight edges and sharp visible corners. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 30. `assets/images/items/sekil/sekizgen.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** sekizgen (`label.item.sekil.sekizgen`).

```
a flat regular octagon in red cut out of thick smooth clay like a cookie, seen straight from above, clean straight edges and sharp visible corners. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 31. `assets/images/items/arac/cetvel.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** cetvel (`label.item.arac.cetvel`).

```
a straight wooden clay ruler with evenly spaced tick marks but no numbers. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 32. `assets/images/items/arac/kareli_kagit.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** kareli kâğıt (`label.item.arac.kareli_kagit`).

```
a sheet of squared grid paper with soft blue grid lines, slightly curled corner. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 33. `assets/images/items/arac/geometri_tahtasi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** geometri tahtası (`label.item.arac.geometri_tahtasi`).

```
a square geoboard with a grid of small round pegs and two colorful rubber bands stretched into a triangle and a square. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 34. `assets/images/items/arac/tablet.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** tablet (`label.item.arac.tablet`).

```
a friendly tablet computer showing simple colorful geometric shapes on the screen, no letters. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 35. `assets/images/items/arac/makas.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** makas (`label.item.arac.makas`).

```
a pair of child safety scissors with rounded tips and chunky orange handles. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 36. `assets/images/items/arac/yapistirici.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** yapıştırıcı (`label.item.arac.yapistirici`).

```
a glue stick with a purple cap. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 37. `assets/images/items/arac/kasik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** kaşık (`label.item.arac.kasik`).

```
a simple round wooden spoon. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 38. `assets/images/items/cevre/dikdortgen_3x2.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** dikdörtgen (3 × 2 birim) (`label.item.cevre.dikdortgen_3x2`).

```
a flat coral clay rectangle exactly three grid squares long and two grid squares tall, drawn on light squared grid paper so the unit squares can be counted, seen straight from above, no numbers. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 39. `assets/images/items/cevre/kare_3.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** kare (kenarı 3 birim) (`label.item.cevre.kare_3`).

```
a flat teal clay square exactly three grid squares on each side, drawn on light squared grid paper so the unit squares can be counted, seen straight from above, no numbers. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 40. `assets/images/items/cevre/kitap_karis.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** kitap ve karış (`label.item.cevre.kitap_karis`).

```
a closed hardcover book lying flat, a cute child hand with fingers spread measuring the long side with a hand span, seen from above. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 41. `assets/images/items/kap/bardak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** su bardağı (`label.item.kap.bardak`).

```
a clear drinking glass half filled with water, no labels and no writing on it. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 42. `assets/images/items/kap/cay_bardagi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** çay bardağı (`label.item.kap.cay_bardagi`).

```
a small tulip shaped Turkish tea glass with tea on a tiny saucer, no labels and no writing on it. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 43. `assets/images/items/kap/fincan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** fincan (`label.item.kap.fincan`).

```
a small coffee cup on a saucer, no labels and no writing on it. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 44. `assets/images/items/kap/su_sisesi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** su şişesi (1 L) (`label.item.kap.su_sisesi`).

```
a one litre clear plastic water bottle with a blue cap, no labels and no writing on it. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 45. `assets/images/items/kap/kova.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** kova (`label.item.kap.kova`).

```
a cheerful plastic bucket with a handle, filled with water, no labels and no writing on it. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 46. `assets/images/items/kap/kuvet.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** küvet (`label.item.kap.kuvet`).

```
a white bathtub full of water with a few soap bubbles, no labels and no writing on it. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 47. `assets/images/items/kap/akvaryum.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** akvaryum (`label.item.kap.akvaryum`).

```
a rectangular fish tank full of water with one small orange fish and a green plant, no labels and no writing on it. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 48. `assets/images/items/simetri/kare.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** kare (`label.item.simetri.kare`).

```
a flat butter yellow clay square, seen straight from above. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 49. `assets/images/items/simetri/dikdortgen.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** dikdörtgen (`label.item.simetri.dikdortgen`).

```
a flat mint green clay rectangle, clearly longer than it is tall, seen straight from above. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 50. `assets/images/items/simetri/daire.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** daire (`label.item.simetri.daire`).

```
a flat round coral clay disc, seen straight from above. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 51. `assets/images/items/simetri/kare_kosegen.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** köşegeni çizili kare (`label.item.simetri.kare_kosegen`).

```
a flat butter yellow clay square with one thin dark dashed line drawn along a diagonal from corner to corner, seen straight from above. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 52. `assets/images/items/simetri/dikdortgen_kosegen.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** köşegeni çizili dikdörtgen (`label.item.simetri.dikdortgen_kosegen`).

```
a flat mint green clay rectangle, clearly longer than it is tall, with one thin dark dashed line drawn along a diagonal from corner to corner, seen straight from above. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 53. `assets/images/items/simetri/kare_yamuk_cizgi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** yamuk çizgili kare (`label.item.simetri.kare_yamuk_cizgi`).

```
a flat butter yellow clay square with one thin dark dashed line that cuts it into two unequal pieces, slanted and off center, seen straight from above. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 54. `assets/images/items/simetri/ev.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** ev çizimi (`label.item.simetri.ev`).

```
a flat simple house drawing made of a square body and a triangular roof, a door exactly in the middle, perfectly mirror symmetric, seen straight from above. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 55. `assets/images/items/simetri/ruzgar_gulu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** yamuk çizim (`label.item.simetri.ruzgar_gulu`).

```
a flat simple drawing of a lopsided kite shape with a tail curling only to one side, clearly not symmetric, seen straight from above. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```


---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Arka planlar silindi, şeffaf PNG
- [ ] Görselde yazı, harf ya da rakam yok (cetvel ve kâğıtta yalnızca çizgi)
- [ ] Şekillerin köşe sayısı doğru (üçgen 3, yamuk 4, beşgen 5, altıgen 6, sekizgen 8)
- [ ] Simetri kartlarında simetrik olanlar gerçekten simetrik, yamuk çizim gerçekten simetrik değil
- [ ] Stil önceki partilerle tutarlı (yan yana koyup bak)
- [ ] Commit: `assets: 050 g3 matematik nesneleri`
