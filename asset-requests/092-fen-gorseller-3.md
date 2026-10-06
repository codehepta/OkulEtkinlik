# 092 · Fen Bilimleri 3 görselleri (ünite 7–8)

**Öncelik: ORTA** (Faz 6, Keşif Laboratuvarı). `content/g3/fen/u07–u08.json` turlarında kullanılan nesne, canlı ve davranış kartları: ünite 7–8: toprak, bitki yetiştirme, yaşam alanları, canlı çeşitliliği. Her dosya `item.fen.<ad>` anahtarıyla yüklenir; aynı görsel birden çok turda tekrar kullanılır.

Hepsi gelene kadar oyun her görsel için Türkçe adını yazan renkli bir yer tutucu gösterir; dosyayı tablodaki yola koymak yeterlidir, kod değişikliği gerekmez.

- Her görsel bir **sprite**tır: arka planı silinir, şeffaf PNG kaydedilir, 1:1. Oyunda kart üstünde 150–300 px gösterilir; silüet küçükte de okunaklı olmalı.
- Kutulara ayırma ve eşleştirme turlarında yan yana durdukları için **aynı ışık ve aynı bakış açısıyla** üretilmeli. Önce 3–4 tanesini üretip birbirine uyduğunu kontrol et.
- Çocuk ve yetişkin figürleri sevimli kil oyuncak insanlar olarak üretilir; gerçek kişilere benzemez. Tehlikeli davranış kartları (ıslak elle priz, yola koşmak) korkutucu değil, sakin ve sade olmalı.
- Görsellerde yazı, harf ya da rakam yok (kitap kapakları, gazete, saat kadranı boş).

Stil bloğu: `docs/assets/style-guide.md` → `STYLE_SPRITE`. Promptların sonunda tam metin olarak yer alıyor.


## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/items/fen/toprak_1_kaya.png` | 1:1 | — | Büyük kaya (ünite 7, "Toprak nasıl oluşur?") |
| 2 | `assets/images/items/fen/toprak_2_catlak.png` | 1:1 | — | Çatlayan kaya (ünite 7, "Toprak nasıl oluşur?") |
| 3 | `assets/images/items/fen/toprak_3_kum_cakil.png` | 1:1 | — | Kum ve çakıl (ünite 7, "Toprak nasıl oluşur?") |
| 4 | `assets/images/items/fen/toprak_4_toprak.png` | 1:1 | — | Toprak (ünite 7, "Toprak nasıl oluşur?") |
| 5 | `assets/images/items/fen/kum.png` | 1:1 | — | Kum (ünite 7, "Toprak nasıl oluşur?") |
| 6 | `assets/images/items/fen/cakil.png` | 1:1 | — | Küçük taşlar (ünite 7, "Toprak nasıl oluşur?") |
| 7 | `assets/images/items/fen/bitki_parcalari.png` | 1:1 | — | Bitki parçaları (ünite 7, "Toprak nasıl oluşur?") |
| 8 | `assets/images/items/fen/kil.png` | 1:1 | — | Kil (ünite 7, "Toprak nasıl oluşur?") |
| 9 | `assets/images/items/fen/sulama_kabi.png` | 1:1 | — | Su (ünite 7, "Bitki yetiştirelim") |
| 10 | `assets/images/items/fen/gunes.png` | 1:1 | — | Güneş ışığı (ünite 7, "Bitki yetiştirelim") |
| 11 | `assets/images/items/fen/saksi_toprak.png` | 1:1 | — | Toprak (ünite 7, "Bitki yetiştirelim") |
| 12 | `assets/images/items/fen/oyuncak_top.png` | 1:1 | — | Oyuncak top (ünite 7, "Bitki yetiştirelim") |
| 13 | `assets/images/items/fen/sekerleme.png` | 1:1 | — | Şekerleme (ünite 7, "Bitki yetiştirelim") |
| 14 | `assets/images/items/fen/celtik.png` | 1:1 | — | Çeltik (ünite 7, "Bitki yetiştirelim") |
| 15 | `assets/images/items/fen/ekim_tohum_ek.png` | 1:1 | — | Tohumu ekmek (ünite 7, "Bitki yetiştirelim") |
| 16 | `assets/images/items/fen/ekim_sula.png` | 1:1 | — | Sulamak (ünite 7, "Bitki yetiştirelim") |
| 17 | `assets/images/items/fen/ekim_gunesli_yer.png` | 1:1 | — | Güneşli yere koymak (ünite 7, "Bitki yetiştirelim") |
| 18 | `assets/images/items/fen/ekim_filiz.png` | 1:1 | — | Filizlenmek (ünite 7, "Bitki yetiştirelim") |
| 19 | `assets/images/items/fen/nilufer.png` | 1:1 | — | Nilüfer (ünite 8, "Kim nerede yaşar?") |
| 20 | `assets/images/items/fen/sincap.png` | 1:1 | — | Sincap (ünite 8, "Kim nerede yaşar?") |
| 21 | `assets/images/items/fen/baykus.png` | 1:1 | — | Baykuş (ünite 8, "Kim nerede yaşar?") |
| 22 | `assets/images/items/fen/solucan.png` | 1:1 | — | Solucan (ünite 8, "Kim nerede yaşar?") |
| 23 | `assets/images/items/fen/karinca.png` | 1:1 | — | Karınca (ünite 8, "Kim nerede yaşar?") |
| 24 | `assets/images/items/fen/kostebek.png` | 1:1 | — | Köstebek (ünite 8, "Kim nerede yaşar?") |
| 25 | `assets/images/items/fen/ordek.png` | 1:1 | — | Ördek (ünite 8, "Kim nerede yaşar?") |
| 26 | `assets/images/items/fen/egrelti.png` | 1:1 | — | Eğrelti otu (ünite 8, "Kim nerede yaşar?") |
| 27 | `assets/images/items/fen/kertenkele.png` | 1:1 | — | Kertenkele (ünite 8, "Kim nerede yaşar?") |
| 28 | `assets/images/items/fen/deve.png` | 1:1 | — | Deve (ünite 8, "Kim nerede yaşar?") |
| 29 | `assets/images/items/fen/yasam_gol.png` | 1:1 | — | Göl (ünite 8, "Canlı çeşitliliği") |
| 30 | `assets/images/items/fen/yasam_orman.png` | 1:1 | — | Orman (ünite 8, "Canlı çeşitliliği") |
| 31 | `assets/images/items/fen/yasam_col.png` | 1:1 | — | Çöl (ünite 8, "Canlı çeşitliliği") |
| 32 | `assets/images/items/fen/bahce_ayni.png` | 1:1 | — | Tek çeşit çiçekli bahçe (ünite 8, "Canlı çeşitliliği") |
| 33 | `assets/images/items/fen/bahce_farkli.png` | 1:1 | — | Çeşit çeşit canlılı bahçe (ünite 8, "Canlı çeşitliliği") |
| 34 | `assets/images/items/fen/koruma_fidan_dik.png` | 1:1 | — | Fidan dikmek (ünite 8, "Yaşam alanlarını koruyalım") |
| 35 | `assets/images/items/fen/koruma_cop_topla.png` | 1:1 | — | Çöp toplamak (ünite 8, "Yaşam alanlarını koruyalım") |
| 36 | `assets/images/items/fen/koruma_kus_evi.png` | 1:1 | — | Kuş evi asmak (ünite 8, "Yaşam alanlarını koruyalım") |
| 37 | `assets/images/items/fen/zarar_gole_cop.png` | 1:1 | — | Göle çöp atmak (ünite 8, "Yaşam alanlarını koruyalım") |
| 38 | `assets/images/items/fen/zarar_piknik_atesi.png` | 1:1 | — | Ateşi söndürmeden gitmek (ünite 8, "Yaşam alanlarını koruyalım") |
| 39 | `assets/images/items/fen/zarar_dal_kirma.png` | 1:1 | — | Ağacın dalını kırmak (ünite 8, "Yaşam alanlarını koruyalım") |

