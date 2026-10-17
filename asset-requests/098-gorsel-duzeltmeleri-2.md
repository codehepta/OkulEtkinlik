# 098 · Görsel düzeltmeleri 2 (içerik denetimi)

**Öncelik: YÜKSEK.** 2026-10-12 içerik denetiminde (1.258 tur, `build/review/BIRLESIK_BULGULAR.md`) metni, sesi ya da soruyu tutmayan, birbirine çok benzeyen ya da ne olduğu anlaşılmayan görseller. Var olan dosyaların yerine geçenler `generate.py --force` ile üretilir; yeni anahtarlar içerikte bu partiyle birlikte kullanılmaya başladı.

- Kural: cansız nesnelerde yüz yok (`docs/assets/style-guide.md` §1.7); promptlarda göz cümlesi yok, cansızlarda "It has no face" var.
- Görsellerde yazı, harf, rakam yok. Para değerleri oyunda kodla etiketlenir.
- `item.cisim.dikdortgen_prizma` bu partide değil: Blender'da yeni ölçüyle (2,2 × 1,4 × 0,6) yeniden çizildi.

## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/items/davranis/siraya_ciz.png` | 1:1 | — | Sınıfta bir çocuk, kâğıt olmadan doğrudan sıranın yüzeyine kalemle karalıyor; sıra üstü renkli çizgilerle dolu. |
| 2 | `assets/images/items/gorev/ocakta_yemek.png` | 1:1 | — | Yetişkin bir kadın (anne), uzun boylu, yetişkin yüz ve oranlarla, ocakta tencerede yemek karıştırıyor. |
| 3 | `assets/images/items/sahne/aile_is_bolumu.png` | 16:9 | — | Yemek bitmiş: masa yarı toplanmış; anne tabakları tezgâha taşıyor, baba masayı siliyor, küçük kardeş bardak siliyor; bir sandalye boş (oyuncu için). |
| 4 | `assets/images/items/davranis/sirada_bekle.png` | 1:1 | — | Dört çocuk yandan görünüşte, tek sıra hâlinde art arda bekliyor (kuyruk). |
| 5 | `assets/images/items/trafik/top_pesinden.png` | 1:1 | — | Çocuk kaldırımdan yola, yuvarlanan topun peşinden koşuyor; uzaktan araba geliyor. |
| 6 | `assets/images/items/sahne/sofra_tuz.png` | 16:9 | — | Uzun sofra: bir uçta küçük çocuk uzanıyor, öbür uçta küçücük bir tuzluk (bardak boyunda). |
| 7 | `assets/images/items/nezaket/tv_sesi.png` | 1:1 | — | Çocuk televizyonun karşısında, elinde kumanda, TV'den büyük ses dalgaları yayılıyor; misafire aldırmıyor. |
| 8 | `assets/images/items/gorev/yatak_duzelt.png` | 1:1 | — | Çocuk yatağın yanında ayakta, battaniyeyi düzeltip yastığı kabartıyor (yatak toplama). |
| 9 | `assets/images/items/simge/cocuk_gorevi.png` | 1:1 | — | Küçük, tombul bir çocuk eli (kısa parmaklar, sarı manşet); karenin yalnızca yaklaşık yarısını kaplar, 'çocuk' izlenimi için küçük ve avucunda minik bir oyuncak küp var. |
| 10 | `assets/images/items/simge/buyuk_gorevi.png` | 1:1 | — | Çok daha büyük, uzun parmaklı yetişkin eli; mavi gömlek manşeti ve kol saati; karenin neredeyse tamamını kaplar. |
| 11 | `assets/images/items/afet/sel.png` | 1:1 | — | İki küçük ev, yarısına kadar mavi taşkın suyuna gömülmüş; dalgalar ve köpükler görünür (sel). |
| 12 | `assets/images/items/afet/heyelan.png` | 1:1 | — | Dik bir yamaçtan aşağı kayan toprak ve kaya kütlesi; eğilmiş ağaçlar ve yuvarlanan kayalar (heyelan). |
| 13 | `assets/images/items/kutu/plastik.png` | 1:1 | — | Sarı geri dönüşüm kutusu; ön yüzünde kabartma plastik poşet ve plastik bardak simgesi (şişe yok). |
| 14 | `assets/images/items/kutu/cam.png` | 1:1 | — | Yeşil geri dönüşüm kutusu; ön yüzünde kabartma cam şişe ve cam kavanoz simgesi. |
| 15 | `assets/images/items/atik/pil.png` | 1:1 | — | Tanıdık silindir biçimli iki kalem pil; üst uçta çıkıntı (artı ucu), yüzsüz. |
| 16 | `assets/images/items/kutu/pil.png` | 1:1 | — | Turuncu geri dönüşüm kutusu; ön yüzünde kabartma pil simgesi (üstte çıkıntılı silindir). |
| 17 | `assets/images/items/sahne/aile_tv.png` | 16:9 | — | Oturma odasında aile (anne, baba, iki çocuk) kanepede oturmuş büyük, parlak bir televizyona bakıyor; birbirleriyle ilgilenmiyorlar. |
| 18 | `assets/images/items/gok/model.png` | 16:9 | — | Sarı bir masanın üstünde ince sehpalarda üç model: büyük sarı Güneş, orta boy mavi-yeşil Dünya, küçük gri Ay (Güneş > Dünya > Ay boyutlarıyla). |
| 19 | `assets/images/items/doga/agac.png` | 1:1 | — | Yüzsüz kil ağaç: yuvarlak yeşil taç, kahverengi gövde. |
| 20 | `assets/images/items/doga/cicek.png` | 1:1 | — | Yüzsüz kil çiçek: pembe taç yapraklar, sarı orta, yeşil sap ve yapraklar. |
| 21 | `assets/images/items/atik/pecete.png` | 1:1 | — | Kullanılmış, buruşturulmuş, lekeli beyaz-gri kâğıt peçete (kâğıt geri dönüşümüyle karışmaz). |
| 22 | `assets/images/items/atik/karton.png` | 1:1 | — | Düzleştirilmiş kahverengi oluklu karton kutu; yırtık kenarda dalgalı oluklu katman görünür. |
| 23 | `assets/images/items/davranis/yabanciyla_git.png` | 1:1 | — | Başı ayağı görünen, şapkalı ve koyu gözlüklü tanımadık bir yetişkin, çocuğun elinden tutup götürüyor; çocuk tedirgin geriye bakıyor. |
| 24 | `assets/images/items/sahne/bilyeler.png` | 1:1 | — | Çimde oturan çocuk, iki eliyle küçük bir kavanoz bilye tutuyor (sayım yok). |
| 25 | `assets/images/items/sahne/musluk_acik.png` | 1:1 | — | Dişini fırçalayan çocuk; musluk açık, belirgin bir su akıntısı lavaboya akıyor. |
| 26 | `assets/images/items/sahne/musluk_kapali.png` | 1:1 | — | Çocuk musluğu kapatıyor; musluktan su gelmiyor, lavabo kuru. |
| 27 | `assets/images/items/davranis/ogretmeni_dinle.png` | 1:1 | — | Öğretmen ayakta, bir elini kaldırmış konuşuyor; sırasında oturan çocuk dikkatle öğretmene bakıp dinliyor. |
| 28 | `assets/images/items/davranis/alkis.png` | 1:1 | — | Gülümseyen çocuk iki elini birbirine vurarak alkışlıyor; ellerin yanında küçük hareket çizgileri var. |
| 29 | `assets/images/items/hayal/ucan_hali.png` | 1:1 | — | Havada süzülen gerçek bir uçan halı: püsküllü, desenli, kenarları hafif kıvrık, altında minik bulutlar. |
| 30 | `assets/images/items/esya/tarak.png` | 1:1 | — | Tanıdık bir saç tarağı: düz dikdörtgen gövde, bir kenarında düzgün aralıklı çok sayıda diş, diğer ucunda sap. |
| 31 | `assets/images/items/sahne/kedi_uyur.png` | 1:1 | — | Davulun yanında kıvrılmış, iki gözü kapalı huzurla uyuyan turuncu kedi. |
| 32 | `assets/images/items/davranis/fisilda.png` | 1:1 | — | Parmağını dudağına koymuş, 'şşş' diyen sakin çocuk. |
| 33 | `assets/images/items/ses/ninni.png` | 1:1 | — | Kapağı açık küçük bir müzik kutusu; üstünde birkaç yumuşak nota yüzüyor. |
| 34 | `assets/images/items/sahne/mendil_kapmaca.png` | 1:1 | — | İki çocuk çimenlikte karşı karşıya, koşmaya hazır; tam ortalarında yerde renkli bir mendil. |
| 35 | `assets/images/items/oyuncak/topac.png` | 1:1 | — | Klasik ahşap topaç: koni gövde, kırmızı-sarı şerit, üstte kısa sap, altta sivri uç. |
| 36 | `assets/images/items/sahne/topac_misket.png` | 1:1 | — | Aynı ahşap topaç ve yanında renkli misketler. |
| 37 | `assets/images/items/sahne/dede_topac.png` | 1:1 | — | Dede ve torun yere oturmuş, aralarında dönen aynı ahşap topaç. |
| 38 | `assets/images/items/arkadas/oyuncak_kap.png` | 1:1 | — | Oyuncağı arkadaşının elinden zorla çeken çocuk; karşısındaki çocuk üzgün. |
| 39 | `assets/images/items/arkadas/oyuna_kat.png` | 1:1 | — | Bir çocuk diğerini elinden tutup oyuna çağırıyor. |
| 40 | `assets/images/items/toplum/sirada_bekle.png` | 1:1 | — | Fırın tezgâhı önünde üç çocuk yandan görünüşte tek sıra hâlinde sırasını bekliyor. |
| 41 | `assets/images/items/toplum/one_gec.png` | 1:1 | — | Sıradaki çocukları geçip öne fırlayan çocuk; sıradakiler şaşkın ve biraz üzgün. |
| 42 | `assets/images/items/sahne/firin_sirasi.png` | 16:9 | — | Fırın tezgâhının önünde sırada bekleyen çocuklar; tabela ya da yazı yok. |
| 43 | `assets/images/items/sahne/okul_bahcesi_cicek.png` | 16:9 | — | Okul bahçesinde solmuş, boynu bükük çiçekler; toprak kuru ve çatlak. |
| 44 | `assets/images/items/milli/tbmm_1920.png` | 16:9 | — | İlk Meclis binası: sade, iki katlı taş bina, çatıda bayrak; tabela ya da yazı yok. |
| 45 | `assets/images/items/bayram/yalniz_tv.png` | 1:1 | — | Ailesinden ayrı, tek başına televizyon izleyen çocuk; kanepenin geri kalanı boş. |
| 46 | `assets/images/items/iletisim/baska_yere_bak.png` | 1:1 | — | Başı yana dönük, bakışı başka yere kaçan, kollarını kavuşturmuş çocuk. |
| 47 | `assets/images/items/iletisim/kolundan_cek.png` | 1:1 | — | Bir çocuk dikkat çekmek için arkadaşının kolunu çekiştiriyor. |
| 48 | `assets/images/items/iletisim/bagir.png` | 1:1 | — | Elleri huni gibi ağzında, ağzı kocaman açık, bağıran çocuk. |
| 49 | `assets/images/items/arkadas/ozur_dile.png` | 1:1 | — | Karşısındaki arkadaşına dönük, elini göğsüne koyup özür dileyen çocuk. |
| 50 | `assets/images/items/bilgi112/ne_oldu.png` | 1:1 | — | Çatısından küçük alevler ve duman çıkan ev: ne olduğunu anlatan acil durum. |
| 51 | `assets/images/items/bilgi112/yemek.png` | 1:1 | — | Tabakta spagetti, köfte ve bezelyeden oluşan yemek. |
| 52 | `assets/images/items/acil112/saka_yapma.png` | 1:1 | — | Oyuncak telefonla arama yapmak isteyen arkadaşını elini kaldırarak engelleyen çocuk. |
| 53 | `assets/images/items/sahne/bisikletten_dustu.png` | 16:9 | — | Bisikletten düşmüş çocuk yerde oturuyor, dizindeki kırmızı sıyrık açıkça görünüyor. |
| 54 | `assets/images/items/sahne/aile_pansuman.png` | 1:1 | — | Dizinde sıyrık olan çocuk; anne yara bandı yapıştırıyor, baba ilk yardım kutusu tutuyor. |
| 55 | `assets/images/items/milli/askerler.png` | 1:1 | — | Yan yana dizilmiş, üniformalı ve kepli dört asker; yetişkin oranlarında. |
| 56 | `assets/images/items/milli/meclis.png` | 1:1 | — | Hikâyedeki ilk Meclis binasıyla aynı bina: sade iki katlı taş yapı, çatıda bayrak. |
| 57 | `assets/images/items/milli/okul_binasi.png` | 1:1 | — | Meclis'ten ayırt edilsin diye: renkli okul binası, bahçesinde kaydırak ve salıncak var; bayrak ve yüz yok. |
| 58 | `assets/images/items/milli/genclik_spor.png` | 1:1 | — | Koşu duruşunda, boynunda madalya olan spor yapan çocuk; yanında top ve ip. |
| 59 | `assets/images/items/hava/cicek_toplayan.png` | 1:1 | — | İlkbaharda çayırda çiçek toplayan çocuk, yanında kelebek. |
| 60 | `assets/images/items/hava/lale_bahcesi.png` | 1:1 | — | Taze yeşil çimde açmış kırmızı, sarı ve pembe laleler. |
| 61 | `assets/images/items/hava/kestane.png` | 1:1 | — | Parlak kahverengi kestaneler, dikenli yeşil açılmış bir kabuk ve birkaç turuncu sonbahar yaprağı. |
| 62 | `assets/images/items/onlem/dolap_sabitle.png` | 1:1 | — | Duvara metal bağlantı parçası ve vidalarla sabitlenmiş uzun dolap. |
| 63 | `assets/images/items/tasarruf/isik_kapat.png` | 1:1 | — | Kapı aralığında anahtarı kapatan çocuk; arkasındaki oda karanlık, tavan lambası sönük. |
| 64 | `assets/images/items/tasarruf/isik_acik_birak.png` | 1:1 | — | Çocuk odadan çıkıp gidiyor; arkadaki boş odada tavan lambası yanık kalmış, dışarısı gündüz. |
| 65 | `assets/images/items/tasarruf/kagit_iki_yuz.png` | 1:1 | — | Bir yüzü çizili kâğıdı çevirip boş arka yüzüne çizen çocuk. |
| 66 | `assets/images/items/tek/led.png` | 1:1 | — | LED ampul/lamba: yüzsüz, parlayan modern LED ampul (süt beyazı kubbe, küçük parlak LED noktaları halkası, beyaz kanatlı taban, soğuk beyaz ışık). Dikdörtgen/ekran değil. g2 hayat bilgisi u06 da kullanıyor (aydınlatma sırası); yeni görsel orada da uyar. |
| 67 | `assets/images/items/plan/gec_yat.png` | 1:1 | — | Gece geç saatte yatmayıp esneyen, gözlerini ovuşturan pijamalı çocuk; arkasında karanlık pencere ve ay. |
| 68 | `assets/images/items/iletisim/bekle_dinle.png` | 1:1 | — | Elleri dizinde, sakin ve dik oturan, kulağını konuşana çevirmiş dikkatle dinleyen çocuk. |
| 69 | `assets/images/items/arkadas/sucla.png` | 1:1 | — | Bir çocuk karşısındakine parmağını uzatıp suçluyor; karşıdaki çocuk üzgün ve geri çekiliyor. |
| 70 | `assets/images/items/bilgi/sevdigi_renk.png` | 1:1 | — | Tek bir canlı renkte (gök mavisi) boya: açık boya kabı, fırça ve yanında yuvarlak boya lekesi. |
| 71 | `assets/images/items/sahne/park_cop.png` | 16:9 | — | Parkta yolun ortasında kolayca fark edilen büyük bir çöp yığını. |
| 72 | `assets/images/items/hava/plaj.png` | 1:1 | — | Kumsal: kum kalesi, kırmızı kova, kürek, deniz yıldızı, deniz kabuğu ve önde mavi dalga. |
| 73 | `assets/images/items/kaynak/aileyle_internet.png` | 1:1 | — | Yetişkin bir anne, küçük çocukla birlikte dizüstü bilgisayardan güvenli şekilde araştırma yapıyor. |
| 74 | `assets/images/items/kaynak/reklam.png` | 1:1 | — | Dizüstü ekranında açılmış, altın kupa ve konfetili göz alıcı 'ödül kazandın' penceresi. |
| 75 | `assets/images/items/tek/telefon_dev.png` | 1:1 | — | Çocuktan iki kat büyük, antenli dev telefon; çocuk hayretle bakıyor. |
| 76 | `assets/images/items/sanat/ebru.png` | 1:1 | — | Su dolu tepsi: yüzeyde girdap desenli pastel ebru boyası, ince uzun saplı fırça suyun yüzeyine dokunuyor. |
| 77 | `assets/images/items/sahne/karis_olcum.png` | 16:9 | — | İki çocuk alçak bir masanın karşılıklı uzun kenarlarında, her biri masanın boyunu açık elinin karışıyla ölçüyor; küçük çocuğun eli küçük, büyük çocuğun eli büyük. Cetvel ya da işaretli nesne yok. |
| 78 | `assets/images/items/sahne/cetvel_olcum.png` | 16:9 | — | İki çocuk masanın kenarına uzun sarı bir cetveli birlikte tutuyor; cetvelde yalnız düz çentikler var, rakam yok. |
| 79 | `assets/images/items/hikaye/g2_semsiye_yagmur.png` | 1:1 | — | Yağmurlu sokakta Ece mor şemsiyesini kendi üstünde tutuyor, yanındaki Can şemsiyesiz, hafif ıslak saçlarla yağmura bakıyor. Karakterler g2_semsiye görseliyle aynı (Ece: kahverengi saçlı, pembe tişört, eflatun şort; Can: kısa kahverengi saçlı, mavi tişört, koyu pantolon). |
| 80 | `assets/images/items/fen/fosil_3_camur.png` | 1:1 | — | Çamur örtüsü: kesit blokta balık iskeleti kalın kahverengi çamur ve kum katmanının ALTINDA gömülü; üst yüzey düz çamur, üstte kemik görünmez. |
| 81 | `assets/images/items/fen/fosil_2_dip.png` | 1:1 | — | Göl dibi: üstte berrak mavi su katmanı, altında kumlu dipte açıkta yatan balık iskeleti; üstü hiçbir şeyle örtülü değil (fosil_3 ile açıkça ayrışır). |
| 82 | `assets/images/items/fen/sahne/iki_vurus.png` | 16:9 | — | İki ayrı şerit: üstte hafif vurulan top yakında durmuş, altta güçlü vurulan top bayrağa kadar gitmiş. |
| 83 | `assets/images/items/fen/bisiklet_fren.png` | 1:1 | — | Fren yapan bisikletli: çocuk frene basan eliyle kolu sıkıyor, arkaya yaslanmış, arka tekerleğin arkasında kısa fren izi ve toz bulutu; belirgin yavaşlama. |
| 84 | `assets/images/items/fen/itme_salincak.png` | 1:1 | — | Çocuk salıncaktaki arkadaşını arkasından iki eliyle itiyor. |
| 85 | `assets/images/items/fen/bacakli_iribas.png` | 1:1 | — | Büyümüş iribaş: yeşilimsi gri gövde, uzun kuyruk ve gövdenin arkasında iki net, yüzgeç olmayan küçük bacak ve perdeli ayak. |
| 86 | `assets/images/items/fen/bakir.png` | 1:1 | — | Bakır: parlak, metalik kırmızımsı turuncu bir bakır külçe ve üstünde sarılı çıplak bakır tel (portakal gibi görünmemeli). |
| 87 | `assets/images/items/fen/buhar.png` | 1:1 | — | Yalnız su buharı: yukarı kıvrılan yumuşak beyaz buhar bulutu; çaydanlık ya da kap yok. |
| 88 | `assets/images/items/fen/balon_hava.png` | 1:1 | — | Yalnız havayla şişmiş balon: yuvarlak, düğümlü kırmızı balon; içinde ve çevresinde kıvrımlı pastel hava çizgileri; pompa yok. |
| 89 | `assets/images/items/fen/sunger.png` | 1:1 | — | Mutfak süngeri: yeşil kaba yüzeyli üst katman ve sarı gözenekli sünger gövde (peynire benzemez). |
| 90 | `assets/images/items/fen/karton_kutu.png` | 1:1 | — | Katlanmış karton kutu: açık kapakları üstte duran, kahverengi oluklu karton yapışkan bantlı kutu. |
| 91 | `assets/images/items/fen/yogurt_kabi.png` | 1:1 | — | Plastik yoğurt kabı: pembe-mavi renkli, kapaklı, etiket bandı olan (yazısız) plastik kap; kâğıt bardağa benzemez. |
| 92 | `assets/images/items/fen/sahne/cam_kagit_kutusu.png` | 16:9 | — | Tek mavi kâğıt geri dönüşüm kutusu gazete ve kâğıt dolu; bir çocuk (Ali) yeşil cam şişeyi bu kutunun içine atıyor, şişe kâğıtların arasında görünüyor. |
| 93 | `assets/images/items/fen/tasarruf_isik_kapat.png` | 1:1 | — | Gündüz, güneşli oda; çocuk düğmeye basmış, tavan lambası sönük. |
| 94 | `assets/images/items/fen/sahne/alti_lamba.png` | 16:9 | — | İki raf, her rafta eşit aralıklı üç özdeş masa lambası: toplam tam altı lamba, hepsi sıcak sarı yanıyor. |
| 95 | `assets/images/items/fen/granit.png` | 1:1 | — | Granit: gri-pembe tuzlu-biber benekli, pürüzlü, köşeli sert kayaç parçası (yumurtaya benzemez). |
| 96 | `assets/images/items/fen/karisim_kum_nohut.png` | 1:1 | — | Kase içinde kum ve nohut iç içe karışık; kum taneleri nohutların arasında ve üstünde belirgin. |
| 97 | `assets/images/items/fen/davranis_kablo_tut.png` | 1:1 | — | Çocuk yıpranmış lamba kablosunu elinde tutuyor: kablonun yalıtımı yırtık, içinden ince bakır teller görünüyor; yanında küçük masa lambası. |
| 98 | `assets/images/items/fen/sahne/tuketim_grafik.png` | 16:9 | — | İki aynı genişlikte, aynı derinlikte sütun: soldaki uzun, sağdaki belirgin kısa; üstlerinde birer minik ampul; sayı/yazı yok. |
| 99 | `assets/images/items/fen/koruma_fidan_dik.png` | 1:1 | — | Çocuk dizlerinin üstünde, küçük kürekle açtığı çukura fidanı dikiyor; çıplak toprak ve küçük fidan belirgin. |
| 100 | `assets/images/items/fen/zarar_dal_kirma.png` | 1:1 | — | Çocuk bir ağaç dalını iki eliyle bükerek kırıyor; dal çatırdıyor, birkaç yaprak düşüyor. |
| 101 | `assets/images/items/katki/yangin_sondu.png` | 1:1 | — | Yangın söndürüldükten sonraki ev: alev yok; ıslak, hafif isli çatı, ince bir duman telesi ve su birikintisi. |
| 102 | `assets/images/items/toplum/yer_ver.png` | 1:1 | — | Otobüste çocuk ayağa kalkmış, boşalan koltuğu bastonlu yaşlı kadına gösteriyor; önde yetişkin şoför. |
| 103 | `assets/images/items/doga/temiz_hava.png` | 1:1 | — | Temiz hava: gözleri kapalı, derin nefes alan mutlu çocuk; çevresinde soluk mavi kil rüzgâr kıvrımları ve uçuşan taze yeşil yapraklar. Ağaç yok (item.doga.agac kartıyla benzemesin). |
| 104 | `assets/images/items/sorumluluk/kitabi_unut.png` | 1:1 | — | Sınıfta sırasında oturan çocuk boş çantasına üzgün bakıyor; masasında kitap yok. |
| 105 | `assets/images/items/hak/bahceye_cik.png` | 1:1 | — | Bahçeye çıkmak: bahçe kapısına doğru yürüyen mutlu çocuk (açık ahşap kapı, çiçekler). |
| 106 | `assets/images/items/guvenlik/ilac_seker.png` | 1:1 | — | Giyinik çocuk, kırmızı haçlı ilaç şişesinden renkli hapları şeker sanıp yemek üzere. |
| 107 | `assets/images/items/sonuc/gece_gorunur.png` | 1:1 | — | Gece görünür olmak: karanlık yolda yansıtıcı yelekli çocuk, bir aracın farları onu aydınlatıyor (araç yüzsüz). Aynı görsel tur 12 ve 13 için. |
| 108 | `assets/images/items/toplum/paylas.png` | 1:1 | — | Toplumda paylaşmak: komşuya ikram. Çit arkasında yaşlı bir komşuya kurabiye tabağı uzatan çocuk; arkada komşu evleri (aile içi sofra/paylaşma görsellerinden farklı). |
| 109 | `assets/images/items/sahne/copler_kucuk.png` | 1:1 | — | Sokakta biriken çöp: iki ev arasındaki yol çöp torbaları, devrilmiş taşkın çöp kutuları ve etrafa saçılmış atıklarla dolu; sinekler (kötü koku). Tüm torbalar ve evler yüzsüz. temiz_sokak ile açık karşıtlık. |
| 110 | `assets/images/items/koruma/rehber.png` | 1:1 | — | Kasketli ve bayraklı yetişkin rehber taş kaleyi gösteriyor; üç çocuk dinliyor. |
| 111 | `assets/images/items/koruma/vazgecir.png` | 1:1 | — | Arkadaşını vazgeçirmek: taş duvara bir şey kazımak üzere olan çocuğu, arkadaşı elini tutup diğer avucunu "dur" diye kaldırarak vazgeçiriyor. |
| 112 | `assets/images/items/birlik/alay.png` | 1:1 | — | Alay etmek: üç çocuk yarım daire hâlinde, yalnız duran dördüncü küçük çocuğu parmakla gösterip gülüyor; dışlanan çocuk başı öne eğik, üzgün. |
| 113 | `assets/images/items/simge/guclendirmez.png` | 1:1 | — | Birliği güçlendirmez etiketi: tek başına duran tek bir el (boncuk halkası yok); "yalnız el" simgesi, item.simge.guclendirir (birleşen eller) ile karşıt. |
| 114 | `assets/images/items/kroki/firin_k.png` | 1:1 | — | Kroki: kuşbakışı mahalle haritası. Fırın turuncu çatılı bina (bacası ve çatıda büyük ekmek biçimli yazısız tabela); kırmızı yıldız FIRININ üstünde. park_k ve okul_k ile AYNI düzen, AYNI ölçek ve aynı yakınlık; yalnız yıldızın yeri değişir (ideal: tek tabanı üretip yıldızı taşımak). |
| 115 | `assets/images/items/kroki/park_k.png` | 1:1 | — | Kroki: firin_k ile birebir aynı harita tabanı ve ölçek; kırmızı yıldız PARKIN üstünde. |
| 116 | `assets/images/items/kroki/okul_k.png` | 1:1 | — | Kroki: firin_k ile birebir aynı harita tabanı ve ölçek; kırmızı yıldız OKULUN (mavi çatılı, bayraklı bina) üstünde. |
| 117 | `assets/images/items/kaynak/hemen_inan.png` | 1:1 | — | Çocuk tablette uçan domuz resmine şaşkın şaşkın bakıyor, hemen inanıyor. |
| 118 | `assets/images/items/sahne/top_paylasilmiyor.png` | 16:9 | — | Top paylaşılmıyor: sol önde tek çocuk topu göğsüne bastırıp arkasını dönüyor; sağda üç çocuk boş elle, üzgün duruyor. |
| 119 | `assets/images/items/guvenlik/kitap_oku.png` | 1:1 | — | Kitap okumak: koltukta oturup elinde açık renkli resimli kitabı okuyan mutlu çocuk (güvenli davranış). |
| 120 | `assets/images/items/guvenlik/adres_soyle.png` | 1:1 | — | Adres söylemek: kapıyı aralayıp konuşan çocuk, başının üstünde içinde yalnız küçük bir ev simgesi olan konuşma baloncuğu (yazı yok). |
| 121 | `assets/images/items/afet/cok_kapan.png` | 1:1 | — | Çök-Kapan-Tutun: yere diz çökmüş, öne eğilmiş, iki kolu başını ve ensesini koruyan çocuk (masaya yaslanıp ayakta durmuyor; masa_altı kartından farklı: açık alanda çömelmiş). |
| 122 | `assets/images/items/afet/binaya_girme.png` | 1:1 | — | Çatlak evin kapısında kırmızı-beyaz şerit; ebeveyn çocuğun elinden tutup geri çekiyor. |
| 123 | `assets/images/items/afet/toplanma_git.png` | 1:1 | — | Afet sonrası toplanma alanına gitmek: anne, baba ve çocuk el ele, arkada çatlak bina varken yeşil alandaki yazısız aile simgeli toplanma levhasına doğru yürüyor. toplanma_ogren (evde haritaya bakma) ile ayrışsın. r39 ve r40 kullanır. |
| 124 | `assets/images/items/tek/asi.png` | 1:1 | — | Aşı: şırınga (iğnesi mavi kapaklı), küçük aşı şişesi ve pamuk topu; yüzsüz. |
| 125 | `assets/images/items/tek/at_arabasi.png` | 1:1 | — | At arabası: bir atın koşumla çektiği, iki büyük tekerlekli ahşap araba (yandan görünüm). |
| 126 | `assets/images/items/simetri/kare_yatay_cizgi.png` | 1:1 | — | Sarı kare; üst kenara paralel, ortadan geçmeyen (üstten üçte bir aşağıda) tek yatay kesikli çizgi. Çizgi şekli iki eşit olmayan parçaya böler, simetri doğrusu değildir. |
| 127 | `assets/images/items/arac/tablet.png` | 1:1 | — | Açık, dijital bir tablet: ekranında çizilmiş basit bir üçgen ve kare çerçeve, önünde küçük bir kil kalem. Şekil çizme aracı olarak okunmalı. |
| 128 | `assets/images/items/olay/okul_gunu.png` | 1:1 | — | Sınıfta ders: kil bir sıranın başında oturan çocuk, önünde açık defter ve kalem; arkada boş yeşil tahta (yalnız yıldız ve üçgen karalaması) ve iki arkadaş. Tüm okul gününü (saatler) anlatır; eve/okula yürüyüş değil. |
| 129 | `assets/images/items/olay/otobus_yolculugu.png` | 1:1 | — | Dağ yolunda uzun şehirler arası otobüs; önde yetişkin şoför, ortada pencerede uyuyan çocuk yolcu. |
| 130 | `assets/images/items/olay/bayram_tatili.png` | 1:1 | — | Bavulları tavanına bağlı aile arabası, bayram süslü köy evine geliyor; dede ve nine el sallıyor. |
| 131 | `assets/images/items/cevre/kitap_karis.png` | 1:1 | — | Yukarıdan kapalı mor bir kil kitap; kısa kenarının yanında art arda tam 2, uzun kenarının yanında art arda tam 3 el izi (karış) yan yana dizilmiş. Çocuk eli karışları sayarak ölçmeyi göstermeli. |
| 132 | `assets/images/items/hikaye/g3_23_nisan_hazirlik.png` | 1:1 | — | Bir sınıf masasında iki çocuk: kız kırmızı kâğıdı tek bir yuvarlak uçlu güvenli çocuk makasıyla kesiyor, erkek çocuk kesilmiş süs parçalarını ve yapıştırıcıyı tutuyor. Resimde tek makas var, bıçak ya da keskin alet yok. |
| 133 | `assets/images/items/durum/g3_sinif_toplantisi.png` | 16:9 | — | Sınıf toplantısı: sıralar yarım daire düzeninde, ayakta kâğıt tutan bir kız (Ada) konuşuyor; sırasında oturan bir erkek çocuk (Kerem) öne eğilmiş, ağzı açık, elini kızın önüne uzatarak sözünü kesiyor; kız şaşkın bakıyor, birkaç çocuk izliyor. |
| 134 | `assets/images/items/durum/g3_piknik_cop.png` | 16:9 | — | Piknik: ön planda iki çocuk karşılıklı; biri dolu beyaz çöp torbasını çimenlerin üstünde tutup yere bırakmak üzere, yerde birkaç buruşuk kâğıt ve boş bir meyve suyu kutusu var; öbür çocuk endişeyle 'dur' der gibi elini uzatıyor. Arkada aile piknik örtüsünde oturuyor. |
| 135 | `assets/images/items/durum/g3_penguen_tartisma.png` | 16:9 | — | Sınıfta iki çocuk karşı karşıya: biri kollarını kanat gibi çırpıp 'penguenler uçar' der gibi gururla konuşuyor, öbürü kollarını kavuşturmuş, kaşını kaldırmış, ikna olmamış bakıyor. Resimde kitap ve penguen yok. |

