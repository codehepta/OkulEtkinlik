# 074 · 3. sınıf Türkçe hikâye ve durum görselleri

**Öncelik: ORTA** (Faz 4c). `content/g3/turkce/` ünitelerindeki hikâye (`story`, kare, kitap sayfasında solda durur) ve durum (`scenario`, 16:9, ekranın üst ortasında durur) görselleri. Görsel gelene kadar oyun yer tutucu gösterir; turlar oynanabilir.

- Sahne görselleridir: arka plan silinmez. Çocuk karakterler sevimli kil oyuncak figürleridir; gerçek kişilere ya da tanınmış karakterlere benzemez.
- Bir hikâyenin bütün sayfaları aynı görseli kullanır; görsel hikâyenin özünü göstermeli ama soruların cevabını yazıyla vermemeli.

Stil bloğu: `docs/assets/style-guide.md` → `STYLE_SCENE` + Harf Vadisi palet cümlesi (promptların sonunda tam metin olarak yer alıyor).

## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/items/hikaye/g3_kalem_kutusu.png` | 1:1 | — | Hikâye görseli (g3.turkce.u01.n01) |
| 2 | `assets/images/items/hikaye/g3_kirik_vazo.png` | 1:1 | — | Hikâye görseli (g3.turkce.u01.n01) |
| 3 | `assets/images/items/durum/g3_otobus_yer.png` | 16:9 | — | Durum görseli (g3.turkce.u01.n02) |
| 4 | `assets/images/items/durum/g3_dusen_arkadas.png` | 16:9 | — | Durum görseli (g3.turkce.u01.n02) |
| 5 | `assets/images/items/durum/g3_gezi_kurallari.png` | 16:9 | — | Durum görseli (g3.turkce.u01.n02) |
| 6 | `assets/images/items/durum/g3_itfaiyeci.png` | 16:9 | — | Durum görseli (g3.turkce.u01.n02) |
| 7 | `assets/images/items/hikaye/g3_kumbara.png` | 1:1 | — | Hikâye görseli (g3.turkce.u01.n03) |
| 8 | `assets/images/items/hikaye/g3_tek_top.png` | 1:1 | — | Hikâye görseli (g3.turkce.u01.n04) |
| 9 | `assets/images/items/hikaye/g3_dede_bahce.png` | 1:1 | — | Hikâye görseli (g3.turkce.u01.n04) |
| 10 | `assets/images/items/hikaye/g3_mustafa_okul.png` | 1:1 | — | Hikâye görseli (g3.turkce.u02.n01) |
| 11 | `assets/images/items/hikaye/g3_fidan_dikimi.png` | 1:1 | — | Hikâye görseli (g3.turkce.u02.n01) |
| 12 | `assets/images/items/durum/g3_toren_siir.png` | 16:9 | — | Durum görseli (g3.turkce.u02.n02) |
| 13 | `assets/images/items/durum/g3_istiklal_marsi.png` | 16:9 | — | Durum görseli (g3.turkce.u02.n02) |
| 14 | `assets/images/items/durum/g3_ataturk_belgesel.png` | 16:9 | — | Durum görseli (g3.turkce.u02.n02) |
| 15 | `assets/images/items/durum/g3_muze_rehber.png` | 16:9 | — | Durum görseli (g3.turkce.u02.n02) |
| 16 | `assets/images/items/hikaye/g3_seyit_onbasi.png` | 1:1 | — | Hikâye görseli (g3.turkce.u02.n03) |
| 17 | `assets/images/items/hikaye/g3_23_nisan_hazirlik.png` | 1:1 | — | Hikâye görseli (g3.turkce.u02.n04) |
| 18 | `assets/images/items/hikaye/g3_babaanne_album.png` | 1:1 | — | Hikâye görseli (g3.turkce.u02.n04) |
| 19 | `assets/images/items/hikaye/g3_sincap_findik.png` | 1:1 | — | Hikâye görseli (g3.turkce.u03.n01) |
| 20 | `assets/images/items/hikaye/g3_damla_yolculuk.png` | 1:1 | — | Hikâye görseli (g3.turkce.u03.n01) |
| 21 | `assets/images/items/durum/g3_piknik_cop.png` | 16:9 | — | Durum görseli (g3.turkce.u03.n02) |
| 22 | `assets/images/items/durum/g3_ari_belgesel.png` | 16:9 | — | Durum görseli (g3.turkce.u03.n02) |
| 23 | `assets/images/items/durum/g3_kus_sesi.png` | 16:9 | — | Durum görseli (g3.turkce.u03.n02) |
| 24 | `assets/images/items/durum/g3_soz_kesme.png` | 16:9 | — | Durum görseli (g3.turkce.u03.n02) |
| 25 | `assets/images/items/hikaye/g3_ari_cicek.png` | 1:1 | — | Hikâye görseli (g3.turkce.u03.n03) |
| 26 | `assets/images/items/hikaye/g3_kar_bahce.png` | 1:1 | — | Hikâye görseli (g3.turkce.u03.n04) |
| 27 | `assets/images/items/hikaye/g3_yaz_sahil.png` | 1:1 | — | Hikâye görseli (g3.turkce.u03.n04) |
| 28 | `assets/images/items/hikaye/g3_sozluk_ela.png` | 1:1 | — | Hikâye görseli (g3.turkce.u04.n01) |
| 29 | `assets/images/items/hikaye/g3_ahtapot.png` | 1:1 | — | Hikâye görseli (g3.turkce.u04.n01) |
| 30 | `assets/images/items/durum/g3_kutuphane_gorevli.png` | 16:9 | — | Durum görseli (g3.turkce.u04.n02) |
| 31 | `assets/images/items/durum/g3_gezegenler.png` | 16:9 | — | Durum görseli (g3.turkce.u04.n02) |
| 32 | `assets/images/items/durum/g3_dinozor_ders.png` | 16:9 | — | Durum görseli (g3.turkce.u04.n02) |
| 33 | `assets/images/items/durum/g3_penguen_tartisma.png` | 16:9 | — | Durum görseli (g3.turkce.u04.n02) |
| 34 | `assets/images/items/hikaye/g3_sozluk_sira.png` | 1:1 | — | Hikâye görseli (g3.turkce.u04.n03) |
| 35 | `assets/images/items/hikaye/g3_kutuphane_secim.png` | 1:1 | — | Hikâye görseli (g3.turkce.u04.n04) |
| 36 | `assets/images/items/hikaye/g3_penguen_ansiklopedi.png` | 1:1 | — | Hikâye görseli (g3.turkce.u04.n04) |
| 37 | `assets/images/items/hikaye/g3_resim_sergisi.png` | 1:1 | — | Hikâye görseli (g3.turkce.u05.n01) |
| 38 | `assets/images/items/hikaye/g3_flut_konseri.png` | 1:1 | — | Hikâye görseli (g3.turkce.u05.n01) |
| 39 | `assets/images/items/durum/g3_yetenek_sunumu.png` | 16:9 | — | Durum görseli (g3.turkce.u05.n02) |
| 40 | `assets/images/items/durum/g3_origami_ders.png` | 16:9 | — | Durum görseli (g3.turkce.u05.n02) |
| 41 | `assets/images/items/durum/g3_konser_duyuru.png` | 16:9 | — | Durum görseli (g3.turkce.u05.n02) |
| 42 | `assets/images/items/durum/g3_uzgun_ressam.png` | 16:9 | — | Durum görseli (g3.turkce.u05.n02) |
| 43 | `assets/images/items/hikaye/g3_farkli_yetenekler.png` | 1:1 | — | Hikâye görseli (g3.turkce.u05.n03) |
| 44 | `assets/images/items/hikaye/g3_kukla_gosterisi.png` | 1:1 | — | Hikâye görseli (g3.turkce.u05.n03) |
| 45 | `assets/images/items/hikaye/g3_basketbol.png` | 1:1 | — | Hikâye görseli (g3.turkce.u05.n04) |
| 46 | `assets/images/items/hikaye/g3_dede_baglama.png` | 1:1 | — | Hikâye görseli (g3.turkce.u05.n04) |
| 47 | `assets/images/items/hikaye/g3_yuzen_batan.png` | 1:1 | — | Hikâye görseli (g3.turkce.u06.n01) |
| 48 | `assets/images/items/hikaye/g3_karinca_gozlem.png` | 1:1 | — | Hikâye görseli (g3.turkce.u06.n01) |
| 49 | `assets/images/items/durum/g3_bilim_senligi.png` | 16:9 | — | Durum görseli (g3.turkce.u06.n02) |
| 50 | `assets/images/items/durum/g3_muze_hazirlik.png` | 16:9 | — | Durum görseli (g3.turkce.u06.n02) |
| 51 | `assets/images/items/durum/g3_belgesel.png` | 16:9 | — | Durum görseli (g3.turkce.u06.n02) |
| 52 | `assets/images/items/durum/g3_deney_adimlari.png` | 16:9 | — | Durum görseli (g3.turkce.u06.n02) |
| 53 | `assets/images/items/hikaye/g3_gokkusagi.png` | 1:1 | — | Hikâye görseli (g3.turkce.u06.n03) |
| 54 | `assets/images/items/hikaye/g3_senlik_hazirlik.png` | 1:1 | — | Hikâye görseli (g3.turkce.u06.n04) |
| 55 | `assets/images/items/hikaye/g3_ay_gozlemi.png` | 1:1 | — | Hikâye görseli (g3.turkce.u06.n04) |
| 56 | `assets/images/items/hikaye/g3_bayram_ziyareti.png` | 1:1 | — | Hikâye görseli (g3.turkce.u07.n01) |
| 57 | `assets/images/items/hikaye/g3_hali_tezgahi.png` | 1:1 | — | Hikâye görseli (g3.turkce.u07.n01) |
| 58 | `assets/images/items/durum/g3_misafir_kapi.png` | 16:9 | — | Durum görseli (g3.turkce.u07.n02) |
| 59 | `assets/images/items/durum/g3_bayram_telefonu.png` | 16:9 | — | Durum görseli (g3.turkce.u07.n02) |
| 60 | `assets/images/items/durum/g3_fikra_saati.png` | 16:9 | — | Durum görseli (g3.turkce.u07.n02) |
| 61 | `assets/images/items/durum/g3_ebru_atolyesi.png` | 16:9 | — | Durum görseli (g3.turkce.u07.n02) |
| 62 | `assets/images/items/hikaye/g3_ye_kurkum.png` | 1:1 | — | Hikâye görseli (g3.turkce.u07.n03) |
| 63 | `assets/images/items/hikaye/g3_lokum_ikrami.png` | 1:1 | — | Hikâye görseli (g3.turkce.u07.n04) |
| 64 | `assets/images/items/hikaye/g3_ebru_teknesi.png` | 1:1 | — | Hikâye görseli (g3.turkce.u07.n04) |
| 65 | `assets/images/items/hikaye/g3_oyun_hakki.png` | 1:1 | — | Hikâye görseli (g3.turkce.u08.n01) |
| 66 | `assets/images/items/hikaye/g3_doktor_muayene.png` | 1:1 | — | Hikâye görseli (g3.turkce.u08.n01) |
| 67 | `assets/images/items/durum/g3_baskan_secimi.png` | 16:9 | — | Durum görseli (g3.turkce.u08.n02) |
| 68 | `assets/images/items/durum/g3_itfaiyeci_konuk.png` | 16:9 | — | Durum görseli (g3.turkce.u08.n02) |
| 69 | `assets/images/items/durum/g3_cocuk_haklari.png` | 16:9 | — | Durum görseli (g3.turkce.u08.n02) |
| 70 | `assets/images/items/hikaye/g3_okul_bahcesi.png` | 1:1 | — | Hikâye görseli (g3.turkce.u08.n03) |
| 71 | `assets/images/items/hikaye/g3_ev_gorevleri.png` | 1:1 | — | Hikâye görseli (g3.turkce.u08.n03) |
| 72 | `assets/images/items/hikaye/g3_fidan_onerisi.png` | 1:1 | — | Hikâye görseli (g3.turkce.u08.n04) |
| 73 | `assets/images/items/hikaye/g3_kutuphane_kitap.png` | 1:1 | — | Hikâye görseli (g3.turkce.u08.n04) |