## Promptlar

### 1. `assets/images/items/fen/toprak_1_kaya.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Büyük kaya (ünite 7, "Toprak nasıl oluşur?").

```
a big grey rock on a hillside. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/items/fen/toprak_2_catlak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çatlayan kaya (ünite 7, "Toprak nasıl oluşur?").

```
a big grey rock with cracks, rain water dripping into the cracks. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/items/fen/toprak_3_kum_cakil.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kum ve çakıl (ünite 7, "Toprak nasıl oluşur?").

```
a small pile of sand and little pebbles broken from rock. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 4. `assets/images/items/fen/toprak_4_toprak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Toprak (ünite 7, "Toprak nasıl oluşur?").

```
a cross-section of dark rich soil with small roots, dry leaf pieces, little pebbles and a cute earthworm. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 5. `assets/images/items/fen/kum.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kum (ünite 7, "Toprak nasıl oluşur?").

```
a small pile of fine golden sand. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 6. `assets/images/items/fen/cakil.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Küçük taşlar (ünite 7, "Toprak nasıl oluşur?").

```
a handful of small smooth pebbles. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 7. `assets/images/items/fen/bitki_parcalari.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bitki parçaları (ünite 7, "Toprak nasıl oluşur?").

```
a small pile of dry brown leaf bits and thin root pieces. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 8. `assets/images/items/fen/kil.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kil (ünite 7, "Toprak nasıl oluşur?").

```
a lump of wet reddish-brown clay. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 9. `assets/images/items/fen/sulama_kabi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Su (ünite 7, "Bitki yetiştirelim").

```
a green watering can pouring water drops. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 10. `assets/images/items/fen/gunes.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Güneş ışığı (ünite 7, "Bitki yetiştirelim").

```
a smiling warm sun with soft rays. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 11. `assets/images/items/fen/saksi_toprak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Toprak (ünite 7, "Bitki yetiştirelim").

```
a terracotta pot filled with dark soil. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 12. `assets/images/items/fen/oyuncak_top.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Oyuncak top (ünite 7, "Bitki yetiştirelim").

