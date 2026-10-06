# 073 · 2. sınıf Türkçe hikâye ve durum görselleri

**Öncelik: ORTA** (Faz 4c). `content/g2/turkce/` ünitelerindeki hikâye (`story`, kare, kitap sayfasında solda durur) ve durum (`scenario`, 16:9, ekranın üst ortasında durur) görselleri. Görsel gelene kadar oyun yer tutucu gösterir; turlar oynanabilir.

- Sahne görselleridir: arka plan silinmez. Çocuk karakterler sevimli kil oyuncak figürleridir; gerçek kişilere ya da tanınmış karakterlere benzemez.
- Bir hikâyenin bütün sayfaları aynı görseli kullanır; görsel hikâyenin özünü göstermeli ama soruların cevabını yazıyla vermemeli.

Stil bloğu: `docs/assets/style-guide.md` → `STYLE_SCENE` + Harf Vadisi palet cümlesi (promptların sonunda tam metin olarak yer alıyor).

## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/items/hikaye/g2_semsiye.png` | 1:1 | — | Hikâye görseli (g2.turkce.u01.n01) |
| 2 | `assets/images/items/hikaye/g2_cuzdan.png` | 1:1 | — | Hikâye görseli (g2.turkce.u01.n01) |
| 3 | `assets/images/items/durum/g2_kutuphane.png` | 16:9 | — | Durum görseli (g2.turkce.u01.n02) |
| 4 | `assets/images/items/durum/g2_mudur_hediye.png` | 16:9 | — | Durum görseli (g2.turkce.u01.n02) |
| 5 | `assets/images/items/durum/g2_radyo.png` | 16:9 | — | Durum görseli (g2.turkce.u01.n02) |
| 6 | `assets/images/items/durum/g2_bebek_yatak.png` | 16:9 | — | Durum görseli (g2.turkce.u01.n02) |
| 7 | `assets/images/items/hikaye/g2_fidan.png` | 1:1 | — | Hikâye görseli (g2.turkce.u01.n03) |
| 8 | `assets/images/items/hikaye/g2_komsu.png` | 1:1 | — | Hikâye görseli (g2.turkce.u01.n03) |
| 9 | `assets/images/items/hikaye/g2_kucuk_mustafa.png` | 1:1 | — | Hikâye görseli (g2.turkce.u02.n01) |
| 10 | `assets/images/items/hikaye/g2_yirmi_uc_nisan.png` | 1:1 | — | Hikâye görseli (g2.turkce.u02.n01) |
| 11 | `assets/images/items/durum/g2_toren_siir.png` | 16:9 | — | Durum görseli (g2.turkce.u02.n02) |
| 12 | `assets/images/items/durum/g2_istiklal_marsi.png` | 16:9 | — | Durum görseli (g2.turkce.u02.n02) |
| 13 | `assets/images/items/durum/g2_ataturk_dinle.png` | 16:9 | — | Durum görseli (g2.turkce.u02.n02) |
| 14 | `assets/images/items/durum/g2_muze_rehber.png` | 16:9 | — | Durum görseli (g2.turkce.u02.n02) |
| 15 | `assets/images/items/hikaye/g2_okul_fidan.png` | 1:1 | — | Hikâye görseli (g2.turkce.u02.n03) |
| 16 | `assets/images/items/hikaye/g2_ataturk_kitabi.png` | 1:1 | — | Hikâye görseli (g2.turkce.u02.n03) |
| 17 | `assets/images/items/hikaye/g2_sincap_pitir.png` | 1:1 | — | Hikâye görseli (g2.turkce.u03.n01) |
| 18 | `assets/images/items/hikaye/g2_damla_yolculuk.png` | 1:1 | — | Hikâye görseli (g2.turkce.u03.n01) |
| 19 | `assets/images/items/durum/g2_orman_kus.png` | 16:9 | — | Durum görseli (g2.turkce.u03.n02) |
| 20 | `assets/images/items/durum/g2_mevsim_sunum.png` | 16:9 | — | Durum görseli (g2.turkce.u03.n02) |
| 21 | `assets/images/items/durum/g2_belgesel.png` | 16:9 | — | Durum görseli (g2.turkce.u03.n02) |
| 22 | `assets/images/items/durum/g2_park_cicek.png` | 16:9 | — | Durum görseli (g2.turkce.u03.n02) |
| 23 | `assets/images/items/hikaye/g2_kirlangic.png` | 1:1 | — | Hikâye görseli (g2.turkce.u03.n03) |
| 24 | `assets/images/items/hikaye/g2_dort_mevsim.png` | 1:1 | — | Hikâye görseli (g2.turkce.u03.n03) |
| 25 | `assets/images/items/hikaye/g2_kutuphane_deniz.png` | 1:1 | — | Hikâye görseli (g2.turkce.u04.n01) |
| 26 | `assets/images/items/hikaye/g2_tavsan_baykus.png` | 1:1 | — | Hikâye görseli (g2.turkce.u04.n01) |
| 27 | `assets/images/items/durum/g2_gorevli_kitap.png` | 16:9 | — | Durum görseli (g2.turkce.u04.n02) |
| 28 | `assets/images/items/durum/g2_kitap_anlat.png` | 16:9 | — | Durum görseli (g2.turkce.u04.n02) |
| 29 | `assets/images/items/durum/g2_masal_dinle.png` | 16:9 | — | Durum görseli (g2.turkce.u04.n02) |
| 30 | `assets/images/items/durum/g2_ogretmen_masal.png` | 16:9 | — | Durum görseli (g2.turkce.u04.n02) |
| 31 | `assets/images/items/hikaye/g2_kitap_kurdu.png` | 1:1 | — | Hikâye görseli (g2.turkce.u04.n03) |
| 32 | `assets/images/items/hikaye/g2_ayrac_selin.png` | 1:1 | — | Hikâye görseli (g2.turkce.u04.n03) |
| 33 | `assets/images/items/hikaye/g2_zeynep_resim.png` | 1:1 | — | Hikâye görseli (g2.turkce.u05.n01) |
| 34 | `assets/images/items/hikaye/g2_deniz_flut.png` | 1:1 | — | Hikâye görseli (g2.turkce.u05.n01) |
| 35 | `assets/images/items/durum/g2_uzgun_ressam.png` | 16:9 | — | Durum görseli (g2.turkce.u05.n02) |
| 36 | `assets/images/items/durum/g2_satranc.png` | 16:9 | — | Durum görseli (g2.turkce.u05.n02) |
| 37 | `assets/images/items/durum/g2_oyun_kurali.png` | 16:9 | — | Durum görseli (g2.turkce.u05.n02) |
| 38 | `assets/images/items/durum/g2_sarki_ogren.png` | 16:9 | — | Durum görseli (g2.turkce.u05.n02) |
| 39 | `assets/images/items/hikaye/g2_ela_ip.png` | 1:1 | — | Hikâye görseli (g2.turkce.u05.n03) |
| 40 | `assets/images/items/hikaye/g2_kil_hayvan.png` | 1:1 | — | Hikâye görseli (g2.turkce.u05.n03) |
| 41 | `assets/images/items/hikaye/g2_arda_kalemlik.png` | 1:1 | — | Hikâye görseli (g2.turkce.u06.n01) |
| 42 | `assets/images/items/hikaye/g2_duru_deney.png` | 1:1 | — | Hikâye görseli (g2.turkce.u06.n01) |
| 43 | `assets/images/items/durum/g2_bilim_senligi.png` | 16:9 | — | Durum görseli (g2.turkce.u06.n02) |
| 44 | `assets/images/items/durum/g2_oyuncak_araba.png` | 16:9 | — | Durum görseli (g2.turkce.u06.n02) |
| 45 | `assets/images/items/durum/g2_deney_masasi.png` | 16:9 | — | Durum görseli (g2.turkce.u06.n02) |
| 46 | `assets/images/items/durum/g2_ucak_merak.png` | 16:9 | — | Durum görseli (g2.turkce.u06.n02) |
| 47 | `assets/images/items/hikaye/g2_selin_sise.png` | 1:1 | — | Hikâye görseli (g2.turkce.u06.n03) |
| 48 | `assets/images/items/hikaye/g2_saat_tamiri.png` | 1:1 | — | Hikâye görseli (g2.turkce.u06.n03) |
| 49 | `assets/images/items/hikaye/g2_hoca_kazan.png` | 1:1 | — | Hikâye görseli (g2.turkce.u07.n01) |
| 50 | `assets/images/items/hikaye/g2_bayram_ziyareti.png` | 1:1 | — | Hikâye görseli (g2.turkce.u07.n01) |
| 51 | `assets/images/items/durum/g2_bayram_el_opme.png` | 16:9 | — | Durum görseli (g2.turkce.u07.n02) |
| 52 | `assets/images/items/durum/g2_misafir_kapi.png` | 16:9 | — | Durum görseli (g2.turkce.u07.n02) |
| 53 | `assets/images/items/durum/g2_masalci_dede.png` | 16:9 | — | Durum görseli (g2.turkce.u07.n02) |
| 54 | `assets/images/items/durum/g2_ebru_atolye.png` | 16:9 | — | Durum görseli (g2.turkce.u07.n02) |
| 55 | `assets/images/items/hikaye/g2_babaanne_ebru.png` | 1:1 | — | Hikâye görseli (g2.turkce.u07.n03) |
| 56 | `assets/images/items/hikaye/g2_nine_hali.png` | 1:1 | — | Hikâye görseli (g2.turkce.u07.n03) |
| 57 | `assets/images/items/hikaye/g2_dis_doktoru.png` | 1:1 | — | Hikâye görseli (g2.turkce.u08.n01) |
| 58 | `assets/images/items/hikaye/g2_teneffus.png` | 1:1 | — | Hikâye görseli (g2.turkce.u08.n01) |
| 59 | `assets/images/items/durum/g2_doktor_muayene.png` | 16:9 | — | Durum görseli (g2.turkce.u08.n02) |
| 60 | `assets/images/items/durum/g2_oyuna_katil.png` | 16:9 | — | Durum görseli (g2.turkce.u08.n02) |
| 61 | `assets/images/items/durum/g2_tatbikat.png` | 16:9 | — | Durum görseli (g2.turkce.u08.n02) |
| 62 | `assets/images/items/durum/g2_izinsiz_defter.png` | 16:9 | — | Durum görseli (g2.turkce.u08.n02) |
| 63 | `assets/images/items/hikaye/g2_adimiz.png` | 1:1 | — | Hikâye görseli (g2.turkce.u08.n03) |
| 64 | `assets/images/items/hikaye/g2_kerem_canta.png` | 1:1 | — | Hikâye görseli (g2.turkce.u08.n03) |

