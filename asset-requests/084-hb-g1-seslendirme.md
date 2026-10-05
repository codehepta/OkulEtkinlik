# 084 · Hayat Bilgisi 1. sınıf seslendirmesi

**Öncelik: YÜKSEK** (Faz 5b, Hayat Kasabası). `content/g1/hayat_bilgisi/` ünitelerinin durak girişleri, tur yönergeleri, ipuçları, hikâye sayfaları ve soruları; ayrıca bu sınıfta ilk kez geçen nesne ve etiket adları (`vo.ad.*`, 148 satır).

> Bu dosya eklenmeden de oyun çalışır: eksik satırları cihazın Türkçe sesiyle okur. Gerçek kayıtlar geldiğinde kalite çok artar.

## Nasıl üretilir
1. **Google AI Studio → "Generate speech"** (Gemini TTS) ekranını aç. Çoklu konuşmacı modunu kapat, tek konuşmacı kullan.
2. **Ses seçimi:** 005'in en altındaki "Seçilen sesler" bölümüne yazdığın **aynı iki sesi** kullan (Anlatıcı ve Bilge).
3. Her satır için **Üslup talimatı** alanını "Style instructions / system" kısmına, **Metin** alanını konuşma metnine yapıştır.
4. Çıktıyı (`.wav`) **Dosya yolu** sütunundaki isimle kaydet. Klasörler yoksa oluştur. `.wav` kabul edilir; istersen `.ogg`'ye çevirebilirsin (mono, 22–44 kHz).
5. Dinleyip kontrol et: Türkçe telaffuz doğru mu, tempo 6–9 yaşındaki bir çocuk için yeterince yavaş mı?

## Ortak üslup talimatları
- **ANLATICI:** `Sıcak, sakin ve net bir sesle, 6-8 yaşındaki bir çocuğa konuşur gibi, yavaş ve anlaşılır oku. Kelimeleri tane tane söyle, cümle sonlarında kısa bir duraklama yap.`
- **BILGE:** `Neşeli, sevimli ve enerjik bir çizgi film karakteri gibi konuş. Gülümseyerek, coşkulu ama anlaşılır ve çok hızlı olmayan bir tempoyla söyle.`

Ek notlar: `vo.ad.*` satırları tek bir ad ya da kısa etikettir (ör. "Deprem"); çocuk kartı tutunca ya da kutuya dokununca duyar, net ve biraz vurgulu söyle. "yüz on iki" acil numarasıdır, rakam rakam değil "yüz on iki" diye oku. Tarihleri ("1881", "23 Nisan") doğal Türkçe okunuşuyla söyle.

## Satırlar

