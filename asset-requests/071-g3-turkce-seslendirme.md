# 071 · 3. sınıf Türkçe seslendirmesi (8 tema)

**Öncelik: YÜKSEK** (Faz 4c). `content/g3/turkce/u01.json`–`u08.json` duraklarının Bilge girişleri, tur yönergeleri, hikâye sayfaları, sorular, ipuçları ve nazik sonuç satırları. Kart sözcükleri (`vo.tk.*`) 072'de.

> Bu dosya eklenmeden de oyun çalışır: eksik satırları cihazın Türkçe sesiyle okur. Gerçek kayıtlar geldiğinde kalite çok artar.

## Nasıl üretilir
1. **Google AI Studio → "Generate speech"** (Gemini TTS) ekranını aç. Çoklu konuşmacı modunu kapat, tek konuşmacı kullan.
2. **Ses seçimi:** 005'in en altındaki "Seçilen sesler" bölümüne yazdığın **aynı iki sesi** kullan (Anlatıcı ve Bilge).
3. Her satır için konuşmacının **üslup talimatını** "Style instructions / system" kısmına, **Metin** alanını konuşma metnine yapıştır.
4. Çıktıyı (`.wav`) **Dosya yolu** sütunundaki isimle kaydet. Klasörler yoksa oluştur. `.wav` kabul edilir; istersen `.ogg`'ye çevirebilirsin (mono, 22–44 kHz).
5. Dinleyip kontrol et: Türkçe telaffuz doğru mu, tempo çocuk için yeterince yavaş mı?

## Ortak üslup talimatları
- **ANLATICI:** `Sıcak, sakin ve net bir sesle, 7-9 yaşındaki bir çocuğa konuşur gibi, yavaş ve anlaşılır oku. Kelimeleri tane tane söyle, cümle sonlarında kısa bir duraklama yap.`
- **BILGE:** `Neşeli, sevimli ve enerjik bir çizgi film karakteri gibi konuş. Gülümseyerek, coşkulu ama anlaşılır ve çok hızlı olmayan bir tempoyla söyle.`

Ek not (hikâye sayfaları): Metni bir masal okur gibi, noktalama işaretlerine uyarak oku; tırnak içindeki konuşmaları hafif bir ses değişikliğiyle ver.

## Satırlar