## Promptlar

### 1. `assets/images/items/hikaye/g2_semsiye.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u01.n01)

```
two school children, a girl and a boy, walking together under one big umbrella in light rain on the way to school. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 2. `assets/images/items/hikaye/g2_cuzdan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u01.n01)

```
a small young boy, about half the height of the guard, handing a found brown wallet to a friendly grown-up park guard in a green uniform in a green park. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. Every child in the image has small child proportions and is clearly much shorter than the grown-ups. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 3. `assets/images/items/durum/g2_kutuphane.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u01.n02)

```
a quiet school library with bookshelves and two children sitting at a reading table. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 4. `assets/images/items/durum/g2_mudur_hediye.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u01.n02)

```
a kind school principal giving a wrapped book to a smiling child in a school corridor. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 5. `assets/images/items/durum/g2_radyo.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u01.n02)

```
a child sitting next to an old style radio at home, looking curious, a window with clouds behind. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 6. `assets/images/items/durum/g2_bebek_yatak.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u01.n02)

```
a sleepy toddler in a cozy small bed with a soft blanket and a night lamp. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 7. `assets/images/items/hikaye/g2_fidan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u01.n03)

```
a grandfather and a child planting a small tree sapling in a garden, the child holding a watering can. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 8. `assets/images/items/hikaye/g2_komsu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u01.n03)

