# 081 · Hayat Bilgisi 2. sınıf görselleri

**Öncelik: ORTA** (Faz 5b, Hayat Kasabası). `content/g2/hayat_bilgisi/` ünitelerinde kullanılan nesne, davranış kartı ve sahne görselleri (188 sprite + 35 sahne). Önceki partilerde istenmiş nesneler (ör. `item.meyve.elma`, `item.hayvan.kus`) burada tekrar edilmez.

- **Davranış kartları** (`item.davranis.*`, `item.trafik.*` vb.) senaryo ve sınıflandırma oyunlarında yan yana durur; çocuk yazıyı okumadan, yalnızca resme bakarak davranışı anlamalı. Aynı çocuk figürünü (kil, tombul, büyük gözlü) bütün kartlarda kullanmaya çalış.
- **Sahneler** (16:9) durumu anlatan arka planlardır; arka planları silinmez. Hayat Kasabası paleti (sarı, gök mavisi, tuğla kırmızısı) kullanılır.
- Korkutucu, şiddet içeren ya da gerçek kişilere benzeyen görsel istenmez. Atatürk konulu görsellerde portre yok; yerler ve semboller var.
- Bütün sprite'ların arka planı silinir, şeffaf PNG kaydedilir.

Stil blokları: `docs/assets/style-guide.md` → `STYLE_SPRITE` ve `STYLE_SCENE` (promptların sonunda tam metin olarak yer alıyor).

## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/items/simge/sabah.png` | 1:1 | — | Sabah |
| 2 | `assets/images/items/simge/aksam.png` | 1:1 | — | Akşam |
| 3 | `assets/images/items/gunluk/uyan.png` | 1:1 | — | Uyanmak |
| 4 | `assets/images/items/gunluk/kahvalti.png` | 1:1 | — | Kahvaltı |
| 5 | `assets/images/items/gunluk/okula_git.png` | 1:1 | — | Okula gitmek |
| 6 | `assets/images/items/gunluk/aksam_yemegi.png` | 1:1 | — | Akşam yemeği |
| 7 | `assets/images/items/gunluk/masal.png` | 1:1 | — | Masal dinlemek |
| 8 | `assets/images/items/gunluk/yatmak.png` | 1:1 | — | Uyumak |
| 9 | `assets/images/items/gunluk/odev.png` | 1:1 | — | Ödev yapmak |
| 10 | `assets/images/items/plan/telas.png` | 1:1 | — | Telaşla geç kalmak |
| 11 | `assets/images/items/plan/rahat.png` | 1:1 | — | Rahat bir sabah |
| 12 | `assets/images/items/plan/hicbir_sey.png` | 1:1 | — | Hiçbir şey yapmamak |
| 13 | `assets/images/items/sahne/daginik_sabah.png` | 16:9 | — | Sahne: Dağınık sabah |
| 14 | `assets/images/items/plan/canta_hazirla.png` | 1:1 | — | Çantayı akşamdan hazırlamak |
| 15 | `assets/images/items/plan/gec_yat.png` | 1:1 | — | Geç saate kadar oynamak |
| 16 | `assets/images/items/iletisim/bekle_dinle.png` | 1:1 | — | Sözünü bitirmesini beklemek |
| 17 | `assets/images/items/iletisim/soz_kes.png` | 1:1 | — | Sözünü kesmek |
| 18 | `assets/images/items/sahne/arkadas_konusuyor.png` | 16:9 | — | Sahne: Arkadaşı konuşuyor |
| 19 | `assets/images/items/iletisim/goz_temasi.png` | 1:1 | — | Göz teması kurmak |
| 20 | `assets/images/items/iletisim/baska_yere_bak.png` | 1:1 | — | Başka yere bakmak |
| 21 | `assets/images/items/iletisim/oyuncakla_oyna.png` | 1:1 | — | Oyuncakla oynamak |
| 22 | `assets/images/items/sahne/ogretmen_anlatiyor.png` | 16:9 | — | Sahne: Öğretmen anlatıyor |
| 23 | `assets/images/items/iletisim/fisilda.png` | 1:1 | — | Alçak sesle konuşmak |
| 24 | `assets/images/items/iletisim/bagir.png` | 1:1 | — | Bağırmak |
| 25 | `assets/images/items/iletisim/kolundan_cek.png` | 1:1 | — | Kolundan çekmek |
| 26 | `assets/images/items/sahne/kutuphane.png` | 16:9 | — | Sahne: Kütüphane |
| 27 | `assets/images/items/arkadas/paylas.png` | 1:1 | — | Paylaşmak |
| 28 | `assets/images/items/arkadas/oyuna_kat.png` | 1:1 | — | Oyuna katmak |
| 29 | `assets/images/items/arkadas/alay_et.png` | 1:1 | — | Alay etmek |
| 30 | `assets/images/items/arkadas/oyuncak_kap.png` | 1:1 | — | Oyuncağını kapmak |
| 31 | `assets/images/items/arkadas/ozur_dile.png` | 1:1 | — | Özür dilemek |
| 32 | `assets/images/items/arkadas/disla.png` | 1:1 | — | Oyuna almamak |
| 33 | `assets/images/items/arkadas/gulup_kac.png` | 1:1 | — | Gülüp kaçmak |
| 34 | `assets/images/items/arkadas/sucla.png` | 1:1 | — | Başkasını suçlamak |
| 35 | `assets/images/items/sahne/kule_yikildi.png` | 16:9 | — | Sahne: Yıkılan kule |
| 36 | `assets/images/items/arkadas/sirayla.png` | 1:1 | — | Sırayla binmek |
| 37 | `assets/images/items/arkadas/birakmamak.png` | 1:1 | — | Salıncağı bırakmamak |
| 38 | `assets/images/items/arkadas/kusmek.png` | 1:1 | — | Küsmek |
| 39 | `assets/images/items/sahne/salincak.png` | 16:9 | — | Sahne: Tek salıncak |
| 40 | `assets/images/items/aliskanlik/erken_yat.png` | 1:1 | — | Erken yatmak |
| 41 | `assets/images/items/aliskanlik/spor.png` | 1:1 | — | Spor yapmak |
| 42 | `assets/images/items/aliskanlik/su_ic.png` | 1:1 | — | Su içmek |
| 43 | `assets/images/items/aliskanlik/gec_yat.png` | 1:1 | — | Geç yatmak |
| 44 | `assets/images/items/aliskanlik/cok_seker.png` | 1:1 | — | Çok şeker yemek |
| 45 | `assets/images/items/aliskanlik/uzun_ekran.png` | 1:1 | — | Saatlerce ekrana bakmak |
| 46 | `assets/images/items/sonuc/guclu_kas.png` | 1:1 | — | Güçlü kaslar |
| 47 | `assets/images/items/sonuc/dinc_sabah.png` | 1:1 | — | Dinç bir sabah |
| 48 | `assets/images/items/aliskanlik/dis_fircala.png` | 1:1 | — | Diş fırçalamak |
| 49 | `assets/images/items/sonuc/saglam_dis.png` | 1:1 | — | Sağlam dişler |
| 50 | `assets/images/items/sonuc/uykulu.png` | 1:1 | — | Uykulu çocuk |
| 51 | `assets/images/items/simge/gizli.png` | 1:1 | — | Gizli kalmalı |
| 52 | `assets/images/items/simge/paylasilir.png` | 1:1 | — | Paylaşılabilir |
| 53 | `assets/images/items/bilgi/ev_adresi.png` | 1:1 | — | Ev adresi |
| 54 | `assets/images/items/bilgi/sifre.png` | 1:1 | — | Şifre |
| 55 | `assets/images/items/bilgi/sevdigi_renk.png` | 1:1 | — | Sevdiğin renk |
| 56 | `assets/images/items/bilgi/cizdigi_resim.png` | 1:1 | — | Çizdiğin resim |
| 57 | `assets/images/items/bilgi/telefon_no.png` | 1:1 | — | Telefon numarası |
| 58 | `assets/images/items/bilgi/sevdigi_hayvan.png` | 1:1 | — | Sevdiğin hayvan |
| 59 | `assets/images/items/cevrim/buyuge_goster.png` | 1:1 | — | Büyüğüne göstermek |
| 60 | `assets/images/items/cevrim/adres_yaz.png` | 1:1 | — | Adresini yazmak |
| 61 | `assets/images/items/cevrim/gizlice_konus.png` | 1:1 | — | Gizlice yazışmak |
| 62 | `assets/images/items/sahne/tablet_mesaj.png` | 16:9 | — | Sahne: Tanımadığı birinden mesaj |
| 63 | `assets/images/items/cevrim/buyuge_sor.png` | 1:1 | — | Büyüğüne sormak |
| 64 | `assets/images/items/cevrim/hemen_tikla.png` | 1:1 | — | Hemen dokunmak |
| 65 | `assets/images/items/sahne/tablet_hediye.png` | 16:9 | — | Sahne: Hediye kazandın penceresi |
| 66 | `assets/images/items/levha/yaya_gecidi.png` | 1:1 | — | Yaya geçidi levhası |
| 67 | `assets/images/items/levha/bisiklet_yolu.png` | 1:1 | — | Bisiklet yolu levhası |
| 68 | `assets/images/items/levha/okul_gecidi.png` | 1:1 | — | Okul geçidi levhası |
| 69 | `assets/images/items/levha/isikli_isaret.png` | 1:1 | — | Işıklı işaret cihazı levhası |
| 70 | `assets/images/items/anlam/yayalar_gecer.png` | 1:1 | — | Yayalar karşıya geçer |
| 71 | `assets/images/items/anlam/okul_yakini.png` | 1:1 | — | Yakında okul var |
| 72 | `assets/images/items/anlam/bisikletliler.png` | 1:1 | — | Bisikletliler için yol |
| 73 | `assets/images/items/anlam/trafik_isigi.png` | 1:1 | — | İleride trafik ışığı var |
| 74 | `assets/images/items/simge/soyle.png` | 1:1 | — | 112'ye söylenir |
| 75 | `assets/images/items/simge/gereksiz.png` | 1:1 | — | Gereksiz bilgi |
| 76 | `assets/images/items/bilgi112/ne_oldu.png` | 1:1 | — | Ne olduğu |
| 77 | `assets/images/items/bilgi112/adres.png` | 1:1 | — | Adres |
| 78 | `assets/images/items/bilgi112/kac_kisi.png` | 1:1 | — | Kaç kişi olduğu |
| 79 | `assets/images/items/bilgi112/oyuncak.png` | 1:1 | — | En sevdiğin oyuncak |
| 80 | `assets/images/items/bilgi112/yemek.png` | 1:1 | — | Akşam yemeği |
| 81 | `assets/images/items/bilgi112/cizgi_film.png` | 1:1 | — | Sevdiğin çizgi film |
| 82 | `assets/images/items/acil112/sakin.png` | 1:1 | — | Sakin konuşmak |
| 83 | `assets/images/items/acil112/aglayarak.png` | 1:1 | — | Ağlayıp bağırmak |
| 84 | `assets/images/items/acil112/telefonu_kapat.png` | 1:1 | — | Telefonu kapatmak |
| 85 | `assets/images/items/sahne/112_arama.png` | 16:9 | — | Sahne: 112'yi aramak |
| 86 | `assets/images/items/acil112/saka_yapma.png` | 1:1 | — | Şaka arama yapma demek |
| 87 | `assets/images/items/acil112/birlikte_ara.png` | 1:1 | — | Birlikte aramak |
| 88 | `assets/images/items/acil112/izle.png` | 1:1 | — | Seyretmek |
| 89 | `assets/images/items/sahne/saka_arama.png` | 16:9 | — | Sahne: Şaka için 112'yi aramak |
| 90 | `assets/images/items/sahne/aile_tv_kucuk.png` | 1:1 | — | Herkes kendi işinde |
| 91 | `assets/images/items/sahne/bisikletten_dustu.png` | 16:9 | — | Sahne: Bisikletten düşmek |
| 92 | `assets/images/items/sahne/masal_okuma.png` | 16:9 | — | Sahne: Ablası masal okuyor |
| 93 | `assets/images/items/aile/top_oyna.png` | 1:1 | — | Top oynamak |
| 94 | `assets/images/items/aile/fidan_dik.png` | 1:1 | — | Fidan dikmek |
| 95 | `assets/images/items/aile/balik_tut.png` | 1:1 | — | Balık tutmak |
| 96 | `assets/images/items/sahne/fidan_dikmek.png` | 16:9 | — | Sahne: Dedesiyle fidan dikmek |
| 97 | `assets/images/items/aile/su_getir.png` | 1:1 | — | Su getirmek |
| 98 | `assets/images/items/aile/gurultu.png` | 1:1 | — | Gürültü yapmak |
| 99 | `assets/images/items/aile/disari_cik.png` | 1:1 | — | Dışarı çıkıp gitmek |
| 100 | `assets/images/items/sahne/anne_hasta.png` | 16:9 | — | Sahne: Annesi hasta |
| 101 | `assets/images/items/toplum/sirada_bekle.png` | 1:1 | — | Sırada beklemek |
| 102 | `assets/images/items/toplum/one_gec.png` | 1:1 | — | Sıranın önüne geçmek |
| 103 | `assets/images/items/sahne/firin_sirasi.png` | 16:9 | — | Sahne: Fırında sıra |
| 104 | `assets/images/items/toplum/yer_ver.png` | 1:1 | — | Yer vermek |
| 105 | `assets/images/items/toplum/cama_bak.png` | 1:1 | — | Camdan dışarı bakmak |
| 106 | `assets/images/items/toplum/cantayi_koy.png` | 1:1 | — | Çantasını koltuğa koymak |
| 107 | `assets/images/items/sahne/otobus.png` | 16:9 | — | Sahne: Otobüste ayakta duran yaşlı |
| 108 | `assets/images/items/toplum/sessiz_oku.png` | 1:1 | — | Sessizce kitap okumak |
| 109 | `assets/images/items/toplum/yuksek_ses.png` | 1:1 | — | Yüksek sesle gülmek |
| 110 | `assets/images/items/toplum/kitaplikta_kos.png` | 1:1 | — | Rafların arasında koşmak |
| 111 | `assets/images/items/cevre/cope_at.png` | 1:1 | — | Çöpü kutuya atmak |
| 112 | `assets/images/items/cevre/bakip_gec.png` | 1:1 | — | Görmezden gelmek |
| 113 | `assets/images/items/sahne/park_cop.png` | 16:9 | — | Sahne: Parkta yerde çöp |
| 114 | `assets/images/items/sorumluluk/cicek_sula.png` | 1:1 | — | Çiçekleri sulamak |
| 115 | `assets/images/items/sorumluluk/cicek_kopar.png` | 1:1 | — | Çiçek koparmak |
| 116 | `assets/images/items/sorumluluk/uzaklas.png` | 1:1 | — | Uzaklaşmak |
| 117 | `assets/images/items/sahne/okul_bahcesi_cicek.png` | 16:9 | — | Sahne: Susuz çiçekler |
| 118 | `assets/images/items/sorumluluk/komsuya_yardim.png` | 1:1 | — | Yardım etmek |
| 119 | `assets/images/items/sorumluluk/gormezden_gel.png` | 1:1 | — | Görmezden gelmek |
| 120 | `assets/images/items/sorumluluk/asansore_kos.png` | 1:1 | — | Asansöre koşmak |
| 121 | `assets/images/items/sahne/komsu_poset.png` | 16:9 | — | Sahne: Ağır poşetli komşu |
| 122 | `assets/images/items/kaynak/muhtarlik.png` | 1:1 | — | Muhtarlık |
| 123 | `assets/images/items/kaynak/oyuncakci.png` | 1:1 | — | Oyuncakçı |
| 124 | `assets/images/items/sahne/mahalle.png` | 16:9 | — | Sahne: Mahalle |
| 125 | `assets/images/items/kaynak/ansiklopedi.png` | 1:1 | — | Ansiklopedi |
| 126 | `assets/images/items/kaynak/cizgi_film.png` | 1:1 | — | Çizgi film |
| 127 | `assets/images/items/kaynak/masal_kitabi.png` | 1:1 | — | Masal kitabı |
| 128 | `assets/images/items/sahne/calisma_masasi.png` | 16:9 | — | Sahne: Araştırma masası |
| 129 | `assets/images/items/kaynak/resmi_site.png` | 1:1 | — | Kurumun resmî internet sitesi |
| 130 | `assets/images/items/kaynak/dedikodu.png` | 1:1 | — | Kulaktan dolma bilgi |
| 131 | `assets/images/items/sahne/belediye_parki.png` | 16:9 | — | Sahne: Yapılacak park |
| 132 | `assets/images/items/ataturk/selanik.png` | 16:9 | — | Sahne: Selanik |
| 133 | `assets/images/items/ataturk/ogrenci.png` | 16:9 | — | Sahne: Askerî Rüştiye sınıfı |
| 134 | `assets/images/items/milli/askerler.png` | 1:1 | — | Askerler |
| 135 | `assets/images/items/milli/cocuklar.png` | 1:1 | — | Çocuklar |
| 136 | `assets/images/items/milli/meclis.png` | 1:1 | — | Meclis |
| 137 | `assets/images/items/milli/okul_binasi.png` | 1:1 | — | Okul binası |
| 138 | `assets/images/items/milli/tbmm_1920.png` | 16:9 | — | Sahne: Birinci Meclis binası |
| 139 | `assets/images/items/milli/cumhuriyet_sokak.png` | 16:9 | — | Sahne: Cumhuriyet Bayramı süslemesi |
| 140 | `assets/images/items/milli/cocuk_senligi.png` | 1:1 | — | 23 Nisan çocuk şenliği |
| 141 | `assets/images/items/milli/genclik_spor.png` | 1:1 | — | 19 Mayıs gençlik ve spor gösterisi |
| 142 | `assets/images/items/milli/fener_alayi.png` | 1:1 | — | 29 Ekim fener alayı |
| 143 | `assets/images/items/milli/zafer.png` | 1:1 | — | 30 Ağustos zafer |
| 144 | `assets/images/items/bayram/park.png` | 1:1 | — | Park |
| 145 | `assets/images/items/bayram/buyukler.png` | 1:1 | — | Büyükler |
| 146 | `assets/images/items/bayram/ziyaret.png` | 16:9 | — | Sahne: Bayram ziyareti |
| 147 | `assets/images/items/bayram/yalniz_tv.png` | 1:1 | — | Evde kapanmak |
| 148 | `assets/images/items/bayram/paylas.png` | 1:1 | — | Komşuyla paylaşmak |
| 149 | `assets/images/items/bayram/paylasim.png` | 16:9 | — | Sahne: Bayramda paylaşmak |
| 150 | `assets/images/items/bayram/el_op.png` | 1:1 | — | El öpmek |
| 151 | `assets/images/items/bayram/selamsiz.png` | 1:1 | — | Selam vermeden geçmek |
| 152 | `assets/images/items/bayram/tablet.png` | 1:1 | — | Tablete dalmak |
| 153 | `assets/images/items/simge/kis.png` | 1:1 | — | Kış |
| 154 | `assets/images/items/simge/yaz.png` | 1:1 | — | Yaz |
| 155 | `assets/images/items/hava/kar.png` | 1:1 | — | Kar yağışı |
| 156 | `assets/images/items/hava/kardan_adam.png` | 1:1 | — | Kardan adam |
| 157 | `assets/images/items/hava/buz_sarkiti.png` | 1:1 | — | Buz sarkıtları |
| 158 | `assets/images/items/hava/sicak_gunes.png` | 1:1 | — | Sıcak güneş |
| 159 | `assets/images/items/hava/plaj.png` | 1:1 | — | Plaj günü |
| 160 | `assets/images/items/hava/dondurma.png` | 1:1 | — | Dondurma |
| 161 | `assets/images/items/simge/ilkbahar.png` | 1:1 | — | İlkbahar |
| 162 | `assets/images/items/simge/sonbahar.png` | 1:1 | — | Sonbahar |
| 163 | `assets/images/items/hava/cicek_acan_agac.png` | 1:1 | — | Çiçek açan ağaç |
| 164 | `assets/images/items/hava/gokkusagi.png` | 1:1 | — | Yağmur ve gökkuşağı |
| 165 | `assets/images/items/hava/yavru_kus.png` | 1:1 | — | Yuvadaki yavru kuşlar |
| 166 | `assets/images/items/hava/sari_yapraklar.png` | 1:1 | — | Sararan yapraklar |
| 167 | `assets/images/items/hava/ruzgar.png` | 1:1 | — | Rüzgârlı hava |
| 168 | `assets/images/items/hava/kuslar_goc.png` | 1:1 | — | Göç eden kuşlar |
| 169 | `assets/images/items/yon/gunes_dogusu.png` | 1:1 | — | Güneşin doğuşu |
| 170 | `assets/images/items/yon/gunes_batisi.png` | 1:1 | — | Güneşin batışı |
| 171 | `assets/images/items/yon/kutup_yildizi.png` | 1:1 | — | Kutup Yıldızı |
| 172 | `assets/images/items/yon/gunes_dogarken.png` | 16:9 | — | Sahne: Güneş doğarken |
| 173 | `assets/images/items/yon/yosunlu_agac.png` | 16:9 | — | Sahne: Yosunlu ağaç |
| 174 | `assets/images/items/kaynak/afet_gorevlisi.png` | 1:1 | — | Afet görevlisi |
| 175 | `assets/images/items/sahne/deprem_bilgi.png` | 16:9 | — | Sahne: Depreme hazırlık köşesi |
| 176 | `assets/images/items/kaynak/afet_brosuru.png` | 1:1 | — | Afet bilgi broşürü |
| 177 | `assets/images/items/sahne/sel_bilgi.png` | 16:9 | — | Sahne: Sel tehlikesi |
| 178 | `assets/images/items/onlem/deprem_cantasi.png` | 1:1 | — | Deprem çantası hazırlamak |
| 179 | `assets/images/items/onlem/dolap_sabitle.png` | 1:1 | — | Dolabı duvara sabitlemek |
| 180 | `assets/images/items/onlem/cok_kapan.png` | 1:1 | — | Çök, kapan, tutun |
| 181 | `assets/images/items/onlem/asansor.png` | 1:1 | — | Depremde asansöre binmek |
| 182 | `assets/images/items/onlem/merdivende_kos.png` | 1:1 | — | Depremde merdivenden koşmak |
| 183 | `assets/images/items/onlem/pencereden_bak.png` | 1:1 | — | Pencere kenarında durmak |
| 184 | `assets/images/items/tasarruf/musluk_kapat.png` | 1:1 | — | Musluğu kapatmak |
| 185 | `assets/images/items/tasarruf/musluk_acik.png` | 1:1 | — | Musluğu açık bırakmak |
| 186 | `assets/images/items/sahne/dis_fircalarken.png` | 16:9 | — | Sahne: Diş fırçalarken akan su |
| 187 | `assets/images/items/tasarruf/isik_kapat.png` | 1:1 | — | Işığı kapatmak |
| 188 | `assets/images/items/tasarruf/isik_acik_birak.png` | 1:1 | — | Işığı açık bırakmak |
| 189 | `assets/images/items/tasarruf/tum_isiklar.png` | 1:1 | — | Bütün ışıkları açmak |
| 190 | `assets/images/items/sahne/isik_acik_oda.png` | 16:9 | — | Sahne: Işığı açık boş oda |
| 191 | `assets/images/items/simge/tasarruf.png` | 1:1 | — | Tasarruflu |
| 192 | `assets/images/items/simge/israf.png` | 1:1 | — | İsraf |
| 193 | `assets/images/items/tasarruf/kagit_iki_yuz.png` | 1:1 | — | Kâğıdın iki yüzünü kullanmak |
| 194 | `assets/images/items/tasarruf/bez_canta.png` | 1:1 | — | Bez çanta kullanmak |
| 195 | `assets/images/items/tasarruf/kagit_ziyan.png` | 1:1 | — | Boş kâğıdı atmak |
| 196 | `assets/images/items/tasarruf/cok_poset.png` | 1:1 | — | Çok poşet kullanmak |
| 197 | `assets/images/items/kaynak/kutuphane.png` | 1:1 | — | Kütüphane |
| 198 | `assets/images/items/kaynak/yemek_kitabi.png` | 1:1 | — | Yemek kitabı |
| 199 | `assets/images/items/kaynak/aileyle_internet.png` | 1:1 | — | Ailesiyle internetten araştırmak |
| 200 | `assets/images/items/kaynak/yalniz_internet.png` | 1:1 | — | Tek başına rastgele dokunmak |
| 201 | `assets/images/items/kaynak/reklam.png` | 1:1 | — | Reklama dokunmak |
| 202 | `assets/images/items/tek/telefon_cevirmeli.png` | 1:1 | — | Çevirmeli telefon |
| 203 | `assets/images/items/tek/telefon_tuslu.png` | 1:1 | — | Tuşlu cep telefonu |
| 204 | `assets/images/items/tek/telefon_akilli.png` | 1:1 | — | Akıllı telefon |
| 205 | `assets/images/items/tek/mum.png` | 1:1 | — | Mum |
| 206 | `assets/images/items/tek/gaz_lambasi.png` | 1:1 | — | Gaz lambası |
| 207 | `assets/images/items/tek/ampul.png` | 1:1 | — | Ampul |
| 208 | `assets/images/items/tek/led.png` | 1:1 | — | LED lamba |
| 209 | `assets/images/items/tek/telefon_gelecek.png` | 1:1 | — | Geleceğin telefonu |
| 210 | `assets/images/items/tek/telefon_dev.png` | 1:1 | — | Kocaman ağır telefon |
| 211 | `assets/images/items/tek/telefon_zaman.png` | 16:9 | — | Sahne: Telefonların değişimi |
| 212 | `assets/images/items/sanat/muzik_yapan.png` | 1:1 | — | Müzik yapan çocuk |
| 213 | `assets/images/items/simge/muzik.png` | 1:1 | — | Müzik |
| 214 | `assets/images/items/simge/resim.png` | 1:1 | — | Resim |
| 215 | `assets/images/items/sanat/baglama.png` | 1:1 | — | Bağlama |
| 216 | `assets/images/items/sanat/davul.png` | 1:1 | — | Davul |
| 217 | `assets/images/items/sanat/flut.png` | 1:1 | — | Flüt |
| 218 | `assets/images/items/sanat/firca.png` | 1:1 | — | Fırça |
| 219 | `assets/images/items/sanat/tuval.png` | 1:1 | — | Tuval |
| 220 | `assets/images/items/sanat/ebru.png` | 1:1 | — | Ebru |
| 221 | `assets/images/items/simge/tiyatro.png` | 1:1 | — | Tiyatro |
| 222 | `assets/images/items/sanat/kukla.png` | 1:1 | — | Kukla |
| 223 | `assets/images/items/sanat/sahne_perdesi.png` | 1:1 | — | Tiyatro sahnesi |

