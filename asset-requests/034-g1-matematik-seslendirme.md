# 034 · 1. sınıf Matematik seslendirmesi (Faz 3c, Gemini TTS)

**Öncelik: ORTA** (Faz 3c). Yeni 26 durağın giriş satırları (Bilge), tur yönergeleri (Anlatıcı) ve turların içinde seslendirilen kısa satırlar: konumlar, sıra sayıları, paralar, şekiller, ölçme araçları, hikâye sayfaları ve grafik soruları. Toplam 187 satır.

> Bu dosya eklenmeden de oyun çalışır: eksik satırları cihazın Türkçe sesiyle okur.

Faz 1 ünitesinin satırları (007) bu fazda `u01`'den `u02`'ye taşındı; 007 dosyası yeni yollarla güncellendi.

## Nasıl üretilir
007'deki adımların aynısı: Google AI Studio → "Generate speech", tek konuşmacı, 005'te seçilen **aynı iki ses** (Anlatıcı, Bilge). Her satırı **Dosya yolu** sütunundaki isimle `.wav` (ya da mono `.ogg`) kaydet; klasörler yoksa oluştur.

## Ortak üslup talimatları
- **ANLATICI:** `Sıcak, sakin ve net bir sesle, 6-8 yaşındaki bir çocuğa konuşur gibi, yavaş ve anlaşılır oku. Kelimeleri tane tane söyle, cümle sonlarında kısa bir duraklama yap.`
- **BILGE:** `Neşeli, sevimli ve enerjik bir çizgi film karakteri gibi konuş. Gülümseyerek, coşkulu ama anlaşılır ve çok hızlı olmayan bir tempoyla söyle.`

Ek not: Tek sözcüklük satırları ("üçgen", "üçüncü", "beş lira", "toplama") net ve biraz vurgulu söyle; çocuk doğru kartı bu sesten bulacak.

## Satırlar

