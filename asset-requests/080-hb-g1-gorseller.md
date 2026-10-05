# 080 · Hayat Bilgisi 1. sınıf görselleri

**Öncelik: ORTA** (Faz 5b, Hayat Kasabası). `content/g1/hayat_bilgisi/` ünitelerinde kullanılan nesne, davranış kartı ve sahne görselleri (143 sprite + 22 sahne). Önceki partilerde istenmiş nesneler (ör. `item.meyve.elma`, `item.hayvan.kus`) burada tekrar edilmez.

- **Davranış kartları** (`item.davranis.*`, `item.trafik.*` vb.) senaryo ve sınıflandırma oyunlarında yan yana durur; çocuk yazıyı okumadan, yalnızca resme bakarak davranışı anlamalı. Aynı çocuk figürünü (kil, tombul, büyük gözlü) bütün kartlarda kullanmaya çalış.
- **Sahneler** (16:9) durumu anlatan arka planlardır; arka planları silinmez. Hayat Kasabası paleti (sarı, gök mavisi, tuğla kırmızısı) kullanılır.
- Korkutucu, şiddet içeren ya da gerçek kişilere benzeyen görsel istenmez. Atatürk konulu görsellerde portre yok; yerler ve semboller var.
- Bütün sprite'ların arka planı silinir, şeffaf PNG kaydedilir.

Stil blokları: `docs/assets/style-guide.md` → `STYLE_SPRITE` ve `STYLE_SCENE` (promptların sonunda tam metin olarak yer alıyor).

## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/items/davranis/parmak_kaldir.png` | 1:1 | — | Parmak kaldırmak |
| 2 | `assets/images/items/davranis/bagirarak_konus.png` | 1:1 | — | Bağırarak konuşmak |
| 3 | `assets/images/items/davranis/sirada_dans.png` | 1:1 | — | Sıranın üstüne çıkmak |
| 4 | `assets/images/items/sahne/sinif_ders.png` | 16:9 | — | Sahne: Sınıfta ders |
| 5 | `assets/images/items/simge/uygun.png` | 1:1 | — | Uygun davranış (gülen yüz) |
| 6 | `assets/images/items/simge/uygun_degil.png` | 1:1 | — | Uygun olmayan davranış (üzgün yüz) |
| 7 | `assets/images/items/davranis/sirada_bekle.png` | 1:1 | — | Sırada beklemek |
| 8 | `assets/images/items/davranis/koridorda_kos.png` | 1:1 | — | Koridorda koşmak |
| 9 | `assets/images/items/davranis/cope_at.png` | 1:1 | — | Çöpü çöp kutusuna atmak |
| 10 | `assets/images/items/davranis/siraya_ciz.png` | 1:1 | — | Sıraya çizmek |
| 11 | `assets/images/items/davranis/kitaplari_topla.png` | 1:1 | — | Eşyaları toplamak |
| 12 | `assets/images/items/davranis/sinifa_don.png` | 1:1 | — | Sınıfa dönmek |
| 13 | `assets/images/items/davranis/oyuna_devam.png` | 1:1 | — | Oynamaya devam etmek |
| 14 | `assets/images/items/davranis/saklan.png` | 1:1 | — | Saklanmak |
| 15 | `assets/images/items/sahne/zil_caldi.png` | 16:9 | — | Sahne: Teneffüs zili çaldı |
| 16 | `assets/images/items/simge/saglikli.png` | 1:1 | — | Sağlıklı |
| 17 | `assets/images/items/simge/sagliksiz.png` | 1:1 | — | Sağlıksız |
| 18 | `assets/images/items/yiyecek/sut.png` | 1:1 | — | Süt |
| 19 | `assets/images/items/yiyecek/seker.png` | 1:1 | — | Şeker |
| 20 | `assets/images/items/yiyecek/cips.png` | 1:1 | — | Cips |
| 21 | `assets/images/items/saglik/macun_sur.png` | 1:1 | — | Fırçaya macun sürmek |
| 22 | `assets/images/items/saglik/dis_fircala.png` | 1:1 | — | Dişleri fırçalamak |
| 23 | `assets/images/items/saglik/agiz_calkala.png` | 1:1 | — | Ağzı çalkalamak |
| 24 | `assets/images/items/davranis/yataga_git.png` | 1:1 | — | Yatağa gitmek |
| 25 | `assets/images/items/davranis/gece_tablet.png` | 1:1 | — | Gece tablet oynamak |
| 26 | `assets/images/items/davranis/gece_tv.png` | 1:1 | — | Gece televizyon izlemek |
| 27 | `assets/images/items/sahne/yatma_vakti.png` | 16:9 | — | Sahne: Uyku vakti |
| 28 | `assets/images/items/davranis/el_yika.png` | 1:1 | — | Elleri yıkamak |
| 29 | `assets/images/items/davranis/kirli_elle_ye.png` | 1:1 | — | Kirli elle yemek |
| 30 | `assets/images/items/davranis/oyuncakla_sofra.png` | 1:1 | — | Sofrada oyuncakla oynamak |
| 31 | `assets/images/items/sahne/sofra.png` | 16:9 | — | Sahne: Sofra hazır |
| 32 | `assets/images/items/davranis/nazikce_hayir.png` | 1:1 | — | Nazikçe hayır demek |
| 33 | `assets/images/items/davranis/sessiz_kal.png` | 1:1 | — | Sessiz kalmak |
| 34 | `assets/images/items/sahne/sarilma_istegi.png` | 16:9 | — | Sahne: Sormadan sarılmak isteyen arkadaş |
| 35 | `assets/images/items/davranis/aileye_kos.png` | 1:1 | — | Ailesinin yanına koşmak |
| 36 | `assets/images/items/davranis/sekeri_al.png` | 1:1 | — | Şekeri almak |
| 37 | `assets/images/items/davranis/yabanciyla_git.png` | 1:1 | — | Tanımadığı biriyle gitmek |
| 38 | `assets/images/items/sahne/yabanci_seker.png` | 16:9 | — | Sahne: Tanımadığı biri şeker veriyor |
| 39 | `assets/images/items/davranis/buyuge_anlat.png` | 1:1 | — | Güvendiği bir büyüğe anlatmak |
| 40 | `assets/images/items/davranis/sir_sakla.png` | 1:1 | — | Sırrı saklamak |
| 41 | `assets/images/items/davranis/unutmaya_calis.png` | 1:1 | — | Unutmaya çalışmak |
| 42 | `assets/images/items/sahne/sir.png` | 16:9 | — | Sahne: Rahatsız edici sır |
| 43 | `assets/images/items/trafik/kaldirimda_bekle.png` | 1:1 | — | Kaldırımda beklemek |
| 44 | `assets/images/items/trafik/kosarak_gec.png` | 1:1 | — | Koşarak karşıya geçmek |
| 45 | `assets/images/items/trafik/top_pesinden.png` | 1:1 | — | Topun peşinden yola koşmak |
| 46 | `assets/images/items/trafik/kirmizi_isik.png` | 16:9 | — | Sahne: Yaya ışığı kırmızı |
| 47 | `assets/images/items/trafik/emniyet_kemeri.png` | 1:1 | — | Emniyet kemerini takmak |
| 48 | `assets/images/items/trafik/yaya_gecidi.png` | 1:1 | — | Yaya geçidinden geçmek |
| 49 | `assets/images/items/trafik/saga_sola_bak.png` | 1:1 | — | Sağa sola bakmak |
| 50 | `assets/images/items/trafik/camdan_sarkma.png` | 1:1 | — | Camdan sarkmak |
| 51 | `assets/images/items/trafik/yolda_top.png` | 1:1 | — | Yolda top oynamak |
| 52 | `assets/images/items/trafik/on_koltuk.png` | 1:1 | — | Ön koltukta oturmak |
| 53 | `assets/images/items/trafik/ayakta_dur.png` | 1:1 | — | Arabada ayakta durmak |
| 54 | `assets/images/items/trafik/arabaya_binis.png` | 16:9 | — | Sahne: Arabaya biniş |
| 55 | `assets/images/items/acil/yangin.png` | 1:1 | — | Yangın |
| 56 | `assets/images/items/acil/kaybolma.png` | 1:1 | — | Kaybolmak |
| 57 | `assets/images/items/kisi/guvenlik.png` | 1:1 | — | Güvenlik görevlisi |
| 58 | `assets/images/items/acil/pencere_ac.png` | 1:1 | — | Pencereyi açıp haber vermek |
| 59 | `assets/images/items/acil/isik_yak.png` | 1:1 | — | Işığı yakmak |
| 60 | `assets/images/items/acil/dolaba_saklan.png` | 1:1 | — | Dolaba saklanmak |
| 61 | `assets/images/items/acil/gaz_kokusu.png` | 16:9 | — | Sahne: Gaz kokusu |
| 62 | `assets/images/items/acil/gorevliye_soyle.png` | 1:1 | — | Görevliye söylemek |
| 63 | `assets/images/items/acil/disari_kos.png` | 1:1 | — | Dışarı koşmak |
| 64 | `assets/images/items/acil/avm.png` | 16:9 | — | Sahne: Alışveriş merkezi |
| 65 | `assets/images/items/acil/dusme.png` | 1:1 | — | Okulda düşmek |
| 66 | `assets/images/items/kisi/ogretmen.png` | 1:1 | — | Öğretmen |
| 67 | `assets/images/items/aile/dede.png` | 1:1 | — | Dede |
| 68 | `assets/images/items/aile/anne.png` | 1:1 | — | Anne |
| 69 | `assets/images/items/aile/kardes.png` | 1:1 | — | Kardeş |
| 70 | `assets/images/items/aile/buyukanne.png` | 1:1 | — | Büyükanne |
| 71 | `assets/images/items/aile/baba.png` | 1:1 | — | Baba |
| 72 | `assets/images/items/aile/teyze.png` | 1:1 | — | Teyze |
| 73 | `assets/images/items/simge/cekirdek_aile.png` | 1:1 | — | Çekirdek aile |
| 74 | `assets/images/items/simge/genis_aile.png` | 1:1 | — | Geniş aile |
| 75 | `assets/images/items/aile/amca.png` | 1:1 | — | Amca |
| 76 | `assets/images/items/sahne/aile_tv.png` | 16:9 | — | Sahne: Herkes kendi ekranında |
| 77 | `assets/images/items/sahne/aile_yardim.png` | 16:9 | — | Sahne: Ailenin yardımı |
| 78 | `assets/images/items/duygu/guvende.png` | 1:1 | — | Güvende |
| 79 | `assets/images/items/duygu/korkmus.png` | 1:1 | — | Korkmuş |
| 80 | `assets/images/items/duygu/kizgin.png` | 1:1 | — | Kızgın |
| 81 | `assets/images/items/sahne/aile_sofra.png` | 16:9 | — | Sahne: Aile sofrası |
| 82 | `assets/images/items/nezaket/tesekkur.png` | 1:1 | — | Teşekkür etmek |
| 83 | `assets/images/items/nezaket/surat_as.png` | 1:1 | — | Surat asmak |
| 84 | `assets/images/items/sahne/su_ikram.png` | 16:9 | — | Sahne: Su ikramı |
| 85 | `assets/images/items/nezaket/rica_et.png` | 1:1 | — | Rica etmek |
| 86 | `assets/images/items/nezaket/uzanip_al.png` | 1:1 | — | Masanın üstünden uzanmak |
| 87 | `assets/images/items/nezaket/bagirarak_iste.png` | 1:1 | — | Bağırarak istemek |
| 88 | `assets/images/items/sahne/sofra_tuz.png` | 16:9 | — | Sahne: Sofrada uzaktaki tuz |
| 89 | `assets/images/items/nezaket/hos_geldin.png` | 1:1 | — | Hoş geldin demek |
| 90 | `assets/images/items/nezaket/odaya_kac.png` | 1:1 | — | Odaya kaçmak |
| 91 | `assets/images/items/nezaket/tv_sesi.png` | 1:1 | — | Televizyonun sesini açmak |
| 92 | `assets/images/items/sahne/misafir.png` | 16:9 | — | Sahne: Misafir geldi |
| 93 | `assets/images/items/simge/cocuk_gorevi.png` | 1:1 | — | Benim yapabileceğim görev |
| 94 | `assets/images/items/simge/buyuk_gorevi.png` | 1:1 | — | Büyüklerin görevi |
| 95 | `assets/images/items/gorev/oyuncak_topla.png` | 1:1 | — | Oyuncakları toplamak |
| 96 | `assets/images/items/gorev/cicek_sula.png` | 1:1 | — | Çiçekleri sulamak |
| 97 | `assets/images/items/gorev/araba_kullan.png` | 1:1 | — | Araba kullanmak |
| 98 | `assets/images/items/gorev/ocakta_yemek.png` | 1:1 | — | Ocakta yemek pişirmek |
| 99 | `assets/images/items/gorev/yatak_duzelt.png` | 1:1 | — | Yatağını düzeltmek |
| 100 | `assets/images/items/gorev/sofra_kur.png` | 1:1 | — | Sofrayı kurmak |
| 101 | `assets/images/items/gorev/ampul_degistir.png` | 1:1 | — | Ampul değiştirmek |
| 102 | `assets/images/items/esya/oyuncak_kutusu.png` | 1:1 | — | Oyuncak kutusu |
| 103 | `assets/images/items/esya/sulama_kabi.png` | 1:1 | — | Sulama kabı |
| 104 | `assets/images/items/esya/tabaklar.png` | 1:1 | — | Tabaklar |
| 105 | `assets/images/items/gorev/sofra_topla.png` | 1:1 | — | Sofrayı toplamak |
| 106 | `assets/images/items/gorev/tv_izle.png` | 1:1 | — | Televizyon izlemek |
| 107 | `assets/images/items/gorev/uyuya_kal.png` | 1:1 | — | Uyumak |
| 108 | `assets/images/items/sahne/aile_is_bolumu.png` | 16:9 | — | Sahne: Ailece sofra toplama |
| 109 | `assets/images/items/ulke/turk_lirasi.png` | 1:1 | — | Türk lirası |
| 110 | `assets/images/items/ataturk/anitkabir.png` | 1:1 | — | Anıtkabir |
| 111 | `assets/images/items/yer/deniz_feneri.png` | 1:1 | — | Deniz feneri |
| 112 | `assets/images/items/yer/kale.png` | 1:1 | — | Kale |
| 113 | `assets/images/items/ulke/harita.png` | 16:9 | — | Sahne: Türkiye haritası |
| 114 | `assets/images/items/ulke/turk_bayragi.png` | 1:1 | — | Türk bayrağı |
| 115 | `assets/images/items/oyuncak/bayrak_mavi.png` | 1:1 | — | Mavi flama |
| 116 | `assets/images/items/oyuncak/bayrak_yesil.png` | 1:1 | — | Yeşil flama |
| 117 | `assets/images/items/renk/mavi_sari.png` | 1:1 | — | Mavi ve sarı |
| 118 | `assets/images/items/renk/kirmizi_beyaz.png` | 1:1 | — | Kırmızı ve beyaz |
| 119 | `assets/images/items/renk/yesil_mor.png` | 1:1 | — | Yeşil ve mor |
| 120 | `assets/images/items/simge/ay_yildiz.png` | 1:1 | — | Ay ve yıldız |
| 121 | `assets/images/items/simge/gunes.png` | 1:1 | — | Güneş |
| 122 | `assets/images/items/simge/kalp.png` | 1:1 | — | Kalp |
| 123 | `assets/images/items/sahne/bayrak_toreni.png` | 16:9 | — | Sahne: Bayrak töreni |
| 124 | `assets/images/items/davranis/saygi_dur.png` | 1:1 | — | Saygıyla durmak |
| 125 | `assets/images/items/davranis/konusmak.png` | 1:1 | — | Arkadaşıyla konuşmak |
| 126 | `assets/images/items/davranis/yere_otur.png` | 1:1 | — | Yere oturmak |
| 127 | `assets/images/items/ataturk/dogdugu_ev.png` | 1:1 | — | Atatürk'ün doğduğu ev |
| 128 | `assets/images/items/ataturk/anitkabir_sahne.png` | 16:9 | — | Sahne: Anıtkabir |
| 129 | `assets/images/items/ataturk/okul.png` | 1:1 | — | Atatürk'ün ilk okulu |
| 130 | `assets/images/items/ataturk/cumhuriyet.png` | 1:1 | — | Cumhuriyet'in kuruluşu |
| 131 | `assets/images/items/simge/canli.png` | 1:1 | — | Canlı |
| 132 | `assets/images/items/simge/cansiz.png` | 1:1 | — | Cansız |
| 133 | `assets/images/items/doga/bulut.png` | 1:1 | — | Bulut |
| 134 | `assets/images/items/doga/agac.png` | 1:1 | — | Ağaç |
| 135 | `assets/images/items/doga/su_damlasi.png` | 1:1 | — | Su |
| 136 | `assets/images/items/doga/kum.png` | 1:1 | — | Kum |
| 137 | `assets/images/items/simge/hayvan.png` | 1:1 | — | Hayvan |
| 138 | `assets/images/items/simge/bitki.png` | 1:1 | — | Bitki |
| 139 | `assets/images/items/gok/gunes.png` | 1:1 | — | Güneş |
| 140 | `assets/images/items/gok/ay.png` | 1:1 | — | Ay |
| 141 | `assets/images/items/gok/dunya.png` | 1:1 | — | Dünya |
| 142 | `assets/images/items/gok/model.png` | 16:9 | — | Sahne: Güneş, Dünya ve Ay modeli |
| 143 | `assets/images/items/afet/deprem.png` | 1:1 | — | Deprem |
| 144 | `assets/images/items/afet/sel.png` | 1:1 | — | Sel |
| 145 | `assets/images/items/afet/yangin.png` | 1:1 | — | Orman yangını |
| 146 | `assets/images/items/afet/cig.png` | 1:1 | — | Çığ |
| 147 | `assets/images/items/afet/heyelan.png` | 1:1 | — | Heyelan |
| 148 | `assets/images/items/neden/saganak.png` | 1:1 | — | Sağanak yağmur |
| 149 | `assets/images/items/neden/karli_dag.png` | 1:1 | — | Çok karlı dik dağ |
| 150 | `assets/images/items/neden/kamp_atesi.png` | 1:1 | — | Söndürülmemiş kamp ateşi |
| 151 | `assets/images/items/simge/geri_donusum.png` | 1:1 | — | Geri dönüşüm |
| 152 | `assets/images/items/simge/cop.png` | 1:1 | — | Çöp kutusu |
| 153 | `assets/images/items/atik/gazete.png` | 1:1 | — | Gazete |
| 154 | `assets/images/items/atik/plastik_sise.png` | 1:1 | — | Plastik şişe |
| 155 | `assets/images/items/atik/cam_sise.png` | 1:1 | — | Cam şişe |
| 156 | `assets/images/items/atik/pecete.png` | 1:1 | — | Kullanılmış peçete |
| 157 | `assets/images/items/atik/muz_kabugu.png` | 1:1 | — | Muz kabuğu |
| 158 | `assets/images/items/kutu/kagit.png` | 1:1 | — | Kâğıt kutusu |
| 159 | `assets/images/items/kutu/plastik.png` | 1:1 | — | Plastik kutusu |
| 160 | `assets/images/items/kutu/cam.png` | 1:1 | — | Cam kutusu |
| 161 | `assets/images/items/atik/karton.png` | 1:1 | — | Karton kutu |
| 162 | `assets/images/items/atik/yogurt_kabi.png` | 1:1 | — | Plastik kap |
| 163 | `assets/images/items/atik/cam_kavanoz.png` | 1:1 | — | Cam kavanoz |
| 164 | `assets/images/items/atik/pil.png` | 1:1 | — | Pil |
| 165 | `assets/images/items/kutu/pil.png` | 1:1 | — | Pil kutusu |