## Promptlar

### 1. `assets/images/items/simge/sabah.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sabah

```
a sunrise icon: a smiling sun rising over a green hill. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/items/simge/aksam.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Akşam

```
an evening icon: a sleepy crescent moon with two small stars. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/items/gunluk/uyan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Uyanmak

```
a cute small clay child waking up stretching in bed next to an alarm clock without digits. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 4. `assets/images/items/gunluk/kahvalti.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kahvaltı

```
a cute small clay child eating breakfast with bread, cheese and tomato. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 5. `assets/images/items/gunluk/okula_git.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Okula gitmek

```
a cute small clay child walking to school with a backpack. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 6. `assets/images/items/gunluk/aksam_yemegi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Akşam yemeği

```
a family eating dinner under a warm lamp at night. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 7. `assets/images/items/gunluk/masal.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Masal dinlemek

```
a parent reading a bedtime story to a child in bed. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 8. `assets/images/items/gunluk/yatmak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Uyumak

```
a cute small clay child in pajamas sleeping in bed with a night lamp. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 9. `assets/images/items/gunluk/odev.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ödev yapmak

```
a cute small clay child doing homework at a desk. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 10. `assets/images/items/plan/telas.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Telaşla geç kalmak

```
a cute small clay child rushing in panic looking for books, late for school. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 11. `assets/images/items/plan/rahat.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Rahat bir sabah

