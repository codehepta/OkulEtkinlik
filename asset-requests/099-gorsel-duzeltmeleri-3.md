# 099 · Görsel düzeltmeleri 3 (ikinci içerik denetimi)

**Öncelik: ORTA.** İkinci içerik denetiminde (1.258 tur, 111 bulgu) metni, sesi ya da soruyu tutmayan görseller. Kesin sayı gerekenler (kuşlar 7, bilyeler 12) ve krokiler Blender'da çizilir; diğerleri yerel Z-Image Turbo, olmazsa Gemini.

## Özet tablo

| # | Dosya yolu | Oran | Referans | Ne |
|---|---|---|---|---|
| 1 | `assets/images/items/sahne/sir.png` | 16:9 | — | Dar bir koridor; yarı açık kapının aralığından uzanan büyük bir yetişkin eli çocuğun omzuna dokunuyor. Çocuk tedirgin ve rahatsız (kaşları kalkık, omuzları kasılmış, geri çekiliyor). Başparmak yukarıda değil, parmaklar düz. |
| 2 | `assets/images/items/kutu/pil.png` | 1:1 | — | Turuncu geri dönüşüm kutusu; ön yüzünde büyük, belirgin kabartma pil simgesi (geniş kısa silindir, üstte yuvarlak çıkıntı, yanında küçük yıldırım); biberon ya da şişeye benzemez. |
| 3 | `assets/images/items/trafik/ayakta_dur.png` | 1:1 | — | Küçük bir arabanın kesit içi: pencereler, direksiyon ve torpido, ön koltuklar, arka sıra koltuk. Çocuk koltuklar arasında ayakta duruyor, kemersiz; takılmamış kemerler yanlarda sarkıyor. |
| 4 | `assets/images/items/davranis/yabanciyla_git.png` | 1:1 | — | Sıradan giyimli, gülümseyen, sıcak yüzlü bir yetişkin (açık yeşil tişört, mavi kot, şapka ve gözlük yok) çocuğun elinden tutmuş birlikte yürüyorlar; çocuk biraz kararsız. |
| 5 | `assets/images/items/atik/yogurt_kabi.png` | 1:1 | — | Boş, temiz, pastel pembe plastik yoğurt kabı; üstten hafif eğik görünüşte içi boş; folyo kapağı yırtılıp kenarına kıvrılmış. Yüz yok, yiyecek yok. |
| 6 | `assets/images/items/neden/karli_dag.png` | 1:1 | — | Dik bir yamaçta biriken kalın, ağır kar kütlesi; üstünde çatlak çizgisi (kayacak gibi). Dağ zirvesi, ağaç yok. |
| 7 | `assets/images/items/neden/kamp_atesi.png` | 1:1 | — | Kuru sarı otun içinde gri taşlardan küçük bir ateş halkası; sönmemiş turuncu korlar, ince bir duman, birkaç minik kıvılcım kuru ota uçuyor. Büyük alev, ağaç, yüz yok. |
| 8 | `assets/images/items/trafik/saga_sola_bak.png` | 1:1 | — | Çocuk kaldırım kenarında güvenle duruyor, elini kaşına siper ederek yola dikkatle bakıyor; yolda solda ve sağda uzakta birer minik araba var. |
| 9 | `assets/images/items/sahne/kuslar.png` | 1:1 | — | Soldaki gövdeden çıkan uzun yatay bir dalda yan yana, aralarında boşluk olan tam 7 özdeş yuvarlak sarı kil kuş (hepsi aynı yöne bakar). Havada uçan, yerde duran ya da gizlenmiş hiçbir kuş yok; arka plan sade pastel gökyüzü. Kuşlar üst üste binmez, hepsi sayılabilir. (Blender) |
| 10 | `assets/images/items/sahne/bilyeler.png` | 1:1 | — | Düz yeşil yuvarlak bir kil mindere, üç sıra dört sütun düzgün ızgarada, aralarında eşit boşluk bulunan tam 12 renkli cam bilye (kırmızı, mavi, yeşil, sarı, turuncu, mor tekrar eder), yukarıdan bakış. Çocuk, el, torba ya da yerde başka bilye yok; hiçbiri üst üste binmez. (Blender) |
| 11 | `assets/images/items/sahne/bayram_sabahi.png` | 1:1 | — | Yatağın yanında, yeni bayramlık giysileriyle sevinçle duran iki çocuk (kız ve erkek); yatak yeni kalkılmış gibi dağınık. |
| 12 | `assets/images/items/davranis/alkis.png` | 1:1 | — | Gülümseyen çocuk yüz hizasında, avuçları açık iki elini birbirine vurarak alkışlıyor; ellerin iki yanında belirgin hareket çizgileri. |
| 13 | `assets/images/items/doga/golge.png` | 1:1 | — | Yeşil bir çim zeminde, küçük bir kızın şeklini alan koyu gri bir gölge; ortada kimse yok, yalnız gölge. |
| 14 | `assets/images/items/sahne/komsu.png` | 1:1 | — | Apartman kapısı önünde bir çocuk ile gri saçlı yaşlı komşu teyze karşılaşıyor; ikisi birbirine dönük, tarafsız duruşta. |
| 15 | `assets/images/items/sahne/musluk_kapali.png` | 1:1 | — | Sayfa 1'deki aynı çocuk (yeşil tişört, dağınık kısa kahverengi saç) diş fırçasını bir elinde tutarak diğer eliyle musluğu kapatıyor; musluk ve lavabo kuru. |
| 16 | `assets/images/items/yiyecek/mama.png` | 1:1 | — | Kahverengi kuru kedi maması taneleriyle dolu mavi kâse; yüz yok. |
| 17 | `assets/images/items/esya/vazo.png` | 1:1 | — | Dar boyunlu, yuvarlak gövdeli mavi bir vazo; içinde üç renkli çiçek duruyor. Yüzü yok. |
| 18 | `assets/images/items/yiyecek/jole.png` | 1:1 | — | Beyaz tabakta, yeşil yarı saydam, kalıp biçimli (yivli kenarlı) jöle; bir dilimi kesilmiş. |
| 19 | `assets/images/items/doga/deniz.png` | 1:1 | — | Dalgalı, köpük tepeli koyu mavi deniz ve ufuk çizgisinin üstünde açık mavi gökyüzü ile küçük sarı güneş. |
| 20 | `assets/images/items/bayram/selamsiz.png` | 1:1 | — | Dedeye selam vermeyen çocuk: sırtını dönmüş, kolları kavuşturulmuş, yüzü ters yöne bakıyor; dede şaşkın ve biraz üzgün bakıyor. |
| 21 | `assets/images/items/arkadas/alay_et.png` | 1:1 | — | Bir çocuk parmağıyla gösterip alay ediyor; karşısındaki çocuk başı önde, gözleri sulu, üzgün. |
| 22 | `assets/images/items/arkadas/disla.png` | 1:1 | — | İki çocuk yan yana, üçüncü çocuğa sırtlarını dönmüş; dışlanan çocuk ayrıda, tek başına, üzgün. |
| 23 | `assets/images/items/arkadas/sirayla.png` | 1:1 | — | Tek salıncak: bir çocuk sallanıyor, diğeri hemen yanında sabırla sırasını bekliyor. |
| 24 | `assets/images/items/bilgi/cizdigi_resim.png` | 1:1 | — | Çocuğun çizdiği resim: küçük bir şövale üzerindeki kâğıtta tek büyük, renkli bir çiçek çizimi (ev yok). |
| 25 | `assets/images/items/hava/kuslar_goc.png` | 1:1 | — | Sonbaharda göç eden iri leylekler gökte V biçiminde uçuyor; çevrede düşen turuncu yapraklar. |
| 26 | `assets/images/items/iletisim/kolundan_cek.png` | 1:1 | — | Bir çocuk kitap okuyan arkadaşını kolundan sertçe çekiyor; okuyan çocuk huzursuz. |
| 27 | `assets/images/items/aliskanlik/gec_yat.png` | 1:1 | — | Gece geç saatte uykusuz çocuk: karanlık odada yatakta oturuyor, gözleri iri iri açık; pencerede ay ve yıldızlar. |
| 28 | `assets/images/items/sahne/aile_pansuman.png` | 1:1 | — | Erkek çocuk (kısa kahverengi saçlı, açık mavi tişört) diz yarasına pansuman yapılıyor; anne pansuman yapıyor, baba ilk yardım çantasını tutuyor. |
| 29 | `assets/images/items/toplum/cama_bak.png` | 1:1 | — | Otobüs içinde koltukta oturan çocuk camdan dışarı bakıyor; yanında ayakta bastonlu yaşlı teyze. |
| 30 | `assets/images/items/sahne/komsu_poset.png` | 16:9 | — | Apartman merdiveni: yaşlı komşu iki ağır poşetle basamakları çıkıyor. |
| 31 | `assets/images/items/sorumluluk/gormezden_gel.png` | 1:1 | — | Çocuk, ağır poşetli yaşlı komşuya sırtını dönüp yürüyor; yaşlı kadın çaresiz bakıyor. |
| 32 | `assets/images/items/milli/zafer.png` | 1:1 | — | Zafer: bayraksız; yeşil tepede altın bir zafer kupası, çevresinde defne çelengi ve kırmızı kurdele. |
| 33 | `assets/images/items/tek/gaz_lambasi.png` | 1:1 | — | Klasik gaz lambası: yuvarlak pastel gövde, pirinç boyun, uzun cam baca ve içinde yanan küçük turuncu alev. |
| 34 | `assets/images/items/sanat/kukla.png` | 1:1 | — | El kuklası: sarı ördek biçiminde bez kukla; alttan bir çocuğun kolu ve kolluğu giriyor, gaga açık. |
| 35 | `assets/images/items/nesne/peynir.png` | 1:1 | — | Net üçgen kesitli (sivri tepeli, düz tabanlı) prizma biçiminde sarı peynir bloğu; yüzsüz, birkaç küçük delik. |
| 36 | `assets/images/items/simetri/kelebek.png` | 1:1 | — | Kanatları tam açık, üstten görünen kelebek; sol ve sağ kanat şekil, renk ve benekleriyle birebir ayna görüntüsü. Onay sırasında sol yarının aynalanması önerilir. |
| 37 | `assets/images/items/sahne/karis_olcum.png` | 16:9 | — | İki çocuk uzun alçak masanın iki ucunda; her biri başparmağı ve serçe parmağı iyice açık geniş elini masaya koymuş, diğer elini ilk karışın bittiği yere koyarak karış karış ilerliyor; arkalarında önceki adımların soluk el izi çukurları. Eller kapalı ya da düz yan yana olmamalı. |
| 38 | `assets/images/items/durum/g2_izinsiz_defter.png` | 16:9 | — | Odada iki çocuk: ağabey/abla yaşındaki 8 yaşlarında bir kız (sen) yerde oturan 4 yaşlarındaki küçük kardeşine bakıyor; küçük oğlan, spiralli düz kapaklı bir resim defterini göğsüne bastırmış tutuyor. Yetişkin yok. İkisi de çocuk oranında, kız oğlandan yalnızca biraz büyük. |
| 39 | `assets/images/items/hikaye/g2_deniz_flut.png` | 1:1 | — | Küçük okul sahnesinde ortada Deniz: omuz hizası düz kahverengi saçlı, pembe elbiseli, beyaz yakalı, pembe ayakkabılı kız flüt çalıyor (kütüphane görselindeki Deniz'le aynı kız). Çevrede sınıf arkadaşları ve ebeveynler (yetişkinler yetişkin oranında) alkışlıyor; hiçbir çocuk Deniz gibi giyinmiyor. |
| 40 | `assets/images/items/hikaye/g2_ayrac_selin.png` | 1:1 | — | Selin (g2_selin_sise ile aynı: kahverengi dalgalı saç, bir yanda alçak atkuyruğu, pembe kolsuz üst, eflatun taytı) düzenli bir çalışma masasında oturuyor, açık kitabın sayfaları arasına renkli bir ayraç koyuyor. Geniş plan: kız baştan ayağa, masa ve raf da görünür; yakın plan değil. |
| 41 | `assets/images/items/fen/karisim_su_kum.png` | 1:1 | — | Berrak su dolu uzun cam bardak: dipte kalın sarı kum tabakası çökmüş, kumun üstündeki su bulanık sarımsı, en üstte berrak; süt/kakao gibi görünmemeli. |
| 42 | `assets/images/items/fen/pilic.png` | 1:1 | — | Piliç: yarı büyümüş genç tavuk; sarı-beyaz tüylü, KÜÇÜK SİVRİ gaga, küçük kırmızı ibik ve sakal, ince sarı bacaklar (ördek gagası yok; civcivden daha uzun ve ince). |
| 43 | `assets/images/items/fen/balon_hava.png` | 1:1 | — | Klasik, şişkin, parlak kırmızı hava balonu; altında küçük düğüm ve uzayan ince ip; üstüne desen yok. |
| 44 | `assets/images/items/fen/buhar.png` | 1:1 | — | Küçük mavi çaydanlık: ağzından yukarı doğru yumuşak beyaz buhar bulutu çıkıyor. |
| 45 | `assets/images/items/fen/gazete.png` | 1:1 | — | Yarım katlanmış gazete: üstte kalın koyu başlık bandı, altında sütunlar halinde ince gri satır çizgileri ve iki gri fotoğraf kutusu; ortada katlama izi. |
| 46 | `assets/images/items/fen/bisiklet_fren.png` | 1:1 | — | Fren yapan bisikletli: yan görünüş, çocuk fren kolunu sıkıyor, durmuş ya da durmak üzere, yerde iki kısa koyu fren izi; TOZ, duman ve hız çizgisi YOK. |
| 47 | `assets/images/items/fen/sahne/top_duvar.png` | 16:9 | — | Tek düz tuğla duvar (kuşbakışı): sol alttan duvara gelen turuncu ok, duvara değen tek top ve duvardan sol üste geri dönen turkuaz ok; yön değişimi açıkça görünür. |
| 48 | `assets/images/items/fen/tasarruf_tv_kapat.png` | 1:1 | — | Çocuk, küçük televizyonun düğmesine basıp kapatıyor: ekran tamamen siyah/sönük, ışık yok; yanında küçük kırmızı bekleme ışığı. |
| 49 | `assets/images/items/fen/tasarruf_perde_ac.png` | 1:1 | — | Çocuk perdeyi açıyor: pencereden içeri parlak güneş ışığı giriyor ve yere vuruyor; yanındaki masa lambası sönük (karanlık ampul). |
| 50 | `assets/images/items/hak/saglik.png` | 1:1 | — | Sağlık hakkı: gülümseyen doktor, muayene yatağında oturan çocuğu steteskopla dinliyor; üçü de baştan ayağa bütün gövdeli. |
| 51 | `assets/images/items/sonuc/guvenli_gecis.png` | 1:1 | — | Güvenli geçiş: iki çocuk yaya geçidinde yürüyerek karşıya geçiyor, yeşil yaya ışığı yanıyor, araçlar geçidin çok gerisinde durmuş. |
| 52 | `assets/images/items/sonuc/aceleci.png` | 1:1 | — | Aceleci davranış: bir çocuk yaya geçidi dışında yolda koşuyor, öne eğik, çevresine bakmıyor; uzakta tek küçük araç. |
| 53 | `assets/images/items/katki/yangin_sondu.png` | 1:1 | — | Yangın söndü: duman ve alev yok; ıslak parlak duvarlar, itfaiye hortumundan çıkan mavi su yayı, su birikintisi, yalnız küçük bir is lekesi. |
| 54 | `assets/images/items/kroki/firin_k.png` | 1:1 | — | Kroki: kuşbakışı mahalle haritası. Fırın (sarı bina, turuncu çatı, ekmek simgesi) HER ÜÇ krokide birebir aynı ve yazısız; kırmızı yıldız FIRININ üstünde. (Blender) |
| 55 | `assets/images/items/kroki/park_k.png` | 1:1 | — | Kroki: firin_k ile birebir aynı harita (aynı fırın, yazısız); kırmızı yıldız PARKIN üstünde. (Blender) |
| 56 | `assets/images/items/kroki/okul_k.png` | 1:1 | — | Kroki: firin_k ile birebir aynı harita (aynı fırın, yazısız); kırmızı yıldız OKULUN (mavi çatılı, bayraklı bina) üstünde. (Blender) |
| 57 | `assets/images/items/meslek/kasaba_sabah.png` | 16:9 | — | Kasaba sabahı: solda ekmek biçimli süslü, çizgili tenteli fırın (yazı yok), ortada sarı okul servisi, sağda okul binası. |
| 58 | `assets/images/items/ataturk/ogrenci.png` | 16:9 | — | Sınıf: sırasında defterine çalışan çocuk, yanında onu gülümseyerek takdir eden öğretmen; arkada boş yeşil tahta. |
| 59 | `assets/images/items/birlik/yalniz.png` | 1:1 | — | Yalnız kalmak: bir çocuk küçük kil zeminin bir ucunda tek başına, omuzları düşük, üzgün; uzakta üç çocuk birlikte top oynuyor, aralarında geniş boşluk. |
| 60 | `assets/images/items/tek/karanlik_sokak.png` | 1:1 | — | Elektriksiz gece: ışıksız, koyu lacivert karanlık sokak; sönük sokak lambaları, karanlık pencereli evler, boş yol. |
| 61 | `assets/images/items/sorumluluk/kitabi_unut.png` | 1:1 | — | Kitabı unutmak: şaşkın, ellerini yanaklarına koymuş çocuk; önünde yerde duran büyük, açık ve içi bomboş okul çantası; çevrede kitap yok. |
| 62 | `assets/images/items/durum/g3_muze_hazirlik.png` | 16:9 | — | Akşam evde masa başında bir çocuk: çenesini eline dayamış, tavana bakıp yarın ne olacağını düşünüyor. Masada yalnız küçük bir küre ve kapalı bir uzay kitabı var; elinde kalem, açık defter ya da liste yok. Duvarda şirin bir müze binası resmi asılı. |
| 63 | `assets/images/items/durum/g3_deney_adimlari.png` | 16:9 | — | Sınıfta öğretmen masanın yanında ayakta, bir elini kaldırmış anlatıyor; masada renkli suyla küçük kaplar ve büyüteç var. Çocuk sırasında öğretmene dönük, iki eli boş sırada kavuşuk, dikkatle dinliyor. Çocuğun elinde kalem yok; defter ya da kâğıt görünmüyor. |
| 64 | `assets/images/items/durum/g3_itfaiyeci.png` | 16:9 | — | Sınıf, konuk gelmeden hemen önce: öğretmen kapının yanında elini kapı koluna koymuş gülümsüyor; çocuklar sıralarında elleri sıranın üstünde, heyecanla kapıya bakıyor. Kimse el kaldırmıyor, elinde kâğıt ya da kalem yok. Pencerenin dışında okulun önünde kırmızı bir itfaiye aracı duruyor; sınıfın içinde itfaiyeci yok. |
| 65 | `assets/images/items/hikaye/g3_senlik_hazirlik.png` | 1:1 | — | Okulda bir masada yan yana iki çocuk konuşuyor: uzun saçlı, iki yanda toka ve pembe elbiseli bir kız (Nil) ile kısa saçlı, mavi tişörtlü bir erkek (Kaan). Masada yalnız boş şeffaf bir su şişesi var; kâğıt, çizim ya da başka nesne yok. |

## Promptlar

### 1. `assets/images/items/sahne/sir.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Dar bir koridor; yarı açık kapının aralığından uzanan büyük bir yetişkin eli çocuğun omzuna dokunuyor. Çocuk tedirgin ve rahatsız (kaşları kalkık, omuzları kasılmış, geri çekiliyor). Başparmak yukarıda değil, parmaklar düz. (denetim 2: g1_hayat_bilgisi)

```
A narrow pastel hallway seen from the front. On the right side a door stands half open and a big grown-up hand reaches out of the gap in the door and rests on the shoulder of a small child who stands close to the door. The hand lies flat on the shoulder with all fingers relaxed and together; absolutely no thumbs-up, no thumb pointing up, no pointing finger, no waving hand. The child is a cute clay toy figure with big dark round eyes, rosy cheeks and short brown hair, clearly uneasy and uncomfortable: eyebrows raised and tilted, a small pressed mouth, shoulders hunched, leaning away from the hand, one arm hugging the body, face clearly visible. The door and the hallway have no faces. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 2. `assets/images/items/kutu/pil.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Turuncu geri dönüşüm kutusu; ön yüzünde büyük, belirgin kabartma pil simgesi (geniş kısa silindir, üstte yuvarlak çıkıntı, yanında küçük yıldırım); biberon ya da şişeye benzemez. (denetim 2: g1_hayat_bilgisi)

```
An orange clay recycling bin with a rounded square body and an open top. On the front there is a big bold flat-embossed pictogram in light cream clay that fills about half of the front face: a single chunky AA battery silhouette standing upright, a wide short cylinder with a flat top, a small round raised nub in the middle of the top, and a thin band near the bottom, with a tiny lightning bolt shape next to it. The pictogram must look like a battery and not like a bottle: no neck, no cap, no nipple, no baby bottle, no plug and no socket. The bin has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 3. `assets/images/items/trafik/ayakta_dur.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Küçük bir arabanın kesit içi: pencereler, direksiyon ve torpido, ön koltuklar, arka sıra koltuk. Çocuk koltuklar arasında ayakta duruyor, kemersiz; takılmamış kemerler yanlarda sarkıyor. (denetim 2: g1_hayat_bilgisi)

```
A cut-away view into the inside of a small pastel toy car, so the car interior is obvious: curved car windows and a roof frame all around, a round steering wheel and a dashboard at the front, two cushioned front seats with headrests and a bench seat at the back. A cute child stands upright in the middle of the car between the seats, not sitting, holding on to a front headrest for balance with a cheerful unaware look. The seat belts are not fastened and hang loose beside the seats. The child is a cute clay toy figure with big dark round eyes, rosy cheeks and short hair. The car, the seats and the steering wheel have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 4. `assets/images/items/davranis/yabanciyla_git.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sıradan giyimli, gülümseyen, sıcak yüzlü bir yetişkin (açık yeşil tişört, mavi kot, şapka ve gözlük yok) çocuğun elinden tutmuş birlikte yürüyorlar; çocuk biraz kararsız. (denetim 2: g1_hayat_bilgisi)

```
An ordinary friendly-looking grown-up man in everyday clothes, a light green t-shirt and plain blue jeans, short brown hair, a warm smiling face, no hat, no sunglasses, no coat, nothing scary about him. He walks to the right holding the hand of a small child, and the child walks along beside him looking a little unsure. Both are fully visible from head to toe. Both are cute clay toy figures with big dark round eyes and rosy cheeks. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 5. `assets/images/items/atik/yogurt_kabi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Boş, temiz, pastel pembe plastik yoğurt kabı; üstten hafif eğik görünüşte içi boş; folyo kapağı yırtılıp kenarına kıvrılmış. Yüz yok, yiyecek yok. (denetim 2: g1_hayat_bilgisi)

```
An empty, clean pastel pink plastic yogurt cup seen from slightly above so that the hollow inside is clearly visible and completely empty, with nothing inside: no yogurt, no cream, no food. The thin silver foil lid has been peeled back and curls over the rim of the cup. It looks like a piece of trash waiting to be recycled, not like food. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 6. `assets/images/items/neden/karli_dag.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dik bir yamaçta biriken kalın, ağır kar kütlesi; üstünde çatlak çizgisi (kayacak gibi). Dağ zirvesi, ağaç yok. (denetim 2: g1_hayat_bilgisi)

```
A thick heavy slab of freshly fallen white snow piled up on a steep brown hillside slope, shown in a close view. A clear crack line runs across the top of the snow slab, as if the whole mass is about to slide down. No mountain peak, no trees, no animals, no skier. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 7. `assets/images/items/neden/kamp_atesi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kuru sarı otun içinde gri taşlardan küçük bir ateş halkası; sönmemiş turuncu korlar, ince bir duman, birkaç minik kıvılcım kuru ota uçuyor. Büyük alev, ağaç, yüz yok. (denetim 2: g1_hayat_bilgisi)

```
A small ring of grey stones in a patch of dry yellow grass with glowing orange embers inside it and a thin curl of smoke, an unattended fire that has not been put out. A few tiny orange sparks float out of the embers and land on the dry grass. Only low embers and very small flames, no big blaze, no trees, no stack of logs, no people. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 8. `assets/images/items/trafik/saga_sola_bak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çocuk kaldırım kenarında güvenle duruyor, elini kaşına siper ederek yola dikkatle bakıyor; yolda solda ve sağda uzakta birer minik araba var. (denetim 2: g1_hayat_bilgisi)

```
A cute child standing safely on a raised pastel sidewalk slab right behind the curb edge, not on the road, turning the head carefully to one side with one hand raised above the eyebrows like a visor, looking along the road. A grey asphalt road with white dashes runs in front of the sidewalk. A small pastel toy car is far away on the road on the left side and another small pastel toy car is far away on the road on the right side, so it is clear the child is checking the traffic in both directions before crossing. The child is a cute clay toy figure with big dark round eyes, rosy cheeks and short hair. The cars and the sidewalk have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 9. `assets/images/items/sahne/kuslar.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Soldaki gövdeden çıkan uzun yatay bir dalda yan yana, aralarında boşluk olan tam 7 özdeş yuvarlak sarı kil kuş (hepsi aynı yöne bakar). Havada uçan, yerde duran ya da gizlenmiş hiçbir kuş yok; arka plan sade pastel gökyüzü. Kuşlar üst üste binmez, hepsi sayılabilir. (denetim 2: g1_matematik)

```
Blender procedural scene, orthographic front view. One long, thick, perfectly horizontal clay tree branch coming from a simple brown trunk at the left edge, against a plain soft pastel sky-blue background with no clouds and no other objects. Exactly SEVEN identical small round clay birds stand in one straight row on the branch, all facing the same direction, evenly spaced with a clear visible gap between neighbours so that no bird touches or overlaps another and all seven are easy to count. Each bird is a simple round pastel-yellow body with two small black dot eyes, a small orange cone beak, one small wing and two tiny orange feet. There are no flying birds, no bird on the ground, no bird hidden behind leaves, and no other animal anywhere in the picture; the rest of the picture is empty. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 10. `assets/images/items/sahne/bilyeler.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Düz yeşil yuvarlak bir kil mindere, üç sıra dört sütun düzgün ızgarada, aralarında eşit boşluk bulunan tam 12 renkli cam bilye (kırmızı, mavi, yeşil, sarı, turuncu, mor tekrar eder), yukarıdan bakış. Çocuk, el, torba ya da yerde başka bilye yok; hiçbiri üst üste binmez. (denetim 2: g1_matematik)

```
Blender procedural scene, orthographic top-down view. A flat round green clay mat on a plain light background. On the mat lie exactly TWELVE glass marbles (perfect shiny spheres) arranged in a neat grid of three rows and four columns with equal spacing, a clear visible gap between neighbours so no marble touches or overlaps another, all twelve fully visible and easy to count. Each marble is a single solid pastel color (red, blue, green, yellow, orange, purple, repeated). The marbles have no face, no eyes and no mouth. There is no child, no hand, no bag, no loose marble and no other object anywhere in the picture. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 11. `assets/images/items/sahne/bayram_sabahi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yatağın yanında, yeni bayramlık giysileriyle sevinçle duran iki çocuk (kız ve erkek); yatak yeni kalkılmış gibi dağınık. (denetim 2: g1_turkce)

```
Two happy clay children, a girl and a boy about seven years old, standing side by side next to a small single bed with a rumpled blue blanket, as if they have just woken up. The girl wears a shiny pink festive dress with a small bow in her hair, the boy wears a neat light-blue vest, white shirt and small bow tie. Both are smiling widely and proudly showing off their new clothes, arms slightly out to the sides. Only the two children and the bed are in the picture, no adults, no cups, no other objects. The bed is inanimate with no face. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 12. `assets/images/items/davranis/alkis.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Gülümseyen çocuk yüz hizasında, avuçları açık iki elini birbirine vurarak alkışlıyor; ellerin iki yanında belirgin hareket çizgileri. (denetim 2: g1_turkce)

```
A cheerful clay child applauding enthusiastically, the child's elbows bent outwards and both hands raised up to chin height, wide open flat palms with fingers spread, the two palms clapping against each other in front of the face (hands clearly apart from the chest, not folded and not in a prayer pose), several bold curved motion lines on both sides of the hands showing a loud clap, big open-mouth smile, joyful eyes, upper body visible. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 13. `assets/images/items/doga/golge.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yeşil bir çim zeminde, küçük bir kızın şeklini alan koyu gri bir gölge; ortada kimse yok, yalnız gölge. (denetim 2: g1_turkce)

```
A round bright green clay lawn disc seen from slightly above, and lying flat on it a single soft dark-grey clay shadow in the exact silhouette of a little girl with two pigtails and a dress, arms slightly apart, as if cast by sunlight. There is no girl and no person on the lawn, only her flat dark shadow shape. The shadow is a plain dark silhouette. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 14. `assets/images/items/sahne/komsu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Apartman kapısı önünde bir çocuk ile gri saçlı yaşlı komşu teyze karşılaşıyor; ikisi birbirine dönük, tarafsız duruşta. (denetim 2: g1_turkce)

```
A small clay child, about seven years old in a green t-shirt and shorts, standing on the left and facing an elderly clay grandmother neighbour on the right, who has grey hair in a bun, round glasses and a pink cardigan and stands in front of her open apartment door. They have just met and stand a few steps apart facing each other, calm neutral expressions, nobody is waving or talking. The child is clearly smaller and younger than the old woman. Only these two characters and her door. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 15. `assets/images/items/sahne/musluk_kapali.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sayfa 1'deki aynı çocuk (yeşil tişört, dağınık kısa kahverengi saç) diş fırçasını bir elinde tutarak diğer eliyle musluğu kapatıyor; musluk ve lavabo kuru. (denetim 2: g1_turkce)

```
The same clay boy as in a previous picture: short messy brown hair, brown eyes, rosy cheeks and a plain green t-shirt. He stands at a small white bathroom sink, holding his toothbrush in one hand and smiling while turning the handle of the tap with the other hand to close it. The tap is completely dry with no water coming out and the sink is dry and empty. The sink and tap are inanimate with no faces, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 16. `assets/images/items/yiyecek/mama.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kahverengi kuru kedi maması taneleriyle dolu mavi kâse; yüz yok. (denetim 2: g1_turkce)

```
A light-blue ceramic cat food bowl heaped with small crunchy brown dry cat kibble pieces, all the pieces are plain brown, round and slightly flat, a few tiny fish-shaped kibbles on top, looks like pet food and not like candy or cereal. The bowl is plain with no cat on it, no decorations. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 17. `assets/images/items/esya/vazo.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dar boyunlu, yuvarlak gövdeli mavi bir vazo; içinde üç renkli çiçek duruyor. Yüzü yok. (denetim 2: g1_turkce)

```
A tall blue ceramic vase with a clearly narrow neck, a wide rim and a round belly, holding a small bouquet of three colorful clay flowers with long green stems and leaves sticking out of the top. The vase is smooth and plain. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 18. `assets/images/items/yiyecek/jole.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Beyaz tabakta, yeşil yarı saydam, kalıp biçimli (yivli kenarlı) jöle; bir dilimi kesilmiş. (denetim 2: g1_turkce)

```
A wobbly translucent lime-green gelatin dessert (jelly) in a fluted mold shape with ridged sides, sitting on a plain white plate, glossy and see-through so the light shines through it, one wedge slice cut out and lying beside it to show the jiggly texture. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 19. `assets/images/items/doga/deniz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dalgalı, köpük tepeli koyu mavi deniz ve ufuk çizgisinin üstünde açık mavi gökyüzü ile küçük sarı güneş. (denetim 2: g1_turkce)

```
A small rounded clay diorama slab showing the open sea: the lower part is deep blue water with several rolling wave ridges topped with white foam, the upper part is pale sky blue separated by a clear straight horizon line, with one small round yellow sun low in the sky. No boats, no animals, no people, no clouds. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 20. `assets/images/items/bayram/selamsiz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Dedeye selam vermeyen çocuk: sırtını dönmüş, kolları kavuşturulmuş, yüzü ters yöne bakıyor; dede şaşkın ve biraz üzgün bakıyor. (denetim 2: g2_hayat_bilgisi)

```
Two figures side by side. On the left a small clay child with brown hair stands with his body turned away and his back half toward the grandfather, arms crossed over the chest, chin lifted and head turned sharply to the far side, lips pressed together in a sulky closed mouth, clearly refusing to greet. On the right a much taller grandfather with white hair and a white mustache stands facing the child, one hand slightly raised, looking at the child with a gently surprised and slightly sad expression. The child never smiles, never waves and never looks at the grandfather. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. The grandfather is about twice as tall as the child. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 21. `assets/images/items/arkadas/alay_et.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bir çocuk parmağıyla gösterip alay ediyor; karşısındaki çocuk başı önde, gözleri sulu, üzgün. (denetim 2: g2_hayat_bilgisi)

```
Two small clay children standing a little apart facing each other. On the left a child laughs mockingly with a wide open mouth and points a finger straight at the other child. On the right the other child is clearly hurt: head bowed low, shoulders slumped, downturned mouth, watery eyes with a tear, arms hugged tightly around the own body. Only the child on the left is laughing; the child on the right is sad and not smiling at all. Both children fully visible. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 22. `assets/images/items/arkadas/disla.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** İki çocuk yan yana, üçüncü çocuğa sırtlarını dönmüş; dışlanan çocuk ayrıda, tek başına, üzgün. (denetim 2: g2_hayat_bilgisi)

```
Three small clay children in a row. Two children on the left stand shoulder to shoulder, smiling at each other and chatting, and both have their backs turned toward the third child. The third child stands alone at the far right with a clear gap of empty space between him and the two others, facing the viewer with a sad face, head down, eyes watery, hands clasped in front of the body, left out. The lonely third child is clearly the one being excluded. All three fully visible. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 23. `assets/images/items/arkadas/sirayla.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Tek salıncak: bir çocuk sallanıyor, diğeri hemen yanında sabırla sırasını bekliyor. (denetim 2: g2_hayat_bilgisi)

```
A small clay playground vignette with exactly one wooden swing hanging from a short brown frame. One small clay child sits on the swing and swings happily with a smile. A second small clay child stands calmly right beside the swing, one step away, hands folded behind the back, waiting patiently for the turn with a friendly smile and eyes on the swinging friend. Clear idea of taking turns: one swings, the other waits. The swing frame and the swing have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 24. `assets/images/items/bilgi/cizdigi_resim.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çocuğun çizdiği resim: küçük bir şövale üzerindeki kâğıtta tek büyük, renkli bir çiçek çizimi (ev yok). (denetim 2: g2_hayat_bilgisi)

```
A large sheet of white paper standing upright on a small wooden easel, covered with a child's colorful crayon drawing of one single big red and yellow flower with a green stem and two green leaves, simple wobbly crayon lines. The drawing shows only the flower, no house, no sun, no people. The easel, the paper and the drawing have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 25. `assets/images/items/hava/kuslar_goc.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sonbaharda göç eden iri leylekler gökte V biçiminde uçuyor; çevrede düşen turuncu yapraklar. (denetim 2: g2_hayat_bilgisi)

```
A flock of large white storks with long red beaks and long red legs trailing behind, black-tipped wings spread wide open, flying together one after another in a clear V formation, seen from below, clearly big migrating birds on a long journey. A few falling orange and brown autumn leaves drift around them. The storks are big, elegant and long-legged, not small round chicks. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 26. `assets/images/items/iletisim/kolundan_cek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Bir çocuk kitap okuyan arkadaşını kolundan sertçe çekiyor; okuyan çocuk huzursuz. (denetim 2: g2_hayat_bilgisi)

```
A small clay child sitting at a small desk reading a picture book. A second small clay child stands next to the desk and yanks hard at the reading child's sleeve with both hands, leaning the whole body weight sideways, the reading child's arm stretched out sideways by the pull, the book tilting in the hand, the reading child frowning and annoyed. Clearly one child roughly pulling the other child's arm, not holding hands. The desk and the book have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 27. `assets/images/items/aliskanlik/gec_yat.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Gece geç saatte uykusuz çocuk: karanlık odada yatakta oturuyor, gözleri iri iri açık; pencerede ay ve yıldızlar. (denetim 2: g2_hayat_bilgisi)

```
A small clay diorama vignette: a small clay child in pajamas sits upright on top of a bed in a dark bedroom at night, wide awake with big wide open eyes and tired dark circles, hugging a pillow, unable to sleep. Behind the bed a window shows a dark blue night sky with a bright full moon and stars. No tablet, no phone and no screen anywhere in the picture. The bed, the pillow, the window and the moon have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 28. `assets/images/items/sahne/aile_pansuman.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Erkek çocuk (kısa kahverengi saçlı, açık mavi tişört) diz yarasına pansuman yapılıyor; anne pansuman yapıyor, baba ilk yardım çantasını tutuyor. (denetim 2: g2_hayat_bilgisi)

```
A small clay boy with short brown hair, wearing a light blue t-shirt and dark blue shorts, sits on a low stone step with a small red scrape on his knee. His mother kneels in front of him and sticks a bandage on his knee, while his father stands right behind them holding an open white first-aid box with a red cross. A small pastel bicycle lies on the grass beside them. The child is clearly a boy with short hair: no pigtails, no ponytails, no dress and no skirt. All three people are fully visible. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. The first-aid box and the bicycle have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 29. `assets/images/items/toplum/cama_bak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Otobüs içinde koltukta oturan çocuk camdan dışarı bakıyor; yanında ayakta bastonlu yaşlı teyze. (denetim 2: g2_hayat_bilgisi)

```
A small cutaway clay diorama of a city bus interior seen from the side. A small clay child sits on a blue bus seat next to a big window, head turned fully toward the window, staring outside with a dreamy face and deliberately not looking at anyone. Right beside the seat, in the aisle, an elderly woman with grey hair and a walking cane stands holding a handrail, looking tired. The child stays seated. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. The bus, the seat, the window, the handrail and the cane have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 30. `assets/images/items/sahne/komsu_poset.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Apartman merdiveni: yaşlı komşu iki ağır poşetle basamakları çıkıyor. (denetim 2: g2_hayat_bilgisi)

```
An apartment building stairwell in a clay diorama: a pastel staircase with a handrail and at least six clearly visible steps climbs from the lower left up to a landing with two apartment doors at the upper right. A single elderly neighbor woman with grey hair stands on the steps halfway up, climbing slowly and bending under the weight of two heavy full shopping bags, one in each hand. No other people. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. No sign and no writing on the doors. The bags, the stairs and the doors have no face, no eyes and no mouth. dominant palette: sunny yellow, sky blue and brick red accents. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 31. `assets/images/items/sorumluluk/gormezden_gel.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çocuk, ağır poşetli yaşlı komşuya sırtını dönüp yürüyor; yaşlı kadın çaresiz bakıyor. (denetim 2: g2_hayat_bilgisi)

```
Two figures. On the left a small clay child with brown hair turns his back to an elderly neighbor woman and walks away with his head turned to the far side, arms crossed, clearly ignoring her. On the right the elderly woman with grey hair stands a few steps away, struggling with two heavy full shopping bags, looking toward the child with a tired and hopeful expression. The child has his back toward the woman and does not look at her. Every grown-up in the image has adult body proportions and is clearly an adult, not a child. The shopping bags have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 32. `assets/images/items/milli/zafer.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Zafer: bayraksız; yeşil tepede altın bir zafer kupası, çevresinde defne çelengi ve kırmızı kurdele. (denetim 2: g2_hayat_bilgisi)

```
A shiny golden victory trophy cup standing on a small green hill, a big thick laurel wreath of green and yellow leaves circling around it, a red ribbon with long tails hanging from the cup and a few small golden clay stars around. A clear celebration of victory. No flag, no pole, no banner and no moon-and-star emblem anywhere. The trophy, the wreath and the hill have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 33. `assets/images/items/tek/gaz_lambasi.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Klasik gaz lambası: yuvarlak pastel gövde, pirinç boyun, uzun cam baca ve içinde yanan küçük turuncu alev. (denetim 2: g2_hayat_bilgisi)

```
A classic old kerosene oil lamp: a round pastel blue clay base, a golden brass-colored burner collar with a small wheel knob, a tall clear glass chimney and a small bright orange clay flame glowing inside the glass chimney with warm yellow light. It looks like an old-fashioned household lamp, not a laboratory bottle. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 34. `assets/images/items/sanat/kukla.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** El kuklası: sarı ördek biçiminde bez kukla; alttan bir çocuğun kolu ve kolluğu giriyor, gaga açık. (denetim 2: g2_hayat_bilgisi)

```
A hand puppet shaped like a friendly yellow duck made of soft cloth, with an orange beak open as if talking. A small child's forearm and sleeve enter the puppet from the open bottom of its cloth body, clearly showing that a hand is inside moving the puppet; the child's hand is hidden inside and only the forearm with a blue sleeve is visible below the puppet. It is clearly a puppet worn on a hand, not a stuffed toy and not a teddy bear. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 35. `assets/images/items/nesne/peynir.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Net üçgen kesitli (sivri tepeli, düz tabanlı) prizma biçiminde sarı peynir bloğu; yüzsüz, birkaç küçük delik. (denetim 2: g2_matematik)

```
A block of yellow cheese shaped as a perfect triangular prism, like a doorstop wedge: seen from a slight three-quarter angle, its front face is a clear isosceles triangle with a sharp pointed top apex and a flat horizontal bottom edge, and the long rectangular side faces slope down from that apex. All edges are straight and the triangle outline is simple and unmistakable, with no cut-off or flat top. A few small round holes on the surfaces. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 36. `assets/images/items/simetri/kelebek.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kanatları tam açık, üstten görünen kelebek; sol ve sağ kanat şekil, renk ve benekleriyle birebir ayna görüntüsü. Onay sırasında sol yarının aynalanması önerilir. (denetim 2: g2_matematik)

```
A single butterfly seen straight from above with both wings fully spread, in perfect left-right mirror symmetry along the vertical center line of its body: the left wing and the right wing are exact mirror images of each other, with identical shapes, identical colors and identical spots and stripes in the same places on both sides, the coloring of the right wing copies the left wing flipped. Simple bold wing pattern made of large round spots and a few wide bands in pink, orange, yellow and blue, centered thin body with two antennae. Nothing asymmetrical anywhere. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 37. `assets/images/items/sahne/karis_olcum.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** İki çocuk uzun alçak masanın iki ucunda; her biri başparmağı ve serçe parmağı iyice açık geniş elini masaya koymuş, diğer elini ilk karışın bittiği yere koyarak karış karış ilerliyor; arkalarında önceki adımların soluk el izi çukurları. Eller kapalı ya da düz yan yana olmamalı. (denetim 2: g2_matematik)

```
Eye-level three-quarter view of a long low wooden clay table with two young children kneeling at its two ends, each measuring with a hand-span. The left girl has two black pigtails and a green sweater and a small hand, the right boy has brown hair and a yellow t-shirt and a larger hand. Each child holds one hand wide open with the thumb stretched far away from the little finger so the hand is a wide fan, fingertips of the thumb and the little finger touching the tabletop, and the other hand is placed on the table right where the first span ends, so that the spread hands are clearly seen stepping one after another along the table length, away from the child. Behind each child's spread hand are a few shallow clay hand-print dents in a straight row along the table, showing the earlier steps. Hands must not be closed, not flat together and not resting palm-down side by side; the wide open finger spread must be the main thing seen. Both children look focused and curious, simple friendly faces, the table has no face, no eyes and no mouth. No ruler, no tape measure, no marked objects. Whole table and both children fully visible, 16:9 landscape composition. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 38. `assets/images/items/durum/g2_izinsiz_defter.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Odada iki çocuk: ağabey/abla yaşındaki 8 yaşlarında bir kız (sen) yerde oturan 4 yaşlarındaki küçük kardeşine bakıyor; küçük oğlan, spiralli düz kapaklı bir resim defterini göğsüne bastırmış tutuyor. Yetişkin yok. İkisi de çocuk oranında, kız oğlandan yalnızca biraz büyük. (denetim 2: g2_turkce)

```
a cozy room with exactly two children and no grown-ups at all. On the left, a small four-year-old boy with short light-brown hair, a lilac t-shirt and dark trousers sits on a round cream rug and hugs a closed spiral-bound drawing notebook with a plain pink cover against his chest, looking up shyly. On the right, his eight-year-old sister, a girl with long dark-brown hair tied in a low ponytail, a pink t-shirt and blue trousers, sits kneeling on the rug facing him and looking at the notebook with a surprised, slightly worried expression, one hand held out a little as if asking. Both are young children with big round toy heads and small child bodies; the girl is only a little taller than the boy, her head is just slightly bigger than his, and neither of them looks like an adult. A few crayons lie on the rug. Only the two children have faces; the notebook, the crayons, the furniture and every other object have no face, no eyes and no mouth. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 39. `assets/images/items/hikaye/g2_deniz_flut.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Küçük okul sahnesinde ortada Deniz: omuz hizası düz kahverengi saçlı, pembe elbiseli, beyaz yakalı, pembe ayakkabılı kız flüt çalıyor (kütüphane görselindeki Deniz'le aynı kız). Çevrede sınıf arkadaşları ve ebeveynler (yetişkinler yetişkin oranında) alkışlıyor; hiçbir çocuk Deniz gibi giyinmiyor. (denetim 2: g2_turkce)

```
a small school stage with a girl named Deniz standing in the center and playing a white recorder flute, smiling happily. Deniz is a young girl with straight shoulder-length brown hair with soft bangs, a pink short-sleeved dress with a small white collar, and pink shoes, exactly like a small child with a big round toy head and small body. Around her on and in front of the stage, three classmates (a boy with short dark hair in a blue sweater, a girl with a yellow bow in a mint sweater, a boy with black hair in an orange sweater) and two parents (a woman with long blond hair in a green cardigan and a man with a short beard in a grey sweater) clap their hands happily. Every grown-up has adult body proportions and is clearly an adult, much taller than the children. Nobody except Deniz wears pink. Only the people have faces; the flute, the stage, the curtains and every other object have no face, no eyes and no mouth. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 40. `assets/images/items/hikaye/g2_ayrac_selin.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Selin (g2_selin_sise ile aynı: kahverengi dalgalı saç, bir yanda alçak atkuyruğu, pembe kolsuz üst, eflatun taytı) düzenli bir çalışma masasında oturuyor, açık kitabın sayfaları arasına renkli bir ayraç koyuyor. Geniş plan: kız baştan ayağa, masa ve raf da görünür; yakın plan değil. (denetim 2: g2_turkce)

```
a wide shot of a small girl named Selin sitting at a tidy wooden desk and gently placing a colorful bookmark between the pages of an open book, smiling calmly. Selin has wavy brown hair gathered in a low ponytail at one side, a sleeveless pink top and lilac leggings, with a normal small child head size and normal child proportions. The camera is far away: her whole body, the whole desk, a pencil cup and a small shelf with a few books are all visible, and she takes up only about a third of the picture; it is not a close-up. Only the girl has a face; the book, the bookmark, the pencil cup, the desk and every other object have no face, no eyes and no mouth. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 41. `assets/images/items/fen/karisim_su_kum.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Berrak su dolu uzun cam bardak: dipte kalın sarı kum tabakası çökmüş, kumun üstündeki su bulanık sarımsı, en üstte berrak; süt/kakao gibi görünmemeli. (denetim 2: g3_fen)

```
a tall clear drinking glass filled with water, a thick layer of coarse yellow sand has settled on the bottom of the glass, the water just above the sand is murky and cloudy with floating sand grains, the water at the top of the glass is clear and see-through, the glass is transparent so the layers are easy to see from the side, it must look like sand mixed into water and NOT like milk, cocoa or a milkshake, no foam, no bubbles on top, no white lumps, no orange dots. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 42. `assets/images/items/fen/pilic.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Piliç: yarı büyümüş genç tavuk; sarı-beyaz tüylü, KÜÇÜK SİVRİ gaga, küçük kırmızı ibik ve sakal, ince sarı bacaklar (ördek gagası yok; civcivden daha uzun ve ince). (denetim 2: g3_fen)

```
a half-grown young chicken (a pullet) standing and seen from the side, taller and slimmer than a fluffy baby chick, with a mix of white and pale yellow feathers and a few cream wing feathers, a small SHARP POINTED short beak (a real chicken beak, definitely NOT a flat wide duck bill), a small red comb on top of its head and a tiny red wattle under the beak, two thin yellow legs with three-toed feet, two small round black eyes (it is an animal), it looks like a teenage chicken, not a duck and not a baby chick. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 43. `assets/images/items/fen/balon_hava.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Klasik, şişkin, parlak kırmızı hava balonu; altında küçük düğüm ve uzayan ince ip; üstüne desen yok. (denetim 2: g3_fen)

```
a classic round inflated party balloon in plain glossy red, perfectly smooth, plump and slightly egg-shaped like a real balloon filled with air, a small knotted tie at the bottom and a long thin white string hanging down from the knot, a soft white highlight on the side, no pattern, no swirls, no wreath, no ring shape. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 44. `assets/images/items/fen/buhar.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Küçük mavi çaydanlık: ağzından yukarı doğru yumuşak beyaz buhar bulutu çıkıyor. (denetim 2: g3_fen)

```
a small pastel-blue teapot-style kettle with a curved spout, a handle and a lid, standing on a small round base, white soft wispy steam is rising out of its spout and curling upward into the air above it, the steam clearly comes out of the spout and the kettle is clearly visible below the steam, calm and gentle, not hot or scary. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 45. `assets/images/items/fen/gazete.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yarım katlanmış gazete: üstte kalın koyu başlık bandı, altında sütunlar halinde ince gri satır çizgileri ve iki gri fotoğraf kutusu; ortada katlama izi. (denetim 2: g3_fen)

```
a folded newspaper lying flat and seen slightly from above, off-white paper with a thick dark charcoal banner stripe across the top as the masthead, below it two grey rectangular photo boxes and many thin parallel grey squiggly lines arranged in three narrow columns to suggest rows of print, a clear fold crease down the middle and slightly curled paper corners, it looks like a real newspaper and not a tile, not a chocolate bar and not a tablet, the lines are only wavy scribbles with no real letters. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 46. `assets/images/items/fen/bisiklet_fren.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Fren yapan bisikletli: yan görünüş, çocuk fren kolunu sıkıyor, durmuş ya da durmak üzere, yerde iki kısa koyu fren izi; TOZ, duman ve hız çizgisi YOK. (denetim 2: g3_fen)

```
a child sitting on a small bicycle seen from the side, the bicycle has just stopped, one small hand is clearly squeezing the brake lever on the handlebar and the child leans slightly back, two short dark skid marks lie on the ground behind the rear wheel, both wheels are sharp and still, absolutely no dust cloud, no smoke, no speed lines, no motion trails behind the bicycle, no puffs. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 47. `assets/images/items/fen/sahne/top_duvar.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Tek düz tuğla duvar (kuşbakışı): sol alttan duvara gelen turuncu ok, duvara değen tek top ve duvardan sol üste geri dönen turkuaz ok; yön değişimi açıkça görünür. (denetim 2: g3_fen)

```
seen from directly above like a map, a flat pale mint floor, one single straight brick wall standing along the right side of the picture, exactly one small ball touching the wall at the middle of the wall, one thick coral-colored clay arrow coming from the bottom-left corner straight toward the ball, and one thick turquoise clay arrow starting at the ball and leading away to the upper-left, the two arrows form a clear V shape that meets at the ball, so the ball clearly hits the wall and bounces back in a different direction, only one wall, one ball and two arrows, no characters, no other curves or lines, no corner walls. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 48. `assets/images/items/fen/tasarruf_tv_kapat.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çocuk, küçük televizyonun düğmesine basıp kapatıyor: ekran tamamen siyah/sönük, ışık yok; yanında küçük kırmızı bekleme ışığı. (denetim 2: g3_fen)

```
a smiling child pressing the round power button on the side of a small retro television with one finger, the television screen is completely dark black and switched off, no picture and no glow on the screen, only a tiny red standby light on the TV body, the TV looks clearly turned off, two eyes only on the child. The television has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 49. `assets/images/items/fen/tasarruf_perde_ac.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Çocuk perdeyi açıyor: pencereden içeri parlak güneş ışığı giriyor ve yere vuruyor; yanındaki masa lambası sönük (karanlık ampul). (denetim 2: g3_fen)

```
a smiling child pulling open one pastel curtain of a small freestanding toy window frame with both hands, bright warm yellow sunshine beams stream in through the open window and light up the floor, right next to the window stands a small table lamp that is clearly switched off with a dark unlit bulb and no glow, two eyes only on the child. The lamp has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 50. `assets/images/items/hak/saglik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Sağlık hakkı: gülümseyen doktor, muayene yatağında oturan çocuğu steteskopla dinliyor; üçü de baştan ayağa bütün gövdeli. (denetim 2: g3_hayat_bilgisi)

```
a friendly clay doctor in a white coat with a stethoscope standing beside a small clay child who sits on the edge of a pastel examination bed, the doctor gently holds the stethoscope against the child's chest and smiles, the child smiles calmly with feet dangling, both people are shown full body from head to toe with complete bodies, arms and legs, no doll, no separate head, only two people. Only the two people have faces; the bed and the stethoscope have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 51. `assets/images/items/sonuc/guvenli_gecis.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Güvenli geçiş: iki çocuk yaya geçidinde yürüyerek karşıya geçiyor, yeşil yaya ışığı yanıyor, araçlar geçidin çok gerisinde durmuş. (denetim 2: g3_hayat_bilgisi)

```
a small round clay diorama base with a grey road and a wide white-striped pedestrian crossing in the middle, two clay children walk calmly side by side across the crossing, each looking toward the traffic and smiling, a small pole beside the crossing shows a glowing green pedestrian light, a pastel pink car and a pastel blue car are stopped far behind the crossing with a wide empty gap of road between the cars and the children, nothing runs, everyone is calm and safe. Only the children have faces; the cars, the pole and the light have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 52. `assets/images/items/sonuc/aceleci.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Aceleci davranış: bir çocuk yaya geçidi dışında yolda koşuyor, öne eğik, çevresine bakmıyor; uzakta tek küçük araç. (denetim 2: g3_hayat_bilgisi)

```
a small round clay diorama base with a grey road, one clay child running fast across the road in a hurry, body leaning far forward, arms swinging, mid-stride with one foot high in the air, the head is turned straight ahead and the child clearly does not look left or right at the traffic, a rushed hurried worried face, one small pastel yellow car stands far away at the edge of the base, no other children, no crossing stripes under the child. Only the child has a face; the car has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 53. `assets/images/items/katki/yangin_sondu.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yangın söndü: duman ve alev yok; ıslak parlak duvarlar, itfaiye hortumundan çıkan mavi su yayı, su birikintisi, yalnız küçük bir is lekesi. (denetim 2: g3_hayat_bilgisi)

```
a small cute clay house with a bright red roof and cream walls, there is absolutely no smoke and no fire and no flames anywhere, the chimney is clean and empty, the red roof stays bright and neat, the walls look wet and shiny with a few blue water drops, one single small dark soot smudge above one window, on the left a yellow fire-hose nozzle with a red coiled hose on the ground sends a clean blue curved arc of water onto the roof, a small blue puddle in front of the door, the scene looks calm and safe. It has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 54. `assets/images/items/kroki/firin_k.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kroki: kuşbakışı mahalle haritası. Fırın (sarı bina, turuncu çatı, ekmek simgesi) HER ÜÇ krokide birebir aynı ve yazısız; kırmızı yıldız FIRININ üstünde. (denetim 2: g3_hayat_bilgisi)

```
a flat top-down bird's-eye plan view of a tiny town map, cream ground, grey roads, a green park with trees and a bench, a blue-roofed school with a small red flag, a yellow bakery with an orange roof and one bread-loaf symbol and a plain blank front with no sign board and no writing, a few plain red-roofed houses, the same camera, same scale and same buildings in every image, a big red clay star marker standing ON TOP of the bakery. Buildings and trees have no face, no eyes and no mouth. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 55. `assets/images/items/kroki/park_k.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kroki: firin_k ile birebir aynı harita (aynı fırın, yazısız); kırmızı yıldız PARKIN üstünde. (denetim 2: g3_hayat_bilgisi)

```
a flat top-down bird's-eye plan view of a tiny town map, cream ground, grey roads, a green park with trees and a bench, a blue-roofed school with a small red flag, a yellow bakery with an orange roof and one bread-loaf symbol and a plain blank front with no sign board and no writing, a few plain red-roofed houses, the same camera, same scale and same buildings in every image, a big red clay star marker standing ON TOP of the green park. Buildings and trees have no face, no eyes and no mouth. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 56. `assets/images/items/kroki/okul_k.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kroki: firin_k ile birebir aynı harita (aynı fırın, yazısız); kırmızı yıldız OKULUN (mavi çatılı, bayraklı bina) üstünde. (denetim 2: g3_hayat_bilgisi)

```
a flat top-down bird's-eye plan view of a tiny town map, cream ground, grey roads, a green park with trees and a bench, a blue-roofed school with a small red flag, a yellow bakery with an orange roof and one bread-loaf symbol and a plain blank front with no sign board and no writing, a few plain red-roofed houses, the same camera, same scale and same buildings in every image, a big red clay star marker standing ON TOP of the blue school building. Buildings and trees have no face, no eyes and no mouth. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 57. `assets/images/items/meslek/kasaba_sabah.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Kasaba sabahı: solda ekmek biçimli süslü, çizgili tenteli fırın (yazı yok), ortada sarı okul servisi, sağda okul binası. (denetim 2: g3_hayat_bilgisi)

```
a small town corner diorama in the morning: on the left a cute yellow bakery with a striped red-and-yellow awning and one big bread-loaf shaped clay ornament above its door instead of any sign board, the front of the building is completely plain without any writing, in the middle a yellow school bus, on the right a red-brick school building with a flag, a few clay trees and a clear light-blue sky, open empty yellow floor in the foreground. Buildings and the bus have no face, no eyes and no mouth. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark.
```

### 58. `assets/images/items/ataturk/ogrenci.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sınıf: sırasında defterine çalışan çocuk, yanında onu gülümseyerek takdir eden öğretmen; arkada boş yeşil tahta. (denetim 2: g3_hayat_bilgisi)

```
a cozy old-fashioned classroom diorama: a clay boy sits at a wooden school desk and concentrates on writing in an open notebook with a pencil, a friendly clay teacher with a neat jacket stands beside the desk, smiles proudly at the boy's notebook and points at it with approval, a plain empty green blackboard on the back wall without any marks, two more wooden desks in the background, a small Turkish flag on the wall. Only the two people have faces; the furniture and the flag have no face, no eyes and no mouth. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no text, no letters, no numbers, no watermark.
```

### 59. `assets/images/items/birlik/yalniz.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Yalnız kalmak: bir çocuk küçük kil zeminin bir ucunda tek başına, omuzları düşük, üzgün; uzakta üç çocuk birlikte top oynuyor, aralarında geniş boşluk. (denetim 2: g3_hayat_bilgisi)

```
a small round clay base: at the far left one clay boy stands completely alone with drooping shoulders, arms hanging down and a sad lonely face, looking toward the other side; at the far right three other clay children happily play together with a ball, holding hands and laughing, a wide empty gap of open space between the lone boy and the group, the lone boy holds no toys and no dolls and nobody is pointing at him. Only the children have faces; the ball has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 60. `assets/images/items/tek/karanlik_sokak.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Elektriksiz gece: ışıksız, koyu lacivert karanlık sokak; sönük sokak lambaları, karanlık pencereli evler, boş yol. (denetim 2: g3_hayat_bilgisi)

```
a small round clay street diorama at deep night: two houses facing each other with a very dark navy-blue road between them, the whole scene is very dark and dim in deep navy and dark blue-grey tones, the windows of both houses are dark and unlit, two street lamps stand unlit with dull grey bulbs and give no light, a thin crescent moon and a few tiny stars in a dark sky above, the road is empty with no people and no cars, no warm yellow light anywhere. The houses and lamps have no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 61. `assets/images/items/sorumluluk/kitabi_unut.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Kitabı unutmak: şaşkın, ellerini yanaklarına koymuş çocuk; önünde yerde duran büyük, açık ve içi bomboş okul çantası; çevrede kitap yok. (denetim 2: g3_hayat_bilgisi)

```
a clay child standing and facing the viewer with both hands pressed on the cheeks and the mouth open in an oh-no surprised face, in front of the child on the floor stands one big open pink school backpack with its flap folded back so that the empty inside is clearly visible, nothing is inside the backpack and no book is anywhere in the picture, no table, no box, no other objects. Only the child has a face; the backpack has no face, no eyes and no mouth. 3D claymation style, handcrafted plasticine toy look, soft rounded chunky shapes, subtle fingerprint texture, smooth matte clay surface, warm soft studio lighting, gentle ambient occlusion, bright cheerful candy-pastel colors, cute child-friendly design, single subject centered and fully visible, isolated on a plain solid light grey background (#EEEEEE), no ground shadow, no props unless described, no text, no letters, no numbers, no watermark.
```

### 62. `assets/images/items/durum/g3_muze_hazirlik.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Akşam evde masa başında bir çocuk: çenesini eline dayamış, tavana bakıp yarın ne olacağını düşünüyor. Masada yalnız küçük bir küre ve kapalı bir uzay kitabı var; elinde kalem, açık defter ya da liste yok. Duvarda şirin bir müze binası resmi asılı. (denetim 2: g3_turkce)

```
A child with short brown hair in a pink polo shirt sits at a desk at home in the evening, resting the chin on one hand and looking up toward the ceiling with a thoughtful, wondering expression, as if thinking about tomorrow's trip. On the desk there is only a small blue globe and one closed book with a planet picture on its cover. The child holds no pencil, and there is no open notebook, no sheet of paper, no list and nothing written anywhere in the image. On the wall behind the child hangs a framed picture of a friendly small museum building. The globe, the book, the desk and the picture have no face, no eyes and no mouth. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 63. `assets/images/items/durum/g3_deney_adimlari.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sınıfta öğretmen masanın yanında ayakta, bir elini kaldırmış anlatıyor; masada renkli suyla küçük kaplar ve büyüteç var. Çocuk sırasında öğretmene dönük, iki eli boş sırada kavuşuk, dikkatle dinliyor. Çocuğun elinde kalem yok; defter ya da kâğıt görünmüyor. (denetim 2: g3_turkce)

```
In a classroom, an adult teacher stands beside a table at the left holding up one hand while explaining something, mid-sentence. On the table are a few small cups with colored water and a magnifying glass. A child sits at a small desk on the right, turned toward the teacher, listening carefully with both hands folded on the empty desk and eyes on the teacher. The child holds no pencil and there is no notebook, no paper and nothing to write with anywhere in the image. The teacher has adult body proportions and is clearly much taller than the child. The cups, the table, the desk and the magnifying glass have no face, no eyes and no mouth. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 64. `assets/images/items/durum/g3_itfaiyeci.png`

- **Oran:** 16:9  
- **Referans görsel:** yok  
- **Açıklama:** Sınıf, konuk gelmeden hemen önce: öğretmen kapının yanında elini kapı koluna koymuş gülümsüyor; çocuklar sıralarında elleri sıranın üstünde, heyecanla kapıya bakıyor. Kimse el kaldırmıyor, elinde kâğıt ya da kalem yok. Pencerenin dışında okulun önünde kırmızı bir itfaiye aracı duruyor; sınıfın içinde itfaiyeci yok. (denetim 2: g3_turkce)

```
A bright classroom just before a visitor arrives. An adult woman teacher stands next to the closed classroom door with one hand on the door handle, smiling and looking at the door. Several children sit calmly at their small desks with their hands resting flat on the desks, all looking toward the door with excited faces. Nobody raises a hand, and nobody holds paper or pencils. Through the classroom window a red fire truck can be seen parked outside the school in the distance. There is no firefighter and no person in uniform inside the room. The teacher has adult body proportions and every child has small child proportions. The fire truck, the door, the desks and the window have no face, no eyes and no mouth. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```

### 65. `assets/images/items/hikaye/g3_senlik_hazirlik.png`

- **Oran:** 1:1  
- **Referans görsel:** yok  
- **Açıklama:** Okulda bir masada yan yana iki çocuk konuşuyor: uzun saçlı, iki yanda toka ve pembe elbiseli bir kız (Nil) ile kısa saçlı, mavi tişörtlü bir erkek (Kaan). Masada yalnız boş şeffaf bir su şişesi var; kâğıt, çizim ya da başka nesne yok. (denetim 2: g3_turkce)

```
Two children sit side by side at a small school table and talk to each other, looking at one another with friendly expressions. On the left sits a clearly girl-looking child: long brown hair in two pigtails tied with pink ribbons, wearing a pink dress. On the right sits a clearly boy-looking child: short brown hair, wearing a blue t-shirt and blue trousers. On the table there is only one empty clear plastic bottle, nothing else, no paper and no drawing. The bottle and the table have no face, no eyes and no mouth. 3D claymation diorama, handcrafted plasticine miniature world, tilt-shift miniature feel, soft rounded shapes, subtle clay texture, warm soft studio lighting with gentle shadows, bright cheerful candy-pastel color palette, cozy and inviting, child-friendly, clean uncluttered composition with open empty space in the center for game elements, no characters unless described, no text, no letters, no numbers, no watermark. dominant palette: soft lavender purple, bubblegum pink and cream accents.
```
