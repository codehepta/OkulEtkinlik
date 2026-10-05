# 085 · Hayat Bilgisi 2. sınıf seslendirmesi

**Öncelik: YÜKSEK** (Faz 5b, Hayat Kasabası). `content/g2/hayat_bilgisi/` ünitelerinin durak girişleri, tur yönergeleri, ipuçları, hikâye sayfaları ve soruları; ayrıca bu sınıfta ilk kez geçen nesne ve etiket adları (`vo.ad.*`, 208 satır).

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
| 1 | `vo.g2.hayat_bilgisi.u01.n01.intro` | `assets/audio/voice/g2/hayat_bilgisi/u01/n01/intro.wav` | BILGE | Günümüzü planlarsak her işe zaman kalır. Haydi, planlı bir gün nasıl olur görelim! |
| 2 | `vo.g2.hayat_bilgisi.u01.n01.r01` | `assets/audio/voice/g2/hayat_bilgisi/u01/n01/r01.wav` | ANLATICI | Bu işleri ne zaman yaparız? Sabah yaptıklarımızı doğan güneşe, akşam yaptıklarımızı aya koy. |
| 3 | `vo.g2.hayat_bilgisi.u01.n01.r02` | `assets/audio/voice/g2/hayat_bilgisi/u01/n01/r02.wav` | ANLATICI | Defne'nin gününü sıraya diz. Sabah uyanır, kahvaltı yapar, okula gider, ödevini yapar ve uyur. |
| 4 | `vo.g2.hayat_bilgisi.u01.n01.r03.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u01/n01/r03/ipucu.wav` | ANLATICI | Eşyalarını arayan biri okula yetişebilir mi? |
| 5 | `vo.g2.hayat_bilgisi.u01.n01.r03` | `assets/audio/voice/g2/hayat_bilgisi/u01/n01/r03.wav` | ANLATICI | Ali çantasını akşamdan hazırlamadı. Sabah ne olur? |
| 6 | `vo.g2.hayat_bilgisi.u01.n01.r04.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u01/n01/r04/ipucu.wav` | ANLATICI | İşlerini önceden planlayan kişi sabah rahat eder. |
| 7 | `vo.g2.hayat_bilgisi.u01.n01.r04` | `assets/audio/voice/g2/hayat_bilgisi/u01/n01/r04.wav` | ANLATICI | Ali sabahları telaşlanmak istemiyor. Bunun için ne yapmalı? |
| 8 | `vo.g2.hayat_bilgisi.u01.n02.intro` | `assets/audio/voice/g2/hayat_bilgisi/u01/n02/intro.wav` | BILGE | İyi iletişim için önce dinler, sonra konuşuruz. Haydi, nasıl iletişim kurduğumuzu görelim! |
| 9 | `vo.g2.hayat_bilgisi.u01.n02.r01.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u01/n02/r01/ipucu.wav` | ANLATICI | Arkadaşımızın sözünü kesmeyiz, bitirmesini bekleriz. |
| 10 | `vo.g2.hayat_bilgisi.u01.n02.r01` | `assets/audio/voice/g2/hayat_bilgisi/u01/n02/r01.wav` | ANLATICI | Arkadaşın konuşuyor. Sen de bir şey söylemek istiyorsun. Ne yaparsın? |
| 11 | `vo.g2.hayat_bilgisi.u01.n02.r02.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u01/n02/r02/ipucu.wav` | ANLATICI | Konuşan kişinin yüzüne bakarak dinleriz. |
| 12 | `vo.g2.hayat_bilgisi.u01.n02.r02` | `assets/audio/voice/g2/hayat_bilgisi/u01/n02/r02.wav` | ANLATICI | Öğretmenin seninle konuşuyor. Onu nasıl dinlersin? |
| 13 | `vo.g2.hayat_bilgisi.u01.n02.r03.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u01/n02/r03/ipucu.wav` | ANLATICI | Ortama uygun ses tonuyla konuşuruz. |
| 14 | `vo.g2.hayat_bilgisi.u01.n02.r03` | `assets/audio/voice/g2/hayat_bilgisi/u01/n02/r03.wav` | ANLATICI | Kütüphanedesin ve arkadaşına bir şey sormak istiyorsun. Nasıl konuşursun? |
| 15 | `vo.g2.hayat_bilgisi.u01.n03.intro` | `assets/audio/voice/g2/hayat_bilgisi/u01/n03/intro.wav` | BILGE | İyi arkadaşlar paylaşır, özür diler ve birbirini oyuna katar. Arkadaşlığımızı güçlendirelim! |
| 16 | `vo.g2.hayat_bilgisi.u01.n03.r01` | `assets/audio/voice/g2/hayat_bilgisi/u01/n03/r01.wav` | ANLATICI | Hangi davranışlar arkadaşlığı güçlendirir? Güçlendirenleri gülen yüze, üzenleri üzgün yüze koy. |
| 17 | `vo.g2.hayat_bilgisi.u01.n03.r02` | `assets/audio/voice/g2/hayat_bilgisi/u01/n03/r02.wav` | ANLATICI | Davranışları ayır: Arkadaşlığı güçlendirenler gülen yüze, üzenler üzgün yüze. |
| 18 | `vo.g2.hayat_bilgisi.u01.n03.r03.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u01/n03/r03/ipucu.wav` | ANLATICI | Bir hata yaptığımızda özür dileriz. |
| 19 | `vo.g2.hayat_bilgisi.u01.n03.r03` | `assets/audio/voice/g2/hayat_bilgisi/u01/n03/r03.wav` | ANLATICI | Yanlışlıkla arkadaşının kulesini yıktın. Ne yaparsın? |
| 20 | `vo.g2.hayat_bilgisi.u01.n03.r04.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u01/n03/r04/ipucu.wav` | ANLATICI | Sırayla oynarsak ikimiz de eğleniriz. |
| 21 | `vo.g2.hayat_bilgisi.u01.n03.r04` | `assets/audio/voice/g2/hayat_bilgisi/u01/n03/r04.wav` | ANLATICI | Arkadaşınla ikiniz de aynı salıncağa binmek istiyorsunuz. Ne yaparsınız? |
| 22 | `vo.g2.hayat_bilgisi.u02.n01.intro` | `assets/audio/voice/g2/hayat_bilgisi/u02/n01/intro.wav` | BILGE | Her gün yaptığımız şeyler büyümemizi etkiler. Sağlıklı alışkanlıkları keşfedelim! |
| 23 | `vo.g2.hayat_bilgisi.u02.n01.r01` | `assets/audio/voice/g2/hayat_bilgisi/u02/n01/r01.wav` | ANLATICI | Hangi alışkanlıklar sağlıklı? Sağlıklı olanları güçlü kalbe, sağlıksız olanları yorgun kalbe koy. |
| 24 | `vo.g2.hayat_bilgisi.u02.n01.r02` | `assets/audio/voice/g2/hayat_bilgisi/u02/n01/r02.wav` | ANLATICI | Her alışkanlığı vücudumuza yararıyla eşleştir. |
| 25 | `vo.g2.hayat_bilgisi.u02.n01.r03.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u02/n01/r03/ipucu.wav` | ANLATICI | Yeterince uyumayan biri sabah nasıl hisseder? |
| 26 | `vo.g2.hayat_bilgisi.u02.n01.r03` | `assets/audio/voice/g2/hayat_bilgisi/u02/n01/r03.wav` | ANLATICI | Zeynep her gece çok geç yatıyor. Sabah okulda nasıl olur? |
| 27 | `vo.g2.hayat_bilgisi.u02.n02.intro` | `assets/audio/voice/g2/hayat_bilgisi/u02/n02/intro.wav` | BILGE | İnternette de dikkatli oluruz. Kişisel bilgilerimizi korur, bir şey olursa büyüğümüze söyleriz. |
| 28 | `vo.g2.hayat_bilgisi.u02.n02.r01` | `assets/audio/voice/g2/hayat_bilgisi/u02/n02/r01.wav` | ANLATICI | Hangi bilgileri internette paylaşmayız? Gizli kalması gerekenleri kilide, paylaşılabilenleri kalbe koy. |
| 29 | `vo.g2.hayat_bilgisi.u02.n02.r02` | `assets/audio/voice/g2/hayat_bilgisi/u02/n02/r02.wav` | ANLATICI | Bilgileri ayır: Gizli kalması gerekenler kilide, paylaşılabilenler kalbe. |
| 30 | `vo.g2.hayat_bilgisi.u02.n02.r03.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u02/n02/r03/ipucu.wav` | ANLATICI | Tanımadığımız kişilerle yazışmaz, hemen bir büyüğümüze gösteririz. |
| 31 | `vo.g2.hayat_bilgisi.u02.n02.r03` | `assets/audio/voice/g2/hayat_bilgisi/u02/n02/r03.wav` | ANLATICI | Tanımadığın biri tablette sana yazdı: Arkadaş olalım, adresini yazar mısın? Ne yaparsın? |
| 32 | `vo.g2.hayat_bilgisi.u02.n02.r04.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u02/n02/r04/ipucu.wav` | ANLATICI | Tanımadığımız pencerelere dokunmadan önce bir büyüğümüze sorarız. |
| 33 | `vo.g2.hayat_bilgisi.u02.n02.r04` | `assets/audio/voice/g2/hayat_bilgisi/u02/n02/r04.wav` | ANLATICI | Oyun oynarken ekranda kocaman bir hediye kutusu çıktı: Hediye kazandın, dokun! Ne yaparsın? |
| 34 | `vo.g2.hayat_bilgisi.u02.n03.intro` | `assets/audio/voice/g2/hayat_bilgisi/u02/n03/intro.wav` | BILGE | Trafik levhaları bize yolda ne yapacağımızı söyler. Levhaları tanıyalım! |
| 35 | `vo.g2.hayat_bilgisi.u02.n03.r01` | `assets/audio/voice/g2/hayat_bilgisi/u02/n03/r01.wav` | ANLATICI | Dinle ve bul: Yaya geçidi levhası! |
| 36 | `vo.g2.hayat_bilgisi.u02.n03.r02` | `assets/audio/voice/g2/hayat_bilgisi/u02/n03/r02.wav` | ANLATICI | Dinle ve bul: Okul geçidi levhası! |
| 37 | `vo.g2.hayat_bilgisi.u02.n03.r03` | `assets/audio/voice/g2/hayat_bilgisi/u02/n03/r03.wav` | ANLATICI | Dinle ve bul: Bisiklet yolu levhası! |
| 38 | `vo.g2.hayat_bilgisi.u02.n03.r04` | `assets/audio/voice/g2/hayat_bilgisi/u02/n03/r04.wav` | ANLATICI | Her levhayı anlamıyla eşleştir. |
| 39 | `vo.g2.hayat_bilgisi.u02.n04.intro` | `assets/audio/voice/g2/hayat_bilgisi/u02/n04/intro.wav` | BILGE | Acil durumlarda yüz on ikiyi ararız. Görevliye doğru bilgileri sakin bir sesle veririz. |
| 40 | `vo.g2.hayat_bilgisi.u02.n04.r01` | `assets/audio/voice/g2/hayat_bilgisi/u02/n04/r01.wav` | ANLATICI | Yüz on ikiyi aradığımızda hangi bilgileri söyleriz? Söylenecekleri telefona, gereksizleri boş balona koy. |
| 41 | `vo.g2.hayat_bilgisi.u02.n04.r02.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u02/n04/r02/ipucu.wav` | ANLATICI | Sakin ve anlaşılır konuşursak görevli bize daha hızlı yardım eder. |
| 42 | `vo.g2.hayat_bilgisi.u02.n04.r02` | `assets/audio/voice/g2/hayat_bilgisi/u02/n04/r02.wav` | ANLATICI | Yüz on ikiyi aradın. Görevli seninle konuşuyor. Nasıl konuşursun? |
| 43 | `vo.g2.hayat_bilgisi.u02.n04.r03.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u02/n04/r03/ipucu.wav` | ANLATICI | Gereksiz aramalar, gerçekten yardıma ihtiyacı olanları bekletir. |
| 44 | `vo.g2.hayat_bilgisi.u02.n04.r03` | `assets/audio/voice/g2/hayat_bilgisi/u02/n04/r03.wav` | ANLATICI | Arkadaşın şaka olsun diye yüz on ikiyi aramak istiyor. Ne yaparsın? |
| 45 | `vo.g2.hayat_bilgisi.u03.n01.intro` | `assets/audio/voice/g2/hayat_bilgisi/u03/n01/intro.wav` | BILGE | Ailemiz bize sevgi verir, bizi korur ve bize birçok şey öğretir. Hikâyeleri dinleyelim. |
| 46 | `vo.g2.hayat_bilgisi.u03.n01.r01.p1` | `assets/audio/voice/g2/hayat_bilgisi/u03/n01/r01/p1.wav` | ANLATICI | Can bisikletten düştü ve dizi kanadı. |
| 47 | `vo.g2.hayat_bilgisi.u03.n01.r01.p2` | `assets/audio/voice/g2/hayat_bilgisi/u03/n01/r01/p2.wav` | ANLATICI | Babası yarasını temizledi. Ablası ona en sevdiği masalı okudu. |
| 48 | `vo.g2.hayat_bilgisi.u03.n01.r01.p3` | `assets/audio/voice/g2/hayat_bilgisi/u03/n01/r01/p3.wav` | ANLATICI | Can, ailesinin yanında kendini güvende hissetti. |
| 49 | `vo.g2.hayat_bilgisi.u03.n01.r01.s1` | `assets/audio/voice/g2/hayat_bilgisi/u03/n01/r01/s1.wav` | ANLATICI | Can düştüğünde ailesi ne yaptı? |
| 50 | `vo.g2.hayat_bilgisi.u03.n01.r01.s2` | `assets/audio/voice/g2/hayat_bilgisi/u03/n01/r01/s2.wav` | ANLATICI | Can, ailesinin yanında nasıl hissetti? |
| 51 | `vo.g2.hayat_bilgisi.u03.n01.r01` | `assets/audio/voice/g2/hayat_bilgisi/u03/n01/r01.wav` | ANLATICI | Hikâyeyi dinle, sonra soruları cevapla. |
| 52 | `vo.g2.hayat_bilgisi.u03.n01.r02.p1` | `assets/audio/voice/g2/hayat_bilgisi/u03/n01/r02/p1.wav` | ANLATICI | Defne'nin dedesi ona bahçede fidan dikmeyi öğretti. |
| 53 | `vo.g2.hayat_bilgisi.u03.n01.r02.p2` | `assets/audio/voice/g2/hayat_bilgisi/u03/n01/r02/p2.wav` | ANLATICI | Annesi ona sabırlı olmayı, babası paylaşmayı öğretti. |
| 54 | `vo.g2.hayat_bilgisi.u03.n01.r02.p3` | `assets/audio/voice/g2/hayat_bilgisi/u03/n01/r02/p3.wav` | ANLATICI | Ailemiz bize sevgi verir ve yeni şeyler öğretir. |
| 55 | `vo.g2.hayat_bilgisi.u03.n01.r02.s1` | `assets/audio/voice/g2/hayat_bilgisi/u03/n01/r02/s1.wav` | ANLATICI | Defne dedesinden ne öğrendi? |
| 56 | `vo.g2.hayat_bilgisi.u03.n01.r02.s2` | `assets/audio/voice/g2/hayat_bilgisi/u03/n01/r02/s2.wav` | ANLATICI | Ailemiz bize neler verir? Sevgi ve destek mi, yalnızlık mı? |
| 57 | `vo.g2.hayat_bilgisi.u03.n01.r02` | `assets/audio/voice/g2/hayat_bilgisi/u03/n01/r02.wav` | ANLATICI | Hikâyeyi dinle, sonra soruları cevapla. |
| 58 | `vo.g2.hayat_bilgisi.u03.n01.r03.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u03/n01/r03/ipucu.wav` | ANLATICI | Ailede birbirimize destek oluruz. |
| 59 | `vo.g2.hayat_bilgisi.u03.n01.r03` | `assets/audio/voice/g2/hayat_bilgisi/u03/n01/r03.wav` | ANLATICI | Annen hasta ve yatakta dinleniyor. Ailene destek olmak için ne yaparsın? |
| 60 | `vo.g2.hayat_bilgisi.u03.n02.intro` | `assets/audio/voice/g2/hayat_bilgisi/u03/n02/intro.wav` | BILGE | Sırada beklemek, yer vermek ve sessiz olmak nezakettir. Toplum içinde nasıl davranırız? |
| 61 | `vo.g2.hayat_bilgisi.u03.n02.r01.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u03/n02/r01/ipucu.wav` | ANLATICI | Sıramızı bekleriz. |
| 62 | `vo.g2.hayat_bilgisi.u03.n02.r01` | `assets/audio/voice/g2/hayat_bilgisi/u03/n02/r01.wav` | ANLATICI | Fırında ekmek almak için sıra var. Ne yaparsın? |
| 63 | `vo.g2.hayat_bilgisi.u03.n02.r02.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u03/n02/r02/ipucu.wav` | ANLATICI | Yaşlılara, hastalara ve hamilelere yer veririz. |
| 64 | `vo.g2.hayat_bilgisi.u03.n02.r02` | `assets/audio/voice/g2/hayat_bilgisi/u03/n02/r02.wav` | ANLATICI | Otobüste yaşlı bir teyze ayakta duruyor, sen oturuyorsun. Ne yaparsın? |
| 65 | `vo.g2.hayat_bilgisi.u03.n02.r03.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u03/n02/r03/ipucu.wav` | ANLATICI | Kütüphanede başkalarını rahatsız etmemek için sessiz oluruz. |
| 66 | `vo.g2.hayat_bilgisi.u03.n02.r03` | `assets/audio/voice/g2/hayat_bilgisi/u03/n02/r03.wav` | ANLATICI | Kütüphanedesin. Nasıl davranırsın? |
| 67 | `vo.g2.hayat_bilgisi.u03.n03.intro` | `assets/audio/voice/g2/hayat_bilgisi/u03/n03/intro.wav` | BILGE | Evimizde, okulumuzda ve mahallemizde de sorumluluklarımız var. Neler yapabiliriz? |
| 68 | `vo.g2.hayat_bilgisi.u03.n03.r01.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u03/n03/r01/ipucu.wav` | ANLATICI | Ortak alanları temiz tutmak hepimizin sorumluluğudur. |
| 69 | `vo.g2.hayat_bilgisi.u03.n03.r01` | `assets/audio/voice/g2/hayat_bilgisi/u03/n03/r01.wav` | ANLATICI | Parkta yerde bir çöp gördün. Ne yaparsın? |
| 70 | `vo.g2.hayat_bilgisi.u03.n03.r02.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u03/n03/r02/ipucu.wav` | ANLATICI | Üstlendiğimiz görevi yerine getiririz. |
| 71 | `vo.g2.hayat_bilgisi.u03.n03.r02` | `assets/audio/voice/g2/hayat_bilgisi/u03/n03/r02.wav` | ANLATICI | Sınıfça okul bahçesindeki çiçeklerin bakımını üstlendiniz. Çiçekler susuz kalmış. Ne yaparsın? |
| 72 | `vo.g2.hayat_bilgisi.u03.n03.r03.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u03/n03/r03/ipucu.wav` | ANLATICI | Komşularımıza, ailemizle birlikte yardım edebiliriz. |
| 73 | `vo.g2.hayat_bilgisi.u03.n03.r03` | `assets/audio/voice/g2/hayat_bilgisi/u03/n03/r03.wav` | ANLATICI | Yaşlı komşunuz ağır poşetlerle merdivenleri çıkıyor. Ne yaparsın? |
| 74 | `vo.g2.hayat_bilgisi.u04.n01.intro` | `assets/audio/voice/g2/hayat_bilgisi/u04/n01/intro.wav` | BILGE | Mahallemizi ve ilimizi kimler yönetir? Bunu öğrenmek için doğru kaynakları seçelim. |
| 75 | `vo.g2.hayat_bilgisi.u04.n01.r01.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u04/n01/r01/ipucu.wav` | ANLATICI | Mahalleyi muhtar yönetir. Muhtarın çalıştığı yeri düşün. |
| 76 | `vo.g2.hayat_bilgisi.u04.n01.r01` | `assets/audio/voice/g2/hayat_bilgisi/u04/n01/r01.wav` | ANLATICI | Mahallemizin muhtarı kim? Bunu öğrenmek için nereye gidebilirsin? |
| 77 | `vo.g2.hayat_bilgisi.u04.n01.r02.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u04/n01/r02/ipucu.wav` | ANLATICI | Bilgi veren kitaplar doğru kaynaktır. |
| 78 | `vo.g2.hayat_bilgisi.u04.n01.r02` | `assets/audio/voice/g2/hayat_bilgisi/u04/n01/r02.wav` | ANLATICI | İlimizi kimin yönettiğini araştırıyorsun. Hangi kaynak işine yarar? |
| 79 | `vo.g2.hayat_bilgisi.u04.n01.r03.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u04/n01/r03/ipucu.wav` | ANLATICI | Belediyenin kendi internet sitesine ailemizle birlikte bakabiliriz. |
| 80 | `vo.g2.hayat_bilgisi.u04.n01.r03` | `assets/audio/voice/g2/hayat_bilgisi/u04/n01/r03.wav` | ANLATICI | Belediyenin yeni parkı ne zaman yapacağını öğrenmek istiyorsun. Nereden bakarsın? |
| 81 | `vo.g2.hayat_bilgisi.u04.n02.intro` | `assets/audio/voice/g2/hayat_bilgisi/u04/n02/intro.wav` | BILGE | Mustafa Kemal çok çalışkan bir öğrenciydi. Onun okul yıllarını dinleyelim. |
| 82 | `vo.g2.hayat_bilgisi.u04.n02.r01.p1` | `assets/audio/voice/g2/hayat_bilgisi/u04/n02/r01/p1.wav` | ANLATICI | Mustafa, okula önce mahalle mektebinde başladı. Sonra babası onu Şemsi Efendi Okulu'na yazdırdı. |
| 83 | `vo.g2.hayat_bilgisi.u04.n02.r01.p2` | `assets/audio/voice/g2/hayat_bilgisi/u04/n02/r01/p2.wav` | ANLATICI | Daha sonra Selanik Askerî Rüştiyesi'ne girdi. Matematik öğretmeni onun başarısını görünce ona Kemal adını verdi. |
| 84 | `vo.g2.hayat_bilgisi.u04.n02.r01.p3` | `assets/audio/voice/g2/hayat_bilgisi/u04/n02/r01/p3.wav` | ANLATICI | Mustafa Kemal derslerine çok çalışan, başarılı ve kararlı bir öğrenciydi. |
| 85 | `vo.g2.hayat_bilgisi.u04.n02.r01.s1` | `assets/audio/voice/g2/hayat_bilgisi/u04/n02/r01/s1.wav` | ANLATICI | Mustafa'ya Kemal adını kim verdi? Matematik öğretmeni mi, sınıf arkadaşı mı? |
| 86 | `vo.g2.hayat_bilgisi.u04.n02.r01.s2` | `assets/audio/voice/g2/hayat_bilgisi/u04/n02/r01/s2.wav` | ANLATICI | Mustafa Kemal nasıl bir öğrenciydi? Tembel mi, çalışkan mı? |
| 87 | `vo.g2.hayat_bilgisi.u04.n02.r01` | `assets/audio/voice/g2/hayat_bilgisi/u04/n02/r01.wav` | ANLATICI | Hikâyeyi dinle, sonra soruları cevapla. |
| 88 | `vo.g2.hayat_bilgisi.u04.n02.r02` | `assets/audio/voice/g2/hayat_bilgisi/u04/n02/r02.wav` | ANLATICI | Mustafa Kemal'in okullarını sıraya diz. İlk okulu mahalle mektebiydi. |
| 89 | `vo.g2.hayat_bilgisi.u04.n02.r03` | `assets/audio/voice/g2/hayat_bilgisi/u04/n02/r03.wav` | ANLATICI | Mustafa Kemal'in okullarını baştan sona sıraya diz. |
| 90 | `vo.g2.hayat_bilgisi.u04.n03.intro` | `assets/audio/voice/g2/hayat_bilgisi/u04/n03/intro.wav` | BILGE | Millî bayramlarımız bize tarihimizi hatırlatır. Bu bayramlar neden önemli? Dinleyelim. |
| 91 | `vo.g2.hayat_bilgisi.u04.n03.r01.p1` | `assets/audio/voice/g2/hayat_bilgisi/u04/n03/r01/p1.wav` | ANLATICI | 23 Nisan 1920'de Ankara'da Türkiye Büyük Millet Meclisi açıldı. |
| 92 | `vo.g2.hayat_bilgisi.u04.n03.r01.p2` | `assets/audio/voice/g2/hayat_bilgisi/u04/n03/r01/p2.wav` | ANLATICI | Atatürk bu günü bayram olarak çocuklara armağan etti. 23 Nisan'da dünyanın birçok yerinden çocuklar ülkemize gelir. |
| 93 | `vo.g2.hayat_bilgisi.u04.n03.r01.s1` | `assets/audio/voice/g2/hayat_bilgisi/u04/n03/r01/s1.wav` | ANLATICI | Atatürk 23 Nisan'ı kimlere armağan etti? |
| 94 | `vo.g2.hayat_bilgisi.u04.n03.r01.s2` | `assets/audio/voice/g2/hayat_bilgisi/u04/n03/r01/s2.wav` | ANLATICI | 23 Nisan'da hangisi açıldı? |
| 95 | `vo.g2.hayat_bilgisi.u04.n03.r01` | `assets/audio/voice/g2/hayat_bilgisi/u04/n03/r01.wav` | ANLATICI | Hikâyeyi dinle, sonra soruları cevapla. |
| 96 | `vo.g2.hayat_bilgisi.u04.n03.r02.p1` | `assets/audio/voice/g2/hayat_bilgisi/u04/n03/r02/p1.wav` | ANLATICI | 29 Ekim 1923'te Cumhuriyet ilan edildi. Cumhuriyette halk, kendini yönetecek kişileri seçer. |
| 97 | `vo.g2.hayat_bilgisi.u04.n03.r02.p2` | `assets/audio/voice/g2/hayat_bilgisi/u04/n03/r02/p2.wav` | ANLATICI | Her yıl 29 Ekim'de evleri ve sokakları bayraklarla süsler, Cumhuriyet Bayramı'nı coşkuyla kutlarız. |
| 98 | `vo.g2.hayat_bilgisi.u04.n03.r02.s1` | `assets/audio/voice/g2/hayat_bilgisi/u04/n03/r02/s1.wav` | ANLATICI | 29 Ekim'de ne ilan edildi? Cumhuriyet mi, tatil mi? |
| 99 | `vo.g2.hayat_bilgisi.u04.n03.r02.s2` | `assets/audio/voice/g2/hayat_bilgisi/u04/n03/r02/s2.wav` | ANLATICI | Cumhuriyet Bayramı'nda sokakları en çok neyle süsleriz? |
| 100 | `vo.g2.hayat_bilgisi.u04.n03.r02` | `assets/audio/voice/g2/hayat_bilgisi/u04/n03/r02.wav` | ANLATICI | Hikâyeyi dinle, sonra soruları cevapla. |
| 101 | `vo.g2.hayat_bilgisi.u04.n03.r03` | `assets/audio/voice/g2/hayat_bilgisi/u04/n03/r03.wav` | ANLATICI | Her millî bayramı kendi kutlamasıyla eşleştir. |
| 102 | `vo.g2.hayat_bilgisi.u04.n04.intro` | `assets/audio/voice/g2/hayat_bilgisi/u04/n04/intro.wav` | BILGE | Ramazan Bayramı ve Kurban Bayramı'nda büyüklerimizi ziyaret eder, paylaşırız. Dinleyelim. |
| 103 | `vo.g2.hayat_bilgisi.u04.n04.r01.p1` | `assets/audio/voice/g2/hayat_bilgisi/u04/n04/r01/p1.wav` | ANLATICI | Ramazan Bayramı sabahı Elif ve ailesi büyüklerini ziyarete gitti. |
| 104 | `vo.g2.hayat_bilgisi.u04.n04.r01.p2` | `assets/audio/voice/g2/hayat_bilgisi/u04/n04/r01/p2.wav` | ANLATICI | Elif dedesinin elini öptü. Küs olan iki komşu da bayramda barıştı. |
| 105 | `vo.g2.hayat_bilgisi.u04.n04.r01.s1` | `assets/audio/voice/g2/hayat_bilgisi/u04/n04/r01/s1.wav` | ANLATICI | Elif bayramda kimleri ziyaret etti? |
| 106 | `vo.g2.hayat_bilgisi.u04.n04.r01.s2` | `assets/audio/voice/g2/hayat_bilgisi/u04/n04/r01/s2.wav` | ANLATICI | Bayramlar insanlar arasında neyi güçlendirir? Sevgi ve dostluğu mu, küslüğü mü? |
| 107 | `vo.g2.hayat_bilgisi.u04.n04.r01` | `assets/audio/voice/g2/hayat_bilgisi/u04/n04/r01.wav` | ANLATICI | Hikâyeyi dinle, sonra soruları cevapla. |
| 108 | `vo.g2.hayat_bilgisi.u04.n04.r02.p1` | `assets/audio/voice/g2/hayat_bilgisi/u04/n04/r02/p1.wav` | ANLATICI | Kurban Bayramı'nda Ali'nin ailesi, ihtiyacı olan komşularıyla yiyeceklerini paylaştı. |
| 109 | `vo.g2.hayat_bilgisi.u04.n04.r02.p2` | `assets/audio/voice/g2/hayat_bilgisi/u04/n04/r02/p2.wav` | ANLATICI | Paylaşmak insanları birbirine yaklaştırır ve herkesi mutlu eder. |
| 110 | `vo.g2.hayat_bilgisi.u04.n04.r02.s1` | `assets/audio/voice/g2/hayat_bilgisi/u04/n04/r02/s1.wav` | ANLATICI | Ali'nin ailesi bayramda ne yaptı? |
| 111 | `vo.g2.hayat_bilgisi.u04.n04.r02.s2` | `assets/audio/voice/g2/hayat_bilgisi/u04/n04/r02/s2.wav` | ANLATICI | Paylaşmak insanları ne yapar? Birbirine yaklaştırır mı, uzaklaştırır mı? |
| 112 | `vo.g2.hayat_bilgisi.u04.n04.r02` | `assets/audio/voice/g2/hayat_bilgisi/u04/n04/r02.wav` | ANLATICI | Hikâyeyi dinle, sonra soruları cevapla. |
| 113 | `vo.g2.hayat_bilgisi.u04.n04.r03.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u04/n04/r03/ipucu.wav` | ANLATICI | Bayramda büyüklerimizle bayramlaşırız. |
| 114 | `vo.g2.hayat_bilgisi.u04.n04.r03` | `assets/audio/voice/g2/hayat_bilgisi/u04/n04/r03.wav` | ANLATICI | Bayramda dedeni ziyarete gittiniz. Dedeni görünce ne yaparsın? |
| 115 | `vo.g2.hayat_bilgisi.u05.n01.intro` | `assets/audio/voice/g2/hayat_bilgisi/u05/n01/intro.wav` | BILGE | Her mevsimin havası farklıdır. Kış karlı, yaz sıcak! Hava olaylarını mevsimlerle eşleştirelim. |
| 116 | `vo.g2.hayat_bilgisi.u05.n01.r01` | `assets/audio/voice/g2/hayat_bilgisi/u05/n01/r01.wav` | ANLATICI | Bu resimler hangi mevsimi anlatıyor? Kışa ait olanları karlı ağaca, yaza ait olanları güneşe koy. |
| 117 | `vo.g2.hayat_bilgisi.u05.n01.r02` | `assets/audio/voice/g2/hayat_bilgisi/u05/n01/r02.wav` | ANLATICI | İlkbahar mı, sonbahar mı? İlkbahara ait olanları çiçekli ağaca, sonbahara ait olanları sararan ağaca koy. |
| 118 | `vo.g2.hayat_bilgisi.u05.n01.r03` | `assets/audio/voice/g2/hayat_bilgisi/u05/n01/r03.wav` | ANLATICI | Her mevsimi onun hava olayıyla eşleştir. |
| 119 | `vo.g2.hayat_bilgisi.u05.n02.intro` | `assets/audio/voice/g2/hayat_bilgisi/u05/n02/intro.wav` | BILGE | Güneş doğudan doğar, batıdan batar. Doğa bize yönümüzü bulmada ipuçları verir! |
| 120 | `vo.g2.hayat_bilgisi.u05.n02.r01` | `assets/audio/voice/g2/hayat_bilgisi/u05/n02/r01.wav` | ANLATICI | Güneş doğudan doğar, batıdan batar. Her resmi doğru yönle eşleştir. |
| 121 | `vo.g2.hayat_bilgisi.u05.n02.r02` | `assets/audio/voice/g2/hayat_bilgisi/u05/n02/r02.wav` | ANLATICI | Her ipucunu doğru yönle eşleştir. Kutup Yıldızı kuzeyi gösterir. |
| 122 | `vo.g2.hayat_bilgisi.u05.n02.r03.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u05/n02/r03/ipucu.wav` | ANLATICI | Güneş her sabah aynı yönden doğar. |
| 123 | `vo.g2.hayat_bilgisi.u05.n02.r03` | `assets/audio/voice/g2/hayat_bilgisi/u05/n02/r03.wav` | ANLATICI | Sabah güneş tepelerin arkasından doğuyor. Güneşin doğduğu yön hangisi? Doğu mu, batı mı, kuzey mi? |
| 124 | `vo.g2.hayat_bilgisi.u05.n02.r04.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u05/n02/r04/ipucu.wav` | ANLATICI | Yosunlar genellikle ağaçların güneş almayan, kuzeye bakan yüzünde yetişir. |
| 125 | `vo.g2.hayat_bilgisi.u05.n02.r04` | `assets/audio/voice/g2/hayat_bilgisi/u05/n02/r04.wav` | ANLATICI | Ormanda bir ağaç gördün. Yosunlar ağacın tek bir yüzünde. Yosunlu yüz hangi yönü gösterir? Kuzey mi, güney mi, doğu mu? |
| 126 | `vo.g2.hayat_bilgisi.u05.n03.intro` | `assets/audio/voice/g2/hayat_bilgisi/u05/n03/intro.wav` | BILGE | Afetlere karşı ne yapmamız gerektiğini doğru kaynaklardan öğreniriz. Haydi araştıralım! |
| 127 | `vo.g2.hayat_bilgisi.u05.n03.r01.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u05/n03/r01/ipucu.wav` | ANLATICI | Bu konuyu en iyi afetlerde çalışan görevliler bilir. |
| 128 | `vo.g2.hayat_bilgisi.u05.n03.r01` | `assets/audio/voice/g2/hayat_bilgisi/u05/n03/r01.wav` | ANLATICI | Depreme karşı neler yapmamız gerektiğini öğrenmek istiyorsun. Kime sorabilirsin? |
| 129 | `vo.g2.hayat_bilgisi.u05.n03.r02.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u05/n03/r02/ipucu.wav` | ANLATICI | Resmî kurumların hazırladığı bilgi broşürleri güvenilir kaynaktır. |
| 130 | `vo.g2.hayat_bilgisi.u05.n03.r02` | `assets/audio/voice/g2/hayat_bilgisi/u05/n03/r02.wav` | ANLATICI | Sel hakkında doğru bilgiyi nereden bulursun? |
| 131 | `vo.g2.hayat_bilgisi.u05.n03.r03` | `assets/audio/voice/g2/hayat_bilgisi/u05/n03/r03.wav` | ANLATICI | Bu bilgiler doğru mu? Depremde doğru olan davranışları gülen yüze, yanlış olanları üzgün yüze koy. |
| 132 | `vo.g2.hayat_bilgisi.u05.n04.intro` | `assets/audio/voice/g2/hayat_bilgisi/u05/n04/intro.wav` | BILGE | Su, elektrik ve kâğıt değerlidir. Onları tasarruflu kullanırsak doğayı koruruz. |
| 133 | `vo.g2.hayat_bilgisi.u05.n04.r01.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u05/n04/r01/ipucu.wav` | ANLATICI | Kullanmadığımız suyu boşa akıtmayız. |
| 134 | `vo.g2.hayat_bilgisi.u05.n04.r01` | `assets/audio/voice/g2/hayat_bilgisi/u05/n04/r01.wav` | ANLATICI | Dişlerini fırçalarken musluk açık kalmış. Ne yaparsın? |
| 135 | `vo.g2.hayat_bilgisi.u05.n04.r02.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u05/n04/r02/ipucu.wav` | ANLATICI | Boş odada ışık yakmayız. |
| 136 | `vo.g2.hayat_bilgisi.u05.n04.r02` | `assets/audio/voice/g2/hayat_bilgisi/u05/n04/r02.wav` | ANLATICI | Odadan çıkıyorsun ama ışık açık. Ne yaparsın? |
| 137 | `vo.g2.hayat_bilgisi.u05.n04.r03` | `assets/audio/voice/g2/hayat_bilgisi/u05/n04/r03.wav` | ANLATICI | Hangi davranışlar tasarruflu? Tasarruflu olanları yaprağa, israf olanları damlayan musluğa koy. |
| 138 | `vo.g2.hayat_bilgisi.u06.n01.intro` | `assets/audio/voice/g2/hayat_bilgisi/u06/n01/intro.wav` | BILGE | Bilim insanları dünyamızı değiştiren buluşlar yapar. Onları hangi kaynaklardan öğrenebiliriz? |
| 139 | `vo.g2.hayat_bilgisi.u06.n01.r01.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u06/n01/r01/ipucu.wav` | ANLATICI | Kitapların olduğu yeri düşün. |
| 140 | `vo.g2.hayat_bilgisi.u06.n01.r01` | `assets/audio/voice/g2/hayat_bilgisi/u06/n01/r01.wav` | ANLATICI | Ünlü bir bilim insanının hayatını öğrenmek istiyorsun. Nereye gidersin? |
| 141 | `vo.g2.hayat_bilgisi.u06.n01.r02.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u06/n01/r02/ipucu.wav` | ANLATICI | Bilgi veren kitaplar bilim insanlarını anlatır. |
| 142 | `vo.g2.hayat_bilgisi.u06.n01.r02` | `assets/audio/voice/g2/hayat_bilgisi/u06/n01/r02.wav` | ANLATICI | Bilim insanımız Aziz Sancar'ın çalışmalarını araştırıyorsun. Hangi kaynak işine yarar? |
| 143 | `vo.g2.hayat_bilgisi.u06.n01.r03.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u06/n01/r03/ipucu.wav` | ANLATICI | İnternette ailemizle birlikte, güvenilir sitelerde araştırırız. |
| 144 | `vo.g2.hayat_bilgisi.u06.n01.r03` | `assets/audio/voice/g2/hayat_bilgisi/u06/n01/r03.wav` | ANLATICI | İnternette bilim insanlarını araştıracaksın. Nasıl araştırırsın? |
| 145 | `vo.g2.hayat_bilgisi.u06.n02.intro` | `assets/audio/voice/g2/hayat_bilgisi/u06/n02/intro.wav` | BILGE | Telefonlar ve lambalar zamanla değişti. Eskiden yeniye nasıl değiştiklerini görelim! |
| 146 | `vo.g2.hayat_bilgisi.u06.n02.r01` | `assets/audio/voice/g2/hayat_bilgisi/u06/n02/r01.wav` | ANLATICI | Telefonları eskiden yeniye sırala. |
| 147 | `vo.g2.hayat_bilgisi.u06.n02.r02` | `assets/audio/voice/g2/hayat_bilgisi/u06/n02/r02.wav` | ANLATICI | Aydınlatma araçlarını eskiden yeniye sırala. |
| 148 | `vo.g2.hayat_bilgisi.u06.n02.r03.ipucu` | `assets/audio/voice/g2/hayat_bilgisi/u06/n02/r03/ipucu.wav` | ANLATICI | Telefonlar hep küçülüp daha akıllı hâle geldi. |
| 149 | `vo.g2.hayat_bilgisi.u06.n02.r03` | `assets/audio/voice/g2/hayat_bilgisi/u06/n02/r03.wav` | ANLATICI | Telefonlar zamanla küçüldü, hafifledi ve daha çok iş yapmaya başladı. Gelecekte telefonlar nasıl olabilir? |
| 150 | `vo.g2.hayat_bilgisi.u06.n03.intro` | `assets/audio/voice/g2/hayat_bilgisi/u06/n03/intro.wav` | BILGE | Müzik, resim, ebru ve tiyatro birer sanattır. Sanat günlük hayatımızın her yerinde! |
| 151 | `vo.g2.hayat_bilgisi.u06.n03.r01` | `assets/audio/voice/g2/hayat_bilgisi/u06/n03/r01.wav` | ANLATICI | Sanat hayatımızda! Dinle ve bul: Müzik yapan çocuk! |
| 152 | `vo.g2.hayat_bilgisi.u06.n03.r02` | `assets/audio/voice/g2/hayat_bilgisi/u06/n03/r02.wav` | ANLATICI | Sanat eşyalarını ayır: Müzik eşyalarını notaya, resim eşyalarını palete koy. |
| 153 | `vo.g2.hayat_bilgisi.u06.n03.r03` | `assets/audio/voice/g2/hayat_bilgisi/u06/n03/r03.wav` | ANLATICI | Sanat dallarını ayır: müzik notaya, resim palete, tiyatro maskelere. |
| 154 | `vo.ad.simge.sabah` | `assets/audio/voice/ad/simge/sabah.wav` | ANLATICI | Sabah |
| 155 | `vo.ad.simge.aksam` | `assets/audio/voice/ad/simge/aksam.wav` | ANLATICI | Akşam |
| 156 | `vo.ad.aliskanlik.spor` | `assets/audio/voice/ad/aliskanlik/spor.wav` | ANLATICI | Spor yapmak |
| 157 | `vo.ad.aliskanlik.erken_yat` | `assets/audio/voice/ad/aliskanlik/erken_yat.wav` | ANLATICI | Erken yatmak |
| 158 | `vo.ad.aliskanlik.dis_fircala` | `assets/audio/voice/ad/aliskanlik/dis_fircala.wav` | ANLATICI | Diş fırçalamak |
| 159 | `vo.ad.simge.gizli` | `assets/audio/voice/ad/simge/gizli.wav` | ANLATICI | Gizli kalmalı |
| 160 | `vo.ad.simge.paylasilir` | `assets/audio/voice/ad/simge/paylasilir.wav` | ANLATICI | Paylaşılabilir |
| 161 | `vo.ad.levha.yaya_gecidi` | `assets/audio/voice/ad/levha/yaya_gecidi.wav` | ANLATICI | Yaya geçidi levhası |
| 162 | `vo.ad.levha.okul_gecidi` | `assets/audio/voice/ad/levha/okul_gecidi.wav` | ANLATICI | Okul geçidi levhası |
| 163 | `vo.ad.levha.bisiklet_yolu` | `assets/audio/voice/ad/levha/bisiklet_yolu.wav` | ANLATICI | Bisiklet yolu levhası |
| 164 | `vo.ad.levha.isikli_isaret` | `assets/audio/voice/ad/levha/isikli_isaret.wav` | ANLATICI | Işıklı işaret cihazı levhası |
| 165 | `vo.ad.simge.soyle` | `assets/audio/voice/ad/simge/soyle.wav` | ANLATICI | 112'ye söylenir |
| 166 | `vo.ad.simge.gereksiz` | `assets/audio/voice/ad/simge/gereksiz.wav` | ANLATICI | Gereksiz bilgi |
| 167 | `vo.ad.etiket.sevgi_destek` | `assets/audio/voice/ad/etiket/sevgi_destek.wav` | ANLATICI | Sevgi ve destek |
| 168 | `vo.ad.etiket.yalnizlik` | `assets/audio/voice/ad/etiket/yalnizlik.wav` | ANLATICI | Yalnızlık |
| 169 | `vo.ad.etiket.mat_ogretmeni` | `assets/audio/voice/ad/etiket/mat_ogretmeni.wav` | ANLATICI | Matematik öğretmeni |
| 170 | `vo.ad.etiket.sinif_arkadasi` | `assets/audio/voice/ad/etiket/sinif_arkadasi.wav` | ANLATICI | Sınıf arkadaşı |
| 171 | `vo.ad.etiket.tembel` | `assets/audio/voice/ad/etiket/tembel.wav` | ANLATICI | Tembel |
| 172 | `vo.ad.etiket.caliskan` | `assets/audio/voice/ad/etiket/caliskan.wav` | ANLATICI | Çalışkan |
| 173 | `vo.ad.etiket.mahalle_mektebi` | `assets/audio/voice/ad/etiket/mahalle_mektebi.wav` | ANLATICI | Mahalle Mektebi |
| 174 | `vo.ad.etiket.semsi_efendi` | `assets/audio/voice/ad/etiket/semsi_efendi.wav` | ANLATICI | Şemsi Efendi Okulu |
| 175 | `vo.ad.etiket.askeri_rustiye` | `assets/audio/voice/ad/etiket/askeri_rustiye.wav` | ANLATICI | Askerî Rüştiye |
| 176 | `vo.ad.etiket.askeri_idadi` | `assets/audio/voice/ad/etiket/askeri_idadi.wav` | ANLATICI | Askerî İdadi |
| 177 | `vo.ad.etiket.harp_okulu` | `assets/audio/voice/ad/etiket/harp_okulu.wav` | ANLATICI | Harp Okulu |
| 178 | `vo.ad.etiket.tatil` | `assets/audio/voice/ad/etiket/tatil.wav` | ANLATICI | Tatil |
| 179 | `vo.ad.etiket.cumhuriyet` | `assets/audio/voice/ad/etiket/cumhuriyet.wav` | ANLATICI | Cumhuriyet |
| 180 | `vo.ad.etiket.23_nisan` | `assets/audio/voice/ad/etiket/23_nisan.wav` | ANLATICI | 23 Nisan |
| 181 | `vo.ad.etiket.19_mayis` | `assets/audio/voice/ad/etiket/19_mayis.wav` | ANLATICI | 19 Mayıs |
| 182 | `vo.ad.etiket.29_ekim` | `assets/audio/voice/ad/etiket/29_ekim.wav` | ANLATICI | 29 Ekim |
| 183 | `vo.ad.etiket.30_agustos` | `assets/audio/voice/ad/etiket/30_agustos.wav` | ANLATICI | 30 Ağustos |
| 184 | `vo.ad.etiket.sevgi_dostluk` | `assets/audio/voice/ad/etiket/sevgi_dostluk.wav` | ANLATICI | Sevgi ve dostluk |
| 185 | `vo.ad.etiket.kusluk` | `assets/audio/voice/ad/etiket/kusluk.wav` | ANLATICI | Küslük |
| 186 | `vo.ad.etiket.yaklastirir` | `assets/audio/voice/ad/etiket/yaklastirir.wav` | ANLATICI | Yaklaştırır |
| 187 | `vo.ad.etiket.uzaklastirir` | `assets/audio/voice/ad/etiket/uzaklastirir.wav` | ANLATICI | Uzaklaştırır |
| 188 | `vo.ad.simge.kis` | `assets/audio/voice/ad/simge/kis.wav` | ANLATICI | Kış |
| 189 | `vo.ad.simge.yaz` | `assets/audio/voice/ad/simge/yaz.wav` | ANLATICI | Yaz |
| 190 | `vo.ad.simge.ilkbahar` | `assets/audio/voice/ad/simge/ilkbahar.wav` | ANLATICI | İlkbahar |
| 191 | `vo.ad.simge.sonbahar` | `assets/audio/voice/ad/simge/sonbahar.wav` | ANLATICI | Sonbahar |
| 192 | `vo.ad.etiket.kis` | `assets/audio/voice/ad/etiket/kis.wav` | ANLATICI | Kış |
| 193 | `vo.ad.etiket.ilkbahar` | `assets/audio/voice/ad/etiket/ilkbahar.wav` | ANLATICI | İlkbahar |
| 194 | `vo.ad.etiket.yaz` | `assets/audio/voice/ad/etiket/yaz.wav` | ANLATICI | Yaz |
| 195 | `vo.ad.etiket.sonbahar` | `assets/audio/voice/ad/etiket/sonbahar.wav` | ANLATICI | Sonbahar |
| 196 | `vo.ad.yon.gunes_dogusu` | `assets/audio/voice/ad/yon/gunes_dogusu.wav` | ANLATICI | Güneşin doğuşu |
| 197 | `vo.ad.etiket.dogu` | `assets/audio/voice/ad/etiket/dogu.wav` | ANLATICI | Doğu |
| 198 | `vo.ad.yon.gunes_batisi` | `assets/audio/voice/ad/yon/gunes_batisi.wav` | ANLATICI | Güneşin batışı |
| 199 | `vo.ad.etiket.bati` | `assets/audio/voice/ad/etiket/bati.wav` | ANLATICI | Batı |
| 200 | `vo.ad.yon.kutup_yildizi` | `assets/audio/voice/ad/yon/kutup_yildizi.wav` | ANLATICI | Kutup Yıldızı |
| 201 | `vo.ad.etiket.kuzey` | `assets/audio/voice/ad/etiket/kuzey.wav` | ANLATICI | Kuzey |
| 202 | `vo.ad.etiket.guney` | `assets/audio/voice/ad/etiket/guney.wav` | ANLATICI | Güney |
| 203 | `vo.ad.simge.tasarruf` | `assets/audio/voice/ad/simge/tasarruf.wav` | ANLATICI | Tasarruflu |
| 204 | `vo.ad.simge.israf` | `assets/audio/voice/ad/simge/israf.wav` | ANLATICI | İsraf |
| 205 | `vo.ad.sanat.muzik_yapan` | `assets/audio/voice/ad/sanat/muzik_yapan.wav` | ANLATICI | Müzik yapan çocuk |
| 206 | `vo.ad.simge.muzik` | `assets/audio/voice/ad/simge/muzik.wav` | ANLATICI | Müzik |
| 207 | `vo.ad.simge.resim` | `assets/audio/voice/ad/simge/resim.wav` | ANLATICI | Resim |
| 208 | `vo.ad.simge.tiyatro` | `assets/audio/voice/ad/simge/tiyatro.wav` | ANLATICI | Tiyatro |

---
## Teslim kontrol listesi
- [ ] Dosya adları kimlikle birebir aynı (Türkçe karakter yok)
- [ ] Ses başında ve sonunda uzun sessizlik yok (gerekirse kırp)
- [ ] 005'teki aynı iki ses kullanıldı
- [ ] Commit: `assets: 085 085 hb g2 seslendirme`