| # | Kimlik (anahtar) | Dosya yolu | Konuşmacı | Metin |
|---|---|---|---|---|
| 1 | `vo.g3.turkce.u01.n01.intro` | `assets/audio/voice/g3/turkce/u01/n01/intro.wav` | BILGE | Merhaba! Güzel değerlerimizi anlatan iki hikâye dinleyeceğiz. Kulaklarını iyice aç! |
| 2 | `vo.g3.turkce.u01.n01.r01` | `assets/audio/voice/g3/turkce/u01/n01/r01.wav` | ANLATICI | Zeynep'in hikâyesini dikkatle dinle. Sonra soruları cevapla. |
| 3 | `vo.g3.turkce.u01.n01.r01.p1` | `assets/audio/voice/g3/turkce/u01/n01/r01/p1.wav` | ANLATICI | Sınıfa yeni bir öğrenci geldi. Adı Kerem'di. Resim dersinde boyaları olmadığı için üzgün üzgün oturuyordu. |
| 4 | `vo.g3.turkce.u01.n01.r01.p2` | `assets/audio/voice/g3/turkce/u01/n01/r01/p2.wav` | ANLATICI | Zeynep bunu fark etti. Kalem kutusunu Kerem'in sırasına koydu ve "İstediğin rengi alabilirsin." dedi. |
| 5 | `vo.g3.turkce.u01.n01.r01.p3` | `assets/audio/voice/g3/turkce/u01/n01/r01/p3.wav` | ANLATICI | Kerem gülümsedi ve güzel bir deniz resmi yaptı. Teneffüste iki arkadaş birlikte oyun oynadı. |
| 6 | `vo.g3.turkce.u01.n01.r01.q1` | `assets/audio/voice/g3/turkce/u01/n01/r01/q1.wav` | ANLATICI | Kerem neden üzgündü? |
| 7 | `vo.g3.turkce.u01.n01.r01.q2` | `assets/audio/voice/g3/turkce/u01/n01/r01/q2.wav` | ANLATICI | Bu hikâyenin ana fikri nedir? |
| 8 | `vo.g3.turkce.u01.n01.r01.q3` | `assets/audio/voice/g3/turkce/u01/n01/r01/q3.wav` | ANLATICI | Sence ertesi gün ne olur? |
| 9 | `vo.g3.turkce.u01.n01.r02` | `assets/audio/voice/g3/turkce/u01/n01/r02.wav` | ANLATICI | Emir'in hikâyesini dinle. Sonra soruları cevapla. |
| 10 | `vo.g3.turkce.u01.n01.r02.p1` | `assets/audio/voice/g3/turkce/u01/n01/r02/p1.wav` | ANLATICI | Emir salonda topla oynuyordu. Top birden masaya çarptı ve annesinin sevdiği vazo yere düşüp kırıldı. |
| 11 | `vo.g3.turkce.u01.n01.r02.p2` | `assets/audio/voice/g3/turkce/u01/n01/r02/p2.wav` | ANLATICI | Emir çok korktu ama saklanmadı. Annesine gidip "Vazoyu ben kırdım, özür dilerim." dedi. |
| 12 | `vo.g3.turkce.u01.n01.r02.p3` | `assets/audio/voice/g3/turkce/u01/n01/r02/p3.wav` | ANLATICI | Annesi Emir'e sarıldı. "Doğruyu söylediğin için seninle gurur duyuyorum." dedi. Emir rahatladı. |
| 13 | `vo.g3.turkce.u01.n01.r02.q1` | `assets/audio/voice/g3/turkce/u01/n01/r02/q1.wav` | ANLATICI | Vazo nasıl kırıldı? |
| 14 | `vo.g3.turkce.u01.n01.r02.q2` | `assets/audio/voice/g3/turkce/u01/n01/r02/q2.wav` | ANLATICI | Hikâyedeki ana duygu nedir? |
| 15 | `vo.g3.turkce.u01.n01.r02.q3` | `assets/audio/voice/g3/turkce/u01/n01/r02/q3.wav` | ANLATICI | Emir'in yaptığı hangi değeri gösterir? |
| 16 | `vo.g3.turkce.u01.n01.r03` | `assets/audio/voice/g3/turkce/u01/n01/r03.wav` | ANLATICI | Hangisi Zeynep'in, hangisi Emir'in hikâyesindeydi? Kartları doğru kutuya taşı. |
| 17 | `vo.g3.turkce.u01.n02.intro` | `assets/audio/voice/g3/turkce/u01/n02/intro.wav` | BILGE | Konuşurken ve dinlerken doğru seçimi yapmak önemlidir. Haydi birlikte düşünelim! |
| 18 | `vo.g3.turkce.u01.n02.r01` | `assets/audio/voice/g3/turkce/u01/n02/r01.wav` | ANLATICI | Otobüste yaşlı bir teyze ayakta duruyor. Ona yerini vermek istiyorsun. Ne dersin? |
| 19 | `vo.g3.turkce.u01.n02.r01.hint` | `assets/audio/voice/g3/turkce/u01/n02/r01/hint.wav` | BILGE | Büyüklerimize saygılı ve nazik sözlerle seslenelim. |
| 20 | `vo.g3.turkce.u01.n02.r01.c2` | `assets/audio/voice/g3/turkce/u01/n02/r01/c2.wav` | ANLATICI | Teyze bu sözü biraz kaba buldu. Büyüklerimize "Buyurun" deriz. |
| 21 | `vo.g3.turkce.u01.n02.r01.c3` | `assets/audio/voice/g3/turkce/u01/n02/r01/c3.wav` | ANLATICI | Teyze yerin boş olduğunu anlamadı. Nazikçe söylemek gerekir. |
| 22 | `vo.g3.turkce.u01.n02.r02` | `assets/audio/voice/g3/turkce/u01/n02/r02.wav` | ANLATICI | Arkadaşın yere düştü ve dizi acıdı. Ona nasıl seslenirsin? |
| 23 | `vo.g3.turkce.u01.n02.r02.hint` | `assets/audio/voice/g3/turkce/u01/n02/r02/hint.wav` | BILGE | Canı yanan birine yumuşak ve yardımsever bir sesle konuşuruz. |
| 24 | `vo.g3.turkce.u01.n02.r02.c2` | `assets/audio/voice/g3/turkce/u01/n02/r02/c2.wav` | ANLATICI | Arkadaşın daha çok üzüldü. Önce onun iyi olup olmadığını soralım. |
| 25 | `vo.g3.turkce.u01.n02.r02.c3` | `assets/audio/voice/g3/turkce/u01/n02/r02/c3.wav` | ANLATICI | Arkadaşın kırıldı. Canı yanana gülmeyiz, yardım ederiz. |
| 26 | `vo.g3.turkce.u01.n02.r03` | `assets/audio/voice/g3/turkce/u01/n02/r03.wav` | ANLATICI | Öğretmenin yarınki gezinin kurallarını anlatıyor. Unutmamak için ne yaparsın? |
| 27 | `vo.g3.turkce.u01.n02.r03.hint` | `assets/audio/voice/g3/turkce/u01/n02/r03/hint.wav` | BILGE | Önemli bilgileri unutmamak için bir yol var. Defterini düşün. |
| 28 | `vo.g3.turkce.u01.n02.r03.c2` | `assets/audio/voice/g3/turkce/u01/n02/r03/c2.wav` | ANLATICI | Resim güzel oldu ama kurallar aklında kalmadı. |
| 29 | `vo.g3.turkce.u01.n02.r03.c3` | `assets/audio/voice/g3/turkce/u01/n02/r03/c3.wav` | ANLATICI | Dikkatin dağıldı. Kuralları kaçırdın. |
| 30 | `vo.g3.turkce.u01.n02.r04` | `assets/audio/voice/g3/turkce/u01/n02/r04.wav` | ANLATICI | Okula bir itfaiyeci gelecek. Ondan çok şey öğrenmek istiyorsun. Önceden ne hazırlarsın? |
| 31 | `vo.g3.turkce.u01.n02.r04.c2` | `assets/audio/voice/g3/turkce/u01/n02/r04/c2.wav` | ANLATICI | Oyuncaklar eğlenceli ama merak ettiklerini öğrenmene yardım etmez. |
| 32 | `vo.g3.turkce.u01.n02.r04.c3` | `assets/audio/voice/g3/turkce/u01/n02/r04/c3.wav` | ANLATICI | Şarkı söylemek güzel ama itfaiyeciyi dinlemek için soru hazırlarız. |
| 33 | `vo.g3.turkce.u01.n03.intro` | `assets/audio/voice/g3/turkce/u01/n03/intro.wav` | BILGE | Şimdi metni kendin sessizce oku. Takıldığın yerde hoparlöre dokunabilirsin. |
| 34 | `vo.g3.turkce.u01.n03.r01` | `assets/audio/voice/g3/turkce/u01/n03/r01.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 35 | `vo.g3.turkce.u01.n03.r01.p1` | `assets/audio/voice/g3/turkce/u01/n03/r01/p1.wav` | ANLATICI | Defne aylardır kumbarasında para biriktiriyordu. Kendine yeni bir oyuncak almak istiyordu. |
| 36 | `vo.g3.turkce.u01.n03.r01.p2` | `assets/audio/voice/g3/turkce/u01/n03/r01/p2.wav` | ANLATICI | Bir gün okulda, kışın üşüyen çocuklar için mont toplanacağını duydu. Bütün akşam bunu düşündü. |
| 37 | `vo.g3.turkce.u01.n03.r01.p3` | `assets/audio/voice/g3/turkce/u01/n03/r01/p3.wav` | ANLATICI | Ertesi gün kumbarasını öğretmenine verdi. "Bir çocuk sıcacık olsun." dedi. İçi mutlulukla doldu. |
| 38 | `vo.g3.turkce.u01.n03.r01.q1` | `assets/audio/voice/g3/turkce/u01/n03/r01/q1.wav` | ANLATICI | Bu metnin başlığı hangisi olabilir? |
| 39 | `vo.g3.turkce.u01.n03.r01.q2` | `assets/audio/voice/g3/turkce/u01/n03/r01/q2.wav` | ANLATICI | Metnin ana fikri nedir? |
| 40 | `vo.g3.turkce.u01.n03.r01.q3` | `assets/audio/voice/g3/turkce/u01/n03/r01/q3.wav` | ANLATICI | Defne parasını önce ne için biriktiriyordu? |
| 41 | `vo.g3.turkce.u01.n03.r02` | `assets/audio/voice/g3/turkce/u01/n03/r02.wav` | ANLATICI | Eş anlamlı sözcükleri eşleştir. |
| 42 | `vo.g3.turkce.u01.n03.r03` | `assets/audio/voice/g3/turkce/u01/n03/r03.wav` | ANLATICI | Bu sözlerde altın gerçek anlamda mı, mecaz anlamda mı? Kartları doğru kutuya taşı. |
| 43 | `vo.g3.turkce.u01.n04.intro` | `assets/audio/voice/g3/turkce/u01/n04/intro.wav` | BILGE | Bir konuşmayı dinleyip sonunu tahmin edelim. Bakalım sen ne düşüneceksin? |
| 44 | `vo.g3.turkce.u01.n04.r01` | `assets/audio/voice/g3/turkce/u01/n04/r01.wav` | ANLATICI | Arda ile Selin'in konuşmasını dinle. Konuşmanın nasıl biteceğini tahmin et. |
| 45 | `vo.g3.turkce.u01.n04.r01.p1` | `assets/audio/voice/g3/turkce/u01/n04/r01/p1.wav` | ANLATICI | Arda ile Selin bahçede tek bir top buldu. Arda, "Ben futbol oynamak istiyorum." dedi. |
| 46 | `vo.g3.turkce.u01.n04.r01.p2` | `assets/audio/voice/g3/turkce/u01/n04/r01/p2.wav` | ANLATICI | Selin, "Ben de voleybol oynamak istiyorum." dedi. İkisi bir süre düşündü. |
| 47 | `vo.g3.turkce.u01.n04.r01.p3` | `assets/audio/voice/g3/turkce/u01/n04/r01/p3.wav` | ANLATICI | Arda, "Önce sen voleybol oyna, sonra ben futbol oynayayım mı?" diye sordu. |
| 48 | `vo.g3.turkce.u01.n04.r01.q1` | `assets/audio/voice/g3/turkce/u01/n04/r01/q1.wav` | ANLATICI | Selin ne cevap verir? |
| 49 | `vo.g3.turkce.u01.n04.r01.q2` | `assets/audio/voice/g3/turkce/u01/n04/r01/q2.wav` | ANLATICI | Arda nasıl bir çözüm buldu? |
| 50 | `vo.g3.turkce.u01.n04.r01.q3` | `assets/audio/voice/g3/turkce/u01/n04/r01/q3.wav` | ANLATICI | Hikâyede kaç top var? |
| 51 | `vo.g3.turkce.u01.n04.r02` | `assets/audio/voice/g3/turkce/u01/n04/r02.wav` | ANLATICI | Elif ile dedesinin konuşmasını dinle. Sonra soruları cevapla. |
| 52 | `vo.g3.turkce.u01.n04.r02.p1` | `assets/audio/voice/g3/turkce/u01/n04/r02/p1.wav` | ANLATICI | Dede, "Elif, kirazlar olgunlaştı. Bana toplamamda yardım eder misin?" diye sordu. |
| 53 | `vo.g3.turkce.u01.n04.r02.p2` | `assets/audio/voice/g3/turkce/u01/n04/r02/p2.wav` | ANLATICI | Elif, "Elbette dedeciğim! Ama ben ağaca uzanamam." dedi. Dede gülümseyip bir sepet getirdi. |
| 54 | `vo.g3.turkce.u01.n04.r02.p3` | `assets/audio/voice/g3/turkce/u01/n04/r02/p3.wav` | ANLATICI | Dede, "Ben dalları eğerim, sen de kirazları sepete koyarsın." dedi. |
| 55 | `vo.g3.turkce.u01.n04.r02.q1` | `assets/audio/voice/g3/turkce/u01/n04/r02/q1.wav` | ANLATICI | Konuşma nasıl sonuçlanır? |
| 56 | `vo.g3.turkce.u01.n04.r02.q2` | `assets/audio/voice/g3/turkce/u01/n04/r02/q2.wav` | ANLATICI | Elif neden zorlanacaktı? |
| 57 | `vo.g3.turkce.u01.n04.r02.q3` | `assets/audio/voice/g3/turkce/u01/n04/r02/q3.wav` | ANLATICI | Dede ne getirdi? |
| 58 | `vo.g3.turkce.u01.n04.r03` | `assets/audio/voice/g3/turkce/u01/n04/r03.wav` | ANLATICI | Hangisi Arda ile Selin'in, hangisi Elif ile dedesinin konuşmasındaydı? Kartları kutulara taşı. |
| 59 | `vo.g3.turkce.u01.n05.intro` | `assets/audio/voice/g3/turkce/u01/n05/intro.wav` | BILGE | Yazarken kurallara uyarız. Pekiştirmeli sözcükleri, kısaltmaları ve büyük harfleri çalışalım! |
| 60 | `vo.g3.turkce.u01.n05.r01` | `assets/audio/voice/g3/turkce/u01/n05/r01.wav` | ANLATICI | Tertemiz sözcüğünü hecelerden kur. |
| 61 | `vo.g3.turkce.u01.n05.r01.word` | `assets/audio/voice/g3/turkce/u01/n05/r01/word.wav` | ANLATICI | tertemiz |
| 62 | `vo.g3.turkce.u01.n05.r02` | `assets/audio/voice/g3/turkce/u01/n05/r02.wav` | ANLATICI | Yepyeni sözcüğünü hecelerden kur. |
| 63 | `vo.g3.turkce.u01.n05.r02.word` | `assets/audio/voice/g3/turkce/u01/n05/r02/word.wav` | ANLATICI | yepyeni |
| 64 | `vo.g3.turkce.u01.n05.r03` | `assets/audio/voice/g3/turkce/u01/n05/r03.wav` | ANLATICI | Kısaltmaya gelen eki okunuşuna göre seç. Her kısaltmayı doğru ekle eşleştir. |
| 65 | `vo.g3.turkce.u01.n05.r04` | `assets/audio/voice/g3/turkce/u01/n05/r04.wav` | ANLATICI | Bu sözcükler büyük harfle başlar. Her sözcüğü türüyle eşleştir. |
| 66 | `vo.g3.turkce.u02.n01.intro` | `assets/audio/voice/g3/turkce/u02/n01/intro.wav` | BILGE | Merhaba! Atatürk'ün çocukluğunu ve sevdiği şeyleri anlatan hikâyeler dinleyelim. |
| 67 | `vo.g3.turkce.u02.n01.r01` | `assets/audio/voice/g3/turkce/u02/n01/r01.wav` | ANLATICI | Küçük Mustafa'nın hikâyesini dikkatle dinle. Sonra soruları cevapla. |
| 68 | `vo.g3.turkce.u02.n01.r01.p1` | `assets/audio/voice/g3/turkce/u02/n01/r01/p1.wav` | ANLATICI | Mustafa, 1881 yılında Selanik'te doğdu. Annesi Zübeyde Hanım, babası Ali Rıza Efendi'ydi. |
| 69 | `vo.g3.turkce.u02.n01.r01.p2` | `assets/audio/voice/g3/turkce/u02/n01/r01/p2.wav` | ANLATICI | Mustafa okula gitmeyi çok severdi. En çok matematik dersinde başarılıydı. Soruları hızla çözerdi. |
| 70 | `vo.g3.turkce.u02.n01.r01.p3` | `assets/audio/voice/g3/turkce/u02/n01/r01/p3.wav` | ANLATICI | Matematik öğretmeni onun bu başarısını çok beğendi. Ona "Kemal" adını verdi. Artık adı Mustafa Kemal'di. |
| 71 | `vo.g3.turkce.u02.n01.r01.q1` | `assets/audio/voice/g3/turkce/u02/n01/r01/q1.wav` | ANLATICI | Mustafa hangi şehirde doğdu? |
| 72 | `vo.g3.turkce.u02.n01.r01.q2` | `assets/audio/voice/g3/turkce/u02/n01/r01/q2.wav` | ANLATICI | Mustafa'ya Kemal adını kim verdi? |
| 73 | `vo.g3.turkce.u02.n01.r01.q3` | `assets/audio/voice/g3/turkce/u02/n01/r01/q3.wav` | ANLATICI | Bu hikâyenin konusu nedir? |
| 74 | `vo.g3.turkce.u02.n01.r02` | `assets/audio/voice/g3/turkce/u02/n01/r02.wav` | ANLATICI | Sınıfın fidan dikme hikâyesini dinle. Sonra soruları cevapla. |
| 75 | `vo.g3.turkce.u02.n01.r02.p1` | `assets/audio/voice/g3/turkce/u02/n01/r02/p1.wav` | ANLATICI | Öğretmen, "Atatürk ağaçları çok severdi. Ağaç dikmeyi önemserdi." dedi. Çocuklar dikkatle dinledi. |
| 76 | `vo.g3.turkce.u02.n01.r02.p2` | `assets/audio/voice/g3/turkce/u02/n01/r02/p2.wav` | ANLATICI | Sınıf, okul bahçesine fidan dikmeye karar verdi. Herkes evden küçük bir kürek getirdi. |
| 77 | `vo.g3.turkce.u02.n01.r02.p3` | `assets/audio/voice/g3/turkce/u02/n01/r02/p3.wav` | ANLATICI | Çocuklar fidanları dikip suladı. Ali, "Bu ağaçlar büyüyünce bahçemiz yemyeşil olacak." dedi. |
| 78 | `vo.g3.turkce.u02.n01.r02.q1` | `assets/audio/voice/g3/turkce/u02/n01/r02/q1.wav` | ANLATICI | Çocuklar okul bahçesine ne dikti? |
| 79 | `vo.g3.turkce.u02.n01.r02.q2` | `assets/audio/voice/g3/turkce/u02/n01/r02/q2.wav` | ANLATICI | Hikâyenin ana fikri nedir? |
| 80 | `vo.g3.turkce.u02.n01.r02.q3` | `assets/audio/voice/g3/turkce/u02/n01/r02/q3.wav` | ANLATICI | Sence fidanlar büyüyünce ne olur? |
| 81 | `vo.g3.turkce.u02.n01.r03` | `assets/audio/voice/g3/turkce/u02/n01/r03.wav` | ANLATICI | Hangisi Mustafa'nın, hangisi fidan dikme hikâyesindeydi? Kartları doğru kutuya taşı. |
| 82 | `vo.g3.turkce.u02.n02.intro` | `assets/audio/voice/g3/turkce/u02/n02/intro.wav` | BILGE | Törenlerde, okulda ve evde nasıl konuşur, nasıl dinleriz? Birlikte karar verelim! |
| 83 | `vo.g3.turkce.u02.n02.r01` | `assets/audio/voice/g3/turkce/u02/n02/r01.wav` | ANLATICI | 23 Nisan töreninde bir şiir okuyacaksın. Nasıl okumalısın? |
| 84 | `vo.g3.turkce.u02.n02.r01.hint` | `assets/audio/voice/g3/turkce/u02/n02/r01/hint.wav` | BILGE | Herkesin duyması ve anlaması için nasıl bir ses gerekir? |
| 85 | `vo.g3.turkce.u02.n02.r01.c2` | `assets/audio/voice/g3/turkce/u02/n02/r01/c2.wav` | ANLATICI | Arkada oturanlar şiiri duyamadı. Törende açık ve gür sesle okuruz. |
| 86 | `vo.g3.turkce.u02.n02.r01.c3` | `assets/audio/voice/g3/turkce/u02/n02/r01/c3.wav` | ANLATICI | Dinleyenler sözcükleri anlayamadı. Acele etmeden okumalıyız. |
| 87 | `vo.g3.turkce.u02.n02.r02` | `assets/audio/voice/g3/turkce/u02/n02/r02.wav` | ANLATICI | Törende İstiklal Marşı çalmaya başladı. Ne yaparsın? |
| 88 | `vo.g3.turkce.u02.n02.r02.hint` | `assets/audio/voice/g3/turkce/u02/n02/r02/hint.wav` | BILGE | İstiklal Marşı'mızı saygıyla dinleriz. |
| 89 | `vo.g3.turkce.u02.n02.r02.c2` | `assets/audio/voice/g3/turkce/u02/n02/r02/c2.wav` | ANLATICI | Marşımız çalarken konuşmayız. Saygıyla dinleriz. |
| 90 | `vo.g3.turkce.u02.n02.r02.c3` | `assets/audio/voice/g3/turkce/u02/n02/r02/c3.wav` | ANLATICI | Marşımız çalarken yerimizde dik dururuz. |
| 91 | `vo.g3.turkce.u02.n02.r03` | `assets/audio/voice/g3/turkce/u02/n02/r03.wav` | ANLATICI | Atatürk'ün çocukluğunu öğrenmek istiyorsun. Hangisini dinlersin? |
| 92 | `vo.g3.turkce.u02.n02.r03.hint` | `assets/audio/voice/g3/turkce/u02/n02/r03/hint.wav` | BILGE | Bilgi veren bir program seçmelisin. |
| 93 | `vo.g3.turkce.u02.n02.r03.c2` | `assets/audio/voice/g3/turkce/u02/n02/r03/c2.wav` | ANLATICI | Ninni uyumaya yardım eder ama bilgi vermez. |
| 94 | `vo.g3.turkce.u02.n02.r03.c3` | `assets/audio/voice/g3/turkce/u02/n02/r03/c3.wav` | ANLATICI | Reklam bir ürünü tanıtır. Atatürk'ü anlatmaz. |
| 95 | `vo.g3.turkce.u02.n02.r04` | `assets/audio/voice/g3/turkce/u02/n02/r04.wav` | ANLATICI | Sınıfça bir müzeye gittiniz. Rehber eşyaları tek tek anlatıyor. Ne yaparsın? |
| 96 | `vo.g3.turkce.u02.n02.r04.c2` | `assets/audio/voice/g3/turkce/u02/n02/r04/c2.wav` | ANLATICI | Rehberin anlattıklarını kaçırdın. Dinlerken eşyalara dikkatle bakarız. |
| 97 | `vo.g3.turkce.u02.n02.r04.c3` | `assets/audio/voice/g3/turkce/u02/n02/r04/c3.wav` | ANLATICI | Gruptan ayrıldın ve anlatılanları duyamadın. |
| 98 | `vo.g3.turkce.u02.n03.intro` | `assets/audio/voice/g3/turkce/u02/n03/intro.wav` | BILGE | Şimdi bir kahramanımızın hikâyesini sessizce okuyacaksın. Takılırsan hoparlöre dokun. |
| 99 | `vo.g3.turkce.u02.n03.r01` | `assets/audio/voice/g3/turkce/u02/n03/r01.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 100 | `vo.g3.turkce.u02.n03.r01.p1` | `assets/audio/voice/g3/turkce/u02/n03/r01/p1.wav` | ANLATICI | Seyit Onbaşı, Çanakkale'de görev yapan bir askerdi. Vatanını çok seven, güçlü ve cesur biriydi. |
| 101 | `vo.g3.turkce.u02.n03.r01.p2` | `assets/audio/voice/g3/turkce/u02/n03/r01/p2.wav` | ANLATICI | Bir gün çok ağır bir top mermisini sırtına aldı. Hiç vazgeçmeden onu taşıdı. |
| 102 | `vo.g3.turkce.u02.n03.r01.p3` | `assets/audio/voice/g3/turkce/u02/n03/r01/p3.wav` | ANLATICI | Herkes onun gücüne ve cesaretine şaşırdı. Seyit Onbaşı bugün de sevgiyle anılıyor. |
| 103 | `vo.g3.turkce.u02.n03.r01.q1` | `assets/audio/voice/g3/turkce/u02/n03/r01/q1.wav` | ANLATICI | Bu metnin başlığı hangisi olabilir? |
| 104 | `vo.g3.turkce.u02.n03.r01.q2` | `assets/audio/voice/g3/turkce/u02/n03/r01/q2.wav` | ANLATICI | Metnin ana fikri nedir? |
| 105 | `vo.g3.turkce.u02.n03.r01.q3` | `assets/audio/voice/g3/turkce/u02/n03/r01/q3.wav` | ANLATICI | Seyit Onbaşı nerede görev yapıyordu? |
| 106 | `vo.g3.turkce.u02.n03.r02` | `assets/audio/voice/g3/turkce/u02/n03/r02.wav` | ANLATICI | Zıt anlamlı sözcükleri eşleştir. |
| 107 | `vo.g3.turkce.u02.n03.r03` | `assets/audio/voice/g3/turkce/u02/n03/r03.wav` | ANLATICI | Her cümlenin sonuna hangi noktalama işareti gelir? Eşleştir. |
| 108 | `vo.g3.turkce.u02.n04.intro` | `assets/audio/voice/g3/turkce/u02/n04/intro.wav` | BILGE | Konuşmaları dinle ve sonunu tahmin et. Kim ne diyecek, bakalım! |
| 109 | `vo.g3.turkce.u02.n04.r01` | `assets/audio/voice/g3/turkce/u02/n04/r01.wav` | ANLATICI | Deniz ile Bora'nın konuşmasını dinle. Konuşmanın nasıl biteceğini tahmin et. |
| 110 | `vo.g3.turkce.u02.n04.r01.p1` | `assets/audio/voice/g3/turkce/u02/n04/r01/p1.wav` | ANLATICI | Deniz, "23 Nisan için sınıfı süsleyelim mi?" diye sordu. Bora, "Çok güzel fikir!" dedi. |
| 111 | `vo.g3.turkce.u02.n04.r01.p2` | `assets/audio/voice/g3/turkce/u02/n04/r01/p2.wav` | ANLATICI | Bora, "Ama makasımız tek. İkimiz aynı anda kesemeyiz." dedi. Deniz biraz düşündü. |
| 112 | `vo.g3.turkce.u02.n04.r01.p3` | `assets/audio/voice/g3/turkce/u02/n04/r01/p3.wav` | ANLATICI | Deniz, "Ben keserim, sen de kestiklerimi duvara yapıştırırsın. Olur mu?" dedi. |
| 113 | `vo.g3.turkce.u02.n04.r01.q1` | `assets/audio/voice/g3/turkce/u02/n04/r01/q1.wav` | ANLATICI | Bora ne cevap verir? |
| 114 | `vo.g3.turkce.u02.n04.r01.q2` | `assets/audio/voice/g3/turkce/u02/n04/r01/q2.wav` | ANLATICI | Çocuklar neden süs yapıyor? |
| 115 | `vo.g3.turkce.u02.n04.r01.q3` | `assets/audio/voice/g3/turkce/u02/n04/r01/q3.wav` | ANLATICI | Bora ne iş yapacak? |
| 116 | `vo.g3.turkce.u02.n04.r02` | `assets/audio/voice/g3/turkce/u02/n04/r02.wav` | ANLATICI | Ece ile babaannesinin konuşmasını dinle. Sonra soruları cevapla. |
| 117 | `vo.g3.turkce.u02.n04.r02.p1` | `assets/audio/voice/g3/turkce/u02/n04/r02/p1.wav` | ANLATICI | Ece, "Babaanne, 23 Nisan'ı çocuklara kim armağan etti?" diye sordu. |
| 118 | `vo.g3.turkce.u02.n04.r02.p2` | `assets/audio/voice/g3/turkce/u02/n04/r02/p2.wav` | ANLATICI | Babaanne, "Atatürk armağan etti. Çocukları çok severdi." dedi. Ece çok sevindi. |
| 119 | `vo.g3.turkce.u02.n04.r02.p3` | `assets/audio/voice/g3/turkce/u02/n04/r02/p3.wav` | ANLATICI | Ece, "O zaman ben de bayramda Atatürk için bir şiir okuyacağım!" dedi. Babaanne gülümsedi. |
| 120 | `vo.g3.turkce.u02.n04.r02.q1` | `assets/audio/voice/g3/turkce/u02/n04/r02/q1.wav` | ANLATICI | Babaanne ne der? |
| 121 | `vo.g3.turkce.u02.n04.r02.q2` | `assets/audio/voice/g3/turkce/u02/n04/r02/q2.wav` | ANLATICI | 23 Nisan'ı çocuklara kim armağan etti? |
| 122 | `vo.g3.turkce.u02.n04.r02.q3` | `assets/audio/voice/g3/turkce/u02/n04/r02/q3.wav` | ANLATICI | Ece bayramda ne yapacak? |
| 123 | `vo.g3.turkce.u02.n04.r03` | `assets/audio/voice/g3/turkce/u02/n04/r03.wav` | ANLATICI | Hangisi Deniz ile Bora'nın, hangisi Ece'nin konuşmasındaydı? Kartları kutulara taşı. |
| 124 | `vo.g3.turkce.u02.n05.intro` | `assets/audio/voice/g3/turkce/u02/n05/intro.wav` | BILGE | Bayrağımızın renklerini anlatan sözcüklerle başlayalım. Sonra kısaltmalara ve büyük harflere bakalım! |
| 125 | `vo.g3.turkce.u02.n05.r01` | `assets/audio/voice/g3/turkce/u02/n05/r01.wav` | ANLATICI | Kıpkırmızı sözcüğünü hecelerden kur. |
| 126 | `vo.g3.turkce.u02.n05.r01.word` | `assets/audio/voice/g3/turkce/u02/n05/r01/word.wav` | ANLATICI | kıpkırmızı |
| 127 | `vo.g3.turkce.u02.n05.r02` | `assets/audio/voice/g3/turkce/u02/n05/r02.wav` | ANLATICI | Bembeyaz sözcüğünü hecelerden kur. |
| 128 | `vo.g3.turkce.u02.n05.r02.word` | `assets/audio/voice/g3/turkce/u02/n05/r02/word.wav` | ANLATICI | bembeyaz |
| 129 | `vo.g3.turkce.u02.n05.r03` | `assets/audio/voice/g3/turkce/u02/n05/r03.wav` | ANLATICI | Kısaltmaya gelen eki okunuşuna göre seç. Her kısaltmayı doğru ekle eşleştir. |
| 130 | `vo.g3.turkce.u02.n05.r04` | `assets/audio/voice/g3/turkce/u02/n05/r04.wav` | ANLATICI | Bu sözcükler büyük harfle başlar. Her sözcüğü türüyle eşleştir. |
| 131 | `vo.g3.turkce.u03.n01.intro` | `assets/audio/voice/g3/turkce/u03/n01/intro.wav` | BILGE | Merhaba! Doğada neler oluyor? İki hikâye dinleyerek öğrenelim. |
| 132 | `vo.g3.turkce.u03.n01.r01` | `assets/audio/voice/g3/turkce/u03/n01/r01.wav` | ANLATICI | Sincabın hikâyesini dikkatle dinle. Sonra soruları cevapla. |
| 133 | `vo.g3.turkce.u03.n01.r01.p1` | `assets/audio/voice/g3/turkce/u03/n01/r01/p1.wav` | ANLATICI | Sonbahar gelmişti. Yapraklar sararıp yere düşüyordu. Orhan ile kardeşi ormanda yürüyüşe çıktı. |
| 134 | `vo.g3.turkce.u03.n01.r01.p2` | `assets/audio/voice/g3/turkce/u03/n01/r01/p2.wav` | ANLATICI | Bir sincap gördüler. Sincap ağzında fındık taşıyor, onları bir ağacın kovuğuna saklıyordu. |
| 135 | `vo.g3.turkce.u03.n01.r01.p3` | `assets/audio/voice/g3/turkce/u03/n01/r01/p3.wav` | ANLATICI | Orhan, "Sincap kış için yiyecek biriktiriyor." dedi. Kış gelince sincap hiç aç kalmayacaktı. |
| 136 | `vo.g3.turkce.u03.n01.r01.q1` | `assets/audio/voice/g3/turkce/u03/n01/r01/q1.wav` | ANLATICI | Hikâye hangi mevsimde geçiyor? |
| 137 | `vo.g3.turkce.u03.n01.r01.q2` | `assets/audio/voice/g3/turkce/u03/n01/r01/q2.wav` | ANLATICI | Sincap fındıkları nereye saklıyordu? |
| 138 | `vo.g3.turkce.u03.n01.r01.q3` | `assets/audio/voice/g3/turkce/u03/n01/r01/q3.wav` | ANLATICI | Kış gelince sincap ne yapar? |
| 139 | `vo.g3.turkce.u03.n01.r02` | `assets/audio/voice/g3/turkce/u03/n01/r02.wav` | ANLATICI | Damla'nın yolculuğunu dinle. Sonra soruları cevapla. |
| 140 | `vo.g3.turkce.u03.n01.r02.p1` | `assets/audio/voice/g3/turkce/u03/n01/r02/p1.wav` | ANLATICI | Damla denizde yaşayan küçük bir su damlasıydı. Bir gün güneş ısıttı ve Damla buhar olup yükseldi. |
| 141 | `vo.g3.turkce.u03.n01.r02.p2` | `assets/audio/voice/g3/turkce/u03/n01/r02/p2.wav` | ANLATICI | Gökyüzünde başka damlalarla buluştu. Hep birlikte kocaman bir bulut oldular. |
| 142 | `vo.g3.turkce.u03.n01.r02.p3` | `assets/audio/voice/g3/turkce/u03/n01/r02/p3.wav` | ANLATICI | Bulut ağırlaşınca Damla yağmur olup bir tarlaya düştü. "Bitkiler, size su getirdim!" dedi. |
| 143 | `vo.g3.turkce.u03.n01.r02.q1` | `assets/audio/voice/g3/turkce/u03/n01/r02/q1.wav` | ANLATICI | Damla neden yükseldi? |
| 144 | `vo.g3.turkce.u03.n01.r02.q2` | `assets/audio/voice/g3/turkce/u03/n01/r02/q2.wav` | ANLATICI | Bu hikâyenin konusu nedir? |
| 145 | `vo.g3.turkce.u03.n01.r02.q3` | `assets/audio/voice/g3/turkce/u03/n01/r02/q3.wav` | ANLATICI | Damla bulutta ne oldu? |
| 146 | `vo.g3.turkce.u03.n01.r03` | `assets/audio/voice/g3/turkce/u03/n01/r03.wav` | ANLATICI | Bunlar gerçek hayatta olur mu, yoksa hayal mi? Kartları doğru kutuya taşı. |
| 147 | `vo.g3.turkce.u03.n02.intro` | `assets/audio/voice/g3/turkce/u03/n02/intro.wav` | BILGE | Doğada da sınıfta da güzel konuşur, dikkatle dinleriz. Haydi seçelim! |
| 148 | `vo.g3.turkce.u03.n02.r01` | `assets/audio/voice/g3/turkce/u03/n02/r01.wav` | ANLATICI | Piknikte arkadaşın çöplerini yerde bırakmak üzere. Ona ne dersin? |
| 149 | `vo.g3.turkce.u03.n02.r01.hint` | `assets/audio/voice/g3/turkce/u03/n02/r01/hint.wav` | BILGE | Doğayı korumayı arkadaşımıza kırmadan, nazikçe hatırlatalım. |
| 150 | `vo.g3.turkce.u03.n02.r01.c2` | `assets/audio/voice/g3/turkce/u03/n02/r01/c2.wav` | ANLATICI | Arkadaşın kırıldı. Doğru olanı nazik sözlerle söyleriz. |
| 151 | `vo.g3.turkce.u03.n02.r01.c3` | `assets/audio/voice/g3/turkce/u03/n02/r01/c3.wav` | ANLATICI | Çöpler yerde kaldı. Doğayı korumak hepimizin görevi. |
| 152 | `vo.g3.turkce.u03.n02.r02` | `assets/audio/voice/g3/turkce/u03/n02/r02.wav` | ANLATICI | Arıların balı nasıl yaptığını öğrenmek istiyorsun. Ne dinlersin? |
| 153 | `vo.g3.turkce.u03.n02.r02.hint` | `assets/audio/voice/g3/turkce/u03/n02/r02/hint.wav` | BILGE | Bilgi veren bir program seç. |
| 154 | `vo.g3.turkce.u03.n02.r02.c2` | `assets/audio/voice/g3/turkce/u03/n02/r02/c2.wav` | ANLATICI | Ninni insanı uyutur ama balın nasıl yapıldığını anlatmaz. |
| 155 | `vo.g3.turkce.u03.n02.r02.c3` | `assets/audio/voice/g3/turkce/u03/n02/r02/c3.wav` | ANLATICI | Bilmece eğlencelidir ama arılar hakkında bilgi vermez. |
| 156 | `vo.g3.turkce.u03.n02.r03` | `assets/audio/voice/g3/turkce/u03/n02/r03.wav` | ANLATICI | Doğa gezisinde rehber kuşların seslerini dinletecek. Kuşları duymak için ne yaparsın? |
| 157 | `vo.g3.turkce.u03.n02.r03.hint` | `assets/audio/voice/g3/turkce/u03/n02/r03/hint.wav` | BILGE | Kuşların sesi incedir. Etraf sessiz olmalı. |
| 158 | `vo.g3.turkce.u03.n02.r03.c2` | `assets/audio/voice/g3/turkce/u03/n02/r03/c2.wav` | ANLATICI | Senin sesin kuşların sesini bastırdı. |
| 159 | `vo.g3.turkce.u03.n02.r03.c3` | `assets/audio/voice/g3/turkce/u03/n02/r03/c3.wav` | ANLATICI | Kuşlar ürkerek uçup gitti. |
| 160 | `vo.g3.turkce.u03.n02.r04` | `assets/audio/voice/g3/turkce/u03/n02/r04.wav` | ANLATICI | Mert sınıfta kelebekleri anlatıyor. Can ise her cümlede Mert'in sözünü kesiyor. Konuşmadaki hata nedir? |
| 161 | `vo.g3.turkce.u03.n02.r04.hint` | `assets/audio/voice/g3/turkce/u03/n02/r04/hint.wav` | BILGE | Biri konuşurken onun sözünü bitirmesini bekleriz. |
| 162 | `vo.g3.turkce.u03.n02.r04.c2` | `assets/audio/voice/g3/turkce/u03/n02/r04/c2.wav` | ANLATICI | Soru sormak hata değildir. Sırasını bekleyip sorabiliriz. |
| 163 | `vo.g3.turkce.u03.n02.r04.c3` | `assets/audio/voice/g3/turkce/u03/n02/r04/c3.wav` | ANLATICI | Dinlemek çok güzel bir davranıştır. Can'ın hatası dinlememekti. |
| 164 | `vo.g3.turkce.u03.n03.intro` | `assets/audio/voice/g3/turkce/u03/n03/intro.wav` | BILGE | Şimdi metni kendin sessizce oku. Takılırsan hoparlöre dokunabilirsin. |
| 165 | `vo.g3.turkce.u03.n03.r01` | `assets/audio/voice/g3/turkce/u03/n03/r01.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 166 | `vo.g3.turkce.u03.n03.r01.p1` | `assets/audio/voice/g3/turkce/u03/n03/r01/p1.wav` | ANLATICI | Arılar çiçekten çiçeğe uçar. Çiçeklerin tatlı özünü toplayıp kovanlarına taşırlar. |
| 167 | `vo.g3.turkce.u03.n03.r01.p2` | `assets/audio/voice/g3/turkce/u03/n03/r01/p2.wav` | ANLATICI | Arılar çiçeklere konarken onların tozlarını da taşır. Böylece çiçekler meyveye dönüşür. |
| 168 | `vo.g3.turkce.u03.n03.r01.p3` | `assets/audio/voice/g3/turkce/u03/n03/r01/p3.wav` | ANLATICI | Arılar olmasa bahçelerde elma, kiraz ve çilek yetişmezdi. Arılar doğanın çalışkan dostlarıdır. |
| 169 | `vo.g3.turkce.u03.n03.r01.q1` | `assets/audio/voice/g3/turkce/u03/n03/r01/q1.wav` | ANLATICI | Bu metnin başlığı hangisi olabilir? |
| 170 | `vo.g3.turkce.u03.n03.r01.q2` | `assets/audio/voice/g3/turkce/u03/n03/r01/q2.wav` | ANLATICI | Metnin ana fikri nedir? |
| 171 | `vo.g3.turkce.u03.n03.r01.q3` | `assets/audio/voice/g3/turkce/u03/n03/r01/q3.wav` | ANLATICI | Arılar olmasa ne olurdu? |
| 172 | `vo.g3.turkce.u03.n03.r02` | `assets/audio/voice/g3/turkce/u03/n03/r02.wav` | ANLATICI | Eş anlamlı sözcükleri eşleştir. |
| 173 | `vo.g3.turkce.u03.n03.r03` | `assets/audio/voice/g3/turkce/u03/n03/r03.wav` | ANLATICI | Bu sözler gerçek anlamda mı, mecaz anlamda mı? Kartları doğru kutuya taşı. |
| 174 | `vo.g3.turkce.u03.n04.intro` | `assets/audio/voice/g3/turkce/u03/n04/intro.wav` | BILGE | Konuşmaları dinle ve sonunu tahmin et. Mevsimlerin içinde küçük bir gezinti yapalım! |
| 175 | `vo.g3.turkce.u03.n04.r01` | `assets/audio/voice/g3/turkce/u03/n04/r01.wav` | ANLATICI | Ayşe ile Kaan'ın konuşmasını dinle. Konuşmanın nasıl biteceğini tahmin et. |
| 176 | `vo.g3.turkce.u03.n04.r01.p1` | `assets/audio/voice/g3/turkce/u03/n04/r01/p1.wav` | ANLATICI | Sabah her yer bembeyaz olmuştu. Ayşe, "Kaan, haydi kardan adam yapalım!" dedi. |
| 177 | `vo.g3.turkce.u03.n04.r01.p2` | `assets/audio/voice/g3/turkce/u03/n04/r01/p2.wav` | ANLATICI | Kaan, "Çok isterim ama eldivenlerimi bulamıyorum. Ellerim üşür." dedi. |
| 178 | `vo.g3.turkce.u03.n04.r01.p3` | `assets/audio/voice/g3/turkce/u03/n04/r01/p3.wav` | ANLATICI | Ayşe, "Benim iki çift eldivenim var. Birini sana vereyim mi?" diye sordu. |
| 179 | `vo.g3.turkce.u03.n04.r01.q1` | `assets/audio/voice/g3/turkce/u03/n04/r01/q1.wav` | ANLATICI | Kaan ne cevap verir? |
| 180 | `vo.g3.turkce.u03.n04.r01.q2` | `assets/audio/voice/g3/turkce/u03/n04/r01/q2.wav` | ANLATICI | Kaan neden dışarı çıkamıyordu? |
| 181 | `vo.g3.turkce.u03.n04.r01.q3` | `assets/audio/voice/g3/turkce/u03/n04/r01/q3.wav` | ANLATICI | Sence sonra ne olur? |
| 182 | `vo.g3.turkce.u03.n04.r02` | `assets/audio/voice/g3/turkce/u03/n04/r02.wav` | ANLATICI | Ozan ile annesinin konuşmasını dinle. Sonra soruları cevapla. |
| 183 | `vo.g3.turkce.u03.n04.r02.p1` | `assets/audio/voice/g3/turkce/u03/n04/r02/p1.wav` | ANLATICI | Ozan, "Anne, güneş çok sıcak. Denize girebilir miyim?" diye sordu. |
| 184 | `vo.g3.turkce.u03.n04.r02.p2` | `assets/audio/voice/g3/turkce/u03/n04/r02/p2.wav` | ANLATICI | Annesi, "Önce güneş kremini sür ve şapkanı tak. Güneş tenini yakmasın." dedi. |
| 185 | `vo.g3.turkce.u03.n04.r02.p3` | `assets/audio/voice/g3/turkce/u03/n04/r02/p3.wav` | ANLATICI | Ozan şapkasını aradı ama bulamadı. Annesi çantasına baktı ve gülümsedi. |
| 186 | `vo.g3.turkce.u03.n04.r02.q1` | `assets/audio/voice/g3/turkce/u03/n04/r02/q1.wav` | ANLATICI | Annesi ne der? |
| 187 | `vo.g3.turkce.u03.n04.r02.q2` | `assets/audio/voice/g3/turkce/u03/n04/r02/q2.wav` | ANLATICI | Hikâye hangi mevsimde geçiyor? |
| 188 | `vo.g3.turkce.u03.n04.r02.q3` | `assets/audio/voice/g3/turkce/u03/n04/r02/q3.wav` | ANLATICI | Annesi Ozan'a önce ne yapmasını söyledi? |
| 189 | `vo.g3.turkce.u03.n04.r03` | `assets/audio/voice/g3/turkce/u03/n04/r03.wav` | ANLATICI | Hangisi kış konuşmasında, hangisi yaz konuşmasındaydı? Kartları kutulara taşı. |
| 190 | `vo.g3.turkce.u03.n05.intro` | `assets/audio/voice/g3/turkce/u03/n05/intro.wav` | BILGE | Doğanın renkleriyle başlayalım: masmavi gök, yemyeşil orman! Sonra kısaltmalara ve büyük harflere bakalım. |
| 191 | `vo.g3.turkce.u03.n05.r01` | `assets/audio/voice/g3/turkce/u03/n05/r01.wav` | ANLATICI | Masmavi sözcüğünü hecelerden kur. |
| 192 | `vo.g3.turkce.u03.n05.r01.word` | `assets/audio/voice/g3/turkce/u03/n05/r01/word.wav` | ANLATICI | masmavi |
| 193 | `vo.g3.turkce.u03.n05.r02` | `assets/audio/voice/g3/turkce/u03/n05/r02.wav` | ANLATICI | Yemyeşil sözcüğünü hecelerden kur. |
| 194 | `vo.g3.turkce.u03.n05.r02.word` | `assets/audio/voice/g3/turkce/u03/n05/r02/word.wav` | ANLATICI | yemyeşil |
| 195 | `vo.g3.turkce.u03.n05.r03` | `assets/audio/voice/g3/turkce/u03/n05/r03.wav` | ANLATICI | Kısaltmaya gelen eki okunuşuna göre seç. Her kısaltmayı doğru ekle eşleştir. |
| 196 | `vo.g3.turkce.u03.n05.r04` | `assets/audio/voice/g3/turkce/u03/n05/r04.wav` | ANLATICI | Bu sözcükler büyük harfle başlar. Her sözcüğü türüyle eşleştir. |
| 197 | `vo.g3.turkce.u04.n01.intro` | `assets/audio/voice/g3/turkce/u04/n01/intro.wav` | BILGE | Merhaba! Merak eden ve öğrenen çocukların hikâyelerini dinleyelim. |
| 198 | `vo.g3.turkce.u04.n01.r01` | `assets/audio/voice/g3/turkce/u04/n01/r01.wav` | ANLATICI | Ela'nın hikâyesini dikkatle dinle. Sonra soruları cevapla. |
| 199 | `vo.g3.turkce.u04.n01.r01.p1` | `assets/audio/voice/g3/turkce/u04/n01/r01/p1.wav` | ANLATICI | Ela bir masal okuyordu. Masalda "cesur" sözcüğünü gördü ama anlamını bilmiyordu. |
| 200 | `vo.g3.turkce.u04.n01.r01.p2` | `assets/audio/voice/g3/turkce/u04/n01/r01/p2.wav` | ANLATICI | Ablası ona bir sözlük verdi. "Bilmediğin sözcükleri burada bulabilirsin." dedi. |
| 201 | `vo.g3.turkce.u04.n01.r01.p3` | `assets/audio/voice/g3/turkce/u04/n01/r01/p3.wav` | ANLATICI | Ela sözlüğü açtı. "Cesur, korkusuz demekmiş!" dedi. Sonra masalı keyifle okumaya devam etti. |
| 202 | `vo.g3.turkce.u04.n01.r01.q1` | `assets/audio/voice/g3/turkce/u04/n01/r01/q1.wav` | ANLATICI | Ela hangi sözcüğün anlamını bilmiyordu? |
| 203 | `vo.g3.turkce.u04.n01.r01.q2` | `assets/audio/voice/g3/turkce/u04/n01/r01/q2.wav` | ANLATICI | Hikâyenin ana fikri nedir? |
| 204 | `vo.g3.turkce.u04.n01.r01.q3` | `assets/audio/voice/g3/turkce/u04/n01/r01/q3.wav` | ANLATICI | Ela bir daha bilmediği bir sözcük görünce ne yapar? |
| 205 | `vo.g3.turkce.u04.n01.r02` | `assets/audio/voice/g3/turkce/u04/n01/r02.wav` | ANLATICI | Kuzey'in hikâyesini dinle. Sonra soruları cevapla. |
| 206 | `vo.g3.turkce.u04.n01.r02.p1` | `assets/audio/voice/g3/turkce/u04/n01/r02/p1.wav` | ANLATICI | Kuzey denizdeki canlıları çok merak ediyordu. Kütüphaneden kocaman bir ansiklopedi aldı. |
| 207 | `vo.g3.turkce.u04.n01.r02.p2` | `assets/audio/voice/g3/turkce/u04/n01/r02/p2.wav` | ANLATICI | Ansiklopedide ahtapotu okudu. Ahtapotun sekiz kolu ve üç kalbi olduğunu öğrendi. |
| 208 | `vo.g3.turkce.u04.n01.r02.p3` | `assets/audio/voice/g3/turkce/u04/n01/r02/p3.wav` | ANLATICI | Kuzey akşam yemeğinde bunu ailesine anlattı. Herkes çok şaşırdı. Kuzey çok mutlu oldu. |
| 209 | `vo.g3.turkce.u04.n01.r02.q1` | `assets/audio/voice/g3/turkce/u04/n01/r02/q1.wav` | ANLATICI | Ahtapotun kaç kalbi vardır? |
| 210 | `vo.g3.turkce.u04.n01.r02.q2` | `assets/audio/voice/g3/turkce/u04/n01/r02/q2.wav` | ANLATICI | Kuzey ansiklopediyi nereden aldı? |
| 211 | `vo.g3.turkce.u04.n01.r02.q3` | `assets/audio/voice/g3/turkce/u04/n01/r02/q3.wav` | ANLATICI | Bu hikâyenin konusu nedir? |
| 212 | `vo.g3.turkce.u04.n01.r03` | `assets/audio/voice/g3/turkce/u04/n01/r03.wav` | ANLATICI | Hangisi Ela'nın, hangisi Kuzey'in hikâyesindeydi? Kartları doğru kutuya taşı. |
| 213 | `vo.g3.turkce.u04.n02.intro` | `assets/audio/voice/g3/turkce/u04/n02/intro.wav` | BILGE | Bilgiye ulaşırken de güzel konuşur, dikkatle dinleriz. Haydi seçelim! |
| 214 | `vo.g3.turkce.u04.n02.r01` | `assets/audio/voice/g3/turkce/u04/n02/r01.wav` | ANLATICI | Kütüphanede dinozor kitabı arıyorsun. Görevliye nasıl sorarsın? |
| 215 | `vo.g3.turkce.u04.n02.r01.hint` | `assets/audio/voice/g3/turkce/u04/n02/r01/hint.wav` | BILGE | Yardım isterken kibar sözcükler kullanırız. |
| 216 | `vo.g3.turkce.u04.n02.r01.c2` | `assets/audio/voice/g3/turkce/u04/n02/r01/c2.wav` | ANLATICI | Görevli bu sözü kaba buldu. Yardım isterken "lütfen" deriz. |
| 217 | `vo.g3.turkce.u04.n02.r01.c3` | `assets/audio/voice/g3/turkce/u04/n02/r01/c3.wav` | ANLATICI | Kütüphanedeki herkes irkildi. Burada alçak sesle konuşuruz. |
| 218 | `vo.g3.turkce.u04.n02.r02` | `assets/audio/voice/g3/turkce/u04/n02/r02.wav` | ANLATICI | Gezegenler hakkında bilgi edinmek istiyorsun. Hangisini dinlersin? |
| 219 | `vo.g3.turkce.u04.n02.r02.hint` | `assets/audio/voice/g3/turkce/u04/n02/r02/hint.wav` | BILGE | Bilgi veren bir program seçmelisin. |
| 220 | `vo.g3.turkce.u04.n02.r02.c2` | `assets/audio/voice/g3/turkce/u04/n02/r02/c2.wav` | ANLATICI | Fıkra güldürür ama gezegenleri anlatmaz. |
| 221 | `vo.g3.turkce.u04.n02.r02.c3` | `assets/audio/voice/g3/turkce/u04/n02/r02/c3.wav` | ANLATICI | Ninni uyutur ama bilgi vermez. |
| 222 | `vo.g3.turkce.u04.n02.r03` | `assets/audio/voice/g3/turkce/u04/n02/r03.wav` | ANLATICI | Öğretmenin dinozorları anlatıyor. Yarın bunları sınıfa sen anlatacaksın. Dinlerken ne yaparsın? |
| 223 | `vo.g3.turkce.u04.n02.r03.hint` | `assets/audio/voice/g3/turkce/u04/n02/r03/hint.wav` | BILGE | Önemli bilgileri unutmamak için yazabilirsin. |
| 224 | `vo.g3.turkce.u04.n02.r03.c2` | `assets/audio/voice/g3/turkce/u04/n02/r03/c2.wav` | ANLATICI | Anlatılanları kaçırdın. Yarın neyi anlatacağını bilemezsin. |
| 225 | `vo.g3.turkce.u04.n02.r03.c3` | `assets/audio/voice/g3/turkce/u04/n02/r03/c3.wav` | ANLATICI | Dikkatin dağıldı. Bilgiler aklında kalmadı. |
| 226 | `vo.g3.turkce.u04.n02.r04` | `assets/audio/voice/g3/turkce/u04/n02/r04.wav` | ANLATICI | Arkadaşın "Penguenler uçar." dedi. Sen bunun doğru olmadığını düşünüyorsun. Ona ne dersin? |
| 227 | `vo.g3.turkce.u04.n02.r04.hint` | `assets/audio/voice/g3/turkce/u04/n02/r04/hint.wav` | BILGE | Farklı düşündüğümüzde de kibar konuşuruz. Doğru bilgiyi birlikte arayabiliriz. |
| 228 | `vo.g3.turkce.u04.n02.r04.c2` | `assets/audio/voice/g3/turkce/u04/n02/r04/c2.wav` | ANLATICI | Arkadaşın üzüldü. Farklı düşünsek de kırıcı konuşmayız. |
| 229 | `vo.g3.turkce.u04.n02.r04.c3` | `assets/audio/voice/g3/turkce/u04/n02/r04/c3.wav` | ANLATICI | Arkadaşın yanlış bilgiyle kaldı. Nazikçe birlikte araştırabiliriz. |
| 230 | `vo.g3.turkce.u04.n03.intro` | `assets/audio/voice/g3/turkce/u04/n03/intro.wav` | BILGE | Şimdi sözlüğü anlatan bir metni sessizce oku. Takılırsan hoparlöre dokun. |
| 231 | `vo.g3.turkce.u04.n03.r01` | `assets/audio/voice/g3/turkce/u04/n03/r01.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 232 | `vo.g3.turkce.u04.n03.r01.p1` | `assets/audio/voice/g3/turkce/u04/n03/r01/p1.wav` | ANLATICI | Sözlük, sözcüklerin anlamlarını bulduğumuz bir kitaptır. İçinde binlerce sözcük vardır. |
| 233 | `vo.g3.turkce.u04.n03.r01.p2` | `assets/audio/voice/g3/turkce/u04/n03/r01/p2.wav` | ANLATICI | Sözlükteki sözcükler alfabetik sıradadır. Bu yüzden aradığımız sözcüğü kolayca buluruz. |
| 234 | `vo.g3.turkce.u04.n03.r01.p3` | `assets/audio/voice/g3/turkce/u04/n03/r01/p3.wav` | ANLATICI | Bilmediğimiz bir sözcüğü sözlükten öğrenince okuduğumuzu daha iyi anlarız. |
| 235 | `vo.g3.turkce.u04.n03.r01.q1` | `assets/audio/voice/g3/turkce/u04/n03/r01/q1.wav` | ANLATICI | Bu metnin başlığı hangisi olabilir? |
| 236 | `vo.g3.turkce.u04.n03.r01.q2` | `assets/audio/voice/g3/turkce/u04/n03/r01/q2.wav` | ANLATICI | Metnin ana fikri nedir? |
| 237 | `vo.g3.turkce.u04.n03.r01.q3` | `assets/audio/voice/g3/turkce/u04/n03/r01/q3.wav` | ANLATICI | Sözlükteki sözcükler nasıl sıralanır? |
| 238 | `vo.g3.turkce.u04.n03.r02` | `assets/audio/voice/g3/turkce/u04/n03/r02.wav` | ANLATICI | Zıt anlamlı sözcükleri eşleştir. |
| 239 | `vo.g3.turkce.u04.n03.r03` | `assets/audio/voice/g3/turkce/u04/n03/r03.wav` | ANLATICI | Bu sözler gerçek anlamda mı, mecaz anlamda mı? Kartları doğru kutuya taşı. |
| 240 | `vo.g3.turkce.u04.n04.intro` | `assets/audio/voice/g3/turkce/u04/n04/intro.wav` | BILGE | Merak eden çocukların konuşmalarını dinle. Sonunu sen tahmin et! |
| 241 | `vo.g3.turkce.u04.n04.r01` | `assets/audio/voice/g3/turkce/u04/n04/r01.wav` | ANLATICI | Selin ile Mete'nin konuşmasını dinle. Konuşmanın nasıl biteceğini tahmin et. |
| 242 | `vo.g3.turkce.u04.n04.r01.p1` | `assets/audio/voice/g3/turkce/u04/n04/r01/p1.wav` | ANLATICI | Selin, "Ben yıldızlarla ilgili bir kitap almak istiyorum." dedi. Mete, "Ben de hayvan kitabı." dedi. |
| 243 | `vo.g3.turkce.u04.n04.r01.p2` | `assets/audio/voice/g3/turkce/u04/n04/r01/p2.wav` | ANLATICI | Görevli, "Bugün her öğrenci yalnızca bir kitap alabilir." dedi. İkisi birbirine baktı. |
| 244 | `vo.g3.turkce.u04.n04.r01.p3` | `assets/audio/voice/g3/turkce/u04/n04/r01/p3.wav` | ANLATICI | Mete, "Sen yıldız kitabını al, ben hayvan kitabını. Okuyunca değiştirelim mi?" dedi. |
| 245 | `vo.g3.turkce.u04.n04.r01.q1` | `assets/audio/voice/g3/turkce/u04/n04/r01/q1.wav` | ANLATICI | Selin ne cevap verir? |
| 246 | `vo.g3.turkce.u04.n04.r01.q2` | `assets/audio/voice/g3/turkce/u04/n04/r01/q2.wav` | ANLATICI | Her öğrenci kaç kitap alabilir? |
| 247 | `vo.g3.turkce.u04.n04.r01.q3` | `assets/audio/voice/g3/turkce/u04/n04/r01/q3.wav` | ANLATICI | Sence sonunda ne olur? |
| 248 | `vo.g3.turkce.u04.n04.r02` | `assets/audio/voice/g3/turkce/u04/n04/r02.wav` | ANLATICI | Yusuf ile dedesinin konuşmasını dinle. Sonra soruları cevapla. |
| 249 | `vo.g3.turkce.u04.n04.r02.p1` | `assets/audio/voice/g3/turkce/u04/n04/r02/p1.wav` | ANLATICI | Yusuf, "Dede, penguenler kuştur. O zaman uçabilirler mi?" diye sordu. |
| 250 | `vo.g3.turkce.u04.n04.r02.p2` | `assets/audio/voice/g3/turkce/u04/n04/r02/p2.wav` | ANLATICI | Dede, "Güzel bir soru! Gel, ansiklopediye birlikte bakalım." dedi ve kitabı getirdi. |
| 251 | `vo.g3.turkce.u04.n04.r02.p3` | `assets/audio/voice/g3/turkce/u04/n04/r02/p3.wav` | ANLATICI | Birlikte okudular. Penguenler uçamıyordu ama çok iyi yüzüyordu. Yusuf çok şaşırdı. |
| 252 | `vo.g3.turkce.u04.n04.r02.q1` | `assets/audio/voice/g3/turkce/u04/n04/r02/q1.wav` | ANLATICI | Yusuf dedesine ne der? |
| 253 | `vo.g3.turkce.u04.n04.r02.q2` | `assets/audio/voice/g3/turkce/u04/n04/r02/q2.wav` | ANLATICI | Penguenler ne yapabilir? |
| 254 | `vo.g3.turkce.u04.n04.r02.q3` | `assets/audio/voice/g3/turkce/u04/n04/r02/q3.wav` | ANLATICI | Dede soruya cevabı nasıl buldu? |
| 255 | `vo.g3.turkce.u04.n04.r03` | `assets/audio/voice/g3/turkce/u04/n04/r03.wav` | ANLATICI | Hangisi Selin ile Mete'nin, hangisi Yusuf ile dedesinin konuşmasındaydı? Kartları kutulara taşı. |
| 256 | `vo.g3.turkce.u04.n05.intro` | `assets/audio/voice/g3/turkce/u04/n05/intro.wav` | BILGE | Bilgi hazinemiz dopdolu! Pekiştirmeli sözcükleri, kısaltmaları ve büyük harfleri çalışalım. |
| 257 | `vo.g3.turkce.u04.n05.r01` | `assets/audio/voice/g3/turkce/u04/n05/r01.wav` | ANLATICI | Dopdolu sözcüğünü hecelerden kur. |
| 258 | `vo.g3.turkce.u04.n05.r01.word` | `assets/audio/voice/g3/turkce/u04/n05/r01/word.wav` | ANLATICI | dopdolu |
| 259 | `vo.g3.turkce.u04.n05.r02` | `assets/audio/voice/g3/turkce/u04/n05/r02.wav` | ANLATICI | Upuzun sözcüğünü hecelerden kur. |
| 260 | `vo.g3.turkce.u04.n05.r02.word` | `assets/audio/voice/g3/turkce/u04/n05/r02/word.wav` | ANLATICI | upuzun |
| 261 | `vo.g3.turkce.u04.n05.r03` | `assets/audio/voice/g3/turkce/u04/n05/r03.wav` | ANLATICI | Kısaltmaya gelen eki okunuşuna göre seç. Her kısaltmayı doğru ekle eşleştir. |
| 262 | `vo.g3.turkce.u04.n05.r04` | `assets/audio/voice/g3/turkce/u04/n05/r04.wav` | ANLATICI | Bu sözcükler büyük harfle başlar. Her sözcüğü türüyle eşleştir. |
| 263 | `vo.g3.turkce.u05.n01.intro` | `assets/audio/voice/g3/turkce/u05/n01/intro.wav` | BILGE | Merhaba! Herkesin bir yeteneği vardır. Yeteneğini kullanan çocukların hikâyelerini dinleyelim. |
| 264 | `vo.g3.turkce.u05.n01.r01` | `assets/audio/voice/g3/turkce/u05/n01/r01.wav` | ANLATICI | Defne'nin hikâyesini dikkatle dinle. Sonra soruları cevapla. |
| 265 | `vo.g3.turkce.u05.n01.r01.p1` | `assets/audio/voice/g3/turkce/u05/n01/r01/p1.wav` | ANLATICI | Defne resim yapmayı çok severdi. Bir gün öğretmeni, sınıfta küçük bir resim sergisi açılacağını söyledi. |
| 266 | `vo.g3.turkce.u05.n01.r01.p2` | `assets/audio/voice/g3/turkce/u05/n01/r01/p2.wav` | ANLATICI | Defne, babaannesinin çiçekli bahçesini çizdi. Renkleri seçerken çok dikkatli davrandı, hiç acele etmedi. |
| 267 | `vo.g3.turkce.u05.n01.r01.p3` | `assets/audio/voice/g3/turkce/u05/n01/r01/p3.wav` | ANLATICI | Sergi günü herkes Defne'nin resminin önünde durdu. Defne, emek verdiği resmi beğenilince çok sevindi. |
| 268 | `vo.g3.turkce.u05.n01.r01.q1` | `assets/audio/voice/g3/turkce/u05/n01/r01/q1.wav` | ANLATICI | Defne neyin resmini çizdi? |
| 269 | `vo.g3.turkce.u05.n01.r01.q2` | `assets/audio/voice/g3/turkce/u05/n01/r01/q2.wav` | ANLATICI | Bu hikâyenin ana fikri nedir? |
| 270 | `vo.g3.turkce.u05.n01.r01.q3` | `assets/audio/voice/g3/turkce/u05/n01/r01/q3.wav` | ANLATICI | Sence Defne sergiden sonra ne yapar? |
| 271 | `vo.g3.turkce.u05.n01.r02` | `assets/audio/voice/g3/turkce/u05/n01/r02.wav` | ANLATICI | Elif'in hikâyesini dinle. Sonra soruları cevapla. |
| 272 | `vo.g3.turkce.u05.n01.r02.p1` | `assets/audio/voice/g3/turkce/u05/n01/r02/p1.wav` | ANLATICI | Elif okul konserinde flüt çalacaktı. Konserden önceki günlerde her akşam evde düzenli olarak çalıştı. |
| 273 | `vo.g3.turkce.u05.n01.r02.p2` | `assets/audio/voice/g3/turkce/u05/n01/r02/p2.wav` | ANLATICI | Konser günü sahneye çıkınca Elif çok heyecanlandı. Derin bir nefes aldı ve öğretmenine baktı. |
| 274 | `vo.g3.turkce.u05.n01.r02.p3` | `assets/audio/voice/g3/turkce/u05/n01/r02/p3.wav` | ANLATICI | Öğretmeni ona gülümsedi. Elif sakinleşti ve şarkıyı güzelce çaldı. Herkes onu uzun uzun alkışladı. |
| 275 | `vo.g3.turkce.u05.n01.r02.q1` | `assets/audio/voice/g3/turkce/u05/n01/r02/q1.wav` | ANLATICI | Elif konserde ne çaldı? |
| 276 | `vo.g3.turkce.u05.n01.r02.q2` | `assets/audio/voice/g3/turkce/u05/n01/r02/q2.wav` | ANLATICI | Elif sahneye çıkınca ne hissetti? |
| 277 | `vo.g3.turkce.u05.n01.r02.q3` | `assets/audio/voice/g3/turkce/u05/n01/r02/q3.wav` | ANLATICI | Elif konserden önce ne yaptı? |
| 278 | `vo.g3.turkce.u05.n01.r03` | `assets/audio/voice/g3/turkce/u05/n01/r03.wav` | ANLATICI | Hangisi Defne'nin, hangisi Elif'in hikâyesindeydi? Her kartı doğru kutuya taşı. |
| 279 | `vo.g3.turkce.u05.n02.intro` | `assets/audio/voice/g3/turkce/u05/n02/intro.wav` | BILGE | Konuşurken ve dinlerken duruma uygun davranırız. Haydi, doğru olanı birlikte seçelim! |
| 280 | `vo.g3.turkce.u05.n02.r01` | `assets/audio/voice/g3/turkce/u05/n02/r01.wav` | ANLATICI | Sınıfta yeteneğini arkadaşlarına tanıtacaksın. Nasıl konuşmalısın? |
| 281 | `vo.g3.turkce.u05.n02.r01.hint` | `assets/audio/voice/g3/turkce/u05/n02/r01/hint.wav` | BILGE | Herkes seni duymalı ve anlamalı. Sesin ve hızın nasıl olmalı? |
| 282 | `vo.g3.turkce.u05.n02.r01.c2` | `assets/audio/voice/g3/turkce/u05/n02/r01/c2.wav` | ANLATICI | Arkadaşların söylediklerini kaçırdı. Yavaş ve anlaşılır konuşuruz. |
| 283 | `vo.g3.turkce.u05.n02.r01.c3` | `assets/audio/voice/g3/turkce/u05/n02/r01/c3.wav` | ANLATICI | Arkalarda oturanlar seni duyamadı. Herkesin duyacağı bir sesle konuşuruz. |
| 284 | `vo.g3.turkce.u05.n02.r02` | `assets/audio/voice/g3/turkce/u05/n02/r02.wav` | ANLATICI | Öğretmen kâğıttan kuş yapmayı adım adım gösteriyor. Nasıl dinlersin? |
| 285 | `vo.g3.turkce.u05.n02.r02.hint` | `assets/audio/voice/g3/turkce/u05/n02/r02/hint.wav` | BILGE | Her adımı görmen ve duyman gerekiyor. |
| 286 | `vo.g3.turkce.u05.n02.r02.c2` | `assets/audio/voice/g3/turkce/u05/n02/r02/c2.wav` | ANLATICI | Konuşurken bir adımı kaçırdın. Gösterilen işi dikkatle izleyerek dinleriz. |
| 287 | `vo.g3.turkce.u05.n02.r02.c3` | `assets/audio/voice/g3/turkce/u05/n02/r02/c3.wav` | ANLATICI | Kuşun nasıl katlandığını göremedin. Gözlerimiz de anlatana bakmalı. |
| 288 | `vo.g3.turkce.u05.n02.r03` | `assets/audio/voice/g3/turkce/u05/n02/r03.wav` | ANLATICI | Müzik öğretmeni konserin gününü ve saatini söylüyor. Unutmamak için ne yaparsın? |
| 289 | `vo.g3.turkce.u05.n02.r03.hint` | `assets/audio/voice/g3/turkce/u05/n02/r03/hint.wav` | BILGE | Önemli bilgileri unutmamanın bir yolu var. |
| 290 | `vo.g3.turkce.u05.n02.r03.c2` | `assets/audio/voice/g3/turkce/u05/n02/r03/c2.wav` | ANLATICI | Resim güzel ama günü ve saati yazmadın. Önemli bilgileri not alırız. |
| 291 | `vo.g3.turkce.u05.n02.r03.c3` | `assets/audio/voice/g3/turkce/u05/n02/r03/c3.wav` | ANLATICI | Konserin ne zaman olduğunu öğrenemedin. Duyuruları dikkatle dinleriz. |
| 292 | `vo.g3.turkce.u05.n02.r04` | `assets/audio/voice/g3/turkce/u05/n02/r04.wav` | ANLATICI | Arkadaşının resmi istediği gibi olmadı ve üzüldü. Ona ne söylersin? |
| 293 | `vo.g3.turkce.u05.n02.r04.hint` | `assets/audio/voice/g3/turkce/u05/n02/r04/hint.wav` | BILGE | Üzgün bir arkadaşa cesaret veren sözler söyleriz. |
| 294 | `vo.g3.turkce.u05.n02.r04.c2` | `assets/audio/voice/g3/turkce/u05/n02/r04/c2.wav` | ANLATICI | Arkadaşın daha çok üzüldü. Kırıcı sözler yerine cesaret veririz. |
| 295 | `vo.g3.turkce.u05.n02.r04.c3` | `assets/audio/voice/g3/turkce/u05/n02/r04/c3.wav` | ANLATICI | Arkadaşın yalnız kaldığını hissetti. Arkadaşımıza ilgiyle ve kibarca konuşuruz. |
| 296 | `vo.g3.turkce.u05.n03.intro` | `assets/audio/voice/g3/turkce/u05/n03/intro.wav` | BILGE | Şimdi metinleri sessizce oku. Takılırsan hoparlöre dokunabilirsin. |
| 297 | `vo.g3.turkce.u05.n03.r01` | `assets/audio/voice/g3/turkce/u05/n03/r01.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 298 | `vo.g3.turkce.u05.n03.r01.p1` | `assets/audio/voice/g3/turkce/u05/n03/r01/p1.wav` | ANLATICI | Bizim sınıfta herkes farklı bir şeyde iyidir. Ayşe çok hızlı koşar, Burak ise çok güzel şarkı söyler. |
| 299 | `vo.g3.turkce.u05.n03.r01.p2` | `assets/audio/voice/g3/turkce/u05/n03/r01/p2.wav` | ANLATICI | Can bilmeceleri hemen çözer. Öğretmenimiz, herkesin yeteneğinin farklı ve değerli olduğunu söyler. |
| 300 | `vo.g3.turkce.u05.n03.r01.q1` | `assets/audio/voice/g3/turkce/u05/n03/r01/q1.wav` | ANLATICI | Bu metnin başlığı hangisi olabilir? |
| 301 | `vo.g3.turkce.u05.n03.r01.q2` | `assets/audio/voice/g3/turkce/u05/n03/r01/q2.wav` | ANLATICI | Burak neyi iyi yapar? |
| 302 | `vo.g3.turkce.u05.n03.r01.q3` | `assets/audio/voice/g3/turkce/u05/n03/r01/q3.wav` | ANLATICI | Metnin ana fikri nedir? |
| 303 | `vo.g3.turkce.u05.n03.r02` | `assets/audio/voice/g3/turkce/u05/n03/r02.wav` | ANLATICI | Sena'nın hikâyesini sessizce oku. Sonra soruları cevapla. |
| 304 | `vo.g3.turkce.u05.n03.r02.p1` | `assets/audio/voice/g3/turkce/u05/n03/r02/p1.wav` | ANLATICI | Sena'nın küçük kardeşinin canı sıkılmıştı. Sena, eski çoraplarından iki sevimli kukla yaptı. |
| 305 | `vo.g3.turkce.u05.n03.r02.p2` | `assets/audio/voice/g3/turkce/u05/n03/r02/p2.wav` | ANLATICI | Sonra bir kutuyu sahneye çevirdi ve kuklalarla bir gösteri yaptı. Kardeşi kahkahalarla güldü. |
| 306 | `vo.g3.turkce.u05.n03.r02.q1` | `assets/audio/voice/g3/turkce/u05/n03/r02/q1.wav` | ANLATICI | Sena kuklaları neyle yaptı? |
| 307 | `vo.g3.turkce.u05.n03.r02.q2` | `assets/audio/voice/g3/turkce/u05/n03/r02/q2.wav` | ANLATICI | Sena neden kukla yaptı? |
| 308 | `vo.g3.turkce.u05.n03.r02.q3` | `assets/audio/voice/g3/turkce/u05/n03/r02/q3.wav` | ANLATICI | Gösteriden önce ne oldu? |
| 309 | `vo.g3.turkce.u05.n03.r03` | `assets/audio/voice/g3/turkce/u05/n03/r03.wav` | ANLATICI | Eş anlamlı sözcükleri eşleştir. |
| 310 | `vo.g3.turkce.u05.n03.r04` | `assets/audio/voice/g3/turkce/u05/n03/r04.wav` | ANLATICI | Sözcükler gerçek anlamda mı, mecaz anlamda mı kullanılmış? Kartları kutulara taşı. |
| 311 | `vo.g3.turkce.u05.n04.intro` | `assets/audio/voice/g3/turkce/u05/n04/intro.wav` | BILGE | Konuşmaları dinle. Sonunda ne olacağını tahmin edebilir misin? |
| 312 | `vo.g3.turkce.u05.n04.r01` | `assets/audio/voice/g3/turkce/u05/n04/r01.wav` | ANLATICI | Zehra ile Mert'in konuşmasını dinle. Sonra soruları cevapla. |
| 313 | `vo.g3.turkce.u05.n04.r01.p1` | `assets/audio/voice/g3/turkce/u05/n04/r01/p1.wav` | ANLATICI | Beden eğitimi dersinde basketbol oynanacaktı. Zehra, "Ben top sektirmeyi bilmiyorum." dedi. |
| 314 | `vo.g3.turkce.u05.n04.r01.p2` | `assets/audio/voice/g3/turkce/u05/n04/r01/p2.wav` | ANLATICI | Mert gülümsedi: "Ben biraz biliyorum. İstersen sana gösterebilirim." Zehra, "Çok iyi olur!" dedi. |
| 315 | `vo.g3.turkce.u05.n04.r01.q1` | `assets/audio/voice/g3/turkce/u05/n04/r01/q1.wav` | ANLATICI | Zehra neyi bilmiyordu? |
| 316 | `vo.g3.turkce.u05.n04.r01.q2` | `assets/audio/voice/g3/turkce/u05/n04/r01/q2.wav` | ANLATICI | Bu konuşma nasıl sonuçlanır? |
| 317 | `vo.g3.turkce.u05.n04.r02` | `assets/audio/voice/g3/turkce/u05/n04/r02.wav` | ANLATICI | Selim ile dedesinin konuşmasını dinle. Sonra soruları cevapla. |
| 318 | `vo.g3.turkce.u05.n04.r02.p1` | `assets/audio/voice/g3/turkce/u05/n04/r02/p1.wav` | ANLATICI | Selim, dedesinin bağlamasına hayranlıkla baktı. "Dede, bana da bağlama çalmayı öğretir misin?" dedi. |
| 319 | `vo.g3.turkce.u05.n04.r02.p2` | `assets/audio/voice/g3/turkce/u05/n04/r02/p2.wav` | ANLATICI | Dedesi, "Tabii öğretirim. Ama her gün biraz çalışman gerekir." dedi. Selim, "Söz veriyorum!" dedi. |
| 320 | `vo.g3.turkce.u05.n04.r02.q1` | `assets/audio/voice/g3/turkce/u05/n04/r02/q1.wav` | ANLATICI | Selim dedesinden ne istedi? |
| 321 | `vo.g3.turkce.u05.n04.r02.q2` | `assets/audio/voice/g3/turkce/u05/n04/r02/q2.wav` | ANLATICI | Bu konuşma nasıl sonuçlanır? |
| 322 | `vo.g3.turkce.u05.n04.r03` | `assets/audio/voice/g3/turkce/u05/n04/r03.wav` | ANLATICI | Hikâyelerdeki nesneleri karşılaştır. Hangisi sporla, hangisi müzikle ilgili? Kartları kutulara taşı. |
| 323 | `vo.g3.turkce.u05.n05.intro` | `assets/audio/voice/g3/turkce/u05/n05/intro.wav` | BILGE | Yazarken kurallara uyarız. Pekiştirmeli sözcükleri, kısaltmaları ve büyük harfleri çalışalım! |
| 324 | `vo.g3.turkce.u05.n05.r01` | `assets/audio/voice/g3/turkce/u05/n05/r01.wav` | ANLATICI | Masmavi sözcüğünü hecelerden kur. |
| 325 | `vo.g3.turkce.u05.n05.r01.word` | `assets/audio/voice/g3/turkce/u05/n05/r01/word.wav` | ANLATICI | masmavi |
| 326 | `vo.g3.turkce.u05.n05.r02` | `assets/audio/voice/g3/turkce/u05/n05/r02.wav` | ANLATICI | Kıpkırmızı sözcüğünü hecelerden kur. |
| 327 | `vo.g3.turkce.u05.n05.r02.word` | `assets/audio/voice/g3/turkce/u05/n05/r02/word.wav` | ANLATICI | kıpkırmızı |
| 328 | `vo.g3.turkce.u05.n05.r03` | `assets/audio/voice/g3/turkce/u05/n05/r03.wav` | ANLATICI | Kısaltmalara gelen ek, kısaltmanın okunuşuna uyar ve kesme işaretiyle ayrılır. Her kısaltmayı doğru ekle eşleştir. |
| 329 | `vo.g3.turkce.u05.n05.r04` | `assets/audio/voice/g3/turkce/u05/n05/r04.wav` | ANLATICI | Bu sözcükler büyük harfle başlar. Her türü örneğiyle eşleştir. |
| 330 | `vo.g3.turkce.u06.n01.intro` | `assets/audio/voice/g3/turkce/u06/n01/intro.wav` | BILGE | Bilim yolculuğuna hoş geldin! Merak eden ve deneyen çocukların hikâyelerini dinleyelim. |
| 331 | `vo.g3.turkce.u06.n01.r01` | `assets/audio/voice/g3/turkce/u06/n01/r01.wav` | ANLATICI | Deniz'in deneyini dikkatle dinle. Sonra soruları cevapla. |
| 332 | `vo.g3.turkce.u06.n01.r01.p1` | `assets/audio/voice/g3/turkce/u06/n01/r01/p1.wav` | ANLATICI | Fen dersinde öğretmen masaya su dolu bir kap koydu. Yanına bir taş, bir mantar ve bir anahtar bıraktı. |
| 333 | `vo.g3.turkce.u06.n01.r01.p2` | `assets/audio/voice/g3/turkce/u06/n01/r01/p2.wav` | ANLATICI | Deniz önce tahmin yaptı, sonra nesneleri tek tek suya attı. Mantar yüzdü, taş ile anahtar dibe battı. |
| 334 | `vo.g3.turkce.u06.n01.r01.p3` | `assets/audio/voice/g3/turkce/u06/n01/r01/p3.wav` | ANLATICI | Deniz, "Tahminlerimden biri yanlış çıktı ama deneyerek doğrusunu öğrendim." dedi. |
| 335 | `vo.g3.turkce.u06.n01.r01.q1` | `assets/audio/voice/g3/turkce/u06/n01/r01/q1.wav` | ANLATICI | Hangi nesne suda yüzdü? |
| 336 | `vo.g3.turkce.u06.n01.r01.q2` | `assets/audio/voice/g3/turkce/u06/n01/r01/q2.wav` | ANLATICI | Deniz nesneleri suya atmadan önce ne yaptı? |
| 337 | `vo.g3.turkce.u06.n01.r01.q3` | `assets/audio/voice/g3/turkce/u06/n01/r01/q3.wav` | ANLATICI | Bu hikâyenin ana fikri nedir? |
| 338 | `vo.g3.turkce.u06.n01.r02` | `assets/audio/voice/g3/turkce/u06/n01/r02.wav` | ANLATICI | Ela'nın hikâyesini dinle. Sonra soruları cevapla. |
| 339 | `vo.g3.turkce.u06.n01.r02.p1` | `assets/audio/voice/g3/turkce/u06/n01/r02/p1.wav` | ANLATICI | Ela bahçede dedesinin büyütecini buldu. Büyüteci bir yaprağa tuttu ve küçük bir karınca gördü. |
| 340 | `vo.g3.turkce.u06.n01.r02.p2` | `assets/audio/voice/g3/turkce/u06/n01/r02/p2.wav` | ANLATICI | Karıncanın bacakları büyüteçte kocaman görünüyordu. Ela, "Dede, karıncanın kaç bacağı var?" diye sordu. |
| 341 | `vo.g3.turkce.u06.n01.r02.p3` | `assets/audio/voice/g3/turkce/u06/n01/r02/p3.wav` | ANLATICI | Dedesi, "Hadi birlikte sayalım." dedi. Birlikte saydılar: tam altı bacak! Ela çok heyecanlandı. |
| 342 | `vo.g3.turkce.u06.n01.r02.q1` | `assets/audio/voice/g3/turkce/u06/n01/r02/q1.wav` | ANLATICI | Ela büyüteçle ne gördü? |
| 343 | `vo.g3.turkce.u06.n01.r02.q2` | `assets/audio/voice/g3/turkce/u06/n01/r02/q2.wav` | ANLATICI | Karıncanın kaç bacağı var? |
| 344 | `vo.g3.turkce.u06.n01.r02.q3` | `assets/audio/voice/g3/turkce/u06/n01/r02/q3.wav` | ANLATICI | Hikâyedeki ana duygu nedir? |
| 345 | `vo.g3.turkce.u06.n01.r03` | `assets/audio/voice/g3/turkce/u06/n01/r03.wav` | ANLATICI | Bu cümleler gerçek mi, hayal mi? Kartları doğru kutuya taşı. |
| 346 | `vo.g3.turkce.u06.n02.intro` | `assets/audio/voice/g3/turkce/u06/n02/intro.wav` | BILGE | Bilim insanları dikkatle dinler ve açıkça anlatır. Sen de doğru olanı seç! |
| 347 | `vo.g3.turkce.u06.n02.r01` | `assets/audio/voice/g3/turkce/u06/n02/r01.wav` | ANLATICI | Bilim şenliğinde deneyini ziyaretçilere anlatıyorsun. Nasıl konuşmalısın? |
| 348 | `vo.g3.turkce.u06.n02.r01.hint` | `assets/audio/voice/g3/turkce/u06/n02/r01/hint.wav` | BILGE | Dinleyenler deneyini anlamak istiyor. |
| 349 | `vo.g3.turkce.u06.n02.r01.c2` | `assets/audio/voice/g3/turkce/u06/n02/r01/c2.wav` | ANLATICI | Ziyaretçiler rahatsız oldu. Anlatırken sakin bir sesle konuşuruz. |
| 350 | `vo.g3.turkce.u06.n02.r01.c3` | `assets/audio/voice/g3/turkce/u06/n02/r01/c3.wav` | ANLATICI | Ziyaretçiler ne dediğini anlamadı. Açık ve anlaşılır konuşuruz. |
| 351 | `vo.g3.turkce.u06.n02.r02` | `assets/audio/voice/g3/turkce/u06/n02/r02.wav` | ANLATICI | Yarın bilim müzesine gideceksin. Rehbere ne soracağını unutmamak için bugün ne yaparsın? |
| 352 | `vo.g3.turkce.u06.n02.r02.hint` | `assets/audio/voice/g3/turkce/u06/n02/r02/hint.wav` | BILGE | Merak ettiklerini önceden hazırlayabilirsin. |
| 353 | `vo.g3.turkce.u06.n02.r02.c2` | `assets/audio/voice/g3/turkce/u06/n02/r02/c2.wav` | ANLATICI | Müzede ne soracağını unuttun. Sorularımızı önceden hazırlarız. |
| 354 | `vo.g3.turkce.u06.n02.r02.c3` | `assets/audio/voice/g3/turkce/u06/n02/r02/c3.wav` | ANLATICI | Dinlenmek iyidir ama sorularını hazırlamadın. Önce bir soru listesi yaparız. |
| 355 | `vo.g3.turkce.u06.n02.r03` | `assets/audio/voice/g3/turkce/u06/n02/r03.wav` | ANLATICI | Bir bilim insanının hayatını öğrenmek istiyorsun. Ne dinlersin? |
| 356 | `vo.g3.turkce.u06.n02.r03.hint` | `assets/audio/voice/g3/turkce/u06/n02/r03/hint.wav` | BILGE | Bilgi veren bir şey seçmelisin. |
| 357 | `vo.g3.turkce.u06.n02.r03.c2` | `assets/audio/voice/g3/turkce/u06/n02/r03/c2.wav` | ANLATICI | Ninni insanı uyutur ama bilgi vermez. |
| 358 | `vo.g3.turkce.u06.n02.r03.c3` | `assets/audio/voice/g3/turkce/u06/n02/r03/c3.wav` | ANLATICI | Tekerleme eğlencelidir ama bir bilim insanını anlatmaz. |
| 359 | `vo.g3.turkce.u06.n02.r04` | `assets/audio/voice/g3/turkce/u06/n02/r04.wav` | ANLATICI | Öğretmen deneyin adımlarını sırayla söylüyor. Adımları unutmamak için ne yaparsın? |
| 360 | `vo.g3.turkce.u06.n02.r04.c2` | `assets/audio/voice/g3/turkce/u06/n02/r04/c2.wav` | ANLATICI | Adımları kaçırdın. Dinlerken önemli bilgileri not alırız. |
| 361 | `vo.g3.turkce.u06.n02.r04.c3` | `assets/audio/voice/g3/turkce/u06/n02/r04/c3.wav` | ANLATICI | Konuşurken öğretmeni duyamadın. Önce dinleriz, sonra konuşuruz. |
| 362 | `vo.g3.turkce.u06.n03.intro` | `assets/audio/voice/g3/turkce/u06/n03/intro.wav` | BILGE | Şimdi okuma zamanı! Metni sessizce oku. Takılırsan hoparlöre dokunabilirsin. |
| 363 | `vo.g3.turkce.u06.n03.r01` | `assets/audio/voice/g3/turkce/u06/n03/r01.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 364 | `vo.g3.turkce.u06.n03.r01.p1` | `assets/audio/voice/g3/turkce/u06/n03/r01/p1.wav` | ANLATICI | Yağmurdan sonra güneş açtı. Efe gökyüzünde rengârenk bir yay gördü ve koşarak annesine haber verdi. |
| 365 | `vo.g3.turkce.u06.n03.r01.p2` | `assets/audio/voice/g3/turkce/u06/n03/r01/p2.wav` | ANLATICI | Annesi, "Güneş ışığı yağmur damlalarından geçince gökkuşağı oluşur." dedi. Efe bunu defterine yazdı. |
| 366 | `vo.g3.turkce.u06.n03.r01.q1` | `assets/audio/voice/g3/turkce/u06/n03/r01/q1.wav` | ANLATICI | Bu metnin başlığı hangisi olabilir? |
| 367 | `vo.g3.turkce.u06.n03.r01.q2` | `assets/audio/voice/g3/turkce/u06/n03/r01/q2.wav` | ANLATICI | Gökkuşağı nasıl oluşur? |
| 368 | `vo.g3.turkce.u06.n03.r01.q3` | `assets/audio/voice/g3/turkce/u06/n03/r01/q3.wav` | ANLATICI | Efe gökkuşağını görünce ne yaptı? |
| 369 | `vo.g3.turkce.u06.n03.r02` | `assets/audio/voice/g3/turkce/u06/n03/r02.wav` | ANLATICI | Zıt anlamlı sözcükleri eşleştir. |
| 370 | `vo.g3.turkce.u06.n03.r03` | `assets/audio/voice/g3/turkce/u06/n03/r03.wav` | ANLATICI | Her cümlenin sonuna hangi noktalama işareti gelir? Cümleyi işaretle eşleştir. |
| 371 | `vo.g3.turkce.u06.n04.intro` | `assets/audio/voice/g3/turkce/u06/n04/intro.wav` | BILGE | Konuşmaları dinle. Sonunda ne olacağını tahmin edebilir misin? |
| 372 | `vo.g3.turkce.u06.n04.r01` | `assets/audio/voice/g3/turkce/u06/n04/r01.wav` | ANLATICI | Nil ile Kaan'ın konuşmasını dinle. Sonra soruları cevapla. |
| 373 | `vo.g3.turkce.u06.n04.r01.p1` | `assets/audio/voice/g3/turkce/u06/n04/r01/p1.wav` | ANLATICI | Okulda bilim şenliği yapılacaktı. Nil, "Deneyimiz için boş bir şişe ve biraz sirke lazım." dedi. |
| 374 | `vo.g3.turkce.u06.n04.r01.p2` | `assets/audio/voice/g3/turkce/u06/n04/r01/p2.wav` | ANLATICI | Kaan, "Evde boş bir şişe var. Yarın onu getiririm." dedi. Nil, "Ben de sirkeyi getiririm." dedi. |
| 375 | `vo.g3.turkce.u06.n04.r01.q1` | `assets/audio/voice/g3/turkce/u06/n04/r01/q1.wav` | ANLATICI | Nil ile Kaan neye hazırlanıyor? |
| 376 | `vo.g3.turkce.u06.n04.r01.q2` | `assets/audio/voice/g3/turkce/u06/n04/r01/q2.wav` | ANLATICI | Bu konuşma nasıl sonuçlanır? |
| 377 | `vo.g3.turkce.u06.n04.r02` | `assets/audio/voice/g3/turkce/u06/n04/r02.wav` | ANLATICI | Ada ile babasının konuşmasını dinle. Sonra soruları cevapla. |
| 378 | `vo.g3.turkce.u06.n04.r02.p1` | `assets/audio/voice/g3/turkce/u06/n04/r02/p1.wav` | ANLATICI | Ada pencereden baktı. "Baba, Ay geçen hafta yuvarlaktı. Bu akşam neden yarım görünüyor?" diye sordu. |
| 379 | `vo.g3.turkce.u06.n04.r02.p2` | `assets/audio/voice/g3/turkce/u06/n04/r02/p2.wav` | ANLATICI | Babası, "Gel, her akşam Ay'ı gözleyip çizelim. Ne değiştiğini birlikte görürüz." dedi. Ada çok sevindi. |
| 380 | `vo.g3.turkce.u06.n04.r02.q1` | `assets/audio/voice/g3/turkce/u06/n04/r02/q1.wav` | ANLATICI | Ada neyi merak etti? |
| 381 | `vo.g3.turkce.u06.n04.r02.q2` | `assets/audio/voice/g3/turkce/u06/n04/r02/q2.wav` | ANLATICI | Bu konuşma nasıl sonuçlanır? |
| 382 | `vo.g3.turkce.u06.n04.r03` | `assets/audio/voice/g3/turkce/u06/n04/r03.wav` | ANLATICI | Hikâyeleri karşılaştır. Hangisi Kaan'ın, hangisi Ada'nın hikâyesindeydi? Kartları kutulara taşı. |
| 383 | `vo.g3.turkce.u06.n05.intro` | `assets/audio/voice/g3/turkce/u06/n05/intro.wav` | BILGE | Yazarken kurallara uyarız. Pekiştirmeli sözcükleri, kısaltmaları ve büyük harfleri çalışalım! |
| 384 | `vo.g3.turkce.u06.n05.r01` | `assets/audio/voice/g3/turkce/u06/n05/r01.wav` | ANLATICI | Tertemiz sözcüğünü hecelerden kur. |
| 385 | `vo.g3.turkce.u06.n05.r01.word` | `assets/audio/voice/g3/turkce/u06/n05/r01/word.wav` | ANLATICI | tertemiz |
| 386 | `vo.g3.turkce.u06.n05.r02` | `assets/audio/voice/g3/turkce/u06/n05/r02.wav` | ANLATICI | Apaçık sözcüğünü hecelerden kur. |
| 387 | `vo.g3.turkce.u06.n05.r02.word` | `assets/audio/voice/g3/turkce/u06/n05/r02/word.wav` | ANLATICI | apaçık |
| 388 | `vo.g3.turkce.u06.n05.r03` | `assets/audio/voice/g3/turkce/u06/n05/r03.wav` | ANLATICI | Kısaltmalara gelen ek, kısaltmanın okunuşuna uyar ve kesme işaretiyle ayrılır. Her kısaltmayı doğru ekle eşleştir. |
| 389 | `vo.g3.turkce.u06.n05.r04` | `assets/audio/voice/g3/turkce/u06/n05/r04.wav` | ANLATICI | Bu sözcükler büyük harfle başlar. Her türü örneğiyle eşleştir. |
| 390 | `vo.g3.turkce.u07.n01.intro` | `assets/audio/voice/g3/turkce/u07/n01/intro.wav` | BILGE | Merhaba! Güzel geleneklerimizi anlatan hikâyeleri dinleyelim. |
| 391 | `vo.g3.turkce.u07.n01.r01` | `assets/audio/voice/g3/turkce/u07/n01/r01.wav` | ANLATICI | Aslı'nın bayram gününü dikkatle dinle. Sonra soruları cevapla. |
| 392 | `vo.g3.turkce.u07.n01.r01.p1` | `assets/audio/voice/g3/turkce/u07/n01/r01/p1.wav` | ANLATICI | Bayram sabahı Aslı erkenden uyandı. Yeni kıyafetlerini giydi ve ailesiyle dedesinin evine gitti. |
| 393 | `vo.g3.turkce.u07.n01.r01.p2` | `assets/audio/voice/g3/turkce/u07/n01/r01/p2.wav` | ANLATICI | Aslı, dedesinin ve babaannesinin elini öptü. Babaannesi ona sarıldı ve bir avuç şeker verdi. |
| 394 | `vo.g3.turkce.u07.n01.r01.p3` | `assets/audio/voice/g3/turkce/u07/n01/r01/p3.wav` | ANLATICI | Öğleden sonra komşuları da bayramlaşmaya geldi. Aslı misafirlere şeker ikram etti. Ev neşeyle doldu. |
| 395 | `vo.g3.turkce.u07.n01.r01.q1` | `assets/audio/voice/g3/turkce/u07/n01/r01/q1.wav` | ANLATICI | Aslı bayram sabahı nereye gitti? |
| 396 | `vo.g3.turkce.u07.n01.r01.q2` | `assets/audio/voice/g3/turkce/u07/n01/r01/q2.wav` | ANLATICI | Bu hikâyenin konusu nedir? |
| 397 | `vo.g3.turkce.u07.n01.r01.q3` | `assets/audio/voice/g3/turkce/u07/n01/r01/q3.wav` | ANLATICI | Aslı misafirlere ne ikram etti? |
| 398 | `vo.g3.turkce.u07.n01.r02` | `assets/audio/voice/g3/turkce/u07/n01/r02.wav` | ANLATICI | Murat'ın ninesini anlatan hikâyeyi dinle. Sonra soruları cevapla. |
| 399 | `vo.g3.turkce.u07.n01.r02.p1` | `assets/audio/voice/g3/turkce/u07/n01/r02/p1.wav` | ANLATICI | Murat'ın ninesi tezgâhta halı dokurdu. Renkli ipleri tek tek düğümler, güzel desenler yapardı. |
| 400 | `vo.g3.turkce.u07.n01.r02.p2` | `assets/audio/voice/g3/turkce/u07/n01/r02/p2.wav` | ANLATICI | Ninesi, "Bu sanatı ben de annemden öğrendim." dedi. Murat, "Ben de öğrenip yaşatacağım." dedi. |
| 401 | `vo.g3.turkce.u07.n01.r02.q1` | `assets/audio/voice/g3/turkce/u07/n01/r02/q1.wav` | ANLATICI | Murat'ın ninesi ne yapıyordu? |
| 402 | `vo.g3.turkce.u07.n01.r02.q2` | `assets/audio/voice/g3/turkce/u07/n01/r02/q2.wav` | ANLATICI | Ninesi bu sanatı kimden öğrenmiş? |
| 403 | `vo.g3.turkce.u07.n01.r02.q3` | `assets/audio/voice/g3/turkce/u07/n01/r02/q3.wav` | ANLATICI | Bu hikâyenin ana fikri nedir? |
| 404 | `vo.g3.turkce.u07.n01.r03` | `assets/audio/voice/g3/turkce/u07/n01/r03.wav` | ANLATICI | Hangisi Aslı'nın, hangisi Murat'ın hikâyesindeydi? Her kartı doğru kutuya taşı. |
| 405 | `vo.g3.turkce.u07.n02.intro` | `assets/audio/voice/g3/turkce/u07/n02/intro.wav` | BILGE | Misafirimize ve büyüklerimize nasıl konuşuruz? Haydi, doğru olanı seçelim! |
| 406 | `vo.g3.turkce.u07.n02.r01` | `assets/audio/voice/g3/turkce/u07/n02/r01.wav` | ANLATICI | Kapı çaldı. Annenle birlikte kapıyı açtın, misafirler geldi. Onlara ne dersin? |
| 407 | `vo.g3.turkce.u07.n02.r01.hint` | `assets/audio/voice/g3/turkce/u07/n02/r01/hint.wav` | BILGE | Misafirlerimizi güler yüzle ve kibar sözlerle karşılarız. |
| 408 | `vo.g3.turkce.u07.n02.r01.c2` | `assets/audio/voice/g3/turkce/u07/n02/r01/c2.wav` | ANLATICI | Misafirler biraz şaşırdı. Onları güler yüzle karşılarız. |
| 409 | `vo.g3.turkce.u07.n02.r01.c3` | `assets/audio/voice/g3/turkce/u07/n02/r01/c3.wav` | ANLATICI | Misafirler hoş karşılanmadıklarını düşündü. Onlara "Hoş geldiniz." deriz. |
| 410 | `vo.g3.turkce.u07.n02.r02` | `assets/audio/voice/g3/turkce/u07/n02/r02.wav` | ANLATICI | Bayramda uzakta yaşayan dedeni telefonla arıyorsun. Ne dersin? |
| 411 | `vo.g3.turkce.u07.n02.r02.hint` | `assets/audio/voice/g3/turkce/u07/n02/r02/hint.wav` | BILGE | Büyüklerimizle saygılı konuşur, bayramlarını kutlarız. |
| 412 | `vo.g3.turkce.u07.n02.r02.c2` | `assets/audio/voice/g3/turkce/u07/n02/r02/c2.wav` | ANLATICI | Dedeni sevindirmek için daha saygılı sözler seçebilirsin. |
| 413 | `vo.g3.turkce.u07.n02.r02.c3` | `assets/audio/voice/g3/turkce/u07/n02/r02/c3.wav` | ANLATICI | Dede bayramın kutlanmasını bekliyordu. Önce bayramını kutlarız. |
| 414 | `vo.g3.turkce.u07.n02.r03` | `assets/audio/voice/g3/turkce/u07/n02/r03.wav` | ANLATICI | Öğretmen bir Nasreddin Hoca fıkrası anlatacak. Fıkrayı akşam ailene anlatmak istiyorsun. Nasıl dinlersin? |
| 415 | `vo.g3.turkce.u07.n02.r03.hint` | `assets/audio/voice/g3/turkce/u07/n02/r03/hint.wav` | BILGE | Sonra anlatabilmek için her şeyi iyi duymalısın. |
| 416 | `vo.g3.turkce.u07.n02.r03.c2` | `assets/audio/voice/g3/turkce/u07/n02/r03/c2.wav` | ANLATICI | Fıkranın sonunu kaçırdın. Anlatılanı dikkatle dinleriz. |
| 417 | `vo.g3.turkce.u07.n02.r03.c3` | `assets/audio/voice/g3/turkce/u07/n02/r03/c3.wav` | ANLATICI | Dikkatin dağıldı ve fıkrayı hatırlayamadın. Dinlerken anlatana odaklanırız. |
| 418 | `vo.g3.turkce.u07.n02.r04` | `assets/audio/voice/g3/turkce/u07/n02/r04.wav` | ANLATICI | Ebru atölyesinde usta, gereken malzemeleri tek tek sayıyor. Unutmamak için ne yaparsın? |
| 419 | `vo.g3.turkce.u07.n02.r04.c2` | `assets/audio/voice/g3/turkce/u07/n02/r04/c2.wav` | ANLATICI | Malzemelerin adlarını kaçırdın. Önemli bilgileri not alırız. |
| 420 | `vo.g3.turkce.u07.n02.r04.c3` | `assets/audio/voice/g3/turkce/u07/n02/r04/c3.wav` | ANLATICI | Ustanın anlattıklarını duyamadın. Anlatılanı sonuna kadar dinleriz. |
| 421 | `vo.g3.turkce.u07.n03.intro` | `assets/audio/voice/g3/turkce/u07/n03/intro.wav` | BILGE | Şimdi bir Nasreddin Hoca fıkrası okuyalım. Metni sessizce oku. Takılırsan hoparlöre dokunabilirsin. |
| 422 | `vo.g3.turkce.u07.n03.r01` | `assets/audio/voice/g3/turkce/u07/n03/r01.wav` | ANLATICI | Fıkrayı sessizce oku. Sonra soruları cevapla. |
| 423 | `vo.g3.turkce.u07.n03.r01.p1` | `assets/audio/voice/g3/turkce/u07/n03/r01/p1.wav` | ANLATICI | Nasreddin Hoca bir düğüne eski giysileriyle gitti. Kimse ona yer göstermedi, onunla ilgilenmedi. |
| 424 | `vo.g3.turkce.u07.n03.r01.p2` | `assets/audio/voice/g3/turkce/u07/n03/r01/p2.wav` | ANLATICI | Hoca eve dönüp güzel bir kürk giydi. Düğüne geri gelince herkes onu başköşeye oturttu. |
| 425 | `vo.g3.turkce.u07.n03.r01.p3` | `assets/audio/voice/g3/turkce/u07/n03/r01/p3.wav` | ANLATICI | Yemek gelince Hoca kürkünün yenini çorbaya uzattı. "Ye kürküm ye!" dedi. Herkes hatasını anladı. |
| 426 | `vo.g3.turkce.u07.n03.r01.q1` | `assets/audio/voice/g3/turkce/u07/n03/r01/q1.wav` | ANLATICI | Bu fıkranın başlığı hangisi olabilir? |
| 427 | `vo.g3.turkce.u07.n03.r01.q2` | `assets/audio/voice/g3/turkce/u07/n03/r01/q2.wav` | ANLATICI | Hoca kürk giyince ne oldu? |
| 428 | `vo.g3.turkce.u07.n03.r01.q3` | `assets/audio/voice/g3/turkce/u07/n03/r01/q3.wav` | ANLATICI | Fıkranın ana fikri nedir? |
| 429 | `vo.g3.turkce.u07.n03.r02` | `assets/audio/voice/g3/turkce/u07/n03/r02.wav` | ANLATICI | Eş anlamlı sözcükleri eşleştir. |
| 430 | `vo.g3.turkce.u07.n03.r03` | `assets/audio/voice/g3/turkce/u07/n03/r03.wav` | ANLATICI | Sözcükler gerçek anlamda mı, mecaz anlamda mı kullanılmış? Kartları kutulara taşı. |
| 431 | `vo.g3.turkce.u07.n04.intro` | `assets/audio/voice/g3/turkce/u07/n04/intro.wav` | BILGE | Konuşmaları dinle. Sonunda ne olacağını tahmin edebilir misin? |
| 432 | `vo.g3.turkce.u07.n04.r01` | `assets/audio/voice/g3/turkce/u07/n04/r01.wav` | ANLATICI | Zeynep ile annesinin konuşmasını dinle. Sonra soruları cevapla. |
| 433 | `vo.g3.turkce.u07.n04.r01.p1` | `assets/audio/voice/g3/turkce/u07/n04/r01/p1.wav` | ANLATICI | Zeynep'lere komşuları Gül Teyze geldi. Annesi, "Zeynep, misafirimize lokum ikram eder misin?" dedi. |
| 434 | `vo.g3.turkce.u07.n04.r01.p2` | `assets/audio/voice/g3/turkce/u07/n04/r01/p2.wav` | ANLATICI | Zeynep, "Tabii anneciğim, tabağı hemen hazırlarım." dedi. Gül Teyze, "Ne kadar nazik bir kızsın!" dedi. |
| 435 | `vo.g3.turkce.u07.n04.r01.q1` | `assets/audio/voice/g3/turkce/u07/n04/r01/q1.wav` | ANLATICI | Zeynep'lere kim geldi? |
| 436 | `vo.g3.turkce.u07.n04.r01.q2` | `assets/audio/voice/g3/turkce/u07/n04/r01/q2.wav` | ANLATICI | Bu konuşma nasıl sonuçlanır? |
| 437 | `vo.g3.turkce.u07.n04.r02` | `assets/audio/voice/g3/turkce/u07/n04/r02.wav` | ANLATICI | Nehir ile ebru ustasının konuşmasını dinle. Sonra soruları cevapla. |
| 438 | `vo.g3.turkce.u07.n04.r02.p1` | `assets/audio/voice/g3/turkce/u07/n04/r02/p1.wav` | ANLATICI | Nehir bir ebru atölyesine gitti. Ustaya, "Boyalar suyun üstünde nasıl duruyor?" diye sordu. |
| 439 | `vo.g3.turkce.u07.n04.r02.p2` | `assets/audio/voice/g3/turkce/u07/n04/r02/p2.wav` | ANLATICI | Usta, "Suyu kitre ile koyulaştırırız. İstersen sen de dene." dedi. Nehir fırçayı heyecanla aldı. |
| 440 | `vo.g3.turkce.u07.n04.r02.q1` | `assets/audio/voice/g3/turkce/u07/n04/r02/q1.wav` | ANLATICI | Nehir nereye gitti? |
| 441 | `vo.g3.turkce.u07.n04.r02.q2` | `assets/audio/voice/g3/turkce/u07/n04/r02/q2.wav` | ANLATICI | Bu konuşma nasıl sonuçlanır? |
| 442 | `vo.g3.turkce.u07.n04.r03` | `assets/audio/voice/g3/turkce/u07/n04/r03.wav` | ANLATICI | Hikâyeleri karşılaştır. Hangisi Zeynep'in, hangisi Nehir'in hikâyesindeydi? Kartları kutulara taşı. |
| 443 | `vo.g3.turkce.u07.n05.intro` | `assets/audio/voice/g3/turkce/u07/n05/intro.wav` | BILGE | Yazarken kurallara uyarız. Pekiştirmeli sözcükleri, kısaltmaları ve büyük harfleri çalışalım! |
| 444 | `vo.g3.turkce.u07.n05.r01` | `assets/audio/voice/g3/turkce/u07/n05/r01.wav` | ANLATICI | Yemyeşil sözcüğünü hecelerden kur. |
| 445 | `vo.g3.turkce.u07.n05.r01.word` | `assets/audio/voice/g3/turkce/u07/n05/r01/word.wav` | ANLATICI | yemyeşil |
| 446 | `vo.g3.turkce.u07.n05.r02` | `assets/audio/voice/g3/turkce/u07/n05/r02.wav` | ANLATICI | Sımsıcak sözcüğünü hecelerden kur. |
| 447 | `vo.g3.turkce.u07.n05.r02.word` | `assets/audio/voice/g3/turkce/u07/n05/r02/word.wav` | ANLATICI | sımsıcak |
| 448 | `vo.g3.turkce.u07.n05.r03` | `assets/audio/voice/g3/turkce/u07/n05/r03.wav` | ANLATICI | Kısaltmalara gelen ek, kısaltmanın okunuşuna uyar ve kesme işaretiyle ayrılır. Her kısaltmayı doğru ekle eşleştir. |
| 449 | `vo.g3.turkce.u07.n05.r04` | `assets/audio/voice/g3/turkce/u07/n05/r04.wav` | ANLATICI | Bu sözcükler büyük harfle başlar. Her türü örneğiyle eşleştir. |
| 450 | `vo.g3.turkce.u08.n01.intro` | `assets/audio/voice/g3/turkce/u08/n01/intro.wav` | BILGE | Merhaba! Haklarımız da sorumluluklarımız da var. Bunları anlatan hikâyeleri dinleyelim. |
| 451 | `vo.g3.turkce.u08.n01.r01` | `assets/audio/voice/g3/turkce/u08/n01/r01.wav` | ANLATICI | Barış'ın cumartesi gününü dikkatle dinle. Sonra soruları cevapla. |
| 452 | `vo.g3.turkce.u08.n01.r01.p1` | `assets/audio/voice/g3/turkce/u08/n01/r01/p1.wav` | ANLATICI | Barış cumartesi sabahı önce ödevlerini bitirdi. Sonra odasını topladı ve saksıdaki çiçekleri suladı. |
| 453 | `vo.g3.turkce.u08.n01.r01.p2` | `assets/audio/voice/g3/turkce/u08/n01/r01/p2.wav` | ANLATICI | Öğleden sonra annesiyle parka gitti. Arkadaşlarıyla saklambaç oynadı, salıncakta sallandı. |
| 454 | `vo.g3.turkce.u08.n01.r01.p3` | `assets/audio/voice/g3/turkce/u08/n01/r01/p3.wav` | ANLATICI | Annesi, "Sorumluluklarını yerine getirdin. Oyun oynamak da senin hakkın." dedi. Barış gülümsedi. |
| 455 | `vo.g3.turkce.u08.n01.r01.q1` | `assets/audio/voice/g3/turkce/u08/n01/r01/q1.wav` | ANLATICI | Barış parka gitmeden önce ne yaptı? |
| 456 | `vo.g3.turkce.u08.n01.r01.q2` | `assets/audio/voice/g3/turkce/u08/n01/r01/q2.wav` | ANLATICI | Annesine göre oyun oynamak nedir? |
| 457 | `vo.g3.turkce.u08.n01.r01.q3` | `assets/audio/voice/g3/turkce/u08/n01/r01/q3.wav` | ANLATICI | Bu hikâyenin ana fikri nedir? |
| 458 | `vo.g3.turkce.u08.n01.r02` | `assets/audio/voice/g3/turkce/u08/n01/r02.wav` | ANLATICI | Ece'nin hikâyesini dinle. Sonra soruları cevapla. |
| 459 | `vo.g3.turkce.u08.n01.r02.p1` | `assets/audio/voice/g3/turkce/u08/n01/r02/p1.wav` | ANLATICI | Ece bir sabah ateşlenince babası onu hemen doktora götürdü. Doktor, Ece'yi dikkatle muayene etti. |
| 460 | `vo.g3.turkce.u08.n01.r02.p2` | `assets/audio/voice/g3/turkce/u08/n01/r02/p2.wav` | ANLATICI | Doktor, "İlaçlarını zamanında iç ve bol bol dinlen." dedi. Ece, doktorun söylediklerini yaptı. |
| 461 | `vo.g3.turkce.u08.n01.r02.p3` | `assets/audio/voice/g3/turkce/u08/n01/r02/p3.wav` | ANLATICI | Birkaç gün sonra Ece iyileşti. Okula dönünce arkadaşları onu sevinçle karşıladı. |
| 462 | `vo.g3.turkce.u08.n01.r02.q1` | `assets/audio/voice/g3/turkce/u08/n01/r02/q1.wav` | ANLATICI | Babası Ece'yi nereye götürdü? |
| 463 | `vo.g3.turkce.u08.n01.r02.q2` | `assets/audio/voice/g3/turkce/u08/n01/r02/q2.wav` | ANLATICI | Ece iyileşmek için ne yaptı? |
| 464 | `vo.g3.turkce.u08.n01.r02.q3` | `assets/audio/voice/g3/turkce/u08/n01/r02/q3.wav` | ANLATICI | Bu hikâyenin konusu nedir? |
| 465 | `vo.g3.turkce.u08.n01.r03` | `assets/audio/voice/g3/turkce/u08/n01/r03.wav` | ANLATICI | Hangisi hakkımız, hangisi görevimiz? Kartları doğru kutuya taşı. |
| 466 | `vo.g3.turkce.u08.n02.intro` | `assets/audio/voice/g3/turkce/u08/n02/intro.wav` | BILGE | Konuşurken ve dinlerken kurallara uyarız. Haydi, doğru olanı birlikte seçelim! |
| 467 | `vo.g3.turkce.u08.n02.r01` | `assets/audio/voice/g3/turkce/u08/n02/r01.wav` | ANLATICI | Sınıf başkanı seçimi için arkadaşlarına konuşma yapacaksın. Nasıl konuşmalısın? |
| 468 | `vo.g3.turkce.u08.n02.r01.hint` | `assets/audio/voice/g3/turkce/u08/n02/r01/hint.wav` | BILGE | Arkadaşlarına saygı duyduğunu gösteren bir konuşma seç. |
| 469 | `vo.g3.turkce.u08.n02.r01.c2` | `assets/audio/voice/g3/turkce/u08/n02/r01/c2.wav` | ANLATICI | Arkadaşların rahatsız oldu. Konuşurken sesimizi ayarlarız. |
| 470 | `vo.g3.turkce.u08.n02.r01.c3` | `assets/audio/voice/g3/turkce/u08/n02/r01/c3.wav` | ANLATICI | Diğer adaylar üzüldü. Kimseyi kötülemeden kendi fikirlerimizi anlatırız. |
| 471 | `vo.g3.turkce.u08.n02.r02` | `assets/audio/voice/g3/turkce/u08/n02/r02.wav` | ANLATICI | Sınıf toplantısında Ada konuşurken Kerem sürekli onun sözünü kesiyor. Bu konuşmadaki hata nedir? |
| 472 | `vo.g3.turkce.u08.n02.r02.hint` | `assets/audio/voice/g3/turkce/u08/n02/r02/hint.wav` | BILGE | Biri konuşurken ne yapmamız gerekir? Bir düşün. |
| 473 | `vo.g3.turkce.u08.n02.r02.c2` | `assets/audio/voice/g3/turkce/u08/n02/r02/c2.wav` | ANLATICI | Kibar olmak güzeldir. Buradaki sorun, Ada'nın sözünün kesilmesi. |
| 474 | `vo.g3.turkce.u08.n02.r02.c3` | `assets/audio/voice/g3/turkce/u08/n02/r02/c3.wav` | ANLATICI | Kerem sessiz durmadı. Sorun, Ada'nın sözünün kesilmesi. |
| 475 | `vo.g3.turkce.u08.n02.r03` | `assets/audio/voice/g3/turkce/u08/n02/r03.wav` | ANLATICI | Sınıfınıza bir itfaiyeci konuk gelecek. O gelmeden önce ne yaparsın? |
| 476 | `vo.g3.turkce.u08.n02.r03.hint` | `assets/audio/voice/g3/turkce/u08/n02/r03/hint.wav` | BILGE | Merak ettiklerini önceden hazırlayabilirsin. |
| 477 | `vo.g3.turkce.u08.n02.r03.c2` | `assets/audio/voice/g3/turkce/u08/n02/r03/c2.wav` | ANLATICI | İtfaiyeci gelince ne soracağını bilemedin. Sorularımızı önceden hazırlarız. |
| 478 | `vo.g3.turkce.u08.n02.r03.c3` | `assets/audio/voice/g3/turkce/u08/n02/r03/c3.wav` | ANLATICI | Konuğu kaçırdın. Konuğu dinlemek için hazırlıklı oluruz. |
| 479 | `vo.g3.turkce.u08.n02.r04` | `assets/audio/voice/g3/turkce/u08/n02/r04.wav` | ANLATICI | Okulda çocuk hakları üzerine bir söyleşi var. Bu söyleşiyi neden dinlersin? |
| 480 | `vo.g3.turkce.u08.n02.r04.hint` | `assets/audio/voice/g3/turkce/u08/n02/r04/hint.wav` | BILGE | Söyleşilerde konuşan kişi bize bir konuyu anlatır. |
| 481 | `vo.g3.turkce.u08.n02.r04.c2` | `assets/audio/voice/g3/turkce/u08/n02/r04/c2.wav` | ANLATICI | Söyleşiyi kaçırdın. Söyleşileri bilgi almak için dinleriz. |
| 482 | `vo.g3.turkce.u08.n02.r04.c3` | `assets/audio/voice/g3/turkce/u08/n02/r04/c3.wav` | ANLATICI | Söyleşi dans etmek için değil. Bir konuyu öğrenmek için dinleriz. |
| 483 | `vo.g3.turkce.u08.n03.intro` | `assets/audio/voice/g3/turkce/u08/n03/intro.wav` | BILGE | Şimdi okuma zamanı! Metinleri sessizce oku. Takılırsan hoparlöre dokunabilirsin. |
| 484 | `vo.g3.turkce.u08.n03.r01` | `assets/audio/voice/g3/turkce/u08/n03/r01.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 485 | `vo.g3.turkce.u08.n03.r01.p1` | `assets/audio/voice/g3/turkce/u08/n03/r01/p1.wav` | ANLATICI | Teneffüste Sude, okul bahçesinde yerlere atılmış kâğıtlar gördü. Bunu sınıf arkadaşlarına anlattı. |
| 486 | `vo.g3.turkce.u08.n03.r01.p2` | `assets/audio/voice/g3/turkce/u08/n03/r01/p2.wav` | ANLATICI | Sınıfça bahçeyi temizlediler. Sonra kâğıt ve plastik için ayrı kutular koyup üstlerine resim çizdiler. |
| 487 | `vo.g3.turkce.u08.n03.r01.q1` | `assets/audio/voice/g3/turkce/u08/n03/r01/q1.wav` | ANLATICI | Bu metnin başlığı hangisi olabilir? |
| 488 | `vo.g3.turkce.u08.n03.r01.q2` | `assets/audio/voice/g3/turkce/u08/n03/r01/q2.wav` | ANLATICI | Sınıf neden ayrı kutular koydu? |
| 489 | `vo.g3.turkce.u08.n03.r01.q3` | `assets/audio/voice/g3/turkce/u08/n03/r01/q3.wav` | ANLATICI | Sence bundan sonra bahçe nasıl olur? |
| 490 | `vo.g3.turkce.u08.n03.r02` | `assets/audio/voice/g3/turkce/u08/n03/r02.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 491 | `vo.g3.turkce.u08.n03.r02.p1` | `assets/audio/voice/g3/turkce/u08/n03/r02/p1.wav` | ANLATICI | Evimizde herkesin bir görevi var. Babam yemek yapar, annem çamaşırları yıkar, ablam bulaşıkları yerleştirir. |
| 492 | `vo.g3.turkce.u08.n03.r02.p2` | `assets/audio/voice/g3/turkce/u08/n03/r02/p2.wav` | ANLATICI | Ben de her akşam sofrayı kurarım ve kedimizin mamasını veririm. Birlikte çalışınca işler çabuk biter. |
| 493 | `vo.g3.turkce.u08.n03.r02.q1` | `assets/audio/voice/g3/turkce/u08/n03/r02/q1.wav` | ANLATICI | Metindeki çocuğun görevi nedir? |
| 494 | `vo.g3.turkce.u08.n03.r02.q2` | `assets/audio/voice/g3/turkce/u08/n03/r02/q2.wav` | ANLATICI | Metnin ana fikri nedir? |
| 495 | `vo.g3.turkce.u08.n03.r03` | `assets/audio/voice/g3/turkce/u08/n03/r03.wav` | ANLATICI | Zıt anlamlı sözcükleri eşleştir. |
| 496 | `vo.g3.turkce.u08.n03.r04` | `assets/audio/voice/g3/turkce/u08/n03/r04.wav` | ANLATICI | Her cümlenin sonuna hangi noktalama işareti gelir? Cümleyi işaretle eşleştir. |
| 497 | `vo.g3.turkce.u08.n04.intro` | `assets/audio/voice/g3/turkce/u08/n04/intro.wav` | BILGE | Konuşmaları dinle. Sonunda ne olacağını tahmin edebilir misin? |
| 498 | `vo.g3.turkce.u08.n04.r01` | `assets/audio/voice/g3/turkce/u08/n04/r01.wav` | ANLATICI | Emre ile öğretmeninin konuşmasını dinle. Sonra soruları cevapla. |
| 499 | `vo.g3.turkce.u08.n04.r01.p1` | `assets/audio/voice/g3/turkce/u08/n04/r01/p1.wav` | ANLATICI | Emre öğretmenine, "Okul bahçemiz çok boş. Oraya fidan diksek nasıl olur?" diye sordu. |
| 500 | `vo.g3.turkce.u08.n04.r01.p2` | `assets/audio/voice/g3/turkce/u08/n04/r01/p2.wav` | ANLATICI | Öğretmeni, "Harika bir fikir! Her sınıf bir fidan dikip ona bakabilir." dedi. Emre çok sevindi. |
| 501 | `vo.g3.turkce.u08.n04.r01.q1` | `assets/audio/voice/g3/turkce/u08/n04/r01/q1.wav` | ANLATICI | Emre neyi önerdi? |
| 502 | `vo.g3.turkce.u08.n04.r01.q2` | `assets/audio/voice/g3/turkce/u08/n04/r01/q2.wav` | ANLATICI | Bu konuşma nasıl sonuçlanır? |
| 503 | `vo.g3.turkce.u08.n04.r02` | `assets/audio/voice/g3/turkce/u08/n04/r02.wav` | ANLATICI | Yusuf ile kütüphane görevlisinin konuşmasını dinle. Sonra soruları cevapla. |
| 504 | `vo.g3.turkce.u08.n04.r02.p1` | `assets/audio/voice/g3/turkce/u08/n04/r02/p1.wav` | ANLATICI | Yusuf kütüphaneye gitti. Görevliye, "Aldığım kitabı getirmeyi unuttum, özür dilerim." dedi. |
| 505 | `vo.g3.turkce.u08.n04.r02.p2` | `assets/audio/voice/g3/turkce/u08/n04/r02/p2.wav` | ANLATICI | Görevli, "Önemli değil ama başka çocuklar da onu okumak istiyor." dedi. Yusuf, "Yarın getiririm." dedi. |
| 506 | `vo.g3.turkce.u08.n04.r02.q1` | `assets/audio/voice/g3/turkce/u08/n04/r02/q1.wav` | ANLATICI | Yusuf neyi unutmuştu? |
| 507 | `vo.g3.turkce.u08.n04.r02.q2` | `assets/audio/voice/g3/turkce/u08/n04/r02/q2.wav` | ANLATICI | Bu konuşma nasıl sonuçlanır? |
| 508 | `vo.g3.turkce.u08.n04.r03` | `assets/audio/voice/g3/turkce/u08/n04/r03.wav` | ANLATICI | Hikâyeleri karşılaştır. Hangisi Emre'nin, hangisi Yusuf'un hikâyesindeydi? Kartları kutulara taşı. |
| 509 | `vo.g3.turkce.u08.n05.intro` | `assets/audio/voice/g3/turkce/u08/n05/intro.wav` | BILGE | Yazarken kurallara uyarız. Pekiştirmeli sözcükleri, kısaltmaları ve büyük harfleri çalışalım! |
| 510 | `vo.g3.turkce.u08.n05.r01` | `assets/audio/voice/g3/turkce/u08/n05/r01.wav` | ANLATICI | Sapasağlam sözcüğünü hecelerden kur. |
| 511 | `vo.g3.turkce.u08.n05.r01.word` | `assets/audio/voice/g3/turkce/u08/n05/r01/word.wav` | ANLATICI | sapasağlam |
| 512 | `vo.g3.turkce.u08.n05.r02` | `assets/audio/voice/g3/turkce/u08/n05/r02.wav` | ANLATICI | Yepyeni sözcüğünü hecelerden kur. |
| 513 | `vo.g3.turkce.u08.n05.r02.word` | `assets/audio/voice/g3/turkce/u08/n05/r02/word.wav` | ANLATICI | yepyeni |
| 514 | `vo.g3.turkce.u08.n05.r03` | `assets/audio/voice/g3/turkce/u08/n05/r03.wav` | ANLATICI | Kısaltmalara gelen ek, kısaltmanın okunuşuna uyar ve kesme işaretiyle ayrılır. Her kısaltmayı doğru ekle eşleştir. |
| 515 | `vo.g3.turkce.u08.n05.r04` | `assets/audio/voice/g3/turkce/u08/n05/r04.wav` | ANLATICI | Bu sözcükler büyük harfle başlar. Her türü örneğiyle eşleştir. |

---
## Teslim kontrol listesi
- [ ] Dosya adları kimlikle birebir aynı (Türkçe karakter yok)
- [ ] Ses başında ve sonunda uzun sessizlik yok (gerekirse kırp)
- [ ] 005'teki aynı iki ses kullanıldı
- [ ] Commit: `assets: 071 g3 türkçe seslendirme`