```
a colorful toy beach ball. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 13. `assets/images/items/fen/sekerleme.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Şekerleme (ünite 7, "Bitki yetiştirelim").

```
a wrapped colorful candy. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 14. `assets/images/items/fen/celtik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çeltik (ünite 7, "Bitki yetiştirelim").

```
rice plants growing in a flooded paddy patch of water. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 15. `assets/images/items/fen/ekim_tohum_ek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tohumu ekmek (ünite 7, "Bitki yetiştirelim").

```
a child's hand placing a bean seed into a small hole in a pot of soil. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 16. `assets/images/items/fen/ekim_sula.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sulamak (ünite 7, "Bitki yetiştirelim").

```
a child watering a pot of soil with a small watering can. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 17. `assets/images/items/fen/ekim_gunesli_yer.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Güneşli yere koymak (ünite 7, "Bitki yetiştirelim").

```
a pot of soil placed on a sunny windowsill. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 18. `assets/images/items/fen/ekim_filiz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Filizlenmek (ünite 7, "Bitki yetiştirelim").

```
a small green sprout with two leaves coming out of a pot of soil. It has no face and no eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 19. `assets/images/items/fen/nilufer.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Nilüfer (ünite 8, "Kim nerede yaşar?").

```
a pink water lily on a round green lily pad. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 20. `assets/images/items/fen/sincap.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sincap (ünite 8, "Kim nerede yaşar?").

```
a cute red squirrel holding an acorn. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 21. `assets/images/items/fen/baykus.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Baykuş (ünite 8, "Kim nerede yaşar?").

```
a cute brown forest owl on a branch (not Bilge, no hat, no scarf). 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 22. `assets/images/items/fen/solucan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Solucan (ünite 8, "Kim nerede yaşar?").

```
a cute pink earthworm. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 23. `assets/images/items/fen/karinca.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Karınca (ünite 8, "Kim nerede yaşar?").

```
a cute small red ant. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 24. `assets/images/items/fen/kostebek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Köstebek (ünite 8, "Kim nerede yaşar?").

```
a cute mole peeking out of a molehill. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 25. `assets/images/items/fen/ordek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ördek (ünite 8, "Kim nerede yaşar?").

```
a cute duck floating on water. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 26. `assets/images/items/fen/egrelti.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Eğrelti otu (ünite 8, "Kim nerede yaşar?").

```
a green fern plant. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 27. `assets/images/items/fen/kertenkele.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kertenkele (ünite 8, "Kim nerede yaşar?").

```
a cute small green lizard on a warm stone. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 28. `assets/images/items/fen/deve.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Deve (ünite 8, "Kim nerede yaşar?").

```
a cute camel with one hump. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 29. `assets/images/items/fen/yasam_gol.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Göl (ünite 8, "Canlı çeşitliliği").

```
a small calm blue lake with reeds and lily pads. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 30. `assets/images/items/fen/yasam_orman.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Orman (ünite 8, "Canlı çeşitliliği").

```
a small shady green forest with many trees. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 31. `assets/images/items/fen/yasam_col.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çöl (ünite 8, "Canlı çeşitliliği").

```
a small sunny sandy desert with dunes and one cactus. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 32. `assets/images/items/fen/bahce_ayni.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tek çeşit çiçekli bahçe (ünite 8, "Canlı çeşitliliği").

```
a small garden bed with many identical red tulips and nothing else. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 33. `assets/images/items/fen/bahce_farkli.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çeşit çeşit canlılı bahçe (ünite 8, "Canlı çeşitliliği").

```
a small garden bed with different flowers, a bee, a butterfly, a ladybug and a snail. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 34. `assets/images/items/fen/koruma_fidan_dik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Fidan dikmek (ünite 8, "Yaşam alanlarını koruyalım").

```
children planting a young sapling and watering it. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 35. `assets/images/items/fen/koruma_cop_topla.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çöp toplamak (ünite 8, "Yaşam alanlarını koruyalım").

```
a child with gloves picking up litter in a park into a bag. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 36. `assets/images/items/fen/koruma_kus_evi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kuş evi asmak (ünite 8, "Yaşam alanlarını koruyalım").

```
a child hanging a small wooden birdhouse on a tree. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 37. `assets/images/items/fen/zarar_gole_cop.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Göle çöp atmak (ünite 8, "Yaşam alanlarını koruyalım").

```
a plastic bag and a bottle floating in a lake, a sad fish nearby. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 38. `assets/images/items/fen/zarar_piknik_atesi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ateşi söndürmeden gitmek (ünite 8, "Yaşam alanlarını koruyalım").

```
an abandoned picnic campfire still smoking in a forest clearing. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 39. `assets/images/items/fen/zarar_dal_kirma.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ağacın dalını kırmak (ünite 8, "Yaşam alanlarını koruyalım").

```
a broken branch hanging from a young tree. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```


---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Arka plan silindi, şeffaf PNG
- [ ] Görselde yazı, harf ya da rakam yok
- [ ] Stil önceki partilerle tutarlı (yan yana koyup bak)
- [ ] Commit: `assets: 092 fen görselleri 3 (ünite 7-8)`