```
a cute small clay child calmly walking out the door with a ready bag, smiling. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 12. `assets/images/items/plan/hicbir_sey.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hiçbir şey yapmamak

```
a cute small clay child shrugging with empty hands. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 13. `assets/images/items/sahne/daginik_sabah.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Dağınık sabah

```
a messy child's bedroom diorama in the morning: books, pencils and clothes scattered, an empty school bag, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 14. `assets/images/items/plan/canta_hazirla.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çantayı akşamdan hazırlamak

```
a cute small clay child packing the school bag at night with a checklist-like row of items, no text. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 15. `assets/images/items/plan/gec_yat.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Geç saate kadar oynamak

```
a cute small clay child playing with toys late at night. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 16. `assets/images/items/iletisim/bekle_dinle.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sözünü bitirmesini beklemek

```
a cute small clay child listening attentively with hands on lap, waiting for a turn. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 17. `assets/images/items/iletisim/soz_kes.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sözünü kesmek

```
a cute small clay child interrupting loudly with a raised finger while another child talks. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 18. `assets/images/items/sahne/arkadas_konusuyor.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Arkadaşı konuşuyor

```
a classroom diorama where one child is talking to a small group of friends, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 19. `assets/images/items/iletisim/goz_temasi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Göz teması kurmak

```
a small round claymation diorama vignette: a cute small clay child sitting at a desk looking up at a grown-up woman teacher standing in front of them, the two clearly looking at each other with friendly eye contact. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 20. `assets/images/items/iletisim/baska_yere_bak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Başka yere bakmak

```
a cute small clay child looking out of the window, not listening. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 21. `assets/images/items/iletisim/oyuncakla_oyna.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Oyuncakla oynamak

```
a cute small clay child playing with a toy under the desk. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 22. `assets/images/items/sahne/ogretmen_anlatiyor.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Öğretmen anlatıyor