```
a young mother and her small child both carrying shopping bags up the stairs of an apartment building, helping an elderly grey-haired neighbor woman who walks beside them with empty hands. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. Every child in the image has small child proportions and is clearly much shorter than the grown-ups. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 9. `assets/images/items/hikaye/g2_kucuk_mustafa.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u02.n01)

```
a neat schoolboy from long ago with a satchel, standing proudly at a wooden school desk in an old classroom with a blackboard. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 10. `assets/images/items/hikaye/g2_yirmi_uc_nisan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u02.n01)

```
happy children in white festive clothes holding small red flags, dancing in a sunny decorated schoolyard. Any flag shown is the Turkish flag: red with a white crescent and a white five-pointed star. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 11. `assets/images/items/durum/g2_toren_siir.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u02.n02)

```
a child standing on a small decorated school stage reciting a poem, other children sitting and listening. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 12. `assets/images/items/durum/g2_istiklal_marsi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u02.n02)

```
school children standing still and respectful in a row in a schoolyard, a flag on a tall pole in the background. Any flag shown is the Turkish flag: red with a white crescent and a white five-pointed star. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 13. `assets/images/items/durum/g2_ataturk_dinle.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u02.n02)

```
a curious child sitting on a cozy sofa listening with headphones, a small stack of history books beside. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 14. `assets/images/items/durum/g2_muze_rehber.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u02.n02)