## Promptlar

### 1. `assets/images/items/davranis/siraya_ciz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sınıfta bir çocuk, kâğıt olmadan doğrudan sıranın yüzeyine kalemle karalıyor; sıra üstü renkli çizgilerle dolu. (denetim: g1_hayat_bilgisi)

```
A cute child sitting at a small school desk, scribbling with a crayon directly on the bare surface of the desk, with a mischievous little grin. There is NO paper on the desk. The desk top is covered with messy colorful crayon scribbles and squiggles, and a few crayons lie on it. The child is a cute clay toy figure with a big round head, big dark round eyes, rosy cheeks and short hair. The desk itself has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/items/gorev/ocakta_yemek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yetişkin bir kadın (anne), uzun boylu, yetişkin yüz ve oranlarla, ocakta tencerede yemek karıştırıyor. (denetim: g1_hayat_bilgisi)

```
A grown-up adult woman, clearly an adult and not a child: tall slim body about seven heads tall, small head compared to her body, mature friendly face with a gentle smile, dark brown hair tied back in a bun, wearing an apron over a pastel blouse. She stands at a small toy-like kitchen stove and stirs a pink cooking pot with a wooden spoon, with a little steam rising. Cute clay toy figure with simple dark round eyes and rosy cheeks. The stove and the pot have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/items/sahne/aile_is_bolumu.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Yemek bitmiş: masa yarı toplanmış; anne tabakları tezgâha taşıyor, baba masayı siliyor, küçük kardeş bardak siliyor; bir sandalye boş (oyuncu için). (denetim: g1_hayat_bilgisi)

