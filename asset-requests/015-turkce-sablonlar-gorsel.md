# 015 · Faz 4a Türkçe şablonları: iz kalemi, sayfa oku ve kitap ikonu

**Öncelik: ORTA** (Faz 4a, yeni mini oyun şablonları). `trace` (iz sür) şablonunun yön ipucunda vuruşu çizen kalem ve `story` (hikâye) şablonunun iki düğme ikonu. Harf izleme kılavuzları (dört çizgi, soluk iz yolu, numaralı başlangıç noktası, yön oku) ve hece karoları **kodla** çizilir; görsel istemez. Hikâye sahnelerinin resimleri her hikâyenin kendi ünite partisinde istenecek (`item.*` anahtarlarıyla); bu parti yalnızca şablon düzeyindeki ortak görselleri içerir.

Bu görseller gelene kadar oyun kendi çizdiği yer tutucuları kullanır (sarı kil top, kalın ok, açık kitap). Dosyayı tablodaki yola koymak yeterlidir; kod değişikliği gerekmez.

- **Görsellerde asla harf, rakam ya da yazı yok.** Kitabın sayfaları boş ya da yalnızca soyut dalgalı çizgili olmalı.
- Üçünün de arka planı silinir, şeffaf PNG kaydedilir. Düğmelerde yaklaşık 120 px, kalem izleme tahtasında yaklaşık 90 px gösterilir: sade ve kalın siluetli olmalı.
- Kalemin **ucu görselin sol alt köşesine** yakın durmalı: oyun kalemi, ucu iz yolunun üstüne gelecek şekilde yerleştirir.

Stil bloğu: `docs/assets/style-guide.md` → `STYLE_ICON`. Promptların sonunda tam metin olarak yer alıyor.


## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/ui/trace_pencil.png` | 1:1 | — | İz ipucunda vuruşu çizen tombul kil kurşun kalem; ucu sol altta. |
| 2 | `assets/images/ui/page_next.png` | 1:1 | — | Hikâyede "sonraki sayfa" düğmesi: sağa bakan kalın kil ok. |
| 3 | `assets/images/ui/book.png` | 1:1 | — | Sorudan hikâyeye dönme düğmesi: açık, sayfaları boş kil kitap. |

## Promptlar

### 1. `assets/images/ui/trace_pencil.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** İz ipucunda vuruşu çizen tombul kil kurşun kalem; ucu sol altta.

```
a short chunky friendly pencil made of clay, tilted diagonally with its sharpened tip pointing to the bottom-left corner of the frame and the eraser end at the top-right, sunny yellow hexagonal body, a light wooden cone and a small dark graphite tip, a pink eraser with a silver band, a tiny happy face with simple dot eyes on the body, no writing on the pencil. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/ui/page_next.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâyede "sonraki sayfa" düğmesi: sağa bakan kalın kil ok.

```
a thick rounded arrow pointing to the right made of soft cocoa-brown clay, short chunky shaft and a big rounded triangular head, gently puffy like a pillow, perfectly horizontal, seen straight from the front. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/ui/book.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sorudan hikâyeye dönme düğmesi: açık, sayfaları boş kil kitap.

```
an open picture book lying flat and seen slightly from above and the front, a teal clay cover, two cream clay pages gently curved, the pages completely blank or with only a few soft abstract wavy grey lines, a small red ribbon bookmark hanging from the middle, no writing, no pictures on the pages. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```


---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Arka plan silindi, şeffaf PNG
- [ ] Görselde yazı, harf ya da rakam yok; kitabın sayfaları boş
- [ ] Kalemin ucu sol altta
- [ ] Oyunda kontrol: `trace` ipucunda kalem iz yolunun üstünde ilerliyor; `story` ekranında ok ve kitap düğmeleri okunaklı
- [ ] Commit: `assets: 015 türkçe şablonları ikonları`