```
a friendly museum guide talking to a small group of school children in a bright museum hall with glass display cases. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 15. `assets/images/items/hikaye/g2_okul_fidan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u02.n03)

```
a teacher and several school children planting small tree saplings in a sunny schoolyard. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 16. `assets/images/items/hikaye/g2_ataturk_kitabi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u02.n03)

```
a boy sitting at a library table reading a big illustrated book, sunlight from a window, shelves of books behind. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 17. `assets/images/items/hikaye/g2_sincap_pitir.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u03.n01)

```
a little squirrel collecting hazelnuts under a tree with yellow and orange autumn leaves falling. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 18. `assets/images/items/hikaye/g2_damla_yolculuk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u03.n01)

```
a calm blue lake under a big round bright yellow sun in the sky, soft white clouds above and gentle rain falling from one grey cloud onto a far green hill. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 19. `assets/images/items/durum/g2_orman_kus.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u03.n02)

```
two children standing quietly on a forest path looking up at small birds on tree branches. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 20. `assets/images/items/durum/g2_mevsim_sunum.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u03.n02)

```
a child standing in front of a classroom pointing to a poster with four small trees in a row: the first with pink spring blossoms, the second green with red apples, the third with orange autumn leaves, the fourth bare and covered with white snow. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 21. `assets/images/items/durum/g2_belgesel.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u03.n02)

```
a child sitting on a carpet watching a nature program on a television showing a bear in a snowy forest. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 22. `assets/images/items/durum/g2_park_cicek.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u03.n02)

```
a colorful flower bed in a green park with exactly TWO children, one boy and one girl, standing beside it. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 23. `assets/images/items/hikaye/g2_kirlangic.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u03.n03)

```
a flock of swallows with dark navy blue backs, white bellies and long forked tails flying across a wide blue sky over green hills. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 24. `assets/images/items/hikaye/g2_dort_mevsim.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u03.n03)

```
one apple tree shown four times side by side: with pink blossoms, with red apples, with orange leaves, and covered with snow. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 25. `assets/images/items/hikaye/g2_kutuphane_deniz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u04.n01)

```
a friendly librarian handing a picture book about animals to a smiling girl in a bright library. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 26. `assets/images/items/hikaye/g2_tavsan_baykus.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u04.n01)

```
a little rabbit and a wise old owl on a tree branch in a friendly sunlit forest. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 27. `assets/images/items/durum/g2_gorevli_kitap.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u04.n02)