## Promptlar

### 1. `assets/images/items/hikaye/g3_kalem_kutusu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u01.n01)

```
a girl in a classroom sharing colored pencils from her pencil case with a sad looking new boy at the next desk. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 2. `assets/images/items/hikaye/g3_kirik_vazo.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u01.n01)

```
a boy standing next to a broken flower vase on the living room floor, his mother kneeling and talking to him kindly. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 3. `assets/images/items/durum/g3_otobus_yer.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u01.n02)

```
inside a city bus, a seated child looking up at an elderly woman holding a handrail. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 4. `assets/images/items/durum/g3_dusen_arkadas.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u01.n02)

```
a schoolyard, a child sitting on the ground holding a knee while a friend leans down to help. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 5. `assets/images/items/durum/g3_gezi_kurallari.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u01.n02)

```
a teacher talking in front of the class while a child writes in a small notebook at the desk. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 6. `assets/images/items/durum/g3_itfaiyeci.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u01.n02)

```
a friendly firefighter in uniform visiting a classroom, children sitting and raising hands. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 7. `assets/images/items/hikaye/g3_kumbara.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u01.n03)

```
a girl giving a piggy bank full of coins to her grandmother at a table where warm winter clothes are folded for a donation box. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 8. `assets/images/items/hikaye/g3_tek_top.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u01.n04)

