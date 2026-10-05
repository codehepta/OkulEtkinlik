# 072 · Türkçe kart sözcükleri seslendirmesi (2–3. sınıf)

**Öncelik: ORTA** (Faz 4c). Eşleştirme (`drag_match`) kartlarındaki sözcükler ve sınıflama (`sort_bins`) kutu etiketleri. Kartlar birden çok ünitede ortak kullanılır; her sözcük bir kez kaydedilir. Sessiz okuma turlarında bu sesler ilk cevaptan sonra açılır.

> Bu dosya eklenmeden de oyun çalışır: eksik satırları cihazın Türkçe sesiyle okur. Gerçek kayıtlar geldiğinde kalite çok artar.

## Nasıl üretilir
1. **Google AI Studio → "Generate speech"** (Gemini TTS) ekranını aç. Çoklu konuşmacı modunu kapat, tek konuşmacı kullan.
2. **Ses seçimi:** 005'in en altındaki "Seçilen sesler" bölümüne yazdığın **aynı iki sesi** kullan (Anlatıcı ve Bilge).
3. Her satır için konuşmacının **üslup talimatını** "Style instructions / system" kısmına, **Metin** alanını konuşma metnine yapıştır.
4. Çıktıyı (`.wav`) **Dosya yolu** sütunundaki isimle kaydet. Klasörler yoksa oluştur. `.wav` kabul edilir; istersen `.ogg`'ye çevirebilirsin (mono, 22–44 kHz).
5. Dinleyip kontrol et: Türkçe telaffuz doğru mu, tempo çocuk için yeterince yavaş mı?

## Ortak üslup talimatları
- **ANLATICI:** `Sıcak, sakin ve net bir sesle, 7-9 yaşındaki bir çocuğa konuşur gibi, yavaş ve anlaşılır oku. Kelimeleri tane tane söyle, cümle sonlarında kısa bir duraklama yap.`
- **BILGE:** `Neşeli, sevimli ve enerjik bir çizgi film karakteri gibi konuş. Gülümseyerek, coşkulu ama anlaşılır ve çok hızlı olmayan bir tempoyla söyle.`

Ek not: Her kartı tek başına, net ve doğal bir vurguyla oku. Soru eki kartlarını ("mı?", "mi?") soru tonlamasıyla, kısaltmaları yazıldığı gibi harf harf değil okunduğu gibi söyle ("TDK" → "te-de-ka"); kesme işaretli ek kartlarını ("'ye") yalnızca ekin sesiyle oku.

## Satırlar