```
a child standing at a library desk talking to a kind librarian, shelves of books behind. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 28. `assets/images/items/durum/g2_kitap_anlat.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u04.n02)

```
a child standing at the front of a classroom holding up a closed picture book with a bright colorful cover showing a cat, seated classmates listening. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 29. `assets/images/items/durum/g2_masal_dinle.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u04.n02)

```
a small young child sitting on a cushion listening to a grey-haired grandmother who sits beside the child and tells a story from a big old open book. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. Every child in the image has small child proportions and is clearly much shorter than the grown-ups. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 30. `assets/images/items/durum/g2_ogretmen_masal.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u04.n02)

```
a teacher reading a picture book aloud to children sitting in a circle on a classroom carpet. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 31. `assets/images/items/hikaye/g2_kitap_kurdu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u04.n03)

```
a boy reading a book in bed under a warm lamp light in a cozy bedroom at night. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 32. `assets/images/items/hikaye/g2_ayrac_selin.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u04.n03)

```
a girl placing a colorful bookmark between the pages of a book at a tidy desk. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 33. `assets/images/items/hikaye/g2_zeynep_resim.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u05.n01)

```
a smiling small girl proudly showing her colorful bird painting pinned on a school exhibition board to her mother and father, who are grown-ups much taller than her. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. Every child in the image has small child proportions and is clearly much shorter than the grown-ups. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 34. `assets/images/items/hikaye/g2_deniz_flut.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u05.n01)

```
a boy playing a recorder flute on a small school stage while classmates and parents clap happily. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 35. `assets/images/items/durum/g2_uzgun_ressam.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u05.n02)

```
a sad girl holding her painting in a classroom while a friend comes to comfort her. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 36. `assets/images/items/durum/g2_satranc.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u05.n02)

```
two children sitting at a table with a chess board between them, one child pointing at a chess piece. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 37. `assets/images/items/durum/g2_oyun_kurali.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u05.n02)

```
a friendly sports teacher explaining a game to a group of children standing in a circle in a school gym. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 38. `assets/images/items/durum/g2_sarki_ogren.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u05.n02)

```
a child sitting on a carpet at home listening carefully to music from a small speaker, music notes floating in the air. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 39. `assets/images/items/hikaye/g2_ela_ip.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u05.n03)

```
a cheerful girl jumping rope in a sunny schoolyard while two friends turn the rope. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 40. `assets/images/items/hikaye/g2_kil_hayvan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u05.n03)

```
a boy and his little sister looking at exactly THREE small clay animal figurines standing on a wooden shelf: one cat, one dog and one turtle. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 41. `assets/images/items/hikaye/g2_arda_kalemlik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u06.n01)

```
a boy at his desk putting colored pencils into a handmade pencil holder made from a box covered with colorful paper. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 42. `assets/images/items/hikaye/g2_duru_deney.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u06.n01)

```
a curious girl looking into a clear bowl of water where a cork and a leaf float and a small stone lies at the bottom. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 43. `assets/images/items/durum/g2_bilim_senligi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u06.n02)

```
a child standing next to a table with a small handmade invention, presenting it to classmates at a school science fair. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 44. `assets/images/items/durum/g2_oyuncak_araba.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u06.n02)

```
a child showing a handmade toy car built from a box and bottle caps to a smiling friend. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 45. `assets/images/items/durum/g2_deney_masasi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u06.n02)

```
a grown-up teacher standing behind a classroom table showing simple experiment materials, cups of water and a magnifying glass, to three small children who watch from the other side of the table. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. Every child in the image has small child proportions and is clearly much shorter than the grown-ups. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 46. `assets/images/items/durum/g2_ucak_merak.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u06.n02)

```
a child looking out of a window at an airplane flying in a blue sky, a toy airplane on the window sill. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 47. `assets/images/items/hikaye/g2_selin_sise.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u06.n03)

```
a girl at a windowsill next to a flower pot with a blooming red flower; a plastic water bottle stands upside down with its neck pushed into the soil of the pot, slowly watering the flower. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 48. `assets/images/items/hikaye/g2_saat_tamiri.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u06.n03)

