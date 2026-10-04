# 066 · 1. sınıf Türkçe ünite 6–9 seslendirmesi (hikâyeler, sorular, durumlar)

**Öncelik: ORTA** (Faz 4b). Bağımsız okuma ünitelerinin (`content/g1/turkce/u06–u09.json`) hikâye sayfaları, soruları, cümleleri, durum ipuçları ve kutu etiketleri.

> Bu dosya eklenmeden de oyun çalışır: eksik satırları cihazın Türkçe sesiyle okur. Gerçek kayıtlar geldiğinde kalite çok artar.

## Nasıl üretilir
1. **Google AI Studio → "Generate speech"** (Gemini TTS) ekranını aç. Tek konuşmacı kullan.
2. **Ses seçimi:** 005'in sonundaki "Seçilen sesler" bölümündeki **aynı iki sesi** kullan (Anlatıcı ve Bilge).
3. Her satır için ilgili **üslup talimatını** "Style instructions" alanına, **Metin** sütununu konuşma metnine yapıştır.
4. Çıktıyı **Dosya yolu** sütunundaki isimle kaydet; klasörler yoksa oluştur. `.wav` kabul edilir, istersen `.ogg`'ye çevir (mono, 22–44 kHz).
5. Dinleyip kontrol et: Türkçe telaffuz doğru mu, tempo 6 yaşındaki bir çocuk için yeterince yavaş mı?

## Ortak üslup talimatları
- **ANLATICI:** `Sıcak, sakin ve net bir sesle, 6-8 yaşındaki bir çocuğa konuşur gibi, yavaş ve anlaşılır oku. Kelimeleri tane tane söyle, cümle sonlarında kısa bir duraklama yap.`
- **BILGE:** `Neşeli, sevimli ve enerjik bir çizgi film karakteri gibi konuş. Gülümseyerek, coşkulu ama anlaşılır ve çok hızlı olmayan bir tempoyla söyle.`