```
a classroom diorama where a friendly teacher is explaining something to one child, dominant palette: sunny yellow, sky blue and brick red accents. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 23. `assets/images/items/iletisim/fisilda.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Alçak sesle konuşmak

```
a small round claymation diorama vignette: two cute small clay children side by side, one leaning in and whispering softly into the other child's ear with a hand cupped around the mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 24. `assets/images/items/iletisim/bagir.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bağırmak

```
a cute small clay child shouting across the room with hands around mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 25. `assets/images/items/iletisim/kolundan_cek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kolundan çekmek

```
a cute small clay child pulling a friend's arm. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 26. `assets/images/items/sahne/kutuphane.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Kütüphane

```
a quiet library corner diorama with bookshelves and two children reading, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 27. `assets/images/items/arkadas/paylas.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Paylaşmak

```
two small clay children sharing a box of crayons. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 28. `assets/images/items/arkadas/oyuna_kat.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Oyuna katmak

```
a cute small clay child waving to invite another child to join a game. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 29. `assets/images/items/arkadas/alay_et.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Alay etmek

```
a cute small clay child laughing and pointing at another child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 30. `assets/images/items/arkadas/oyuncak_kap.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Oyuncağını kapmak

```
a cute small clay child snatching a toy from another child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 31. `assets/images/items/arkadas/ozur_dile.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Özür dilemek

```
a cute small clay child apologizing with a sorry face, hand on heart, to a friend. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 32. `assets/images/items/arkadas/disla.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Oyuna almamak

```
two children playing while turning their backs on a third child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 33. `assets/images/items/arkadas/gulup_kac.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Gülüp kaçmak

```
a cute small clay child laughing and running away. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 34. `assets/images/items/arkadas/sucla.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Başkasını suçlamak

```
a cute small clay child pointing at someone else with an excuse face. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 35. `assets/images/items/sahne/kule_yikildi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Yıkılan kule

```
a classroom play corner diorama with a fallen tower of toy blocks and a surprised child, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 36. `assets/images/items/arkadas/sirayla.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sırayla binmek

```
two small clay children taking turns on a swing, one pushing gently. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 37. `assets/images/items/arkadas/birakmamak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Salıncağı bırakmamak

```
a cute small clay child holding the swing tightly and not letting a friend ride. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 38. `assets/images/items/arkadas/kusmek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Küsmek

```
a cute small clay child sulking with arms crossed, turned away. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 39. `assets/images/items/sahne/salincak.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Tek salıncak

```
a playground diorama with one swing and two children wanting to ride, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 40. `assets/images/items/aliskanlik/erken_yat.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Erken yatmak

```
a cute small clay child going to bed early, the window shows early evening. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 41. `assets/images/items/aliskanlik/spor.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Spor yapmak

```
a cute small clay child riding a bicycle with a helmet in a park. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 42. `assets/images/items/aliskanlik/su_ic.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Su içmek

```
a cute small clay child drinking a glass of water. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 43. `assets/images/items/aliskanlik/gec_yat.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Geç yatmak

```
a cute small clay child awake at midnight with a tablet glowing. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 44. `assets/images/items/aliskanlik/cok_seker.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çok şeker yemek

```
a cute small clay child eating a huge pile of candy. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 45. `assets/images/items/aliskanlik/uzun_ekran.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Saatlerce ekrana bakmak

```
a cute small clay child slouched on a sofa with a game controller for hours, tired eyes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 46. `assets/images/items/sonuc/guclu_kas.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Güçlü kaslar

```
a cute small clay child proudly lifting a toy dumbbell, strong and healthy. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 47. `assets/images/items/sonuc/dinc_sabah.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dinç bir sabah

```
a cute small clay child waking up fresh and energetic in the morning sun. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 48. `assets/images/items/aliskanlik/dis_fircala.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Diş fırçalamak

```
a cute small clay child brushing teeth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 49. `assets/images/items/sonuc/saglam_dis.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sağlam dişler

```
a big shiny healthy smiling tooth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 50. `assets/images/items/sonuc/uykulu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Uykulu çocuk

```
a cute small clay child yawning sleepily at a school desk. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 51. `assets/images/items/simge/gizli.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Gizli kalmalı

```
a chunky closed padlock with a tiny shield, symbol of private information. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 52. `assets/images/items/simge/paylasilir.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Paylaşılabilir

```
an open cupped hand with tan skin and a darker outline holding a small bright red heart, symbol of something that can be shared. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 53. `assets/images/items/bilgi/ev_adresi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ev adresi

```
a small house with a big location pin above it. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 54. `assets/images/items/bilgi/sifre.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Şifre

```
a big golden key next to a padlock. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 55. `assets/images/items/bilgi/sevdigi_renk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sevdiğin renk

```
three colored pencils fanned out. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 56. `assets/images/items/bilgi/cizdigi_resim.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çizdiğin resim

```
a child's crayon drawing of a sun and a house, no letters. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 57. `assets/images/items/bilgi/telefon_no.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Telefon numarası

```
a mobile phone showing a keypad of blank round buttons, no digits. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 58. `assets/images/items/bilgi/sevdigi_hayvan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sevdiğin hayvan

```
a cute cat toy. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 59. `assets/images/items/cevrim/buyuge_goster.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Büyüğüne göstermek

```
a cute small clay child showing a tablet screen to a parent. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 60. `assets/images/items/cevrim/adres_yaz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Adresini yazmak

```
a cute small clay child typing on a tablet while a house with a location pin floats above. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 61. `assets/images/items/cevrim/gizlice_konus.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Gizlice yazışmak

```
a cute small clay child hiding under a blanket chatting on a tablet. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 62. `assets/images/items/sahne/tablet_mesaj.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Tanımadığı birinden mesaj

```
a child's desk diorama with a tablet showing a chat window with an unknown smiling avatar, empty speech bubbles, no text, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 63. `assets/images/items/cevrim/buyuge_sor.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Büyüğüne sormak

```
a cute small clay child pointing at a tablet and asking a parent. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 64. `assets/images/items/cevrim/hemen_tikla.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hemen dokunmak

```
a cute small clay child eagerly tapping a gift box on a tablet screen. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 65. `assets/images/items/sahne/tablet_hediye.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Hediye kazandın penceresi

```
a tablet on a table showing a game with a big flashing gift box pop-up window, no text, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 66. `assets/images/items/levha/yaya_gecidi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yaya geçidi levhası

```
a blue square road sign with a white triangle and a walking person on a zebra crossing pictogram, no text. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 67. `assets/images/items/levha/bisiklet_yolu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bisiklet yolu levhası

```
a round blue road sign with a white bicycle pictogram, no text. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 68. `assets/images/items/levha/okul_gecidi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Okul geçidi levhası

```
a red-bordered triangular road sign with a solid opaque white inner panel, two black children walking pictogram on the white panel, on a short grey pole, no text. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 69. `assets/images/items/levha/isikli_isaret.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Işıklı işaret cihazı levhası

```
a red-bordered triangular road sign with a solid opaque white inner panel, a small black traffic light with red, yellow and green lamps on the white panel, on a short grey pole, no text. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 70. `assets/images/items/anlam/yayalar_gecer.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yayalar karşıya geçer

```
people crossing on a zebra crossing while cars wait. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 71. `assets/images/items/anlam/okul_yakini.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yakında okul var

```
children with backpacks crossing near a school building. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 72. `assets/images/items/anlam/bisikletliler.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bisikletliler için yol

```
a child riding a bicycle on a separate bike lane. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 73. `assets/images/items/anlam/trafik_isigi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** İleride trafik ışığı var

