# 052 · 3. sınıf Matematik seslendirmesi 1: ünite 1–3, sayılar ve etiketler (Gemini TTS)

**Öncelik: ORTA** (Faz 3e). Ünite 1 (Bine Kadar Sayılar), ünite 2 (Kesirler, Zaman ve Ölçüler) ve ünite 3 (Dört İşlem) duraklarının giriş satırları, tur yönergeleri ve hikâye sayfaları; 20'den büyük sayıların okunuşu (`vo.sayi.*`), nesne adları (`vo.ad.*`) ve kart/kutu etiketleri (`vo.g3m.*`). 232 satır.

> Bu dosya eklenmeden de oyun çalışır: eksik satırları cihazın Türkçe sesiyle okur.

## Nasıl üretilir
007'deki adımların aynısı: Google AI Studio → "Generate speech", tek konuşmacı, 005'te seçilen **aynı iki ses** (Anlatıcı, Bilge). Her satırı **Dosya yolu** sütunundaki isimle `.wav` (ya da mono `.ogg`) kaydet; klasörler yoksa oluştur.

## Ortak üslup talimatları
- **ANLATICI:** `Sıcak, sakin ve net bir sesle, 6-8 yaşındaki bir çocuğa konuşur gibi, yavaş ve anlaşılır oku. Kelimeleri tane tane söyle, cümle sonlarında kısa bir duraklama yap.`
- **BILGE:** `Neşeli, sevimli ve enerjik bir çizgi film karakteri gibi konuş. Gülümseyerek, coşkulu ama anlaşılır ve çok hızlı olmayan bir tempoyla söyle.`

Ek not: Sayıları ("üç yüz kırk iki", "yarım", "çeyrek") ve işlem sözcüklerini ("artı", "eksi", "kere", "bölü") net ve biraz vurgulayarak söyle; çocuk bu sayıyı ekranda bulacak. Metinde rakamla yazılan sayılar Türkçe okunur (ör. 250 → "iki yüz elli").

## Satırlar

