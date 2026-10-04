# 011 · Faz 3b: kareli zemin (grid) görselleri

**Öncelik: ORTA** (Faz 3b, yeni `grid` şablonu). Kareli zeminde ok kartlarıyla yol bulma oyununun gezgin karakteri, hedef bayrağı ve duvar taşı. `chart_build` (veri) şablonu ile tahmin modu mevcut nesne görsellerini ve kodla çizilen kil öğeleri (çetele çubukları, noktalar, birim küpler) kullanır; yeni görsel istemez.

Bu görseller gelene kadar oyun kendi çizdiği yer tutucuları kullanır (kil piyon + yön üçgeni, kil bayrak, kil blok). Dosyayı tablodaki yola koymak yeterlidir; kod değişikliği gerekmez.

- Üçü de **tam önden ya da hafif üstten**, kareyi kenardan kenara dolduracak biçimde, tek nesne olarak çizilir; oyunda yaklaşık 128–150 px kare içinde gösterilir.
- Gezgin karakterin **yönü oyunda ayrıca kodla gösterilir** (ok); karakter dümdüz önüne bakmalı, yana dönük olmamalı.
- Hepsinin arka planı silinir, şeffaf PNG kaydedilir. Oran 1:1.
- Görselde yazı, harf, rakam ya da ok işareti yok.

Stil blokları: `docs/assets/style-guide.md` → `STYLE_SPRITE` (1) ve `STYLE_ICON` (2, 3). Promptların sonunda tam metin olarak yer alıyor.


## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/characters/grid/gezgin.png` | 1:1 | Bilge karakter sayfası (stil) | Kareli zeminde yürüyen küçük gezgin: tombul kil kirpi, sırt çantalı, önden. |
| 2 | `assets/images/ui/grid/hedef.png` | 1:1 | — | Hedef: küçük kil direğe takılı üçgen bayrak, kil tümsek üzerinde. |
| 3 | `assets/images/ui/grid/duvar.png` | 1:1 | — | Engel: tombul kil taş blok (yuvarlak köşeli, hafif yosunlu). |

## Promptlar

### 1. `assets/images/characters/grid/gezgin.png`

- **Oran:** 1:1  
- **Referans görsel:** Bilge karakter sayfası (yalnızca stil tutarlılığı için)  
- **Açıklama:** Kareli zeminde yürüyen küçük gezgin: tombul kil kirpi, sırt çantalı, önden.

```
a small chubby friendly hedgehog explorer character standing upright and facing straight towards the viewer, soft rounded light brown clay spikes, cream colored round face with big shiny friendly eyes and a tiny smile, wearing a little teal clay backpack with straps, short stubby legs, tiny clay boots, cheerful and curious pose, compact body that fits inside a square. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/ui/grid/hedef.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hedef: küçük kil direğe takılı üçgen bayrak, kil tümsek üzerinde.

```
a small triangular coral red clay flag on a short rounded wooden clay pole, planted in a little round green clay grass mound, plain flag without any symbol or marking, cheerful goal marker. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/ui/grid/duvar.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Engel: tombul kil taş blok (yuvarlak köşeli, hafif yosunlu).

```
a chunky square grey clay stone block with soft rounded corners and edges, a few soft green clay moss patches on top, friendly harmless obstacle, fills most of the frame. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```



---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Arka planlar silindi, şeffaf PNG
- [ ] Görselde yazı, harf, rakam ya da ok işareti yok
- [ ] Stil önceki partilerle tutarlı (yan yana koyup bak)
- [ ] Oyunda `grid` şablonuna bakıldı: gezgin, bayrak ve taş bir karede rahat seçiliyor
- [ ] Commit: `assets: 011 grid görselleri`