```
a traffic light at an intersection ahead with cars slowing down. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 74. `assets/images/items/simge/soyle.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** 112'ye söylenir

```
an old style telephone handset with a speech bubble shape (empty bubble, no text). 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 75. `assets/images/items/simge/gereksiz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Gereksiz bilgi

```
an empty speech bubble crossed by a soft grey stripe, symbol of unnecessary talk. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 76. `assets/images/items/bilgi112/ne_oldu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ne olduğu

```
a small house with a little smoke cloud, symbol of what happened. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 77. `assets/images/items/bilgi112/adres.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Adres

```
a street with a house and a big location pin. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 78. `assets/images/items/bilgi112/kac_kisi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kaç kişi olduğu

```
a group of three small clay people icons. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 79. `assets/images/items/bilgi112/oyuncak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** En sevdiğin oyuncak

```
a toy robot. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 80. `assets/images/items/bilgi112/yemek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Akşam yemeği

```
a plate of pasta. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 81. `assets/images/items/bilgi112/cizgi_film.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sevdiğin çizgi film

```
a television showing a colorful cartoon bunny. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 82. `assets/images/items/acil112/sakin.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sakin konuşmak

```
a cute small clay child speaking calmly and clearly on a phone. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 83. `assets/images/items/acil112/aglayarak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ağlayıp bağırmak

```
a cute small clay child crying and shouting into a phone. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 84. `assets/images/items/acil112/telefonu_kapat.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Telefonu kapatmak

```
a cute small clay child hanging up the phone quickly. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 85. `assets/images/items/sahne/112_arama.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: 112'yi aramak

```
a home diorama with a child holding a phone, an emergency call atmosphere, calm colors, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 86. `assets/images/items/acil112/saka_yapma.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Şaka arama yapma demek

```
a cute small clay child shaking head and gently stopping a friend's hand from dialing. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 87. `assets/images/items/acil112/birlikte_ara.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Birlikte aramak

```
two children giggling mischievously while holding one mobile phone together and pretending to call, a prank-call behavior card. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 88. `assets/images/items/acil112/izle.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Seyretmek

```
a cute small clay child watching silently. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 89. `assets/images/items/sahne/saka_arama.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Şaka için 112'yi aramak

```
a living room diorama where a giggling child holds a phone and another child watches, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 90. `assets/images/items/sahne/aile_tv_kucuk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Herkes kendi işinde

```
a small round claymation diorama vignette: a living room with a grown-up mother, a grown-up father and a child sitting far apart on a sofa, each staring at their own phone or tablet, not talking. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 91. `assets/images/items/sahne/bisikletten_dustu.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Bisikletten düşmek

```
a sunny garden path diorama with a small bicycle lying on the ground and a child sitting with a scraped knee, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 92. `assets/images/items/sahne/masal_okuma.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Ablası masal okuyor

```
a cozy bedroom diorama where an older sister reads a book to a younger brother with a bandage on his knee, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 93. `assets/images/items/aile/top_oyna.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Top oynamak

```
a grandfather and a child playing ball. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 94. `assets/images/items/aile/fidan_dik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Fidan dikmek

```
a grandfather and a child planting a small sapling. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 95. `assets/images/items/aile/balik_tut.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Balık tutmak

```
a grandfather and a child fishing at a lake. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 96. `assets/images/items/sahne/fidan_dikmek.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Dedesiyle fidan dikmek

```
a garden diorama where a grandfather and a child plant a small sapling together, dominant palette: sunny yellow, sky blue and brick red accents. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 97. `assets/images/items/aile/su_getir.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Su getirmek

```
a cute small clay child carefully bringing a glass of water and a blanket. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 98. `assets/images/items/aile/gurultu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Gürültü yapmak

```
a cute small clay child banging on a toy drum loudly. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 99. `assets/images/items/aile/disari_cik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dışarı çıkıp gitmek

```
a cute small clay child leaving the house to play, door closing. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 100. `assets/images/items/sahne/anne_hasta.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Annesi hasta

```
a bedroom diorama with a mother resting in bed with a blanket, a glass of water on the side table, dominant palette: sunny yellow, sky blue and brick red accents. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 101. `assets/images/items/toplum/sirada_bekle.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sırada beklemek

```
a small round claymation diorama vignette: three small clay children standing one behind the other in a queue in front of a small counter, a cute child waiting patiently at the end of the line. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 102. `assets/images/items/toplum/one_gec.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sıranın önüne geçmek

```
a small round claymation diorama vignette: three small clay children standing in a queue in front of a small counter, one cute child sneaking past them toward the front of the line. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 103. `assets/images/items/sahne/firin_sirasi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Fırında sıra

```
a bakery shop diorama with a line of customers waiting at the counter, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 104. `assets/images/items/toplum/yer_ver.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yer vermek

```
a cute small clay child standing up and offering a seat to an elderly woman on a bus. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 105. `assets/images/items/toplum/cama_bak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Camdan dışarı bakmak

```
a cute small clay child sitting on a bus looking out the window, ignoring others. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 106. `assets/images/items/toplum/cantayi_koy.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çantasını koltuğa koymak

```
a cute small clay child putting a backpack on the empty bus seat. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 107. `assets/images/items/sahne/otobus.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Otobüste ayakta duran yaşlı

```
a city bus interior diorama with an elderly woman standing holding a bar and a child sitting, dominant palette: sunny yellow, sky blue and brick red accents. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 108. `assets/images/items/toplum/sessiz_oku.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sessizce kitap okumak

```
a cute small clay child reading a book quietly in a library. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 109. `assets/images/items/toplum/yuksek_ses.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yüksek sesle gülmek

```
a cute small clay child laughing loudly in a library. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 110. `assets/images/items/toplum/kitaplikta_kos.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Rafların arasında koşmak

```
a small round claymation diorama vignette: a cute small clay child running in a small library between two low colorful bookshelves. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 111. `assets/images/items/cevre/cope_at.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çöpü kutuya atmak

```
a cute small clay child picking up a wrapper and putting it in a park bin. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 112. `assets/images/items/cevre/bakip_gec.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Görmezden gelmek

```
a cute small clay child walking past a wrapper on the grass. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 113. `assets/images/items/sahne/park_cop.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Parkta yerde çöp

```
a park diorama with a candy wrapper on the grass near a bench and a trash bin nearby, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 114. `assets/images/items/sorumluluk/cicek_sula.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çiçekleri sulamak

```
two children watering a school flower bed with watering cans. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 115. `assets/images/items/sorumluluk/cicek_kopar.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çiçek koparmak

```
a cute small clay child picking flowers from a flower bed. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 116. `assets/images/items/sorumluluk/uzaklas.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Uzaklaşmak

```
a small round claymation diorama vignette: a cute small clay child walking away from a small playground, holding a ball and looking back over the shoulder. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 117. `assets/images/items/sahne/okul_bahcesi_cicek.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Susuz çiçekler

```
a school garden diorama with drooping thirsty flowers in a flower bed, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 118. `assets/images/items/sorumluluk/komsuya_yardim.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yardım etmek

```
a cute small clay child together with a parent helping an elderly neighbor carry bags. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 119. `assets/images/items/sorumluluk/gormezden_gel.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Görmezden gelmek

```
a small round claymation diorama vignette: a cute small clay child turning their head away pretending not to see a crying younger child sitting on the ground nearby. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 120. `assets/images/items/sorumluluk/asansore_kos.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Asansöre koşmak

```
a cute small clay child running into an elevator alone, closing doors. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 121. `assets/images/items/sahne/komsu_poset.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Ağır poşetli komşu