## Promptlar

### 1. `assets/images/items/davranis/parmak_kaldir.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Parmak kaldırmak

```
a cute small clay child sitting at a desk raising one hand politely, smiling. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/items/davranis/bagirarak_konus.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bağırarak konuşmak

```
a cute small clay child standing up and shouting with mouth wide open, other hand waving. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/items/davranis/sirada_dans.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sıranın üstüne çıkmak

```
a cute small clay child climbing on top of a school desk and dancing. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 4. `assets/images/items/sahne/sinif_ders.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Sınıfta ders

```
a cozy classroom diorama: a friendly teacher at the board area (blank board) and children sitting at desks listening, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 5. `assets/images/items/simge/uygun.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Uygun davranış (gülen yüz)

```
a big friendly smiling face badge with a thumbs-up hand, round and cheerful. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 6. `assets/images/items/simge/uygun_degil.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Uygun olmayan davranış (üzgün yüz)

```
a gentle sad face badge with a thumbs-down hand, soft and not scary. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 7. `assets/images/items/davranis/sirada_bekle.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sırada beklemek

```
two small clay children waiting calmly in a line one behind the other. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 8. `assets/images/items/davranis/koridorda_kos.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Koridorda koşmak

```
a cute small clay child running fast in a school corridor with motion lines. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 9. `assets/images/items/davranis/cope_at.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çöpü çöp kutusuna atmak