| # | Kimlik (anahtar) | Dosya yolu | Konuşmacı | Metin |
|---|---|---|---|---|
| 1 | `vo.g3.matematik.u01.n01.intro` | `assets/audio/voice/g3/matematik/u01/n01/intro.wav` | BILGE | Merhaba! Artık bine kadar sayılarla oynayacağız. Büyük sayıları birlikte okuyup yazalım! |
| 2 | `vo.g3.matematik.u01.n01.r01` | `assets/audio/voice/g3/matematik/u01/n01/r01.wav` | ANLATICI | Yüzlük, onluk ve birlik bloklarına bak. Her bloğu gösterdiği sayıya sürükle! |
| 3 | `vo.sayi.507` | `assets/audio/voice/sayi/507.wav` | ANLATICI | beş yüz yedi |
| 4 | `vo.sayi.570` | `assets/audio/voice/sayi/570.wav` | ANLATICI | beş yüz yetmiş |
| 5 | `vo.sayi.750` | `assets/audio/voice/sayi/750.wav` | ANLATICI | yedi yüz elli |
| 6 | `vo.g3.matematik.u01.n01.r02` | `assets/audio/voice/g3/matematik/u01/n01/r02.wav` | ANLATICI | Dinle ve bul: beş yüz yedi! Bu sayıya dokun. |
| 7 | `vo.g3.matematik.u01.n01.r03` | `assets/audio/voice/g3/matematik/u01/n01/r03.wav` | ANLATICI | Her toplamın gösterdiği sayıyı bul. Kartları doğru sayıya sürükle! |
| 8 | `vo.sayi.386` | `assets/audio/voice/sayi/386.wav` | ANLATICI | üç yüz seksen altı |
| 9 | `vo.g3.matematik.u01.n01.r04` | `assets/audio/voice/g3/matematik/u01/n01/r04.wav` | ANLATICI | Dinle ve yaz: üç yüz seksen altı. Rakam karolarına dokunarak yaz, sonra onayla! |
| 10 | `vo.sayi.615` | `assets/audio/voice/sayi/615.wav` | ANLATICI | altı yüz on beş |
| 11 | `vo.sayi.165` | `assets/audio/voice/sayi/165.wav` | ANLATICI | yüz altmış beş |
| 12 | `vo.sayi.651` | `assets/audio/voice/sayi/651.wav` | ANLATICI | altı yüz elli bir |
| 13 | `vo.sayi.516` | `assets/audio/voice/sayi/516.wav` | ANLATICI | beş yüz on altı |
| 14 | `vo.g3.matematik.u01.n01.r05` | `assets/audio/voice/g3/matematik/u01/n01/r05.wav` | ANLATICI | Dinle ve bul: altı yüz on beş! |
| 15 | `vo.sayi.940` | `assets/audio/voice/sayi/940.wav` | ANLATICI | dokuz yüz kırk |
| 16 | `vo.g3.matematik.u01.n01.r06` | `assets/audio/voice/g3/matematik/u01/n01/r06.wav` | ANLATICI | Dinle ve yaz: dokuz yüz kırk. |
| 17 | `vo.g3.matematik.u01.n02.intro` | `assets/audio/voice/g3/matematik/u01/n02/intro.wav` | BILGE | Her rakamın bir evi var: yüzler, onlar ve birler basamağı. Rakamların değerini bulalım! |
| 18 | `vo.g3.matematik.u01.n02.r01` | `assets/audio/voice/g3/matematik/u01/n02/r01.wav` | ANLATICI | Kartları oku. Her birini gösterdiği sayıya sürükle! |
| 19 | `vo.g3m.bin.yuzler` | `assets/audio/voice/g3m/bin/yuzler.wav` | ANLATICI | Yüzler basamağı |
| 20 | `vo.g3m.bin.onlar` | `assets/audio/voice/g3m/bin/onlar.wav` | ANLATICI | Onlar basamağı |
| 21 | `vo.g3m.bin.birler` | `assets/audio/voice/g3m/bin/birler.wav` | ANLATICI | Birler basamağı |
| 22 | `vo.g3.matematik.u01.n02.r02` | `assets/audio/voice/g3/matematik/u01/n02/r02.wav` | ANLATICI | Her sayıda 5 rakamını bul. 5 hangi basamaktaysa sayıyı o kutuya koy! |
| 23 | `vo.g3.matematik.u01.n02.r03` | `assets/audio/voice/g3/matematik/u01/n02/r03.wav` | ANLATICI | Yedi yüz kırk iki sayısının rakamlarına bak. Her rakamı basamak değeriyle eşleştir! |
| 24 | `vo.g3.matematik.u01.n02.r04` | `assets/audio/voice/g3/matematik/u01/n02/r04.wav` | ANLATICI | Şimdi 3 rakamını bul. 3 yüzler basamağındaysa bir kutuya, onlar basamağındaysa öbür kutuya koy! |
| 25 | `vo.g3.matematik.u01.n02.r05` | `assets/audio/voice/g3/matematik/u01/n02/r05.wav` | ANLATICI | Toplamları sayılarla eşleştir. Sıfırın yerine dikkat et! |
| 26 | `vo.g3.matematik.u01.n03.intro` | `assets/audio/voice/g3/matematik/u01/n03/intro.wav` | BILGE | Sayıları karşılaştırıp sıralayalım. Önce yüzler basamağına, sonra onlara bak! |
| 27 | `vo.g3.matematik.u01.n03.r01` | `assets/audio/voice/g3/matematik/u01/n03/r01.wav` | ANLATICI | Hangi sayı daha büyük? Doğru işareti seç! |
| 28 | `vo.g3.matematik.u01.n03.r02` | `assets/audio/voice/g3/matematik/u01/n03/r02.wav` | ANLATICI | Sayıları küçükten büyüğe sırala! |
| 29 | `vo.g3.matematik.u01.n03.r03` | `assets/audio/voice/g3/matematik/u01/n03/r03.wav` | ANLATICI | İki sayıyı karşılaştır. Doğru işareti seç! |
| 30 | `vo.g3.matematik.u01.n03.r04` | `assets/audio/voice/g3/matematik/u01/n03/r04.wav` | ANLATICI | Bu kez sayıları büyükten küçüğe sırala! |
| 31 | `vo.g3.matematik.u01.n03.r05` | `assets/audio/voice/g3/matematik/u01/n03/r05.wav` | ANLATICI | Sayı doğrusunda işaretli yer hangi sayı? Onar onar ilerliyoruz. |
| 32 | `vo.g3.matematik.u01.n04.intro` | `assets/audio/voice/g3/matematik/u01/n04/intro.wav` | BILGE | Bir sayı hangi onluğa ya da yüzlüğe daha yakın? Sayı doğrusunda bakalım! |
| 33 | `vo.g3.matematik.u01.n04.r01` | `assets/audio/voice/g3/matematik/u01/n04/r01.wav` | ANLATICI | Kırk yediyi sayı doğrusuna yerleştir. Kırka mı, elliye mi daha yakın? |
| 34 | `vo.sayi.40` | `assets/audio/voice/sayi/40.wav` | ANLATICI | kırk |
| 35 | `vo.sayi.50` | `assets/audio/voice/sayi/50.wav` | ANLATICI | elli |
| 36 | `vo.g3.matematik.u01.n04.r02` | `assets/audio/voice/g3/matematik/u01/n04/r02.wav` | ANLATICI | Her sayıyı en yakın onluğun kutusuna koy! |
| 37 | `vo.sayi.300` | `assets/audio/voice/sayi/300.wav` | ANLATICI | üç yüz |
| 38 | `vo.sayi.400` | `assets/audio/voice/sayi/400.wav` | ANLATICI | dört yüz |
| 39 | `vo.g3.matematik.u01.n04.r03` | `assets/audio/voice/g3/matematik/u01/n04/r03.wav` | ANLATICI | Her sayıyı en yakın yüzlüğün kutusuna koy! |
| 40 | `vo.g3.matematik.u01.n04.r04` | `assets/audio/voice/g3/matematik/u01/n04/r04.wav` | ANLATICI | Her sayıyı en yakın yüzlüğe sürükle! |
| 41 | `vo.g3.matematik.u01.n04.r05` | `assets/audio/voice/g3/matematik/u01/n04/r05.wav` | ANLATICI | Her sayıyı en yakın onluğa sürükle! |
| 42 | `vo.g3.matematik.u01.n05.intro` | `assets/audio/voice/g3/matematik/u01/n05/intro.wav` | BILGE | Haydi ritim tutalım! Altışar, yedişer, sekizer ve dokuzar sayarak örüntüleri bulalım. |
| 43 | `vo.g3.matematik.u01.n05.r01` | `assets/audio/voice/g3/matematik/u01/n05/r01.wav` | ANLATICI | Altışar ileri sayıyoruz. Boşlukları doldur! |
| 44 | `vo.g3.matematik.u01.n05.r02` | `assets/audio/voice/g3/matematik/u01/n05/r02.wav` | ANLATICI | Yetmiş içinde yedişer geri sayıyoruz. Boşlukları doldur! |
| 45 | `vo.g3.matematik.u01.n05.r03` | `assets/audio/voice/g3/matematik/u01/n05/r03.wav` | ANLATICI | Sekizer ileri say. Sıradaki sayılar hangileri? |
| 46 | `vo.g3.matematik.u01.n05.r04` | `assets/audio/voice/g3/matematik/u01/n05/r04.wav` | ANLATICI | Dokuzar geri say. Sıradaki sayılar hangileri? |
| 47 | `vo.g3.matematik.u01.n05.r05` | `assets/audio/voice/g3/matematik/u01/n05/r05.wav` | ANLATICI | Onar geri say. Boşlukları doldur! |
| 48 | `vo.g3.matematik.u01.n06.intro` | `assets/audio/voice/g3/matematik/u01/n06/intro.wav` | BILGE | Bir örüntünün kuralını bulursak sonrasını hep biliriz! Yüzer de sayalım. |
| 49 | `vo.g3.matematik.u01.n06.r01` | `assets/audio/voice/g3/matematik/u01/n06/r01.wav` | ANLATICI | Her sayı dizisini kuralıyla eşleştir: kaçar kaçar artıyor? |
| 50 | `vo.g3.matematik.u01.n06.r02` | `assets/audio/voice/g3/matematik/u01/n06/r02.wav` | ANLATICI | Yüzer ileri say. Boşlukları doldur! |
| 51 | `vo.g3.matematik.u01.n06.r03` | `assets/audio/voice/g3/matematik/u01/n06/r03.wav` | ANLATICI | Bu diziler geriye doğru gidiyor. Her diziyi kuralıyla eşleştir! |
| 52 | `vo.g3.matematik.u01.n06.r04` | `assets/audio/voice/g3/matematik/u01/n06/r04.wav` | ANLATICI | Yüzer geri say. Boşlukları doldur! |
| 53 | `vo.g3.matematik.u01.n06.r05` | `assets/audio/voice/g3/matematik/u01/n06/r05.wav` | ANLATICI | Sayı doğrusunda altışar ilerliyoruz. Kırk ikiyi doğru yere yerleştir! |
| 54 | `vo.g3m.bin.tek` | `assets/audio/voice/g3m/bin/tek.wav` | ANLATICI | Tek sayılar |
| 55 | `vo.g3m.bin.cift` | `assets/audio/voice/g3m/bin/cift.wav` | ANLATICI | Çift sayılar |
| 56 | `vo.g3.matematik.u01.n07.intro` | `assets/audio/voice/g3/matematik/u01/n07/intro.wav` | BILGE | İkişer eşleşebilenler çift, birisi açıkta kalanlar tek! Sayıları tek ve çift diye ayıralım. |
| 57 | `vo.g3.matematik.u01.n07.r01` | `assets/audio/voice/g3/matematik/u01/n07/r01.wav` | ANLATICI | Sayıları tek ve çift kutularına ayır. Sıfır da çift sayıdır! |
| 58 | `vo.g3.matematik.u01.n07.r02` | `assets/audio/voice/g3/matematik/u01/n07/r02.wav` | ANLATICI | Bu sayılar tek mi, çift mi? Kutulara ayır! |
| 59 | `vo.g3.matematik.u01.n07.r03` | `assets/audio/voice/g3/matematik/u01/n07/r03.wav` | ANLATICI | Birden başlayıp ikişer sayıyoruz. Hepsi tek sayı! Boşlukları doldur. |
| 60 | `vo.g3.matematik.u01.n07.r04` | `assets/audio/voice/g3/matematik/u01/n07/r04.wav` | ANLATICI | Birler basamağına bak ve sayıları tek ya da çift kutusuna koy! |
| 61 | `vo.g3.matematik.u01.n07.r05` | `assets/audio/voice/g3/matematik/u01/n07/r05.wav` | ANLATICI | Üç basamaklı sayılar! Birler basamağına bakarak tek ve çift diye ayır. |
| 62 | `vo.g3.matematik.u01.n08.intro` | `assets/audio/voice/g3/matematik/u01/n08/intro.wav` | BILGE | İki sayıyı toplayınca sonuç tek mi olur, çift mi? Bir örüntü var, bulalım! |
| 63 | `vo.g3.matematik.u01.n08.r01` | `assets/audio/voice/g3/matematik/u01/n08/r01.wav` | ANLATICI | Her toplamı hesapla. Toplam tekse Tek kutusuna, çiftse Çift kutusuna koy! |
| 64 | `vo.g3.matematik.u01.n08.r02` | `assets/audio/voice/g3/matematik/u01/n08/r02.wav` | ANLATICI | Toplamlar tek mi, çift mi? Kutulara ayır! |
| 65 | `vo.g3.matematik.u01.n08.r03` | `assets/audio/voice/g3/matematik/u01/n08/r03.wav` | ANLATICI | Bu toplamlar da tek mi, çift mi? |
| 66 | `vo.g3.matematik.u01.n08.r04` | `assets/audio/voice/g3/matematik/u01/n08/r04.wav` | ANLATICI | Şimdi kuralı bulalım! İki tek sayının toplamı, iki çift sayının toplamı, bir tek ile bir çiftin toplamı: tek mi, çift mi? |
| 67 | `vo.g3m.bin.uyar` | `assets/audio/voice/g3m/bin/uyar.wav` | ANLATICI | Kurala uyar |
| 68 | `vo.g3m.bin.uymaz` | `assets/audio/voice/g3m/bin/uymaz.wav` | ANLATICI | Kurala uymaz |
| 69 | `vo.g3.matematik.u01.n09.intro` | `assets/audio/voice/g3/matematik/u01/n09/intro.wav` | BILGE | Bazı örüntüler şekillerle büyür. Her adımda kaç tane eklendiğini bulup sayılarla gösterelim! |
| 70 | `vo.g3.matematik.u01.n09.r01` | `assets/audio/voice/g3/matematik/u01/n09/r01.wav` | ANLATICI | Her adımda iki küp ekleniyor. Küp sayılarını sürdür! |
| 71 | `vo.g3.matematik.u01.n09.r02` | `assets/audio/voice/g3/matematik/u01/n09/r02.wav` | ANLATICI | Her adımda üç kare ekleniyor. Dört kareyle başladık. Sıradaki sayılar? |
| 72 | `vo.g3.matematik.u01.n09.r03` | `assets/audio/voice/g3/matematik/u01/n09/r03.wav` | ANLATICI | Her örüntünün kuralını bul. Kaçar artıyor? |
| 73 | `vo.g3.matematik.u01.n09.r04` | `assets/audio/voice/g3/matematik/u01/n09/r04.wav` | ANLATICI | Kural: dörder artar. Bu kurala uyan dizileri Uyar kutusuna, uymayanları Uymaz kutusuna koy! |
| 74 | `vo.g3.matematik.u01.n09.r05` | `assets/audio/voice/g3/matematik/u01/n09/r05.wav` | ANLATICI | Her adımda dört üçgen ekleniyor. Bir üçgenle başladık. Örüntüyü sürdür! |
| 75 | `vo.g3.matematik.u01.n10.intro` | `assets/audio/voice/g3/matematik/u01/n10/intro.wav` | BILGE | Önce bir bak ve tahmin et. Sonra say ve tahminin ne kadar yakın, gör! |
| 76 | `vo.g3.matematik.u01.n10.r01` | `assets/audio/voice/g3/matematik/u01/n10/r01.wav` | ANLATICI | Kaç küp var? Önce tahmin et, sonra sayarak kontrol et! |
| 77 | `vo.g3.matematik.u01.n10.r02` | `assets/audio/voice/g3/matematik/u01/n10/r02.wav` | ANLATICI | Kaç çilek var? Onluk grubu sayarak tahmin et! |
| 78 | `vo.g3.matematik.u01.n10.r03` | `assets/audio/voice/g3/matematik/u01/n10/r03.wav` | ANLATICI | Kaç çiçek var? Tahmin et, sonra say! |
| 79 | `vo.g3.matematik.u01.n10.r04` | `assets/audio/voice/g3/matematik/u01/n10/r04.wav` | ANLATICI | Kaç balık var? Tahminini seç, sonra sayıp karşılaştır! |
| 80 | `vo.g3.matematik.u02.n01.intro` | `assets/audio/voice/g3/matematik/u02/n01/intro.wav` | BILGE | Bir pizzayı eş parçalara bölelim. Bütünü, yarımı ve çeyreği bulalım! |
| 81 | `vo.g3.matematik.u02.n01.r01` | `assets/audio/voice/g3/matematik/u02/n01/r01.wav` | ANLATICI | İki eş parçaya bölünmüş pizzayı bul! |
| 82 | `vo.g3.matematik.u02.n01.r02` | `assets/audio/voice/g3/matematik/u02/n01/r02.wav` | ANLATICI | Pizzanın yarısını seç: iki eş parçadan biri! |
| 83 | `vo.g3.matematik.u02.n01.r03` | `assets/audio/voice/g3/matematik/u02/n01/r03.wav` | ANLATICI | Dört eş parçaya bölünmüş pizzayı bul! |
| 84 | `vo.g3.matematik.u02.n01.r04` | `assets/audio/voice/g3/matematik/u02/n01/r04.wav` | ANLATICI | Pizzanın çeyreğini seç: dört eş parçadan biri! |
| 85 | `vo.g3m.yarim` | `assets/audio/voice/g3m/yarim.wav` | ANLATICI | yarım |
| 86 | `vo.g3m.ceyrek` | `assets/audio/voice/g3m/ceyrek.wav` | ANLATICI | çeyrek |
| 87 | `vo.g3m.butun` | `assets/audio/voice/g3m/butun.wav` | ANLATICI | bütün |
| 88 | `vo.g3.matematik.u02.n01.r05` | `assets/audio/voice/g3/matematik/u02/n01/r05.wav` | ANLATICI | Her sözcüğü kesir gösterimiyle eşleştir! |
| 89 | `vo.g3.matematik.u02.n02.intro` | `assets/audio/voice/g3/matematik/u02/n02/intro.wav` | BILGE | Bir bütünü eş parçalara bölünce her bir parça bir birim kesirdir. |
| 90 | `vo.g3.matematik.u02.n02.r01` | `assets/audio/voice/g3/matematik/u02/n02/r01.wav` | ANLATICI | Üç eş parçaya bölünmüş pizzayı bul! |
| 91 | `vo.g3.matematik.u02.n02.r02` | `assets/audio/voice/g3/matematik/u02/n02/r02.wav` | ANLATICI | Üçte birini seç: üç eş parçadan biri! |
| 92 | `vo.g3.matematik.u02.n02.r03` | `assets/audio/voice/g3/matematik/u02/n02/r03.wav` | ANLATICI | Altı eş parçaya bölünmüş pizzayı bul! |
| 93 | `vo.g3.matematik.u02.n02.r04` | `assets/audio/voice/g3/matematik/u02/n02/r04.wav` | ANLATICI | Sekizde birini seç: sekiz eş parçadan biri! |
| 94 | `vo.g3.matematik.u02.n02.r05` | `assets/audio/voice/g3/matematik/u02/n02/r05.wav` | ANLATICI | Her birim kesri, bütünün kaç eş parçaya bölündüğüyle eşleştir! |
| 95 | `vo.g3.matematik.u02.n03.intro` | `assets/audio/voice/g3/matematik/u02/n03/intro.wav` | BILGE | Kesrin altındaki payda bütünün kaç eş parça olduğunu, üstündeki pay kaç parça aldığımızı söyler. |
| 96 | `vo.g3.matematik.u02.n03.r01` | `assets/audio/voice/g3/matematik/u02/n03/r01.wav` | ANLATICI | Pizzanın dörtte üçünü seç, sonra onayla! |
| 97 | `vo.g3.matematik.u02.n03.r02` | `assets/audio/voice/g3/matematik/u02/n03/r02.wav` | ANLATICI | Pizzanın sekizde beşini seç, sonra onayla! |
| 98 | `vo.g3.matematik.u02.n03.r03` | `assets/audio/voice/g3/matematik/u02/n03/r03.wav` | ANLATICI | Her kesrin payını bul ve eşleştir! Pay, kesir çizgisinin üstündeki sayıdır. |
| 99 | `vo.g3.matematik.u02.n03.r04` | `assets/audio/voice/g3/matematik/u02/n03/r04.wav` | ANLATICI | Şimdi her kesrin paydasını bul! Payda, kesir çizgisinin altındaki sayıdır. |
| 100 | `vo.g3.matematik.u02.n03.r05` | `assets/audio/voice/g3/matematik/u02/n03/r05.wav` | ANLATICI | Pizza on eş parçaya bölündü. Onda yedisini seç! |
| 101 | `vo.g3.matematik.u02.n04.intro` | `assets/audio/voice/g3/matematik/u02/n04/intro.wav` | BILGE | Akrep saati, yelkovan dakikayı gösterir. Analog ve dijital saatleri okuyalım! |
| 102 | `vo.g3.matematik.u02.n04.r01` | `assets/audio/voice/g3/matematik/u02/n04/r01.wav` | ANLATICI | Saat kaçı gösteriyor? Doğru dijital saati seç! |
| 103 | `vo.g3.matematik.u02.n04.r02` | `assets/audio/voice/g3/matematik/u02/n04/r02.wav` | ANLATICI | Saat kaç? Akrep ile yelkovana dikkatle bak! |
| 104 | `vo.g3.matematik.u02.n04.r03` | `assets/audio/voice/g3/matematik/u02/n04/r03.wav` | ANLATICI | Saati yukarıda yazan zamana kur, sonra onayla! |
| 105 | `vo.g3.matematik.u02.n04.r04` | `assets/audio/voice/g3/matematik/u02/n04/r04.wav` | ANLATICI | Saat kaç? Doğru dijital saati seç! |
| 106 | `vo.g3.matematik.u02.n04.r05` | `assets/audio/voice/g3/matematik/u02/n04/r05.wav` | ANLATICI | Saati yazan zamana kur. Önce akrebi, sonra yelkovanı ayarla! |
| 107 | `vo.g3.matematik.u02.n05.intro` | `assets/audio/voice/g3/matematik/u02/n05/intro.wav` | BILGE | Saniye, dakika, saat, gün, hafta, ay ve yıl. Hangisi daha uzun, birlikte bulalım! |
| 108 | `vo.g3.matematik.u02.n05.r01` | `assets/audio/voice/g3/matematik/u02/n05/r01.wav` | ANLATICI | Zaman birimlerini en kısadan en uzuna sırala! |
| 109 | `vo.g3.matematik.u02.n05.r02` | `assets/audio/voice/g3/matematik/u02/n05/r02.wav` | ANLATICI | Eşit olan süreleri eşleştir! |
| 110 | `vo.g3.matematik.u02.n05.r03` | `assets/audio/voice/g3/matematik/u02/n05/r03.wav` | ANLATICI | Bu zaman birimlerini de en kısadan en uzuna sırala! |
| 111 | `vo.g3.matematik.u02.n05.r04` | `assets/audio/voice/g3/matematik/u02/n05/r04.wav` | ANLATICI | Eşit olan süreleri eşleştir! |
| 112 | `vo.g3.matematik.u02.n05.r05` | `assets/audio/voice/g3/matematik/u02/n05/r05.wav` | ANLATICI | Altı zaman birimini en kısadan en uzuna sırala! |
| 113 | `vo.g3m.bin.dakika` | `assets/audio/voice/g3m/bin/dakika.wav` | ANLATICI | Birkaç dakika sürer |
| 114 | `vo.g3m.bin.saat` | `assets/audio/voice/g3m/bin/saat.wav` | ANLATICI | Birkaç saat sürer |
| 115 | `vo.g3m.bin.saniye` | `assets/audio/voice/g3m/bin/saniye.wav` | ANLATICI | Birkaç saniye sürer |
| 116 | `vo.g3m.bin.gun` | `assets/audio/voice/g3m/bin/gun.wav` | ANLATICI | Birkaç gün sürer |
| 117 | `vo.g3.matematik.u02.n06.intro` | `assets/audio/voice/g3/matematik/u02/n06/intro.wav` | BILGE | Bazı işler birkaç saniye, bazıları saatler, bazıları da günler sürer. Tahmin edelim! |
| 118 | `vo.g3.matematik.u02.n06.r01` | `assets/audio/voice/g3/matematik/u02/n06/r01.wav` | ANLATICI | Her iş ne kadar sürer? Birkaç dakika mı, birkaç saat mi? Doğru kutuya koy! |
| 119 | `vo.g3.matematik.u02.n06.r02` | `assets/audio/voice/g3/matematik/u02/n06/r02.wav` | ANLATICI | Bu işleri en kısa sürenden en uzun sürene sırala! |
| 120 | `vo.g3.matematik.u02.n06.r03` | `assets/audio/voice/g3/matematik/u02/n06/r03.wav` | ANLATICI | Her iş ne kadar sürer: saniyeler mi, dakikalar mı, günler mi? |
| 121 | `vo.g3.matematik.u02.n06.r04` | `assets/audio/voice/g3/matematik/u02/n06/r04.wav` | ANLATICI | En kısa sürenden en uzun sürene sırala! |
| 122 | `vo.g3.matematik.u02.n07.intro` | `assets/audio/voice/g3/matematik/u02/n07/intro.wav` | BILGE | Santimetre, metre ve kilometre; gram, kilogram ve ton. Birimler arasındaki ilişkileri bulalım! |
| 123 | `vo.g3.matematik.u02.n07.r01` | `assets/audio/voice/g3/matematik/u02/n07/r01.wav` | ANLATICI | Eşit olan ölçüleri eşleştir! |
| 124 | `vo.g3m.bin.cm` | `assets/audio/voice/g3m/bin/cm.wav` | ANLATICI | Santimetre |
| 125 | `vo.g3m.bin.m` | `assets/audio/voice/g3m/bin/m.wav` | ANLATICI | Metre |
| 126 | `vo.g3m.bin.km` | `assets/audio/voice/g3m/bin/km.wav` | ANLATICI | Kilometre |
| 127 | `vo.g3.matematik.u02.n07.r02` | `assets/audio/voice/g3/matematik/u02/n07/r02.wav` | ANLATICI | Hangisini hangi birimle ölçeriz? Santimetre, metre ya da kilometre kutusuna koy! |
| 128 | `vo.g3.matematik.u02.n07.r03` | `assets/audio/voice/g3/matematik/u02/n07/r03.wav` | ANLATICI | Bir kilogram bin gramdır. Terazinin dengede kalması için kaç gram daha gerekir? |
| 129 | `vo.g3m.bin.g` | `assets/audio/voice/g3m/bin/g.wav` | ANLATICI | Gram |
| 130 | `vo.g3m.bin.kg` | `assets/audio/voice/g3m/bin/kg.wav` | ANLATICI | Kilogram |
| 131 | `vo.g3m.bin.ton` | `assets/audio/voice/g3m/bin/ton.wav` | ANLATICI | Ton |
| 132 | `vo.g3.matematik.u02.n07.r04` | `assets/audio/voice/g3/matematik/u02/n07/r04.wav` | ANLATICI | Hangisinin kütlesini hangi birimle ölçeriz? Gram, kilogram ya da ton kutusuna koy! |
| 133 | `vo.g3.matematik.u02.n07.r05` | `assets/audio/voice/g3/matematik/u02/n07/r05.wav` | ANLATICI | Eşit olan ölçüleri eşleştir. Yarım metre ve yarım kilograma dikkat! |
| 134 | `vo.g3.matematik.u02.n08.intro` | `assets/audio/voice/g3/matematik/u02/n08/intro.wav` | BILGE | Madenî paralar ve kâğıt paralar! Paraları sayıp birbirine dönüştürelim. |
| 135 | `vo.g3.matematik.u02.n08.r01` | `assets/audio/voice/g3/matematik/u02/n08/r01.wav` | ANLATICI | Tepside kaç lira var? Paraları topla ve doğru tutarı seç! |
| 136 | `vo.g3.matematik.u02.n08.r02` | `assets/audio/voice/g3/matematik/u02/n08/r02.wav` | ANLATICI | Aynı değerdeki paraları eşleştir! |
| 137 | `vo.g3.matematik.u02.n08.r03` | `assets/audio/voice/g3/matematik/u02/n08/r03.wav` | ANLATICI | Kaç kuruş var? Bir lira yüz kuruştur! |
| 138 | `vo.g3.matematik.u02.n08.r04` | `assets/audio/voice/g3/matematik/u02/n08/r04.wav` | ANLATICI | Seksen beş lira öde. Cüzdandan paraları seç, sonra onayla! |
| 139 | `vo.g3.matematik.u02.n08.r05` | `assets/audio/voice/g3/matematik/u02/n08/r05.wav` | ANLATICI | İki yüz altmış lira öde. En az parayla ödemeyi dene! |
| 140 | `vo.g3.matematik.u03.n01.intro` | `assets/audio/voice/g3/matematik/u03/n01/intro.wav` | BILGE | Önce sonucu tahmin et, sonra zihinden hesapla. Tahminin sonuca yakın mı, uzak mı? |
| 141 | `vo.g3.matematik.u03.n01.r01` | `assets/audio/voice/g3/matematik/u03/n01/r01.wav` | ANLATICI | Zihinden topla: üç yüz artı iki yüz kaç eder? Doğru balonu patlat! |
| 142 | `vo.g3.matematik.u03.n01.r02` | `assets/audio/voice/g3/matematik/u03/n01/r02.wav` | ANLATICI | Önce toplamı tahmin et. Sonra işlemi yapıp tahminini karşılaştır! |
| 143 | `vo.g3.matematik.u03.n01.r03` | `assets/audio/voice/g3/matematik/u03/n01/r03.wav` | ANLATICI | Zihinden çıkar: altı yüz elli eksi iki yüz kırk kaç eder? |
| 144 | `vo.g3.matematik.u03.n01.r04` | `assets/audio/voice/g3/matematik/u03/n01/r04.wav` | ANLATICI | Farkı önce tahmin et, sonra hesaplayıp karşılaştır! |
| 145 | `vo.g3.matematik.u03.n01.r05` | `assets/audio/voice/g3/matematik/u03/n01/r05.wav` | ANLATICI | Hangi sayıya yüz otuz eklersek beş yüz elli beş olur? Toplananı bul! |
| 146 | `vo.g3.matematik.u03.n02.intro` | `assets/audio/voice/g3/matematik/u03/n02/intro.wav` | BILGE | Toplama ve çıkarmada birler basamağından başlarız. Adım adım ilerleyelim! |
| 147 | `vo.g3.matematik.u03.n02.r01` | `assets/audio/voice/g3/matematik/u03/n02/r01.wav` | ANLATICI | Üç basamaklı iki sayıyı toplarken hangi basamaktan başlarız? Basamakları toplama sırasına diz! |
| 148 | `vo.g3.matematik.u03.n02.r02` | `assets/audio/voice/g3/matematik/u03/n02/r02.wav` | ANLATICI | Topla: iki yüz kırk altı artı yüz otuz yedi. Eldeye dikkat! |
| 149 | `vo.g3.matematik.u03.n02.r03` | `assets/audio/voice/g3/matematik/u03/n02/r03.wav` | ANLATICI | İşlemleri sonuçlarıyla eşleştir. Toplama ve çıkarma birbirinin tersidir! |
| 150 | `vo.g3.matematik.u03.n02.r04` | `assets/audio/voice/g3/matematik/u03/n02/r04.wav` | ANLATICI | Çıkar: beş yüz yirmi dört eksi yüz seksen yedi. Onluk bozmayı unutma! |
| 151 | `vo.g3.matematik.u03.n02.r05` | `assets/audio/voice/g3/matematik/u03/n02/r05.wav` | ANLATICI | Çıkar: altı yüz sekiz eksi iki yüz elli dokuz. |
| 152 | `vo.g3.matematik.u03.n03.intro` | `assets/audio/voice/g3/matematik/u03/n03/intro.wav` | BILGE | Çarpma, aynı sayıyı tekrar tekrar toplamaktır. Bölme ise eşit paylaştırmaktır! |
| 153 | `vo.g3.matematik.u03.n03.r01` | `assets/audio/voice/g3/matematik/u03/n03/r01.wav` | ANLATICI | Her tekrarlı toplamayı çarpma işlemiyle eşleştir! |
| 154 | `vo.g3.matematik.u03.n03.r02` | `assets/audio/voice/g3/matematik/u03/n03/r02.wav` | ANLATICI | Çarp: üç kere dört kaç eder? |
| 155 | `vo.g3.matematik.u03.n03.r03` | `assets/audio/voice/g3/matematik/u03/n03/r03.wav` | ANLATICI | Çarp: altı kere yedi kaç eder? |
| 156 | `vo.g3.matematik.u03.n03.r04` | `assets/audio/voice/g3/matematik/u03/n03/r04.wav` | ANLATICI | Böl: elli altıda kaç tane sekiz var? |
| 157 | `vo.g3.matematik.u03.n03.r05` | `assets/audio/voice/g3/matematik/u03/n03/r05.wav` | ANLATICI | On ile çarp: yirmi dört kere on kaç eder? Kısa yolu hatırla! |
| 158 | `vo.g3.matematik.u03.n03.r06` | `assets/audio/voice/g3/matematik/u03/n03/r06.wav` | ANLATICI | On ile böl: doksanı ona bölersek kaç olur? |
| 159 | `vo.g3.matematik.u03.n04.intro` | `assets/audio/voice/g3/matematik/u03/n04/intro.wav` | BILGE | Çarpma ve bölme kardeştir: biri ötekini geri alır! |
| 160 | `vo.g3.matematik.u03.n04.r01` | `assets/audio/voice/g3/matematik/u03/n04/r01.wav` | ANLATICI | İşlemleri sonuçlarıyla eşleştir! |
| 161 | `vo.g3.matematik.u03.n04.r02` | `assets/audio/voice/g3/matematik/u03/n04/r02.wav` | ANLATICI | Çarp: yirmi üç kere üç. Önce birleri, sonra onları çarp! |
| 162 | `vo.g3.matematik.u03.n04.r03` | `assets/audio/voice/g3/matematik/u03/n04/r03.wav` | ANLATICI | Her çarpma işlemini, ona kardeş olan bölme işlemiyle eşleştir! |
| 163 | `vo.g3.matematik.u03.n04.r04` | `assets/audio/voice/g3/matematik/u03/n04/r04.wav` | ANLATICI | Böl: kırk sekizi dörde bölersek kaç olur? |
| 164 | `vo.g3.matematik.u03.n04.r05` | `assets/audio/voice/g3/matematik/u03/n04/r05.wav` | ANLATICI | Çarp: yüz yirmi beş kere dört kaç eder? |
| 165 | `vo.g3.matematik.u03.n05.intro` | `assets/audio/voice/g3/matematik/u03/n05/intro.wav` | BILGE | Yönergeleri sırayla izleyelim. Her adımın sonucu bir sonraki adımın başlangıcı olur! |
| 166 | `vo.g3.matematik.u03.n05.p1` | `assets/audio/voice/g3/matematik/u03/n05/p1.wav` | ANLATICI | 8 ile başla. Önce 2 ile çarp. Sonra 5 ekle. |
| 167 | `vo.g3.matematik.u03.n05.q1` | `assets/audio/voice/g3/matematik/u03/n05/q1.wav` | ANLATICI | İlk adımın sonucu kaç? |
| 168 | `vo.g3.matematik.u03.n05.q2` | `assets/audio/voice/g3/matematik/u03/n05/q2.wav` | ANLATICI | Son sonuç kaç? |
| 169 | `vo.g3.matematik.u03.n05.r01` | `assets/audio/voice/g3/matematik/u03/n05/r01.wav` | ANLATICI | Yönergeyi dinle, sonra soruları cevapla! |
| 170 | `vo.g3.matematik.u03.n05.r02` | `assets/audio/voice/g3/matematik/u03/n05/r02.wav` | ANLATICI | Her yönergeyi işlem diline çevir. Kartı doğru işleme sürükle! |
| 171 | `vo.g3.matematik.u03.n05.p2` | `assets/audio/voice/g3/matematik/u03/n05/p2.wav` | ANLATICI | 30 ile başla. 10'a böl. Sonra 7 ile çarp. |
| 172 | `vo.g3.matematik.u03.n05.q3` | `assets/audio/voice/g3/matematik/u03/n05/q3.wav` | ANLATICI | Son sonuç kaç? |
| 173 | `vo.g3.matematik.u03.n05.r03` | `assets/audio/voice/g3/matematik/u03/n05/r03.wav` | ANLATICI | Yönergeyi dinle ve adım adım hesapla! |
| 174 | `vo.g3.matematik.u03.n05.p3` | `assets/audio/voice/g3/matematik/u03/n05/p3.wav` | ANLATICI | Bir kutuda 4 sıra kalem var. Her sırada 6 kalem var. Kalemlerin yarısını Ali aldı. |
| 175 | `vo.g3.matematik.u03.n05.q4` | `assets/audio/voice/g3/matematik/u03/n05/q4.wav` | ANLATICI | Kutuda toplam kaç kalem vardı? |
| 176 | `vo.g3.matematik.u03.n05.q5` | `assets/audio/voice/g3/matematik/u03/n05/q5.wav` | ANLATICI | Ali kaç kalem aldı? |
| 177 | `vo.g3.matematik.u03.n05.r04` | `assets/audio/voice/g3/matematik/u03/n05/r04.wav` | ANLATICI | Durumu dinle ve işlemleri sırayla yap! |
| 178 | `vo.g3.matematik.u03.n06.intro` | `assets/audio/voice/g3/matematik/u03/n06/intro.wav` | BILGE | Bir problemde önce verilenleri ve isteneni bulalım. Sonra uygun işlemi seçip çözelim! |
| 179 | `vo.g3.matematik.u03.n06.p1` | `assets/audio/voice/g3/matematik/u03/n06/p1.wav` | ANLATICI | Bir otobüste 46 yolcu vardı. Durakta 18 yolcu indi. |
| 180 | `vo.g3.matematik.u03.n06.q1` | `assets/audio/voice/g3/matematik/u03/n06/q1.wav` | ANLATICI | Kalan yolcuları hangi işlemle buluruz? |
| 181 | `vo.g3.matematik.u03.n06.q2` | `assets/audio/voice/g3/matematik/u03/n06/q2.wav` | ANLATICI | Otobüste kaç yolcu kaldı? |
| 182 | `vo.g3.matematik.u03.n06.r01` | `assets/audio/voice/g3/matematik/u03/n06/r01.wav` | ANLATICI | Problemi dinle. Önce işlemi seç, sonra sonucu bul! |
| 183 | `vo.g3.matematik.u03.n06.p2` | `assets/audio/voice/g3/matematik/u03/n06/p2.wav` | ANLATICI | Ayşe 5 paket kurabiye aldı. Her pakette 8 kurabiye var. |
| 184 | `vo.g3.matematik.u03.n06.q3` | `assets/audio/voice/g3/matematik/u03/n06/q3.wav` | ANLATICI | Hangi işlemi yapmalıyız? |
| 185 | `vo.g3.matematik.u03.n06.q4` | `assets/audio/voice/g3/matematik/u03/n06/q4.wav` | ANLATICI | Ayşe kaç kurabiye aldı? |
| 186 | `vo.g3.matematik.u03.n06.r02` | `assets/audio/voice/g3/matematik/u03/n06/r02.wav` | ANLATICI | Problemi dinle. Verilenlere dikkat et! |
| 187 | `vo.g3.matematik.u03.n06.p3` | `assets/audio/voice/g3/matematik/u03/n06/p3.wav` | ANLATICI | Öğretmen 72 kalemi 9 masaya eşit olarak dağıttı. |
| 188 | `vo.g3.matematik.u03.n06.q5` | `assets/audio/voice/g3/matematik/u03/n06/q5.wav` | ANLATICI | Hangi işlemi yapmalıyız? |
| 189 | `vo.g3.matematik.u03.n06.q6` | `assets/audio/voice/g3/matematik/u03/n06/q6.wav` | ANLATICI | Her masaya kaç kalem düştü? |
| 190 | `vo.g3.matematik.u03.n06.r03` | `assets/audio/voice/g3/matematik/u03/n06/r03.wav` | ANLATICI | Problemi dinle ve eşit paylaştır! |
| 191 | `vo.g3.matematik.u03.n06.p4` | `assets/audio/voice/g3/matematik/u03/n06/p4.wav` | ANLATICI | Can'ın 250 lirası vardı. 120 liralık bir kitap ve 45 liralık bir kalem aldı. |
| 192 | `vo.g3.matematik.u03.n06.q7` | `assets/audio/voice/g3/matematik/u03/n06/q7.wav` | ANLATICI | Can toplam kaç lira harcadı? |
| 193 | `vo.g3.matematik.u03.n06.q8` | `assets/audio/voice/g3/matematik/u03/n06/q8.wav` | ANLATICI | Can'ın kaç lirası kaldı? |
| 194 | `vo.g3.matematik.u03.n06.r04` | `assets/audio/voice/g3/matematik/u03/n06/r04.wav` | ANLATICI | İki adımlı bir problem! Önce harcanan parayı, sonra kalanı bul. |
| 195 | `vo.g3.matematik.u03.n07.intro` | `assets/audio/voice/g3/matematik/u03/n07/intro.wav` | BILGE | Bir durumu okuyup ona uygun bir problem sorusu bulalım. Sonra sorumuzu çözelim! |
| 196 | `vo.g3.matematik.u03.n07.p1` | `assets/audio/voice/g3/matematik/u03/n07/p1.wav` | ANLATICI | Bahçede 12 elma ağacı var. Her ağaçta 10 elma var. |
| 197 | `vo.g3.matematik.u03.n07.q1` | `assets/audio/voice/g3/matematik/u03/n07/q1.wav` | ANLATICI | Hangisi bu durum için bir problem sorusudur? |
| 198 | `vo.g3.matematik.u03.n07.q2` | `assets/audio/voice/g3/matematik/u03/n07/q2.wav` | ANLATICI | Bu sorunun cevabı kaç? |
| 199 | `vo.g3.matematik.u03.n07.r01` | `assets/audio/voice/g3/matematik/u03/n07/r01.wav` | ANLATICI | Durumu dinle. Bu duruma uygun problem sorusunu seç! |
| 200 | `vo.g3.matematik.u03.n07.p2` | `assets/audio/voice/g3/matematik/u03/n07/p2.wav` | ANLATICI | Sınıfta 28 öğrenci var. Bunların 13'ü kız. |
| 201 | `vo.g3.matematik.u03.n07.q3` | `assets/audio/voice/g3/matematik/u03/n07/q3.wav` | ANLATICI | Hangi soru bu bilgilerle çözülebilir? |
| 202 | `vo.g3.matematik.u03.n07.q4` | `assets/audio/voice/g3/matematik/u03/n07/q4.wav` | ANLATICI | Sınıfta kaç erkek öğrenci var? |
| 203 | `vo.g3.matematik.u03.n07.r02` | `assets/audio/voice/g3/matematik/u03/n07/r02.wav` | ANLATICI | Durumu dinle. Hangi soru bu bilgilerle çözülebilir? |
| 204 | `vo.g3.matematik.u03.n07.p3` | `assets/audio/voice/g3/matematik/u03/n07/p3.wav` | ANLATICI | Bir çiftlikte 6 inek ve 8 tavuk var. Her ineğin 4 bacağı var. |
| 205 | `vo.g3.matematik.u03.n07.q5` | `assets/audio/voice/g3/matematik/u03/n07/q5.wav` | ANLATICI | Hangi soru çarpma ile çözülür? |
| 206 | `vo.g3.matematik.u03.n07.q6` | `assets/audio/voice/g3/matematik/u03/n07/q6.wav` | ANLATICI | İneklerin toplam kaç bacağı var? |
| 207 | `vo.g3.matematik.u03.n07.r03` | `assets/audio/voice/g3/matematik/u03/n07/r03.wav` | ANLATICI | Durumu dinle. Çarpma gerektiren soruyu bul! |
| 208 | `vo.g3.matematik.u03.n08.intro` | `assets/audio/voice/g3/matematik/u03/n08/intro.wav` | BILGE | Eşittir işareti iki tarafın aynı değerde olduğunu söyler. Teraziyi dengede tutalım! |
| 209 | `vo.g3.matematik.u03.n08.r01` | `assets/audio/voice/g3/matematik/u03/n08/r01.wav` | ANLATICI | İki tarafı karşılaştır. Hangi işaret gelmeli? |
| 210 | `vo.g3.matematik.u03.n08.r02` | `assets/audio/voice/g3/matematik/u03/n08/r02.wav` | ANLATICI | Terazi dengede olsun. Eksik sayı hangisi? |
| 211 | `vo.g3.matematik.u03.n08.r03` | `assets/audio/voice/g3/matematik/u03/n08/r03.wav` | ANLATICI | Aynı sonucu veren işlemleri eşleştir! |
| 212 | `vo.g3.matematik.u03.n08.r04` | `assets/audio/voice/g3/matematik/u03/n08/r04.wav` | ANLATICI | Terazinin iki yanı eşit olsun. Eksik sayıyı bul! |
| 213 | `vo.g3.matematik.u03.n08.r05` | `assets/audio/voice/g3/matematik/u03/n08/r05.wav` | ANLATICI | İki tarafı karşılaştır. Eşit mi, değil mi? Doğru işareti seç! |
| 214 | `vo.ad.cisim.kup` | `assets/audio/voice/ad/cisim/kup.wav` | ANLATICI | küp |
| 215 | `vo.ad.cisim.kare_prizma` | `assets/audio/voice/ad/cisim/kare_prizma.wav` | ANLATICI | kare prizma |
| 216 | `vo.ad.cisim.dikdortgen_prizma` | `assets/audio/voice/ad/cisim/dikdortgen_prizma.wav` | ANLATICI | dikdörtgen prizma |
| 217 | `vo.ad.cisim.ucgen_prizma` | `assets/audio/voice/ad/cisim/ucgen_prizma.wav` | ANLATICI | üçgen prizma |
| 218 | `vo.ad.cisim.kure` | `assets/audio/voice/ad/cisim/kure.wav` | ANLATICI | küre |
| 219 | `vo.ad.cisim.silindir` | `assets/audio/voice/ad/cisim/silindir.wav` | ANLATICI | silindir |
| 220 | `vo.ad.sekil.ucgen` | `assets/audio/voice/ad/sekil/ucgen.wav` | ANLATICI | üçgen |
| 221 | `vo.ad.sekil.besgen` | `assets/audio/voice/ad/sekil/besgen.wav` | ANLATICI | beşgen |
| 222 | `vo.ad.sekil.altigen` | `assets/audio/voice/ad/sekil/altigen.wav` | ANLATICI | altıgen |
| 223 | `vo.ad.sekil.sekizgen` | `assets/audio/voice/ad/sekil/sekizgen.wav` | ANLATICI | sekizgen |
| 224 | `vo.g3m.bin.kenar_3` | `assets/audio/voice/g3m/bin/kenar_3.wav` | ANLATICI | Üç kenarlı şekiller |
| 225 | `vo.g3m.bin.kenar_4` | `assets/audio/voice/g3m/bin/kenar_4.wav` | ANLATICI | Dört kenarlı şekiller |
| 226 | `vo.g3m.bin.kenar_5` | `assets/audio/voice/g3m/bin/kenar_5.wav` | ANLATICI | Beş kenarlı şekiller |
| 227 | `vo.g3m.bin.kenar_6` | `assets/audio/voice/g3m/bin/kenar_6.wav` | ANLATICI | Altı kenarlı şekiller |
| 228 | `vo.ad.arac.cetvel` | `assets/audio/voice/ad/arac/cetvel.wav` | ANLATICI | cetvel |
| 229 | `vo.g3m.bin.cizim` | `assets/audio/voice/g3m/bin/cizim.wav` | ANLATICI | Şekil çizmek için kullanılır |
| 230 | `vo.g3m.bin.diger` | `assets/audio/voice/g3m/bin/diger.wav` | ANLATICI | Başka işler için kullanılır |
| 231 | `vo.g3m.bin.litre_az` | `assets/audio/voice/g3m/bin/litre_az.wav` | ANLATICI | Bir litreden az |
| 232 | `vo.g3m.bin.litre_cok` | `assets/audio/voice/g3m/bin/litre_cok.wav` | ANLATICI | Bir litreden çok |

---
## Teslim kontrol listesi
- [ ] Dosya adları ve klasörler tablodakiyle birebir aynı
- [ ] 005'teki seslerle aynı Anlatıcı ve Bilge sesi kullanıldı
- [ ] Sayılar Türkçe ve doğru okundu (ör. "dokuz yüz doksan dokuz")
- [ ] `godot --headless --path . -s res://tools/missing_assets.gd` bu satırları artık eksik göstermiyor
- [ ] Commit: `assets: 052 g3 matematik seslendirmesi 1`