```
two children in a schoolyard both reaching for one red ball, looking at each other thoughtfully. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 9. `assets/images/items/hikaye/g3_dede_bahce.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u01.n04)

```
a grandfather and a granddaughter in a garden next to a cherry tree, a basket on the ground. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 10. `assets/images/items/hikaye/g3_mustafa_okul.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u02.n01)

```
an old fashioned classroom from the early nineteen hundreds, a teacher with a kind face smiling at a bright young boy standing at the blackboard. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 11. `assets/images/items/hikaye/g3_fidan_dikimi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u02.n01)

```
a group of school children with their teacher planting small tree saplings in a schoolyard, holding small shovels and a watering can. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 12. `assets/images/items/durum/g3_toren_siir.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u02.n02)

```
a child standing on a small school stage in front of classmates and parents, decorated with red and white ribbons. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 13. `assets/images/items/durum/g3_istiklal_marsi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u02.n02)

```
children standing in a straight line in a schoolyard facing a flag pole with a red flag, standing still respectfully. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 14. `assets/images/items/durum/g3_ataturk_belgesel.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u02.n02)

```
a family sitting on a sofa watching television together in a cozy living room, warm light. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 15. `assets/images/items/durum/g3_muze_rehber.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u02.n02)

```
a museum hall with old objects in glass cases, a guide pointing at one case while children watch closely. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 16. `assets/images/items/hikaye/g3_seyit_onbasi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u02.n03)