```
A cozy home kitchen and dining area right after dinner. The round dining table is half cleared: only a few plates and glasses remain on it. A mother carries a stack of plates toward the kitchen counter, a father wipes the table with a cloth, and a small younger sibling stands beside the table drying a glass with a small cloth. One chair at the table is empty and pulled out, with open space next to it. The characters are cute clay toy figures with big dark round eyes and rosy cheeks; the furniture and objects have no faces. Everyone is busy helping, nobody is sitting and eating. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 4. `assets/images/items/davranis/sirada_bekle.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dört çocuk yandan görünüşte, tek sıra hâlinde art arda bekliyor (kuyruk).

```
a side view of four children standing in a straight queue one behind the other, all facing the same direction toward a drinking fountain, each child waiting patiently behind the next, clear single-file line. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 5. `assets/images/items/trafik/top_pesinden.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çocuk kaldırımdan yola, yuvarlanan topun peşinden koşuyor; uzaktan araba geliyor.

```
a small claymation vignette: a street with a grey road, white lane markings and a raised sidewalk curb; a child running off the curb into the road after a rolling ball, a car approaching in the distance. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 6. `assets/images/items/sahne/sofra_tuz.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Uzun sofra: bir uçta küçük çocuk uzanıyor, öbür uçta küçücük bir tuzluk (bardak boyunda).

```
a long family dinner table seen from the side at child eye level: a small child sits at the far left end of the table reaching out with one arm; at the far right end of the table stands one tiny white salt shaker, about as small as a drinking cup and much smaller than the child's head, other family members sit in the middle eating; realistic sizes. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 7. `assets/images/items/nezaket/tv_sesi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çocuk televizyonun karşısında, elinde kumanda, TV'den büyük ses dalgaları yayılıyor; misafire aldırmıyor. (denetim: g1_hayat_bilgisi)

```
A cute child sitting in front of a chunky clay television with a bright glowing screen, holding a remote control and pointing it at the TV with a delighted look, not paying attention to anything else. Big bold curved sound-wave arcs in several colors burst out of the television speaker to show it is very loud. The child has big dark round eyes, rosy cheeks and short hair. The television and the remote control have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 8. `assets/images/items/gorev/yatak_duzelt.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çocuk yatağın yanında ayakta, battaniyeyi düzeltip yastığı kabartıyor (yatak toplama). (denetim: g1_hayat_bilgisi)

```
A cute child standing beside a small bed, neatly pulling the blanket straight and smoothing it with both hands, a fluffed pillow already placed at the head of the bed, the bed made tidy and flat. The child is awake, standing up and busy, with a proud smile. Cute clay toy figure with a big round head, big dark round eyes, rosy cheeks and short hair. The bed has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 9. `assets/images/items/simge/cocuk_gorevi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Küçük, tombul bir çocuk eli (kısa parmaklar, sarı manşet); karenin yalnızca yaklaşık yarısını kaplar, 'çocuk' izlenimi için küçük ve avucunda minik bir oyuncak küp var. (denetim: g1_hayat_bilgisi)