```
a cute small clay child throwing a crumpled paper into a waste bin. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 10. `assets/images/items/davranis/siraya_ciz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sıraya çizmek

```
a cute small clay child scribbling with a crayon on top of a school desk. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 11. `assets/images/items/davranis/kitaplari_topla.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Eşyaları toplamak

```
a cute small clay child neatly stacking books on a classroom shelf. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 12. `assets/images/items/davranis/sinifa_don.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sınıfa dönmek

```
two small clay children walking happily back into the school door holding hands. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 13. `assets/images/items/davranis/oyuna_devam.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Oynamaya devam etmek

```
a cute small clay child still swinging on a swing in the schoolyard, ignoring the bell. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 14. `assets/images/items/davranis/saklan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Saklanmak

```
a cute small clay child hiding behind a tree in the schoolyard. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 15. `assets/images/items/sahne/zil_caldi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Teneffüs zili çaldı

```
a schoolyard diorama with a ringing school bell on the wall, children at playtime turning towards the school door, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 16. `assets/images/items/simge/saglikli.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sağlıklı

```
a happy strong clay heart with a little muscle arm, symbol of health. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 17. `assets/images/items/simge/sagliksiz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sağlıksız

```
a tired droopy clay heart with a small bandage, symbol of being unhealthy. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 18. `assets/images/items/yiyecek/sut.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Süt

