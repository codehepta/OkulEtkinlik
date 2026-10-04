# 095 · Fen Bilimleri 3 seslendirmesi: ünite 1–4 (Gemini TTS)

**Öncelik: ORTA** (Faz 6, Keşif Laboratuvarı). `content/g3/fen/u01–u04.json` durak girişleri (Bilge), tur yönergeleri, ipuçları, dinle-bul hedefleri ve hikâye sayfaları.

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
| 1 | `vo.g3.fen.u01.n01.intro` | `assets/audio/voice/g3/fen/u01/n01/intro.wav` | BILGE | Merak ettiğimiz bir şeyi nasıl öğreniriz? Gözlem yaparak, deney yaparak ya da kaynaklardan araştırarak! Her soru için en uygun yolu birlikte seçelim. |
| 2 | `vo.g3.fen.u01.n01.r01` | `assets/audio/voice/g3/fen/u01/n01/r01.wav` | ANLATICI | Can, dinozorların nasıl yaşadığını merak ediyor. Dinozorlar çok uzun zaman önce yaşadı, bugün onları göremeyiz. Can bilgiye nasıl ulaşmalı? |
| 3 | `vo.g3.fen.u01.n01.r01.ipucu` | `assets/audio/voice/g3/fen/u01/n01/r01/ipucu.wav` | ANLATICI | Dinozorları bugün göremeyiz. Onları anlatan kitaplara ve müzelere bakabiliriz. |
| 4 | `vo.g3.fen.u01.n01.r02` | `assets/audio/voice/g3/fen/u01/n01/r02.wav` | ANLATICI | Ela, hangi oyuncakların suda yüzdüğünü öğrenmek istiyor. Bunun için en uygun yol hangisi? |
| 5 | `vo.g3.fen.u01.n01.r02.ipucu` | `assets/audio/voice/g3/fen/u01/n01/r02/ipucu.wav` | ANLATICI | Oyuncakları tek tek suya koyup denemek en iyi yoldur. Buna deney denir. |
| 6 | `vo.g3.fen.u01.n01.r03` | `assets/audio/voice/g3/fen/u01/n01/r03.wav` | ANLATICI | Mert, kuşların yemlikteki hangi yemi en çok yediğini öğrenmek istiyor. Bunun için en uygun yol hangisi? |
| 7 | `vo.g3.fen.u01.n01.r03.ipucu` | `assets/audio/voice/g3/fen/u01/n01/r03/ipucu.wav` | ANLATICI | Kuşları birkaç gün izleyip hangi kaba gittiklerini not almak, yani gözlem yapmak en uygun yoldur. |
| 8 | `vo.g3.fen.u01.n01.r04` | `assets/audio/voice/g3/fen/u01/n01/r04.wav` | ANLATICI | Her merak konusunu, onu öğrenmenin en uygun yoluna yerleştir: gözlem, deney ya da kaynaklardan araştırma. Kutulara dokunursan adlarını duyarsın. |
| 9 | `vo.g3.fen.u01.n02.intro` | `assets/audio/voice/g3/fen/u01/n02/intro.wav` | BILGE | Bilim insanları kimlerdir, nasıl çalışırlar? İki bilim insanıyla tanışalım ve onlarda ortak olan özellikleri bulalım! |
| 10 | `vo.g3.fen.u01.n02.r01` | `assets/audio/voice/g3/fen/u01/n02/r01.wav` | ANLATICI | Bilim insanlarının hikâyesini dinle. Sonra soruları cevapla. |
| 11 | `vo.g3.fen.u01.n02.r01.p1` | `assets/audio/voice/g3/fen/u01/n02/r01/p1.wav` | ANLATICI | Deniz Hanım bir bitki bilimcidir. Bitkileri çok merak eder. Onları büyüteçle inceler ve gördüklerini not alır. |
| 12 | `vo.g3.fen.u01.n02.r01.p2` | `assets/audio/voice/g3/fen/u01/n02/r01/p2.wav` | ANLATICI | Deniz Hanım bir tohumun filizlenmesini günlerce sabırla bekler. Boş zamanlarında resim yapar. |
| 13 | `vo.g3.fen.u01.n02.r01.p3` | `assets/audio/voice/g3/fen/u01/n02/r01/p3.wav` | ANLATICI | Kerem Bey bir gök bilimcidir. Gökyüzünü çok merak eder. Geceleri teleskopla yıldızları inceler ve not alır. |
| 14 | `vo.g3.fen.u01.n02.r01.p4` | `assets/audio/voice/g3/fen/u01/n02/r01/p4.wav` | ANLATICI | Kerem Bey bir yıldızı görmek için saatlerce sabırla bekler. Boş zamanlarında keman çalar. |
| 15 | `vo.g3.fen.u01.n02.r01.q1` | `assets/audio/voice/g3/fen/u01/n02/r01/q1.wav` | ANLATICI | Deniz Hanım neyi inceliyor? |
| 16 | `vo.g3.fen.u01.n02.r01.q2` | `assets/audio/voice/g3/fen/u01/n02/r01/q2.wav` | ANLATICI | Kerem Bey boş zamanlarında ne yapıyor? |
| 17 | `vo.g3.fen.u01.n02.r02` | `assets/audio/voice/g3/fen/u01/n02/r02.wav` | ANLATICI | Deniz Hanım ile Kerem Bey'i düşün. İkisinde de olan özellikleri Ortak kutusuna, yalnızca birinde olanları Farklı kutusuna koy. |
| 18 | `vo.g3.fen.u01.n02.r03` | `assets/audio/voice/g3/fen/u01/n02/r03.wav` | ANLATICI | Dinle ve düşün. Bilim insanları hakkında ne söyleyebiliriz? |
| 19 | `vo.g3.fen.u01.n02.r03.p1` | `assets/audio/voice/g3/fen/u01/n02/r03/p1.wav` | ANLATICI | Bilim insanları farklı konuları inceler. Kimi bitkileri, kimi yıldızları, kimi taşları araştırır. Ama hepsi merak eder, soru sorar, dikkatle gözlem yapar ve sabırla çalışır. |
| 20 | `vo.g3.fen.u01.n02.r03.q1` | `assets/audio/voice/g3/fen/u01/n02/r03/q1.wav` | ANLATICI | Bilim insanları için hangisi doğrudur? |
| 21 | `vo.g3.fen.u01.n02.r03.q2` | `assets/audio/voice/g3/fen/u01/n02/r03/q2.wav` | ANLATICI | Yeni tanıdığın bir bilim insanı için ne söyleyebilirsin? |
| 22 | `vo.g3.fen.u02.n01.intro` | `assets/audio/voice/g3/fen/u02/n01/intro.wav` | BILGE | Canlılar dünyasına hoş geldin! Bitkiler, hayvanlar, mantarlar ve mikroskopla görülebilen canlılar var. Bir uyarı: Doğada gördüğün mantarlara dokunma, bazıları zehirli olabilir! |
| 23 | `vo.g3.fen.u02.n01.r01` | `assets/audio/voice/g3/fen/u02/n01/r01.wav` | ANLATICI | Bitkileri Bitkiler kutusuna, hayvanları Hayvanlar kutusuna koy. |
| 24 | `vo.g3.fen.u02.n01.r02` | `assets/audio/voice/g3/fen/u02/n01/r02.wav` | ANLATICI | Şimdi üç kutu var: mantarlar, bitkiler ve hayvanlar. Ekmekteki küf de bir mantardır! Her canlıyı kendi grubuna koy. |
| 25 | `vo.g3.fen.u02.n01.r03` | `assets/audio/voice/g3/fen/u02/n01/r03.wav` | ANLATICI | Bazı canlılar o kadar küçüktür ki onları ancak mikroskopla görebiliriz. Mikroskoplu kutu onlar için. Her canlıyı doğru gruba koy. |
| 26 | `vo.g3.fen.u02.n01.r04` | `assets/audio/voice/g3/fen/u02/n01/r04.wav` | ANLATICI | Her canlıyı kendi grubunun etiketiyle eşleştir. |
| 27 | `vo.g3.fen.u02.n02.intro` | `assets/audio/voice/g3/fen/u02/n02/intro.wav` | BILGE | Canlılar çevrelerini algılar. Biz gözümüzle görür, kulağımızla duyar, burnumuzla koklarız. Ya diğer canlılar? Haydi keşfedelim! |
| 28 | `vo.g3.fen.u02.n02.r01` | `assets/audio/voice/g3/fen/u02/n02/r01.wav` | ANLATICI | Her duyu organını, onunla algıladığımız şeyle eşleştir. |
| 29 | `vo.g3.fen.u02.n02.r02` | `assets/audio/voice/g3/fen/u02/n02/r02.wav` | ANLATICI | Her duyu organını, onunla algıladığımız şeyle eşleştir. Limonun ekşi tadını ve tüyün yumuşaklığını unutma! |
| 30 | `vo.g3.fen.u02.n02.r03` | `assets/audio/voice/g3/fen/u02/n02/r03.wav` | ANLATICI | Dinle ve doğru karta dokun. |
| 31 | `vo.g3.fen.u02.n02.r03.hedef` | `assets/audio/voice/g3/fen/u02/n02/r03/hedef.wav` | ANLATICI | Küstüm otunun yapraklarına dokununca yaprakları kapandı. Küstüm otu neyi algıladı? |
| 32 | `vo.g3.fen.u02.n02.r04` | `assets/audio/voice/g3/fen/u02/n02/r04.wav` | ANLATICI | Ayçiçeği güneşe doğru döner. Kelebek antenleriyle koku alır. Örümcek, ağına konan böceği bacaklarındaki tüylerle hisseder. Her canlıyı, algıladığı şeyin kutusuna koy. |
| 33 | `vo.g3.fen.u02.n03.intro` | `assets/audio/voice/g3/fen/u02/n03/intro.wav` | BILGE | Her canlı doğar, büyür ve çoğalır. Buna yaşam döngüsü denir. Kelebeğin, kurbağanın ve tavuğun döngüsünü sıralayalım! |
| 34 | `vo.g3.fen.u02.n03.r01` | `assets/audio/voice/g3/fen/u02/n03/r01.wav` | ANLATICI | Kelebeğin yaşam döngüsünü sırala: yumurta, tırtıl, pupa ve kelebek. |
| 35 | `vo.g3.fen.u02.n03.r02` | `assets/audio/voice/g3/fen/u02/n03/r02.wav` | ANLATICI | Kurbağanın yaşam döngüsünü baştan sona sırala. |
| 36 | `vo.g3.fen.u02.n03.r03` | `assets/audio/voice/g3/fen/u02/n03/r03.wav` | ANLATICI | Yaşam döngüsü hep tekrar eder. Kelebek yumurtlar, döngü yeniden başlar. Boş yere ne gelmeli? |
| 37 | `vo.g3.fen.u02.n03.r04` | `assets/audio/voice/g3/fen/u02/n03/r04.wav` | ANLATICI | Bu kez yeni bir canlı: tavuk. Onun yaşam döngüsünü de sırala. |
| 38 | `vo.g3.fen.u02.n03.r05` | `assets/audio/voice/g3/fen/u02/n03/r05.wav` | ANLATICI | Dinle ve doğru karta dokun. |
| 39 | `vo.g3.fen.u02.n03.r05.hedef` | `assets/audio/voice/g3/fen/u02/n03/r05/hedef.wav` | ANLATICI | Kelebek, kurbağa ve fasulyenin yaşam döngüleri aynı değil. Ama üçünde de ortak olan bir şey var. Nedir? |
| 40 | `vo.g3.fen.u03.n01.intro` | `assets/audio/voice/g3/fen/u03/n01/intro.wav` | BILGE | Yer bilimciler iş başında! Kayaçlar minerallerden oluşur. Ekonomik değeri olan ve çıkarılıp kullanılan kayaç ve minerallere de maden denir. |
| 41 | `vo.g3.fen.u03.n01.r01` | `assets/audio/voice/g3/fen/u03/n01/r01.wav` | ANLATICI | Dinle ve doğru taşa dokun. |
| 42 | `vo.g3.fen.u03.n01.r01.hedef` | `assets/audio/voice/g3/fen/u03/n01/r01/hedef.wav` | ANLATICI | Mermer |
| 43 | `vo.g3.fen.u03.n01.r02` | `assets/audio/voice/g3/fen/u03/n01/r02.wav` | ANLATICI | Dinle ve doğru olana dokun. |
| 44 | `vo.g3.fen.u03.n01.r02.hedef` | `assets/audio/voice/g3/fen/u03/n01/r02/hedef.wav` | ANLATICI | Kuvars. Kristal gibi parlayan bir mineral. |
| 45 | `vo.g3.fen.u03.n01.r03` | `assets/audio/voice/g3/fen/u03/n01/r03.wav` | ANLATICI | Madenleri, kullanıldıkları yerle eşleştir. |
| 46 | `vo.g3.fen.u03.n01.r04` | `assets/audio/voice/g3/fen/u03/n01/r04.wav` | ANLATICI | Dinle ve doğru karta dokun. |
| 47 | `vo.g3.fen.u03.n01.r04.hedef` | `assets/audio/voice/g3/fen/u03/n01/r04/hedef.wav` | ANLATICI | Bütün kayaçlar minerallerden oluşur. Granit de bir kayaçtır. Öyleyse granit neyden oluşur? |
| 48 | `vo.g3.fen.u03.n01.r05` | `assets/audio/voice/g3/fen/u03/n01/r05.wav` | ANLATICI | Dinle ve doğru karta dokun. |
| 49 | `vo.g3.fen.u03.n01.r05.hedef` | `assets/audio/voice/g3/fen/u03/n01/r05/hedef.wav` | ANLATICI | Yer altından çıkarılan ve ekonomik değeri olan kayaç ve minerallere maden denir. Kömür yer altından çıkarılır ve ısınmada kullanılır. Öyleyse kömür nedir? |
| 50 | `vo.g3.fen.u03.n02.intro` | `assets/audio/voice/g3/fen/u03/n02/intro.wav` | BILGE | Fosiller, çok uzun zaman önce yaşamış canlıların taşlaşmış kalıntılarıdır. Fosilleri inceleyen bilim insanlarına paleontolog denir. Bir fosilin oluşumunu adım adım izleyelim! |
| 51 | `vo.g3.fen.u03.n02.r01` | `assets/audio/voice/g3/fen/u03/n02/r01.wav` | ANLATICI | Fosilin oluşumunu sırala: önce iskelet göl dibinde, sonra çamurla örtülür, en sonunda bulunur. |
| 52 | `vo.g3.fen.u03.n02.r02` | `assets/audio/voice/g3/fen/u03/n02/r02.wav` | ANLATICI | Fosil oluşumunun her aşamasını, o aşamada olanı anlatan kartla eşleştir. |
| 53 | `vo.g3.fen.u03.n02.r03` | `assets/audio/voice/g3/fen/u03/n02/r03.wav` | ANLATICI | Fosilleri inceleyen bilim insanına paleontolog denir. Her bilim insanını, incelediği şeyle eşleştir. |
| 54 | `vo.g3.fen.u03.n02.r04` | `assets/audio/voice/g3/fen/u03/n02/r04.wav` | ANLATICI | Şimdi bütün aşamalar var. Fosilin oluşumunu baştan sona sırala. |
| 55 | `vo.g3.fen.u04.n01.intro` | `assets/audio/voice/g3/fen/u04/n01/intro.wav` | BILGE | Çevremizdeki her şey maddedir. Maddeler katı, sıvı ya da gaz hâlinde olabilir. Taş katıdır, su sıvıdır, balondaki hava gazdır! |
| 56 | `vo.g3.fen.u04.n01.r01` | `assets/audio/voice/g3/fen/u04/n01/r01.wav` | ANLATICI | Katı maddeleri Katı kutusuna, sıvı maddeleri Sıvı kutusuna koy. |
| 57 | `vo.g3.fen.u04.n01.r02` | `assets/audio/voice/g3/fen/u04/n01/r02.wav` | ANLATICI | Dinle ve doğru maddeye dokun. |
| 58 | `vo.g3.fen.u04.n01.r02.hedef` | `assets/audio/voice/g3/fen/u04/n01/r02/hedef.wav` | ANLATICI | Akar ve konduğu kabın şeklini alır. |
| 59 | `vo.g3.fen.u04.n01.r03` | `assets/audio/voice/g3/fen/u04/n01/r03.wav` | ANLATICI | Şimdi bir de gaz kutusu var. Çaydanlıktan çıkan su buharı ve balondaki hava gazdır. Her maddeyi hâline göre ayır. |
| 60 | `vo.g3.fen.u04.n01.r04` | `assets/audio/voice/g3/fen/u04/n01/r04.wav` | ANLATICI | Her maddeyi niteliğiyle eşleştir: sert, esnek, kırılgan ya da yumuşak. |
| 61 | `vo.g3.fen.u04.n02.intro` | `assets/audio/voice/g3/fen/u04/n02/intro.wav` | BILGE | Karışımları ayırmanın farklı yolları var: mıknatısla ayırma, eleme, süzme ve dinlendirme. Her karışım için en uygun yöntemi seçelim! |
| 62 | `vo.g3.fen.u04.n02.r01` | `assets/audio/voice/g3/fen/u04/n02/r01.wav` | ANLATICI | Demir tozu ile talaş karışmış. Demir tozunu ayırmak için hangisini kullanmalıyız? |
| 63 | `vo.g3.fen.u04.n02.r01.ipucu` | `assets/audio/voice/g3/fen/u04/n02/r01/ipucu.wav` | ANLATICI | Mıknatıs demiri çeker, talaşı çekmez. |
| 64 | `vo.g3.fen.u04.n02.r02` | `assets/audio/voice/g3/fen/u04/n02/r02.wav` | ANLATICI | Kum ile nohut karışmış. Onları ayırmak için hangi yöntemi kullanmalıyız? |
| 65 | `vo.g3.fen.u04.n02.r02.ipucu` | `assets/audio/voice/g3/fen/u04/n02/r02/ipucu.wav` | ANLATICI | Elek, küçük kum tanelerini geçirir, iri nohutları üstünde tutar. |
| 66 | `vo.g3.fen.u04.n02.r03` | `assets/audio/voice/g3/fen/u04/n02/r03.wav` | ANLATICI | Su ile kum karışmış. Kumu sudan ayırmak için hangi yöntemi kullanmalıyız? |
| 67 | `vo.g3.fen.u04.n02.r03.ipucu` | `assets/audio/voice/g3/fen/u04/n02/r03/ipucu.wav` | ANLATICI | Süzgeç kâğıdı suyu geçirir, kumu tutar. |
| 68 | `vo.g3.fen.u04.n02.r04` | `assets/audio/voice/g3/fen/u04/n02/r04.wav` | ANLATICI | Suya zeytinyağı döküldü. Onları ayırmak için hangi yöntemi kullanmalıyız? |
| 69 | `vo.g3.fen.u04.n02.r04.ipucu` | `assets/audio/voice/g3/fen/u04/n02/r04/ipucu.wav` | ANLATICI | Karışımı bir süre bekletirsek zeytinyağı suyun üstünde toplanır. |
| 70 | `vo.g3.fen.u04.n02.r05` | `assets/audio/voice/g3/fen/u04/n02/r05.wav` | ANLATICI | Her karışımı, onu ayırmanın en uygun yöntemiyle eşleştir. |
| 71 | `vo.g3.fen.u04.n03.intro` | `assets/audio/voice/g3/fen/u04/n03/intro.wav` | BILGE | Atıkları türlerine göre ayırırsak onlar yeniden kullanılabilir ve doğa korunur. Kâğıt, plastik ve cam atıkları ayıralım! |
| 72 | `vo.g3.fen.u04.n03.r01` | `assets/audio/voice/g3/fen/u04/n03/r01.wav` | ANLATICI | Kâğıt atıkları Kâğıt kutusuna, plastik atıkları Plastik kutusuna koy. |
| 73 | `vo.g3.fen.u04.n03.r02` | `assets/audio/voice/g3/fen/u04/n03/r02.wav` | ANLATICI | Şimdi bir de cam kutusu var. Her atığı doğru kutuya koy. |
| 74 | `vo.g3.fen.u04.n03.r03` | `assets/audio/voice/g3/fen/u04/n03/r03.wav` | ANLATICI | Okulun çöp kutusunda kâğıt, plastik ve cam atıklar hep karışık. Bu sorunu çözmek için hangisini önerirsin? |
| 75 | `vo.g3.fen.u04.n03.r03.ipucu` | `assets/audio/voice/g3/fen/u04/n03/r03/ipucu.wav` | ANLATICI | Atıkları türlerine göre ayrı kutulara koymak, onları yeniden kullanmayı kolaylaştırır. |
| 76 | `vo.g3.fen.u04.n03.r04` | `assets/audio/voice/g3/fen/u04/n03/r04.wav` | ANLATICI | Ali, cam şişeyi kâğıt kutusuna attı ve fark etmez dedi. Sence ne olur? |
| 77 | `vo.g3.fen.u04.n03.r04.ipucu` | `assets/audio/voice/g3/fen/u04/n03/r04/ipucu.wav` | ANLATICI | Karışan atıkları yeniden ayırmak gerekir. Bu da işi zorlaştırır. |

---
## Teslim kontrol listesi
- [ ] Dosya adları ve yolları tablodaki ile birebir aynı
- [ ] Sesler 005'teki Anlatıcı ve Bilge sesleriyle aynı
- [ ] Commit: `assets: 095 fen seslendirmesi 1 (ünite 1-4)`