Ek not: Sessiz okuma turlarında hikâye sayfasının ve cümlelerin sesi çocuk ilk cevabı verdikten sonra (ya da ipucu olarak) çalınır; okuma hızını çocuğun izleyebileceği kadar yavaş tut. Hikâyelerdeki konuşmalar (ör. Bilge'nin sözü) aynı Anlatıcı sesiyle, hafif canlandırarak okunur.

## Satırlar

| # | Kimlik (anahtar) | Dosya yolu | Konuşmacı | Metin |
|---|---|---|---|---|
| 1 | `vo.g1.turkce.cumle.ela_kek_al` | `assets/audio/voice/g1/turkce/cumle/ela_kek_al.wav` | ANLATICI | Ela kek al. |
| 2 | `vo.g1.turkce.cumle.nil_kutu_tut` | `assets/audio/voice/g1/turkce/cumle/nil_kutu_tut.wav` | ANLATICI | Nil kutu tut. |
| 3 | `vo.g1.turkce.cumle.ali_ile_nil_koltukta` | `assets/audio/voice/g1/turkce/cumle/ali_ile_nil_koltukta.wav` | ANLATICI | Ali ile Nil koltukta. |
| 4 | `vo.g1.turkce.cumle.ayi_ormanda_uyudu` | `assets/audio/voice/g1/turkce/cumle/ayi_ormanda_uyudu.wav` | ANLATICI | Ayı ormanda uyudu. |
| 5 | `vo.g1.turkce.cumle.kuzu_ot_yedi` | `assets/audio/voice/g1/turkce/cumle/kuzu_ot_yedi.wav` | ANLATICI | Kuzu ot yedi. |
| 6 | `vo.g1.turkce.cumle.ordek_suda_yuzer` | `assets/audio/voice/g1/turkce/cumle/ordek_suda_yuzer.wav` | ANLATICI | Ördek suda yüzer. |
| 7 | `vo.g1.turkce.cumle.cicek_acti` | `assets/audio/voice/g1/turkce/cumle/cicek_acti.wav` | ANLATICI | Çiçek açtı. |
| 8 | `vo.g1.turkce.cumle.kuslar_gokte_ucar` | `assets/audio/voice/g1/turkce/cumle/kuslar_gokte_ucar.wav` | ANLATICI | Kuşlar gökte uçar. |
| 9 | `vo.g1.turkce.cumle.beyaz_gemi_denizde` | `assets/audio/voice/g1/turkce/cumle/beyaz_gemi_denizde.wav` | ANLATICI | Beyaz gemi denizde. |
| 10 | `vo.g1.turkce.cumle.yagmur_yagiyor` | `assets/audio/voice/g1/turkce/cumle/yagmur_yagiyor.wav` | ANLATICI | Yağmur yağıyor. |
| 11 | `vo.g1.turkce.cumle.fare_peynir_yedi` | `assets/audio/voice/g1/turkce/cumle/fare_peynir_yedi.wav` | ANLATICI | Fare peynir yedi. |
| 12 | `vo.g1.turkce.cumle.horoz_sabah_oter` | `assets/audio/voice/g1/turkce/cumle/horoz_sabah_oter.wav` | ANLATICI | Horoz sabah öter. |
| 13 | `vo.g1.turkce.u06.n01.intro` | `assets/audio/voice/g1/turkce/u06/n01/intro.wav` | BILGE | Bugün yetenekleri anlatan hikâyeler dinleyeceğiz! |
| 14 | `vo.g1.turkce.u06.resim.s1` | `assets/audio/voice/g1/turkce/u06/resim/s1.wav` | ANLATICI | Ece resim yapmayı çok sever. Boyaları ve kâğıdı hazır. |
| 15 | `vo.g1.turkce.u06.resim.s2` | `assets/audio/voice/g1/turkce/u06/resim/s2.wav` | ANLATICI | Önce mavi bir deniz çizer. Sonra sarı bir güneş ekler. |
| 16 | `vo.g1.turkce.u06.resim.s3` | `assets/audio/voice/g1/turkce/u06/resim/s3.wav` | ANLATICI | Resmini ninesine hediye eder. Ninesi çok sevinir. |
| 17 | `vo.g1.turkce.u06.resim.q1` | `assets/audio/voice/g1/turkce/u06/resim/q1.wav` | ANLATICI | Ece ne yapmayı seviyor? |
| 18 | `vo.g1.turkce.u06.resim.q2` | `assets/audio/voice/g1/turkce/u06/resim/q2.wav` | ANLATICI | Ece resmine önce ne çizdi? |
| 19 | `vo.g1.turkce.u06.resim.q3` | `assets/audio/voice/g1/turkce/u06/resim/q3.wav` | ANLATICI | Ninesi resmi görünce ne hissetti? |
| 20 | `vo.g1.turkce.u06.sarki.s1` | `assets/audio/voice/g1/turkce/u06/sarki/s1.wav` | ANLATICI | Can şarkı söylemeyi sever. Her sabah bir şarkı mırıldanır. |
| 21 | `vo.g1.turkce.u06.sarki.s2` | `assets/audio/voice/g1/turkce/u06/sarki/s2.wav` | ANLATICI | Okulda bir gösteri var. Can sahnede şarkı söyler. |
| 22 | `vo.g1.turkce.u06.sarki.q1` | `assets/audio/voice/g1/turkce/u06/sarki/q1.wav` | ANLATICI | Bu hikâye neyi anlatıyor? |
| 23 | `vo.g1.turkce.u06.sarki.q2` | `assets/audio/voice/g1/turkce/u06/sarki/q2.wav` | ANLATICI | Gösteriden sonra arkadaşları ne yapar sence? |
| 24 | `vo.g1.turkce.u06.n01.r01` | `assets/audio/voice/g1/turkce/u06/n01/r01.wav` | ANLATICI | Bir hikâye dinleyelim. Önce resme bak: Sence bu hikâye ne anlatıyor? |
| 25 | `vo.g1.turkce.u06.n01.r02` | `assets/audio/voice/g1/turkce/u06/n01/r02.wav` | ANLATICI | Dinle ve düşün: Bu hikâyenin konusu ne? |
| 26 | `vo.g1.turkce.u06.n01.r03` | `assets/audio/voice/g1/turkce/u06/n01/r03.wav` | ANLATICI | Bu ses neyin sesi? Dinle ve resme dokun. |
| 27 | `vo.g1.turkce.u06.n02.intro` | `assets/audio/voice/g1/turkce/u06/n02/intro.wav` | BILGE | Şimdi sıra sende! Hikâyeleri sessizce oku. |
| 28 | `vo.g1.turkce.u06.davul.s1` | `assets/audio/voice/g1/turkce/u06/davul/s1.wav` | ANLATICI | Kaan davul çalar. |
| 29 | `vo.g1.turkce.u06.davul.s2` | `assets/audio/voice/g1/turkce/u06/davul/s2.wav` | ANLATICI | Dum, dum, dum! Kedi kaçar. |
| 30 | `vo.g1.turkce.u06.davul.s3` | `assets/audio/voice/g1/turkce/u06/davul/s3.wav` | ANLATICI | Kaan yavaş çalar. Kedi gelir, uyur. |
| 31 | `vo.g1.turkce.u06.davul.q1` | `assets/audio/voice/g1/turkce/u06/davul/q1.wav` | ANLATICI | Kaan ne çalar? |
| 32 | `vo.g1.turkce.u06.davul.q2` | `assets/audio/voice/g1/turkce/u06/davul/q2.wav` | ANLATICI | Kedi en sonunda ne yaptı? |
| 33 | `vo.g1.turkce.u06.davul.q3` | `assets/audio/voice/g1/turkce/u06/davul/q3.wav` | ANLATICI | Bu metnin konusu ne? |
| 34 | `vo.g1.turkce.u06.dans.s1` | `assets/audio/voice/g1/turkce/u06/dans/s1.wav` | ANLATICI | Zeynep dans eder. Kolları kuş gibi açılır. |
| 35 | `vo.g1.turkce.u06.dans.s2` | `assets/audio/voice/g1/turkce/u06/dans/s2.wav` | ANLATICI | Zeynep döner, döner. Etek de döner. |
| 36 | `vo.g1.turkce.u06.dans.q1` | `assets/audio/voice/g1/turkce/u06/dans/q1.wav` | ANLATICI | Zeynep ne yapıyor? |
| 37 | `vo.g1.turkce.u06.dans.q2` | `assets/audio/voice/g1/turkce/u06/dans/q2.wav` | ANLATICI | Zeynep'in kolları neye benziyor? |
| 38 | `vo.g1.turkce.u06.n02.r01` | `assets/audio/voice/g1/turkce/u06/n02/r01.wav` | ANLATICI | Hikâyeyi sessizce oku. Sonra soruları cevapla. |
| 39 | `vo.g1.turkce.u06.n02.r02` | `assets/audio/voice/g1/turkce/u06/n02/r02.wav` | ANLATICI | Başlığa ve resme bak. Sonra hikâyeyi oku. |
| 40 | `vo.g1.turkce.u06.n03.intro` | `assets/audio/voice/g1/turkce/u06/n03/intro.wav` | BILGE | Cümleleri oku ve doğru resmi bul! |
| 41 | `vo.g1.turkce.cumle.ece_resim_yapar` | `assets/audio/voice/g1/turkce/cumle/ece_resim_yapar.wav` | ANLATICI | Ece resim yapar. |
| 42 | `vo.g1.turkce.cumle.can_sarki_soyler` | `assets/audio/voice/g1/turkce/cumle/can_sarki_soyler.wav` | ANLATICI | Can şarkı söyler. |
| 43 | `vo.g1.turkce.cumle.zeynep_dans_eder` | `assets/audio/voice/g1/turkce/cumle/zeynep_dans_eder.wav` | ANLATICI | Zeynep dans eder. |
| 44 | `vo.g1.turkce.cumle.topu_sec` | `assets/audio/voice/g1/turkce/cumle/topu_sec.wav` | ANLATICI | Topu seç. |
| 45 | `vo.g1.turkce.cumle.kalemi_sec` | `assets/audio/voice/g1/turkce/cumle/kalemi_sec.wav` | ANLATICI | Kalemi seç. |
| 46 | `vo.g1.turkce.cumle.kitabi_sec` | `assets/audio/voice/g1/turkce/cumle/kitabi_sec.wav` | ANLATICI | Kitabı seç. |
| 47 | `vo.g1.turkce.u06.n03.r01` | `assets/audio/voice/g1/turkce/u06/n03/r01.wav` | ANLATICI | Cümleleri sessizce oku. Her cümleyi resmiyle eşleştir! |
| 48 | `vo.g1.turkce.u06.n03.r02` | `assets/audio/voice/g1/turkce/u06/n03/r02.wav` | ANLATICI | Üç cümle var! Oku ve resimlerine taşı. |
| 49 | `vo.g1.turkce.u06.n03.r03` | `assets/audio/voice/g1/turkce/u06/n03/r03.wav` | ANLATICI | Yönergeyi oku ve doğru resme taşı! |
| 50 | `vo.g1.turkce.u06.n04.intro` | `assets/audio/voice/g1/turkce/u06/n04/intro.wav` | BILGE | Kalemler hazır! Sözcük ve cümle yazalım. |
| 51 | `vo.g1.turkce.u06.n04.r01` | `assets/audio/voice/g1/turkce/u06/n04/r01.wav` | ANLATICI | Sözcükleri sırala, cümleyi kur! |
| 52 | `vo.g1.turkce.u06.n04.r02` | `assets/audio/voice/g1/turkce/u06/n04/r02.wav` | ANLATICI | Heceleri sırayla seç, fırça sözcüğünü yaz! |
| 53 | `vo.g1.turkce.u06.n04.r03` | `assets/audio/voice/g1/turkce/u06/n04/r03.wav` | ANLATICI | Cümleyi kur! İlk sözcük büyük harfle başlar. |
| 54 | `vo.g1.turkce.u06.n04.r04` | `assets/audio/voice/g1/turkce/u06/n04/r04.wav` | ANLATICI | Heceleri sırayla seç, davul sözcüğünü yaz! |
| 55 | `vo.g1.turkce.u06.n05.intro` | `assets/audio/voice/g1/turkce/u06/n05/intro.wav` | BILGE | Her durumda nasıl konuşacağımızı düşünelim! |
| 56 | `vo.g1.turkce.u06.ipucu.el_kaldir` | `assets/audio/voice/g1/turkce/u06/ipucu/el_kaldir.wav` | ANLATICI | Sınıfta söz almak için elimizi kaldırıp sıramızı bekleriz. |
| 57 | `vo.g1.turkce.u06.ipucu.nazik` | `assets/audio/voice/g1/turkce/u06/ipucu/nazik.wav` | ANLATICI | Arkadaşımıza nazik ve güler yüzle konuşuruz. |
| 58 | `vo.g1.turkce.u06.ipucu.ninni` | `assets/audio/voice/g1/turkce/u06/ipucu/ninni.wav` | ANLATICI | Uyumadan önce sakin ve yumuşak sesler dinleriz. |
| 59 | `vo.g1.turkce.u06.n05.r01` | `assets/audio/voice/g1/turkce/u06/n05/r01.wav` | ANLATICI | Derste öğretmenine bir soru sormak istiyorsun. Ne yaparsın? |
| 60 | `vo.g1.turkce.u06.n05.r02` | `assets/audio/voice/g1/turkce/u06/n05/r02.wav` | ANLATICI | Arkadaşın resmini sana gösteriyor. Ona nasıl konuşursun? |
| 61 | `vo.g1.turkce.u06.n05.r03` | `assets/audio/voice/g1/turkce/u06/n05/r03.wav` | ANLATICI | Uyumadan önce dinlemek için ne seçersin? |
| 62 | `vo.g1.turkce.u07.n01.intro` | `assets/audio/voice/g1/turkce/u07/n01/intro.wav` | BILGE | Minik kâşif, kulakların hazır mı? Merak dolu hikâyeler geliyor! |
| 63 | `vo.g1.turkce.u07.tirtil.s1` | `assets/audio/voice/g1/turkce/u07/tirtil/s1.wav` | ANLATICI | Minik tırtıl yaprakları yer, yer, yer. |
| 64 | `vo.g1.turkce.u07.tirtil.s2` | `assets/audio/voice/g1/turkce/u07/tirtil/s2.wav` | ANLATICI | Sonra kendine bir koza örer ve uyur. |
| 65 | `vo.g1.turkce.u07.tirtil.s3` | `assets/audio/voice/g1/turkce/u07/tirtil/s3.wav` | ANLATICI | Bir sabah koza açılır. İçinden renkli bir kelebek çıkar! |
| 66 | `vo.g1.turkce.u07.tirtil.q1` | `assets/audio/voice/g1/turkce/u07/tirtil/q1.wav` | ANLATICI | Sence bu hikâye hangi hayvanı anlatıyor? |
| 67 | `vo.g1.turkce.u07.tirtil.q2` | `assets/audio/voice/g1/turkce/u07/tirtil/q2.wav` | ANLATICI | Kelebek olmadan önce tırtıl ne yaptı? |
| 68 | `vo.g1.turkce.u07.tirtil.q3` | `assets/audio/voice/g1/turkce/u07/tirtil/q3.wav` | ANLATICI | Kelebek şimdi ne yapacak? |
| 69 | `vo.g1.turkce.u07.golge.s1` | `assets/audio/voice/g1/turkce/u07/golge/s1.wav` | ANLATICI | Ada güneşte yürür. Yanında kara bir şekil de yürür. |
| 70 | `vo.g1.turkce.u07.golge.s2` | `assets/audio/voice/g1/turkce/u07/golge/s2.wav` | ANLATICI | Ada durur, şekil de durur. Ada zıplar, şekil de zıplar! |
| 71 | `vo.g1.turkce.u07.golge.q1` | `assets/audio/voice/g1/turkce/u07/golge/q1.wav` | ANLATICI | Ada'nın yanında yürüyen ne? |
| 72 | `vo.g1.turkce.u07.golge.q2` | `assets/audio/voice/g1/turkce/u07/golge/q2.wav` | ANLATICI | Akşam olunca gölge ne olur sence? |
| 73 | `vo.g1.turkce.u07.n01.r01` | `assets/audio/voice/g1/turkce/u07/n01/r01.wav` | ANLATICI | Resme bak. Sence bu hikâye hangi hayvanı anlatıyor? Şimdi dinle. |
| 74 | `vo.g1.turkce.u07.n01.r02` | `assets/audio/voice/g1/turkce/u07/n01/r02.wav` | ANLATICI | Dinle ve düşün: Ada neyi merak ediyor? |
| 75 | `vo.g1.turkce.u07.n02.intro` | `assets/audio/voice/g1/turkce/u07/n02/intro.wav` | BILGE | Büyüteçler hazır! Şimdi sessizce okuyalım. |
| 76 | `vo.g1.turkce.u07.buyutec.s1` | `assets/audio/voice/g1/turkce/u07/buyutec/s1.wav` | ANLATICI | Ada'nın bir büyüteci var. |
| 77 | `vo.g1.turkce.u07.buyutec.s2` | `assets/audio/voice/g1/turkce/u07/buyutec/s2.wav` | ANLATICI | Ada büyüteçle karıncaya bakar. Karınca kocaman görünür! |
| 78 | `vo.g1.turkce.u07.buyutec.s3` | `assets/audio/voice/g1/turkce/u07/buyutec/s3.wav` | ANLATICI | Ada karıncanın bacaklarını sayar: tam altı bacak! |
| 79 | `vo.g1.turkce.u07.buyutec.q1` | `assets/audio/voice/g1/turkce/u07/buyutec/q1.wav` | ANLATICI | Ada neye baktı? |
| 80 | `vo.g1.turkce.u07.buyutec.q2` | `assets/audio/voice/g1/turkce/u07/buyutec/q2.wav` | ANLATICI | Karıncanın kaç bacağı var? |
| 81 | `vo.g1.turkce.u07.buyutec.q3` | `assets/audio/voice/g1/turkce/u07/buyutec/q3.wav` | ANLATICI | Bu metnin konusu ne? |
| 82 | `vo.g1.turkce.u07.tohum.s1` | `assets/audio/voice/g1/turkce/u07/tohum/s1.wav` | ANLATICI | Ali saksıya bir tohum eker. |
| 83 | `vo.g1.turkce.u07.tohum.s2` | `assets/audio/voice/g1/turkce/u07/tohum/s2.wav` | ANLATICI | Her gün su verir. Bir gün minik bir filiz çıkar! |
| 84 | `vo.g1.turkce.u07.tohum.q1` | `assets/audio/voice/g1/turkce/u07/tohum/q1.wav` | ANLATICI | Ali saksıya ne eker? |
| 85 | `vo.g1.turkce.u07.tohum.q2` | `assets/audio/voice/g1/turkce/u07/tohum/q2.wav` | ANLATICI | Tohumdan ne çıktı? |
| 86 | `vo.g1.turkce.u07.n02.r01` | `assets/audio/voice/g1/turkce/u07/n02/r01.wav` | ANLATICI | Hikâyeyi sessizce oku. Sonra soruları cevapla. |
| 87 | `vo.g1.turkce.u07.n02.r02` | `assets/audio/voice/g1/turkce/u07/n02/r02.wav` | ANLATICI | Başlığa ve resme bak. Sence ne olacak? Şimdi oku. |
| 88 | `vo.g1.turkce.u07.n03.intro` | `assets/audio/voice/g1/turkce/u07/n03/intro.wav` | BILGE | Kâşifler nesnelere dikkatle bakar. Haydi özelliklerine göre ayıralım! |
| 89 | `vo.g1.turkce.kutu.yumusak` | `assets/audio/voice/g1/turkce/kutu/yumusak.wav` | ANLATICI | Yumuşak olanlar |
| 90 | `vo.g1.turkce.kutu.sert` | `assets/audio/voice/g1/turkce/kutu/sert.wav` | ANLATICI | Sert olanlar |
| 91 | `vo.g1.turkce.kutu.buyuk` | `assets/audio/voice/g1/turkce/kutu/buyuk.wav` | ANLATICI | Büyük olanlar |
| 92 | `vo.g1.turkce.kutu.kucuk` | `assets/audio/voice/g1/turkce/kutu/kucuk.wav` | ANLATICI | Küçük olanlar |
| 93 | `vo.g1.turkce.u07.n03.r01` | `assets/audio/voice/g1/turkce/u07/n03/r01.wav` | ANLATICI | Bilge'nin sepetinde yumuşak ve sert şeyler var. Her birini doğru kutuya koy! |
| 94 | `vo.g1.turkce.u07.n03.r02` | `assets/audio/voice/g1/turkce/u07/n03/r02.wav` | ANLATICI | Dokununca yumuşak mı, sert mi? Düşün ve kutulara ayır! |
| 95 | `vo.g1.turkce.u07.n03.r03` | `assets/audio/voice/g1/turkce/u07/n03/r03.wav` | ANLATICI | Bu kez büyükleri ve küçükleri ayıralım! Her resmi doğru kutuya koy. |
| 96 | `vo.g1.turkce.u07.n04.intro` | `assets/audio/voice/g1/turkce/u07/n04/intro.wav` | BILGE | Cümleleri oku, doğru resmi bul! |
| 97 | `vo.g1.turkce.cumle.tirtil_yaprak_yer` | `assets/audio/voice/g1/turkce/cumle/tirtil_yaprak_yer.wav` | ANLATICI | Tırtıl yaprak yer. |
| 98 | `vo.g1.turkce.cumle.kelebek_cicege_konar` | `assets/audio/voice/g1/turkce/cumle/kelebek_cicege_konar.wav` | ANLATICI | Kelebek çiçeğe konar. |
| 99 | `vo.g1.turkce.cumle.ali_tohum_eker` | `assets/audio/voice/g1/turkce/cumle/ali_tohum_eker.wav` | ANLATICI | Ali tohum eker. |
| 100 | `vo.g1.turkce.cumle.karincayi_bul` | `assets/audio/voice/g1/turkce/cumle/karincayi_bul.wav` | ANLATICI | Karıncayı bul. |
| 101 | `vo.g1.turkce.cumle.tirtili_bul` | `assets/audio/voice/g1/turkce/cumle/tirtili_bul.wav` | ANLATICI | Tırtılı bul. |
| 102 | `vo.g1.turkce.cumle.kirpiyi_bul` | `assets/audio/voice/g1/turkce/cumle/kirpiyi_bul.wav` | ANLATICI | Kirpiyi bul. |
| 103 | `vo.g1.turkce.u07.n04.r01` | `assets/audio/voice/g1/turkce/u07/n04/r01.wav` | ANLATICI | Cümleleri sessizce oku ve resimleriyle eşleştir! |
| 104 | `vo.g1.turkce.u07.n04.r02` | `assets/audio/voice/g1/turkce/u07/n04/r02.wav` | ANLATICI | Üç cümle var! Oku ve resimlerine taşı. |
| 105 | `vo.g1.turkce.u07.n04.r03` | `assets/audio/voice/g1/turkce/u07/n04/r03.wav` | ANLATICI | Yönergeyi oku ve doğru resme taşı! |
| 106 | `vo.g1.turkce.u07.n05.intro` | `assets/audio/voice/g1/turkce/u07/n05/intro.wav` | BILGE | Keşiflerimizi yazalım! |
| 107 | `vo.g1.turkce.u07.n05.r01` | `assets/audio/voice/g1/turkce/u07/n05/r01.wav` | ANLATICI | Sözcükleri sırala, cümleyi kur! |
| 108 | `vo.g1.turkce.u07.n05.r02` | `assets/audio/voice/g1/turkce/u07/n05/r02.wav` | ANLATICI | Heceleri sırayla seç, karınca sözcüğünü yaz! |
| 109 | `vo.g1.turkce.u07.n05.r03` | `assets/audio/voice/g1/turkce/u07/n05/r03.wav` | ANLATICI | Cümleyi kur! İlk sözcük büyük harfle başlar. |
| 110 | `vo.g1.turkce.u07.n05.r04` | `assets/audio/voice/g1/turkce/u07/n05/r04.wav` | ANLATICI | Heceleri sırayla seç, kelebek sözcüğünü yaz! |
| 111 | `vo.g1.turkce.u07.n06.intro` | `assets/audio/voice/g1/turkce/u07/n06/intro.wav` | BILGE | Kâşifler de kibar konuşur! Doğru davranışı seçelim. |
| 112 | `vo.g1.turkce.u07.ipucu.fisilda` | `assets/audio/voice/g1/turkce/u07/ipucu/fisilda.wav` | ANLATICI | Kütüphanede başkalarını rahatsız etmemek için alçak sesle konuşuruz. |
| 113 | `vo.g1.turkce.u07.ipucu.belgesel` | `assets/audio/voice/g1/turkce/u07/ipucu/belgesel.wav` | ANLATICI | Bir şeyi öğrenmek istediğimizde onu anlatan bir şey izleriz. |
| 114 | `vo.g1.turkce.u07.ipucu.ilgi` | `assets/audio/voice/g1/turkce/u07/ipucu/ilgi.wav` | ANLATICI | Arkadaşımız bir şey anlatırken onu ilgiyle dinler, güzel sözler söyleriz. |
| 115 | `vo.g1.turkce.u07.n06.r01` | `assets/audio/voice/g1/turkce/u07/n06/r01.wav` | ANLATICI | Kütüphanede arkadaşına bir şey söylemek istiyorsun. Nasıl konuşursun? |
| 116 | `vo.g1.turkce.u07.n06.r02` | `assets/audio/voice/g1/turkce/u07/n06/r02.wav` | ANLATICI | Hayvanları öğrenmek istiyorsun. Ne izlersin? |
| 117 | `vo.g1.turkce.u07.n06.r03` | `assets/audio/voice/g1/turkce/u07/n06/r03.wav` | ANLATICI | Arkadaşın sana bulduğu taşı gösteriyor. Ne dersin? |
| 118 | `vo.g1.turkce.u08.n01.intro` | `assets/audio/voice/g1/turkce/u08/n01/intro.wav` | BILGE | Büyüklerimizden kalan güzel şeyleri dinleyelim! |
| 119 | `vo.g1.turkce.u08.sandik.s1` | `assets/audio/voice/g1/turkce/u08/sandik/s1.wav` | ANLATICI | Dedem eski bir sandık açtı. |
| 120 | `vo.g1.turkce.u08.sandik.s2` | `assets/audio/voice/g1/turkce/u08/sandik/s2.wav` | ANLATICI | İçinden bir topaç ve misketler çıktı. |
| 121 | `vo.g1.turkce.u08.sandik.s3` | `assets/audio/voice/g1/turkce/u08/sandik/s3.wav` | ANLATICI | Dedem 'Küçükken bunlarla oynardım.' dedi. Birlikte topaç çevirdik. |
| 122 | `vo.g1.turkce.u08.sandik.q1` | `assets/audio/voice/g1/turkce/u08/sandik/q1.wav` | ANLATICI | Sandıktan hangi oyuncak çıktı? |
| 123 | `vo.g1.turkce.u08.sandik.q2` | `assets/audio/voice/g1/turkce/u08/sandik/q2.wav` | ANLATICI | Bu hikâye neyi anlatıyor? |
| 124 | `vo.g1.turkce.u08.sandik.q3` | `assets/audio/voice/g1/turkce/u08/sandik/q3.wav` | ANLATICI | Dede çocuğuyla oynarken nasıl hissetti? |
| 125 | `vo.g1.turkce.u08.bayram.s1` | `assets/audio/voice/g1/turkce/u08/bayram/s1.wav` | ANLATICI | Bayram sabahı erkenden kalktık. Yeni giysilerimizi giydik. |
| 126 | `vo.g1.turkce.u08.bayram.s2` | `assets/audio/voice/g1/turkce/u08/bayram/s2.wav` | ANLATICI | Büyüklerimizi ziyaret ettik, ellerini öptük. |
| 127 | `vo.g1.turkce.u08.bayram.q1` | `assets/audio/voice/g1/turkce/u08/bayram/q1.wav` | ANLATICI | Bayramda büyüklerimizi ne yaparız? |
| 128 | `vo.g1.turkce.u08.bayram.q2` | `assets/audio/voice/g1/turkce/u08/bayram/q2.wav` | ANLATICI | Bayram sabahı ilk ne yaptılar? |
| 129 | `vo.g1.turkce.u08.n01.r01` | `assets/audio/voice/g1/turkce/u08/n01/r01.wav` | ANLATICI | Resme bak. Sence sandıkta ne var? Şimdi dinle. |
| 130 | `vo.g1.turkce.u08.n01.r02` | `assets/audio/voice/g1/turkce/u08/n01/r02.wav` | ANLATICI | Dinle ve düşün. Bayramda neler olur? |
| 131 | `vo.g1.turkce.u08.n02.intro` | `assets/audio/voice/g1/turkce/u08/n02/intro.wav` | BILGE | Eski oyunları ve güzel eşyaları okuyalım! |
| 132 | `vo.g1.turkce.u08.hali.s1` | `assets/audio/voice/g1/turkce/u08/hali/s1.wav` | ANLATICI | Ninem halı dokur. |
| 133 | `vo.g1.turkce.u08.hali.s2` | `assets/audio/voice/g1/turkce/u08/hali/s2.wav` | ANLATICI | Halıda kırmızı, mavi ve sarı renkler var. |
| 134 | `vo.g1.turkce.u08.hali.s3` | `assets/audio/voice/g1/turkce/u08/hali/s3.wav` | ANLATICI | Bu halı bize ninemden yadigâr kalacak. |
| 135 | `vo.g1.turkce.u08.hali.q1` | `assets/audio/voice/g1/turkce/u08/hali/q1.wav` | ANLATICI | Ninem ne dokur? |
| 136 | `vo.g1.turkce.u08.hali.q2` | `assets/audio/voice/g1/turkce/u08/hali/q2.wav` | ANLATICI | Halıda hangi renk yok? |
| 137 | `vo.g1.turkce.u08.hali.q3` | `assets/audio/voice/g1/turkce/u08/hali/q3.wav` | ANLATICI | Bu metnin konusu ne? |
| 138 | `vo.g1.turkce.u08.mendil.s1` | `assets/audio/voice/g1/turkce/u08/mendil/s1.wav` | ANLATICI | Ebru ile Kerem bahçede mendil kapmaca oynar. |
| 139 | `vo.g1.turkce.u08.mendil.s2` | `assets/audio/voice/g1/turkce/u08/mendil/s2.wav` | ANLATICI | Kerem koşar, mendili kapar. Herkes güler. |
| 140 | `vo.g1.turkce.u08.mendil.q1` | `assets/audio/voice/g1/turkce/u08/mendil/q1.wav` | ANLATICI | Çocuklar hangi oyunu oynar? |
| 141 | `vo.g1.turkce.u08.mendil.q2` | `assets/audio/voice/g1/turkce/u08/mendil/q2.wav` | ANLATICI | Mendili kim kaptı? |
| 142 | `vo.g1.turkce.u08.n02.r01` | `assets/audio/voice/g1/turkce/u08/n02/r01.wav` | ANLATICI | Hikâyeyi sessizce oku. Sonra soruları cevapla. |
| 143 | `vo.g1.turkce.u08.n02.r02` | `assets/audio/voice/g1/turkce/u08/n02/r02.wav` | ANLATICI | Başlığa ve resme bak. Sonra hikâyeyi oku. |
| 144 | `vo.g1.turkce.u08.n03.intro` | `assets/audio/voice/g1/turkce/u08/n03/intro.wav` | BILGE | Masal dinlemeyi sever misin? Masallarda gerçek ve hayal karışır! |
| 145 | `vo.g1.turkce.kutu.gercek` | `assets/audio/voice/g1/turkce/kutu/gercek.wav` | ANLATICI | Gerçek olanlar |
| 146 | `vo.g1.turkce.kutu.hayal` | `assets/audio/voice/g1/turkce/kutu/hayal.wav` | ANLATICI | Hayal olanlar |
| 147 | `vo.g1.turkce.u08.n03.r01` | `assets/audio/voice/g1/turkce/u08/n03/r01.wav` | ANLATICI | Masallarda hayal şeyler olur. Hangisi gerçek, hangisi hayal? Kutulara ayır! |
| 148 | `vo.g1.turkce.u08.n03.r02` | `assets/audio/voice/g1/turkce/u08/n03/r02.wav` | ANLATICI | Dikkatle bak! Gerçek olanları ve hayal olanları ayır. |
| 149 | `vo.g1.turkce.u08.n03.r03` | `assets/audio/voice/g1/turkce/u08/n03/r03.wav` | ANLATICI | Son tur! Gerçek ve hayal olanları dikkatle ayır. |
| 150 | `vo.g1.turkce.u08.n04.intro` | `assets/audio/voice/g1/turkce/u08/n04/intro.wav` | BILGE | Cümleleri oku, doğru resmi bul! |
| 151 | `vo.g1.turkce.cumle.ninem_hali_dokur` | `assets/audio/voice/g1/turkce/cumle/ninem_hali_dokur.wav` | ANLATICI | Ninem halı dokur. |
| 152 | `vo.g1.turkce.cumle.dedem_sandik_acti` | `assets/audio/voice/g1/turkce/cumle/dedem_sandik_acti.wav` | ANLATICI | Dedem sandık açtı. |
| 153 | `vo.g1.turkce.cumle.cocuklar_mendil_kapmaca_oynar` | `assets/audio/voice/g1/turkce/cumle/cocuklar_mendil_kapmaca_oynar.wav` | ANLATICI | Çocuklar mendil kapmaca oynar. |
| 154 | `vo.g1.turkce.cumle.topaci_sec` | `assets/audio/voice/g1/turkce/cumle/topaci_sec.wav` | ANLATICI | Topacı seç. |
| 155 | `vo.g1.turkce.cumle.sepeti_sec` | `assets/audio/voice/g1/turkce/cumle/sepeti_sec.wav` | ANLATICI | Sepeti seç. |
| 156 | `vo.g1.turkce.cumle.haliyi_sec` | `assets/audio/voice/g1/turkce/cumle/haliyi_sec.wav` | ANLATICI | Halıyı seç. |
| 157 | `vo.g1.turkce.u08.n04.r01` | `assets/audio/voice/g1/turkce/u08/n04/r01.wav` | ANLATICI | Cümleleri sessizce oku ve resimleriyle eşleştir! |
| 158 | `vo.g1.turkce.u08.n04.r02` | `assets/audio/voice/g1/turkce/u08/n04/r02.wav` | ANLATICI | Üç cümleyi oku. Her birini doğru resme taşı! |
| 159 | `vo.g1.turkce.u08.n04.r03` | `assets/audio/voice/g1/turkce/u08/n04/r03.wav` | ANLATICI | Yönergeyi oku ve doğru resme taşı! |
| 160 | `vo.g1.turkce.u08.n05.intro` | `assets/audio/voice/g1/turkce/u08/n05/intro.wav` | BILGE | Büyüklerimizden öğrendiklerimizi yazalım! |
| 161 | `vo.g1.turkce.u08.n05.r01` | `assets/audio/voice/g1/turkce/u08/n05/r01.wav` | ANLATICI | Sözcükleri sırala, cümleyi kur! |
| 162 | `vo.g1.turkce.u08.n05.r02` | `assets/audio/voice/g1/turkce/u08/n05/r02.wav` | ANLATICI | Heceleri sırayla seç, topaç sözcüğünü yaz! |
| 163 | `vo.g1.turkce.u08.n05.r03` | `assets/audio/voice/g1/turkce/u08/n05/r03.wav` | ANLATICI | Cümleyi kur! İlk sözcük büyük harfle başlar. |
| 164 | `vo.g1.turkce.u08.n05.r04` | `assets/audio/voice/g1/turkce/u08/n05/r04.wav` | ANLATICI | Heceleri sırayla seç, sandık sözcüğünü yaz! |
| 165 | `vo.g1.turkce.u08.n06.intro` | `assets/audio/voice/g1/turkce/u08/n06/intro.wav` | BILGE | Büyüklerimizle nasıl konuşuruz? Birlikte düşünelim. |
| 166 | `vo.g1.turkce.u08.ipucu.tesekkur` | `assets/audio/voice/g1/turkce/u08/ipucu/tesekkur.wav` | ANLATICI | Bize bir şey ikram edildiğinde teşekkür ederiz. |
| 167 | `vo.g1.turkce.u08.ipucu.dinle` | `assets/audio/voice/g1/turkce/u08/ipucu/dinle.wav` | ANLATICI | Dinlerken konuşanın yüzüne bakar, sessizce dinleriz. |
| 168 | `vo.g1.turkce.u08.ipucu.saygi` | `assets/audio/voice/g1/turkce/u08/ipucu/saygi.wav` | ANLATICI | Büyüklerimizle saygılı ve nazik konuşuruz. |
| 169 | `vo.g1.turkce.u08.n06.r01` | `assets/audio/voice/g1/turkce/u08/n06/r01.wav` | ANLATICI | Bayramda bir büyüğün sana şeker ikram etti. Ne dersin? |
| 170 | `vo.g1.turkce.u08.n06.r02` | `assets/audio/voice/g1/turkce/u08/n06/r02.wav` | ANLATICI | Ninen sana masal anlatmak istiyor. Masalı dinlemek için ne yaparsın? |
| 171 | `vo.g1.turkce.u08.n06.r03` | `assets/audio/voice/g1/turkce/u08/n06/r03.wav` | ANLATICI | Komşunuz yaşlı Ayşe Teyze'yle karşılaştın. Ona nasıl konuşursun? |
| 172 | `vo.g1.turkce.u09.n01.intro` | `assets/audio/voice/g1/turkce/u09/n01/intro.wav` | BILGE | Sorumluluklarımızı anlatan hikâyeler dinleyelim! |
| 173 | `vo.g1.turkce.u09.musluk.s1` | `assets/audio/voice/g1/turkce/u09/musluk/s1.wav` | ANLATICI | Ali dişlerini fırçalarken musluğu açık bıraktı. |
| 174 | `vo.g1.turkce.u09.musluk.s2` | `assets/audio/voice/g1/turkce/u09/musluk/s2.wav` | ANLATICI | Bilge 'Su çok değerli!' dedi. |
| 175 | `vo.g1.turkce.u09.musluk.s3` | `assets/audio/voice/g1/turkce/u09/musluk/s3.wav` | ANLATICI | Ali hemen musluğu kapattı. |
| 176 | `vo.g1.turkce.u09.musluk.q1` | `assets/audio/voice/g1/turkce/u09/musluk/q1.wav` | ANLATICI | Dişlerimizi fırçalarken musluk nasıl olmalı? |
| 177 | `vo.g1.turkce.u09.musluk.q2` | `assets/audio/voice/g1/turkce/u09/musluk/q2.wav` | ANLATICI | Bu hikâye neyi anlatıyor? |
| 178 | `vo.g1.turkce.u09.musluk.q3` | `assets/audio/voice/g1/turkce/u09/musluk/q3.wav` | ANLATICI | Ali musluğu kapatınca Bilge nasıl hissetti? |
| 179 | `vo.g1.turkce.u09.sofra.s1` | `assets/audio/voice/g1/turkce/u09/sofra/s1.wav` | ANLATICI | Akşam yemeği hazır. Annem sofrayı kuruyor. |
| 180 | `vo.g1.turkce.u09.sofra.s2` | `assets/audio/voice/g1/turkce/u09/sofra/s2.wav` | ANLATICI | Ben de tabakları ve kaşıkları koyuyorum. |
| 181 | `vo.g1.turkce.u09.sofra.q1` | `assets/audio/voice/g1/turkce/u09/sofra/q1.wav` | ANLATICI | Çocuk sofraya ne koydu? |
| 182 | `vo.g1.turkce.u09.sofra.q2` | `assets/audio/voice/g1/turkce/u09/sofra/q2.wav` | ANLATICI | Yemekten sonra ne yapabiliriz? |
| 183 | `vo.g1.turkce.u09.n01.r01` | `assets/audio/voice/g1/turkce/u09/n01/r01.wav` | ANLATICI | Resme bak. Sence ne olacak? Şimdi hikâyeyi dinle. |
| 184 | `vo.g1.turkce.u09.n01.r02` | `assets/audio/voice/g1/turkce/u09/n01/r02.wav` | ANLATICI | Dinle ve düşün: Evde nasıl yardım ederiz? |
| 185 | `vo.g1.turkce.u09.n02.intro` | `assets/audio/voice/g1/turkce/u09/n02/intro.wav` | BILGE | Görevlerimizi anlatan metinleri okuyalım! |
| 186 | `vo.g1.turkce.u09.fidan.s1` | `assets/audio/voice/g1/turkce/u09/fidan/s1.wav` | ANLATICI | Okulda fidan diktik. |
| 187 | `vo.g1.turkce.u09.fidan.s2` | `assets/audio/voice/g1/turkce/u09/fidan/s2.wav` | ANLATICI | Her gün sırayla fidanı suluyoruz. |
| 188 | `vo.g1.turkce.u09.fidan.s3` | `assets/audio/voice/g1/turkce/u09/fidan/s3.wav` | ANLATICI | Fidan büyüdü, ağaç oldu. |
| 189 | `vo.g1.turkce.u09.fidan.q1` | `assets/audio/voice/g1/turkce/u09/fidan/q1.wav` | ANLATICI | Okulda ne diktik? |
| 190 | `vo.g1.turkce.u09.fidan.q2` | `assets/audio/voice/g1/turkce/u09/fidan/q2.wav` | ANLATICI | Fidanı ne zaman suluyoruz? |
| 191 | `vo.g1.turkce.u09.fidan.q3` | `assets/audio/voice/g1/turkce/u09/fidan/q3.wav` | ANLATICI | Bu metnin konusu ne? |
| 192 | `vo.g1.turkce.u09.boncuk.s1` | `assets/audio/voice/g1/turkce/u09/boncuk/s1.wav` | ANLATICI | Boncuk bizim kedimiz. |
| 193 | `vo.g1.turkce.u09.boncuk.s2` | `assets/audio/voice/g1/turkce/u09/boncuk/s2.wav` | ANLATICI | Ona her sabah mama veririm. Suyunu da tazelerim. |
| 194 | `vo.g1.turkce.u09.boncuk.q1` | `assets/audio/voice/g1/turkce/u09/boncuk/q1.wav` | ANLATICI | Boncuk nedir? |
| 195 | `vo.g1.turkce.u09.boncuk.q2` | `assets/audio/voice/g1/turkce/u09/boncuk/q2.wav` | ANLATICI | Boncuk'a her sabah ne verilir? |
| 196 | `vo.g1.turkce.u09.n02.r01` | `assets/audio/voice/g1/turkce/u09/n02/r01.wav` | ANLATICI | Hikâyeyi sessizce oku. Sonra soruları cevapla. |
| 197 | `vo.g1.turkce.u09.n02.r02` | `assets/audio/voice/g1/turkce/u09/n02/r02.wav` | ANLATICI | Başlığa ve resme bak. Sonra hikâyeyi oku. |
| 198 | `vo.g1.turkce.u09.n03.intro` | `assets/audio/voice/g1/turkce/u09/n03/intro.wav` | BILGE | Cümleleri oku, doğru resmi bul! |
| 199 | `vo.g1.turkce.cumle.ali_muslugu_kapatti` | `assets/audio/voice/g1/turkce/cumle/ali_muslugu_kapatti.wav` | ANLATICI | Ali musluğu kapattı. |
| 200 | `vo.g1.turkce.cumle.fidani_suluyoruz` | `assets/audio/voice/g1/turkce/cumle/fidani_suluyoruz.wav` | ANLATICI | Fidanı suluyoruz. |
| 201 | `vo.g1.turkce.cumle.boncuka_mama_verdim` | `assets/audio/voice/g1/turkce/cumle/boncuka_mama_verdim.wav` | ANLATICI | Boncuk'a mama verdim. |
| 202 | `vo.g1.turkce.cumle.tabagi_sec` | `assets/audio/voice/g1/turkce/cumle/tabagi_sec.wav` | ANLATICI | Tabağı seç. |
| 203 | `vo.g1.turkce.cumle.fidani_sec` | `assets/audio/voice/g1/turkce/cumle/fidani_sec.wav` | ANLATICI | Fidanı seç. |
| 204 | `vo.g1.turkce.cumle.mamayi_sec` | `assets/audio/voice/g1/turkce/cumle/mamayi_sec.wav` | ANLATICI | Mamayı seç. |
| 205 | `vo.g1.turkce.u09.n03.r01` | `assets/audio/voice/g1/turkce/u09/n03/r01.wav` | ANLATICI | Cümleleri sessizce oku ve resimleriyle eşleştir! |
| 206 | `vo.g1.turkce.u09.n03.r02` | `assets/audio/voice/g1/turkce/u09/n03/r02.wav` | ANLATICI | Üç cümleyi oku. Her birini doğru resme taşı! |
| 207 | `vo.g1.turkce.u09.n03.r03` | `assets/audio/voice/g1/turkce/u09/n03/r03.wav` | ANLATICI | Yönergeyi oku ve doğru resme taşı! |
| 208 | `vo.g1.turkce.u09.n04.intro` | `assets/audio/voice/g1/turkce/u09/n04/intro.wav` | BILGE | Görevlerimizi yazalım! |
| 209 | `vo.g1.turkce.u09.n04.r01` | `assets/audio/voice/g1/turkce/u09/n04/r01.wav` | ANLATICI | Sözcükleri sırala, cümleyi kur! |
| 210 | `vo.g1.turkce.u09.n04.r02` | `assets/audio/voice/g1/turkce/u09/n04/r02.wav` | ANLATICI | Heceleri sırayla seç, fidan sözcüğünü yaz! |
| 211 | `vo.g1.turkce.u09.n04.r03` | `assets/audio/voice/g1/turkce/u09/n04/r03.wav` | ANLATICI | Cümleyi kur! İlk sözcük büyük harfle başlar. |
| 212 | `vo.g1.turkce.u09.n04.r04` | `assets/audio/voice/g1/turkce/u09/n04/r04.wav` | ANLATICI | Heceleri sırayla seç, tabak sözcüğünü yaz! |
| 213 | `vo.g1.turkce.u09.n05.intro` | `assets/audio/voice/g1/turkce/u09/n05/intro.wav` | BILGE | Sorumluluk sahibi çocuklar nasıl konuşur? Doğru davranışı seçelim. |
| 214 | `vo.g1.turkce.u09.ipucu.bekle` | `assets/audio/voice/g1/turkce/u09/ipucu/bekle.wav` | ANLATICI | Biri konuşurken sözünü kesmeyiz, sıramızı bekleriz. |
| 215 | `vo.g1.turkce.u09.ipucu.ogretmen` | `assets/audio/voice/g1/turkce/u09/ipucu/ogretmen.wav` | ANLATICI | Tatbikatta öğretmenimizin söylediklerini dikkatle dinleriz. |
| 216 | `vo.g1.turkce.u09.ipucu.ozur` | `assets/audio/voice/g1/turkce/u09/ipucu/ozur.wav` | ANLATICI | Bir hata yaptığımızda özür dileriz. |
| 217 | `vo.g1.turkce.u09.n05.r01` | `assets/audio/voice/g1/turkce/u09/n05/r01.wav` | ANLATICI | Sınıfta arkadaşın konuşuyor, senin de söyleyeceğin bir şey var. Ne yaparsın? |
| 218 | `vo.g1.turkce.u09.n05.r02` | `assets/audio/voice/g1/turkce/u09/n05/r02.wav` | ANLATICI | Okulda tatbikat zili çaldı. Kimi dinlersin? |
| 219 | `vo.g1.turkce.u09.n05.r03` | `assets/audio/voice/g1/turkce/u09/n05/r03.wav` | ANLATICI | Arkadaşının kalemini yanlışlıkla kırdın. Ona nasıl konuşursun? |

---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı
- [ ] Telaffuz ve tempo dinlenerek kontrol edildi
- [ ] Commit: `assets: 066 g1 turkce u06 u09 seslendirme`