| # | Kimlik (anahtar) | Dosya yolu | Konuşmacı | Metin |
|---|---|---|---|---|
| 1 | `vo.g1.hayat_bilgisi.u01.n01.intro` | `assets/audio/voice/g1/hayat_bilgisi/u01/n01/intro.wav` | BILGE | Okulumuzun kuralları hepimizi mutlu eder. Haydi, okulda nasıl davranacağımızı birlikte bulalım! |
| 2 | `vo.g1.hayat_bilgisi.u01.n01.r01.ipucu` | `assets/audio/voice/g1/hayat_bilgisi/u01/n01/r01/ipucu.wav` | ANLATICI | Sınıfta söz almak için önce parmak kaldırırız. |
| 3 | `vo.g1.hayat_bilgisi.u01.n01.r01` | `assets/audio/voice/g1/hayat_bilgisi/u01/n01/r01.wav` | ANLATICI | Öğretmenin ders anlatıyor. Sen de bir şey söylemek istiyorsun. Ne yapmalısın? |
| 4 | `vo.g1.hayat_bilgisi.u01.n01.r02` | `assets/audio/voice/g1/hayat_bilgisi/u01/n01/r02.wav` | ANLATICI | Okulda hangisi uygun bir davranış? Uygun olanları gülen yüze, uygun olmayanları üzgün yüze koy. |
| 5 | `vo.g1.hayat_bilgisi.u01.n01.r03` | `assets/audio/voice/g1/hayat_bilgisi/u01/n01/r03.wav` | ANLATICI | Bu davranışları ayır. Okul kurallarına uygun olanlar gülen yüze, uygun olmayanlar üzgün yüze. |
| 6 | `vo.g1.hayat_bilgisi.u01.n01.r04.ipucu` | `assets/audio/voice/g1/hayat_bilgisi/u01/n01/r04/ipucu.wav` | ANLATICI | Zil çalınca derse dönme zamanıdır. |
| 7 | `vo.g1.hayat_bilgisi.u01.n01.r04` | `assets/audio/voice/g1/hayat_bilgisi/u01/n01/r04.wav` | ANLATICI | Zil çaldı, teneffüs bitti. Ne yapmalısın? |
| 8 | `vo.g1.hayat_bilgisi.u02.n01.intro` | `assets/audio/voice/g1/hayat_bilgisi/u02/n01/intro.wav` | BILGE | Sağlıklı büyümek için iyi beslenir, uyur ve temiz oluruz. Hadi bakalım, neler yapmalıyız? |
| 9 | `vo.g1.hayat_bilgisi.u02.n01.r01` | `assets/audio/voice/g1/hayat_bilgisi/u02/n01/r01.wav` | ANLATICI | Hangi yiyecekler sağlıklı? Sağlıklı olanları güçlü kalbe, sağlıksız olanları yorgun kalbe koy. |
| 10 | `vo.g1.hayat_bilgisi.u02.n01.r02` | `assets/audio/voice/g1/hayat_bilgisi/u02/n01/r02.wav` | ANLATICI | Dişlerimizi nasıl fırçalarız? Önce fırçaya macun sür, sonra dişlerini fırçala, en son ağzını çalkala. Resimleri sıraya diz. |
| 11 | `vo.g1.hayat_bilgisi.u02.n01.r03.ipucu` | `assets/audio/voice/g1/hayat_bilgisi/u02/n01/r03/ipucu.wav` | ANLATICI | İyi uyumak büyümemize yardım eder. |
| 12 | `vo.g1.hayat_bilgisi.u02.n01.r03` | `assets/audio/voice/g1/hayat_bilgisi/u02/n01/r03.wav` | ANLATICI | Hava karardı, uyku vakti geldi. Ne yapmalısın? |
| 13 | `vo.g1.hayat_bilgisi.u02.n01.r04.ipucu` | `assets/audio/voice/g1/hayat_bilgisi/u02/n01/r04/ipucu.wav` | ANLATICI | Mikroplardan korunmak için ellerimizi sabunla yıkarız. |
| 14 | `vo.g1.hayat_bilgisi.u02.n01.r04` | `assets/audio/voice/g1/hayat_bilgisi/u02/n01/r04.wav` | ANLATICI | Sofra hazır, ama ellerin kirli. Yemekten önce ne yapmalısın? |
| 15 | `vo.g1.hayat_bilgisi.u02.n02.intro` | `assets/audio/voice/g1/hayat_bilgisi/u02/n02/intro.wav` | BILGE | Bedenimiz bize aittir. Rahatsız olduğumuzda hayır deriz ve güvendiğimiz bir büyüğe anlatırız. |
| 16 | `vo.g1.hayat_bilgisi.u02.n02.r01.ipucu` | `assets/audio/voice/g1/hayat_bilgisi/u02/n02/r01/ipucu.wav` | ANLATICI | Hoşlanmadığında nazikçe hayır diyebilirsin. |
| 17 | `vo.g1.hayat_bilgisi.u02.n02.r01` | `assets/audio/voice/g1/hayat_bilgisi/u02/n02/r01.wav` | ANLATICI | Bir arkadaşın sana sormadan sarılmak istiyor, sen de bundan hoşlanmıyorsun. Ne yapabilirsin? |
| 18 | `vo.g1.hayat_bilgisi.u02.n02.r02.ipucu` | `assets/audio/voice/g1/hayat_bilgisi/u02/n02/r02/ipucu.wav` | ANLATICI | Tanımadığın kişilerle hiçbir yere gitmeyiz. Hemen ailemizin yanına gideriz. |
| 19 | `vo.g1.hayat_bilgisi.u02.n02.r02` | `assets/audio/voice/g1/hayat_bilgisi/u02/n02/r02.wav` | ANLATICI | Parkta tanımadığın biri sana şeker uzatıyor ve benimle gel diyor. Ne yapmalısın? |
| 20 | `vo.g1.hayat_bilgisi.u02.n02.r03.ipucu` | `assets/audio/voice/g1/hayat_bilgisi/u02/n02/r03/ipucu.wav` | ANLATICI | Bizi rahatsız eden sırlar saklanmaz. Güvendiğimiz bir büyüğe anlatırız. |
| 21 | `vo.g1.hayat_bilgisi.u02.n02.r03` | `assets/audio/voice/g1/hayat_bilgisi/u02/n02/r03.wav` | ANLATICI | Biri sana rahatsız olduğun bir şekilde dokundu ve bu bir sır, kimseye söyleme dedi. Ne yapmalısın? |
| 22 | `vo.g1.hayat_bilgisi.u02.n03.intro` | `assets/audio/voice/g1/hayat_bilgisi/u02/n03/intro.wav` | BILGE | Trafikte kurallara uyarsak güvende oluruz. Haydi, trafik kurallarını öğrenelim! |
| 23 | `vo.g1.hayat_bilgisi.u02.n03.r01.ipucu` | `assets/audio/voice/g1/hayat_bilgisi/u02/n03/r01/ipucu.wav` | ANLATICI | Kırmızı ışıkta durur, yeşil ışığı bekleriz. |
| 24 | `vo.g1.hayat_bilgisi.u02.n03.r01` | `assets/audio/voice/g1/hayat_bilgisi/u02/n03/r01.wav` | ANLATICI | Yaya ışığı kırmızı yanıyor. Ne yapmalısın? |
| 25 | `vo.g1.hayat_bilgisi.u02.n03.r02` | `assets/audio/voice/g1/hayat_bilgisi/u02/n03/r02.wav` | ANLATICI | Trafikte hangi davranış doğru? Doğru olanları gülen yüze, yanlış olanları üzgün yüze koy. |
| 26 | `vo.g1.hayat_bilgisi.u02.n03.r03.ipucu` | `assets/audio/voice/g1/hayat_bilgisi/u02/n03/r03/ipucu.wav` | ANLATICI | Arabada her zaman emniyet kemerimizi takarız. |
| 27 | `vo.g1.hayat_bilgisi.u02.n03.r03` | `assets/audio/voice/g1/hayat_bilgisi/u02/n03/r03.wav` | ANLATICI | Arabaya bindin ve arka koltuğa oturdun. Araba hareket etmeden önce ne yapmalısın? |
| 28 | `vo.g1.hayat_bilgisi.u02.n04.intro` | `assets/audio/voice/g1/hayat_bilgisi/u02/n04/intro.wav` | BILGE | Acil bir durumda sakin kalır ve yardım isteriz. Kimden yardım isteyeceğimizi birlikte öğrenelim. |
| 29 | `vo.g1.hayat_bilgisi.u02.n04.r01` | `assets/audio/voice/g1/hayat_bilgisi/u02/n04/r01.wav` | ANLATICI | Her durumu yardım isteyeceğin kişiyle eşleştir. Yangında yüz on ikiyi ararız. |
| 30 | `vo.g1.hayat_bilgisi.u02.n04.r02.ipucu` | `assets/audio/voice/g1/hayat_bilgisi/u02/n04/r02/ipucu.wav` | ANLATICI | Gaz kokusunda ışıklara dokunmayız. Pencereleri açar, hemen bir büyüğe haber veririz. |
| 31 | `vo.g1.hayat_bilgisi.u02.n04.r02` | `assets/audio/voice/g1/hayat_bilgisi/u02/n04/r02.wav` | ANLATICI | Evde gaz kokusu var. Ne yapmalısın? |
| 32 | `vo.g1.hayat_bilgisi.u02.n04.r03.ipucu` | `assets/audio/voice/g1/hayat_bilgisi/u02/n04/r03/ipucu.wav` | ANLATICI | Kaybolursak olduğumuz yerde kalır, görevliye adımızı söyleriz. |
| 33 | `vo.g1.hayat_bilgisi.u02.n04.r03` | `assets/audio/voice/g1/hayat_bilgisi/u02/n04/r03.wav` | ANLATICI | Alışveriş merkezinde aileni göremiyorsun. Ne yapmalısın? |
| 34 | `vo.g1.hayat_bilgisi.u02.n04.r04` | `assets/audio/voice/g1/hayat_bilgisi/u02/n04/r04.wav` | ANLATICI | Her durumu doğru kişiyle eşleştir. |
| 35 | `vo.g1.hayat_bilgisi.u03.n01.intro` | `assets/audio/voice/g1/hayat_bilgisi/u03/n01/intro.wav` | BILGE | Ailemiz bizi sever ve korur. Haydi, aile bireylerini tanıyalım! |
| 36 | `vo.g1.hayat_bilgisi.u03.n01.r01` | `assets/audio/voice/g1/hayat_bilgisi/u03/n01/r01.wav` | ANLATICI | Dinle ve bul: Dede! Dedeye dokun. |
| 37 | `vo.g1.hayat_bilgisi.u03.n01.r02` | `assets/audio/voice/g1/hayat_bilgisi/u03/n01/r02.wav` | ANLATICI | Dinle ve bul: Büyükanne! Büyükanneye dokun. |
| 38 | `vo.g1.hayat_bilgisi.u03.n01.r03` | `assets/audio/voice/g1/hayat_bilgisi/u03/n01/r03.wav` | ANLATICI | Anne, baba ve kardeşler çekirdek aileyi oluşturur. Büyükanne, dede, teyze ve amca da katılınca geniş aile olur. Kartları ayır. |
| 39 | `vo.g1.hayat_bilgisi.u03.n01.r04.p1` | `assets/audio/voice/g1/hayat_bilgisi/u03/n01/r04/p1.wav` | ANLATICI | Elif'in ailesi her akşam aynı sofrada buluşur. Herkes gününü anlatır. |
| 40 | `vo.g1.hayat_bilgisi.u03.n01.r04.p2` | `assets/audio/voice/g1/hayat_bilgisi/u03/n01/r04/p2.wav` | ANLATICI | Bir gün Elif'in kardeşi hastalandı. Annesi çorba yaptı, babası ona masal okudu, Elif de oyuncaklarını paylaştı. |
| 41 | `vo.g1.hayat_bilgisi.u03.n01.r04.p3` | `assets/audio/voice/g1/hayat_bilgisi/u03/n01/r04/p3.wav` | ANLATICI | Elif'in ailesi birbirini sever ve birbirine yardım eder. |
| 42 | `vo.g1.hayat_bilgisi.u03.n01.r04.s1` | `assets/audio/voice/g1/hayat_bilgisi/u03/n01/r04/s1.wav` | ANLATICI | Elif'in kardeşi hastalanınca aile ne yaptı? |
| 43 | `vo.g1.hayat_bilgisi.u03.n01.r04.s2` | `assets/audio/voice/g1/hayat_bilgisi/u03/n01/r04/s2.wav` | ANLATICI | Ailesi yanındayken kardeşi kendini nasıl hissetti? |
| 44 | `vo.g1.hayat_bilgisi.u03.n01.r04` | `assets/audio/voice/g1/hayat_bilgisi/u03/n01/r04.wav` | ANLATICI | Hikâyeyi dinle, sonra soruları cevapla. |
| 45 | `vo.g1.hayat_bilgisi.u03.n02.intro` | `assets/audio/voice/g1/hayat_bilgisi/u03/n02/intro.wav` | BILGE | Lütfen, teşekkür ederim, hoş geldin gibi sözler herkesi mutlu eder. Evde nazik olalım! |
| 46 | `vo.g1.hayat_bilgisi.u03.n02.r01.ipucu` | `assets/audio/voice/g1/hayat_bilgisi/u03/n02/r01/ipucu.wav` | ANLATICI | Biri bize bir şey verdiğinde teşekkür ederiz. |
| 47 | `vo.g1.hayat_bilgisi.u03.n02.r01` | `assets/audio/voice/g1/hayat_bilgisi/u03/n02/r01.wav` | ANLATICI | Annen sana bir bardak su verdi. Ne yaparsın? |
| 48 | `vo.g1.hayat_bilgisi.u03.n02.r02.ipucu` | `assets/audio/voice/g1/hayat_bilgisi/u03/n02/r02/ipucu.wav` | ANLATICI | Lütfen, tuzu verir misin, diye rica ederiz. |
| 49 | `vo.g1.hayat_bilgisi.u03.n02.r02` | `assets/audio/voice/g1/hayat_bilgisi/u03/n02/r02.wav` | ANLATICI | Sofrada tuz senden çok uzakta. Tuzu nasıl istersin? |
| 50 | `vo.g1.hayat_bilgisi.u03.n02.r03.ipucu` | `assets/audio/voice/g1/hayat_bilgisi/u03/n02/r03/ipucu.wav` | ANLATICI | Misafirlerimizi gülümseyerek karşılarız. |
| 51 | `vo.g1.hayat_bilgisi.u03.n02.r03` | `assets/audio/voice/g1/hayat_bilgisi/u03/n02/r03.wav` | ANLATICI | Evinize misafir geldi. Ne yaparsın? |
| 52 | `vo.g1.hayat_bilgisi.u03.n03.intro` | `assets/audio/voice/g1/hayat_bilgisi/u03/n03/intro.wav` | BILGE | Ailede herkesin görevleri var. Sen de evde yardım edebilirsin! Hangi görevler senin? |
| 53 | `vo.g1.hayat_bilgisi.u03.n03.r01` | `assets/audio/voice/g1/hayat_bilgisi/u03/n03/r01.wav` | ANLATICI | Bu görevlerden hangilerini sen yapabilirsin? Senin görevlerini çocuk eline, büyüklerin görevlerini büyük ele koy. |
| 54 | `vo.g1.hayat_bilgisi.u03.n03.r02` | `assets/audio/voice/g1/hayat_bilgisi/u03/n03/r02.wav` | ANLATICI | Görevleri ayır: Senin yapabileceklerin çocuk eline, büyüklerin yapması gerekenler büyük ele. |
| 55 | `vo.g1.hayat_bilgisi.u03.n03.r03` | `assets/audio/voice/g1/hayat_bilgisi/u03/n03/r03.wav` | ANLATICI | Her görevi ona yarayan eşyayla eşleştir. |
| 56 | `vo.g1.hayat_bilgisi.u03.n03.r04.ipucu` | `assets/audio/voice/g1/hayat_bilgisi/u03/n03/r04/ipucu.wav` | ANLATICI | Ailede herkes bir işin ucundan tutar. |
| 57 | `vo.g1.hayat_bilgisi.u03.n03.r04` | `assets/audio/voice/g1/hayat_bilgisi/u03/n03/r04.wav` | ANLATICI | Yemekten sonra ailece sofrayı topluyorsunuz. Kardeşin bardakları kuruluyor. Sen ne yaparsın? |
| 58 | `vo.g1.hayat_bilgisi.u04.n01.intro` | `assets/audio/voice/g1/hayat_bilgisi/u04/n01/intro.wav` | BILGE | Ülkemizin adı Türkiye. Başkentimiz Ankara, paramız Türk lirası. Ülkemizi tanıyalım! |
| 59 | `vo.g1.hayat_bilgisi.u04.n01.r01` | `assets/audio/voice/g1/hayat_bilgisi/u04/n01/r01.wav` | ANLATICI | Paramızın adı Türk lirası. Dinle ve bul: Türk lirası! |
| 60 | `vo.g1.hayat_bilgisi.u04.n01.r02` | `assets/audio/voice/g1/hayat_bilgisi/u04/n01/r02.wav` | ANLATICI | Başkentimiz Ankara. Ankara'da Anıtkabir vardır. Dinle ve bul: Anıtkabir! |
| 61 | `vo.g1.hayat_bilgisi.u04.n01.r03.ipucu` | `assets/audio/voice/g1/hayat_bilgisi/u04/n01/r03/ipucu.wav` | ANLATICI | Kuzeyde Karadeniz, batıda Ege Denizi, güneyde Akdeniz var. Mavi denizleri say. |
| 62 | `vo.g1.hayat_bilgisi.u04.n01.r03` | `assets/audio/voice/g1/hayat_bilgisi/u04/n01/r03.wav` | ANLATICI | Haritaya bak. Ülkemizin kaç tarafı denizlerle çevrili? Sayıya dokun. |
| 63 | `vo.g1.hayat_bilgisi.u04.n02.intro` | `assets/audio/voice/g1/hayat_bilgisi/u04/n02/intro.wav` | BILGE | Bayrağımız ve İstiklâl Marşı'mız bağımsızlığımızın sembolüdür. Onları çok severiz! |
| 64 | `vo.g1.hayat_bilgisi.u04.n02.r01` | `assets/audio/voice/g1/hayat_bilgisi/u04/n02/r01.wav` | ANLATICI | Dinle ve bul: Türk bayrağı! |
| 65 | `vo.g1.hayat_bilgisi.u04.n02.r02.p1` | `assets/audio/voice/g1/hayat_bilgisi/u04/n02/r02/p1.wav` | ANLATICI | Bayrağımız kırmızı ve beyazdır. Üzerinde beyaz bir ay ve yıldız vardır. |
| 66 | `vo.g1.hayat_bilgisi.u04.n02.r02.p2` | `assets/audio/voice/g1/hayat_bilgisi/u04/n02/r02/p2.wav` | ANLATICI | İstiklâl Marşı'mızı Mehmet Akif Ersoy yazdı. Marşımız bağımsızlığımızı anlatır. |
| 67 | `vo.g1.hayat_bilgisi.u04.n02.r02.p3` | `assets/audio/voice/g1/hayat_bilgisi/u04/n02/r02/p3.wav` | ANLATICI | Bayrağımız ve marşımız bağımsızlığımızın sembolüdür. Onlara saygı gösteririz. |
| 68 | `vo.g1.hayat_bilgisi.u04.n02.r02.s1` | `assets/audio/voice/g1/hayat_bilgisi/u04/n02/r02/s1.wav` | ANLATICI | Bayrağımızın renkleri hangileri? |
| 69 | `vo.g1.hayat_bilgisi.u04.n02.r02.s2` | `assets/audio/voice/g1/hayat_bilgisi/u04/n02/r02/s2.wav` | ANLATICI | Bayrağımızda hangi şekiller var? |
| 70 | `vo.g1.hayat_bilgisi.u04.n02.r02` | `assets/audio/voice/g1/hayat_bilgisi/u04/n02/r02.wav` | ANLATICI | Dinle, sonra soruları cevapla. |
| 71 | `vo.g1.hayat_bilgisi.u04.n02.r03.ipucu` | `assets/audio/voice/g1/hayat_bilgisi/u04/n02/r03/ipucu.wav` | ANLATICI | İstiklâl Marşı okunurken hazırol durur, saygıyla dinleriz. |
| 72 | `vo.g1.hayat_bilgisi.u04.n02.r03` | `assets/audio/voice/g1/hayat_bilgisi/u04/n02/r03.wav` | ANLATICI | Bayrak töreninde İstiklâl Marşı okunuyor. Ne yapmalısın? |
| 73 | `vo.g1.hayat_bilgisi.u04.n03.intro` | `assets/audio/voice/g1/hayat_bilgisi/u04/n03/intro.wav` | BILGE | Mustafa Kemal Atatürk, Cumhuriyetimizin kurucusudur. Onun hayatını birlikte dinleyelim. |
| 74 | `vo.g1.hayat_bilgisi.u04.n03.r01.p1` | `assets/audio/voice/g1/hayat_bilgisi/u04/n03/r01/p1.wav` | ANLATICI | Mustafa Kemal Atatürk, 1881 yılında Selanik'te bu evde doğdu. |
| 75 | `vo.g1.hayat_bilgisi.u04.n03.r01.p2` | `assets/audio/voice/g1/hayat_bilgisi/u04/n03/r01/p2.wav` | ANLATICI | Annesinin adı Zübeyde Hanım, babasının adı Ali Rıza Efendi'dir. |
| 76 | `vo.g1.hayat_bilgisi.u04.n03.r01.p3` | `assets/audio/voice/g1/hayat_bilgisi/u04/n03/r01/p3.wav` | ANLATICI | Atatürk 10 Kasım 1938'de İstanbul'da öldü. Şimdi Ankara'daki Anıtkabir'de yatıyor. |
| 77 | `vo.g1.hayat_bilgisi.u04.n03.r01.s1` | `assets/audio/voice/g1/hayat_bilgisi/u04/n03/r01/s1.wav` | ANLATICI | Atatürk'ün doğduğu evi bul. |
| 78 | `vo.g1.hayat_bilgisi.u04.n03.r01.s2` | `assets/audio/voice/g1/hayat_bilgisi/u04/n03/r01/s2.wav` | ANLATICI | Atatürk'ün yattığı Anıtkabir hangisi? |
| 79 | `vo.g1.hayat_bilgisi.u04.n03.r01` | `assets/audio/voice/g1/hayat_bilgisi/u04/n03/r01.wav` | ANLATICI | Atatürk'ün hayatını dinle, sonra soruyu cevapla. |
| 80 | `vo.g1.hayat_bilgisi.u04.n03.r02.p1` | `assets/audio/voice/g1/hayat_bilgisi/u04/n03/r02/p1.wav` | ANLATICI | Mustafa Kemal'in annesinin adı Zübeyde Hanım'dır. |
| 81 | `vo.g1.hayat_bilgisi.u04.n03.r02.p2` | `assets/audio/voice/g1/hayat_bilgisi/u04/n03/r02/p2.wav` | ANLATICI | Babasının adı Ali Rıza Efendi'dir. |
| 82 | `vo.g1.hayat_bilgisi.u04.n03.r02.s1` | `assets/audio/voice/g1/hayat_bilgisi/u04/n03/r02/s1.wav` | ANLATICI | Atatürk'ün annesinin adı neydi? Zübeyde Hanım mı, Ayşe Hanım mı? |
| 83 | `vo.g1.hayat_bilgisi.u04.n03.r02.s2` | `assets/audio/voice/g1/hayat_bilgisi/u04/n03/r02/s2.wav` | ANLATICI | Babasının adı neydi? Ahmet Efendi mi, Ali Rıza Efendi mi? |
| 84 | `vo.g1.hayat_bilgisi.u04.n03.r02` | `assets/audio/voice/g1/hayat_bilgisi/u04/n03/r02.wav` | ANLATICI | Dinle, sonra soruları cevapla. |
| 85 | `vo.g1.hayat_bilgisi.u04.n03.r03` | `assets/audio/voice/g1/hayat_bilgisi/u04/n03/r03.wav` | ANLATICI | Atatürk'ün hayatını sıraya diz. Önce Selanik'te doğdu, sonra okula başladı, büyüyünce Cumhuriyet'i kurdu. Şimdi Anıtkabir'de yatıyor. |
| 86 | `vo.g1.hayat_bilgisi.u05.n01.intro` | `assets/audio/voice/g1/hayat_bilgisi/u05/n01/intro.wav` | BILGE | Doğada neler var? Gözlerimizi açalım, gördüklerimizi gruplara ayıralım! |
| 87 | `vo.g1.hayat_bilgisi.u05.n01.r01` | `assets/audio/voice/g1/hayat_bilgisi/u05/n01/r01.wav` | ANLATICI | Doğada gözlem yaptık! Canlıları filize, cansızları taşa koy. |
| 88 | `vo.g1.hayat_bilgisi.u05.n01.r02` | `assets/audio/voice/g1/hayat_bilgisi/u05/n01/r02.wav` | ANLATICI | Gözlem kartlarını ayır: Canlılar filize, cansızlar taşa. |
| 89 | `vo.g1.hayat_bilgisi.u05.n01.r03` | `assets/audio/voice/g1/hayat_bilgisi/u05/n01/r03.wav` | ANLATICI | Gözlem tablomuzu dolduralım: hayvanlar pati izine, bitkiler filize, cansızlar taşa. |
| 90 | `vo.g1.hayat_bilgisi.u05.n02.intro` | `assets/audio/voice/g1/hayat_bilgisi/u05/n02/intro.wav` | BILGE | Gökyüzüne bakalım! Güneş, Dünya ve Ay'ın modelleriyle onları tanıyalım. |
| 91 | `vo.g1.hayat_bilgisi.u05.n02.r01` | `assets/audio/voice/g1/hayat_bilgisi/u05/n02/r01.wav` | ANLATICI | Dinle ve bul: Güneş! |
| 92 | `vo.g1.hayat_bilgisi.u05.n02.r02` | `assets/audio/voice/g1/hayat_bilgisi/u05/n02/r02.wav` | ANLATICI | Dinle ve bul: Ay! |
| 93 | `vo.g1.hayat_bilgisi.u05.n02.r03.ipucu` | `assets/audio/voice/g1/hayat_bilgisi/u05/n02/r03/ipucu.wav` | ANLATICI | Gündüz bizi ısıtan ve aydınlatan gök cismini düşün. |
| 94 | `vo.g1.hayat_bilgisi.u05.n02.r03` | `assets/audio/voice/g1/hayat_bilgisi/u05/n02/r03.wav` | ANLATICI | Modellere bak. Bize ısı ve ışık veren gök cismi hangisi? |
| 95 | `vo.g1.hayat_bilgisi.u05.n02.r04.ipucu` | `assets/audio/voice/g1/hayat_bilgisi/u05/n02/r04/ipucu.wav` | ANLATICI | Mavi denizleri ve yeşil karaları olan gök cismini düşün. |
| 96 | `vo.g1.hayat_bilgisi.u05.n02.r04` | `assets/audio/voice/g1/hayat_bilgisi/u05/n02/r04.wav` | ANLATICI | Üzerinde yaşadığımız gök cismi hangisi? |
| 97 | `vo.g1.hayat_bilgisi.u05.n02.r05` | `assets/audio/voice/g1/hayat_bilgisi/u05/n02/r05.wav` | ANLATICI | Modelleri büyükten küçüğe sırala. En büyüğü Güneş, en küçüğü Ay. |
| 98 | `vo.g1.hayat_bilgisi.u05.n03.intro` | `assets/audio/voice/g1/hayat_bilgisi/u05/n03/intro.wav` | BILGE | Deprem, sel, yangın ve çığ birer afettir. Afetleri tanırsak onlara hazırlanabiliriz. |
| 99 | `vo.g1.hayat_bilgisi.u05.n03.r01` | `assets/audio/voice/g1/hayat_bilgisi/u05/n03/r01.wav` | ANLATICI | Dinle ve bul: Deprem! |
| 100 | `vo.g1.hayat_bilgisi.u05.n03.r02` | `assets/audio/voice/g1/hayat_bilgisi/u05/n03/r02.wav` | ANLATICI | Dinle ve bul: Sel! |
| 101 | `vo.g1.hayat_bilgisi.u05.n03.r03` | `assets/audio/voice/g1/hayat_bilgisi/u05/n03/r03.wav` | ANLATICI | Dinle ve bul: Çığ! |
| 102 | `vo.g1.hayat_bilgisi.u05.n03.r04` | `assets/audio/voice/g1/hayat_bilgisi/u05/n03/r04.wav` | ANLATICI | Her afeti onun nedeniyle eşleştir. |
| 103 | `vo.g1.hayat_bilgisi.u05.n04.intro` | `assets/audio/voice/g1/hayat_bilgisi/u05/n04/intro.wav` | BILGE | Kâğıt, plastik, cam ve metal atıklar geri dönüşebilir. Atıkları ayıralım, doğayı koruyalım! |
| 104 | `vo.g1.hayat_bilgisi.u05.n04.r01` | `assets/audio/voice/g1/hayat_bilgisi/u05/n04/r01.wav` | ANLATICI | Hangi atıklar geri dönüşür? Geri dönüşenleri oklu kutuya, dönüşmeyenleri gri çöp kutusuna koy. |
| 105 | `vo.g1.hayat_bilgisi.u05.n04.r02` | `assets/audio/voice/g1/hayat_bilgisi/u05/n04/r02.wav` | ANLATICI | Atıkları doğru kutulara ayır: kâğıtlar mavi kutuya, plastikler sarı kutuya, camlar yeşil kutuya. |
| 106 | `vo.g1.hayat_bilgisi.u05.n04.r03` | `assets/audio/voice/g1/hayat_bilgisi/u05/n04/r03.wav` | ANLATICI | Her atığı kendi geri dönüşüm kutusuyla eşleştir. |
| 107 | `vo.ad.simge.uygun` | `assets/audio/voice/ad/simge/uygun.wav` | ANLATICI | Uygun davranış (gülen yüz) |
| 108 | `vo.ad.simge.uygun_degil` | `assets/audio/voice/ad/simge/uygun_degil.wav` | ANLATICI | Uygun olmayan davranış (üzgün yüz) |
| 109 | `vo.ad.simge.saglikli` | `assets/audio/voice/ad/simge/saglikli.wav` | ANLATICI | Sağlıklı |
| 110 | `vo.ad.simge.sagliksiz` | `assets/audio/voice/ad/simge/sagliksiz.wav` | ANLATICI | Sağlıksız |
| 111 | `vo.ad.acil.yangin` | `assets/audio/voice/ad/acil/yangin.wav` | ANLATICI | Yangın |
| 112 | `vo.ad.acil.kaybolma` | `assets/audio/voice/ad/acil/kaybolma.wav` | ANLATICI | Kaybolmak |
| 113 | `vo.ad.acil.dusme` | `assets/audio/voice/ad/acil/dusme.wav` | ANLATICI | Okulda düşmek |
| 114 | `vo.ad.aile.dede` | `assets/audio/voice/ad/aile/dede.wav` | ANLATICI | Dede |
| 115 | `vo.ad.aile.buyukanne` | `assets/audio/voice/ad/aile/buyukanne.wav` | ANLATICI | Büyükanne |
| 116 | `vo.ad.simge.cekirdek_aile` | `assets/audio/voice/ad/simge/cekirdek_aile.wav` | ANLATICI | Çekirdek aile |
| 117 | `vo.ad.simge.genis_aile` | `assets/audio/voice/ad/simge/genis_aile.wav` | ANLATICI | Geniş aile |
| 118 | `vo.ad.simge.cocuk_gorevi` | `assets/audio/voice/ad/simge/cocuk_gorevi.wav` | ANLATICI | Benim yapabileceğim görev |
| 119 | `vo.ad.simge.buyuk_gorevi` | `assets/audio/voice/ad/simge/buyuk_gorevi.wav` | ANLATICI | Büyüklerin görevi |
| 120 | `vo.ad.gorev.oyuncak_topla` | `assets/audio/voice/ad/gorev/oyuncak_topla.wav` | ANLATICI | Oyuncakları toplamak |
| 121 | `vo.ad.gorev.cicek_sula` | `assets/audio/voice/ad/gorev/cicek_sula.wav` | ANLATICI | Çiçekleri sulamak |
| 122 | `vo.ad.gorev.sofra_kur` | `assets/audio/voice/ad/gorev/sofra_kur.wav` | ANLATICI | Sofrayı kurmak |
| 123 | `vo.ad.ulke.turk_lirasi` | `assets/audio/voice/ad/ulke/turk_lirasi.wav` | ANLATICI | Türk lirası |
| 124 | `vo.ad.ataturk.anitkabir` | `assets/audio/voice/ad/ataturk/anitkabir.wav` | ANLATICI | Anıtkabir |
| 125 | `vo.ad.ulke.turk_bayragi` | `assets/audio/voice/ad/ulke/turk_bayragi.wav` | ANLATICI | Türk bayrağı |
| 126 | `vo.ad.etiket.zubeyde` | `assets/audio/voice/ad/etiket/zubeyde.wav` | ANLATICI | Zübeyde Hanım |
| 127 | `vo.ad.etiket.ayse` | `assets/audio/voice/ad/etiket/ayse.wav` | ANLATICI | Ayşe Hanım |
| 128 | `vo.ad.etiket.ahmet` | `assets/audio/voice/ad/etiket/ahmet.wav` | ANLATICI | Ahmet Efendi |
| 129 | `vo.ad.etiket.ali_riza` | `assets/audio/voice/ad/etiket/ali_riza.wav` | ANLATICI | Ali Rıza Efendi |
| 130 | `vo.ad.simge.canli` | `assets/audio/voice/ad/simge/canli.wav` | ANLATICI | Canlı |
| 131 | `vo.ad.simge.cansiz` | `assets/audio/voice/ad/simge/cansiz.wav` | ANLATICI | Cansız |
| 132 | `vo.ad.simge.hayvan` | `assets/audio/voice/ad/simge/hayvan.wav` | ANLATICI | Hayvan |
| 133 | `vo.ad.simge.bitki` | `assets/audio/voice/ad/simge/bitki.wav` | ANLATICI | Bitki |
| 134 | `vo.ad.gok.gunes` | `assets/audio/voice/ad/gok/gunes.wav` | ANLATICI | Güneş |
| 135 | `vo.ad.gok.ay` | `assets/audio/voice/ad/gok/ay.wav` | ANLATICI | Ay |
| 136 | `vo.ad.afet.deprem` | `assets/audio/voice/ad/afet/deprem.wav` | ANLATICI | Deprem |
| 137 | `vo.ad.afet.sel` | `assets/audio/voice/ad/afet/sel.wav` | ANLATICI | Sel |
| 138 | `vo.ad.afet.cig` | `assets/audio/voice/ad/afet/cig.wav` | ANLATICI | Çığ |
| 139 | `vo.ad.afet.yangin` | `assets/audio/voice/ad/afet/yangin.wav` | ANLATICI | Orman yangını |
| 140 | `vo.ad.simge.geri_donusum` | `assets/audio/voice/ad/simge/geri_donusum.wav` | ANLATICI | Geri dönüşüm |
| 141 | `vo.ad.simge.cop` | `assets/audio/voice/ad/simge/cop.wav` | ANLATICI | Çöp kutusu |
| 142 | `vo.ad.kutu.kagit` | `assets/audio/voice/ad/kutu/kagit.wav` | ANLATICI | Kâğıt kutusu |
| 143 | `vo.ad.kutu.plastik` | `assets/audio/voice/ad/kutu/plastik.wav` | ANLATICI | Plastik kutusu |
| 144 | `vo.ad.kutu.cam` | `assets/audio/voice/ad/kutu/cam.wav` | ANLATICI | Cam kutusu |
| 145 | `vo.ad.atik.plastik_sise` | `assets/audio/voice/ad/atik/plastik_sise.wav` | ANLATICI | Plastik şişe |
| 146 | `vo.ad.atik.gazete` | `assets/audio/voice/ad/atik/gazete.wav` | ANLATICI | Gazete |
| 147 | `vo.ad.atik.cam_sise` | `assets/audio/voice/ad/atik/cam_sise.wav` | ANLATICI | Cam şişe |
| 148 | `vo.ad.atik.pil` | `assets/audio/voice/ad/atik/pil.wav` | ANLATICI | Pil |

---
## Teslim kontrol listesi
- [ ] Dosya adları kimlikle birebir aynı (Türkçe karakter yok)
- [ ] Ses başında ve sonunda uzun sessizlik yok (gerekirse kırp)
- [ ] 005'teki aynı iki ses kullanıldı
- [ ] Commit: `assets: 084 084 hb g1 seslendirme`