```
an apartment entrance diorama with an elderly neighbor carrying heavy shopping bags, dominant palette: sunny yellow, sky blue and brick red accents. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 122. `assets/images/items/kaynak/muhtarlik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Muhtarlık

```
a small neighborhood headman's office building with a Turkish flag, no sign text. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 123. `assets/images/items/kaynak/oyuncakci.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Oyuncakçı

```
a toy shop window full of toys. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 124. `assets/images/items/sahne/mahalle.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Mahalle

```
a small Turkish neighborhood street diorama with houses, a little headman's office and a bakery, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 125. `assets/images/items/kaynak/ansiklopedi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ansiklopedi

```
a stack of thick colorful encyclopedia books, no letters on covers. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 126. `assets/images/items/kaynak/cizgi_film.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çizgi film

```
a television showing a colorful cartoon. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 127. `assets/images/items/kaynak/masal_kitabi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Masal kitabı

```
a fairy tale book with a dragon and castle on the cover, no letters. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 128. `assets/images/items/sahne/calisma_masasi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Araştırma masası

```
a child's study desk diorama with an open notebook, pencils and a lamp, no text, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 129. `assets/images/items/kaynak/resmi_site.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kurumun resmî internet sitesi

```
a parent and a child together looking at a computer screen showing a small government building picture, no text. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 130. `assets/images/items/kaynak/dedikodu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kulaktan dolma bilgi

```
two children whispering a rumor with wavy lines. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 131. `assets/images/items/sahne/belediye_parki.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Yapılacak park

```
an empty lot diorama with a sign post (blank) where a new park might be built, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 132. `assets/images/items/ataturk/selanik.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Selanik

```
a diorama of old Thessaloniki by the sea with red roofed houses and a tower, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 133. `assets/images/items/ataturk/ogrenci.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Askerî Rüştiye sınıfı

```
an old style classroom diorama with wooden desks and a slate board, a math lesson atmosphere with abstract shapes, no numbers, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 134. `assets/images/items/milli/askerler.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Askerler

```
a row of clay toy soldiers. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 135. `assets/images/items/milli/cocuklar.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çocuklar

```
a group of happy children from different countries holding hands. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 136. `assets/images/items/milli/meclis.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Meclis

```
the first Grand National Assembly building in Ankara: a two-story stone building with a Turkish flag. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 137. `assets/images/items/milli/okul_binasi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Okul binası

```
a modern school building. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 138. `assets/images/items/milli/tbmm_1920.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Birinci Meclis binası

```
the first Grand National Assembly building in Ankara as a clay miniature: a two-story stone building with a Turkish flag, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 139. `assets/images/items/milli/cumhuriyet_sokak.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Cumhuriyet Bayramı süslemesi

```
a town street diorama decorated with many Turkish flags and lanterns at night, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 140. `assets/images/items/milli/cocuk_senligi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** 23 Nisan çocuk şenliği

```
children in colorful costumes dancing in a circle at a school festival with flags. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 141. `assets/images/items/milli/genclik_spor.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** 19 Mayıs gençlik ve spor gösterisi

```
young people doing a sports show in a stadium with flags. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 142. `assets/images/items/milli/fener_alayi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** 29 Ekim fener alayı

```
people walking with lanterns and Turkish flags at night. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 143. `assets/images/items/milli/zafer.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** 30 Ağustos zafer

```
a laurel wreath around a Turkish flag on a hill at sunrise. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 144. `assets/images/items/bayram/park.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Park

```
an empty playground. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 145. `assets/images/items/bayram/buyukler.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Büyükler

```
smiling grandparents sitting on a sofa. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 146. `assets/images/items/bayram/ziyaret.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Bayram ziyareti

```
a cozy grandparents' living room diorama with a family visiting, candy bowl and tea on the table, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 147. `assets/images/items/bayram/yalniz_tv.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Evde kapanmak

```
a family sitting alone watching TV with the curtains closed. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 148. `assets/images/items/bayram/paylas.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Komşuyla paylaşmak

```
a family handing a food package to a neighbor at the door. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 149. `assets/images/items/bayram/paylasim.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Bayramda paylaşmak

```
a neighborhood doorstep diorama where a family hands a food package to a neighbor, dominant palette: sunny yellow, sky blue and brick red accents. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 150. `assets/images/items/bayram/el_op.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** El öpmek

```
a cute small clay child respectfully kissing a grandfather's hand and touching it to the forehead. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 151. `assets/images/items/bayram/selamsiz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Selam vermeden geçmek

```
a cute small clay child walking past a grandfather without greeting. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 152. `assets/images/items/bayram/tablet.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tablete dalmak

```
a cute small clay child playing on a tablet in a corner during a visit. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 153. `assets/images/items/simge/kis.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kış

```
a snowy pine tree with a little snowflake. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 154. `assets/images/items/simge/yaz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yaz

```
a bright sun over a small beach umbrella. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 155. `assets/images/items/hava/kar.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kar yağışı

```
falling snowflakes over a little snowy hill. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 156. `assets/images/items/hava/kardan_adam.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kardan adam

```
a cheerful snowman with a carrot nose and scarf. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 157. `assets/images/items/hava/buz_sarkiti.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Buz sarkıtları

```
a short piece of a snowy house roof edge seen from the front, with several long clear pale-blue ice icicles hanging down from it. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 158. `assets/images/items/hava/sicak_gunes.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sıcak güneş

```
a blazing hot sun over a dry field. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 159. `assets/images/items/hava/plaj.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Plaj günü

```
a beach umbrella and a sand bucket on hot sand. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 160. `assets/images/items/hava/dondurma.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dondurma

```
an ice cream cone melting in the heat. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 161. `assets/images/items/simge/ilkbahar.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** İlkbahar

```
a little tree full of pink blossoms. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 162. `assets/images/items/simge/sonbahar.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sonbahar

```
a little tree with orange and yellow leaves falling. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 163. `assets/images/items/hava/cicek_acan_agac.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çiçek açan ağaç

```
a tree covered with fresh pink blossoms. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 164. `assets/images/items/hava/gokkusagi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yağmur ve gökkuşağı

```
a rainbow after a light spring rain with puddles. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 165. `assets/images/items/hava/yavru_kus.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yuvadaki yavru kuşlar

```
baby birds in a nest. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 166. `assets/images/items/hava/sari_yapraklar.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sararan yapraklar

```
a pile of yellow and orange fallen leaves. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 167. `assets/images/items/hava/ruzgar.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Rüzgârlı hava

```
a windy day with leaves blowing and a bent umbrella. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 168. `assets/images/items/hava/kuslar_goc.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Göç eden kuşlar

```
a flock of birds flying away in a V shape. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 169. `assets/images/items/yon/gunes_dogusu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Güneşin doğuşu

```
the sun rising over green hills in the morning, pink sky. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 170. `assets/images/items/yon/gunes_batisi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Güneşin batışı

```
the sun setting over the sea in the evening, orange sky. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 171. `assets/images/items/yon/kutup_yildizi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kutup Yıldızı

```
a bright star shining in the night sky above dark trees. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 172. `assets/images/items/yon/gunes_dogarken.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Güneş doğarken

```
a countryside diorama at sunrise with the sun peeking over the hills on one side, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 173. `assets/images/items/yon/yosunlu_agac.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Yosunlu ağaç

```
a forest diorama with a thick tree trunk that has green moss growing on only one side, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 174. `assets/images/items/kaynak/afet_gorevlisi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Afet görevlisi

```
a friendly disaster and emergency rescue worker in an orange uniform with a helmet, no text. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 175. `assets/images/items/sahne/deprem_bilgi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Depreme hazırlık köşesi