```
a glass of milk. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 19. `assets/images/items/yiyecek/seker.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Şeker

```
a pile of colorful wrapped candies. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 20. `assets/images/items/yiyecek/cips.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Cips

```
an open bag of potato chips with chips spilling out, no logo. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 21. `assets/images/items/saglik/macun_sur.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Fırçaya macun sürmek

```
a toothbrush with a blob of toothpaste being squeezed on it. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 22. `assets/images/items/saglik/dis_fircala.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dişleri fırçalamak

```
a cute small clay child brushing teeth with foam, big smile. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 23. `assets/images/items/saglik/agiz_calkala.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ağzı çalkalamak

```
a cute small clay child rinsing mouth with a cup of water at a sink. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 24. `assets/images/items/davranis/yataga_git.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yatağa gitmek

```
a cute small clay child in pajamas climbing into bed hugging a teddy bear. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 25. `assets/images/items/davranis/gece_tablet.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Gece tablet oynamak

```
a cute small clay child sitting in the dark late at night staring at a glowing tablet. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 26. `assets/images/items/davranis/gece_tv.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Gece televizyon izlemek

```
a cute small clay child watching a glowing television late at night. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 27. `assets/images/items/sahne/yatma_vakti.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Uyku vakti

```
a cozy child's bedroom at night diorama: moon in the window, bed ready, soft lamp, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 28. `assets/images/items/davranis/el_yika.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Elleri yıkamak

```
a cute small clay child washing hands with soap bubbles at a sink. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 29. `assets/images/items/davranis/kirli_elle_ye.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kirli elle yemek

```
a cute small clay child with muddy hands grabbing food from a plate. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 30. `assets/images/items/davranis/oyuncakla_sofra.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sofrada oyuncakla oynamak

```
a cute small clay child playing with a toy car on the dinner table. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 31. `assets/images/items/sahne/sofra.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Sofra hazır

```
a family dinner table diorama with plates of food ready, a sink visible in the corner, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 32. `assets/images/items/davranis/nazikce_hayir.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Nazikçe hayır demek

```
a cute small clay child holding up one open palm gently in a calm 'stop' gesture with a polite face. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 33. `assets/images/items/davranis/sessiz_kal.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sessiz kalmak

```
a cute small clay child looking down silently with an uneasy face. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 34. `assets/images/items/sahne/sarilma_istegi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Sormadan sarılmak isteyen arkadaş

```
a playground diorama where one clay child walks toward another with open arms while the other looks unsure, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 35. `assets/images/items/davranis/aileye_kos.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ailesinin yanına koşmak

```
a cute small clay child running toward a parent's waiting open arms. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 36. `assets/images/items/davranis/sekeri_al.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Şekeri almak

```
a cute small clay child reaching out to take a candy from an unknown hand. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 37. `assets/images/items/davranis/yabanciyla_git.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tanımadığı biriyle gitmek

```
a cute small clay child walking away holding the hand of an unknown adult shown only from the waist down. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 38. `assets/images/items/sahne/yabanci_seker.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Tanımadığı biri şeker veriyor

```
a park diorama: an unknown adult shown only from the waist down holding out a candy toward a child near a bench, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 39. `assets/images/items/davranis/buyuge_anlat.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Güvendiği bir büyüğe anlatmak

```
a cute small clay child talking to a caring grown-up who kneels and listens. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 40. `assets/images/items/davranis/sir_sakla.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sırrı saklamak

```
a cute small clay child covering own mouth with both hands. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 41. `assets/images/items/davranis/unutmaya_calis.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Unutmaya çalışmak

```
a cute small clay child sitting alone looking away, trying to forget. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 42. `assets/images/items/sahne/sir.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Rahatsız edici sır

```
a soft-colored hallway diorama with a child looking uneasy, a finger-on-lips shape on a large shadow on the wall, gentle not scary, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 43. `assets/images/items/trafik/kaldirimda_bekle.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kaldırımda beklemek

```
a cute small clay child waiting on the sidewalk holding a grown-up's hand. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 44. `assets/images/items/trafik/kosarak_gec.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Koşarak karşıya geçmek

```
a cute small clay child running across the road in front of a car. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 45. `assets/images/items/trafik/top_pesinden.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Topun peşinden yola koşmak

```
a cute small clay child chasing a ball into the street. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 46. `assets/images/items/trafik/kirmizi_isik.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Yaya ışığı kırmızı

