# Görsel Stil Rehberi — 3D Kil / Oyuncak

Bu rehber, Nano Banana (Gemini) ile üretilen tüm görsellerin aynı elden çıkmış gibi görünmesi için hazırlandı. **Her prompt, aşağıdaki sabit bloklardan biriyle başlar.** Bloklar İngilizcedir, çünkü görsel modeller İngilizce stil terimlerine en tutarlı yanıtı verir. Açıklamalar Türkçedir.

## 1. Temel kurallar

1. **Metin yok.** Görsellerde harf, rakam, yazı, logo ya da filigran istenmez. Harf ve rakamları oyun kendisi çizer.
2. **Tek nesne, düz arka plan.** Sprite'lar (karakter, eşya, ikon) tek başına, ortalanmış, düz ve tek renkli açık bir arka plan üzerinde üretilir. Sahip arka planı siler ve şeffaf PNG kaydeder.
3. **Referans görsel.** Bilge ve diğer tekrar eden karakterler için `assets/images/characters/<karakter>/sheet.png` karakter sayfası her promptta referans görsel olarak eklenir.
4. **En-boy oranı** her istek dosyasında belirtilir. Önerilen değerler: sprite 1:1, arka plan 16:9, dikey kart 3:4.
5. **Çözünürlük:** sprite'lar en az 1024 px. Oyuna girmeden önce sprite'ların uzun kenarı 1024 px'e, arka planlarınki 2048 px'e küçültülebilir.
6. **Küçük partiler.** Önce 2–3 görsel üretilir, stil kontrol edilir, ardından devam edilir.

## 2. Sabit stil blokları

### 2.1 `STYLE_SPRITE` — tek karakter, eşya ve ikonlar için
```
3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes,
subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting,
gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly
design, big expressive eyes where applicable, single subject centered and fully
visible, isolated on a plain solid light grey background (#EEEEEE), no ground
shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 2.2 `STYLE_SCENE` — arka planlar ve sahneler için
```
3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature
feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle
shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly,
clean uncluttered composition with open empty space in the center for game elements,
no characters unless described, no text, no letters, no numbers, no watermark.
```

### 2.3 `STYLE_ICON` — küçük arayüz ikonları ve çıkartmalar için
```
3D claymation style icon, plasticine toy look, very simple bold silhouette readable
at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated
candy colors, single object centered, isolated on a plain solid light grey background
(#EEEEEE), no text, no letters, no numbers, no watermark.
```

## 3. Bölge paletleri
Sahne promptlarına aşağıdaki renk cümlesi eklenir:

| Bölge | Palet cümlesi |
|---|---|
| Sayı Ormanı | `dominant palette: leafy greens, warm orange and honey yellow accents` |
| Harf Vadisi | `dominant palette: soft lavender purple, bubblegum pink and cream accents` |
| Hayat Kasabası | `dominant palette: sunny yellow, sky blue and brick red accents` |
| Keşif Laboratuvarı | `dominant palette: turquoise, mint and clean white with small coral accents` |
| Ağaç Evi | `dominant palette: warm wood browns, cozy orange light, soft green leaves` |

## 4. Karakterler

### Bilge (maskot)
- Kil görünümlü, yuvarlak ve tombul **küçük bir baykuş**.
- Turuncu-bal rengi tüyler, krem rengi göğüs.
- Kocaman yeşil gözler, küçük turuncu gaga.
- Başında küçük mor bir **mezuniyet kepi**, boynunda kırmızı **fular**.
- Karakter tanım cümlesi (her Bilge promptuna eklenir):
```
Bilge: a small chubby round baby owl made of clay, honey-orange feathers, cream belly,
huge friendly green eyes, tiny orange beak, small purple graduation cap tilted on the
head, red scarf around the neck, short stubby wings, tiny orange feet.
```

### Avatarlar (çocuk profilleri)
Altı hayvan kullanılır: tavşan, kedi, ayı yavrusu, tilki, penguen, kaplumbağa. Hepsi aynı kil stilinde, yalnızca baş ve omuzlardan oluşan portre olarak üretilir.

## 5. Kaçınılacaklar
- Fotogerçekçilik, sert kontrast, karanlık sahneler, korkutucu ifadeler.
- Silah, şiddet, marka logoları.
- Aşırı detaylı ve kalabalık arka planlar (oyun öğeleri okunmaz hale gelir).
- Gerçek kişiler ya da tanınmış çizgi film karakterlerine benzerlik.
