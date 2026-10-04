# 096 · Fen Bilimleri 3 seslendirmesi: ünite 5–8 ve ortak kartlar (Gemini TTS)

**Öncelik: ORTA** (Faz 6, Keşif Laboratuvarı). `content/g3/fen/u05–u08.json` satırları ve bütün ünitelerde ortak kullanılan kart sesleri (`vo.fen.txt.*`: kutu etiketleri ve metin kartları; `vo.fen.ad.*`: görselli kutu etiketleri).

> Bu dosya eklenmeden de oyun çalışır: eksik satırları cihazın Türkçe sesiyle okur. Gerçek kayıtlar geldiğinde kalite çok artar.

## Nasıl üretilir
1. **Google AI Studio → "Generate speech"** (Gemini TTS) ekranını aç. Çoklu konuşmacı modunu kapat, tek konuşmacı kullan.
2. **Ses seçimi:** 005'in en altındaki "Seçilen sesler" bölümüne yazdığın **aynı iki sesi** kullan (Anlatıcı ve Bilge). Henüz seçmediysen önce 005'i yap.
3. Her satır için **Üslup talimatı** alanını "Style instructions / system" kısmına, **Metin** alanını konuşma metnine yapıştır.
4. Çıktıyı (`.wav`) **Dosya yolu** sütunundaki isimle kaydet. Klasörler yoksa oluştur. `rNN.wav` dosyası ile aynı adlı `rNN/` klasörü (ipucu, hedef, sayfa satırları) yan yana durur; bu doğrudur. `.wav` kabul edilir; istersen `.ogg`'ye çevirebilirsin (mono, 22–44 kHz).
5. Dinleyip kontrol et: Türkçe telaffuz doğru mu, tempo 8–9 yaşındaki bir çocuk için yeterince yavaş mı?

## Ortak üslup talimatları
- **ANLATICI:** `Sıcak, sakin ve net bir sesle, 6-8 yaşındaki bir çocuğa konuşur gibi, yavaş ve anlaşılır oku. Kelimeleri tane tane söyle, cümle sonlarında kısa bir duraklama yap.`
- **BILGE:** `Neşeli, sevimli ve enerjik bir çizgi film karakteri gibi konuş. Gülümseyerek, coşkulu ama anlaşılır ve çok hızlı olmayan bir tempoyla söyle.`

Ek not: Bilimsel terimleri (paleontolog, mikroskop, mineral, yaşam döngüsü) biraz vurgulayarak ve net söyle. Hikâye sayfalarını (`p1`, `p2`) masal anlatır gibi, soruları (`q1`, `q2`) merak uyandıran bir tonla oku.

## Satırlar