```
A single small chubby child's hand, palm facing the viewer, with short stubby fingers and tiny dimples, wearing a bright yellow knitted cuff, with a tiny colorful toy building block resting on the palm. The hand is drawn small and occupies only about half of the image width and height, centered, with plenty of empty space around it, so it clearly reads as a small child's hand. The hand has no face, no eyes and no mouth. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 10. `assets/images/items/simge/buyuk_gorevi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çok daha büyük, uzun parmaklı yetişkin eli; mavi gömlek manşeti ve kol saati; karenin neredeyse tamamını kaplar. (denetim: g1_hayat_bilgisi)

```
A single large adult hand, palm facing the viewer, with long slender fingers and visible knuckles, wearing a blue shirt sleeve cuff and a simple wristwatch with a plain blank face (no numbers and no marks), holding a small house key between thumb and fingers. The hand is drawn big and fills almost the whole image, so it clearly reads as a grown-up's large hand. The hand has no face, no eyes and no mouth. 3D claymation style icon, plasticine toy look, very simple bold silhouette readable at small size, soft rounded shapes, smooth matte clay, soft lighting, bright saturated candy colors, single object centered, isolated on a plain solid light grey background (#EEEEEE), no text, no letters, no numbers, no watermark.
```

### 11. `assets/images/items/afet/sel.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** İki küçük ev, yarısına kadar mavi taşkın suyuna gömülmüş; dalgalar ve köpükler görünür (sel). (denetim: g1_hayat_bilgisi)

```
Two small clay houses with pastel roofs standing in a rising flood: muddy light-blue water with big rolling waves and foam swirls covers the ground and reaches halfway up the house walls, with a few small objects like a wooden crate and a tree branch floating in the water. The scene is a compact toy diorama base. It has no face, no eyes and no mouth. The houses have no faces and no eyes anywhere. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 12. `assets/images/items/afet/heyelan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dik bir yamaçtan aşağı kayan toprak ve kaya kütlesi; eğilmiş ağaçlar ve yuvarlanan kayalar (heyelan). (denetim: g1_hayat_bilgisi)

```
A steep brown clay hillside where a big slab of soil and many boulders of different sizes are sliding and tumbling down the slope, leaving a wide muddy streak behind and a visible crack at the top where the earth broke away. A few small green trees are tilted and sliding down with the earth, and a couple of rocks are rolling at the bottom. It has no face, no eyes and no mouth. The hill, the rocks and the trees have no faces anywhere. No road, no stripe, no river. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 13. `assets/images/items/kutu/plastik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sarı geri dönüşüm kutusu; ön yüzünde kabartma plastik poşet ve plastik bardak simgesi (şişe yok). (denetim: g1_hayat_bilgisi)

```
A yellow clay recycling bin with a rounded cylindrical body and an open top, with a flat embossed pictogram on the front showing a crumpled plastic shopping bag and a small plastic cup side by side (no bottle). The pictogram is made of simple light-cream clay shapes. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 14. `assets/images/items/kutu/cam.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yeşil geri dönüşüm kutusu; ön yüzünde kabartma cam şişe ve cam kavanoz simgesi. (denetim: g1_hayat_bilgisi)

```
A green clay recycling bin with a rounded cylindrical body and an open top, with a flat embossed pictogram on the front showing a glass bottle and a glass jar side by side. The pictogram is made of simple light-cream clay shapes. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 15. `assets/images/items/atik/pil.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tanıdık silindir biçimli iki kalem pil; üst uçta çıkıntı (artı ucu), yüzsüz. (denetim: g1_hayat_bilgisi)

```
Two cylindrical AA-style batteries standing upright side by side, each with a shiny silver-green body, a darker colored band around the middle, a small raised round metal nub on the top end and a flat bottom end, looking like real batteries made of clay. No plus or minus symbols and no markings on them. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 16. `assets/images/items/kutu/pil.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Turuncu geri dönüşüm kutusu; ön yüzünde kabartma pil simgesi (üstte çıkıntılı silindir). (denetim: g1_hayat_bilgisi)

```
An orange clay recycling bin with a rounded square body and an open top, with a flat embossed pictogram on the front showing a single cylindrical battery with a small round nub on top, made of simple light-cream clay. No plug, no socket, no electrical outlet shape. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 17. `assets/images/items/sahne/aile_tv.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Oturma odasında aile (anne, baba, iki çocuk) kanepede oturmuş büyük, parlak bir televizyona bakıyor; birbirleriyle ilgilenmiyorlar. (denetim: g1_hayat_bilgisi)

```
A cozy living room where a family of four, a mother, a father and two children, sit in a row on a sofa with their backs partly toward the viewer, all staring at a big television with a bright glowing screen on the opposite wall. Nobody is talking or reading; they are just watching TV, lit by its glow. The family members are cute clay toy figures with big dark round eyes and rosy cheeks; the television, the sofa and the furniture have no faces. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 18. `assets/images/items/gok/model.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sarı bir masanın üstünde ince sehpalarda üç model: büyük sarı Güneş, orta boy mavi-yeşil Dünya, küçük gri Ay (Güneş > Dünya > Ay boyutlarıyla). (denetim: g1_hayat_bilgisi)

```
A school science table with three toy models of sky objects on thin wooden stands, placed in a row from left to right: a big spiky yellow Sun model on the left, a medium blue-and-green Earth globe model in the middle, and a small grey cratered Moon model on the right. The sizes are clearly different: Sun largest, Earth medium, Moon smallest. All three models are clearly visible and well separated. None of the models has a face, eyes or a mouth. No characters. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 19. `assets/images/items/doga/agac.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yüzsüz kil ağaç: yuvarlak yeşil taç, kahverengi gövde. (denetim: g1_hayat_bilgisi)

```
A cute little tree with a round bushy canopy made of many clustered green clay balls in different shades of green and a thick brown trunk with a few roots. It is a plant, so it has no face, no eyes and no mouth anywhere. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 20. `assets/images/items/doga/cicek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yüzsüz kil çiçek: pembe taç yapraklar, sarı orta, yeşil sap ve yapraklar. (denetim: g1_hayat_bilgisi)

```
A cheerful flower with big rounded pink petals, a plain yellow round center, a green stem and two green leaves. It is a plant, so it has no face, no eyes and no mouth anywhere. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 21. `assets/images/items/atik/pecete.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kullanılmış, buruşturulmuş, lekeli beyaz-gri kâğıt peçete (kâğıt geri dönüşümüyle karışmaz). (denetim: g1_hayat_bilgisi)

```
A used crumpled paper napkin squeezed into an untidy wad, off-white with a greasy yellow-orange food stain smear and a few creases, clearly dirty and used, not pink. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 22. `assets/images/items/atik/karton.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Düzleştirilmiş kahverengi oluklu karton kutu; yırtık kenarda dalgalı oluklu katman görünür. (denetim: g1_hayat_bilgisi)

```
A flattened and folded brown corrugated cardboard box with two open flaps, light tan kraft-paper color, a torn edge that clearly shows the wavy corrugated layer between two flat layers, and a strip of tape. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 23. `assets/images/items/davranis/yabanciyla_git.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Başı ayağı görünen, şapkalı ve koyu gözlüklü tanımadık bir yetişkin, çocuğun elinden tutup götürüyor; çocuk tedirgin geriye bakıyor. (denetim: g1_hayat_bilgisi)

```
A tall adult stranger seen full body from head to toe, wearing a wide-brim dark hat, large dark sunglasses, a long dark grey coat and a scarf, so he looks like an unfamiliar person. He holds a small child by the hand and walks away, looking straight ahead and not at the child. The small child is dragged along and looks back over the shoulder toward the viewer with a worried hesitant expression. Both figures are completely visible. The child is a cute clay toy figure with a big round head, big dark round eyes and rosy cheeks. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 24. `assets/images/items/sahne/bilyeler.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çimde oturan çocuk, iki eliyle küçük bir kavanoz bilye tutuyor (sayım yok).

```
a small claymation vignette: a boy sitting on the grass holding a small glass jar in his two hands, the jar is about the size of his head and full of tiny colorful marbles; realistic sizes. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 25. `assets/images/items/sahne/musluk_acik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dişini fırçalayan çocuk; musluk açık, belirgin bir su akıntısı lavaboya akıyor. (denetim: g1_turkce)

```
A clay boy brushing his teeth with a toothbrush at a small white bathroom sink while a clear thick stream of blue water is clearly running from an open tap into the sink, the water stream is large and easy to see, the boy looks a little distracted. The sink and tap are inanimate with no faces. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 26. `assets/images/items/sahne/musluk_kapali.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çocuk musluğu kapatıyor; musluktan su gelmiyor, lavabo kuru. (denetim: g1_turkce)

```
A clay boy smiling and turning the handle of a small white bathroom tap to close it, the tap is completely dry with no water coming out and the sink is dry and empty, a toothbrush rests beside the sink. The sink and tap are inanimate with no faces. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 27. `assets/images/items/davranis/ogretmeni_dinle.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Öğretmen ayakta, bir elini kaldırmış konuşuyor; sırasında oturan çocuk dikkatle öğretmene bakıp dinliyor. (denetim: g1_turkce)

```
A kind clay female teacher standing and speaking with one hand raised, and a clay child sitting at a small wooden desk beside her looking up at her attentively and listening calmly, both characters have friendly faces. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 28. `assets/images/items/davranis/alkis.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Gülümseyen çocuk iki elini birbirine vurarak alkışlıyor; ellerin yanında küçük hareket çizgileri var. (denetim: g1_turkce)

```
A cheerful clay child clapping both hands together in front of the chest, big smile, hands meeting in the middle with a few small curved motion lines around the hands showing applause, friendly face. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 29. `assets/images/items/hayal/ucan_hali.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Havada süzülen gerçek bir uçan halı: püsküllü, desenli, kenarları hafif kıvrık, altında minik bulutlar. (denetim: g1_turkce)

```
A magic flying carpet floating in the air, a rectangular woven rug with a colorful geometric pattern in pink, yellow and blue, thick rounded edges, little tassels on the two short ends, gently curved as if gliding, a couple of tiny soft clouds below it. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 30. `assets/images/items/esya/tarak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tanıdık bir saç tarağı: düz dikdörtgen gövde, bir kenarında düzgün aralıklı çok sayıda diş, diğer ucunda sap. (denetim: g1_turkce)

```
A classic hair comb seen from the side: a flat rounded rectangular body in pastel pink with a row of many evenly spaced teeth along one long edge and a short sturdy handle at one end, clearly recognizable as a comb. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 31. `assets/images/items/sahne/kedi_uyur.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Davulun yanında kıvrılmış, iki gözü kapalı huzurla uyuyan turuncu kedi. (denetim: g1_turkce)

```
A clay orange cat curled up peacefully asleep next to a small pastel drum, head resting on its paws, both eyes fully closed shown as two calm curved lines, relaxed sleepy face. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 32. `assets/images/items/davranis/fisilda.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Parmağını dudağına koymuş, 'şşş' diyen sakin çocuk. (denetim: g1_turkce)

```
A clay child holding one index finger vertically against the lips making a quiet hush gesture, calm gentle expression, eyes looking friendly, the other hand relaxed, upper body shown. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 33. `assets/images/items/ses/ninni.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kapağı açık küçük bir müzik kutusu; üstünde birkaç yumuşak nota yüzüyor. (denetim: g1_turkce)

```
A small pastel clay music box with its lid open and a tiny winding key at the side, a few soft musical note symbols floating gently above it, soothing lullaby feeling. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 34. `assets/images/items/sahne/mendil_kapmaca.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** İki çocuk çimenlikte karşı karşıya, koşmaya hazır; tam ortalarında yerde renkli bir mendil. (denetim: g1_turkce)

```
Two clay children, a boy and a girl, standing on a small round patch of green grass facing each other in a ready-to-run pose leaning forward, a colorful handkerchief lying on the grass exactly between them, playful mendil kapmaca game, friendly faces. The handkerchief is inanimate with no face. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 35. `assets/images/items/oyuncak/topac.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Klasik ahşap topaç: koni gövde, kırmızı-sarı şerit, üstte kısa sap, altta sivri uç. (denetim: g1_turkce)

```
A single a classic wooden spinning top toy (topaç): a rounded cone body in natural light wood with a red and yellow painted stripe around the middle, a short straight wooden handle stem on top and a pointed tip at the bottom, standing upright. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 36. `assets/images/items/sahne/topac_misket.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Aynı ahşap topaç ve yanında renkli misketler. (denetim: g1_turkce)