| # | Kimlik (anahtar) | Dosya yolu | Konuşmacı | Metin |
|---|---|---|---|---|
| 1 | `vo.g1.matematik.konum.ustunde` | `assets/audio/voice/g1/matematik/konum/ustunde.wav` | ANLATICI | Kedi kutunun üstünde. |
| 2 | `vo.g1.matematik.konum.altinda` | `assets/audio/voice/g1/matematik/konum/altinda.wav` | ANLATICI | Kedi masanın altında. |
| 3 | `vo.g1.matematik.konum.icinde` | `assets/audio/voice/g1/matematik/konum/icinde.wav` | ANLATICI | Kedi kutunun içinde. |
| 4 | `vo.g1.matematik.konum.disinda` | `assets/audio/voice/g1/matematik/konum/disinda.wav` | ANLATICI | Kedi kutunun dışında. |
| 5 | `vo.g1.matematik.konum.onunde` | `assets/audio/voice/g1/matematik/konum/onunde.wav` | ANLATICI | Kedi kutunun önünde. |
| 6 | `vo.g1.matematik.konum.arkasinda` | `assets/audio/voice/g1/matematik/konum/arkasinda.wav` | ANLATICI | Kedi kutunun arkasında. |
| 7 | `vo.g1.matematik.konum.arasinda` | `assets/audio/voice/g1/matematik/konum/arasinda.wav` | ANLATICI | Kedi iki kutunun arasında. |
| 8 | `vo.g1.matematik.konum.solunda` | `assets/audio/voice/g1/matematik/konum/solunda.wav` | ANLATICI | Kedi kutunun solunda. |
| 9 | `vo.g1.matematik.konum.saginda` | `assets/audio/voice/g1/matematik/konum/saginda.wav` | ANLATICI | Kedi kutunun sağında. |
| 10 | `vo.g1.matematik.konum.uzakta` | `assets/audio/voice/g1/matematik/konum/uzakta.wav` | ANLATICI | Kedi evden uzakta. |
| 11 | `vo.g1.matematik.konum.yakinda` | `assets/audio/voice/g1/matematik/konum/yakinda.wav` | ANLATICI | Kedi evin yakınında. |
| 12 | `vo.g1.matematik.u01.n01.r01` | `assets/audio/voice/g1/matematik/u01/n01/r01.wav` | ANLATICI | Dinle ve kediyi doğru yerde gösteren resme dokun! |
| 13 | `vo.g1.matematik.u01.n01.r02` | `assets/audio/voice/g1/matematik/u01/n01/r02.wav` | ANLATICI | Kedi nerede saklanıyor? Dinle ve doğru resmi bul! |
| 14 | `vo.g1.matematik.u01.n01.r03` | `assets/audio/voice/g1/matematik/u01/n01/r03.wav` | ANLATICI | İyi dinle! Kedinin yerini gösteren resme dokun. |
| 15 | `vo.g1.matematik.u01.n01.r04` | `assets/audio/voice/g1/matematik/u01/n01/r04.wav` | ANLATICI | Sağ ve sol! Dinle ve doğru resmi bul. |
| 16 | `vo.g1.matematik.u01.n01.r05` | `assets/audio/voice/g1/matematik/u01/n01/r05.wav` | ANLATICI | Yakın mı, uzak mı? Dinle ve doğru resme dokun. |
| 17 | `vo.g1.matematik.u01.n01.intro` | `assets/audio/voice/g1/matematik/u01/n01/intro.wav` | BILGE | Merhaba! Bugün minik kedimiz saklambaç oynuyor. Nerede olduğunu dinleyip bulalım! |
| 18 | `vo.g1.matematik.u01.n02.r01` | `assets/audio/voice/g1/matematik/u01/n02/r01.wav` | ANLATICI | Okları sırayla izle. Gezgin hangi kareye varacak? O kareye dokun! |
| 19 | `vo.g1.matematik.u01.n02.r02` | `assets/audio/voice/g1/matematik/u01/n02/r02.wav` | ANLATICI | İleri git, sonra dön! Gezginin varacağı kareye dokun. |
| 20 | `vo.g1.matematik.u01.n02.r03` | `assets/audio/voice/g1/matematik/u01/n02/r03.wav` | ANLATICI | Yönergeyi dikkatle izle. Gezgin nerede duracak? |
| 21 | `vo.g1.matematik.u01.n02.intro` | `assets/audio/voice/g1/matematik/u01/n02/intro.wav` | BILGE | Gezgin arkadaşımız yürüyüşe çıkıyor! Okları izle, nereye varacağını bul. |
| 22 | `vo.g1.matematik.u01.n03.r01` | `assets/audio/voice/g1/matematik/u01/n03/r01.wav` | ANLATICI | Okları dizerek gezgini bayrağa götür. Sonra oynat düğmesine dokun! |
| 23 | `vo.g1.matematik.u01.n03.r02` | `assets/audio/voice/g1/matematik/u01/n03/r02.wav` | ANLATICI | Bayrak yukarıda! Gezgin önce dönmeli. Okları diz ve oynat. |
| 24 | `vo.g1.matematik.u01.n03.r03` | `assets/audio/voice/g1/matematik/u01/n03/r03.wav` | ANLATICI | Taşlara dikkat! Gezgini taşların etrafından bayrağa götür. |
| 25 | `vo.g1.matematik.u01.n03.intro` | `assets/audio/voice/g1/matematik/u01/n03/intro.wav` | BILGE | Şimdi yönergeyi sen hazırla! Gezgini bayrağa götürecek okları diz. |
| 26 | `vo.g1.matematik.u01.n04.r01` | `assets/audio/voice/g1/matematik/u01/n04/r01.wav` | ANLATICI | Rengine bak! Her balonu eşinin yanına sürükle. |
| 27 | `vo.g1.matematik.u01.n04.r02` | `assets/audio/voice/g1/matematik/u01/n04/r02.wav` | ANLATICI | Şekline bak! Her şekli eşiyle eşleştir. |
| 28 | `vo.g1.matematik.u01.n04.r03` | `assets/audio/voice/g1/matematik/u01/n04/r03.wav` | ANLATICI | Büyüklüğüne bak! Büyük ayıcığı büyükle, küçük ayıcığı küçükle eşleştir. |
| 29 | `vo.g1.matematik.u01.n04.r04` | `assets/audio/voice/g1/matematik/u01/n04/r04.wav` | ANLATICI | Rengine, şekline ve büyüklüğüne bak. Her nesneyi eşiyle eşleştir! |
| 30 | `vo.g1.matematik.u01.n04.intro` | `assets/audio/voice/g1/matematik/u01/n04/intro.wav` | BILGE | Eş nesneler birbirinin aynısıdır: rengi, şekli ve büyüklüğü aynı. Haydi eşleri bulalım! |
| 31 | `vo.g1.matematik.meyveler` | `assets/audio/voice/g1/matematik/meyveler.wav` | ANLATICI | meyveler |
| 32 | `vo.g1.matematik.oyuncaklar` | `assets/audio/voice/g1/matematik/oyuncaklar.wav` | ANLATICI | oyuncaklar |
| 33 | `vo.g1.matematik.hayvanlar` | `assets/audio/voice/g1/matematik/hayvanlar.wav` | ANLATICI | hayvanlar |
| 34 | `vo.g1.matematik.u02.n06.r01` | `assets/audio/voice/g1/matematik/u02/n06/r01.wav` | ANLATICI | Meyveleri bir kutuya, oyuncakları öbür kutuya koy! |
| 35 | `vo.g1.matematik.u02.n06.r02` | `assets/audio/voice/g1/matematik/u02/n06/r02.wav` | ANLATICI | Dağınık duran civcivleri say. Kaç civciv var? |
| 36 | `vo.g1.matematik.u02.n06.r03` | `assets/audio/voice/g1/matematik/u02/n06/r03.wav` | ANLATICI | Grubu üç parçaya ayır: meyveler, oyuncaklar ve hayvanlar! |
| 37 | `vo.g1.matematik.u02.n06.r04` | `assets/audio/voice/g1/matematik/u02/n06/r04.wav` | ANLATICI | Hepsini birlikte say. Toplam kaç balık var? |
| 38 | `vo.g1.matematik.u02.n06.intro` | `assets/audio/voice/g1/matematik/u02/n06/intro.wav` | BILGE | Bir grubu parçalara ayırabiliriz! Nesneleri türlerine göre ayırıp sayalım. |
| 39 | `vo.g1.matematik.sira.1` | `assets/audio/voice/g1/matematik/sira/1.wav` | ANLATICI | birinci |
| 40 | `vo.g1.matematik.sira.2` | `assets/audio/voice/g1/matematik/sira/2.wav` | ANLATICI | ikinci |
| 41 | `vo.g1.matematik.sira.3` | `assets/audio/voice/g1/matematik/sira/3.wav` | ANLATICI | üçüncü |
| 42 | `vo.g1.matematik.sira.4` | `assets/audio/voice/g1/matematik/sira/4.wav` | ANLATICI | dördüncü |
| 43 | `vo.g1.matematik.u02.n07.r01` | `assets/audio/voice/g1/matematik/u02/n07/r01.wav` | ANLATICI | Soldan başla. Yarışta birinci olan hayvana dokun! |
| 44 | `vo.g1.matematik.u02.n07.r02` | `assets/audio/voice/g1/matematik/u02/n07/r02.wav` | ANLATICI | Soldan sayalım. İkinci sıradaki hayvana dokun! |
| 45 | `vo.g1.matematik.u02.n07.r03` | `assets/audio/voice/g1/matematik/u02/n07/r03.wav` | ANLATICI | Soldan say. Üçüncü sıradaki hayvan hangisi? Dokun! |
| 46 | `vo.g1.matematik.u02.n07.r04` | `assets/audio/voice/g1/matematik/u02/n07/r04.wav` | ANLATICI | Soldan say. Dördüncü sıradaki hayvana dokun! |
| 47 | `vo.g1.matematik.u02.n07.intro` | `assets/audio/voice/g1/matematik/u02/n07/intro.wav` | BILGE | Hayvanlar yarışıyor! Soldan başlayarak sırayı sayalım: birinci, ikinci, üçüncü... |
| 48 | `vo.g1.matematik.u02.n08.r01` | `assets/audio/voice/g1/matematik/u02/n08/r01.wav` | ANLATICI | Kefelerdeki elmalara bak. Soldaki kefede daha az mı, daha çok mu, yoksa eşit mi? |
| 49 | `vo.g1.matematik.u02.n08.r02` | `assets/audio/voice/g1/matematik/u02/n08/r02.wav` | ANLATICI | Topları karşılaştır. Soldaki kefede daha az mı, daha çok mu, eşit mi? |
| 50 | `vo.g1.matematik.u02.n08.r03` | `assets/audio/voice/g1/matematik/u02/n08/r03.wav` | ANLATICI | Çileklere dikkatle bak. Soldaki kefede daha az mı, daha çok mu, eşit mi? |
| 51 | `vo.g1.matematik.u02.n08.r04` | `assets/audio/voice/g1/matematik/u02/n08/r04.wav` | ANLATICI | Kuşları karşılaştır. Soldaki kefede daha az mı, daha çok mu, eşit mi? |
| 52 | `vo.g1.matematik.u02.n08.intro` | `assets/audio/voice/g1/matematik/u02/n08/intro.wav` | BILGE | Terazimizin iki kefesi var. Hangi kefede daha çok, hangisinde daha az nesne var? Eşit mi? |
| 53 | `vo.g1.matematik.u02.n09.r01` | `assets/audio/voice/g1/matematik/u02/n09/r01.wav` | ANLATICI | Birer sayalım! Kartları küçükten büyüğe sıraya diz. |
| 54 | `vo.g1.matematik.u02.n09.r02` | `assets/audio/voice/g1/matematik/u02/n09/r02.wav` | ANLATICI | İkişer sayıyoruz: iki, dört, altı... Sıradaki sayıları bul! |
| 55 | `vo.g1.matematik.u02.n09.r03` | `assets/audio/voice/g1/matematik/u02/n09/r03.wav` | ANLATICI | Beşer sayıyoruz: beş, on, on beş... Sıradaki sayıları bul! |
| 56 | `vo.g1.matematik.u02.n09.r04` | `assets/audio/voice/g1/matematik/u02/n09/r04.wav` | ANLATICI | Onar sayalım! Kartları on, yirmi, otuz diye sıraya diz. |
| 57 | `vo.g1.matematik.u02.n09.r05` | `assets/audio/voice/g1/matematik/u02/n09/r05.wav` | ANLATICI | Onar sayarak yüze kadar git! Sıradaki sayıları bul. |
| 58 | `vo.g1.matematik.u02.n09.intro` | `assets/audio/voice/g1/matematik/u02/n09/intro.wav` | BILGE | Birer, ikişer, beşer, onar! Ritmik sayarak sayıları sıraya dizelim. |
| 59 | `vo.g1.matematik.u02.n10.r01` | `assets/audio/voice/g1/matematik/u02/n10/r01.wav` | ANLATICI | Yirmiden geriye birer sayıyoruz: yirmi, on dokuz, on sekiz... Sıradakini bul! |
| 60 | `vo.g1.matematik.u02.n10.r02` | `assets/audio/voice/g1/matematik/u02/n10/r02.wav` | ANLATICI | Geriye sayalım! Kartları büyükten küçüğe sıraya diz. |
| 61 | `vo.g1.matematik.u02.n10.r03` | `assets/audio/voice/g1/matematik/u02/n10/r03.wav` | ANLATICI | Yirmiden geriye ikişer sayıyoruz: yirmi, on sekiz, on altı... Sıradakini bul! |
| 62 | `vo.g1.matematik.u02.n10.r04` | `assets/audio/voice/g1/matematik/u02/n10/r04.wav` | ANLATICI | Yirmiden geriye say! Kartları büyükten küçüğe diz. |
| 63 | `vo.g1.matematik.u02.n10.intro` | `assets/audio/voice/g1/matematik/u02/n10/intro.wav` | BILGE | Roket kalkıyor! Yirmiden geriye doğru sayalım. |
| 64 | `vo.g1.matematik.u02.n11.r01` | `assets/audio/voice/g1/matematik/u02/n11/r01.wav` | ANLATICI | Şekiller tekrar ediyor. Sıradaki şekli bul! |
| 65 | `vo.g1.matematik.u02.n11.r02` | `assets/audio/voice/g1/matematik/u02/n11/r02.wav` | ANLATICI | Üç şekil tekrar ediyor. Boşluklara hangi şekiller gelmeli? |
| 66 | `vo.g1.matematik.u02.n11.r03` | `assets/audio/voice/g1/matematik/u02/n11/r03.wav` | ANLATICI | Sayılar artıyor: bir, üç, beş... Dördüncü sayı ne olmalı? |
| 67 | `vo.g1.matematik.u02.n11.r04` | `assets/audio/voice/g1/matematik/u02/n11/r04.wav` | ANLATICI | Sayılar azalıyor: on beş, on iki, dokuz... Sıradaki sayıyı bul! |
| 68 | `vo.g1.matematik.u02.n11.intro` | `assets/audio/voice/g1/matematik/u02/n11/intro.wav` | BILGE | Örüntülerde bir kural vardır. Kuralı bulursak sıradakini de buluruz! |
| 69 | `vo.g1.matematik.u03.n01.s01` | `assets/audio/voice/g1/matematik/u03/n01/s01.wav` | ANLATICI | Sınıfın uzunluğunu hangisiyle ölçeriz? |
| 70 | `vo.g1.matematik.olcu.atac` | `assets/audio/voice/g1/matematik/olcu/atac.wav` | ANLATICI | ataç |
| 71 | `vo.g1.matematik.olcu.adim` | `assets/audio/voice/g1/matematik/olcu/adim.wav` | ANLATICI | adım |
| 72 | `vo.g1.matematik.olcu.kup` | `assets/audio/voice/g1/matematik/olcu/kup.wav` | ANLATICI | küp |
| 73 | `vo.g1.matematik.u03.n01.s02` | `assets/audio/voice/g1/matematik/u03/n01/s02.wav` | ANLATICI | Kalemin uzunluğunu hangisiyle ölçeriz? |
| 74 | `vo.g1.matematik.olcu.karis` | `assets/audio/voice/g1/matematik/olcu/karis.wav` | ANLATICI | karış |
| 75 | `vo.g1.matematik.u03.n01.s03` | `assets/audio/voice/g1/matematik/u03/n01/s03.wav` | ANLATICI | Masanın uzunluğunu hangisiyle ölçeriz? |
| 76 | `vo.g1.matematik.olcu.misket` | `assets/audio/voice/g1/matematik/olcu/misket.wav` | ANLATICI | misket |
| 77 | `vo.g1.matematik.u03.n01.s04` | `assets/audio/voice/g1/matematik/u03/n01/s04.wav` | ANLATICI | Elmanın kaç birim ağırlığında olduğunu terazide neyle buluruz? |
| 78 | `vo.g1.matematik.u03.n01.r01` | `assets/audio/voice/g1/matematik/u03/n01/r01.wav` | ANLATICI | Ölçme zamanı! Soruyu dinle ve en uygun ölçme aracına dokun. |
| 79 | `vo.g1.matematik.u03.n01.r02` | `assets/audio/voice/g1/matematik/u03/n01/r02.wav` | ANLATICI | Soruyu dinle ve en uygun ölçme aracına dokun. |
| 80 | `vo.g1.matematik.u03.n01.r03` | `assets/audio/voice/g1/matematik/u03/n01/r03.wav` | ANLATICI | Soruyu dinle. Hangisiyle ölçmek en uygun? |
| 81 | `vo.g1.matematik.u03.n01.r04` | `assets/audio/voice/g1/matematik/u03/n01/r04.wav` | ANLATICI | Bu kez ağırlığı ölçüyoruz! Soruyu dinle ve uygun olana dokun. |
| 82 | `vo.g1.matematik.u03.n01.intro` | `assets/audio/voice/g1/matematik/u03/n01/intro.wav` | BILGE | Uzunluğu karışla, adımla ya da ataçla ölçebiliriz. Ağırlığı da terazide misketle! Hangisi uygun, bulalım. |
| 83 | `vo.g1.matematik.u03.n02.r01` | `assets/audio/voice/g1/matematik/u03/n02/r01.wav` | ANLATICI | Bu elma kaç küp ağırlığında? Önce tahmin et, sonra küp ekleyerek tart! |
| 84 | `vo.g1.matematik.u03.n02.r02` | `assets/audio/voice/g1/matematik/u03/n02/r02.wav` | ANLATICI | Ayıcık kaç küp ağırlığında? Tahmin et, sonra tart. |
| 85 | `vo.g1.matematik.u03.n02.r03` | `assets/audio/voice/g1/matematik/u03/n02/r03.wav` | ANLATICI | Okul çantası kaç küp ağırlığında? Tahmin et, tart ve karşılaştır. |
| 86 | `vo.g1.matematik.u03.n02.intro` | `assets/audio/voice/g1/matematik/u03/n02/intro.wav` | BILGE | Önce tahmin et, sonra terazide küplerle tart. Tahminin yakın mıydı, uzak mı? |
| 87 | `vo.g1.matematik.isaret.arti` | `assets/audio/voice/g1/matematik/isaret/arti.wav` | ANLATICI | toplama |
| 88 | `vo.g1.matematik.isaret.eksi` | `assets/audio/voice/g1/matematik/isaret/eksi.wav` | ANLATICI | çıkarma |
| 89 | `vo.g1.matematik.u04.n01.h1.p1` | `assets/audio/voice/g1/matematik/u04/n01/h1/p1.wav` | ANLATICI | Ece'nin üç balonu var. |
| 90 | `vo.g1.matematik.u04.n01.h1.p2` | `assets/audio/voice/g1/matematik/u04/n01/h1/p2.wav` | ANLATICI | Annesi Ece'ye iki balon daha veriyor. |
| 91 | `vo.g1.matematik.u04.n01.h1.q1` | `assets/audio/voice/g1/matematik/u04/n01/h1/q1.wav` | ANLATICI | Balonlar arttı. Hangi işlemi yaparız? |
| 92 | `vo.g1.matematik.u04.n01.h1.q2` | `assets/audio/voice/g1/matematik/u04/n01/h1/q2.wav` | ANLATICI | Ece'nin şimdi kaç balonu var? |
| 93 | `vo.g1.matematik.u04.n01.h2.p1` | `assets/audio/voice/g1/matematik/u04/n01/h2/p1.wav` | ANLATICI | Dalda yedi kuş var. |
| 94 | `vo.g1.matematik.u04.n01.h2.p2` | `assets/audio/voice/g1/matematik/u04/n01/h2/p2.wav` | ANLATICI | Üç kuş uçup gidiyor. |
| 95 | `vo.g1.matematik.u04.n01.h2.q1` | `assets/audio/voice/g1/matematik/u04/n01/h2/q1.wav` | ANLATICI | Kuşlar azaldı. Hangi işlemi yaparız? |
| 96 | `vo.g1.matematik.u04.n01.h2.q2` | `assets/audio/voice/g1/matematik/u04/n01/h2/q2.wav` | ANLATICI | Dalda kaç kuş kaldı? |
| 97 | `vo.g1.matematik.u04.n01.h3.p1` | `assets/audio/voice/g1/matematik/u04/n01/h3/p1.wav` | ANLATICI | Can on iki bilye topladı. |
| 98 | `vo.g1.matematik.u04.n01.h3.p2` | `assets/audio/voice/g1/matematik/u04/n01/h3/p2.wav` | ANLATICI | Arkadaşı ona dört bilye daha verdi. |
| 99 | `vo.g1.matematik.u04.n01.h3.q1` | `assets/audio/voice/g1/matematik/u04/n01/h3/q1.wav` | ANLATICI | Bilyeler arttı mı, azaldı mı? Hangi işlemi yaparız? |
| 100 | `vo.g1.matematik.u04.n01.h3.q2` | `assets/audio/voice/g1/matematik/u04/n01/h3/q2.wav` | ANLATICI | Can'ın kaç bilyesi oldu? |
| 101 | `vo.g1.matematik.u04.n01.r01` | `assets/audio/voice/g1/matematik/u04/n01/r01.wav` | ANLATICI | Hikâyeyi dinle, sonra soruları cevapla! |
| 102 | `vo.g1.matematik.u04.n01.r02` | `assets/audio/voice/g1/matematik/u04/n01/r02.wav` | ANLATICI | Hikâyeyi dinle, sonra soruları cevapla! |
| 103 | `vo.g1.matematik.u04.n01.r03` | `assets/audio/voice/g1/matematik/u04/n01/r03.wav` | ANLATICI | Hikâyeyi dinle, sonra soruları cevapla! |
| 104 | `vo.g1.matematik.u04.n01.intro` | `assets/audio/voice/g1/matematik/u04/n01/intro.wav` | BILGE | Günlük hayatta bir şeyler artar ya da azalır. Artınca toplarız, azalınca çıkarırız! |
| 105 | `vo.g1.matematik.u04.n02.r01` | `assets/audio/voice/g1/matematik/u04/n02/r01.wav` | ANLATICI | Beş artı üç kaç eder? Doğru balonu patlat! |
| 106 | `vo.g1.matematik.u04.n02.r02` | `assets/audio/voice/g1/matematik/u04/n02/r02.wav` | ANLATICI | Dokuz eksi dört kaç eder? Doğru balonu patlat! |
| 107 | `vo.g1.matematik.u04.n02.r03` | `assets/audio/voice/g1/matematik/u04/n02/r03.wav` | ANLATICI | Büyük sayıdan başla, üstüne say: on dört artı üç kaç eder? |
| 108 | `vo.g1.matematik.u04.n02.r04` | `assets/audio/voice/g1/matematik/u04/n02/r04.wav` | ANLATICI | Geriye say: on sekiz eksi beş kaç eder? |
| 109 | `vo.g1.matematik.u04.n02.r05` | `assets/audio/voice/g1/matematik/u04/n02/r05.wav` | ANLATICI | Yirmi üç artı dört kaç eder? Zihninden topla! |
| 110 | `vo.g1.matematik.u04.n02.intro` | `assets/audio/voice/g1/matematik/u04/n02/intro.wav` | BILGE | İşlemi zihninden yap, doğru cevabı taşıyan balonu patlat! |
| 111 | `vo.g1.matematik.u04.n03.r01` | `assets/audio/voice/g1/matematik/u04/n03/r01.wav` | ANLATICI | Sekiz artı yedi kaç eder? Önce tahmin et, sonra hesapla! |
| 112 | `vo.g1.matematik.u04.n03.r02` | `assets/audio/voice/g1/matematik/u04/n03/r02.wav` | ANLATICI | On yedi eksi altı kaç eder? Tahmin et, sonra eksik sayıyı bul. |
| 113 | `vo.g1.matematik.u04.n03.intro` | `assets/audio/voice/g1/matematik/u04/n03/intro.wav` | BILGE | Önce sonucu tahmin et, sonra zihninden hesapla. Tahminin sonuca yakın mı, uzak mı? |
| 114 | `vo.g1.matematik.u04.n04.r01` | `assets/audio/voice/g1/matematik/u04/n04/r01.wav` | ANLATICI | Terazi dengede mi? Soldaki ile sağdakini karşılaştır! |
| 115 | `vo.g1.matematik.u04.n04.r02` | `assets/audio/voice/g1/matematik/u04/n04/r02.wav` | ANLATICI | Terazinin dengede durması için soru işaretinin yerine hangi sayı gelmeli? |
| 116 | `vo.g1.matematik.u04.n04.r03` | `assets/audio/voice/g1/matematik/u04/n04/r03.wav` | ANLATICI | Teraziyi dengele! Eksik sayıyı bul. |
| 117 | `vo.g1.matematik.u04.n04.r04` | `assets/audio/voice/g1/matematik/u04/n04/r04.wav` | ANLATICI | İki yan eşit olmalı. Eksik sayı hangisi? |
| 118 | `vo.g1.matematik.u04.n04.intro` | `assets/audio/voice/g1/matematik/u04/n04/intro.wav` | BILGE | Eşit işareti terazinin dengede olması gibidir: iki yan aynı miktarı gösterir. |
| 119 | `vo.g1.matematik.u04.n05.r01` | `assets/audio/voice/g1/matematik/u04/n05/r01.wav` | ANLATICI | Her toplama işlemini, onu tersine çeviren çıkarma işlemiyle eşleştir! |
| 120 | `vo.g1.matematik.u04.n05.r02` | `assets/audio/voice/g1/matematik/u04/n05/r02.wav` | ANLATICI | Sekiz eksi üç kaç eder? Teraziyi dengeleyen sayıyı bul: üç artı kaç sekiz eder? |
| 121 | `vo.g1.matematik.u04.n05.r03` | `assets/audio/voice/g1/matematik/u04/n05/r03.wav` | ANLATICI | Toplama işlemlerini kardeş çıkarma işlemleriyle eşleştir! |
| 122 | `vo.g1.matematik.u04.n05.r04` | `assets/audio/voice/g1/matematik/u04/n05/r04.wav` | ANLATICI | On iki eksi beş kaç eder? Teraziyi dengeleyen sayıyı bul! |
| 123 | `vo.g1.matematik.u04.n05.intro` | `assets/audio/voice/g1/matematik/u04/n05/intro.wav` | BILGE | Toplama ve çıkarma kardeştir! Bir toplama işlemini tersine çevirince çıkarma işlemi olur. |
| 124 | `vo.g1.matematik.para.tl_1` | `assets/audio/voice/g1/matematik/para/tl_1.wav` | ANLATICI | bir lira |
| 125 | `vo.g1.matematik.para.tl_10` | `assets/audio/voice/g1/matematik/para/tl_10.wav` | ANLATICI | on lira |
| 126 | `vo.g1.matematik.para.tl_100` | `assets/audio/voice/g1/matematik/para/tl_100.wav` | ANLATICI | yüz lira |
| 127 | `vo.g1.matematik.para.tl_5` | `assets/audio/voice/g1/matematik/para/tl_5.wav` | ANLATICI | beş lira |
| 128 | `vo.g1.matematik.para.tl_20` | `assets/audio/voice/g1/matematik/para/tl_20.wav` | ANLATICI | yirmi lira |
| 129 | `vo.g1.matematik.para.tl_50` | `assets/audio/voice/g1/matematik/para/tl_50.wav` | ANLATICI | elli lira |
| 130 | `vo.g1.matematik.para.tl_200` | `assets/audio/voice/g1/matematik/para/tl_200.wav` | ANLATICI | iki yüz lira |
| 131 | `vo.g1.matematik.u05.n01.r01` | `assets/audio/voice/g1/matematik/u05/n01/r01.wav` | ANLATICI | Dinle ve doğru paraya dokun! |
| 132 | `vo.g1.matematik.u05.n01.r02` | `assets/audio/voice/g1/matematik/u05/n01/r02.wav` | ANLATICI | Dinle ve doğru paraya dokun! |
| 133 | `vo.g1.matematik.u05.n01.r03` | `assets/audio/voice/g1/matematik/u05/n01/r03.wav` | ANLATICI | Dinle ve doğru kâğıt parayı bul! |
| 134 | `vo.g1.matematik.u05.n01.r04` | `assets/audio/voice/g1/matematik/u05/n01/r04.wav` | ANLATICI | Dinle ve doğru kâğıt parayı bul! |
| 135 | `vo.g1.matematik.u05.n01.r05` | `assets/audio/voice/g1/matematik/u05/n01/r05.wav` | ANLATICI | Dinle ve doğru kâğıt parayı bul! |
| 136 | `vo.g1.matematik.u05.n01.intro` | `assets/audio/voice/g1/matematik/u05/n01/intro.wav` | BILGE | Paralarımızı tanıyalım! Madeni paralar ve kâğıt paralar farklı büyüklükleri gösterir. |
| 137 | `vo.g1.matematik.u05.n02.r01` | `assets/audio/voice/g1/matematik/u05/n02/r01.wav` | ANLATICI | Her parayı gösterdiği sayıyla eşleştir! |
| 138 | `vo.g1.matematik.u05.n02.r02` | `assets/audio/voice/g1/matematik/u05/n02/r02.wav` | ANLATICI | Kâğıt paraları gösterdikleri sayılarla eşleştir! |
| 139 | `vo.g1.matematik.u05.n02.r03` | `assets/audio/voice/g1/matematik/u05/n02/r03.wav` | ANLATICI | Her parayı gösterdiği sayıyla eşleştir! |
| 140 | `vo.g1.matematik.u05.n02.intro` | `assets/audio/voice/g1/matematik/u05/n02/intro.wav` | BILGE | Her para bir sayı kadar değer taşır. Parayı gösterdiği sayıyla eşleştirelim. |
| 141 | `vo.g1.matematik.u05.n03.r01` | `assets/audio/voice/g1/matematik/u05/n03/r01.wav` | ANLATICI | Tepsideki paralar kaç lira eder? Doğru sayıya dokun! |
| 142 | `vo.g1.matematik.u05.n03.r02` | `assets/audio/voice/g1/matematik/u05/n03/r02.wav` | ANLATICI | Paraları say. Hepsi kaç lira eder? |
| 143 | `vo.g1.matematik.u05.n03.r03` | `assets/audio/voice/g1/matematik/u05/n03/r03.wav` | ANLATICI | On lira öde! Cüzdandan paraları tepsiye koy, sonra onay düğmesine dokun. |
| 144 | `vo.g1.matematik.u05.n03.r04` | `assets/audio/voice/g1/matematik/u05/n03/r04.wav` | ANLATICI | Yirmi lira öde! Cüzdandan paraları tepsiye koy, sonra onayla. |
| 145 | `vo.g1.matematik.u05.n03.intro` | `assets/audio/voice/g1/matematik/u05/n03/intro.wav` | BILGE | Kumbaramızı açalım! İçindeki paralar kaç lira ediyor, birlikte bulalım. |
| 146 | `vo.g1.matematik.yuvarlak` | `assets/audio/voice/g1/matematik/yuvarlak.wav` | ANLATICI | yuvarlak |
| 147 | `vo.g1.matematik.koseli` | `assets/audio/voice/g1/matematik/koseli.wav` | ANLATICI | köşeli |
| 148 | `vo.g1.matematik.u06.n01.r01` | `assets/audio/voice/g1/matematik/u06/n01/r01.wav` | ANLATICI | Yuvarlak nesneleri daire kutusuna, köşeli nesneleri kare kutusuna koy! |
| 149 | `vo.g1.matematik.u06.n01.r02` | `assets/audio/voice/g1/matematik/u06/n01/r02.wav` | ANLATICI | Nesnelere bak. Yuvarlak mı, köşeli mi? Doğru kutuya koy! |
| 150 | `vo.g1.matematik.u06.n01.r03` | `assets/audio/voice/g1/matematik/u06/n01/r03.wav` | ANLATICI | Hepsini ayır: yuvarlaklar bir kutuya, köşeliler öbür kutuya! |
| 151 | `vo.g1.matematik.u06.n01.intro` | `assets/audio/voice/g1/matematik/u06/n01/intro.wav` | BILGE | Çevremizdeki nesnelerin bazıları yuvarlak, bazıları köşelidir. Haydi ayıralım! |
| 152 | `vo.g1.matematik.sekil.ucgen` | `assets/audio/voice/g1/matematik/sekil/ucgen.wav` | ANLATICI | üçgen |
| 153 | `vo.g1.matematik.sekil.dikdortgen` | `assets/audio/voice/g1/matematik/sekil/dikdortgen.wav` | ANLATICI | dikdörtgen |
| 154 | `vo.g1.matematik.sekil.kare` | `assets/audio/voice/g1/matematik/sekil/kare.wav` | ANLATICI | kare |
| 155 | `vo.g1.matematik.u06.n02.s01` | `assets/audio/voice/g1/matematik/u06/n02/s01.wav` | ANLATICI | Saat kulesinin saati hangi şekle benziyor? |
| 156 | `vo.g1.matematik.sekil.cember` | `assets/audio/voice/g1/matematik/sekil/cember.wav` | ANLATICI | çember |
| 157 | `vo.g1.matematik.u06.n02.s02` | `assets/audio/voice/g1/matematik/u06/n02/s02.wav` | ANLATICI | Kapının şekli hangisine benziyor? |
| 158 | `vo.g1.matematik.u06.n02.r01` | `assets/audio/voice/g1/matematik/u06/n02/r01.wav` | ANLATICI | Evin parçalarına bak! Her parçayı benzediği şekille eşleştir. |
| 159 | `vo.g1.matematik.u06.n02.r02` | `assets/audio/voice/g1/matematik/u06/n02/r02.wav` | ANLATICI | Soruyu dinle ve doğru şekle dokun! |
| 160 | `vo.g1.matematik.u06.n02.r03` | `assets/audio/voice/g1/matematik/u06/n02/r03.wav` | ANLATICI | Soruyu dinle ve doğru şekle dokun! |
| 161 | `vo.g1.matematik.u06.n02.r04` | `assets/audio/voice/g1/matematik/u06/n02/r04.wav` | ANLATICI | Yapıların parçalarını benzedikleri şekillerle eşleştir! |
| 162 | `vo.g1.matematik.u06.n02.r05` | `assets/audio/voice/g1/matematik/u06/n02/r05.wav` | ANLATICI | Kaç üçgen var? Say ve dokun! |
| 163 | `vo.g1.matematik.u06.n02.intro` | `assets/audio/voice/g1/matematik/u06/n02/intro.wav` | BILGE | Evlerde, köprülerde, kulelerde şekiller saklı! Çatı üçgene, kapı dikdörtgene benziyor. |
| 164 | `vo.g1.matematik.u06.n03.r01` | `assets/audio/voice/g1/matematik/u06/n03/r01.wav` | ANLATICI | Üçgenleri üçgen kutusuna, çemberleri çember kutusuna koy! |
| 165 | `vo.g1.matematik.u06.n03.r02` | `assets/audio/voice/g1/matematik/u06/n03/r02.wav` | ANLATICI | Dinle ve şekle dokun! |
| 166 | `vo.g1.matematik.u06.n03.r03` | `assets/audio/voice/g1/matematik/u06/n03/r03.wav` | ANLATICI | Dört köşeli şekilleri ayır: kareler bir kutuya, dikdörtgenler öbür kutuya! |
| 167 | `vo.g1.matematik.u06.n03.r04` | `assets/audio/voice/g1/matematik/u06/n03/r04.wav` | ANLATICI | Dinle ve şekle dokun! |
| 168 | `vo.g1.matematik.u06.n03.r05` | `assets/audio/voice/g1/matematik/u06/n03/r05.wav` | ANLATICI | Şekilleri adlarına göre ayır: üçgen, kare ve çember! |
| 169 | `vo.g1.matematik.u06.n03.intro` | `assets/audio/voice/g1/matematik/u06/n03/intro.wav` | BILGE | Üçgenin üç köşesi var, karenin dört eşit kenarı. Çemberin hiç köşesi yok! Şekilleri ayıralım. |
| 170 | `vo.g1.matematik.u06.n04.r01` | `assets/audio/voice/g1/matematik/u06/n04/r01.wav` | ANLATICI | Aynı şekilleri eşleştir! Renge değil, şekle bak. |
| 171 | `vo.g1.matematik.u06.n04.r02` | `assets/audio/voice/g1/matematik/u06/n04/r02.wav` | ANLATICI | Şekle bak, eşini bul! Kareyi dikdörtgenle karıştırma. |
| 172 | `vo.g1.matematik.u06.n04.intro` | `assets/audio/voice/g1/matematik/u06/n04/intro.wav` | BILGE | Rengi ya da büyüklüğü farklı olsa da üçgen yine üçgendir! Aynı şekilleri eşleştirelim. |
| 173 | `vo.g1.matematik.u07.n01.c1.q1` | `assets/audio/voice/g1/matematik/u07/n01/c1/q1.wav` | ANLATICI | En çok hangi meyve var? Dokun! |
| 174 | `vo.g1.matematik.u07.n01.c2.q1` | `assets/audio/voice/g1/matematik/u07/n01/c2/q1.wav` | ANLATICI | En az hangi meyve var? Dokun! |
| 175 | `vo.g1.matematik.u07.n01.c2.q2` | `assets/audio/voice/g1/matematik/u07/n01/c2/q2.wav` | ANLATICI | Kaç elma var? |
| 176 | `vo.g1.matematik.u07.n01.r01` | `assets/audio/voice/g1/matematik/u07/n01/r01.wav` | ANLATICI | Her meyveyi kendi satırına sürükle. Çetele çizgileri kendiliğinden çizilir! |
| 177 | `vo.g1.matematik.u07.n01.r02` | `assets/audio/voice/g1/matematik/u07/n01/r02.wav` | ANLATICI | Meyveleri satırlarına sürükle, sıklık tablosu oluşsun. Sonra soruları cevapla. |
| 178 | `vo.g1.matematik.u07.n01.intro` | `assets/audio/voice/g1/matematik/u07/n01/intro.wav` | BILGE | Sınıfta en çok hangi meyve seviliyor? Verileri çeteleyle sayalım! |
| 179 | `vo.g1.matematik.u07.n02.c3.q1` | `assets/audio/voice/g1/matematik/u07/n02/c3/q1.wav` | ANLATICI | En çok hangi oyuncak var? Dokun! |
| 180 | `vo.g1.matematik.u07.n02.c4.q1` | `assets/audio/voice/g1/matematik/u07/n02/c4/q1.wav` | ANLATICI | En az hangi hayvan var? Dokun! |
| 181 | `vo.g1.matematik.u07.n02.c4.q2` | `assets/audio/voice/g1/matematik/u07/n02/c4/q2.wav` | ANLATICI | Köpekler kuşlardan kaç fazla? |
| 182 | `vo.g1.matematik.u07.n02.c5.q1` | `assets/audio/voice/g1/matematik/u07/n02/c5/q1.wav` | ANLATICI | En çok hangi oyuncak var? Dokun! |
| 183 | `vo.g1.matematik.u07.n02.c5.q2` | `assets/audio/voice/g1/matematik/u07/n02/c5/q2.wav` | ANLATICI | Hepsi birlikte kaç oyuncak var? |
| 184 | `vo.g1.matematik.u07.n02.r01` | `assets/audio/voice/g1/matematik/u07/n02/r01.wav` | ANLATICI | Her oyuncağı kendi sütununa sürükle. Nesne grafiği oluşsun! |
| 185 | `vo.g1.matematik.u07.n02.r02` | `assets/audio/voice/g1/matematik/u07/n02/r02.wav` | ANLATICI | Hayvanları sütunlarına diz, sonra grafiğe bakarak soruları cevapla. |
| 186 | `vo.g1.matematik.u07.n02.r03` | `assets/audio/voice/g1/matematik/u07/n02/r03.wav` | ANLATICI | Oyuncakları grafiğe yerleştir. Sonra hepsini birlikte düşün! |
| 187 | `vo.g1.matematik.u07.n02.intro` | `assets/audio/voice/g1/matematik/u07/n02/intro.wav` | BILGE | Her nesne bir veriyi gösterir. Oyuncakları sütunlara dizerek nesne grafiği yapalım! |

---
## Teslim kontrol listesi
- [ ] Dosya adları ve klasörler tablodakiyle birebir aynı (`assets/audio/voice/g1/matematik/...`)
- [ ] 005'teki seslerle aynı Anlatıcı ve Bilge sesi kullanıldı
- [ ] Sayı adları, sıra sayıları ve şekil adları net duyuluyor
- [ ] `godot --headless --path . -s res://tools/missing_assets.gd` bu satırları artık eksik göstermiyor
- [ ] Commit: `assets: 034 matematik 1 seslendirmesi (faz 3c)`