| # | Kimlik (anahtar) | Dosya yolu | Konuşmacı | Metin |
|---|---|---|---|---|
| 1 | `vo.g3.fen.u05.n01.intro` | `assets/audio/voice/g3/fen/u05/n01/intro.wav` | BILGE | Varlıklar farklı biçimlerde hareket eder. Bazıları döner, bazıları sallanır, bazıları hızlanır ya da yavaşlar. Haydi gözlem yapalım! |
| 2 | `vo.g3.fen.u05.n01.r01` | `assets/audio/voice/g3/fen/u05/n01/r01.wav` | ANLATICI | Dönen varlıkları Dönme kutusuna, sallananları Sallanma kutusuna koy. |
| 3 | `vo.g3.fen.u05.n01.r02` | `assets/audio/voice/g3/fen/u05/n01/r02.wav` | ANLATICI | Kaydıraktan kayan çocuk ve yokuştan inen top hızlanır. Hangileri yavaşlar? Her birini doğru kutuya koy. |
| 4 | `vo.g3.fen.u05.n01.r03` | `assets/audio/voice/g3/fen/u05/n01/r03.wav` | ANLATICI | Top duvara çarptı. Topun hareketinde ne değişti? |
| 5 | `vo.g3.fen.u05.n01.r03.ipucu` | `assets/audio/voice/g3/fen/u05/n01/r03/ipucu.wav` | ANLATICI | Top duvara çarpınca geri döndü. Gittiği yön değişti. |
| 6 | `vo.g3.fen.u05.n01.r04` | `assets/audio/voice/g3/fen/u05/n01/r04.wav` | ANLATICI | Top hızla yola doğru yuvarlanıyor. Yolda araçlar var. Ne yapmalısın? |
| 7 | `vo.g3.fen.u05.n01.r04.sonuc2` | `assets/audio/voice/g3/fen/u05/n01/r04/sonuc2.wav` | ANLATICI | Yola koşmak tehlikeli! Araçlar hızla gelir ve hemen duramaz. |
| 8 | `vo.g3.fen.u05.n01.r04.ipucu` | `assets/audio/voice/g3/fen/u05/n01/r04/ipucu.wav` | ANLATICI | Hareket eden araçlar tehlikeli olabilir. Yola çıkmadan bir büyüğe haber verelim. |
| 9 | `vo.g3.fen.u05.n02.intro` | `assets/audio/voice/g3/fen/u05/n02/intro.wav` | BILGE | Bir varlığı hareket ettirmek ya da şeklini değiştirmek için onu iteriz ya da çekeriz. Buna kuvvet denir. Kuvvetin etkilerini keşfedelim! |
| 10 | `vo.g3.fen.u05.n02.r01` | `assets/audio/voice/g3/fen/u05/n02/r01.wav` | ANLATICI | İterek yapılan hareketleri İtme kutusuna, çekerek yapılanları Çekme kutusuna koy. |
| 11 | `vo.g3.fen.u05.n02.r02` | `assets/audio/voice/g3/fen/u05/n02/r02.wav` | ANLATICI | Elif oyun hamurunu avucuyla bastırdı. Oyun hamurunda ne değişti? |
| 12 | `vo.g3.fen.u05.n02.r02.ipucu` | `assets/audio/voice/g3/fen/u05/n02/r02/ipucu.wav` | ANLATICI | Kuvvet uygulayınca bazı varlıkların şekli değişir. |
| 13 | `vo.g3.fen.u05.n02.r03` | `assets/audio/voice/g3/fen/u05/n02/r03.wav` | ANLATICI | Çimenlerin üstünde bir top duruyor. Kimse ona dokunmazsa ve rüzgâr esmezse ne olur? |
| 14 | `vo.g3.fen.u05.n02.r03.ipucu` | `assets/audio/voice/g3/fen/u05/n02/r03/ipucu.wav` | ANLATICI | Duran bir varlığın hareket etmesi için onu itmek ya da çekmek gerekir. |
| 15 | `vo.g3.fen.u05.n02.r04` | `assets/audio/voice/g3/fen/u05/n02/r04.wav` | ANLATICI | Ece, topa daha güçlü vurursa topun daha uzağa gideceğini tahmin etti. Resme bak: güçlü vurulan top daha uzağa gitti. Ece'nin tahmini doğru muydu? |
| 16 | `vo.g3.fen.u05.n02.r04.ipucu` | `assets/audio/voice/g3/fen/u05/n02/r04/ipucu.wav` | ANLATICI | Alttaki top güçlü vuruldu ve daha uzağa gitti. Tahmin gözlemle uyuşuyor mu? |
| 17 | `vo.g3.fen.u06.n01.intro` | `assets/audio/voice/g3/fen/u06/n01/intro.wav` | BILGE | Evimizdeki birçok araç gereç elektrikle çalışır. Bazıları fişle, bazıları pille çalışır. Pille çalışanlar da elektriklidir! |
| 18 | `vo.g3.fen.u06.n01.r01` | `assets/audio/voice/g3/fen/u06/n01/r01.wav` | ANLATICI | Elektrikle çalışan araç gereçleri Elektrikli kutusuna, elektrik olmadan kullanılanları Elektriksiz kutusuna koy. |
| 19 | `vo.g3.fen.u06.n01.r02` | `assets/audio/voice/g3/fen/u06/n01/r02.wav` | ANLATICI | Dinle ve doğru araç gerece dokun. |
| 20 | `vo.g3.fen.u06.n01.r02.hedef` | `assets/audio/voice/g3/fen/u06/n01/r02/hedef.wav` | ANLATICI | Fişi prize takılınca ısınır ve kırışık giysileri düzeltir. |
| 21 | `vo.g3.fen.u06.n01.r03` | `assets/audio/voice/g3/fen/u06/n01/r03.wav` | ANLATICI | Fişle çalışanları, pille çalışanları ve elektriksiz olanları ayır. |
| 22 | `vo.g3.fen.u06.n01.r04` | `assets/audio/voice/g3/fen/u06/n01/r04.wav` | ANLATICI | Dinle ve doğru karta dokun. |
| 23 | `vo.g3.fen.u06.n01.r04.hedef` | `assets/audio/voice/g3/fen/u06/n01/r04/hedef.wav` | ANLATICI | Bir oyuncak robotun yuvasına iki pil takıldı ve robot yürümeye başladı. Bu robot elektrikli mi, elektriksiz mi? |
| 24 | `vo.g3.fen.u06.n02.intro` | `assets/audio/voice/g3/fen/u06/n02/intro.wav` | BILGE | Elektrik çok işimize yarar ama dikkatli kullanmalıyız. Güvenli davranışları birlikte bulalım! |
| 25 | `vo.g3.fen.u06.n02.r01` | `assets/audio/voice/g3/fen/u06/n02/r01.wav` | ANLATICI | Elif ellerini yıkadı, elleri hâlâ ıslak. Saç kurutma makinesini prize takmak istiyor. Ne yapmalı? |
| 26 | `vo.g3.fen.u06.n02.r01.sonuc2` | `assets/audio/voice/g3/fen/u06/n02/r01/sonuc2.wav` | ANLATICI | Islak elle prize ve elektrikli araç gerece dokunmak tehlikelidir. Önce ellerimizi kurularız. |
| 27 | `vo.g3.fen.u06.n02.r01.ipucu` | `assets/audio/voice/g3/fen/u06/n02/r01/ipucu.wav` | ANLATICI | Su ve elektrik bir araya gelmemeli. Önce ellerimizi kurulayalım. |
| 28 | `vo.g3.fen.u06.n02.r02` | `assets/audio/voice/g3/fen/u06/n02/r02.wav` | ANLATICI | Lambanın kablosu yıpranmış, içindeki teller görünüyor. Ne yapmalısın? |
| 29 | `vo.g3.fen.u06.n02.r02.sonuc2` | `assets/audio/voice/g3/fen/u06/n02/r02/sonuc2.wav` | ANLATICI | Yıpranmış kabloya dokunmak elektrik çarpmasına yol açabilir. |
| 30 | `vo.g3.fen.u06.n02.r02.ipucu` | `assets/audio/voice/g3/fen/u06/n02/r02/ipucu.wav` | ANLATICI | Bozuk kablolara dokunmayız. Hemen bir büyüğe haber veririz. |
| 31 | `vo.g3.fen.u06.n02.r03` | `assets/audio/voice/g3/fen/u06/n02/r03.wav` | ANLATICI | Masa lambasının fişini prizden çıkaracaksın. Fişi nasıl çekmelisin? |
| 32 | `vo.g3.fen.u06.n02.r03.sonuc2` | `assets/audio/voice/g3/fen/u06/n02/r03/sonuc2.wav` | ANLATICI | Kablodan çekersek kablo zarar görür ve tehlikeli olabilir. |
| 33 | `vo.g3.fen.u06.n02.r03.ipucu` | `assets/audio/voice/g3/fen/u06/n02/r03/ipucu.wav` | ANLATICI | Fişi kablosundan değil, kendisinden tutarak çekeriz. |
| 34 | `vo.g3.fen.u06.n02.r04` | `assets/audio/voice/g3/fen/u06/n02/r04.wav` | ANLATICI | Güvenli davranışları Güvenli kutusuna, tehlikeli olanları Tehlikeli kutusuna koy. |
| 35 | `vo.g3.fen.u06.n03.intro` | `assets/audio/voice/g3/fen/u06/n03/intro.wav` | BILGE | Elektriği boşa harcamazsak hem doğayı hem ülkemizin kaynaklarını korumuş oluruz. Haydi elektrik tasarrufu yapalım! |
| 36 | `vo.g3.fen.u06.n03.r01` | `assets/audio/voice/g3/fen/u06/n03/r01.wav` | ANLATICI | Elektriği tasarruflu kullanan davranışları Tasarruflu kutusuna, boşa harcayanları Savurgan kutusuna koy. |
| 37 | `vo.g3.fen.u06.n03.r02` | `assets/audio/voice/g3/fen/u06/n03/r02.wav` | ANLATICI | Evde altı lamba yanıyor. Boş odalardaki iki lambayı kapatırsak kaç lamba yanmaya devam eder? |
| 38 | `vo.g3.fen.u06.n03.r02.ipucu` | `assets/audio/voice/g3/fen/u06/n03/r02/ipucu.wav` | ANLATICI | Altı lambadan ikisini kapatıyoruz. Altıdan iki çıkarsa kaç kalır? |
| 39 | `vo.g3.fen.u06.n03.r03` | `assets/audio/voice/g3/fen/u06/n03/r03.wav` | ANLATICI | Koridordaki lamba her gün üç saat boşuna yanıyor. Dört günde toplam kaç saat boşa yanar? |
| 40 | `vo.g3.fen.u06.n03.r03.ipucu` | `assets/audio/voice/g3/fen/u06/n03/r03/ipucu.wav` | ANLATICI | Her gün üç saat: üç, altı, dokuz, on iki. |
| 41 | `vo.g3.fen.u06.n03.r04` | `assets/audio/voice/g3/fen/u06/n03/r04.wav` | ANLATICI | Ayşe'nin ailesi, boş odalarda ışıkları kapatırsak daha az elektrik harcarız diye tahmin etti. Grafikte soldaki sütun önceki ayı, sağdaki sütun ışıkları kapattıkları ayı gösteriyor. Tahminleri doğru çıktı mı? |
| 42 | `vo.g3.fen.u06.n03.r04.ipucu` | `assets/audio/voice/g3/fen/u06/n03/r04/ipucu.wav` | ANLATICI | Sağdaki sütun daha kısa. Yani o ay daha az elektrik harcandı. |
| 43 | `vo.g3.fen.u07.n01.intro` | `assets/audio/voice/g3/fen/u07/n01/intro.wav` | BILGE | Toprak, kayaçların çok uzun zamanda ufalanmasıyla oluşur. İçinde kum, küçük taşlar, kil, su ve bitki parçaları vardır. Toprağı yakından tanıyalım! |
| 44 | `vo.g3.fen.u07.n01.r01` | `assets/audio/voice/g3/fen/u07/n01/r01.wav` | ANLATICI | Toprağın oluşumunu sırala: önce büyük kaya, sonra küçük parçalar, en sonunda toprak. |
| 45 | `vo.g3.fen.u07.n01.r02` | `assets/audio/voice/g3/fen/u07/n01/r02.wav` | ANLATICI | Kaya çatlar, ufalanır ve toprağa dönüşür. Toprağın oluşumunu baştan sona sırala. |
| 46 | `vo.g3.fen.u07.n01.r03` | `assets/audio/voice/g3/fen/u07/n01/r03.wav` | ANLATICI | Toprağın içinde neler var? Dinle ve doğru olana dokun. |
| 47 | `vo.g3.fen.u07.n01.r03.hedef` | `assets/audio/voice/g3/fen/u07/n01/r03/hedef.wav` | ANLATICI | Kum. İnce ve küçük taneler. |
| 48 | `vo.g3.fen.u07.n01.r04` | `assets/audio/voice/g3/fen/u07/n01/r04.wav` | ANLATICI | Toprağın içinde neler var? Dinle ve doğru olana dokun. |
| 49 | `vo.g3.fen.u07.n01.r04.hedef` | `assets/audio/voice/g3/fen/u07/n01/r04/hedef.wav` | ANLATICI | Kuru yaprak ve kök parçaları. Bunlar toprağa karışır. |
| 50 | `vo.g3.fen.u07.n02.intro` | `assets/audio/voice/g3/fen/u07/n02/intro.wav` | BILGE | Bir bitki yetiştirmek için neler gerekir? Su, ışık, uygun sıcaklık ve toprak! Haydi bir fasulye yetiştirelim! |
| 51 | `vo.g3.fen.u07.n02.r01` | `assets/audio/voice/g3/fen/u07/n02/r01.wav` | ANLATICI | Bitkinin büyümesi için gerekenleri Gerekli kutusuna, gerekmeyenleri Gerekmez kutusuna koy. |
| 52 | `vo.g3.fen.u07.n02.r02` | `assets/audio/voice/g3/fen/u07/n02/r02.wav` | ANLATICI | Bitkilerin ihtiyaçları farklıdır. Kaktüs az su ister, çeltik çok su ister. Eşleştir. |
| 53 | `vo.g3.fen.u07.n02.r03` | `assets/audio/voice/g3/fen/u07/n02/r03.wav` | ANLATICI | Fasulye yetiştirmek için yapılması gerekenleri sırala. |
| 54 | `vo.g3.fen.u08.n01.intro` | `assets/audio/voice/g3/fen/u08/n01/intro.wav` | BILGE | Her canlının bir yaşam alanı vardır. Kimi gölde, kimi ormanda, kimi toprağın içinde yaşar. Gözlem kartlarını gruplayıp bir veri tablosu oluşturalım! |
| 55 | `vo.g3.fen.u08.n01.r01` | `assets/audio/voice/g3/fen/u08/n01/r01.wav` | ANLATICI | Gölde yaşayan canlıları Göl kutusuna, ormanda yaşayanları Orman kutusuna koy. |
| 56 | `vo.g3.fen.u08.n01.r02` | `assets/audio/voice/g3/fen/u08/n01/r02.wav` | ANLATICI | Şimdi bir de toprak kutusu var. Her canlıyı yaşadığı yere koy. |
| 57 | `vo.g3.fen.u08.n01.r03` | `assets/audio/voice/g3/fen/u08/n01/r03.wav` | ANLATICI | Bazı canlılar nemli yerlerde, bazıları kuru yerlerde yaşar. Gözlem kartlarını ayır. |
| 58 | `vo.g3.fen.u08.n02.intro` | `assets/audio/voice/g3/fen/u08/n02/intro.wav` | BILGE | Göl, orman, çöl... Her yaşam alanının kendine özgü özellikleri var. Bir yerde ne kadar farklı canlı yaşıyorsa, orada canlı çeşitliliği o kadar fazladır. |
| 59 | `vo.g3.fen.u08.n02.r01` | `assets/audio/voice/g3/fen/u08/n02/r01.wav` | ANLATICI | Her yaşam alanını, ona uygun özellikle eşleştir. |
| 60 | `vo.g3.fen.u08.n02.r02` | `assets/audio/voice/g3/fen/u08/n02/r02.wav` | ANLATICI | Dinle ve doğru yaşam alanına dokun. |
| 61 | `vo.g3.fen.u08.n02.r02.hedef` | `assets/audio/voice/g3/fen/u08/n02/r02/hedef.wav` | ANLATICI | Çok sayıda ağacı olan, gölgeli ve serin bir yaşam alanı. |
| 62 | `vo.g3.fen.u08.n02.r03` | `assets/audio/voice/g3/fen/u08/n02/r03.wav` | ANLATICI | Dinle ve doğru bahçeye dokun. |
| 63 | `vo.g3.fen.u08.n02.r03.hedef` | `assets/audio/voice/g3/fen/u08/n02/r03/hedef.wav` | ANLATICI | Canlı çeşitliliği, bir yerde kaç farklı canlı yaşadığıdır. Canlı çeşitliliği daha fazla olan bahçeyi bul. |
| 64 | `vo.g3.fen.u08.n03.intro` | `assets/audio/voice/g3/fen/u08/n03/intro.wav` | BILGE | Yaşam alanlarını korursak oradaki canlılar da korunur. Doğru bilgiyi bulalım ve yaşam alanlarını koruyalım! |
| 65 | `vo.g3.fen.u08.n03.r01` | `assets/audio/voice/g3/fen/u08/n03/r01.wav` | ANLATICI | Yaşam alanlarını koruyan davranışları Korur kutusuna, zarar verenleri Zarar verir kutusuna koy. |
| 66 | `vo.g3.fen.u08.n03.r02` | `assets/audio/voice/g3/fen/u08/n03/r02.wav` | ANLATICI | Bir arkadaşın, göle atılan çöpler balıklara zarar vermez, diyor. Bu bilgi doğru mu? |
| 67 | `vo.g3.fen.u08.n03.r02.ipucu` | `assets/audio/voice/g3/fen/u08/n03/r02/ipucu.wav` | ANLATICI | Çöpler suyu kirletir. Balıklar ve su kuşları bundan zarar görür. |
| 68 | `vo.g3.fen.u08.n03.r03` | `assets/audio/voice/g3/fen/u08/n03/r03.wav` | ANLATICI | Bir ormandaki ağaçlar kesildi. Orada yaşayan sincaplar ve kuşlar için ne olur? |
| 69 | `vo.g3.fen.u08.n03.r03.ipucu` | `assets/audio/voice/g3/fen/u08/n03/r03/ipucu.wav` | ANLATICI | Sincaplar ve kuşlar ağaçlarda yuva yapar. Ağaçlar olmayınca ne olur? |
| 70 | `vo.g3.fen.u08.n03.r04` | `assets/audio/voice/g3/fen/u08/n03/r04.wav` | ANLATICI | Kirli bir göl temizlendi, çevresine fidanlar dikildi. Zamanla burada ne olur? |
| 71 | `vo.g3.fen.u08.n03.r04.ipucu` | `assets/audio/voice/g3/fen/u08/n03/r04/ipucu.wav` | ANLATICI | Temiz su ve yeni ağaçlar canlılara yuva ve besin sağlar. |
| 72 | `vo.fen.txt.ortak` | `assets/audio/voice/fen/txt/ortak.wav` | ANLATICI | Ortak: iki bilim insanında da olan özellikler. |
| 73 | `vo.fen.txt.farkli` | `assets/audio/voice/fen/txt/farkli.wav` | ANLATICI | Farklı: yalnızca birinde olan özellikler. |
| 74 | `vo.fen.txt.merakli` | `assets/audio/voice/fen/txt/merakli.wav` | ANLATICI | Meraklı |
| 75 | `vo.fen.txt.sabirli` | `assets/audio/voice/fen/txt/sabirli.wav` | ANLATICI | Sabırlı |
| 76 | `vo.fen.txt.not_alir` | `assets/audio/voice/fen/txt/not_alir.wav` | ANLATICI | Not alır |
| 77 | `vo.fen.txt.st_hepsi_merakli` | `assets/audio/voice/fen/txt/st_hepsi_merakli.wav` | ANLATICI | Hepsi meraklıdır. |
| 78 | `vo.fen.txt.st_hepsi_yildiz` | `assets/audio/voice/fen/txt/st_hepsi_yildiz.wav` | ANLATICI | Hepsi yıldız inceler. |
| 79 | `vo.fen.txt.st_hic_soru` | `assets/audio/voice/fen/txt/st_hic_soru.wav` | ANLATICI | Hiçbiri soru sormaz. |
| 80 | `vo.fen.txt.st_sabirla` | `assets/audio/voice/fen/txt/st_sabirla.wav` | ANLATICI | Sabırla çalışır. |
| 81 | `vo.fen.txt.st_merak_etmez` | `assets/audio/voice/fen/txt/st_merak_etmez.wav` | ANLATICI | Hiç merak etmez. |
| 82 | `vo.fen.txt.st_denemez` | `assets/audio/voice/fen/txt/st_denemez.wav` | ANLATICI | Hiç deneme yapmaz. |
| 83 | `vo.fen.txt.bitkiler` | `assets/audio/voice/fen/txt/bitkiler.wav` | ANLATICI | Bitkiler |
| 84 | `vo.fen.txt.hayvanlar` | `assets/audio/voice/fen/txt/hayvanlar.wav` | ANLATICI | Hayvanlar |
| 85 | `vo.fen.txt.mantarlar` | `assets/audio/voice/fen/txt/mantarlar.wav` | ANLATICI | Mantarlar |
| 86 | `vo.fen.txt.isik` | `assets/audio/voice/fen/txt/isik.wav` | ANLATICI | Işığı algılar. |
| 87 | `vo.fen.txt.koku` | `assets/audio/voice/fen/txt/koku.wav` | ANLATICI | Kokuyu algılar. |
| 88 | `vo.fen.txt.dokunma` | `assets/audio/voice/fen/txt/dokunma.wav` | ANLATICI | Dokunmayı algılar. |
| 89 | `vo.fen.txt.buyume` | `assets/audio/voice/fen/txt/buyume.wav` | ANLATICI | Büyüme |
| 90 | `vo.fen.txt.ucma` | `assets/audio/voice/fen/txt/ucma.wav` | ANLATICI | Uçma |
| 91 | `vo.fen.txt.yumurtlama` | `assets/audio/voice/fen/txt/yumurtlama.wav` | ANLATICI | Yumurtlama |
| 92 | `vo.fen.txt.mineraller` | `assets/audio/voice/fen/txt/mineraller.wav` | ANLATICI | Mineraller |
| 93 | `vo.fen.txt.hava` | `assets/audio/voice/fen/txt/hava.wav` | ANLATICI | Hava |
| 94 | `vo.fen.txt.bir_maden` | `assets/audio/voice/fen/txt/bir_maden.wav` | ANLATICI | Bir maden. |
| 95 | `vo.fen.txt.bir_sivi` | `assets/audio/voice/fen/txt/bir_sivi.wav` | ANLATICI | Bir sıvı. |
| 96 | `vo.fen.txt.bir_hayvan` | `assets/audio/voice/fen/txt/bir_hayvan.wav` | ANLATICI | Bir hayvan. |
| 97 | `vo.fen.txt.camur_orter` | `assets/audio/voice/fen/txt/camur_orter.wav` | ANLATICI | Üstünü çamur ve kum örter. |
| 98 | `vo.fen.txt.taslasir` | `assets/audio/voice/fen/txt/taslasir.wav` | ANLATICI | Katmanlar altında taşlaşır. |
| 99 | `vo.fen.txt.bulunur` | `assets/audio/voice/fen/txt/bulunur.wav` | ANLATICI | Paleontolog fosili bulur. |
| 100 | `vo.fen.txt.kati` | `assets/audio/voice/fen/txt/kati.wav` | ANLATICI | Katı maddeler |
| 101 | `vo.fen.txt.sivi` | `assets/audio/voice/fen/txt/sivi.wav` | ANLATICI | Sıvı maddeler |
| 102 | `vo.fen.txt.gaz` | `assets/audio/voice/fen/txt/gaz.wav` | ANLATICI | Gaz maddeler |
| 103 | `vo.fen.txt.sert` | `assets/audio/voice/fen/txt/sert.wav` | ANLATICI | Sert |
| 104 | `vo.fen.txt.esnek` | `assets/audio/voice/fen/txt/esnek.wav` | ANLATICI | Esnek |
| 105 | `vo.fen.txt.kirilgan` | `assets/audio/voice/fen/txt/kirilgan.wav` | ANLATICI | Kırılgan |
| 106 | `vo.fen.txt.yumusak` | `assets/audio/voice/fen/txt/yumusak.wav` | ANLATICI | Yumuşak |
| 107 | `vo.fen.txt.kagit` | `assets/audio/voice/fen/txt/kagit.wav` | ANLATICI | Kâğıt atıklar |
| 108 | `vo.fen.txt.plastik` | `assets/audio/voice/fen/txt/plastik.wav` | ANLATICI | Plastik atıklar |
| 109 | `vo.fen.txt.cam` | `assets/audio/voice/fen/txt/cam.wav` | ANLATICI | Cam atıklar |
| 110 | `vo.fen.txt.ayri_kutular` | `assets/audio/voice/fen/txt/ayri_kutular.wav` | ANLATICI | Ayrı kutular koymak. |
| 111 | `vo.fen.txt.buyuk_kutu` | `assets/audio/voice/fen/txt/buyuk_kutu.wav` | ANLATICI | Daha büyük bir kutu almak. |
| 112 | `vo.fen.txt.tek_poset` | `assets/audio/voice/fen/txt/tek_poset.wav` | ANLATICI | Hepsini tek poşete koymak. |
| 113 | `vo.fen.txt.ayirmak_zorlasir` | `assets/audio/voice/fen/txt/ayirmak_zorlasir.wav` | ANLATICI | Atıkları ayırmak zorlaşır. |
| 114 | `vo.fen.txt.fark_etmez` | `assets/audio/voice/fen/txt/fark_etmez.wav` | ANLATICI | Hiç fark etmez. |
| 115 | `vo.fen.txt.kagida_doner` | `assets/audio/voice/fen/txt/kagida_doner.wav` | ANLATICI | Şişe kâğıda dönüşür. |
| 116 | `vo.fen.txt.donme` | `assets/audio/voice/fen/txt/donme.wav` | ANLATICI | Dönme hareketi |
| 117 | `vo.fen.txt.sallanma` | `assets/audio/voice/fen/txt/sallanma.wav` | ANLATICI | Sallanma hareketi |
| 118 | `vo.fen.txt.hizlanma` | `assets/audio/voice/fen/txt/hizlanma.wav` | ANLATICI | Hızlanıyor |
| 119 | `vo.fen.txt.yavaslama` | `assets/audio/voice/fen/txt/yavaslama.wav` | ANLATICI | Yavaşlıyor |
| 120 | `vo.fen.txt.yon_degistirir` | `assets/audio/voice/fen/txt/yon_degistirir.wav` | ANLATICI | Yön değiştirir. |
| 121 | `vo.fen.txt.hizlanir` | `assets/audio/voice/fen/txt/hizlanir.wav` | ANLATICI | Hızlanır. |
| 122 | `vo.fen.txt.durur` | `assets/audio/voice/fen/txt/durur.wav` | ANLATICI | Durur. |
| 123 | `vo.fen.txt.itme` | `assets/audio/voice/fen/txt/itme.wav` | ANLATICI | İtme |
| 124 | `vo.fen.txt.cekme` | `assets/audio/voice/fen/txt/cekme.wav` | ANLATICI | Çekme |
| 125 | `vo.fen.txt.sekli_degisti` | `assets/audio/voice/fen/txt/sekli_degisti.wav` | ANLATICI | Şekli değişti. |
| 126 | `vo.fen.txt.rengi_degisti` | `assets/audio/voice/fen/txt/rengi_degisti.wav` | ANLATICI | Rengi değişti. |
| 127 | `vo.fen.txt.ucup_gitti` | `assets/audio/voice/fen/txt/ucup_gitti.wav` | ANLATICI | Uçup gitti. |
| 128 | `vo.fen.txt.yerinde_durur` | `assets/audio/voice/fen/txt/yerinde_durur.wav` | ANLATICI | Yerinde durur. |
| 129 | `vo.fen.txt.kendi_yuvarlanir` | `assets/audio/voice/fen/txt/kendi_yuvarlanir.wav` | ANLATICI | Kendi kendine yuvarlanır. |
| 130 | `vo.fen.txt.ziplar` | `assets/audio/voice/fen/txt/ziplar.wav` | ANLATICI | Zıplar. |
| 131 | `vo.fen.txt.dogru` | `assets/audio/voice/fen/txt/dogru.wav` | ANLATICI | Doğru |
| 132 | `vo.fen.txt.yanlis` | `assets/audio/voice/fen/txt/yanlis.wav` | ANLATICI | Yanlış |
| 133 | `vo.fen.txt.elektrikli` | `assets/audio/voice/fen/txt/elektrikli.wav` | ANLATICI | Elektrikli araç gereçler |
| 134 | `vo.fen.txt.elektriksiz` | `assets/audio/voice/fen/txt/elektriksiz.wav` | ANLATICI | Elektriksiz araç gereçler |
| 135 | `vo.fen.txt.fisle` | `assets/audio/voice/fen/txt/fisle.wav` | ANLATICI | Fişle çalışanlar |
| 136 | `vo.fen.txt.pille` | `assets/audio/voice/fen/txt/pille.wav` | ANLATICI | Pille çalışanlar |
| 137 | `vo.fen.txt.guvenli` | `assets/audio/voice/fen/txt/guvenli.wav` | ANLATICI | Güvenli davranışlar |
| 138 | `vo.fen.txt.tehlikeli` | `assets/audio/voice/fen/txt/tehlikeli.wav` | ANLATICI | Tehlikeli davranışlar |
| 139 | `vo.fen.txt.tasarruflu` | `assets/audio/voice/fen/txt/tasarruflu.wav` | ANLATICI | Elektriği tasarruflu kullanmak |
| 140 | `vo.fen.txt.savurgan` | `assets/audio/voice/fen/txt/savurgan.wav` | ANLATICI | Elektriği boşa harcamak |
| 141 | `vo.fen.txt.gerekli` | `assets/audio/voice/fen/txt/gerekli.wav` | ANLATICI | Bitkinin büyümesi için gerekli |
| 142 | `vo.fen.txt.gerekmez` | `assets/audio/voice/fen/txt/gerekmez.wav` | ANLATICI | Bitkinin büyümesi için gerekmez |
| 143 | `vo.fen.txt.az_su` | `assets/audio/voice/fen/txt/az_su.wav` | ANLATICI | Az su ister. |
| 144 | `vo.fen.txt.cok_su` | `assets/audio/voice/fen/txt/cok_su.wav` | ANLATICI | Çok su ister. |
| 145 | `vo.fen.txt.gol` | `assets/audio/voice/fen/txt/gol.wav` | ANLATICI | Gölde yaşayanlar |
| 146 | `vo.fen.txt.orman` | `assets/audio/voice/fen/txt/orman.wav` | ANLATICI | Ormanda yaşayanlar |
| 147 | `vo.fen.txt.toprak_alan` | `assets/audio/voice/fen/txt/toprak_alan.wav` | ANLATICI | Toprakta yaşayanlar |
| 148 | `vo.fen.txt.nemli` | `assets/audio/voice/fen/txt/nemli.wav` | ANLATICI | Nemli yerlerde yaşayanlar |
| 149 | `vo.fen.txt.kuru` | `assets/audio/voice/fen/txt/kuru.wav` | ANLATICI | Kuru yerlerde yaşayanlar |
| 150 | `vo.fen.txt.su` | `assets/audio/voice/fen/txt/su.wav` | ANLATICI | Su |
| 151 | `vo.fen.txt.agaclar` | `assets/audio/voice/fen/txt/agaclar.wav` | ANLATICI | Ağaçlar |
| 152 | `vo.fen.txt.kum_ozellik` | `assets/audio/voice/fen/txt/kum_ozellik.wav` | ANLATICI | Sıcak kum |
| 153 | `vo.fen.txt.korur` | `assets/audio/voice/fen/txt/korur.wav` | ANLATICI | Yaşam alanlarını korur. |
| 154 | `vo.fen.txt.zarar_verir` | `assets/audio/voice/fen/txt/zarar_verir.wav` | ANLATICI | Yaşam alanlarına zarar verir. |
| 155 | `vo.fen.txt.evsiz_kalir` | `assets/audio/voice/fen/txt/evsiz_kalir.wav` | ANLATICI | Evsiz kalırlar. |
| 156 | `vo.fen.txt.cogalirlar` | `assets/audio/voice/fen/txt/cogalirlar.wav` | ANLATICI | Çoğalırlar. |
| 157 | `vo.fen.txt.degismez` | `assets/audio/voice/fen/txt/degismez.wav` | ANLATICI | Hiçbir şey değişmez. |
| 158 | `vo.fen.txt.canlilar_artar` | `assets/audio/voice/fen/txt/canlilar_artar.wav` | ANLATICI | Canlılar artar. |
| 159 | `vo.fen.txt.canlilar_gider` | `assets/audio/voice/fen/txt/canlilar_gider.wav` | ANLATICI | Canlılar gider. |
| 160 | `vo.fen.txt.gol_kurur` | `assets/audio/voice/fen/txt/gol_kurur.wav` | ANLATICI | Göl kurur. |
| 161 | `vo.fen.ad.yol_gozlem` | `assets/audio/voice/fen/ad/yol_gozlem.wav` | ANLATICI | Gözlem yapmak |
| 162 | `vo.fen.ad.yol_deney` | `assets/audio/voice/fen/ad/yol_deney.wav` | ANLATICI | Deney yapmak |
| 163 | `vo.fen.ad.yol_kaynak` | `assets/audio/voice/fen/ad/yol_kaynak.wav` | ANLATICI | Kaynaklardan araştırmak |
| 164 | `vo.fen.ad.mikroskop` | `assets/audio/voice/fen/ad/mikroskop.wav` | ANLATICI | Mikroskopla görülebilen canlılar |

---
## Teslim kontrol listesi
- [ ] Dosya adları ve yolları tablodaki ile birebir aynı
- [ ] Sesler 005'teki Anlatıcı ve Bilge sesleriyle aynı
- [ ] Commit: `assets: 096 fen seslendirmesi 2 (ünite 5-8, ortak kartlar)`