```
A a classic wooden spinning top toy (topaç): a rounded cone body in natural light wood with a red and yellow painted stripe around the middle, a short straight wooden handle stem on top and a pointed tip at the bottom, standing upright, with five shiny colorful glass marbles scattered next to it. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 37. `assets/images/items/sahne/dede_topac.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dede ve torun yere oturmuş, aralarında dönen aynı ahşap topaç. (denetim: g1_turkce)

```
A friendly clay grandfather with grey hair and his young granddaughter sitting on the floor together watching the same a classic wooden spinning top toy (topaç): a rounded cone body in natural light wood with a red and yellow painted stripe around the middle, a short straight wooden handle stem on top and a pointed tip at the bottom spinning between them, both smiling, the top is inanimate with no face. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 38. `assets/images/items/arkadas/oyuncak_kap.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Oyuncağı arkadaşının elinden zorla çeken çocuk; karşısındaki çocuk üzgün. (denetim: g2_hayat_bilgisi)

```
Two small clay children facing each other. The first child grabs a toy truck and pulls it roughly out of the second child's hands with a smug grabbing expression. The second child looks sad with watery eyes and an open reaching hand. Clear conflict pose, both children fully visible. The toy truck is a simple pastel clay truck. The toy truck has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 39. `assets/images/items/arkadas/oyuna_kat.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bir çocuk diğerini elinden tutup oyuna çağırıyor. (denetim: g2_hayat_bilgisi)

```
Two small clay children, both smiling. The first child warmly holds the second, slightly shy child by the hand and gently pulls the friend toward a small pile of colorful toy blocks, clear body language of inviting a friend to play together. The toy blocks have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 40. `assets/images/items/toplum/sirada_bekle.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Fırın tezgâhı önünde üç çocuk yandan görünüşte tek sıra hâlinde sırasını bekliyor.

```
a small claymation vignette, seen from the side: a bakery counter with a baker behind it; three children stand in a straight single-file queue, one behind the other, each child behind the previous one, all facing the counter and waiting their turn. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 41. `assets/images/items/toplum/one_gec.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sıradaki çocukları geçip öne fırlayan çocuk; sıradakiler şaşkın ve biraz üzgün. (denetim: g2_hayat_bilgisi)

```
Four small clay children in a line seen from the side. The last child dashes forward past all the others and runs to the very front of the line with a determined look, pushing ahead with one elbow. The other three children stand in the line looking surprised and a little upset. Clear queue-jumping action. The first child in the line holds a round loaf of bread. The loaf has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 42. `assets/images/items/sahne/firin_sirasi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Fırın tezgâhının önünde sırada bekleyen çocuklar; tabela ya da yazı yok. (denetim: g2_hayat_bilgisi)

```
Inside a cozy pastel clay bakery: a wooden counter with baskets full of round loaves of bread, a friendly adult clay baker standing behind the counter, and in front of the counter a line of four small children waiting one behind another toward the counter. No sign, no signboard, no writing and no pictograms anywhere on the walls or shop front. The loaves and baskets have no face, no eyes and no mouth. dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 43. `assets/images/items/sahne/okul_bahcesi_cicek.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Okul bahçesinde solmuş, boynu bükük çiçekler; toprak kuru ve çatlak. (denetim: g2_hayat_bilgisi)

```
A school garden flowerbed in front of a low school wall. All the flowers are wilted and drooping: bent stems, pale yellow and brown limp petals, dry pale cracked soil, and a small empty watering can lying beside the flowerbed. The mood is thirsty and sad but gentle. The flowers and the watering can have no face, no eyes and no mouth. No characters. dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 44. `assets/images/items/milli/tbmm_1920.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** İlk Meclis binası: sade, iki katlı taş bina, çatıda bayrak; tabela ya da yazı yok. (denetim: g2_hayat_bilgisi)

```
A simple historic parliament building in a green clay landscape, a modest two-storey pale beige stone building with a flat red-tiled roof, three arched windows on the upper floor, a plain brown wooden double door in the middle and a red Turkish flag on a pole above the entrance, with a few small clay trees and grass in front. Absolutely no signboard, no sign, no plaque and no writing anywhere on the building. The building has no face, no eyes and no mouth. No characters. dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 45. `assets/images/items/bayram/yalniz_tv.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Ailesinden ayrı, tek başına televizyon izleyen çocuk; kanepenin geri kalanı boş. (denetim: g2_hayat_bilgisi)

```
A small clay child sitting alone at the far end of a big sofa, watching a television that stands on a low table in front of the sofa. The rest of the sofa is clearly empty, with no other people anywhere, and the child looks a little lonely. The television and the sofa have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 46. `assets/images/items/iletisim/baska_yere_bak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Başı yana dönük, bakışı başka yere kaçan, kollarını kavuşturmuş çocuk. (denetim: g2_hayat_bilgisi)

```
One small clay child standing with arms crossed and the head turned sharply to the side in profile, eyes looking away to the far side and clearly not at the viewer, a bored, uninterested expression, obviously ignoring whoever is talking. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 47. `assets/images/items/iletisim/kolundan_cek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bir çocuk dikkat çekmek için arkadaşının kolunu çekiştiriyor. (denetim: g2_hayat_bilgisi)

```
Two small clay children. The first child tugs hard at the second child's sleeve and arm to get attention. The pulled child leans away and looks annoyed. Both children fully visible. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 48. `assets/images/items/iletisim/bagir.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Elleri huni gibi ağzında, ağzı kocaman açık, bağıran çocuk. (denetim: g2_hayat_bilgisi)

```
One small clay child shouting loudly: both hands cupped around a very wide open mouth like a funnel, head tilted slightly back, eyes squeezed shut, tongue visible, with a few simple curved sound-wave lines in front of the mouth. Clearly a loud shout. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 49. `assets/images/items/arkadas/ozur_dile.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Karşısındaki arkadaşına dönük, elini göğsüne koyup özür dileyen çocuk. (denetim: g2_hayat_bilgisi)

```
Two small clay children facing each other. The first child bows his head slightly, with one hand on the chest and the other hand held out toward the friend, a sorry, apologetic expression, looking toward the second child. The second child, the friend, looks back and smiles gently. Clear apology moment. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 50. `assets/images/items/bilgi112/ne_oldu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çatısından küçük alevler ve duman çıkan ev: ne olduğunu anlatan acil durum. (denetim: g2_hayat_bilgisi)

```
A small pastel clay house with a few small friendly orange clay flames and a puff of soft grey smoke coming out of the roof window, clearly showing an emergency event, not scary. The house has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 51. `assets/images/items/bilgi112/yemek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tabakta spagetti, köfte ve bezelyeden oluşan yemek. (denetim: g2_hayat_bilgisi)

```
A round white clay dinner plate holding a meal: spaghetti strands, two meatballs, a few green peas and a carrot slice, seen from slightly above. The plate and the food have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 52. `assets/images/items/acil112/saka_yapma.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Oyuncak telefonla arama yapmak isteyen arkadaşını elini kaldırarak engelleyen çocuk. (denetim: g2_hayat_bilgisi)

```
Two small clay children. One child holds a toy telephone and is about to dial. The other child stands in front of him, raising one flat open palm in a clear 'stop' gesture and shaking his head with a serious but kind expression, blocking his friend from making the call. The toy telephone has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 53. `assets/images/items/sahne/bisikletten_dustu.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Bisikletten düşmüş çocuk yerde oturuyor, dizindeki kırmızı sıyrık açıkça görünüyor. (denetim: g2_hayat_bilgisi)

```
A park path in a clay diorama. A small clay boy sits on the ground beside a small pastel bicycle lying on its side, holding his knee with a sad teary face. A clearly visible small bright red scrape on his bare knee. Trees and grass around, no other people. The bicycle has no face, no eyes and no mouth. dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 54. `assets/images/items/sahne/aile_pansuman.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dizinde sıyrık olan çocuk; anne yara bandı yapıştırıyor, baba ilk yardım kutusu tutuyor.

```
a small claymation vignette: a child sitting on a front step with a small red scrape on one knee, the mother kneeling in front of the child and putting a plaster on the knee, the father standing beside them holding an open white first-aid box, a small bicycle lying on the grass. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 55. `assets/images/items/milli/askerler.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yan yana dizilmiş, üniformalı ve kepli dört asker; yetişkin oranlarında. (denetim: g2_hayat_bilgisi)

```
Four clay soldiers standing in a straight row at attention with adult proportions, tall and slim, wearing olive-green military uniforms with caps and brown boots, hands at their sides, serious dignified faces. No weapons. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 56. `assets/images/items/milli/meclis.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Hikâyedeki ilk Meclis binasıyla aynı bina: sade iki katlı taş yapı, çatıda bayrak. (denetim: g2_hayat_bilgisi)

```
A simple parliament building, a modest two-storey pale beige stone building with a flat red-tiled roof, three arched windows on the upper floor, a plain brown wooden double door in the middle and a red Turkish flag on a pole above the entrance. Same building as the first parliament in Ankara, no signboard, no sign and no writing. The building has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 57. `assets/images/items/milli/okul_binasi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Meclis'ten ayırt edilsin diye: renkli okul binası, bahçesinde kaydırak ve salıncak var; bayrak ve yüz yok. (denetim: g2_hayat_bilgisi)

```
A cheerful wide two-storey school building in bright pastel yellow and blue with a red roof, many big square windows, a small bell on the roof and a slide and a swing in the yard beside it. No flag, no signboard, no writing. The building has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 58. `assets/images/items/milli/genclik_spor.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Koşu duruşunda, boynunda madalya olan spor yapan çocuk; yanında top ve ip. (denetim: g2_hayat_bilgisi)

```
A cheerful clay child in a pastel t-shirt and shorts sprinting in a running pose, one knee up and arms swinging, a small gold clay medal around the neck. A clay soccer ball and a jump rope lie on the ground beside the child. Sporty and energetic, no flags. The ball has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 59. `assets/images/items/hava/cicek_toplayan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** İlkbaharda çayırda çiçek toplayan çocuk, yanında kelebek. (denetim: g2_hayat_bilgisi)

```
A small clay child kneeling in a fresh green meadow and gently picking colorful spring flowers, holding a small bouquet of tulips and daisies, a butterfly flying nearby. The flowers have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 60. `assets/images/items/hava/lale_bahcesi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Taze yeşil çimde açmış kırmızı, sarı ve pembe laleler. (denetim: g2_hayat_bilgisi)

```
A neat patch of fresh green grass with a row of blooming red, yellow and pink tulips and a few tiny blossoms, a clear spring feeling. The flowers have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 61. `assets/images/items/hava/kestane.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Parlak kahverengi kestaneler, dikenli yeşil açılmış bir kabuk ve birkaç turuncu sonbahar yaprağı. (denetim: g2_hayat_bilgisi)

```
A small pile of shiny brown chestnuts with one spiky green half-open chestnut husk and a few orange autumn leaves under them. The chestnuts and leaves have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 62. `assets/images/items/onlem/dolap_sabitle.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Duvara metal bağlantı parçası ve vidalarla sabitlenmiş uzun dolap. (denetim: g2_hayat_bilgisi)

```
A tall pink clay wardrobe standing against a short piece of wall, fastened to the wall with a thick grey metal bracket strap at the top and two big clearly visible screws, so the safety fixing is obvious. The wardrobe has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 63. `assets/images/items/tasarruf/isik_kapat.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kapı aralığında anahtarı kapatan çocuk; arkasındaki oda karanlık, tavan lambası sönük. (denetim: g2_hayat_bilgisi)

```
A small clay child standing in a doorway, reaching up and pressing a wall light switch with a finger. Behind him the room is dim and dark: the ceiling lamp is switched off, dull grey with no glow, and the room has calm dark blue tones. The lamp, the switch and the room have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 64. `assets/images/items/tasarruf/isik_acik_birak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çocuk odadan çıkıp gidiyor; arkadaki boş odada tavan lambası yanık kalmış, dışarısı gündüz.

```
a small claymation vignette: a child walking out of a bedroom door toward the viewer and leaving; behind the child the empty bedroom has its ceiling lamp switched on and glowing brightly, bright daylight comes through the bedroom window, nobody is in the room. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 65. `assets/images/items/tasarruf/kagit_iki_yuz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bir yüzü çizili kâğıdı çevirip boş arka yüzüne çizen çocuk. (denetim: g2_hayat_bilgisi)

```
A small clay child sitting at a small table, holding up a sheet of paper that already has a crayon scribble drawing on its front, turning it over and about to draw on the blank back side with a crayon in the other hand. A tidy stack of used sheets lies beside him. Only simple colorful scribbles on the paper. The paper and the crayon have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 66. `assets/images/items/tek/led.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** LED ampul/lamba: yüzsüz, parlayan modern LED ampul (süt beyazı kubbe, küçük parlak LED noktaları halkası, beyaz kanatlı taban, soğuk beyaz ışık). Dikdörtgen/ekran değil. g2 hayat bilgisi u06 da kullanıyor (aydınlatma sırası); yeni görsel orada da uyar. (denetim: g3_hayat_bilgisi)

