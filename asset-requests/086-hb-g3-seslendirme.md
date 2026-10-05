# 086 · Hayat Bilgisi 3. sınıf seslendirmesi

**Öncelik: YÜKSEK** (Faz 5b, Hayat Kasabası). `content/g3/hayat_bilgisi/` ünitelerinin durak girişleri, tur yönergeleri, ipuçları, hikâye sayfaları ve soruları; ayrıca bu sınıfta ilk kez geçen nesne ve etiket adları (`vo.ad.*`, 183 satır).

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
| 1 | `vo.g3.hayat_bilgisi.u01.n01.intro` | `assets/audio/voice/g3/hayat_bilgisi/u01/n01/intro.wav` | BILGE | Okulda haklarımız da var, sorumluluklarımız da. Haklarımızı bilir, sorumluluklarımızı yerine getiririz. |
| 2 | `vo.g3.hayat_bilgisi.u01.n01.r01` | `assets/audio/voice/g3/hayat_bilgisi/u01/n01/r01.wav` | ANLATICI | Okulda hangileri hakkımız, hangileri sorumluluğumuz? Hakları kalbe, sorumlulukları çantaya koy. |
| 3 | `vo.g3.hayat_bilgisi.u01.n01.r02.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u01/n01/r02/ipucu.wav` | ANLATICI | Aldığımız kitabı özenle kullanır, zamanında teslim ederiz. |
| 4 | `vo.g3.hayat_bilgisi.u01.n01.r02` | `assets/audio/voice/g3/hayat_bilgisi/u01/n01/r02.wav` | ANLATICI | Okul kütüphanesinden aldığın kitabı teslim etme günü geldi. Ne yaparsın? |
| 5 | `vo.g3.hayat_bilgisi.u01.n01.r03.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u01/n01/r03/ipucu.wav` | ANLATICI | Oy kullanmak hepimizin hakkıdır, bu hakkı kendimiz kullanırız. |
| 6 | `vo.g3.hayat_bilgisi.u01.n01.r03` | `assets/audio/voice/g3/hayat_bilgisi/u01/n01/r03.wav` | ANLATICI | Sınıf başkanlığı seçimi var. Senin de oy kullanma hakkın var. Ne yaparsın? |
| 7 | `vo.g3.hayat_bilgisi.u01.n01.r04.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u01/n01/r04/ipucu.wav` | ANLATICI | Herkesin hakkına saygı gösteren çözümü düşün. |
| 8 | `vo.g3.hayat_bilgisi.u01.n01.r04` | `assets/audio/voice/g3/hayat_bilgisi/u01/n01/r04.wav` | ANLATICI | Teneffüste bir arkadaşın tek topu kimseye vermiyor. Herkesin oyun hakkı var. Ne önerirsin? |
| 9 | `vo.g3.hayat_bilgisi.u02.n01.intro` | `assets/audio/voice/g3/hayat_bilgisi/u02/n01/intro.wav` | BILGE | Uykumuz, beslenmemiz, temizliğimiz ve giysilerimiz sağlığımızı etkiler. Davranışlarımızı düzenleyelim! |
| 10 | `vo.g3.hayat_bilgisi.u02.n01.r01` | `assets/audio/voice/g3/hayat_bilgisi/u02/n01/r01.wav` | ANLATICI | Hangi davranışlar sağlığımızı korur? Koruyanları güçlü kalbe, bozanları yorgun kalbe koy. |
| 11 | `vo.g3.hayat_bilgisi.u02.n01.r02.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u02/n01/r02/ipucu.wav` | ANLATICI | Mevsime uygun giyinirsek hastalanmayız. |
| 12 | `vo.g3.hayat_bilgisi.u02.n01.r02` | `assets/audio/voice/g3/hayat_bilgisi/u02/n01/r02.wav` | ANLATICI | Dışarıda kar yağıyor ve okula gideceksin. Nasıl giyinirsin? |
| 13 | `vo.g3.hayat_bilgisi.u02.n01.r03.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u02/n01/r03/ipucu.wav` | ANLATICI | Gözlerimizi dinlendirmek ve hareket etmek sağlığımızı korur. |
| 14 | `vo.g3.hayat_bilgisi.u02.n01.r03` | `assets/audio/voice/g3/hayat_bilgisi/u02/n01/r03.wav` | ANLATICI | Uzun süre ekran başında kaldın, gözlerin yoruldu. Sağlığını korumak için ne yaparsın? |
| 15 | `vo.g3.hayat_bilgisi.u02.n02.intro` | `assets/audio/voice/g3/hayat_bilgisi/u02/n02/intro.wav` | BILGE | Güvenliğimizi tehdit eden durumları tanır, ne yapmamız gerektiğini düşünürüz. Haydi, dikkatli olalım! |
| 16 | `vo.g3.hayat_bilgisi.u02.n02.r01.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u02/n02/r01/ipucu.wav` | ANLATICI | Elektrik prizleri çok tehlikelidir. |
| 17 | `vo.g3.hayat_bilgisi.u02.n02.r01` | `assets/audio/voice/g3/hayat_bilgisi/u02/n02/r01.wav` | ANLATICI | Bu resimlerden hangisi güvenliğini tehdit eden bir durum? |
| 18 | `vo.g3.hayat_bilgisi.u02.n02.r02` | `assets/audio/voice/g3/hayat_bilgisi/u02/n02/r02.wav` | ANLATICI | Bu bilgiler doğru mu? Güvenli davranışları gülen yüze, tehlikeli olanları üzgün yüze koy. |
| 19 | `vo.g3.hayat_bilgisi.u02.n02.r03.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u02/n02/r03/ipucu.wav` | ANLATICI | Evde yalnızken kapıyı açmayız, ailemize haber veririz. |
| 20 | `vo.g3.hayat_bilgisi.u02.n02.r03` | `assets/audio/voice/g3/hayat_bilgisi/u02/n02/r03.wav` | ANLATICI | Evde yalnızsın ve kapı çaldı. Kapıdaki kişi kargo getirdim, aç diyor. Ne yapmalısın? |
| 21 | `vo.g3.hayat_bilgisi.u02.n03.intro` | `assets/audio/voice/g3/hayat_bilgisi/u02/n03/intro.wav` | BILGE | Trafik kuralları hepimizi korur. Kurala uyunca neler olduğunu birlikte düşünelim. |
| 22 | `vo.g3.hayat_bilgisi.u02.n03.r01.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u02/n03/r01/ipucu.wav` | ANLATICI | Kurallar, araçlar ve yayalar güvende olsun diye vardır. |
| 23 | `vo.g3.hayat_bilgisi.u02.n03.r01` | `assets/audio/voice/g3/hayat_bilgisi/u02/n03/r01.wav` | ANLATICI | Neden kırmızı ışıkta bekler, yeşil ışıkta geçeriz? |
| 24 | `vo.g3.hayat_bilgisi.u02.n03.r02` | `assets/audio/voice/g3/hayat_bilgisi/u02/n03/r02.wav` | ANLATICI | Her trafik kuralını sağladığı güvenlikle eşleştir. |
| 25 | `vo.g3.hayat_bilgisi.u02.n03.r03` | `assets/audio/voice/g3/hayat_bilgisi/u02/n03/r03.wav` | ANLATICI | Her trafik kuralını sağladığı güvenlikle eşleştir. |
| 26 | `vo.g3.hayat_bilgisi.u03.n01.intro` | `assets/audio/voice/g3/hayat_bilgisi/u03/n01/intro.wav` | BILGE | Aileler bir araya gelince toplum oluşur. Ailede öğrendiklerimizi toplumda da yaşarız. |
| 27 | `vo.g3.hayat_bilgisi.u03.n01.r01` | `assets/audio/voice/g3/hayat_bilgisi/u03/n01/r01.wav` | ANLATICI | Bu resimler ailede mi, toplumda mı? Aile resimlerini eve, toplum resimlerini mahalleye koy. |
| 28 | `vo.g3.hayat_bilgisi.u03.n01.r02` | `assets/audio/voice/g3/hayat_bilgisi/u03/n01/r02.wav` | ANLATICI | Ailede öğrendiğimiz her davranışı, toplumdaki karşılığıyla eşleştir. |
| 29 | `vo.g3.hayat_bilgisi.u03.n01.r03.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u03/n01/r03/ipucu.wav` | ANLATICI | Ailelerin bir araya gelmesiyle toplum oluşur. |
| 30 | `vo.g3.hayat_bilgisi.u03.n01.r03` | `assets/audio/voice/g3/hayat_bilgisi/u03/n01/r03.wav` | ANLATICI | Birçok aile bir araya gelince ne oluşur? |
| 31 | `vo.g3.hayat_bilgisi.u03.n02.intro` | `assets/audio/voice/g3/hayat_bilgisi/u03/n02/intro.wav` | BILGE | Her meslek toplum için çok önemlidir. Meslekleri ve topluma katkılarını keşfedelim! |
| 32 | `vo.g3.hayat_bilgisi.u03.n02.r01.p1` | `assets/audio/voice/g3/hayat_bilgisi/u03/n02/r01/p1.wav` | ANLATICI | Sabah fırıncı ekmeklerimizi pişirdi. Şoför bizi okula götürdü. |
| 33 | `vo.g3.hayat_bilgisi.u03.n02.r01.p2` | `assets/audio/voice/g3/hayat_bilgisi/u03/n02/r01/p2.wav` | ANLATICI | Öğretmen bize okumayı öğretti. Akşam doktor, hasta komşumuzu muayene etti. |
| 34 | `vo.g3.hayat_bilgisi.u03.n02.r01.s1` | `assets/audio/voice/g3/hayat_bilgisi/u03/n02/r01/s1.wav` | ANLATICI | Ekmeklerimizi kim pişirdi? |
| 35 | `vo.g3.hayat_bilgisi.u03.n02.r01.s2` | `assets/audio/voice/g3/hayat_bilgisi/u03/n02/r01/s2.wav` | ANLATICI | Hasta komşumuzu kim muayene etti? |
| 36 | `vo.g3.hayat_bilgisi.u03.n02.r01` | `assets/audio/voice/g3/hayat_bilgisi/u03/n02/r01.wav` | ANLATICI | Hikâyeyi dinle, sonra soruları cevapla. |
| 37 | `vo.g3.hayat_bilgisi.u03.n02.r02.p1` | `assets/audio/voice/g3/hayat_bilgisi/u03/n02/r02/p1.wav` | ANLATICI | Hayat Kasabası'nda temizlik işçileri her sabah çöpleri toplar. |
| 38 | `vo.g3.hayat_bilgisi.u03.n02.r02.p2` | `assets/audio/voice/g3/hayat_bilgisi/u03/n02/r02/p2.wav` | ANLATICI | Bir hafta temizlik işçileri gelemedi. Sokaklar çöple doldu, kötü kokular yayıldı. |
| 39 | `vo.g3.hayat_bilgisi.u03.n02.r02.p3` | `assets/audio/voice/g3/hayat_bilgisi/u03/n02/r02/p3.wav` | ANLATICI | Kasabadakiler, her mesleğin toplum için ne kadar önemli olduğunu anladı. |
| 40 | `vo.g3.hayat_bilgisi.u03.n02.r02.s1` | `assets/audio/voice/g3/hayat_bilgisi/u03/n02/r02/s1.wav` | ANLATICI | Temizlik işçileri gelemeyince ne oldu? |
| 41 | `vo.g3.hayat_bilgisi.u03.n02.r02.s2` | `assets/audio/voice/g3/hayat_bilgisi/u03/n02/r02/s2.wav` | ANLATICI | Bu hikâye bize ne anlatıyor? Her meslek önemlidir mi, bazı meslekler gereksizdir mi? |
| 42 | `vo.g3.hayat_bilgisi.u03.n02.r02` | `assets/audio/voice/g3/hayat_bilgisi/u03/n02/r02.wav` | ANLATICI | Hikâyeyi dinle, sonra soruları cevapla. |
| 43 | `vo.g3.hayat_bilgisi.u03.n02.r03` | `assets/audio/voice/g3/hayat_bilgisi/u03/n02/r03.wav` | ANLATICI | Her mesleği topluma katkısıyla eşleştir. |
| 44 | `vo.g3.hayat_bilgisi.u04.n01.intro` | `assets/audio/voice/g3/hayat_bilgisi/u04/n01/intro.wav` | BILGE | Tarihî mekânlar ve doğal güzellikler hepimizindir. Onları korursak gelecekte de görebiliriz. |
| 45 | `vo.g3.hayat_bilgisi.u04.n01.r01` | `assets/audio/voice/g3/hayat_bilgisi/u04/n01/r01.wav` | ANLATICI | Hangi davranışlar tarihî mekânları ve doğayı korur? Koruyanları gülen yüze, zarar verenleri üzgün yüze koy. |
| 46 | `vo.g3.hayat_bilgisi.u04.n01.r02.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u04/n01/r02/ipucu.wav` | ANLATICI | Tarihî eserler yüzlerce yıldır bizi bekliyor. Onlara zarar vermeyiz. |
| 47 | `vo.g3.hayat_bilgisi.u04.n01.r02` | `assets/audio/voice/g3/hayat_bilgisi/u04/n01/r02.wav` | ANLATICI | Tarihî bir kaleyi geziyorsunuz. Arkadaşın taşlara adını kazımak istiyor. Ne yaparsın? |
| 48 | `vo.g3.hayat_bilgisi.u04.n01.r03.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u04/n01/r03/ipucu.wav` | ANLATICI | Korunan yerler gelecekte de güzel kalır. |
| 49 | `vo.g3.hayat_bilgisi.u04.n01.r03` | `assets/audio/voice/g3/hayat_bilgisi/u04/n01/r03.wav` | ANLATICI | Herkes tarihî mekânları ve doğal güzellikleri korursa ne olur? |
| 50 | `vo.g3.hayat_bilgisi.u04.n02.intro` | `assets/audio/voice/g3/hayat_bilgisi/u04/n02/intro.wav` | BILGE | Ülkemizin yönetim şekli cumhuriyettir. Bu konuda bilgiyi doğru kaynaklardan toplayalım! |
| 51 | `vo.g3.hayat_bilgisi.u04.n02.r01.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u04/n02/r01/ipucu.wav` | ANLATICI | Bilgi veren kaynakları düşün. |
| 52 | `vo.g3.hayat_bilgisi.u04.n02.r01` | `assets/audio/voice/g3/hayat_bilgisi/u04/n02/r01.wav` | ANLATICI | Ülkemizin yönetim şeklini öğrenmek istiyorsun. Hangi kaynağa bakarsın? |
| 53 | `vo.g3.hayat_bilgisi.u04.n02.r02.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u04/n02/r02/ipucu.wav` | ANLATICI | Meclisin kendisini ziyaret etmek güzel bir bilgi kaynağıdır. |
| 54 | `vo.g3.hayat_bilgisi.u04.n02.r02` | `assets/audio/voice/g3/hayat_bilgisi/u04/n02/r02.wav` | ANLATICI | Türkiye Büyük Millet Meclisi hakkında bilgi toplamak için nereyi ziyaret edebilirsin? |
| 55 | `vo.g3.hayat_bilgisi.u04.n02.r03.p1` | `assets/audio/voice/g3/hayat_bilgisi/u04/n02/r03/p1.wav` | ANLATICI | Ülkemizin yönetim şekli cumhuriyettir. |
| 56 | `vo.g3.hayat_bilgisi.u04.n02.r03.p2` | `assets/audio/voice/g3/hayat_bilgisi/u04/n02/r03/p2.wav` | ANLATICI | Cumhuriyette halk, yöneticilerini seçimle belirler. Milletvekilleri Türkiye Büyük Millet Meclisi'nde halk adına karar verir. |
| 57 | `vo.g3.hayat_bilgisi.u04.n02.r03.s1` | `assets/audio/voice/g3/hayat_bilgisi/u04/n02/r03/s1.wav` | ANLATICI | Ülkemizin yönetim şekli nedir? Krallık mı, cumhuriyet mi? |
| 58 | `vo.g3.hayat_bilgisi.u04.n02.r03.s2` | `assets/audio/voice/g3/hayat_bilgisi/u04/n02/r03/s2.wav` | ANLATICI | Cumhuriyette yöneticileri kim seçer? Halk mı, tek bir kişi mi? |
| 59 | `vo.g3.hayat_bilgisi.u04.n02.r03` | `assets/audio/voice/g3/hayat_bilgisi/u04/n02/r03.wav` | ANLATICI | Ansiklopediden okuduklarını dinle, sonra soruları cevapla. |
| 60 | `vo.g3.hayat_bilgisi.u04.n03.intro` | `assets/audio/voice/g3/hayat_bilgisi/u04/n03/intro.wav` | BILGE | Atatürk çalışkan, cesur ve ileri görüşlüydü. Bu özellikleri onun başarılarına nasıl yol açtı? |
| 61 | `vo.g3.hayat_bilgisi.u04.n03.r01.p1` | `assets/audio/voice/g3/hayat_bilgisi/u04/n03/r01/p1.wav` | ANLATICI | Mustafa Kemal küçükken çok çalışkandı. Matematik öğretmeni onun başarısını görünce ona Kemal adını verdi. |
| 62 | `vo.g3.hayat_bilgisi.u04.n03.r01.p2` | `assets/audio/voice/g3/hayat_bilgisi/u04/n03/r01/p2.wav` | ANLATICI | Kurtuluş Savaşı'nda cesur ve kararlıydı. Milletimizle birlikte zafere ulaştı. |
| 63 | `vo.g3.hayat_bilgisi.u04.n03.r01.p3` | `assets/audio/voice/g3/hayat_bilgisi/u04/n03/r01/p3.wav` | ANLATICI | İleri görüşlüydü. Ülkemizin geleceğini düşünerek Cumhuriyet'i kurdu ve eğitime çok önem verdi. |
| 64 | `vo.g3.hayat_bilgisi.u04.n03.r01.s1` | `assets/audio/voice/g3/hayat_bilgisi/u04/n03/r01/s1.wav` | ANLATICI | Mustafa Kemal'e Kemal adı neden verildi? Çok çalışkan olduğu için mi, çok konuştuğu için mi? |
| 65 | `vo.g3.hayat_bilgisi.u04.n03.r01.s2` | `assets/audio/voice/g3/hayat_bilgisi/u04/n03/r01/s2.wav` | ANLATICI | Kurtuluş Savaşı'nda nasıl davrandı? Cesur ve kararlı mı, kararsız mı? |
| 66 | `vo.g3.hayat_bilgisi.u04.n03.r01` | `assets/audio/voice/g3/hayat_bilgisi/u04/n03/r01.wav` | ANLATICI | Hikâyeyi dinle, sonra soruları cevapla. |
| 67 | `vo.g3.hayat_bilgisi.u04.n03.r02` | `assets/audio/voice/g3/hayat_bilgisi/u04/n03/r02.wav` | ANLATICI | Atatürk'ün her özelliğini, o özelliğin getirdiği başarıyla eşleştir. |
| 68 | `vo.g3.hayat_bilgisi.u04.n03.r03` | `assets/audio/voice/g3/hayat_bilgisi/u04/n03/r03.wav` | ANLATICI | Atatürk'ün her özelliğini, o özelliğin getirdiği başarıyla eşleştir. |
| 69 | `vo.g3.hayat_bilgisi.u04.n04.intro` | `assets/audio/voice/g3/hayat_bilgisi/u04/n04/intro.wav` | BILGE | Birlik olursak her zorluğu aşarız. Millî birlik ve beraberliğimiz ülkemizi güçlendirir. |
| 70 | `vo.g3.hayat_bilgisi.u04.n04.r01` | `assets/audio/voice/g3/hayat_bilgisi/u04/n04/r01.wav` | ANLATICI | Hangi olaylar birliğimizi güçlendirir? Güçlendirenleri birleşen ellere, güçlendirmeyenleri yalnız ele koy. |
| 71 | `vo.g3.hayat_bilgisi.u04.n04.r02.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u04/n04/r02/ipucu.wav` | ANLATICI | Zor günlerde birbirimize destek oluruz. |
| 72 | `vo.g3.hayat_bilgisi.u04.n04.r02` | `assets/audio/voice/g3/hayat_bilgisi/u04/n04/r02.wav` | ANLATICI | Bir şehrimizde deprem oldu. Okulunuzda yardım kampanyası başladı. Ne yaparsın? |
| 73 | `vo.g3.hayat_bilgisi.u04.n04.r03.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u04/n04/r03/ipucu.wav` | ANLATICI | Birlikte yapılan iş büyük sonuçlar doğurur. |
| 74 | `vo.g3.hayat_bilgisi.u04.n04.r03` | `assets/audio/voice/g3/hayat_bilgisi/u04/n04/r03.wav` | ANLATICI | Sınıfça birlik olup okul bahçesine fidan diktiniz. Birkaç yıl sonra ne olur? |
| 75 | `vo.g3.hayat_bilgisi.u05.n01.intro` | `assets/audio/voice/g3/hayat_bilgisi/u05/n01/intro.wav` | BILGE | Ağaçlar, arılar, toprak ve hayvanlar hayatımız için çok önemli. Doğanın bize verdiklerini keşfedelim! |
| 76 | `vo.g3.hayat_bilgisi.u05.n01.r01.p1` | `assets/audio/voice/g3/hayat_bilgisi/u05/n01/r01/p1.wav` | ANLATICI | Ormanda ağaçlar bize temiz hava verir. |
| 77 | `vo.g3.hayat_bilgisi.u05.n01.r01.p2` | `assets/audio/voice/g3/hayat_bilgisi/u05/n01/r01/p2.wav` | ANLATICI | Arılar çiçeklerden bal yapar. Dereler tarlalara su taşır. |
| 78 | `vo.g3.hayat_bilgisi.u05.n01.r01.s1` | `assets/audio/voice/g3/hayat_bilgisi/u05/n01/r01/s1.wav` | ANLATICI | Arılar bize ne verir? |
| 79 | `vo.g3.hayat_bilgisi.u05.n01.r01.s2` | `assets/audio/voice/g3/hayat_bilgisi/u05/n01/r01/s2.wav` | ANLATICI | Ağaçlar bize ne verir? |
| 80 | `vo.g3.hayat_bilgisi.u05.n01.r01` | `assets/audio/voice/g3/hayat_bilgisi/u05/n01/r01.wav` | ANLATICI | Hikâyeyi dinle, sonra soruları cevapla. |
| 81 | `vo.g3.hayat_bilgisi.u05.n01.r02.p1` | `assets/audio/voice/g3/hayat_bilgisi/u05/n01/r02/p1.wav` | ANLATICI | Çiftlikte toprak, sebze ve meyvelerin yetişmesini sağlar. |
| 82 | `vo.g3.hayat_bilgisi.u05.n01.r02.p2` | `assets/audio/voice/g3/hayat_bilgisi/u05/n01/r02/p2.wav` | ANLATICI | İnekler bize süt verir. Güneş bitkilerin büyümesine yardım eder. |
| 83 | `vo.g3.hayat_bilgisi.u05.n01.r02.s1` | `assets/audio/voice/g3/hayat_bilgisi/u05/n01/r02/s1.wav` | ANLATICI | İnekler bize ne verir? |
| 84 | `vo.g3.hayat_bilgisi.u05.n01.r02.s2` | `assets/audio/voice/g3/hayat_bilgisi/u05/n01/r02/s2.wav` | ANLATICI | Sebze ve meyveler nerede yetişir? |
| 85 | `vo.g3.hayat_bilgisi.u05.n01.r02` | `assets/audio/voice/g3/hayat_bilgisi/u05/n01/r02.wav` | ANLATICI | Hikâyeyi dinle, sonra soruları cevapla. |
| 86 | `vo.g3.hayat_bilgisi.u05.n01.r03` | `assets/audio/voice/g3/hayat_bilgisi/u05/n01/r03.wav` | ANLATICI | Doğadaki her varlığı bize sağladığı yararla eşleştir. |
| 87 | `vo.g3.hayat_bilgisi.u05.n02.intro` | `assets/audio/voice/g3/hayat_bilgisi/u05/n02/intro.wav` | BILGE | Kroki, bir yerin basit çizimidir. Kırmızı yıldız, bulunduğun yeri gösteriyor. Haydi, krokiyi okuyalım! |
| 88 | `vo.g3.hayat_bilgisi.u05.n02.r01.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u05/n02/r01/ipucu.wav` | ANLATICI | Yıldızın yanındaki ağaçlara ve kaydırağa bak. |
| 89 | `vo.g3.hayat_bilgisi.u05.n02.r01` | `assets/audio/voice/g3/hayat_bilgisi/u05/n02/r01.wav` | ANLATICI | Krokide kırmızı yıldız senin yerini gösteriyor. Neredesin? |
| 90 | `vo.g3.hayat_bilgisi.u05.n02.r02.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u05/n02/r02/ipucu.wav` | ANLATICI | Yıldız, bayraklı binanın üstünde. |
| 91 | `vo.g3.hayat_bilgisi.u05.n02.r02` | `assets/audio/voice/g3/hayat_bilgisi/u05/n02/r02.wav` | ANLATICI | Krokiye bak. Kırmızı yıldız şimdi nerede? Neredesin? |
| 92 | `vo.g3.hayat_bilgisi.u05.n02.r03` | `assets/audio/voice/g3/hayat_bilgisi/u05/n02/r03.wav` | ANLATICI | Fırının yanında olduğunu gösteren krokiyi bul. Dinle ve bul: Fırının yanı! |
| 93 | `vo.g3.hayat_bilgisi.u05.n03.intro` | `assets/audio/voice/g3/hayat_bilgisi/u05/n03/intro.wav` | BILGE | Afetlerden önce hazırlanır, afet anında doğru davranır, sonrasında güvenli yerde buluşuruz. |
| 94 | `vo.g3.hayat_bilgisi.u05.n03.r01` | `assets/audio/voice/g3/hayat_bilgisi/u05/n03/r01.wav` | ANLATICI | Bu davranışlar afetten önce mi, afet anında mı? Öncesini çantaya, anını masa altındaki kaplumbağaya koy. |
| 95 | `vo.g3.hayat_bilgisi.u05.n03.r02` | `assets/audio/voice/g3/hayat_bilgisi/u05/n03/r02.wav` | ANLATICI | Davranışları ayır: afet öncesi çantaya, afet anı kaplumbağaya, afet sonrası toplanma alanına. |
| 96 | `vo.g3.hayat_bilgisi.u05.n03.r03` | `assets/audio/voice/g3/hayat_bilgisi/u05/n03/r03.wav` | ANLATICI | Her davranışı doğru etiketle eşleştir: afet öncesi, afet anı ya da afet sonrası. |
| 97 | `vo.g3.hayat_bilgisi.u05.n04.intro` | `assets/audio/voice/g3/hayat_bilgisi/u05/n04/intro.wav` | BILGE | Doğayı korumak için doğru bilgiye ihtiyacımız var. Bilgiyi hangi kaynaklardan toplarız? |
| 98 | `vo.g3.hayat_bilgisi.u05.n04.r01.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u05/n04/r01/ipucu.wav` | ANLATICI | Bu konuyu en iyi çevre uzmanları bilir. |
| 99 | `vo.g3.hayat_bilgisi.u05.n04.r01` | `assets/audio/voice/g3/hayat_bilgisi/u05/n04/r01.wav` | ANLATICI | Dereleri ve suyu nasıl koruyacağımızı öğrenmek istiyorsun. Kime sorabilirsin? |
| 100 | `vo.g3.hayat_bilgisi.u05.n04.r02.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u05/n04/r02/ipucu.wav` | ANLATICI | Konuyu bilen ve sana açıklayabilecek birini düşün. |
| 101 | `vo.g3.hayat_bilgisi.u05.n04.r02` | `assets/audio/voice/g3/hayat_bilgisi/u05/n04/r02.wav` | ANLATICI | Okulunuzda sıfır atık hakkında bilgi toplayacaksınız. Kime sorarsınız? |
| 102 | `vo.g3.hayat_bilgisi.u05.n04.r03.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u05/n04/r03/ipucu.wav` | ANLATICI | Bir bilgiyi güvenilir başka kaynaklarla karşılaştırırız. |
| 103 | `vo.g3.hayat_bilgisi.u05.n04.r03` | `assets/audio/voice/g3/hayat_bilgisi/u05/n04/r03.wav` | ANLATICI | İnternette doğa ile ilgili ilginç bir bilgi buldun. Bu bilginin doğru olup olmadığını nasıl anlarsın? |
| 104 | `vo.g3.hayat_bilgisi.u06.n01.intro` | `assets/audio/voice/g3/hayat_bilgisi/u06/n01/intro.wav` | BILGE | Bilim insanlarının buluşları hayatımızı kolaylaştırır. Bilimsel gelişmelerin etkilerini inceleyelim! |
| 105 | `vo.g3.hayat_bilgisi.u06.n01.r01.p1` | `assets/audio/voice/g3/hayat_bilgisi/u06/n01/r01/p1.wav` | ANLATICI | Eskiden insanlar birçok hastalıktan korunamıyordu. |
| 106 | `vo.g3.hayat_bilgisi.u06.n01.r01.p2` | `assets/audio/voice/g3/hayat_bilgisi/u06/n01/r01/p2.wav` | ANLATICI | Bilim insanları aşıyı geliştirdi. Artık aşı sayesinde birçok hastalıktan korunuyoruz. |
| 107 | `vo.g3.hayat_bilgisi.u06.n01.r01.s1` | `assets/audio/voice/g3/hayat_bilgisi/u06/n01/r01/s1.wav` | ANLATICI | Aşı bize nasıl yardım eder? Hastalıklardan korur mu, uykumuzu getirir mi? |
| 108 | `vo.g3.hayat_bilgisi.u06.n01.r01` | `assets/audio/voice/g3/hayat_bilgisi/u06/n01/r01.wav` | ANLATICI | Hikâyeyi dinle, sonra soruları cevapla. |
| 109 | `vo.g3.hayat_bilgisi.u06.n01.r02.p1` | `assets/audio/voice/g3/hayat_bilgisi/u06/n01/r02/p1.wav` | ANLATICI | Elektrik kullanılmaya başlanınca geceleri evlerimiz aydınlandı. |
| 110 | `vo.g3.hayat_bilgisi.u06.n01.r02.p2` | `assets/audio/voice/g3/hayat_bilgisi/u06/n01/r02/p2.wav` | ANLATICI | Buzdolabı sayesinde yiyeceklerimiz bozulmadan uzun süre taze kalır. |
| 111 | `vo.g3.hayat_bilgisi.u06.n01.r02.s1` | `assets/audio/voice/g3/hayat_bilgisi/u06/n01/r02/s1.wav` | ANLATICI | Elektrik geceleri hayatımızı nasıl değiştirdi? |
| 112 | `vo.g3.hayat_bilgisi.u06.n01.r02.s2` | `assets/audio/voice/g3/hayat_bilgisi/u06/n01/r02/s2.wav` | ANLATICI | Buzdolabı ne işe yarar? Yiyecekleri taze tutar mı, ısıtır mı? |
| 113 | `vo.g3.hayat_bilgisi.u06.n01.r02` | `assets/audio/voice/g3/hayat_bilgisi/u06/n01/r02.wav` | ANLATICI | Hikâyeyi dinle, sonra soruları cevapla. |
| 114 | `vo.g3.hayat_bilgisi.u06.n01.r03` | `assets/audio/voice/g3/hayat_bilgisi/u06/n01/r03.wav` | ANLATICI | Her bilimsel gelişmeyi günlük yaşama etkisiyle eşleştir. |
| 115 | `vo.g3.hayat_bilgisi.u06.n02.intro` | `assets/audio/voice/g3/hayat_bilgisi/u06/n02/intro.wav` | BILGE | Teknoloji geliştikçe hayatımız değişir. Eskiden ve bugün kullandığımız araçları karşılaştıralım! |
| 116 | `vo.g3.hayat_bilgisi.u06.n02.r01` | `assets/audio/voice/g3/hayat_bilgisi/u06/n02/r01.wav` | ANLATICI | Bu araçlar eski mi, yeni mi? Eskileri kum saatine, yenileri parıltıya koy. |
| 117 | `vo.g3.hayat_bilgisi.u06.n02.r02` | `assets/audio/voice/g3/hayat_bilgisi/u06/n02/r02.wav` | ANLATICI | Her eski aracı, onun yerini alan yeni araçla eşleştir. |
| 118 | `vo.g3.hayat_bilgisi.u06.n02.r03.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u06/n02/r03/ipucu.wav` | ANLATICI | Makine çamaşırı yıkarken insanların zamanı ne olur? |
| 119 | `vo.g3.hayat_bilgisi.u06.n02.r03` | `assets/audio/voice/g3/hayat_bilgisi/u06/n02/r03.wav` | ANLATICI | Çamaşır makinesi kullanılmaya başlanınca günlük yaşam nasıl değişti? |
| 120 | `vo.g3.hayat_bilgisi.u06.n03.intro` | `assets/audio/voice/g3/hayat_bilgisi/u06/n03/intro.wav` | BILGE | Ressamlar, müzisyenler ve mimarlar sanatımıza büyük katkı yaptı. Onları nereden öğreniriz? |
| 121 | `vo.g3.hayat_bilgisi.u06.n03.r01.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u06/n03/r01/ipucu.wav` | ANLATICI | Tablolar sergilenen yeri düşün. |
| 122 | `vo.g3.hayat_bilgisi.u06.n03.r01` | `assets/audio/voice/g3/hayat_bilgisi/u06/n03/r01.wav` | ANLATICI | Ressam Osman Hamdi Bey'in tablolarını görmek istiyorsun. Nereye gidersin? |
| 123 | `vo.g3.hayat_bilgisi.u06.n03.r02.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u06/n03/r02/ipucu.wav` | ANLATICI | Sanatçıları anlatan kitapları düşün. |
| 124 | `vo.g3.hayat_bilgisi.u06.n03.r02` | `assets/audio/voice/g3/hayat_bilgisi/u06/n03/r02.wav` | ANLATICI | Âşık Veysel'in türkülerini ve hayatını araştırıyorsun. Hangi kaynak işine yarar? |
| 125 | `vo.g3.hayat_bilgisi.u06.n03.r03.ipucu` | `assets/audio/voice/g3/hayat_bilgisi/u06/n03/r03/ipucu.wav` | ANLATICI | Bir mimarın eserini en iyi yerinde görerek tanırız. |
| 126 | `vo.g3.hayat_bilgisi.u06.n03.r03` | `assets/audio/voice/g3/hayat_bilgisi/u06/n03/r03.wav` | ANLATICI | Mimar Sinan'ın eserlerini yakından tanımak istiyorsun. Ne yapabilirsin? |
| 127 | `vo.ad.simge.hak` | `assets/audio/voice/ad/simge/hak.wav` | ANLATICI | Hak |
| 128 | `vo.ad.simge.sorumluluk` | `assets/audio/voice/ad/simge/sorumluluk.wav` | ANLATICI | Sorumluluk |
| 129 | `vo.ad.trafik.emniyet_kemeri` | `assets/audio/voice/ad/trafik/emniyet_kemeri.wav` | ANLATICI | Emniyet kemerini takmak |
| 130 | `vo.ad.trafik.kask_tak` | `assets/audio/voice/ad/trafik/kask_tak.wav` | ANLATICI | Kask takmak |
| 131 | `vo.ad.trafik.yaya_gecidi` | `assets/audio/voice/ad/trafik/yaya_gecidi.wav` | ANLATICI | Yaya geçidinden geçmek |
| 132 | `vo.ad.trafik.yelek` | `assets/audio/voice/ad/trafik/yelek.wav` | ANLATICI | Yansıtıcı yelek giymek |
| 133 | `vo.ad.simge.aile` | `assets/audio/voice/ad/simge/aile.wav` | ANLATICI | Aile |
| 134 | `vo.ad.simge.toplum` | `assets/audio/voice/ad/simge/toplum.wav` | ANLATICI | Toplum |
| 135 | `vo.ad.aile.evde_paylas` | `assets/audio/voice/ad/aile/evde_paylas.wav` | ANLATICI | Evde paylaşmak |
| 136 | `vo.ad.aile.evi_temizle` | `assets/audio/voice/ad/aile/evi_temizle.wav` | ANLATICI | Evi birlikte temizlemek |
| 137 | `vo.ad.aile.buyuge_saygi` | `assets/audio/voice/ad/aile/buyuge_saygi.wav` | ANLATICI | Evde büyüklere saygı |
| 138 | `vo.ad.etiket.her_meslek` | `assets/audio/voice/ad/etiket/her_meslek.wav` | ANLATICI | Her meslek önemlidir |
| 139 | `vo.ad.etiket.bazi_meslek` | `assets/audio/voice/ad/etiket/bazi_meslek.wav` | ANLATICI | Bazı meslekler gereksizdir |
| 140 | `vo.ad.meslek.ciftci` | `assets/audio/voice/ad/meslek/ciftci.wav` | ANLATICI | Çiftçi |
| 141 | `vo.ad.meslek.doktor` | `assets/audio/voice/ad/meslek/doktor.wav` | ANLATICI | Doktor |
| 142 | `vo.ad.meslek.itfaiyeci` | `assets/audio/voice/ad/meslek/itfaiyeci.wav` | ANLATICI | İtfaiyeci |
| 143 | `vo.ad.meslek.ogretmen` | `assets/audio/voice/ad/meslek/ogretmen.wav` | ANLATICI | Öğretmen |
| 144 | `vo.ad.etiket.krallik` | `assets/audio/voice/ad/etiket/krallik.wav` | ANLATICI | Krallık |
| 145 | `vo.ad.etiket.halk` | `assets/audio/voice/ad/etiket/halk.wav` | ANLATICI | Halk |
| 146 | `vo.ad.etiket.tek_kisi` | `assets/audio/voice/ad/etiket/tek_kisi.wav` | ANLATICI | Tek bir kişi |
| 147 | `vo.ad.etiket.cok_konustugu` | `assets/audio/voice/ad/etiket/cok_konustugu.wav` | ANLATICI | Çok konuştuğu için |
| 148 | `vo.ad.etiket.cok_calistigi` | `assets/audio/voice/ad/etiket/cok_calistigi.wav` | ANLATICI | Çok çalışkan olduğu için |
| 149 | `vo.ad.etiket.cesur_kararli` | `assets/audio/voice/ad/etiket/cesur_kararli.wav` | ANLATICI | Cesur ve kararlı |
| 150 | `vo.ad.etiket.kararsiz` | `assets/audio/voice/ad/etiket/kararsiz.wav` | ANLATICI | Kararsız |
| 151 | `vo.ad.etiket.ozellik_caliskan` | `assets/audio/voice/ad/etiket/ozellik_caliskan.wav` | ANLATICI | Çalışkan |
| 152 | `vo.ad.etiket.basari_okul` | `assets/audio/voice/ad/etiket/basari_okul.wav` | ANLATICI | Okulda çok başarılı oldu |
| 153 | `vo.ad.etiket.ozellik_cesur` | `assets/audio/voice/ad/etiket/ozellik_cesur.wav` | ANLATICI | Cesur ve kararlı |
| 154 | `vo.ad.etiket.basari_kurtulus` | `assets/audio/voice/ad/etiket/basari_kurtulus.wav` | ANLATICI | Kurtuluş Savaşı'nı kazandı |
| 155 | `vo.ad.etiket.ozellik_ileri` | `assets/audio/voice/ad/etiket/ozellik_ileri.wav` | ANLATICI | İleri görüşlü |
| 156 | `vo.ad.etiket.basari_cumhuriyet` | `assets/audio/voice/ad/etiket/basari_cumhuriyet.wav` | ANLATICI | Cumhuriyet'i kurdu |
| 157 | `vo.ad.etiket.ozellik_egitim` | `assets/audio/voice/ad/etiket/ozellik_egitim.wav` | ANLATICI | Eğitime önem veren |
| 158 | `vo.ad.etiket.basari_harf` | `assets/audio/voice/ad/etiket/basari_harf.wav` | ANLATICI | Yeni harfleri herkese öğretti |
| 159 | `vo.ad.simge.guclendirir` | `assets/audio/voice/ad/simge/guclendirir.wav` | ANLATICI | Birliği güçlendirir |
| 160 | `vo.ad.simge.guclendirmez` | `assets/audio/voice/ad/simge/guclendirmez.wav` | ANLATICI | Birliği güçlendirmez |
| 161 | `vo.ad.hayvan.ari` | `assets/audio/voice/ad/hayvan/ari.wav` | ANLATICI | Arı |
| 162 | `vo.ad.doga.agac` | `assets/audio/voice/ad/doga/agac.wav` | ANLATICI | Ağaç |
| 163 | `vo.ad.hayvan.inek` | `assets/audio/voice/ad/hayvan/inek.wav` | ANLATICI | İnek |
| 164 | `vo.ad.hayvan.tavuk` | `assets/audio/voice/ad/hayvan/tavuk.wav` | ANLATICI | Tavuk |
| 165 | `vo.ad.kroki.firin_k` | `assets/audio/voice/ad/kroki/firin_k.wav` | ANLATICI | Fırının yanı |
| 166 | `vo.ad.simge.afet_oncesi` | `assets/audio/voice/ad/simge/afet_oncesi.wav` | ANLATICI | Afet öncesi |
| 167 | `vo.ad.simge.afet_ani` | `assets/audio/voice/ad/simge/afet_ani.wav` | ANLATICI | Afet anı |
| 168 | `vo.ad.simge.afet_sonrasi` | `assets/audio/voice/ad/simge/afet_sonrasi.wav` | ANLATICI | Afet sonrası |
| 169 | `vo.ad.afet.canta_hazirla` | `assets/audio/voice/ad/afet/canta_hazirla.wav` | ANLATICI | Afet çantası hazırlamak |
| 170 | `vo.ad.afet.cok_kapan` | `assets/audio/voice/ad/afet/cok_kapan.wav` | ANLATICI | Çök, kapan, tutun |
| 171 | `vo.ad.afet.toplanma_git` | `assets/audio/voice/ad/afet/toplanma_git.wav` | ANLATICI | Toplanma alanına gitmek |
| 172 | `vo.ad.etiket.hastaliktan_korur` | `assets/audio/voice/ad/etiket/hastaliktan_korur.wav` | ANLATICI | Hastalıklardan korur |
| 173 | `vo.ad.etiket.uyku_getirir` | `assets/audio/voice/ad/etiket/uyku_getirir.wav` | ANLATICI | Uykumuzu getirir |
| 174 | `vo.ad.etiket.taze_tutar` | `assets/audio/voice/ad/etiket/taze_tutar.wav` | ANLATICI | Yiyecekleri taze tutar |
| 175 | `vo.ad.etiket.isitir` | `assets/audio/voice/ad/etiket/isitir.wav` | ANLATICI | Yiyecekleri ısıtır |
| 176 | `vo.ad.tek.asi` | `assets/audio/voice/ad/tek/asi.wav` | ANLATICI | Aşı |
| 177 | `vo.ad.tek.ampul` | `assets/audio/voice/ad/tek/ampul.wav` | ANLATICI | Ampul |
| 178 | `vo.ad.tek.buzdolabi` | `assets/audio/voice/ad/tek/buzdolabi.wav` | ANLATICI | Buzdolabı |
| 179 | `vo.ad.simge.eski` | `assets/audio/voice/ad/simge/eski.wav` | ANLATICI | Eski |
| 180 | `vo.ad.simge.yeni` | `assets/audio/voice/ad/simge/yeni.wav` | ANLATICI | Yeni |
| 181 | `vo.ad.tek.mum` | `assets/audio/voice/ad/tek/mum.wav` | ANLATICI | Mum |
| 182 | `vo.ad.tek.at_arabasi` | `assets/audio/voice/ad/tek/at_arabasi.wav` | ANLATICI | At arabası |
| 183 | `vo.ad.tek.camasir_legen` | `assets/audio/voice/ad/tek/camasir_legen.wav` | ANLATICI | Leğende çamaşır yıkamak |

---
## Teslim kontrol listesi
- [ ] Dosya adları kimlikle birebir aynı (Türkçe karakter yok)
- [ ] Ses başında ve sonunda uzun sessizlik yok (gerekirse kırp)
- [ ] 005'teki aynı iki ses kullanıldı
- [ ] Commit: `assets: 086 086 hb g3 seslendirme`