```
a strong kind soldier from long ago in a simple uniform standing proudly on a green hill by the sea at sunrise, calm and peaceful scene. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 17. `assets/images/items/hikaye/g3_23_nisan_hazirlik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u02.n04)

```
two children in a classroom cutting red and white paper to make decorations for a children's festival. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 18. `assets/images/items/hikaye/g3_babaanne_album.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u02.n04)

```
a grandmother and a granddaughter sitting on a sofa looking at an old photo album together, warm lamp light. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 19. `assets/images/items/hikaye/g3_sincap_findik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u03.n01)

```
an autumn forest with orange leaves, a squirrel hiding hazelnuts in a hole in a tree trunk while two children watch from a path. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 20. `assets/images/items/hikaye/g3_damla_yolculuk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u03.n01)

```
a cute smiling water droplet character rising from a blue sea toward a fluffy white cloud under a warm sun. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 21. `assets/images/items/durum/g3_piknik_cop.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u03.n02)

```
a family picnic on green grass under trees, a child holding a small trash bag and talking to a friend. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 22. `assets/images/items/durum/g3_ari_belgesel.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u03.n02)

```
a child watching a television screen showing bees on yellow flowers, sitting on a carpet. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 23. `assets/images/items/durum/g3_kus_sesi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u03.n02)

```
a nature guide and children standing quietly on a forest path, small birds sitting on branches above. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 24. `assets/images/items/durum/g3_soz_kesme.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u03.n02)

```
a classroom, a boy presenting a big poster of a colorful butterfly while another boy at a desk raises his voice and points. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 25. `assets/images/items/hikaye/g3_ari_cicek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u03.n03)

```
a sunny meadow with colorful flowers, small honey bees flying from flower to flower, a wooden beehive in the corner. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 26. `assets/images/items/hikaye/g3_kar_bahce.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u03.n04)

```
two children in warm coats, scarves and gloves in a snowy garden rolling a big snowball. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 27. `assets/images/items/hikaye/g3_yaz_sahil.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u03.n04)

```
a mother and a son on a sunny beach, the mother holding a sun hat, a small ice cream stand nearby. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 28. `assets/images/items/hikaye/g3_sozluk_ela.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u04.n01)