```
a modern LED light bulb standing upright and glowing, a round milky-white frosted dome with a ring of small bright LED dots visible inside, a white ribbed cooling base and a silver screw cap, soft cool-white glow rays around the dome, clearly a lamp bulb and clearly not a screen or a rectangle. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 67. `assets/images/items/plan/gec_yat.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Gece geç saatte yatmayıp esneyen, gözlerini ovuşturan pijamalı çocuk; arkasında karanlık pencere ve ay. (denetim: g2_hayat_bilgisi)

```
A small clay child in pajamas sitting up on the floor late at night, rubbing sleepy eyes and yawning widely, scattered toy blocks around, a made bed with untouched blanket behind and a window showing a dark blue night sky with a moon and stars. The blocks, the bed and the moon have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 68. `assets/images/items/iletisim/bekle_dinle.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Elleri dizinde, sakin ve dik oturan, kulağını konuşana çevirmiş dikkatle dinleyen çocuk. (denetim: g2_hayat_bilgisi)

```
A small clay child sitting calmly and upright, both hands resting neatly on the knees, head slightly tilted to one side with one ear turned toward the right as if listening carefully, eyes looking attentively to the right, a gentle calm smile. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 69. `assets/images/items/arkadas/sucla.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bir çocuk karşısındakine parmağını uzatıp suçluyor; karşıdaki çocuk üzgün ve geri çekiliyor. (denetim: g2_hayat_bilgisi)

```
Two small clay children. The first child frowns and points an accusing finger straight at the second child. The second child looks hurt and worried and shrinks back with hands raised. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 70. `assets/images/items/bilgi/sevdigi_renk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tek bir canlı renkte (gök mavisi) boya: açık boya kabı, fırça ve yanında yuvarlak boya lekesi. (denetim: g2_hayat_bilgisi)

```
A small open pot of bright sky-blue paint with a thick paintbrush dipped in it, and a big round splash of the same sky-blue paint beside the pot. Only one single clear color, blue. The pot and the brush have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 71. `assets/images/items/sahne/park_cop.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Parkta yolun ortasında kolayca fark edilen büyük bir çöp yığını. (denetim: g2_hayat_bilgisi)

```
A clay park scene with a wooden bench and a green trash bin at the side, and in the middle of the path a large, clearly visible pile of litter: a big crumpled pink paper ball, a flattened blue juice box, a banana peel and a candy wrapper, all big and easy to notice. Trees and grass. No writing on the packaging. The litter, the bench and the bin have no face, no eyes and no mouth. No characters. dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 72. `assets/images/items/hava/plaj.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kumsal: kum kalesi, kırmızı kova, kürek, deniz yıldızı, deniz kabuğu ve önde mavi dalga. (denetim: g2_hayat_bilgisi)

```
A small clay sand mound with a sandcastle, a red toy bucket and a small spade stuck in the sand, a starfish and a seashell, and a soft blue wave edge in front, a clear summer seaside feeling. Nothing here has a face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 73. `assets/images/items/kaynak/aileyle_internet.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yetişkin bir anne, küçük çocukla birlikte dizüstü bilgisayardan güvenli şekilde araştırma yapıyor. (denetim: g2_hayat_bilgisi)

```
An adult mother with clearly adult proportions (tall, long hair, wearing a cardigan) sitting next to a young child who is only half her size, both looking at a laptop; the mother gently points at the screen while the child watches, safe shared internet use. The screen shows only a simple colorful picture of a book and a globe. The laptop has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 74. `assets/images/items/kaynak/reklam.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dizüstü ekranında açılmış, altın kupa ve konfetili göz alıcı 'ödül kazandın' penceresi. (denetim: g2_hayat_bilgisi)

```
A laptop with an open flashy pop-up window on its screen showing a big golden trophy, confetti, stars and one big shiny button shape, a loud attention-grabbing advertisement. No letters or numbers on the screen. The laptop has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 75. `assets/images/items/tek/telefon_dev.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çocuktan iki kat büyük, antenli dev telefon; çocuk hayretle bakıyor. (denetim: g2_hayat_bilgisi)

```
A small clay child standing next to a giant old-fashioned brick-style mobile phone with a long antenna. The phone is more than twice as tall as the child, who looks up at it in amazement, size comparison very clear. The phone has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 76. `assets/images/items/sanat/ebru.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Su dolu tepsi: yüzeyde girdap desenli pastel ebru boyası, ince uzun saplı fırça suyun yüzeyine dokunuyor. (denetim: g2_hayat_bilgisi)

```
A shallow rectangular tray filled with water; on the water surface are swirling marbled patterns of pastel blue, pink, yellow and green paint, and a thin brush with a long wooden handle touches the water surface drawing a swirl, traditional marbling art. The tray and the brush have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 77. `assets/images/items/sahne/karis_olcum.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** İki çocuk alçak bir masanın karşılıklı uzun kenarlarında, her biri masanın boyunu açık elinin karışıyla ölçüyor; küçük çocuğun eli küçük, büyük çocuğun eli büyük. Cetvel ya da işaretli nesne yok. (denetim: g2_matematik)

```
Two young children kneeling on opposite long sides of a low wooden clay table, each measuring the table's length with the span of one open hand: each child presses a hand flat on the tabletop with the fingers spread wide, thumb and little finger stretched out, the hand placed one after another along the table edge as a hand-span measurement. The left boy has short black hair and a green long-sleeved shirt and a visibly smaller hand, the right boy has brown hair and a yellow t-shirt and a visibly bigger hand. Both look curious and concentrated, with simple friendly faces. No ruler, no tape measure and no marked objects anywhere in the scene. The table has no face, no eyes and no mouth. Side view, whole table and both children fully visible, 16:9 landscape composition. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 78. `assets/images/items/sahne/cetvel_olcum.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** İki çocuk masanın kenarına uzun sarı bir cetveli birlikte tutuyor; cetvelde yalnız düz çentikler var, rakam yok. (denetim: g2_matematik)

```
Two smiling young children kneeling on opposite long sides of a low wooden clay table, together holding one long flat yellow ruler laid along the table's edge to measure its length, one child holding each end of the ruler. The ruler has only thin, plain, evenly spaced tick marks and absolutely no digits, numerals or letters on it. The left boy has brown hair and a light teal t-shirt, the right boy has dark brown hair and a cream t-shirt. The table and the ruler have no face, no eyes and no mouth. Side view, whole table, ruler and both children fully visible, 16:9 landscape composition. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 79. `assets/images/items/hikaye/g2_semsiye_yagmur.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yağmurlu sokakta Ece mor şemsiyesini kendi üstünde tutuyor, yanındaki Can şemsiyesiz, hafif ıslak saçlarla yağmura bakıyor. Karakterler g2_semsiye görseliyle aynı (Ece: kahverengi saçlı, pembe tişört, eflatun şort; Can: kısa kahverengi saçlı, mavi tişört, koyu pantolon). (denetim: g2_turkce)

```
two school children walking on a quiet street in light rain, a girl with shoulder-length brown hair, a pink t-shirt and lilac shorts holding one big lilac umbrella over herself and smiling, and next to her a boy with short brown hair, a blue t-shirt and dark trousers who has no umbrella, standing in the rain with slightly wet hair and shoulders, looking up at the raindrops with a hopeful look. The two children stand a few steps apart. Only the two children have faces; the umbrella, the houses, the trees and every other object have no face, no eyes and no mouth. Both children have small child proportions. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 80. `assets/images/items/fen/fosil_3_camur.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çamur örtüsü: kesit blokta balık iskeleti kalın kahverengi çamur ve kum katmanının ALTINDA gömülü; üst yüzey düz çamur, üstte kemik görünmez. (denetim: g3_fen)

```
a small clay diorama block cut open to show a lake bottom seen from the side: a thick smooth blanket of dark brown mud and sand lies on top and clearly BURIES a small fish skeleton, the skeleton is only visible through the cut side of the block as pale bones sitting underneath the mud layer, the top surface of the block is plain smooth mud with no bones showing on top, no water layer, no rainbow layers, calm and gentle, not scary. The skeleton is bare bones only, no eyes. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 81. `assets/images/items/fen/fosil_2_dip.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Göl dibi: üstte berrak mavi su katmanı, altında kumlu dipte açıkta yatan balık iskeleti; üstü hiçbir şeyle örtülü değil (fosil_3 ile açıkça ayrışır). (denetim: g3_fen)

```
a small clay diorama block cut open to show the bottom of a lake seen from the side: a clear light-blue water layer with a gently wavy surface on top, and below it a layer of pale sand where a small fish skeleton lies fully exposed and uncovered, every bone clearly visible, nothing covers the skeleton, calm and gentle, not scary. The skeleton is bare bones only, no eyes. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 82. `assets/images/items/fen/sahne/iki_vurus.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** İki ayrı şerit: üstte hafif vurulan top yakında durmuş, altta güçlü vurulan top bayrağa kadar gitmiş.

```
two separate parallel grass lanes, one above the other, each lane with its own child and its own ball, both children start at the same white line on the left; in the top lane a child gently taps a ball and the ball stops close to the line; in the bottom lane a child kicks hard and the ball has rolled far to the right end of the lane next to a small flag. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 83. `assets/images/items/fen/bisiklet_fren.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Fren yapan bisikletli: çocuk frene basan eliyle kolu sıkıyor, arkaya yaslanmış, arka tekerleğin arkasında kısa fren izi ve toz bulutu; belirgin yavaşlama. (denetim: g3_fen)

```
a child on a small bicycle squeezing the hand brake lever on the handlebar with one clearly visible clenched hand, leaning slightly back, the rear wheel skidding to a stop with two short curved skid marks behind it and a small puff of dust, seen from the side, the bicycle is slowing down and stopping 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 84. `assets/images/items/fen/itme_salincak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çocuk salıncaktaki arkadaşını arkasından iki eliyle itiyor.

```
a child standing behind a simple wooden A-frame playground swing, pushing a friend's back forward with both hands, the friend sitting on the swing seat moving forward, strong sense of pushing motion. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 85. `assets/images/items/fen/bacakli_iribas.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Büyümüş iribaş: yeşilimsi gri gövde, uzun kuyruk ve gövdenin arkasında iki net, yüzgeç olmayan küçük bacak ve perdeli ayak. (denetim: g3_fen)

```
a tadpole in its later growing stage seen from the side: a rounded greenish-grey body, a long thin tail, and two clearly visible small back legs with little webbed feet sticking out from the rear of the body, no front legs yet, no fins on its sides, two big round friendly eyes (it is an animal) 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 86. `assets/images/items/fen/bakir.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bakır: parlak, metalik kırmızımsı turuncu bir bakır külçe ve üstünde sarılı çıplak bakır tel (portakal gibi görünmemeli). (denetim: g3_fen)

```
a shiny metallic copper ingot bar in reddish-brown orange with a polished metal sheen, with a small neat coil of thin bare copper wire lying on top of it, clearly metal and not fruit, rectangular bar shape It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 87. `assets/images/items/fen/buhar.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yalnız su buharı: yukarı kıvrılan yumuşak beyaz buhar bulutu; çaydanlık ya da kap yok. (denetim: g3_fen)

```
a soft fluffy white cloud of water steam rising upward in gentle curling swirls with a few small round puffs, shown completely alone, no kettle, no pot, no cup and no container at all, wispy and floating It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 88. `assets/images/items/fen/balon_hava.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yalnız havayla şişmiş balon: yuvarlak, düğümlü kırmızı balon; içinde ve çevresinde kıvrımlı pastel hava çizgileri; pompa yok. (denetim: g3_fen)

```
a round red clay balloon fully inflated with air and tied with a small knot at the bottom, soft swirly pastel air-swirl curls drawn inside and all around the balloon to show it is full of air, no pump, no string, no other object It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 89. `assets/images/items/fen/sunger.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Mutfak süngeri: yeşil kaba yüzeyli üst katman ve sarı gözenekli sünger gövde (peynire benzemez). (denetim: g3_fen)

```
a rectangular kitchen cleaning sponge made of two layers: a soft yellow porous foam body with many tiny holes and a thin rough green scrubbing layer on top, slightly squeezed at one corner to look soft, clearly a dish sponge and not cheese It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 90. `assets/images/items/fen/karton_kutu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Katlanmış karton kutu: açık kapakları üstte duran, kahverengi oluklu karton yapışkan bantlı kutu. (denetim: g3_fen)