```
a small town street diorama with a pedestrian crossing and a pedestrian traffic light showing red figure, cars passing, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 47. `assets/images/items/trafik/emniyet_kemeri.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Emniyet kemerini takmak

```
a cute small clay child sitting in a child car seat in the back seat buckling the seat belt. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 48. `assets/images/items/trafik/yaya_gecidi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yaya geçidinden geçmek

```
a cute small clay child crossing on a zebra crossing holding a grown-up's hand. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 49. `assets/images/items/trafik/saga_sola_bak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sağa sola bakmak

```
a cute small clay child standing at the curb looking left and right carefully. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 50. `assets/images/items/trafik/camdan_sarkma.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Camdan sarkmak

```
a cute small clay child leaning out of a car window. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 51. `assets/images/items/trafik/yolda_top.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yolda top oynamak

```
two small clay children playing ball in the middle of a road. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 52. `assets/images/items/trafik/on_koltuk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ön koltukta oturmak

```
a cute small clay child sitting alone in the front passenger seat of a car. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 53. `assets/images/items/trafik/ayakta_dur.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Arabada ayakta durmak

```
a cute small clay child standing up between the seats in a moving car. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 54. `assets/images/items/trafik/arabaya_binis.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Arabaya biniş

```
a family car diorama with the back door open and a child seat visible, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 55. `assets/images/items/acil/yangin.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yangın

```
a small kitchen fire with smoke coming from a pan, not scary. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 56. `assets/images/items/acil/kaybolma.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kaybolmak

```
a cute small clay child lost and looking around in a busy shopping mall. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 57. `assets/images/items/kisi/guvenlik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Güvenlik görevlisi

```
a friendly clay security guard in uniform at a mall information desk. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 58. `assets/images/items/acil/pencere_ac.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Pencereyi açıp haber vermek

```
a cute small clay child opening a window wide and calling a grown-up. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 59. `assets/images/items/acil/isik_yak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Işığı yakmak

```
a cute small clay child pressing a light switch on the wall. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 60. `assets/images/items/acil/dolaba_saklan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dolaba saklanmak

```
a cute small clay child hiding inside a cupboard. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 61. `assets/images/items/acil/gaz_kokusu.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Gaz kokusu

```
a kitchen diorama with a stove and wavy smell lines in the air, a child holding nose, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 62. `assets/images/items/acil/gorevliye_soyle.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Görevliye söylemek

```
a cute small clay child talking to a uniformed information desk worker. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 63. `assets/images/items/acil/disari_kos.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dışarı koşmak

```
a cute small clay child running out of the mall doors alone. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 64. `assets/images/items/acil/avm.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Alışveriş merkezi

```
a shopping mall diorama with shops and an information desk, open space, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 65. `assets/images/items/acil/dusme.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Okulda düşmek

```
a cute small clay child fallen in a schoolyard holding a scraped knee. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 66. `assets/images/items/kisi/ogretmen.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Öğretmen

```
a friendly clay teacher holding a book. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 67. `assets/images/items/aile/dede.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dede

```
a friendly clay grandfather with grey moustache and a cane. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 68. `assets/images/items/aile/anne.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Anne

```
a friendly clay mother. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 69. `assets/images/items/aile/kardes.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kardeş

```
a small clay sibling, toddler. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 70. `assets/images/items/aile/buyukanne.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Büyükanne

```
a friendly clay grandmother with grey hair bun and glasses. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 71. `assets/images/items/aile/baba.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Baba

```
a friendly clay father. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 72. `assets/images/items/aile/teyze.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Teyze

```
a friendly clay aunt holding a gift. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 73. `assets/images/items/simge/cekirdek_aile.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çekirdek aile

```
a small cozy house icon with three heads peeking from the window: two parents and one child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 74. `assets/images/items/simge/genis_aile.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Geniş aile

```
a bigger cozy house icon with many heads peeking from the windows: grandparents, parents, aunt and children. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 75. `assets/images/items/aile/amca.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Amca

```
a friendly clay uncle with a cap. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 76. `assets/images/items/sahne/aile_tv.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Herkes kendi ekranında

```
a living room diorama where everyone sits apart looking at their own screens, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 77. `assets/images/items/sahne/aile_yardim.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Ailenin yardımı

```
a cozy living room diorama where a family takes care of a child resting in bed with a blanket, one brings soup, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 78. `assets/images/items/duygu/guvende.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Güvende

```
a cute small clay child being hugged warmly, eyes closed peacefully. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 79. `assets/images/items/duygu/korkmus.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Korkmuş

```
a cute small clay child looking scared and alone. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 80. `assets/images/items/duygu/kizgin.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kızgın

```
a cute small clay child with a grumpy angry face, arms crossed. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 81. `assets/images/items/sahne/aile_sofra.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Aile sofrası

```
a warm family dinner table diorama, everyone talking and smiling, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 82. `assets/images/items/nezaket/tesekkur.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Teşekkür etmek

```
a cute small clay child smiling and placing hand on chest in thanks. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 83. `assets/images/items/nezaket/surat_as.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Surat asmak

```
a cute small clay child frowning and turning away. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 84. `assets/images/items/sahne/su_ikram.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Su ikramı

```
a kitchen diorama where a parent hands a glass of water to a child, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 85. `assets/images/items/nezaket/rica_et.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Rica etmek

```
a cute small clay child at the table politely asking with an open hand gesture. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 86. `assets/images/items/nezaket/uzanip_al.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Masanın üstünden uzanmak

