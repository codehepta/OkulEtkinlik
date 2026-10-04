# 009 · Oturum sonu: gece zemini ve "büyüğünü çağır" ikonu

**Öncelik: ORTA** (Faz 1, arayüz düzeltme turu). Günlük süre dolduğunda açılan oturum sonu ekranı (`scenes/ui/session_end.gd`) için sakin bir gece arka planı ve çocuğu bir yetişkine yönlendiren düğmenin ikonu.

Bu görseller gelene kadar oyun kendi çizdiği yer tutucuyu kullanır: gece gradyanı + ay + yıldızlar + tepeler ve el ele iki basit figür. Dosyayı tablodaki yola koymak yeterlidir; kod değişikliği gerekmez.

- `ui.bg_night` bir **arka plandır**: arka planı silinmez, şeffaflık yoktur. Ortada büyük uykulu Bilge ve sağda bir düğme duracağı için orta alan sade bırakılır. Yanıp sönen ya da parlak ışıklar istenmez; sakin, uykuya hazırlayan bir sahne.
- `ui.call_grownup` bir **ikondur**: arka planı silinir, şeffaf PNG kaydedilir. Düğmede yaklaşık 150 px gösterilir; sade ve kalın siluetli olmalı.

Stil blokları: `docs/assets/style-guide.md` → `STYLE_SCENE` (1) ve `STYLE_ICON` (2). Promptların sonunda tam metin olarak yer alıyor.


## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/ui/bg_night.png` | 16:9 | — | Oturum sonu arka planı: sakin gece, ay, yıldızlar, yumuşak kil tepeler; ortası boş. |
| 2 | `assets/images/ui/call_grownup.png` | 1:1 | — | "Bir büyüğünü çağır" ikonu: el ele tutuşan bir yetişkin ve küçük bir çocuk figürü. |

## Promptlar

### 1. `assets/images/ui/bg_night.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Oturum sonu arka planı: sakin gece, ay, yıldızlar, yumuşak kil tepeler; ortası boş.

```
A calm, cozy bedtime night sky over soft rolling clay hills, a big round friendly pale yellow clay moon in the upper right corner with a gentle soft glow, a few small chunky clay stars scattered across the upper sky, low rounded dark-blue clay hills along the bottom edge with two or three tiny sleeping clay houses with warm softly lit windows far away, smooth deep indigo to soft lavender gradient sky, peaceful sleepy mood, no bright flashes, the center of the image left calm and empty. dominant palette: deep indigo blue, soft lavender purple and warm pale moon-yellow accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/ui/call_grownup.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** "Bir büyüğünü çağır" ikonu: el ele tutuşan bir yetişkin ve küçük bir çocuk figürü.

```
two simple rounded clay figures holding hands side by side: a tall grown-up figure in a soft blue clay outfit and a small child figure in a coral orange clay outfit, both with plain round peach heads and gentle smiling faces, the child looking up at the grown-up, friendly and reassuring. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```



---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] `call_grownup.png`: arka plan silindi, şeffaf PNG; `bg_night.png`: arka plan silinmedi, şeffaflık yok
- [ ] Görselde yazı, harf ya da rakam yok
- [ ] Stil önceki partilerle tutarlı (yan yana koyup bak)
- [ ] Oyunda oturum sonu ekranına bakıldı: Bilge ve düğme zeminde rahat okunuyor
- [ ] Commit: `assets: 009 oturum sonu gece zemini ve büyüğünü çağır ikonu`