```
a folded brown corrugated cardboard box with its four top flaps open and standing up, visible cardboard folds and edges and a strip of tape on the side, clearly a cardboard box and not a block of chocolate or wood It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 91. `assets/images/items/fen/yogurt_kabi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Plastik yoğurt kabı: pembe-mavi renkli, kapaklı, etiket bandı olan (yazısız) plastik kap; kâğıt bardağa benzemez. (denetim: g3_fen)

```
a small round plastic yogurt tub made of glossy pastel pink and blue plastic with a snap-on lid and a plain colored band around it as a label, no printed pictures on the band, clearly a plastic container and not a paper cup It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 92. `assets/images/items/fen/sahne/cam_kagit_kutusu.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Tek mavi kâğıt geri dönüşüm kutusu gazete ve kâğıt dolu; bir çocuk (Ali) yeşil cam şişeyi bu kutunun içine atıyor, şişe kâğıtların arasında görünüyor. (denetim: g3_fen)

```
a single blue recycling bin that is full of crumpled paper and newspapers, and a small boy standing next to it just dropping a green glass bottle into the same paper bin so that the bottle is clearly seen sticking out among the papers, only this one bin in the scene, nothing else, one boy with friendly eyes only No object has a face, eyes or a mouth. dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 93. `assets/images/items/fen/tasarruf_isik_kapat.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Gündüz, güneşli oda; çocuk düğmeye basmış, tavan lambası sönük.

```
a small claymation vignette: a bright daytime room with sunlight from the window, a child pressing a light switch on the wall with one finger, the ceiling lamp above is switched OFF: the bulb is grey and dark and gives no light. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 94. `assets/images/items/fen/sahne/alti_lamba.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** İki raf, her rafta eşit aralıklı üç özdeş masa lambası: toplam tam altı lamba, hepsi sıcak sarı yanıyor. (denetim: g3_fen)

```
exactly SIX identical small table lamps arranged on two wooden shelves, three lamps on the upper shelf and three lamps on the lower shelf, evenly spaced and clearly separated so they are easy to count, all six lamps glowing warm yellow, nothing else on the shelves, no windows No object has a face, eyes or a mouth. dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 95. `assets/images/items/fen/granit.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Granit: gri-pembe tuzlu-biber benekli, pürüzlü, köşeli sert kayaç parçası (yumurtaya benzemez). (denetim: g3_fen)

```
a chunky angular piece of granite rock with a speckled salt-and-pepper pattern of tiny grey, black, white and pink grains all over the surface, rough and slightly sparkly, irregular rock shape with flat cut top, clearly a rock and not an egg It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 96. `assets/images/items/fen/karisim_kum_nohut.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kase içinde kum ve nohut iç içe karışık; kum taneleri nohutların arasında ve üstünde belirgin. (denetim: g3_fen)

```
a pink bowl filled with a thoroughly mixed pile of golden sand and many round beige chickpeas, fine yellow sand grains clearly visible filling the gaps between the chickpeas and covering parts of them, sand and chickpeas evenly mixed together It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 97. `assets/images/items/fen/davranis_kablo_tut.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çocuk yıpranmış lamba kablosunu elinde tutuyor: kablonun yalıtımı yırtık, içinden ince bakır teller görünüyor; yanında küçük masa lambası. (denetim: g3_fen)

```
a child sitting on the floor reaching out and holding a frayed lamp cable in one hand, the cable's pastel plastic coating is torn open and thin copper wire strands stick out clearly, a small table lamp lying beside the child, simple clear scene 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 98. `assets/images/items/fen/sahne/tuketim_grafik.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** İki aynı genişlikte, aynı derinlikte sütun: soldaki uzun, sağdaki belirgin kısa; üstlerinde birer minik ampul; sayı/yazı yok. (denetim: g3_fen)

```
a simple bar chart made of exactly two clay columns standing on a flat base, both columns have exactly the same width and the same depth and differ only in height: the LEFT column is tall and the RIGHT column is clearly much shorter, a small glowing light bulb floating above each column, no numbers, no letters, no axis labels No object has a face, eyes or a mouth. dominant palette: turquoise, mint and clean white with small coral accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 99. `assets/images/items/fen/koruma_fidan_dik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çocuk dizlerinin üstünde, küçük kürekle açtığı çukura fidanı dikiyor; çıplak toprak ve küçük fidan belirgin. (denetim: g3_fen)

```
a child kneeling on the ground and planting a small tree sapling: one hand holds the thin sapling upright in a freshly dug hole, the other hand holds a small shovel, a little mound of brown soil beside the hole, the sapling has only a few leaves 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 100. `assets/images/items/fen/zarar_dal_kirma.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çocuk bir ağaç dalını iki eliyle bükerek kırıyor; dal çatırdıyor, birkaç yaprak düşüyor. (denetim: g3_fen)

```
a child standing next to a young tree and grabbing a living branch with both hands, bending it hard so that the branch is cracking and snapping in the middle, a few green leaves falling, the child looks like they are doing something unkind to the tree 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 101. `assets/images/items/katki/yangin_sondu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yangın söndürüldükten sonraki ev: alev yok; ıslak, hafif isli çatı, ince bir duman telesi ve su birikintisi. (denetim: g3_hayat_bilgisi)

```
a small cute pastel clay house just after its fire has been put out: there is NO fire and NO flames anywhere, the roof is wet and slightly sooty with a few dark grey patches, one thin wisp of grey smoke curls up from the chimney, shiny water droplets run down the walls and a small blue puddle lies in front of the door, the house looks safe and calm. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 102. `assets/images/items/toplum/yer_ver.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Otobüste çocuk ayağa kalkmış, boşalan koltuğu bastonlu yaşlı kadına gösteriyor; önde yetişkin şoför.

```
a small claymation vignette inside a city bus: a child has stood up from a bus seat and stands in the aisle pointing kindly to the now empty seat; an elderly woman with a walking cane stands next to the empty seat smiling and about to sit down; an adult bus driver sits at the steering wheel at the front. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 103. `assets/images/items/doga/temiz_hava.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Temiz hava: gözleri kapalı, derin nefes alan mutlu çocuk; çevresinde soluk mavi kil rüzgâr kıvrımları ve uçuşan taze yeşil yapraklar. Ağaç yok (item.doga.agac kartıyla benzemesin). (denetim: g3_hayat_bilgisi)

```
a happy clay child standing with eyes gently closed, chest lifted and smiling while taking a deep breath of fresh air, soft pale-blue clay air swirls and ribbons curl gently around the child and a few small fresh green leaves float in the swirls, there is no tree in the picture. Only the child has a face; the air swirls and leaves have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 104. `assets/images/items/sorumluluk/kitabi_unut.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sınıfta sırasında oturan çocuk boş çantasına üzgün bakıyor; masasında kitap yok.

```
a small claymation vignette: a child sitting at a school classroom desk looking sadly into an open empty school backpack, no book on the desk, other children's desks have books. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 105. `assets/images/items/hak/bahceye_cik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bahçeye çıkmak: bahçe kapısına doğru yürüyen mutlu çocuk (açık ahşap kapı, çiçekler). (denetim: g3_hayat_bilgisi)

```
a happy clay child walking toward an open wooden garden gate, mid-step with a smile, colorful flowers and a patch of green lawn visible beyond the open gate, a short low fence on both sides of the gate, the child is clearly going outside to the garden. Only the child has a face; the gate, fence and flowers have no face. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 106. `assets/images/items/guvenlik/ilac_seker.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Giyinik çocuk, kırmızı haçlı ilaç şişesinden renkli hapları şeker sanıp yemek üzere.

```
a six-year-old child in a t-shirt and shorts sitting on the floor holding an open medicine bottle with a red cross label, colorful round pills spilled in the other hand, the child mistakenly thinking the pills are candy and about to eat them. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 107. `assets/images/items/sonuc/gece_gorunur.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Gece görünür olmak: karanlık yolda yansıtıcı yelekli çocuk, bir aracın farları onu aydınlatıyor (araç yüzsüz). Aynı görsel tur 12 ve 13 için. (denetim: g3_hayat_bilgisi)

```
a small round clay diorama base showing a dark navy-blue night road with a crescent moon and a few tiny stars above, a clay child standing in the middle wearing a bright yellow-green reflective safety vest with two shiny silver stripes that glow clearly, the front half of a small pastel car at the left with two bright headlight beams lighting the child up, the child is easily visible in the dark. Only the child has a face; the car has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 108. `assets/images/items/toplum/paylas.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Toplumda paylaşmak: komşuya ikram. Çit arkasında yaşlı bir komşuya kurabiye tabağı uzatan çocuk; arkada komşu evleri (aile içi sofra/paylaşma görsellerinden farklı). (denetim: g3_hayat_bilgisi)

```
a clay girl standing in front of her small pastel house holding out a plate of round cookies over a low garden fence to a smiling elderly clay neighbor man with a mustache who stands in front of the next house and reaches for the plate, two neighboring pastel houses side by side behind them, a clear picture of sharing with a neighbor, on a small round clay base. Only the people have eyes; the houses and the plate have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 109. `assets/images/items/sahne/copler_kucuk.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sokakta biriken çöp: iki ev arasındaki yol çöp torbaları, devrilmiş taşkın çöp kutuları ve etrafa saçılmış atıklarla dolu; sinekler (kötü koku). Tüm torbalar ve evler yüzsüz. temiz_sokak ile açık karşıtlık. (denetim: g3_hayat_bilgisi)

```
a small round clay street diorama: two pastel houses facing each other with a grey road between them, the road and pavements overflowing with big piles of tied garbage bags, tipped-over overfull trash bins, and scattered paper and bottle litter, a few tiny flies buzzing above the pile to suggest a bad smell, the street looks dirty and unpleasant, the bags are plain tied plastic-looking bags in dull colors. It has no face, no eyes and no mouth. The houses and the garbage bags are plain objects without any face. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 110. `assets/images/items/koruma/rehber.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kasketli ve bayraklı yetişkin rehber taş kaleyi gösteriyor; üç çocuk dinliyor.

```
a small claymation vignette: an adult tour guide wearing a cap and holding a small flag on a stick, pointing at a big old grey stone castle wall with towers, a group of three children standing and listening carefully. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 111. `assets/images/items/koruma/vazgecir.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Arkadaşını vazgeçirmek: taş duvara bir şey kazımak üzere olan çocuğu, arkadaşı elini tutup diğer avucunu "dur" diye kaldırarak vazgeçiriyor. (denetim: g3_hayat_bilgisi)

```
two clay children standing in front of a grey stone wall, the first child holds a small pointed stone as if about to scratch the wall but looks hesitant, the second child gently holds the first child's wrist with one hand and raises the other open palm in a friendly stop gesture while shaking the head kindly, caring and persuading, no drawing on the wall. Only the children have eyes; the wall and stone have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 112. `assets/images/items/birlik/alay.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Alay etmek: üç çocuk yarım daire hâlinde, yalnız duran dördüncü küçük çocuğu parmakla gösterip gülüyor; dışlanan çocuk başı öne eğik, üzgün. (denetim: g3_hayat_bilgisi)

```
three clay children standing in a half circle pointing their fingers and laughing mockingly at a fourth smaller clay child who stands alone in front of them with his head down and arms hugging himself, looking sad and left out, the group is clearly making fun of the lonely child, on a small round clay base. Only the children have faces. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 113. `assets/images/items/simge/guclendirmez.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Birliği güçlendirmez etiketi: tek başına duran tek bir el (boncuk halkası yok); "yalnız el" simgesi, item.simge.guclendirir (birleşen eller) ile karşıt. (denetim: g3_hayat_bilgisi)

```
one single small clay child's hand held up alone, open palm facing the viewer with a short sleeve cuff at the wrist, a lone hand only, with nothing around it, no other hands, no beads, no ring, a feeling of being alone. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 114. `assets/images/items/kroki/firin_k.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kroki: kuşbakışı mahalle haritası. Fırın turuncu çatılı bina (bacası ve çatıda büyük ekmek biçimli yazısız tabela); kırmızı yıldız FIRININ üstünde. park_k ve okul_k ile AYNI düzen, AYNI ölçek ve aynı yakınlık; yalnız yıldızın yeri değişir (ideal: tek tabanı üretip yıldızı taşımak). (denetim: g3_hayat_bilgisi)

```
a flat top-down bird's-eye plan view of a tiny town map filling the whole square frame, cream ground, two grey roads crossing in the exact center, in the top-left quarter a green park with four round trees and a small brown bench, in the top-right quarter a blue-roofed school with a small red flag on its roof, in the bottom-right quarter an orange-roofed bakery with a small chimney and a big bread-loaf shaped sign on its roof, in the bottom-left quarter and top-middle one plain red-roofed house each, same zoom level, a big red 3D clay star marker standing ON TOP of the orange bakery building. The buildings and trees have no face, no eyes and no mouth. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 115. `assets/images/items/kroki/park_k.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kroki: firin_k ile birebir aynı harita tabanı ve ölçek; kırmızı yıldız PARKIN üstünde. (denetim: g3_hayat_bilgisi)