```
a cute small clay child stretching across the whole table over the food. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 87. `assets/images/items/nezaket/bagirarak_iste.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bağırarak istemek

```
a cute small clay child shouting at the table. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 88. `assets/images/items/sahne/sofra_tuz.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Sofrada uzaktaki tuz

```
a family dinner table diorama with a salt shaker far away on the other side, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 89. `assets/images/items/nezaket/hos_geldin.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hoş geldin demek

```
a cute small clay child greeting guests at the door with a smile and open arms. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 90. `assets/images/items/nezaket/odaya_kac.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Odaya kaçmak

```
a cute small clay child running away into a bedroom and closing the door. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 91. `assets/images/items/nezaket/tv_sesi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Televizyonun sesini açmak

```
a cute small clay child turning up the TV volume loudly. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 92. `assets/images/items/sahne/misafir.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Misafir geldi

```
a home entrance diorama with an open front door and smiling guests holding a cake, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 93. `assets/images/items/simge/cocuk_gorevi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Benim yapabileceğim görev

```
a small child hand holding a little watering can, symbol of a child's chore. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 94. `assets/images/items/simge/buyuk_gorevi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Büyüklerin görevi

```
a big grown-up hand holding a car key and a toolbox, symbol of a grown-up's job. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 95. `assets/images/items/gorev/oyuncak_topla.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Oyuncakları toplamak

```
a cute small clay child putting toys into a toy box. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 96. `assets/images/items/gorev/cicek_sula.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çiçekleri sulamak

```
a cute small clay child watering a potted flower. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 97. `assets/images/items/gorev/araba_kullan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Araba kullanmak

```
a grown-up driving a family car. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 98. `assets/images/items/gorev/ocakta_yemek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ocakta yemek pişirmek

```
a grown-up cooking at a hot stove with a pot. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 99. `assets/images/items/gorev/yatak_duzelt.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yatağını düzeltmek

```
a cute small clay child making the bed and fluffing the pillow. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 100. `assets/images/items/gorev/sofra_kur.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sofrayı kurmak

```
a cute small clay child carrying plastic plates to set the table. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 101. `assets/images/items/gorev/ampul_degistir.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ampul değiştirmek

```
a grown-up on a step ladder changing a light bulb. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 102. `assets/images/items/esya/oyuncak_kutusu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Oyuncak kutusu

```
an open wooden toy box. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 103. `assets/images/items/esya/sulama_kabi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sulama kabı

```
a small watering can. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 104. `assets/images/items/esya/tabaklar.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tabaklar

```
a stack of colorful plastic plates and spoons. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 105. `assets/images/items/gorev/sofra_topla.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sofrayı toplamak

```
a cute small clay child carrying used cups to the kitchen. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 106. `assets/images/items/gorev/tv_izle.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Televizyon izlemek

```
a cute small clay child lying on the sofa watching TV. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 107. `assets/images/items/gorev/uyuya_kal.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Uyumak

```
a cute small clay child asleep on the sofa. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 108. `assets/images/items/sahne/aile_is_bolumu.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Ailece sofra toplama

```
a home kitchen diorama after dinner, a family clearing the table together, one sibling drying dishes, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 109. `assets/images/items/ulke/turk_lirasi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Türk lirası

```
a small pile of plain golden and silver toy coins and a soft red-brown toy banknote, no numbers, no portraits. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 110. `assets/images/items/ataturk/anitkabir.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Anıtkabir

```
Anıtkabir mausoleum in Ankara as a clay miniature: a grand rectangular colonnaded monument on a wide stone platform. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 111. `assets/images/items/yer/deniz_feneri.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Deniz feneri

```
a striped red and white lighthouse on a rock. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 112. `assets/images/items/yer/kale.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kale

```
an old stone castle tower with battlements. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 113. `assets/images/items/ulke/harita.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Türkiye haritası

```
a simple clay relief map of Türkiye with blue sea on three sides: north, west and south; land in warm green and yellow, no labels, no text, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 114. `assets/images/items/ulke/turk_bayragi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Türk bayrağı

```
the Turkish flag waving on a pole: red flag with a white crescent and a white five-pointed star. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 115. `assets/images/items/oyuncak/bayrak_mavi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Mavi flama

```
a plain blue triangular pennant flag on a small stick. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 116. `assets/images/items/oyuncak/bayrak_yesil.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yeşil flama

```
a plain green triangular pennant flag on a small stick. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 117. `assets/images/items/renk/mavi_sari.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Mavi ve sarı

```
two chunky clay paint blobs side by side: blue and yellow. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 118. `assets/images/items/renk/kirmizi_beyaz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kırmızı ve beyaz

```
two chunky clay paint blobs side by side: red and white. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 119. `assets/images/items/renk/yesil_mor.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yeşil ve mor

```
two chunky clay paint blobs side by side: green and purple. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 120. `assets/images/items/simge/ay_yildiz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ay ve yıldız

```
a white crescent moon and a white five-pointed star together on a red round badge. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 121. `assets/images/items/simge/gunes.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Güneş

```
a smiling yellow sun. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 122. `assets/images/items/simge/kalp.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kalp

```
a pink heart. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 123. `assets/images/items/sahne/bayrak_toreni.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Bayrak töreni

```
a school yard diorama with a flagpole and the Turkish flag, children lined up for a ceremony, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 124. `assets/images/items/davranis/saygi_dur.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Saygıyla durmak