```
a girl sitting at a desk at home with a thick open dictionary, pointing at a page with a curious smile, a lamp beside her. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 29. `assets/images/items/hikaye/g3_ahtapot.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u04.n01)

```
a boy reading a big encyclopedia with a colorful illustration of a friendly orange octopus under the sea. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 30. `assets/images/items/durum/g3_kutuphane_gorevli.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u04.n02)

```
a friendly librarian behind a wooden desk in a quiet library, a child approaching with a curious face. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 31. `assets/images/items/durum/g3_gezegenler.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u04.n02)

```
a child sitting on the floor with a small radio, a poster of colorful planets around the sun on the wall. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 32. `assets/images/items/durum/g3_dinozor_ders.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u04.n02)

```
a teacher showing a picture of a friendly long neck dinosaur to the class, a child writing in a notebook. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 33. `assets/images/items/durum/g3_penguen_tartisma.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u04.n02)

```
two children sitting in a school library looking at a picture book with penguins on ice. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 34. `assets/images/items/hikaye/g3_sozluk_sira.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u04.n03)

```
a boy and his grandfather looking together at an open thick dictionary on a wooden table, warm light. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 35. `assets/images/items/hikaye/g3_kutuphane_secim.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u04.n04)

```
two children in a bright library standing in front of a shelf, one holding a book with stars on the cover and the other a book with animals. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 36. `assets/images/items/hikaye/g3_penguen_ansiklopedi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u04.n04)

```
a grandfather and a grandson on a sofa reading an encyclopedia showing penguins swimming in icy water. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 37. `assets/images/items/hikaye/g3_resim_sergisi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u05.n01)

```
a girl proudly standing next to her colorful painting of a flower garden hanging on a classroom wall during a small school art exhibition. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 38. `assets/images/items/hikaye/g3_flut_konseri.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u05.n01)

```
a girl playing a recorder flute on a small school stage, a smiling teacher watching from the side, children clapping in the audience. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 39. `assets/images/items/durum/g3_yetenek_sunumu.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u05.n02)

```
a child standing in front of the classroom showing a homemade clay toy to seated classmates who listen attentively. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 40. `assets/images/items/durum/g3_origami_ders.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u05.n02)

```
a teacher folding a paper bird at a table while children watch closely holding colored paper. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 41. `assets/images/items/durum/g3_konser_duyuru.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u05.n02)

```
a music teacher speaking to a class while a child writes in a small notebook with a pencil. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 42. `assets/images/items/durum/g3_uzgun_ressam.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u05.n02)

```
a sad child sitting at a desk looking at a drawing, a friend kindly leaning over to comfort them. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 43. `assets/images/items/hikaye/g3_farkli_yetenekler.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u05.n03)

```
a cheerful classroom scene: one girl running fast in the schoolyard, a boy singing, another boy solving a puzzle at a desk. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 44. `assets/images/items/hikaye/g3_kukla_gosterisi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u05.n03)

```
a girl performing a puppet show with two sock puppets behind a cardboard box stage, her little brother laughing on the floor. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 45. `assets/images/items/hikaye/g3_basketbol.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u05.n04)

```
a boy showing a girl how to bounce a basketball in a school gym, both smiling. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 46. `assets/images/items/hikaye/g3_dede_baglama.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u05.n04)

```
a grandfather sitting on a sofa holding a baglama, his grandson looking at the instrument with admiration. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 47. `assets/images/items/hikaye/g3_yuzen_batan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u06.n01)

```
a child at a classroom table dropping objects into a clear bowl of water: a cork floating on top, a stone and a key lying at the bottom. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 48. `assets/images/items/hikaye/g3_karinca_gozlem.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u06.n01)

```
a girl and her grandfather kneeling in a garden, looking at a small ant on a green leaf through a magnifying glass. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 49. `assets/images/items/durum/g3_bilim_senligi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u06.n02)

```
a child explaining a simple experiment at a school science fair table to curious visitors. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 50. `assets/images/items/durum/g3_muze_hazirlik.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u06.n02)

```
a child at home writing in a notebook at a desk, a small toy planet model and a book about space beside them. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 51. `assets/images/items/durum/g3_belgesel.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u06.n02)

```
a family sitting on a sofa watching a documentary about a scientist working in a laboratory on the television. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 52. `assets/images/items/durum/g3_deney_adimlari.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u06.n02)