```
a flat top-down bird's-eye plan view of a tiny town map filling the whole square frame, cream ground, two grey roads crossing in the exact center, in the top-left quarter a green park with four round trees and a small brown bench, in the top-right quarter a blue-roofed school with a small red flag on its roof, in the bottom-right quarter an orange-roofed bakery with a small chimney and a big bread-loaf shaped sign on its roof, in the bottom-left quarter and top-middle one plain red-roofed house each, same zoom level, a big red 3D clay star marker standing ON TOP of the green park. The buildings and trees have no face, no eyes and no mouth. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 116. `assets/images/items/kroki/okul_k.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kroki: firin_k ile birebir aynı harita tabanı ve ölçek; kırmızı yıldız OKULUN (mavi çatılı, bayraklı bina) üstünde. (denetim: g3_hayat_bilgisi)

```
a flat top-down bird's-eye plan view of a tiny town map filling the whole square frame, cream ground, two grey roads crossing in the exact center, in the top-left quarter a green park with four round trees and a small brown bench, in the top-right quarter a blue-roofed school with a small red flag on its roof, in the bottom-right quarter an orange-roofed bakery with a small chimney and a big bread-loaf shaped sign on its roof, in the bottom-left quarter and top-middle one plain red-roofed house each, same zoom level, a big red 3D clay star marker standing ON TOP of the blue school building. The buildings and trees have no face, no eyes and no mouth. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 117. `assets/images/items/kaynak/hemen_inan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çocuk tablette uçan domuz resmine şaşkın şaşkın bakıyor, hemen inanıyor.

```
a small claymation vignette: a child holding a tablet whose screen shows a pig with wings flying in the sky, the child staring with wide amazed eyes and an open mouth, completely believing the silly picture. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 118. `assets/images/items/sahne/top_paylasilmiyor.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Top paylaşılmıyor: sol önde tek çocuk topu göğsüne bastırıp arkasını dönüyor; sağda üç çocuk boş elle, üzgün duruyor. (denetim: g3_hayat_bilgisi)

```
a sunny school playground diorama, dominant palette: sunny yellow, sky blue and brick red accents, in the left foreground one clay child hugging a colorful ball tightly to his chest and turning his back to the others with a stubborn look, on the right three clay children standing with empty hands and sad faces looking at the ball, the school building softly in the background, only four children. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 119. `assets/images/items/guvenlik/kitap_oku.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kitap okumak: koltukta oturup elinde açık renkli resimli kitabı okuyan mutlu çocuk (güvenli davranış). (denetim: g3_hayat_bilgisi)

```
a happy clay child sitting in a cozy pink armchair, holding a big open colorful picture book in both hands and reading it with a calm smile, the open book is clearly visible. Only the child has a face; the armchair and the book have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 120. `assets/images/items/guvenlik/adres_soyle.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Adres söylemek: kapıyı aralayıp konuşan çocuk, başının üstünde içinde yalnız küçük bir ev simgesi olan konuşma baloncuğu (yazı yok). (denetim: g3_hayat_bilgisi)

```
a clay child peeking out from a partly opened front door and talking, mouth open, one hand pointing outward, a round speech bubble above the child's head containing only a simple little house symbol, no letters and no numbers in the bubble, the child is telling where the home is to someone outside. Only the child has a face; the door has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 121. `assets/images/items/afet/cok_kapan.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çök-Kapan-Tutun: yere diz çökmüş, öne eğilmiş, iki kolu başını ve ensesini koruyan çocuk (masaya yaslanıp ayakta durmuyor; masa_altı kartından farklı: açık alanda çömelmiş). (denetim: g3_hayat_bilgisi)

```
a small clay child kneeling low on the floor and curled forward in the drop-cover-hold-on position, both arms and hands covering the back of the head and neck, forehead close to the knees, eyes tightly closed with a serious face, calm and protected, in an open space with no furniture. Only the child has a face. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 122. `assets/images/items/afet/binaya_girme.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çatlak evin kapısında kırmızı-beyaz şerit; ebeveyn çocuğun elinden tutup geri çekiyor.

```
a small claymation vignette: a cracked damaged house with a red and white striped barrier tape across its door, a parent holding the child's hand and gently pulling the child back away from the door, both standing outside at a safe distance. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 123. `assets/images/items/afet/toplanma_git.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Afet sonrası toplanma alanına gitmek: anne, baba ve çocuk el ele, arkada çatlak bina varken yeşil alandaki yazısız aile simgeli toplanma levhasına doğru yürüyor. toplanma_ogren (evde haritaya bakma) ile ayrışsın. r39 ve r40 kullanır. (denetim: g3_hayat_bilgisi)

```
a clay mother, father and child walking hand in hand in mid-step away from a cracked damaged building standing small behind them, heading toward a green sign on a post that shows a simple pictogram of three people (symbol only, no letters), on a green lawn base, calm and orderly, outdoors after an earthquake. Only the people have eyes; the building and the sign have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 124. `assets/images/items/tek/asi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Aşı: şırınga (iğnesi mavi kapaklı), küçük aşı şişesi ve pamuk topu; yüzsüz. (denetim: g3_hayat_bilgisi)

```
a cute chunky clay syringe lying slightly angled with a clear body, an orange plunger and a short needle covered by a blue cap, next to a tiny glass vaccine vial with a rubber stopper and a small white cotton ball, a vaccination set, friendly and not scary. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 125. `assets/images/items/tek/at_arabasi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** At arabası: bir atın koşumla çektiği, iki büyük tekerlekli ahşap araba (yandan görünüm). (denetim: g3_hayat_bilgisi)

```
a plump cream clay horse with a brown mane pulling a small wooden horse-drawn carriage with two big spoked wheels and a little bench seat, leather harness straps clearly connecting the horse to the carriage, side view, an old-fashioned horse and cart. Only the horse has eyes; the carriage has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 126. `assets/images/items/simetri/kare_yatay_cizgi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sarı kare; üst kenara paralel, ortadan geçmeyen (üstten üçte bir aşağıda) tek yatay kesikli çizgi. Çizgi şekli iki eşit olmayan parçaya böler, simetri doğrusu değildir. (denetim: g3_matematik)

```
a flat butter yellow clay square seen straight from above, with one thin dark dashed line running horizontally across it, parallel to the top and bottom edges, placed about one third of the way down from the top edge so that it clearly does not pass through the center and cuts the square into a small top piece and a larger bottom piece. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 127. `assets/images/items/arac/tablet.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Açık, dijital bir tablet: ekranında çizilmiş basit bir üçgen ve kare çerçeve, önünde küçük bir kil kalem. Şekil çizme aracı olarak okunmalı. (denetim: g3_matematik)

```
a modern flat tablet computer with a thick rounded mint-green clay frame, standing slightly tilted, its glowing light-blue screen shows a simple drawn triangle and a square outline made of thick colorful lines, a small clay stylus pen lying in front of it. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 128. `assets/images/items/olay/okul_gunu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sınıfta ders: kil bir sıranın başında oturan çocuk, önünde açık defter ve kalem; arkada boş yeşil tahta (yalnız yıldız ve üçgen karalaması) ve iki arkadaş. Tüm okul gününü (saatler) anlatır; eve/okula yürüyüş değil. (denetim: g3_matematik)

```
a cozy clay classroom scene: a smiling child sitting at a small wooden school desk with an open notebook and a pencil, a green chalkboard behind with only simple doodles of a star and a triangle, two other children seated at desks in the background, a big window with the sun high in the sky. Children have friendly eyes; the desk, board and notebook have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 129. `assets/images/items/olay/otobus_yolculugu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dağ yolunda uzun şehirler arası otobüs; önde yetişkin şoför, ortada pencerede uyuyan çocuk yolcu.

```
a small claymation vignette: a big long intercity coach bus driving on a winding mountain highway; an adult driver sits at the steering wheel at the front; a child passenger sits by a side window in the middle of the bus, asleep with a small pillow; the road continues far into the distance. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 130. `assets/images/items/olay/bayram_tatili.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bavulları tavanına bağlı aile arabası, bayram süslü köy evine geliyor; dede ve nine el sallıyor.

```
a small claymation vignette: a family car with suitcases tied on its roof arriving at grandparents' village house decorated with colorful festive bunting, grandparents waving happily at the door. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 131. `assets/images/items/cevre/kitap_karis.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yukarıdan kapalı mor bir kil kitap; kısa kenarının yanında art arda tam 2, uzun kenarının yanında art arda tam 3 el izi (karış) yan yana dizilmiş. Çocuk eli karışları sayarak ölçmeyi göstermeli. (denetim: g3_matematik)

```
a closed lilac clay book lying flat seen from above, with child-sized open-hand impressions in warm skin tone laid in neat rows as measuring spans around two edges: exactly two open hands in a row, thumb tip to little finger tip, touching end to end along the short edge, and exactly three open hands in a row touching end to end along the long edge, no other hands anywhere. The book has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 132. `assets/images/items/hikaye/g3_23_nisan_hazirlik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bir sınıf masasında iki çocuk: kız kırmızı kâğıdı tek bir yuvarlak uçlu güvenli çocuk makasıyla kesiyor, erkek çocuk kesilmiş süs parçalarını ve yapıştırıcıyı tutuyor. Resimde tek makas var, bıçak ya da keskin alet yok. (denetim: g3_turkce)

```
Two children sit side by side at a classroom table making paper decorations for a children's festival. The girl cuts a red paper shape with ONE small pair of child-safe scissors with chunky bright handles and blunt rounded tips. The boy next to her does not cut: he holds a few red paper shapes and a glue stick, ready to stick them on the wall. There is only one pair of scissors in the whole picture, no knife, no sharp blade, no other cutting tool. The scissors, the paper shapes and the glue stick have no face, no eyes and no mouth. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 133. `assets/images/items/durum/g3_sinif_toplantisi.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sınıf toplantısı: sıralar yarım daire düzeninde, ayakta kâğıt tutan bir kız (Ada) konuşuyor; sırasında oturan bir erkek çocuk (Kerem) öne eğilmiş, ağzı açık, elini kızın önüne uzatarak sözünü kesiyor; kız şaşkın bakıyor, birkaç çocuk izliyor. (denetim: g3_turkce)

```
A classroom meeting with small desks arranged in a half circle. A girl stands in front holding a sheet of paper and speaks to the class, with a surprised look because she was just interrupted. A boy sitting at a desk leans forward with his mouth wide open and one hand stretched out toward her, palm forward, cutting in while she is talking. Three other children sit at their desks and watch quietly. The paper and the desks have no face, no eyes and no mouth. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 134. `assets/images/items/durum/g3_piknik_cop.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Piknik: ön planda iki çocuk karşılıklı; biri dolu beyaz çöp torbasını çimenlerin üstünde tutup yere bırakmak üzere, yerde birkaç buruşuk kâğıt ve boş bir meyve suyu kutusu var; öbür çocuk endişeyle 'dur' der gibi elini uzatıyor. Arkada aile piknik örtüsünde oturuyor. (denetim: g3_turkce)

```
A family picnic on green grass under trees. In the foreground two children stand facing each other. One child holds a full small white trash bag and tilts it over the grass, about to drop it on the ground; a few crumpled paper balls and an empty juice box already lie on the grass next to the bag. The other child looks at the first child with a worried, questioning look and holds out one hand as if saying wait. Their parents sit on a pink checkered picnic blanket far behind them. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. Every child in the image has small child proportions and is clearly much shorter than the grown-ups. The trash bag, the paper balls and the juice box have no face, no eyes and no mouth. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 135. `assets/images/items/durum/g3_penguen_tartisma.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sınıfta iki çocuk karşı karşıya: biri kollarını kanat gibi çırpıp 'penguenler uçar' der gibi gururla konuşuyor, öbürü kollarını kavuşturmuş, kaşını kaldırmış, ikna olmamış bakıyor. Resimde kitap ve penguen yok. (denetim: g3_turkce)

```
Two children stand face to face in a classroom, politely disagreeing. The first child flaps both arms up and down like wings with a proud open-mouthed expression, as if claiming that penguins can fly. The second child has arms crossed, head tilted and one eyebrow raised, clearly not convinced. There is no book, no picture and no penguin anywhere in the image, only the two children, small desks and shelves in the background. The desks and shelves have no face, no eyes and no mouth. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```