```
a cute small clay child standing straight and still in attention, respectful face. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 125. `assets/images/items/davranis/konusmak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Arkadaşıyla konuşmak

```
two small clay children chatting and giggling. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 126. `assets/images/items/davranis/yere_otur.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yere oturmak

```
a cute small clay child sitting on the ground playing with pebbles. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 127. `assets/images/items/ataturk/dogdugu_ev.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Atatürk'ün doğduğu ev

```
Atatürk's birth house in Thessaloniki as a clay miniature: a three-story pink house with a small courtyard. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 128. `assets/images/items/ataturk/anitkabir_sahne.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Anıtkabir

```
a wide sunny diorama of Anıtkabir in Ankara with its long lion road and the colonnaded mausoleum, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 129. `assets/images/items/ataturk/okul.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Atatürk'ün ilk okulu

```
an old style small stone school building with a bell, Ottoman era look. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 130. `assets/images/items/ataturk/cumhuriyet.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Cumhuriyet'in kuruluşu

```
a festive celebration: many red Turkish flags and lanterns over a small town square. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 131. `assets/images/items/simge/canli.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Canlı

```
a small green sprout with a tiny beating heart beside it, symbol of living things. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 132. `assets/images/items/simge/cansiz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Cansız

```
a smooth plain grey pebble with no face, symbol of non-living things. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 133. `assets/images/items/doga/bulut.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bulut

```
a fluffy white cloud. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 134. `assets/images/items/doga/agac.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ağaç

```
a round leafy green tree. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 135. `assets/images/items/doga/su_damlasi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Su

```
a big shiny blue water drop. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 136. `assets/images/items/doga/kum.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kum

```
a small pile of golden sand. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 137. `assets/images/items/simge/hayvan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hayvan

```
a single big cute paw print, symbol of animals. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 138. `assets/images/items/simge/bitki.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bitki

```
a single cute green two-leaf sprout in soil, symbol of plants. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 139. `assets/images/items/gok/gunes.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Güneş

```
a model of the Sun: a big glowing orange-yellow ball, no face. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 140. `assets/images/items/gok/ay.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ay

```
a model of the Moon: a small grey ball with craters, no face. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 141. `assets/images/items/gok/dunya.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dünya

```
a model of the Earth: a blue and green ball with white clouds, no face. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 142. `assets/images/items/gok/model.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Güneş, Dünya ve Ay modeli

```
a classroom table diorama with a simple Sun, Earth and Moon model made of clay balls on sticks, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 143. `assets/images/items/afet/deprem.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Deprem

```
a small house shaking with wobble lines and a cracked ground, cute not scary. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 144. `assets/images/items/afet/sel.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sel

```
a street flooded with brown water up to the doors of small houses. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 145. `assets/images/items/afet/yangin.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Orman yangını

```
a forest fire with orange flames on a few trees, smoke clouds, not scary. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 146. `assets/images/items/afet/cig.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çığ

```
a big snow avalanche sliding down a steep mountain. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 147. `assets/images/items/afet/heyelan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Heyelan

```
soil and rocks sliding down a hill toward a road after rain. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 148. `assets/images/items/neden/saganak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sağanak yağmur

```
a dark rain cloud pouring very heavy rain. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 149. `assets/images/items/neden/karli_dag.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çok karlı dik dağ

```
a steep mountain slope covered with very thick snow. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 150. `assets/images/items/neden/kamp_atesi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Söndürülmemiş kamp ateşi

```
an unattended smoking campfire left in a forest. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 151. `assets/images/items/simge/geri_donusum.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Geri dönüşüm

```
three chunky green curved arrows chasing each other in a triangle loop, recycling symbol without any letters. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 152. `assets/images/items/simge/cop.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çöp kutusu

```
a plain grey household trash can with a closed lid. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 153. `assets/images/items/atik/gazete.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Gazete

```
a folded newspaper with only grey lines, no text. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 154. `assets/images/items/atik/plastik_sise.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Plastik şişe

```
an empty clear plastic water bottle. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 155. `assets/images/items/atik/cam_sise.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Cam şişe

```
an empty green glass bottle. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 156. `assets/images/items/atik/pecete.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kullanılmış peçete

```
a crumpled used paper napkin. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 157. `assets/images/items/atik/muz_kabugu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Muz kabuğu

```
a banana peel. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 158. `assets/images/items/kutu/kagit.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kâğıt kutusu

```
a blue recycling bin with a paper sheet symbol on the front. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 159. `assets/images/items/kutu/plastik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Plastik kutusu

```
a yellow recycling bin with a bottle symbol on the front. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 160. `assets/images/items/kutu/cam.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Cam kutusu

```
a green recycling bin with a jar symbol on the front. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 161. `assets/images/items/atik/karton.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Karton kutu

```
a flattened cardboard box. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 162. `assets/images/items/atik/yogurt_kabi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Plastik kap

```
an empty plastic yogurt cup. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 163. `assets/images/items/atik/cam_kavanoz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Cam kavanoz

```
an empty glass jar without lid. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 164. `assets/images/items/atik/pil.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Pil

```
two small batteries. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 165. `assets/images/items/kutu/pil.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Pil kutusu

```
a small orange battery collection box with a battery symbol. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```


---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Sprite'larda arka plan silindi, şeffaf PNG; sahneler (16:9) arka planlı kalır
- [ ] Görselde yazı, harf ya da rakam yok
- [ ] Stil önceki partilerle tutarlı (yan yana koyup bak)
- [ ] Commit: `assets: 080 080 hb g1 gorseller`