```
a grey-haired grandfather and his small young grandson with brown hair repairing an opened old wall clock with tiny gears on a wooden table, the clock face has only tick marks and no numbers. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. Every child in the image has small child proportions and is clearly much shorter than the grown-ups. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 49. `assets/images/items/hikaye/g2_hoca_kazan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u07.n01)

```
Nasreddin Hoca with a white turban and long white beard handing a big wide copper cauldron to a surprised neighbor at a village door, a tiny copper pot sits inside the big cauldron. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 50. `assets/images/items/hikaye/g2_bayram_ziyareti.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u07.n01)

```
a small girl in a new festive dress bending to kiss the back of her seated grandfather's hand in the traditional Turkish holiday greeting, in a cozy living room, a bowl of candies on the table. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. Every child in the image has small child proportions and is clearly much shorter than the grown-ups. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 51. `assets/images/items/durum/g2_bayram_el_opme.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u07.n02)

```
a smiling small young boy with brown hair greeting his grey-haired grandmother during a holiday visit in a warm living room. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. Every child in the image has small child proportions and is clearly much shorter than the grown-ups. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 52. `assets/images/items/durum/g2_misafir_kapi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u07.n02)

```
a child opening the front door of a home to a smiling guest family holding a box of sweets. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 53. `assets/images/items/durum/g2_masalci_dede.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u07.n02)

```
a kind storyteller grandfather sitting on a cushion and telling a tale to children gathered around him. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 54. `assets/images/items/durum/g2_ebru_atolye.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u07.n02)

```
a marbling art master sprinkling colorful paint drops onto a tray of water while children watch closely. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 55. `assets/images/items/hikaye/g2_babaanne_ebru.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u07.n03)

```
a grey-haired grandmother and her small young granddaughter with brown hair lifting a sheet of paper with colorful marbled swirl patterns from a tray of water. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. Every child in the image has small child proportions and is clearly much shorter than the grown-ups. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 56. `assets/images/items/hikaye/g2_nine_hali.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u07.n03)

```
a grandmother weaving a colorful carpet on a wooden loom with red, blue and yellow yarns, a child watching beside her. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 57. `assets/images/items/hikaye/g2_dis_doktoru.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u08.n01)

```
a friendly dentist in a white coat showing a smiling small girl how to brush teeth on a big toy tooth model in a bright clinic, the girl's mother standing beside her. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. Every child in the image has small child proportions and is clearly much shorter than the grown-ups. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 58. `assets/images/items/hikaye/g2_teneffus.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u08.n01)

```
happy children jumping rope and playing hide and seek in a sunny schoolyard during break time. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 59. `assets/images/items/durum/g2_doktor_muayene.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u08.n02)

```
a kind doctor kindly talking to a child sitting on an examination bed in a bright clinic. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 60. `assets/images/items/durum/g2_oyuna_katil.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u08.n02)

```
a child walking up to a group of friends playing ball in a schoolyard and smiling at them. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 61. `assets/images/items/durum/g2_tatbikat.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u08.n02)

```
a calm teacher explaining a safety drill to children lined up in a school corridor, a green exit sign shape without letters. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 62. `assets/images/items/durum/g2_izinsiz_defter.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g2.turkce.u08.n02)

```
a small little brother holding his older sister's drawing notebook with a plain cover, the taller older sister kneeling beside him and gently talking to him in a cozy room. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 63. `assets/images/items/hikaye/g2_adimiz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u08.n03)

```
a group of smiling children of different looks waving and greeting each other in a classroom. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 64. `assets/images/items/hikaye/g2_kerem_canta.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g2.turkce.u08.n03)

```
a boy neatly packing books and notebooks into his school bag at his tidy desk in the evening. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```


---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Sahne görsellerinde arka plan silinmez (şeffaflık yok)
- [ ] Görselde yazı, harf ya da rakam yok
- [ ] Stil önceki partilerle tutarlı (yan yana koyup bak)
- [ ] Commit: `assets: 073 g2 türkçe görseller`