```
a teacher pointing at simple experiment tools on a table while a child writes notes in a notebook. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 53. `assets/images/items/hikaye/g3_gokkusagi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u06.n03)

```
a boy pointing at a bright rainbow in the sky after the rain, his mother standing beside him, wet grass and puddles. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 54. `assets/images/items/hikaye/g3_senlik_hazirlik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u06.n04)

```
two children in a classroom planning a science fair project, an empty plastic bottle and a paper sketch on the table. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 55. `assets/images/items/hikaye/g3_ay_gozlemi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u06.n04)

```
a girl and her father at an open window at night looking at a half moon, the girl holding a drawing notebook. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 56. `assets/images/items/hikaye/g3_bayram_ziyareti.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u07.n01)

```
a girl in new clothes kissing the hand of her grandmother in a cozy living room, the family smiling, a plate of candies on the table. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 57. `assets/images/items/hikaye/g3_hali_tezgahi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u07.n01)

```
a grandmother weaving a colorful patterned carpet on a wooden loom, her grandson watching beside her. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 58. `assets/images/items/durum/g3_misafir_kapi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u07.n02)

```
a child and mother opening the front door to smiling guests holding a box of sweets. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 59. `assets/images/items/durum/g3_bayram_telefonu.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u07.n02)

```
a smiling child talking on a home phone, a festive living room with a plate of candies in the background. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 60. `assets/images/items/durum/g3_fikra_saati.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u07.n02)

```
a teacher telling a funny story to children sitting in a circle on a classroom carpet, everyone listening and smiling. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 61. `assets/images/items/durum/g3_ebru_atolyesi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u07.n02)

```
an art teacher in a marbling workshop showing a tray of water, brushes and paint jars while a child writes in a notebook. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 62. `assets/images/items/hikaye/g3_ye_kurkum.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u07.n03)

```
Nasreddin Hodja in a big fur coat and white turban sitting at a festive feast table, playfully holding his sleeve toward a bowl of soup, guests looking surprised. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 63. `assets/images/items/hikaye/g3_lokum_ikrami.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u07.n04)

```
a girl politely offering a plate of Turkish delight to a smiling elderly neighbor woman sitting on a sofa, her mother beside them. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 64. `assets/images/items/hikaye/g3_ebru_teknesi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u07.n04)

```
a girl and a kind old marbling artist beside a tray of water with swirling colorful paint patterns on its surface. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 65. `assets/images/items/hikaye/g3_oyun_hakki.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u08.n01)

```
a happy boy playing on a swing in a sunny park with friends, his mother watching and smiling from a bench. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 66. `assets/images/items/hikaye/g3_doktor_muayene.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u08.n01)

```
a friendly doctor gently checking a girl with a stethoscope in a bright clinic room, her father sitting beside her. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 67. `assets/images/items/durum/g3_baskan_secimi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u08.n02)

```
a child speaking confidently in front of the class next to a small ballot box, classmates listening. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 68. `assets/images/items/durum/g3_itfaiyeci_konuk.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u08.n02)

```
a child at a school desk preparing a notebook, a toy red fire truck on the desk. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 69. `assets/images/items/durum/g3_cocuk_haklari.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Durum görseli (g3.turkce.u08.n02)

```
a friendly speaker talking to children sitting in a school hall, colorful paper hearts and hands decorating the wall. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 70. `assets/images/items/hikaye/g3_okul_bahcesi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u08.n03)

```
children cleaning a school yard together, putting paper and plastic into two separate colorful bins. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 71. `assets/images/items/hikaye/g3_ev_gorevleri.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u08.n03)

```
a family working together at home: father cooking, mother folding laundry, older sister putting away dishes, a child setting the table and a cat eating from a bowl. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 72. `assets/images/items/hikaye/g3_fidan_onerisi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u08.n04)

```
a boy talking excitedly to his teacher in an empty school yard, pointing at a bare patch of soil. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 73. `assets/images/items/hikaye/g3_kutuphane_kitap.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâye görseli (g3.turkce.u08.n04)

```
a boy talking politely to a friendly librarian at the library desk, bookshelves behind them. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```


---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Sahne görsellerinde arka plan silinmez (şeffaflık yok)
- [ ] Görselde yazı, harf ya da rakam yok
- [ ] Stil önceki partilerle tutarlı (yan yana koyup bak)
- [ ] Commit: `assets: 074 g3 türkçe görseller`