| # | Kimlik (anahtar) | Dosya yolu | Konuşmacı | Metin |
|---|---|---|---|---|
| 1 | `vo.tk.ece` | `assets/audio/voice/tk/ece.wav` | ANLATICI | Ece |
| 2 | `vo.tk.mert` | `assets/audio/voice/tk/mert.wav` | ANLATICI | Mert |
| 3 | `vo.tk.buyuk` | `assets/audio/voice/tk/buyuk.wav` | ANLATICI | büyük |
| 4 | `vo.tk.kucuk` | `assets/audio/voice/tk/kucuk.wav` | ANLATICI | küçük |
| 5 | `vo.tk.sicak` | `assets/audio/voice/tk/sicak.wav` | ANLATICI | sıcak |
| 6 | `vo.tk.soguk` | `assets/audio/voice/tk/soguk.wav` | ANLATICI | soğuk |
| 7 | `vo.tk.uzun` | `assets/audio/voice/tk/uzun.wav` | ANLATICI | uzun |
| 8 | `vo.tk.kisa` | `assets/audio/voice/tk/kisa.wav` | ANLATICI | kısa |
| 9 | `vo.tk.dogru` | `assets/audio/voice/tk/dogru.wav` | ANLATICI | Doğru |
| 10 | `vo.tk.yanlis` | `assets/audio/voice/tk/yanlis.wav` | ANLATICI | Yanlış |
| 11 | `vo.tk.kedi_uyudu` | `assets/audio/voice/tk/kedi_uyudu.wav` | ANLATICI | Kedi uyudu |
| 12 | `vo.tk.mu` | `assets/audio/voice/tk/mu.wav` | ANLATICI | mu? |
| 13 | `vo.tk.elma_tatli` | `assets/audio/voice/tk/elma_tatli.wav` | ANLATICI | Elma tatlı |
| 14 | `vo.tk.mi` | `assets/audio/voice/tk/mi.wav` | ANLATICI | mı? |
| 15 | `vo.tk.bu_senin` | `assets/audio/voice/tk/bu_senin.wav` | ANLATICI | Bu senin |
| 16 | `vo.tk.mi_2` | `assets/audio/voice/tk/mi_2.wav` | ANLATICI | mi? |
| 17 | `vo.tk.okul_buyuk` | `assets/audio/voice/tk/okul_buyuk.wav` | ANLATICI | Okul büyük |
| 18 | `vo.tk.mu_2` | `assets/audio/voice/tk/mu_2.wav` | ANLATICI | mü? |
| 19 | `vo.tk.kg` | `assets/audio/voice/tk/kg.wav` | ANLATICI | kg |
| 20 | `vo.tk.kilogram` | `assets/audio/voice/tk/kilogram.wav` | ANLATICI | kilogram |
| 21 | `vo.tk.dr` | `assets/audio/voice/tk/dr.wav` | ANLATICI | Dr. |
| 22 | `vo.tk.doktor` | `assets/audio/voice/tk/doktor.wav` | ANLATICI | doktor |
| 23 | `vo.tk.tdk` | `assets/audio/voice/tk/tdk.wav` | ANLATICI | TDK |
| 24 | `vo.tk.turk_dil_kurumu` | `assets/audio/voice/tk/turk_dil_kurumu.wav` | ANLATICI | Türk Dil Kurumu |
| 25 | `vo.tk.kisi_adi` | `assets/audio/voice/tk/kisi_adi.wav` | ANLATICI | Kişi adı |
| 26 | `vo.tk.elif` | `assets/audio/voice/tk/elif.wav` | ANLATICI | Elif |
| 27 | `vo.tk.sehir_adi` | `assets/audio/voice/tk/sehir_adi.wav` | ANLATICI | Şehir adı |
| 28 | `vo.tk.bursa` | `assets/audio/voice/tk/bursa.wav` | ANLATICI | Bursa |
| 29 | `vo.tk.ulke_adi` | `assets/audio/voice/tk/ulke_adi.wav` | ANLATICI | Ülke adı |
| 30 | `vo.tk.turkiye` | `assets/audio/voice/tk/turkiye.wav` | ANLATICI | Türkiye |
| 31 | `vo.tk.mustafa` | `assets/audio/voice/tk/mustafa.wav` | ANLATICI | Mustafa |
| 32 | `vo.tk.zeynep` | `assets/audio/voice/tk/zeynep.wav` | ANLATICI | Zeynep |
| 33 | `vo.tk.caliskan_2` | `assets/audio/voice/tk/caliskan_2.wav` | ANLATICI | çalışkan |
| 34 | `vo.tk.tembel_2` | `assets/audio/voice/tk/tembel_2.wav` | ANLATICI | tembel |
| 35 | `vo.tk.erken` | `assets/audio/voice/tk/erken.wav` | ANLATICI | erken |
| 36 | `vo.tk.gec` | `assets/audio/voice/tk/gec.wav` | ANLATICI | geç |
| 37 | `vo.tk.mutlu` | `assets/audio/voice/tk/mutlu.wav` | ANLATICI | mutlu |
| 38 | `vo.tk.uzgun` | `assets/audio/voice/tk/uzgun.wav` | ANLATICI | üzgün |
| 39 | `vo.tk.bayrak_asildi` | `assets/audio/voice/tk/bayrak_asildi.wav` | ANLATICI | Bayrak asıldı |
| 40 | `vo.tk.siir_guzel` | `assets/audio/voice/tk/siir_guzel.wav` | ANLATICI | Şiir güzel |
| 41 | `vo.tk.toren_uzun` | `assets/audio/voice/tk/toren_uzun.wav` | ANLATICI | Tören uzun |
| 42 | `vo.tk.fidan_buyudu` | `assets/audio/voice/tk/fidan_buyudu.wav` | ANLATICI | Fidan büyüdü |
| 43 | `vo.tk.cad` | `assets/audio/voice/tk/cad.wav` | ANLATICI | Cad. |
| 44 | `vo.tk.cadde` | `assets/audio/voice/tk/cadde.wav` | ANLATICI | cadde |
| 45 | `vo.tk.sok` | `assets/audio/voice/tk/sok.wav` | ANLATICI | Sok. |
| 46 | `vo.tk.sokak` | `assets/audio/voice/tk/sokak.wav` | ANLATICI | sokak |
| 47 | `vo.tk.no` | `assets/audio/voice/tk/no.wav` | ANLATICI | No. |
| 48 | `vo.tk.numara` | `assets/audio/voice/tk/numara.wav` | ANLATICI | numara |
| 49 | `vo.tk.zubeyde` | `assets/audio/voice/tk/zubeyde.wav` | ANLATICI | Zübeyde |
| 50 | `vo.tk.ankara` | `assets/audio/voice/tk/ankara.wav` | ANLATICI | Ankara |
| 51 | `vo.tk.pitir` | `assets/audio/voice/tk/pitir.wav` | ANLATICI | Pıtır |
| 52 | `vo.tk.damla` | `assets/audio/voice/tk/damla.wav` | ANLATICI | Damla |
| 53 | `vo.tk.yaz` | `assets/audio/voice/tk/yaz.wav` | ANLATICI | yaz |
| 54 | `vo.tk.kis` | `assets/audio/voice/tk/kis.wav` | ANLATICI | kış |
| 55 | `vo.tk.gece` | `assets/audio/voice/tk/gece.wav` | ANLATICI | gece |
| 56 | `vo.tk.gunduz` | `assets/audio/voice/tk/gunduz.wav` | ANLATICI | gündüz |
| 57 | `vo.tk.islak` | `assets/audio/voice/tk/islak.wav` | ANLATICI | ıslak |
| 58 | `vo.tk.kuru` | `assets/audio/voice/tk/kuru.wav` | ANLATICI | kuru |
| 59 | `vo.tk.kar_yagdi` | `assets/audio/voice/tk/kar_yagdi.wav` | ANLATICI | Kar yağdı |
| 60 | `vo.tk.agac_yesil` | `assets/audio/voice/tk/agac_yesil.wav` | ANLATICI | Ağaç yeşil |
| 61 | `vo.tk.kus_uctu` | `assets/audio/voice/tk/kus_uctu.wav` | ANLATICI | Kuş uçtu |
| 62 | `vo.tk.gol_buyuk` | `assets/audio/voice/tk/gol_buyuk.wav` | ANLATICI | Göl büyük |
| 63 | `vo.tk.km` | `assets/audio/voice/tk/km.wav` | ANLATICI | km |
| 64 | `vo.tk.kilometre` | `assets/audio/voice/tk/kilometre.wav` | ANLATICI | kilometre |
| 65 | `vo.tk.m` | `assets/audio/voice/tk/m.wav` | ANLATICI | m |
| 66 | `vo.tk.metre` | `assets/audio/voice/tk/metre.wav` | ANLATICI | metre |
| 67 | `vo.tk.dag_adi` | `assets/audio/voice/tk/dag_adi.wav` | ANLATICI | Dağ adı |
| 68 | `vo.tk.agri` | `assets/audio/voice/tk/agri.wav` | ANLATICI | Ağrı |
| 69 | `vo.tk.nehir_adi` | `assets/audio/voice/tk/nehir_adi.wav` | ANLATICI | Nehir adı |
| 70 | `vo.tk.firat` | `assets/audio/voice/tk/firat.wav` | ANLATICI | Fırat |
| 71 | `vo.tk.gol_adi` | `assets/audio/voice/tk/gol_adi.wav` | ANLATICI | Göl adı |
| 72 | `vo.tk.van` | `assets/audio/voice/tk/van.wav` | ANLATICI | Van |
| 73 | `vo.tk.gercek` | `assets/audio/voice/tk/gercek.wav` | ANLATICI | Gerçek |
| 74 | `vo.tk.hayal` | `assets/audio/voice/tk/hayal.wav` | ANLATICI | Hayal |
| 75 | `vo.tk.acik` | `assets/audio/voice/tk/acik.wav` | ANLATICI | açık |
| 76 | `vo.tk.kapali` | `assets/audio/voice/tk/kapali.wav` | ANLATICI | kapalı |
| 77 | `vo.tk.kolay` | `assets/audio/voice/tk/kolay.wav` | ANLATICI | kolay |
| 78 | `vo.tk.zor` | `assets/audio/voice/tk/zor.wav` | ANLATICI | zor |
| 79 | `vo.tk.ince` | `assets/audio/voice/tk/ince.wav` | ANLATICI | ince |
| 80 | `vo.tk.kalin` | `assets/audio/voice/tk/kalin.wav` | ANLATICI | kalın |
| 81 | `vo.tk.kitap_kalin` | `assets/audio/voice/tk/kitap_kalin.wav` | ANLATICI | Kitap kalın |
| 82 | `vo.tk.masal_bitti` | `assets/audio/voice/tk/masal_bitti.wav` | ANLATICI | Masal bitti |
| 83 | `vo.tk.raf_dolu` | `assets/audio/voice/tk/raf_dolu.wav` | ANLATICI | Raf dolu |
| 84 | `vo.tk.kitap_kucuk` | `assets/audio/voice/tk/kitap_kucuk.wav` | ANLATICI | Kitap küçük |
| 85 | `vo.tk.keloglan` | `assets/audio/voice/tk/keloglan.wav` | ANLATICI | Keloğlan |
| 86 | `vo.tk.konya` | `assets/audio/voice/tk/konya.wav` | ANLATICI | Konya |
| 87 | `vo.tk.deniz` | `assets/audio/voice/tk/deniz.wav` | ANLATICI | Deniz |
| 88 | `vo.tk.hizli` | `assets/audio/voice/tk/hizli.wav` | ANLATICI | hızlı |
| 89 | `vo.tk.yavas` | `assets/audio/voice/tk/yavas.wav` | ANLATICI | yavaş |
| 90 | `vo.tk.sesli` | `assets/audio/voice/tk/sesli.wav` | ANLATICI | sesli |
| 91 | `vo.tk.sessiz` | `assets/audio/voice/tk/sessiz.wav` | ANLATICI | sessiz |
| 92 | `vo.tk.resim_bitti` | `assets/audio/voice/tk/resim_bitti.wav` | ANLATICI | Resim bitti |
| 93 | `vo.tk.sahne_hazir` | `assets/audio/voice/tk/sahne_hazir.wav` | ANLATICI | Sahne hazır |
| 94 | `vo.tk.oyun_uzun` | `assets/audio/voice/tk/oyun_uzun.wav` | ANLATICI | Oyun uzun |
| 95 | `vo.tk.davul_buyuk` | `assets/audio/voice/tk/davul_buyuk.wav` | ANLATICI | Davul büyük |
| 96 | `vo.tk.izmir` | `assets/audio/voice/tk/izmir.wav` | ANLATICI | İzmir |
| 97 | `vo.tk.japonya` | `assets/audio/voice/tk/japonya.wav` | ANLATICI | Japonya |
| 98 | `vo.tk.yuzer` | `assets/audio/voice/tk/yuzer.wav` | ANLATICI | Yüzer |
| 99 | `vo.tk.batar` | `assets/audio/voice/tk/batar.wav` | ANLATICI | Batar |
| 100 | `vo.tk.eski` | `assets/audio/voice/tk/eski.wav` | ANLATICI | eski |
| 101 | `vo.tk.yeni` | `assets/audio/voice/tk/yeni.wav` | ANLATICI | yeni |
| 102 | `vo.tk.bos` | `assets/audio/voice/tk/bos.wav` | ANLATICI | boş |
| 103 | `vo.tk.dolu` | `assets/audio/voice/tk/dolu.wav` | ANLATICI | dolu |
| 104 | `vo.tk.robot_hazir` | `assets/audio/voice/tk/robot_hazir.wav` | ANLATICI | Robot hazır |
| 105 | `vo.tk.saat_bozuk` | `assets/audio/voice/tk/saat_bozuk.wav` | ANLATICI | Saat bozuk |
| 106 | `vo.tk.deney_bitti` | `assets/audio/voice/tk/deney_bitti.wav` | ANLATICI | Deney bitti |
| 107 | `vo.tk.isik_sondu` | `assets/audio/voice/tk/isik_sondu.wav` | ANLATICI | Işık söndü |
| 108 | `vo.tk.arda` | `assets/audio/voice/tk/arda.wav` | ANLATICI | Arda |
| 109 | `vo.tk.almanya` | `assets/audio/voice/tk/almanya.wav` | ANLATICI | Almanya |
| 110 | `vo.tk.hoca` | `assets/audio/voice/tk/hoca.wav` | ANLATICI | Hoca |
| 111 | `vo.tk.ayse` | `assets/audio/voice/tk/ayse.wav` | ANLATICI | Ayşe |
| 112 | `vo.tk.genc` | `assets/audio/voice/tk/genc.wav` | ANLATICI | genç |
| 113 | `vo.tk.yasli` | `assets/audio/voice/tk/yasli.wav` | ANLATICI | yaşlı |
| 114 | `vo.tk.gelmek` | `assets/audio/voice/tk/gelmek.wav` | ANLATICI | gelmek |
| 115 | `vo.tk.gitmek` | `assets/audio/voice/tk/gitmek.wav` | ANLATICI | gitmek |
| 116 | `vo.tk.neseli` | `assets/audio/voice/tk/neseli.wav` | ANLATICI | neşeli |
| 117 | `vo.tk.ebru` | `assets/audio/voice/tk/ebru.wav` | ANLATICI | Ebru |
| 118 | `vo.tk.hali` | `assets/audio/voice/tk/hali.wav` | ANLATICI | Halı |
| 119 | `vo.tk.bayram_geldi` | `assets/audio/voice/tk/bayram_geldi.wav` | ANLATICI | Bayram geldi |
| 120 | `vo.tk.hali_yumusak` | `assets/audio/voice/tk/hali_yumusak.wav` | ANLATICI | Halı yumuşak |
| 121 | `vo.tk.ebru_kurudu` | `assets/audio/voice/tk/ebru_kurudu.wav` | ANLATICI | Ebru kurudu |
| 122 | `vo.tk.kazan_buyuk` | `assets/audio/voice/tk/kazan_buyuk.wav` | ANLATICI | Kazan büyük |
| 123 | `vo.tk.erciyes` | `assets/audio/voice/tk/erciyes.wav` | ANLATICI | Erciyes |
| 124 | `vo.tk.oyku` | `assets/audio/voice/tk/oyku.wav` | ANLATICI | Öykü |
| 125 | `vo.tk.hasta` | `assets/audio/voice/tk/hasta.wav` | ANLATICI | hasta |
| 126 | `vo.tk.saglikli` | `assets/audio/voice/tk/saglikli.wav` | ANLATICI | sağlıklı |
| 127 | `vo.tk.dogru_2` | `assets/audio/voice/tk/dogru_2.wav` | ANLATICI | doğru |
| 128 | `vo.tk.yanlis_2` | `assets/audio/voice/tk/yanlis_2.wav` | ANLATICI | yanlış |
| 129 | `vo.tk.temiz` | `assets/audio/voice/tk/temiz.wav` | ANLATICI | temiz |
| 130 | `vo.tk.kirli` | `assets/audio/voice/tk/kirli.wav` | ANLATICI | kirli |
| 131 | `vo.tk.hak` | `assets/audio/voice/tk/hak.wav` | ANLATICI | Hak |
| 132 | `vo.tk.gorev` | `assets/audio/voice/tk/gorev.wav` | ANLATICI | Görev |
| 133 | `vo.tk.oyun_bitti` | `assets/audio/voice/tk/oyun_bitti.wav` | ANLATICI | Oyun bitti |
| 134 | `vo.tk.kapi_acik` | `assets/audio/voice/tk/kapi_acik.wav` | ANLATICI | Kapı açık |
| 135 | `vo.tk.odev_uzun` | `assets/audio/voice/tk/odev_uzun.wav` | ANLATICI | Ödev uzun |
| 136 | `vo.tk.bu_duduk` | `assets/audio/voice/tk/bu_duduk.wav` | ANLATICI | Bu düdük |
| 137 | `vo.tk.kerem` | `assets/audio/voice/tk/kerem.wav` | ANLATICI | Kerem |
| 138 | `vo.tk.trabzon` | `assets/audio/voice/tk/trabzon.wav` | ANLATICI | Trabzon |
| 139 | `vo.tk.italya` | `assets/audio/voice/tk/italya.wav` | ANLATICI | İtalya |
| 140 | `vo.tk.emir` | `assets/audio/voice/tk/emir.wav` | ANLATICI | Emir |
| 141 | `vo.tk.armagan` | `assets/audio/voice/tk/armagan.wav` | ANLATICI | armağan |
| 142 | `vo.tk.hediye` | `assets/audio/voice/tk/hediye.wav` | ANLATICI | hediye |
| 143 | `vo.tk.ogrenci` | `assets/audio/voice/tk/ogrenci.wav` | ANLATICI | öğrenci |
| 144 | `vo.tk.talebe` | `assets/audio/voice/tk/talebe.wav` | ANLATICI | talebe |
| 145 | `vo.tk.cevap` | `assets/audio/voice/tk/cevap.wav` | ANLATICI | cevap |
| 146 | `vo.tk.yanit` | `assets/audio/voice/tk/yanit.wav` | ANLATICI | yanıt |
| 147 | `vo.tk.mecaz` | `assets/audio/voice/tk/mecaz.wav` | ANLATICI | Mecaz |
| 148 | `vo.tk.tbmm` | `assets/audio/voice/tk/tbmm.wav` | ANLATICI | TBMM |
| 149 | `vo.tk.ye` | `assets/audio/voice/tk/ye.wav` | ANLATICI | 'ye |
| 150 | `vo.tk.ya` | `assets/audio/voice/tk/ya.wav` | ANLATICI | 'ya |
| 151 | `vo.tk.tubitak` | `assets/audio/voice/tk/tubitak.wav` | ANLATICI | TÜBİTAK |
| 152 | `vo.tk.a` | `assets/audio/voice/tk/a.wav` | ANLATICI | 'a |
| 153 | `vo.tk.fidan` | `assets/audio/voice/tk/fidan.wav` | ANLATICI | Fidan |
| 154 | `vo.tk.cesur` | `assets/audio/voice/tk/cesur.wav` | ANLATICI | cesur |
| 155 | `vo.tk.korkak_2` | `assets/audio/voice/tk/korkak_2.wav` | ANLATICI | korkak |
| 156 | `vo.tk.guclu` | `assets/audio/voice/tk/guclu.wav` | ANLATICI | güçlü |
| 157 | `vo.tk.zayif` | `assets/audio/voice/tk/zayif.wav` | ANLATICI | zayıf |
| 158 | `vo.tk.agir` | `assets/audio/voice/tk/agir.wav` | ANLATICI | ağır |
| 159 | `vo.tk.hafif` | `assets/audio/voice/tk/hafif.wav` | ANLATICI | hafif |
| 160 | `vo.tk.ne_zaman_geldin` | `assets/audio/voice/tk/ne_zaman_geldin.wav` | ANLATICI | Ne zaman geldin |
| 161 | `vo.tk.x` | `assets/audio/voice/tk/x.wav` | ANLATICI | ? |
| 162 | `vo.tk.yasasin_bayram` | `assets/audio/voice/tk/yasasin_bayram.wav` | ANLATICI | Yaşasın bayram |
| 163 | `vo.tk.x_2` | `assets/audio/voice/tk/x_2.wav` | ANLATICI | ! |
| 164 | `vo.tk.bayragi_astik` | `assets/audio/voice/tk/bayragi_astik.wav` | ANLATICI | Bayrağı astık |
| 165 | `vo.tk.x_3` | `assets/audio/voice/tk/x_3.wav` | ANLATICI | . |
| 166 | `vo.tk.de` | `assets/audio/voice/tk/de.wav` | ANLATICI | 'de |
| 167 | `vo.tk.da` | `assets/audio/voice/tk/da.wav` | ANLATICI | 'da |
| 168 | `vo.tk.ta` | `assets/audio/voice/tk/ta.wav` | ANLATICI | 'ta |
| 169 | `vo.tk.erzurum` | `assets/audio/voice/tk/erzurum.wav` | ANLATICI | Erzurum |
| 170 | `vo.tk.doga` | `assets/audio/voice/tk/doga.wav` | ANLATICI | doğa |
| 171 | `vo.tk.tabiat` | `assets/audio/voice/tk/tabiat.wav` | ANLATICI | tabiat |
| 172 | `vo.tk.irmak` | `assets/audio/voice/tk/irmak.wav` | ANLATICI | ırmak |
| 173 | `vo.tk.nehir` | `assets/audio/voice/tk/nehir.wav` | ANLATICI | nehir |
| 174 | `vo.tk.siyah` | `assets/audio/voice/tk/siyah.wav` | ANLATICI | siyah |
| 175 | `vo.tk.kara` | `assets/audio/voice/tk/kara.wav` | ANLATICI | kara |
| 176 | `vo.tk.kis_2` | `assets/audio/voice/tk/kis_2.wav` | ANLATICI | Kış |
| 177 | `vo.tk.yaz_2` | `assets/audio/voice/tk/yaz_2.wav` | ANLATICI | Yaz |
| 178 | `vo.tk.dan` | `assets/audio/voice/tk/dan.wav` | ANLATICI | 'dan |
| 179 | `vo.tk.kedi_adi` | `assets/audio/voice/tk/kedi_adi.wav` | ANLATICI | Kedi adı |
| 180 | `vo.tk.pamuk` | `assets/audio/voice/tk/pamuk.wav` | ANLATICI | Pamuk |
| 181 | `vo.tk.ela` | `assets/audio/voice/tk/ela.wav` | ANLATICI | Ela |
| 182 | `vo.tk.kuzey` | `assets/audio/voice/tk/kuzey.wav` | ANLATICI | Kuzey |
| 183 | `vo.tk.soru` | `assets/audio/voice/tk/soru.wav` | ANLATICI | soru |
| 184 | `vo.tk.selin` | `assets/audio/voice/tk/selin.wav` | ANLATICI | Selin |
| 185 | `vo.tk.yusuf` | `assets/audio/voice/tk/yusuf.wav` | ANLATICI | Yusuf |
| 186 | `vo.tk.trt` | `assets/audio/voice/tk/trt.wav` | ANLATICI | TRT |
| 187 | `vo.tk.tan` | `assets/audio/voice/tk/tan.wav` | ANLATICI | 'tan |
| 188 | `vo.tk.defne` | `assets/audio/voice/tk/defne.wav` | ANLATICI | Defne |
| 189 | `vo.tk.spor` | `assets/audio/voice/tk/spor.wav` | ANLATICI | Spor |
| 190 | `vo.tk.muzik` | `assets/audio/voice/tk/muzik.wav` | ANLATICI | Müzik |
| 191 | `vo.tk.sinop` | `assets/audio/voice/tk/sinop.wav` | ANLATICI | Sinop |
| 192 | `vo.tk.derin` | `assets/audio/voice/tk/derin.wav` | ANLATICI | derin |
| 193 | `vo.tk.sig` | `assets/audio/voice/tk/sig.wav` | ANLATICI | sığ |
| 194 | `vo.tk.karanlik` | `assets/audio/voice/tk/karanlik.wav` | ANLATICI | karanlık |
| 195 | `vo.tk.aydinlik` | `assets/audio/voice/tk/aydinlik.wav` | ANLATICI | aydınlık |
| 196 | `vo.tk.hava_guzel` | `assets/audio/voice/tk/hava_guzel.wav` | ANLATICI | Hava güzel |
| 197 | `vo.tk.saat_kac` | `assets/audio/voice/tk/saat_kac.wav` | ANLATICI | Saat kaç |
| 198 | `vo.tk.yasasin` | `assets/audio/voice/tk/yasasin.wav` | ANLATICI | Yaşasın |
| 199 | `vo.tk.kaan` | `assets/audio/voice/tk/kaan.wav` | ANLATICI | Kaan |
| 200 | `vo.tk.ada` | `assets/audio/voice/tk/ada.wav` | ANLATICI | Ada |
| 201 | `vo.tk.cahit` | `assets/audio/voice/tk/cahit.wav` | ANLATICI | Cahit |
| 202 | `vo.tk.asli` | `assets/audio/voice/tk/asli.wav` | ANLATICI | Aslı |
| 203 | `vo.tk.murat` | `assets/audio/voice/tk/murat.wav` | ANLATICI | Murat |
| 204 | `vo.tk.misafir` | `assets/audio/voice/tk/misafir.wav` | ANLATICI | misafir |
| 205 | `vo.tk.konuk` | `assets/audio/voice/tk/konuk.wav` | ANLATICI | konuk |
| 206 | `vo.tk.kent` | `assets/audio/voice/tk/kent.wav` | ANLATICI | kent |
| 207 | `vo.tk.sehir` | `assets/audio/voice/tk/sehir.wav` | ANLATICI | şehir |
| 208 | `vo.tk.ihtiyar` | `assets/audio/voice/tk/ihtiyar.wav` | ANLATICI | ihtiyar |
| 209 | `vo.tk.nehir_2` | `assets/audio/voice/tk/nehir_2.wav` | ANLATICI | Nehir |
| 210 | `vo.tk.bayram_adi` | `assets/audio/voice/tk/bayram_adi.wav` | ANLATICI | Bayram adı |
| 211 | `vo.tk.kurban_bayrami` | `assets/audio/voice/tk/kurban_bayrami.wav` | ANLATICI | Kurban Bayramı |
| 212 | `vo.tk.bahce_temiz_mi` | `assets/audio/voice/tk/bahce_temiz_mi.wav` | ANLATICI | Bahçe temiz mi |
| 213 | `vo.tk.eyvah` | `assets/audio/voice/tk/eyvah.wav` | ANLATICI | Eyvah |
| 214 | `vo.tk.copler_kutuda` | `assets/audio/voice/tk/copler_kutuda.wav` | ANLATICI | Çöpler kutuda |
| 215 | `vo.tk.emre` | `assets/audio/voice/tk/emre.wav` | ANLATICI | Emre |
| 216 | `vo.tk.rize` | `assets/audio/voice/tk/rize.wav` | ANLATICI | Rize |
| 217 | `vo.tk.misir` | `assets/audio/voice/tk/misir.wav` | ANLATICI | Mısır |

---
## Teslim kontrol listesi
- [ ] Dosya adları kimlikle birebir aynı (Türkçe karakter yok)
- [ ] Ses başında ve sonunda uzun sessizlik yok (gerekirse kırp)
- [ ] 005'teki aynı iki ses kullanıldı
- [ ] Commit: `assets: 072 türkçe kart sözcükleri`