```
a classroom diorama with a table showing an emergency bag, a helmet and a whistle, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 176. `assets/images/items/kaynak/afet_brosuru.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Afet bilgi broşürü

```
a colorful folded brochure with simple pictures of an emergency bag and a house, no text. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 177. `assets/images/items/sahne/sel_bilgi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Sel tehlikesi

```
a rainy town diorama with a river rising near houses, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 178. `assets/images/items/onlem/deprem_cantasi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Deprem çantası hazırlamak

```
an emergency backpack packed with water, flashlight and first aid kit. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 179. `assets/images/items/onlem/dolap_sabitle.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dolabı duvara sabitlemek

```
a tall cupboard fixed to the wall with a metal bracket. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 180. `assets/images/items/onlem/cok_kapan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çök, kapan, tutun

```
a cute small clay child crouching under a sturdy table holding its leg. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 181. `assets/images/items/onlem/asansor.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Depremde asansöre binmek

```
a cute small clay child pressing an elevator button during shaking. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 182. `assets/images/items/onlem/merdivende_kos.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Depremde merdivenden koşmak

```
a cute small clay child running down the stairs in panic during shaking. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 183. `assets/images/items/onlem/pencereden_bak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Pencere kenarında durmak

```
a small round claymation diorama vignette: a cute small clay child standing right next to a big glass window inside a room while the room shakes, small wavy motion lines around the window (a dangerous behavior card). 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 184. `assets/images/items/tasarruf/musluk_kapat.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Musluğu kapatmak

```
a cute small clay child turning off the tap while brushing teeth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 185. `assets/images/items/tasarruf/musluk_acik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Musluğu açık bırakmak

```
a tap left running with water flowing away. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 186. `assets/images/items/sahne/dis_fircalarken.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Diş fırçalarken akan su

```
a bathroom diorama with a tap running water into the sink and a toothbrush cup, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 187. `assets/images/items/tasarruf/isik_kapat.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Işığı kapatmak

```
a small round claymation diorama vignette: a cute small clay child pressing a light switch on the wall next to an open doorway while leaving a small room, the ceiling lamp turning off. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 188. `assets/images/items/tasarruf/isik_acik_birak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Işığı açık bırakmak

```
a cute small clay child leaving a room with the light still on. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 189. `assets/images/items/tasarruf/tum_isiklar.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bütün ışıkları açmak

```
a small round claymation diorama vignette: a cute small clay child in a small room where every lamp is switched on at the same time: a ceiling lamp, a desk lamp and a floor lamp all glowing. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 190. `assets/images/items/sahne/isik_acik_oda.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Işığı açık boş oda

```
an empty child's room diorama with all the lights on and the door open, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 191. `assets/images/items/simge/tasarruf.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tasarruflu

```
a water drop and a light bulb inside a cupped green leaf, symbol of saving resources. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 192. `assets/images/items/simge/israf.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** İsraf

```
a leaking dripping tap with a puddle and a drooping light bulb, symbol of waste. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 193. `assets/images/items/tasarruf/kagit_iki_yuz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kâğıdın iki yüzünü kullanmak

```
a small round claymation diorama vignette: a cute small clay child at a small desk drawing with a crayon on the blank back of a sheet of paper, the other side of the paper showing old scribbles. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 194. `assets/images/items/tasarruf/bez_canta.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bez çanta kullanmak

```
a cute small clay child carrying shopping in a cloth bag. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 195. `assets/images/items/tasarruf/kagit_ziyan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Boş kâğıdı atmak

```
a cute small clay child crumpling a nearly empty paper and throwing it away. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 196. `assets/images/items/tasarruf/cok_poset.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çok poşet kullanmak

```
a cute small clay child carrying many plastic bags for a few items. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 197. `assets/images/items/kaynak/kutuphane.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kütüphane

```
a cozy library building with bookshelves seen through a big window. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 198. `assets/images/items/kaynak/yemek_kitabi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yemek kitabı

```
a closed cookbook with a colorful cake picture on its cover, the book cover is bright orange, no letters. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 199. `assets/images/items/kaynak/aileyle_internet.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ailesiyle internetten araştırmak

```
a parent and a child searching together on a laptop. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 200. `assets/images/items/kaynak/yalniz_internet.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tek başına rastgele dokunmak

```
a cute small clay child alone clicking many flashing pop-up windows on a laptop. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 201. `assets/images/items/kaynak/reklam.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Reklama dokunmak

```
a laptop showing a big flashing advertisement banner with a toy, no text. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 202. `assets/images/items/tek/telefon_cevirmeli.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çevirmeli telefon

```
an old rotary dial telephone, no digits. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 203. `assets/images/items/tek/telefon_tuslu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tuşlu cep telefonu

```
a 1990s push button mobile phone with blank buttons, no digits. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 204. `assets/images/items/tek/telefon_akilli.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Akıllı telefon

```
a modern smartphone with a blank glowing screen. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 205. `assets/images/items/tek/mum.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Mum

```
a lit candle on a holder. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 206. `assets/images/items/tek/gaz_lambasi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Gaz lambası

```
an old oil lamp with a glass chimney. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 207. `assets/images/items/tek/ampul.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ampul

```
a glowing old style light bulb. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 208. `assets/images/items/tek/led.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** LED lamba

```
a modern flat LED lamp. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 209. `assets/images/items/tek/telefon_gelecek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Geleceğin telefonu

```
a futuristic thin foldable see-through phone projecting a small light hologram. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 210. `assets/images/items/tek/telefon_dev.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kocaman ağır telefon

```
a huge heavy brick-like old phone with a long antenna. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 211. `assets/images/items/tek/telefon_zaman.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sahne: Telefonların değişimi

```
a museum shelf diorama with old phones from rotary to smartphone in a row, dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 212. `assets/images/items/sanat/muzik_yapan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Müzik yapan çocuk

```
a cute small clay child playing a bağlama happily. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 213. `assets/images/items/simge/muzik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Müzik

```
a single big chunky eighth music note symbol: a round black-purple oval note head, a straight upright stem and one curved flag at the top. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 214. `assets/images/items/simge/resim.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Resim

```
a painter's palette with blobs of paint and a brush. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 215. `assets/images/items/sanat/baglama.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bağlama

```
a Turkish bağlama (saz): a small pear-shaped wooden body, a very long thin straight neck about twice as long as the body with frets, and wooden tuning pegs on the side of the head, three pairs of strings. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 216. `assets/images/items/sanat/davul.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Davul

```
a traditional Turkish davul drum with a stick. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 217. `assets/images/items/sanat/flut.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Flüt

```
a recorder flute. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 218. `assets/images/items/sanat/firca.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Fırça

```
paint brushes in a jar. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 219. `assets/images/items/sanat/tuval.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tuval

```
a painting easel with a colorful landscape painting. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 220. `assets/images/items/sanat/ebru.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ebru

```
a colorful marbled ebru paper art with swirls and flowers. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 221. `assets/images/items/simge/tiyatro.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tiyatro

```
two theater masks, one smiling and one sad but cute. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 222. `assets/images/items/sanat/kukla.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kukla

```
a cute hand puppet. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 223. `assets/images/items/sanat/sahne_perdesi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tiyatro sahnesi

```
a small theater stage with red curtains. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, big expressive eyes where applicable, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```


---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı (küçük harf, Türkçe karakter yok)
- [ ] Sprite'larda arka plan silindi, şeffaf PNG; sahneler (16:9) arka planlı kalır
- [ ] Görselde yazı, harf ya da rakam yok
- [ ] Stil önceki partilerle tutarlı (yan yana koyup bak)
- [ ] Commit: `assets: 081 081 hb g2 gorseller`
