# 070 · 2. sınıf Türkçe seslendirmesi (8 tema)

**Öncelik: YÜKSEK** (Faz 4c). `content/g2/turkce/u01.json`–`u08.json` duraklarının Bilge girişleri, tur yönergeleri, hikâye sayfaları, sorular, ipuçları ve nazik sonuç satırları. Kart sözcükleri (`vo.tk.*`) 072'de.

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
| 1 | `vo.g2.turkce.u01.n01.intro` | `assets/audio/voice/g2/turkce/u01/n01/intro.wav` | BILGE | Merhaba! Şimdi kulaklarını aç. Birbirine yardım eden çocukların hikâyelerini dinleyelim. |
| 2 | `vo.g2.turkce.u01.n01.r01` | `assets/audio/voice/g2/turkce/u01/n01/r01.wav` | ANLATICI | Hikâyeyi dikkatle dinle. Sonra soruları cevapla. |
| 3 | `vo.g2.turkce.u01.n01.r01.p1` | `assets/audio/voice/g2/turkce/u01/n01/r01/p1.wav` | ANLATICI | Yağmur başladı. Ece'nin şemsiyesi vardı ama arkadaşı Can'ın yoktu. |
| 4 | `vo.g2.turkce.u01.n01.r01.p2` | `assets/audio/voice/g2/turkce/u01/n01/r01/p2.wav` | ANLATICI | Ece, Can'ı şemsiyesinin altına çağırdı. İkisi birlikte okula yürüdü. |
| 5 | `vo.g2.turkce.u01.n01.r01.p3` | `assets/audio/voice/g2/turkce/u01/n01/r01/p3.wav` | ANLATICI | Can okula ıslanmadan vardı. Ece'ye teşekkür etti. Ece çok mutlu oldu. |
| 6 | `vo.g2.turkce.u01.n01.r01.q1` | `assets/audio/voice/g2/turkce/u01/n01/r01/q1.wav` | ANLATICI | Can'ın neyi yoktu? |
| 7 | `vo.g2.turkce.u01.n01.r01.q2` | `assets/audio/voice/g2/turkce/u01/n01/r01/q2.wav` | ANLATICI | Bu hikâyenin konusu nedir? |
| 8 | `vo.g2.turkce.u01.n01.r01.q3` | `assets/audio/voice/g2/turkce/u01/n01/r01/q3.wav` | ANLATICI | Sence Can yarın ne yapar? |
| 9 | `vo.g2.turkce.u01.n01.r02` | `assets/audio/voice/g2/turkce/u01/n01/r02.wav` | ANLATICI | Mert'in hikâyesini dinle. Sonra soruları cevapla. |
| 10 | `vo.g2.turkce.u01.n01.r02.p1` | `assets/audio/voice/g2/turkce/u01/n01/r02/p1.wav` | ANLATICI | Mert parkta oynarken yerde bir cüzdan buldu. |
| 11 | `vo.g2.turkce.u01.n01.r02.p2` | `assets/audio/voice/g2/turkce/u01/n01/r02/p2.wav` | ANLATICI | Mert cüzdanı hemen parktaki bekçi amcaya götürdü. |
| 12 | `vo.g2.turkce.u01.n01.r02.p3` | `assets/audio/voice/g2/turkce/u01/n01/r02/p3.wav` | ANLATICI | Bekçi amca cüzdanın sahibini buldu. Sahibi Mert'e çok teşekkür etti. |
| 13 | `vo.g2.turkce.u01.n01.r02.q1` | `assets/audio/voice/g2/turkce/u01/n01/r02/q1.wav` | ANLATICI | Mert parkta ne buldu? |
| 14 | `vo.g2.turkce.u01.n01.r02.q2` | `assets/audio/voice/g2/turkce/u01/n01/r02/q2.wav` | ANLATICI | Mert cüzdanı bulmadan önce ne yapıyordu? |
| 15 | `vo.g2.turkce.u01.n01.r02.q3` | `assets/audio/voice/g2/turkce/u01/n01/r02/q3.wav` | ANLATICI | Mert nasıl bir çocuktur? |
| 16 | `vo.g2.turkce.u01.n01.r03` | `assets/audio/voice/g2/turkce/u01/n01/r03.wav` | ANLATICI | Hangisi Ece'nin, hangisi Mert'in hikâyesindeydi? Her kartı doğru kutuya taşı. |
| 17 | `vo.g2.turkce.u01.n02.intro` | `assets/audio/voice/g2/turkce/u01/n02/intro.wav` | BILGE | Her yerde aynı sesle konuşmayız. Duruma uygun olanı birlikte seçelim! |
| 18 | `vo.g2.turkce.u01.n02.r01` | `assets/audio/voice/g2/turkce/u01/n02/r01.wav` | ANLATICI | Ayşe kütüphanede arkadaşına bir soru soracak. Nasıl konuşmalı? |
| 19 | `vo.g2.turkce.u01.n02.r01.hint` | `assets/audio/voice/g2/turkce/u01/n02/r01/hint.wav` | BILGE | Kütüphanede herkes kitap okur. Sesimiz onları rahatsız etmemeli. |
| 20 | `vo.g2.turkce.u01.n02.r01.c2` | `assets/audio/voice/g2/turkce/u01/n02/r01/c2.wav` | ANLATICI | Herkes irkildi. Kütüphanede alçak sesle konuşuruz. |
| 21 | `vo.g2.turkce.u01.n02.r01.c3` | `assets/audio/voice/g2/turkce/u01/n02/r01/c3.wav` | ANLATICI | Okuyanların dikkati dağıldı. Kütüphane şarkı yeri değil. |
| 22 | `vo.g2.turkce.u01.n02.r02` | `assets/audio/voice/g2/turkce/u01/n02/r02.wav` | ANLATICI | Okul müdürü sana kitap hediye etti. Ona ne söylersin? |
| 23 | `vo.g2.turkce.u01.n02.r02.hint` | `assets/audio/voice/g2/turkce/u01/n02/r02/hint.wav` | BILGE | Büyüklerimize saygılı ve kibar sözlerle teşekkür ederiz. |
| 24 | `vo.g2.turkce.u01.n02.r02.c2` | `assets/audio/voice/g2/turkce/u01/n02/r02/c2.wav` | ANLATICI | Bu söz arkadaşlar arasında kullanılır. Büyüklerimize daha kibar konuşuruz. |
| 25 | `vo.g2.turkce.u01.n02.r02.c3` | `assets/audio/voice/g2/turkce/u01/n02/r02/c3.wav` | ANLATICI | Müdür ne demek istediğini anlamadı. Açık ve kibar konuşalım. |
| 26 | `vo.g2.turkce.u01.n02.r03` | `assets/audio/voice/g2/turkce/u01/n02/r03.wav` | ANLATICI | Yarın okul gezisi var. Havanın nasıl olacağını öğrenmek istiyorsun. Ne dinlersin? |
| 27 | `vo.g2.turkce.u01.n02.r03.hint` | `assets/audio/voice/g2/turkce/u01/n02/r03/hint.wav` | BILGE | Havanın nasıl olacağını kim söyler? Bir düşün. |
| 28 | `vo.g2.turkce.u01.n02.r03.c2` | `assets/audio/voice/g2/turkce/u01/n02/r03/c2.wav` | ANLATICI | Ninni insanı uyutur ama havayı söylemez. |
| 29 | `vo.g2.turkce.u01.n02.r03.c3` | `assets/audio/voice/g2/turkce/u01/n02/r03/c3.wav` | ANLATICI | Masal çok güzel ama yarının havasını anlatmaz. |
| 30 | `vo.g2.turkce.u01.n02.r04` | `assets/audio/voice/g2/turkce/u01/n02/r04.wav` | ANLATICI | Küçük kardeşin uyumak istiyor. Ona ne dinletirsin? |
| 31 | `vo.g2.turkce.u01.n02.r04.c2` | `assets/audio/voice/g2/turkce/u01/n02/r04/c2.wav` | ANLATICI | Davul çok gürültülü. Kardeşin uyuyamadı. |
| 32 | `vo.g2.turkce.u01.n02.r04.c3` | `assets/audio/voice/g2/turkce/u01/n02/r04/c3.wav` | ANLATICI | Haberler bilgi verir ama uyutmaz. |
| 33 | `vo.g2.turkce.u01.n03.intro` | `assets/audio/voice/g2/turkce/u01/n03/intro.wav` | BILGE | Şimdi okuma zamanı! Metni önce sessizce oku. Takılırsan hoparlöre dokunabilirsin. |
| 34 | `vo.g2.turkce.u01.n03.r01` | `assets/audio/voice/g2/turkce/u01/n03/r01.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 35 | `vo.g2.turkce.u01.n03.r01.p1` | `assets/audio/voice/g2/turkce/u01/n03/r01/p1.wav` | ANLATICI | Dedem bahçeye bir fidan dikti. Ben de ona su taşıdım. |
| 36 | `vo.g2.turkce.u01.n03.r01.p2` | `assets/audio/voice/g2/turkce/u01/n03/r01/p2.wav` | ANLATICI | Dedem, "Bu ağaç büyüyünce gölgesinde herkes dinlenecek." dedi. |
| 37 | `vo.g2.turkce.u01.n03.r01.q1` | `assets/audio/voice/g2/turkce/u01/n03/r01/q1.wav` | ANLATICI | Bu metnin başlığı hangisi olabilir? |
| 38 | `vo.g2.turkce.u01.n03.r01.q2` | `assets/audio/voice/g2/turkce/u01/n03/r01/q2.wav` | ANLATICI | Ağaç büyüyünce ne olacak? |
| 39 | `vo.g2.turkce.u01.n03.r02` | `assets/audio/voice/g2/turkce/u01/n03/r02.wav` | ANLATICI | Zıt anlamlı sözcükleri eşleştir. |
| 40 | `vo.g2.turkce.u01.n03.r03` | `assets/audio/voice/g2/turkce/u01/n03/r03.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 41 | `vo.g2.turkce.u01.n03.r03.p1` | `assets/audio/voice/g2/turkce/u01/n03/r03/p1.wav` | ANLATICI | Komşumuz Fatma Teyze yaşlıdır. Merdivenleri çıkarken zorlanır. |
| 42 | `vo.g2.turkce.u01.n03.r03.p2` | `assets/audio/voice/g2/turkce/u01/n03/r03/p2.wav` | ANLATICI | Annemle ben her cuma onun pazar çantasını taşırız. Teyze bize gülümser. |
| 43 | `vo.g2.turkce.u01.n03.r03.q1` | `assets/audio/voice/g2/turkce/u01/n03/r03/q1.wav` | ANLATICI | Metnin konusu nedir? |
| 44 | `vo.g2.turkce.u01.n03.r03.q2` | `assets/audio/voice/g2/turkce/u01/n03/r03/q2.wav` | ANLATICI | Fatma Teyze neden zorlanır? |
| 45 | `vo.g2.turkce.u01.n03.r04` | `assets/audio/voice/g2/turkce/u01/n03/r04.wav` | ANLATICI | Bu cümleler doğru mu, yanlış mı? Bildiklerini düşün ve kartları kutulara taşı. |
| 46 | `vo.g2.turkce.u01.n04.intro` | `assets/audio/voice/g2/turkce/u01/n04/intro.wav` | BILGE | Olaylar bir sırayla olur. Önce ne oldu, sonra ne oldu? Haydi sıralayalım! |
| 47 | `vo.g2.turkce.u01.n04.r01` | `assets/audio/voice/g2/turkce/u01/n04/r01.wav` | ANLATICI | Ağaç nasıl büyür? Kartları olayların sırasına göre diz. |
| 48 | `vo.g2.turkce.u01.n04.r02` | `assets/audio/voice/g2/turkce/u01/n04/r02.wav` | ANLATICI | Elif sabah okula hazırlanıyor. Kartları olayların sırasına göre diz. |
| 49 | `vo.g2.turkce.u01.n04.r03` | `assets/audio/voice/g2/turkce/u01/n04/r03.wav` | ANLATICI | Arkadaşımıza hediye hazırladık. Önce ne yaptık? Kartları sırala. |
| 50 | `vo.g2.turkce.u01.n05.intro` | `assets/audio/voice/g2/turkce/u01/n05/intro.wav` | BILGE | Yazarken bazı kurallara uyarız. Soru ekini, kısaltmaları ve büyük harfleri öğrenelim! |
| 51 | `vo.g2.turkce.u01.n05.r01` | `assets/audio/voice/g2/turkce/u01/n05/r01.wav` | ANLATICI | Soru eki ayrı yazılır. Her cümleye uyan soru ekini bul ve yanına taşı. |
| 52 | `vo.g2.turkce.u01.n05.r02` | `assets/audio/voice/g2/turkce/u01/n05/r02.wav` | ANLATICI | Kısaltmaları açık yazılışlarıyla eşleştir. |
| 53 | `vo.g2.turkce.u01.n05.r03` | `assets/audio/voice/g2/turkce/u01/n05/r03.wav` | ANLATICI | Bu sözcükler büyük harfle başlar. Her sözcüğü türüyle eşleştir. |
| 54 | `vo.g2.turkce.u02.n01.intro` | `assets/audio/voice/g2/turkce/u02/n01/intro.wav` | BILGE | Merhaba! Bugün Atatürk'ün çocukluğunu ve çocuk bayramını dinleyeceğiz. Hazır mısın? |
| 55 | `vo.g2.turkce.u02.n01.r01` | `assets/audio/voice/g2/turkce/u02/n01/r01.wav` | ANLATICI | Mustafa'nın hikâyesini dinle. Sonra soruları cevapla. |
| 56 | `vo.g2.turkce.u02.n01.r01.p1` | `assets/audio/voice/g2/turkce/u02/n01/r01/p1.wav` | ANLATICI | Mustafa 1881'de Selanik'te doğdu. Annesinin adı Zübeyde Hanım'dı. |
| 57 | `vo.g2.turkce.u02.n01.r01.p2` | `assets/audio/voice/g2/turkce/u02/n01/r01/p2.wav` | ANLATICI | Mustafa okulda çok çalışkandı. Matematik dersinde çok başarılıydı. |
| 58 | `vo.g2.turkce.u02.n01.r01.p3` | `assets/audio/voice/g2/turkce/u02/n01/r01/p3.wav` | ANLATICI | Matematik öğretmeni ona "Kemal" adını verdi. Böylece adı Mustafa Kemal oldu. |
| 59 | `vo.g2.turkce.u02.n01.r01.q1` | `assets/audio/voice/g2/turkce/u02/n01/r01/q1.wav` | ANLATICI | Mustafa nerede doğdu? |
| 60 | `vo.g2.turkce.u02.n01.r01.q2` | `assets/audio/voice/g2/turkce/u02/n01/r01/q2.wav` | ANLATICI | Mustafa'ya "Kemal" adını kim verdi? |
| 61 | `vo.g2.turkce.u02.n01.r01.q3` | `assets/audio/voice/g2/turkce/u02/n01/r01/q3.wav` | ANLATICI | Mustafa nasıl bir öğrenciydi? |
| 62 | `vo.g2.turkce.u02.n01.r02` | `assets/audio/voice/g2/turkce/u02/n01/r02.wav` | ANLATICI | Zeynep'in bayram hikâyesini dinle. Sonra soruları cevapla. |
| 63 | `vo.g2.turkce.u02.n01.r02.p1` | `assets/audio/voice/g2/turkce/u02/n01/r02/p1.wav` | ANLATICI | Bugün 23 Nisan. Zeynep bayramlık elbisesini giydi. Eline küçük bir bayrak aldı. |
| 64 | `vo.g2.turkce.u02.n01.r02.p2` | `assets/audio/voice/g2/turkce/u02/n01/r02/p2.wav` | ANLATICI | Okul bahçesinde şiirler okundu, halk oyunları oynandı. Herkes çok neşeliydi. |
| 65 | `vo.g2.turkce.u02.n01.r02.p3` | `assets/audio/voice/g2/turkce/u02/n01/r02/p3.wav` | ANLATICI | Öğretmen, "Atatürk bu bayramı çocuklara armağan etti." dedi. |
| 66 | `vo.g2.turkce.u02.n01.r02.q1` | `assets/audio/voice/g2/turkce/u02/n01/r02/q1.wav` | ANLATICI | Zeynep eline ne aldı? |
| 67 | `vo.g2.turkce.u02.n01.r02.q2` | `assets/audio/voice/g2/turkce/u02/n01/r02/q2.wav` | ANLATICI | Atatürk bu bayramı kime armağan etti? |
| 68 | `vo.g2.turkce.u02.n01.r02.q3` | `assets/audio/voice/g2/turkce/u02/n01/r02/q3.wav` | ANLATICI | Zeynep okula gitmeden önce ne yaptı? |
| 69 | `vo.g2.turkce.u02.n01.r03` | `assets/audio/voice/g2/turkce/u02/n01/r03.wav` | ANLATICI | Hangisi Mustafa'nın, hangisi Zeynep'in hikâyesindeydi? Her kartı doğru kutuya taşı. |
| 70 | `vo.g2.turkce.u02.n02.intro` | `assets/audio/voice/g2/turkce/u02/n02/intro.wav` | BILGE | Bayramda, törende ve müzede nasıl konuşur, nasıl dinleriz? Birlikte seçelim! |
| 71 | `vo.g2.turkce.u02.n02.r01` | `assets/audio/voice/g2/turkce/u02/n02/r01.wav` | ANLATICI | 23 Nisan töreninde şiir okuyacaksın. Nasıl okumalısın? |
| 72 | `vo.g2.turkce.u02.n02.r01.hint` | `assets/audio/voice/g2/turkce/u02/n02/r01/hint.wav` | BILGE | Herkes seni duymalı. Sözcükleri açık açık söyle. |
| 73 | `vo.g2.turkce.u02.n02.r01.c2` | `assets/audio/voice/g2/turkce/u02/n02/r01/c2.wav` | ANLATICI | Arkadaşların seni duyamadı. Şiiri net ve gür bir sesle okuruz. |
| 74 | `vo.g2.turkce.u02.n02.r01.c3` | `assets/audio/voice/g2/turkce/u02/n02/r01/c3.wav` | ANLATICI | Sözcükler birbirine karıştı. Şiiri acele etmeden okuruz. |
| 75 | `vo.g2.turkce.u02.n02.r02` | `assets/audio/voice/g2/turkce/u02/n02/r02.wav` | ANLATICI | Törende İstiklâl Marşı okunuyor. Ne yapmalısın? |
| 76 | `vo.g2.turkce.u02.n02.r02.hint` | `assets/audio/voice/g2/turkce/u02/n02/r02/hint.wav` | BILGE | İstiklâl Marşı'nı saygıyla dinleriz. |
| 77 | `vo.g2.turkce.u02.n02.r02.c2` | `assets/audio/voice/g2/turkce/u02/n02/r02/c2.wav` | ANLATICI | Marşı iyi duyamadınız. Marş okunurken konuşmayız. |
| 78 | `vo.g2.turkce.u02.n02.r02.c3` | `assets/audio/voice/g2/turkce/u02/n02/r02/c3.wav` | ANLATICI | İstiklâl Marşı okunurken ayakta, saygıyla dururuz. |
| 79 | `vo.g2.turkce.u02.n02.r03` | `assets/audio/voice/g2/turkce/u02/n02/r03.wav` | ANLATICI | Atatürk'ün çocukluğunu öğrenmek istiyorsun. Ne dinlersin? |
| 80 | `vo.g2.turkce.u02.n02.r03.hint` | `assets/audio/voice/g2/turkce/u02/n02/r03/hint.wav` | BILGE | Hangisi Atatürk'ün hayatını anlatır? Bir düşün. |
| 81 | `vo.g2.turkce.u02.n02.r03.c2` | `assets/audio/voice/g2/turkce/u02/n02/r03/c2.wav` | ANLATICI | Maç haberi sporu anlatır. Atatürk'ü anlatmaz. |
| 82 | `vo.g2.turkce.u02.n02.r03.c3` | `assets/audio/voice/g2/turkce/u02/n02/r03/c3.wav` | ANLATICI | Ninni insanı uyutur ama Atatürk'ü anlatmaz. |
| 83 | `vo.g2.turkce.u02.n02.r04` | `assets/audio/voice/g2/turkce/u02/n02/r04.wav` | ANLATICI | Müzede rehber Atatürk'ü anlatıyor. Ona bir soru sormak istiyorsun. Ne yaparsın? |
| 84 | `vo.g2.turkce.u02.n02.r04.hint` | `assets/audio/voice/g2/turkce/u02/n02/r04/hint.wav` | BILGE | Konuşan birinin sözünü kesmeyiz. Sıramızı bekleriz. |
| 85 | `vo.g2.turkce.u02.n02.r04.c2` | `assets/audio/voice/g2/turkce/u02/n02/r04/c2.wav` | ANLATICI | Rehberin sözü yarım kaldı. Elimizi kaldırıp sıramızı bekleriz. |
| 86 | `vo.g2.turkce.u02.n02.r04.c3` | `assets/audio/voice/g2/turkce/u02/n02/r04/c3.wav` | ANLATICI | Herkes irkildi. Müzede sakin bir sesle konuşuruz. |
| 87 | `vo.g2.turkce.u02.n03.intro` | `assets/audio/voice/g2/turkce/u02/n03/intro.wav` | BILGE | Atatürk ağaçları ve kitapları çok severdi. Şimdi bununla ilgili metinleri sessizce okuyalım. |
| 88 | `vo.g2.turkce.u02.n03.r01` | `assets/audio/voice/g2/turkce/u02/n03/r01.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 89 | `vo.g2.turkce.u02.n03.r01.p1` | `assets/audio/voice/g2/turkce/u02/n03/r01/p1.wav` | ANLATICI | Öğretmenimiz, Atatürk'ün ağaçları çok sevdiğini anlattı. |
| 90 | `vo.g2.turkce.u02.n03.r01.p2` | `assets/audio/voice/g2/turkce/u02/n03/r01/p2.wav` | ANLATICI | Biz de okul bahçesine fidan diktik. Her gün sırayla onları sulayacağız. |
| 91 | `vo.g2.turkce.u02.n03.r01.q1` | `assets/audio/voice/g2/turkce/u02/n03/r01/q1.wav` | ANLATICI | Bu metnin başlığı hangisi olabilir? |
| 92 | `vo.g2.turkce.u02.n03.r01.q2` | `assets/audio/voice/g2/turkce/u02/n03/r01/q2.wav` | ANLATICI | Çocuklar fidanlar için ne yapacak? |
| 93 | `vo.g2.turkce.u02.n03.r02` | `assets/audio/voice/g2/turkce/u02/n03/r02.wav` | ANLATICI | Zıt anlamlı sözcükleri eşleştir. |
| 94 | `vo.g2.turkce.u02.n03.r03` | `assets/audio/voice/g2/turkce/u02/n03/r03.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 95 | `vo.g2.turkce.u02.n03.r03.p1` | `assets/audio/voice/g2/turkce/u02/n03/r03/p1.wav` | ANLATICI | Kerem kütüphanede Atatürk'ün hayatını anlatan bir kitap buldu. |
| 96 | `vo.g2.turkce.u02.n03.r03.p2` | `assets/audio/voice/g2/turkce/u02/n03/r03/p2.wav` | ANLATICI | Kitaptan Atatürk'ün okumayı çok sevdiğini öğrendi. Kerem de her gün okumaya karar verdi. |
| 97 | `vo.g2.turkce.u02.n03.r03.q1` | `assets/audio/voice/g2/turkce/u02/n03/r03/q1.wav` | ANLATICI | Metnin konusu nedir? |
| 98 | `vo.g2.turkce.u02.n03.r03.q2` | `assets/audio/voice/g2/turkce/u02/n03/r03/q2.wav` | ANLATICI | Kerem neye karar verdi? |
| 99 | `vo.g2.turkce.u02.n03.r04` | `assets/audio/voice/g2/turkce/u02/n03/r04.wav` | ANLATICI | Bu cümleler doğru mu, yanlış mı? Bildiklerini düşün ve kartları kutulara taşı. |
| 100 | `vo.g2.turkce.u02.n04.intro` | `assets/audio/voice/g2/turkce/u02/n04/intro.wav` | BILGE | Bayrama nasıl hazırlanırız? Önce ne olur, sonra ne olur? Haydi sıralayalım! |
| 101 | `vo.g2.turkce.u02.n04.r01` | `assets/audio/voice/g2/turkce/u02/n04/r01.wav` | ANLATICI | Okul bahçesine fidan diktik. Kartları olayların sırasına göre diz. |
| 102 | `vo.g2.turkce.u02.n04.r02` | `assets/audio/voice/g2/turkce/u02/n04/r02.wav` | ANLATICI | Zeynep 23 Nisan'a hazırlanıyor. Kartları olayların sırasına göre diz. |
| 103 | `vo.g2.turkce.u02.n04.r03` | `assets/audio/voice/g2/turkce/u02/n04/r03.wav` | ANLATICI | Sınıfımızı bayram için süsledik. Önce ne yaptık? Kartları sırala. |
| 104 | `vo.g2.turkce.u02.n05.intro` | `assets/audio/voice/g2/turkce/u02/n05/intro.wav` | BILGE | Yazarken bazı kurallara uyarız. Soru ekini, kısaltmaları ve büyük harfleri hatırlayalım! |
| 105 | `vo.g2.turkce.u02.n05.r01` | `assets/audio/voice/g2/turkce/u02/n05/r01.wav` | ANLATICI | Soru eki ayrı yazılır. Sözcüğün son ünlüsüne bak. Her cümleye uyan soru ekini bul. |
| 106 | `vo.g2.turkce.u02.n05.r02` | `assets/audio/voice/g2/turkce/u02/n05/r02.wav` | ANLATICI | Kısaltmaları açık yazılışlarıyla eşleştir. |
| 107 | `vo.g2.turkce.u02.n05.r03` | `assets/audio/voice/g2/turkce/u02/n05/r03.wav` | ANLATICI | Bu sözcükler büyük harfle başlar. Her sözcüğü türüyle eşleştir. |
| 108 | `vo.g2.turkce.u03.n01.intro` | `assets/audio/voice/g2/turkce/u03/n01/intro.wav` | BILGE | Merhaba! Doğada her gün yeni şeyler olur. Bir sincabın ve bir su damlasının hikâyesini dinleyelim. |
| 109 | `vo.g2.turkce.u03.n01.r01` | `assets/audio/voice/g2/turkce/u03/n01/r01.wav` | ANLATICI | Sincap Pıtır'ın hikâyesini dinle. Sonra soruları cevapla. |
| 110 | `vo.g2.turkce.u03.n01.r01.p1` | `assets/audio/voice/g2/turkce/u03/n01/r01/p1.wav` | ANLATICI | Sonbahar geldi, yapraklar sarardı. Sincap Pıtır ağaçtan fındık topladı. |
| 111 | `vo.g2.turkce.u03.n01.r01.p2` | `assets/audio/voice/g2/turkce/u03/n01/r01/p2.wav` | ANLATICI | Pıtır, fındıkları ağacın kovuğuna sakladı. Kovuk fındıkla doldu. |
| 112 | `vo.g2.turkce.u03.n01.r01.p3` | `assets/audio/voice/g2/turkce/u03/n01/r01/p3.wav` | ANLATICI | Kış gelince her yere kar yağdı. Pıtır, yuvasında fındıklarını yedi. |
| 113 | `vo.g2.turkce.u03.n01.r01.q1` | `assets/audio/voice/g2/turkce/u03/n01/r01/q1.wav` | ANLATICI | Pıtır ağaçtan ne topladı? |
| 114 | `vo.g2.turkce.u03.n01.r01.q2` | `assets/audio/voice/g2/turkce/u03/n01/r01/q2.wav` | ANLATICI | Pıtır fındıkları nereye sakladı? |
| 115 | `vo.g2.turkce.u03.n01.r01.q3` | `assets/audio/voice/g2/turkce/u03/n01/r01/q3.wav` | ANLATICI | Pıtır neden fındık topladı? |
| 116 | `vo.g2.turkce.u03.n01.r02` | `assets/audio/voice/g2/turkce/u03/n01/r02.wav` | ANLATICI | Su damlası Damla'nın hikâyesini dinle. Sonra soruları cevapla. |
| 117 | `vo.g2.turkce.u03.n01.r02.p1` | `assets/audio/voice/g2/turkce/u03/n01/r02/p1.wav` | ANLATICI | Damla, göldeki küçük bir su damlasıydı. Güneş onu ısıttı, Damla buhar oldu. |
| 118 | `vo.g2.turkce.u03.n01.r02.p2` | `assets/audio/voice/g2/turkce/u03/n01/r02/p2.wav` | ANLATICI | Buhar göğe yükseldi ve soğudu. Damla, arkadaşlarıyla birleşip bulut oldu. |
| 119 | `vo.g2.turkce.u03.n01.r02.p3` | `assets/audio/voice/g2/turkce/u03/n01/r02/p3.wav` | ANLATICI | Bulut ağırlaştı. Damla yağmur olup yeniden göle düştü. |
| 120 | `vo.g2.turkce.u03.n01.r02.q1` | `assets/audio/voice/g2/turkce/u03/n01/r02/q1.wav` | ANLATICI | Damla'yı ne ısıttı? |
| 121 | `vo.g2.turkce.u03.n01.r02.q2` | `assets/audio/voice/g2/turkce/u03/n01/r02/q2.wav` | ANLATICI | Buhar soğuyunca ne oldu? |
| 122 | `vo.g2.turkce.u03.n01.r02.q3` | `assets/audio/voice/g2/turkce/u03/n01/r02/q3.wav` | ANLATICI | Bu hikâyenin konusu nedir? |
| 123 | `vo.g2.turkce.u03.n01.r03` | `assets/audio/voice/g2/turkce/u03/n01/r03.wav` | ANLATICI | Hangisi Pıtır'ın, hangisi Damla'nın hikâyesindeydi? Her kartı doğru kutuya taşı. |
| 124 | `vo.g2.turkce.u03.n02.intro` | `assets/audio/voice/g2/turkce/u03/n02/intro.wav` | BILGE | Doğada, sınıfta ve parkta nasıl konuşur, ne dinleriz? Birlikte seçelim! |
| 125 | `vo.g2.turkce.u03.n02.r01` | `assets/audio/voice/g2/turkce/u03/n02/r01.wav` | ANLATICI | Ormanda kuşların sesini dinlemek istiyorsun. Ne yaparsın? |
| 126 | `vo.g2.turkce.u03.n02.r01.hint` | `assets/audio/voice/g2/turkce/u03/n02/r01/hint.wav` | BILGE | Kuşları duymak için çevremiz sakin olmalı. |
| 127 | `vo.g2.turkce.u03.n02.r01.c2` | `assets/audio/voice/g2/turkce/u03/n02/r01/c2.wav` | ANLATICI | Kuşlar korkup uçtu. Doğayı dinlerken sessiz oluruz. |
| 128 | `vo.g2.turkce.u03.n02.r01.c3` | `assets/audio/voice/g2/turkce/u03/n02/r01/c3.wav` | ANLATICI | Müzik sesi kuşların sesini bastırdı. Kuşları duyamadın. |
| 129 | `vo.g2.turkce.u03.n02.r02` | `assets/audio/voice/g2/turkce/u03/n02/r02.wav` | ANLATICI | Sınıfta arkadaşlarına mevsimleri anlatacaksın. Nasıl konuşmalısın? |
| 130 | `vo.g2.turkce.u03.n02.r02.hint` | `assets/audio/voice/g2/turkce/u03/n02/r02/hint.wav` | BILGE | Herkes seni anlamalı. Acele etme. |
| 131 | `vo.g2.turkce.u03.n02.r02.c2` | `assets/audio/voice/g2/turkce/u03/n02/r02/c2.wav` | ANLATICI | Arkadaşların seni duyamadı. Sınıfta herkesin duyacağı sesle konuşuruz. |
| 132 | `vo.g2.turkce.u03.n02.r02.c3` | `assets/audio/voice/g2/turkce/u03/n02/r02/c3.wav` | ANLATICI | Arkadaşların anlamakta zorlandı. Acele etmeden konuşuruz. |
| 133 | `vo.g2.turkce.u03.n02.r03` | `assets/audio/voice/g2/turkce/u03/n02/r03.wav` | ANLATICI | Hayvanların kışı nasıl geçirdiğini öğrenmek istiyorsun. Ne dinlersin? |
| 134 | `vo.g2.turkce.u03.n02.r03.hint` | `assets/audio/voice/g2/turkce/u03/n02/r03/hint.wav` | BILGE | Hangisi hayvanlar hakkında bilgi verir? Bir düşün. |
| 135 | `vo.g2.turkce.u03.n02.r03.c2` | `assets/audio/voice/g2/turkce/u03/n02/r03/c2.wav` | ANLATICI | Ninni insanı uyutur ama hayvanları anlatmaz. |
| 136 | `vo.g2.turkce.u03.n02.r03.c3` | `assets/audio/voice/g2/turkce/u03/n02/r03/c3.wav` | ANLATICI | Maç anlatımı futbolu anlatır, hayvanları anlatmaz. |
| 137 | `vo.g2.turkce.u03.n02.r04` | `assets/audio/voice/g2/turkce/u03/n02/r04.wav` | ANLATICI | Parkta bir çocuk çiçekleri koparıyor. Ona ne söylersin? |
| 138 | `vo.g2.turkce.u03.n02.r04.hint` | `assets/audio/voice/g2/turkce/u03/n02/r04/hint.wav` | BILGE | Kibar sözlerle uyarırsak bizi daha iyi dinler. |
| 139 | `vo.g2.turkce.u03.n02.r04.c2` | `assets/audio/voice/g2/turkce/u03/n02/r04/c2.wav` | ANLATICI | Bağırınca çocuk üzüldü. Kibar sözlerle uyarırız. |
| 140 | `vo.g2.turkce.u03.n02.r04.c3` | `assets/audio/voice/g2/turkce/u03/n02/r04/c3.wav` | ANLATICI | Çiçekler koparılmaya devam etti. Kibarca uyarabiliriz. |
| 141 | `vo.g2.turkce.u03.n03.intro` | `assets/audio/voice/g2/turkce/u03/n03/intro.wav` | BILGE | Şimdi doğa ile ilgili metinleri sessizce oku. Takılırsan hoparlöre dokunabilirsin. |
| 142 | `vo.g2.turkce.u03.n03.r01` | `assets/audio/voice/g2/turkce/u03/n03/r01.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 143 | `vo.g2.turkce.u03.n03.r01.p1` | `assets/audio/voice/g2/turkce/u03/n03/r01/p1.wav` | ANLATICI | Sonbaharda hava soğudu. Kırlangıçlar sıcak yerlere doğru uçtu. |
| 144 | `vo.g2.turkce.u03.n03.r01.p2` | `assets/audio/voice/g2/turkce/u03/n03/r01/p2.wav` | ANLATICI | İlkbahar gelince kırlangıçlar geri döndü. Yeniden yuvalarına yerleştiler. |
| 145 | `vo.g2.turkce.u03.n03.r01.q1` | `assets/audio/voice/g2/turkce/u03/n03/r01/q1.wav` | ANLATICI | Bu metnin başlığı hangisi olabilir? |
| 146 | `vo.g2.turkce.u03.n03.r01.q2` | `assets/audio/voice/g2/turkce/u03/n03/r01/q2.wav` | ANLATICI | Kırlangıçlar neden uçup gitti? |
| 147 | `vo.g2.turkce.u03.n03.r02` | `assets/audio/voice/g2/turkce/u03/n03/r02.wav` | ANLATICI | Zıt anlamlı sözcükleri eşleştir. |
| 148 | `vo.g2.turkce.u03.n03.r03` | `assets/audio/voice/g2/turkce/u03/n03/r03.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 149 | `vo.g2.turkce.u03.n03.r03.p1` | `assets/audio/voice/g2/turkce/u03/n03/r03/p1.wav` | ANLATICI | Bahçemizdeki elma ağacı ilkbaharda çiçek açar. Yazın dalları elmayla dolar. |
| 150 | `vo.g2.turkce.u03.n03.r03.p2` | `assets/audio/voice/g2/turkce/u03/n03/r03/p2.wav` | ANLATICI | Sonbaharda yaprakları sararır ve düşer. Kışın dalları karla örtülür. |
| 151 | `vo.g2.turkce.u03.n03.r03.q1` | `assets/audio/voice/g2/turkce/u03/n03/r03/q1.wav` | ANLATICI | Metnin konusu nedir? |
| 152 | `vo.g2.turkce.u03.n03.r03.q2` | `assets/audio/voice/g2/turkce/u03/n03/r03/q2.wav` | ANLATICI | Elma ağacı ne zaman çiçek açar? |
| 153 | `vo.g2.turkce.u03.n03.r04` | `assets/audio/voice/g2/turkce/u03/n03/r04.wav` | ANLATICI | Bu cümleler doğru mu, yanlış mı? Bildiklerini düşün ve kartları kutulara taşı. |
| 154 | `vo.g2.turkce.u03.n04.intro` | `assets/audio/voice/g2/turkce/u03/n04/intro.wav` | BILGE | Doğada her şey bir sırayla olur. Önce ne oldu, sonra ne oldu? Haydi sıralayalım! |
| 155 | `vo.g2.turkce.u03.n04.r01` | `assets/audio/voice/g2/turkce/u03/n04/r01.wav` | ANLATICI | Kelebek nasıl oluşur? Kartları doğru sıraya diz. |
| 156 | `vo.g2.turkce.u03.n04.r02` | `assets/audio/voice/g2/turkce/u03/n04/r02.wav` | ANLATICI | Damla'nın yolculuğunu hatırla. Kartları olayların sırasına göre diz. |
| 157 | `vo.g2.turkce.u03.n04.r03` | `assets/audio/voice/g2/turkce/u03/n04/r03.wav` | ANLATICI | İlkbahardan başla. Mevsimleri sırasıyla diz. |
| 158 | `vo.g2.turkce.u03.n05.intro` | `assets/audio/voice/g2/turkce/u03/n05/intro.wav` | BILGE | Yazarken bazı kurallara uyarız. Soru ekini, kısaltmaları ve büyük harfleri hatırlayalım! |
| 159 | `vo.g2.turkce.u03.n05.r01` | `assets/audio/voice/g2/turkce/u03/n05/r01.wav` | ANLATICI | Soru eki ayrı yazılır. Sözcüğün son ünlüsüne bak. Her cümleye uyan soru ekini bul. |
| 160 | `vo.g2.turkce.u03.n05.r02` | `assets/audio/voice/g2/turkce/u03/n05/r02.wav` | ANLATICI | Kısaltmaları açık yazılışlarıyla eşleştir. |
| 161 | `vo.g2.turkce.u03.n05.r03` | `assets/audio/voice/g2/turkce/u03/n05/r03.wav` | ANLATICI | Bu sözcükler büyük harfle başlar. Her sözcüğü türüyle eşleştir. |
| 162 | `vo.g2.turkce.u04.n01.intro` | `assets/audio/voice/g2/turkce/u04/n01/intro.wav` | BILGE | Merhaba! Kitaplar bizi yeni yerlere götürür. Bir kütüphane hikâyesi ve bir masal dinleyelim. |
| 163 | `vo.g2.turkce.u04.n01.r01` | `assets/audio/voice/g2/turkce/u04/n01/r01.wav` | ANLATICI | Deniz'in hikâyesini dinle. Sonra soruları cevapla. |
| 164 | `vo.g2.turkce.u04.n01.r01.p1` | `assets/audio/voice/g2/turkce/u04/n01/r01/p1.wav` | ANLATICI | Deniz ilk kez kütüphaneye gitti. Raflarda yüzlerce kitap vardı. |
| 165 | `vo.g2.turkce.u04.n01.r01.p2` | `assets/audio/voice/g2/turkce/u04/n01/r01/p2.wav` | ANLATICI | Kütüphane görevlisi ona hayvanları anlatan bir kitap verdi. |
| 166 | `vo.g2.turkce.u04.n01.r01.p3` | `assets/audio/voice/g2/turkce/u04/n01/r01/p3.wav` | ANLATICI | Deniz kitabı eve götürdü. İki hafta sonra kitabı geri getirecekti. |
| 167 | `vo.g2.turkce.u04.n01.r01.q1` | `assets/audio/voice/g2/turkce/u04/n01/r01/q1.wav` | ANLATICI | Deniz nereye gitti? |
| 168 | `vo.g2.turkce.u04.n01.r01.q2` | `assets/audio/voice/g2/turkce/u04/n01/r01/q2.wav` | ANLATICI | Görevli Deniz'e ne verdi? |
| 169 | `vo.g2.turkce.u04.n01.r01.q3` | `assets/audio/voice/g2/turkce/u04/n01/r01/q3.wav` | ANLATICI | Deniz iki hafta sonra ne yapar? |
| 170 | `vo.g2.turkce.u04.n01.r02` | `assets/audio/voice/g2/turkce/u04/n01/r02.wav` | ANLATICI | Masalı dikkatle dinle. Sonra soruları cevapla. |
| 171 | `vo.g2.turkce.u04.n01.r02.p1` | `assets/audio/voice/g2/turkce/u04/n01/r02/p1.wav` | ANLATICI | Bir varmış, bir yokmuş. Küçük bir tavşan ormanda kaybolmuş. |
| 172 | `vo.g2.turkce.u04.n01.r02.p2` | `assets/audio/voice/g2/turkce/u04/n01/r02/p2.wav` | ANLATICI | Yaşlı baykuş ona yolu göstermiş. Tavşan evine sağ salim dönmüş. |
| 173 | `vo.g2.turkce.u04.n01.r02.p3` | `assets/audio/voice/g2/turkce/u04/n01/r02/p3.wav` | ANLATICI | Ertesi gün tavşan baykuşa bir sepet havuç götürmüş. İkisi dost olmuşlar. |
| 174 | `vo.g2.turkce.u04.n01.r02.q1` | `assets/audio/voice/g2/turkce/u04/n01/r02/q1.wav` | ANLATICI | Tavşan nerede kaybolmuş? |
| 175 | `vo.g2.turkce.u04.n01.r02.q2` | `assets/audio/voice/g2/turkce/u04/n01/r02/q2.wav` | ANLATICI | Tavşana kim yardım etmiş? |
| 176 | `vo.g2.turkce.u04.n01.r02.q3` | `assets/audio/voice/g2/turkce/u04/n01/r02/q3.wav` | ANLATICI | Tavşan baykuşa neden havuç götürmüş? |
| 177 | `vo.g2.turkce.u04.n01.r03` | `assets/audio/voice/g2/turkce/u04/n01/r03.wav` | ANLATICI | Bunlar gerçek hayatta olur mu, yoksa yalnızca masalda mı? Kartları kutulara taşı. |
| 178 | `vo.g2.turkce.u04.n02.intro` | `assets/audio/voice/g2/turkce/u04/n02/intro.wav` | BILGE | Kütüphanede ve sınıfta nasıl konuşur, ne dinleriz? Birlikte seçelim! |
| 179 | `vo.g2.turkce.u04.n02.r01` | `assets/audio/voice/g2/turkce/u04/n02/r01.wav` | ANLATICI | Kütüphane görevlisinden bir kitap isteyeceksin. Ne dersin? |
| 180 | `vo.g2.turkce.u04.n02.r01.hint` | `assets/audio/voice/g2/turkce/u04/n02/r01/hint.wav` | BILGE | Büyüklerimizden bir şey isterken kibar konuşuruz. |
| 181 | `vo.g2.turkce.u04.n02.r01.c2` | `assets/audio/voice/g2/turkce/u04/n02/r01/c2.wav` | ANLATICI | Görevli bu sözlere üzüldü. Büyüklerimizden kibarca isteriz. |
| 182 | `vo.g2.turkce.u04.n02.r01.c3` | `assets/audio/voice/g2/turkce/u04/n02/r01/c3.wav` | ANLATICI | Görevli ne istediğini anlamadı. Açık ve kibar konuşalım. |
| 183 | `vo.g2.turkce.u04.n02.r02` | `assets/audio/voice/g2/turkce/u04/n02/r02.wav` | ANLATICI | Sınıfta okuduğun bir kitabı anlatacaksın. Nasıl anlatmalısın? |
| 184 | `vo.g2.turkce.u04.n02.r02.hint` | `assets/audio/voice/g2/turkce/u04/n02/r02/hint.wav` | BILGE | Konuşurken dinleyenlere bakarız. |
| 185 | `vo.g2.turkce.u04.n02.r02.c2` | `assets/audio/voice/g2/turkce/u04/n02/r02/c2.wav` | ANLATICI | Arkadaşların seni iyi duyamadı. Konuşurken onlara bakarız. |
| 186 | `vo.g2.turkce.u04.n02.r02.c3` | `assets/audio/voice/g2/turkce/u04/n02/r02/c3.wav` | ANLATICI | Arkadaşların seni duyamadı. Herkesin duyacağı sesle anlatırız. |
| 187 | `vo.g2.turkce.u04.n02.r03` | `assets/audio/voice/g2/turkce/u04/n02/r03.wav` | ANLATICI | Keloğlan'ın maceralarını merak ediyorsun. Ne dinlersin? |
| 188 | `vo.g2.turkce.u04.n02.r03.hint` | `assets/audio/voice/g2/turkce/u04/n02/r03/hint.wav` | BILGE | Keloğlan bir masal kahramanıdır. |
| 189 | `vo.g2.turkce.u04.n02.r03.c2` | `assets/audio/voice/g2/turkce/u04/n02/r03/c2.wav` | ANLATICI | Hava durumu yarının havasını söyler, Keloğlan'ı anlatmaz. |
| 190 | `vo.g2.turkce.u04.n02.r03.c3` | `assets/audio/voice/g2/turkce/u04/n02/r03/c3.wav` | ANLATICI | Haberler bilgi verir ama Keloğlan'ı anlatmaz. |
| 191 | `vo.g2.turkce.u04.n02.r04` | `assets/audio/voice/g2/turkce/u04/n02/r04.wav` | ANLATICI | Öğretmen masal okuyor. Arkadaşın seninle konuşmak istiyor. Ne dersin? |
| 192 | `vo.g2.turkce.u04.n02.r04.hint` | `assets/audio/voice/g2/turkce/u04/n02/r04/hint.wav` | BILGE | Masalı dinlerken konuşursak en güzel yerini kaçırabiliriz. |
| 193 | `vo.g2.turkce.u04.n02.r04.c2` | `assets/audio/voice/g2/turkce/u04/n02/r04/c2.wav` | ANLATICI | Masalın güzel bir yerini kaçırdınız. Dinlerken konuşmayız. |
| 194 | `vo.g2.turkce.u04.n02.r04.c3` | `assets/audio/voice/g2/turkce/u04/n02/r04/c3.wav` | ANLATICI | Herkesin dikkati dağıldı. Masalı sessizce dinleriz. |
| 195 | `vo.g2.turkce.u04.n03.intro` | `assets/audio/voice/g2/turkce/u04/n03/intro.wav` | BILGE | Okumayı seven çocukların metinlerini sessizce oku. Takılırsan hoparlöre dokunabilirsin. |
| 196 | `vo.g2.turkce.u04.n03.r01` | `assets/audio/voice/g2/turkce/u04/n03/r01.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 197 | `vo.g2.turkce.u04.n03.r01.p1` | `assets/audio/voice/g2/turkce/u04/n03/r01/p1.wav` | ANLATICI | Ali her akşam yatmadan önce kitap okur. Okudukça yeni sözcükler öğrenir. |
| 198 | `vo.g2.turkce.u04.n03.r01.p2` | `assets/audio/voice/g2/turkce/u04/n03/r01/p2.wav` | ANLATICI | Bir gün sınıfta kitaptan öğrendiği bir bilgiyi anlattı. Herkes ilgiyle dinledi. |
| 199 | `vo.g2.turkce.u04.n03.r01.q1` | `assets/audio/voice/g2/turkce/u04/n03/r01/q1.wav` | ANLATICI | Bu metnin başlığı hangisi olabilir? |
| 200 | `vo.g2.turkce.u04.n03.r01.q2` | `assets/audio/voice/g2/turkce/u04/n03/r01/q2.wav` | ANLATICI | Ali okudukça ne öğrenir? |
| 201 | `vo.g2.turkce.u04.n03.r02` | `assets/audio/voice/g2/turkce/u04/n03/r02.wav` | ANLATICI | Zıt anlamlı sözcükleri eşleştir. |
| 202 | `vo.g2.turkce.u04.n03.r03` | `assets/audio/voice/g2/turkce/u04/n03/r03.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 203 | `vo.g2.turkce.u04.n03.r03.p1` | `assets/audio/voice/g2/turkce/u04/n03/r03/p1.wav` | ANLATICI | Selin kitabını okurken sayfaları kıvırmaz. Kaldığı yere ayraç koyar. |
| 204 | `vo.g2.turkce.u04.n03.r03.p2` | `assets/audio/voice/g2/turkce/u04/n03/r03/p2.wav` | ANLATICI | Kitabı bitirince rafına yerleştirir. Böylece kitabı hep yeni gibi kalır. |
| 205 | `vo.g2.turkce.u04.n03.r03.q1` | `assets/audio/voice/g2/turkce/u04/n03/r03/q1.wav` | ANLATICI | Metnin konusu nedir? |
| 206 | `vo.g2.turkce.u04.n03.r03.q2` | `assets/audio/voice/g2/turkce/u04/n03/r03/q2.wav` | ANLATICI | Selin kaldığı yere ne koyar? |
| 207 | `vo.g2.turkce.u04.n03.r04` | `assets/audio/voice/g2/turkce/u04/n03/r04.wav` | ANLATICI | Kitaplara nasıl davranmalıyız? Doğru ve yanlış davranışları kutulara taşı. |
| 208 | `vo.g2.turkce.u04.n04.intro` | `assets/audio/voice/g2/turkce/u04/n04/intro.wav` | BILGE | Her okuma serüveninin bir sırası vardır. Önce ne oldu, sonra ne oldu? Haydi sıralayalım! |
| 209 | `vo.g2.turkce.u04.n04.r01` | `assets/audio/voice/g2/turkce/u04/n04/r01.wav` | ANLATICI | Kütüphaneden kitap aldık. Kartları olayların sırasına göre diz. |
| 210 | `vo.g2.turkce.u04.n04.r02` | `assets/audio/voice/g2/turkce/u04/n04/r02.wav` | ANLATICI | Masaldaki tavşanın başından geçenleri hatırla. Kartları sırala. |
| 211 | `vo.g2.turkce.u04.n04.r03` | `assets/audio/voice/g2/turkce/u04/n04/r03.wav` | ANLATICI | Bir metni okuduk. Önce ne yaptık? Kartları sırala. |
| 212 | `vo.g2.turkce.u04.n05.intro` | `assets/audio/voice/g2/turkce/u04/n05/intro.wav` | BILGE | Yazarken bazı kurallara uyarız. Soru ekini, kısaltmaları ve büyük harfleri hatırlayalım! |
| 213 | `vo.g2.turkce.u04.n05.r01` | `assets/audio/voice/g2/turkce/u04/n05/r01.wav` | ANLATICI | Soru eki ayrı yazılır. Sözcüğün son ünlüsüne bak. Her cümleye uyan soru ekini bul. |
| 214 | `vo.g2.turkce.u04.n05.r02` | `assets/audio/voice/g2/turkce/u04/n05/r02.wav` | ANLATICI | Kısaltmaları açık yazılışlarıyla eşleştir. |
| 215 | `vo.g2.turkce.u04.n05.r03` | `assets/audio/voice/g2/turkce/u04/n05/r03.wav` | ANLATICI | Bu sözcükler büyük harfle başlar. Her sözcüğü türüyle eşleştir. |
| 216 | `vo.g2.turkce.u05.n01.intro` | `assets/audio/voice/g2/turkce/u05/n01/intro.wav` | BILGE | Merhaba! Her çocuğun bir yeteneği vardır. Şimdi yeteneğini keşfeden çocukları dinleyelim. |
| 217 | `vo.g2.turkce.u05.n01.r01` | `assets/audio/voice/g2/turkce/u05/n01/r01.wav` | ANLATICI | Zeynep'in hikâyesini dikkatle dinle. Sonra soruları cevapla. |
| 218 | `vo.g2.turkce.u05.n01.r01.p1` | `assets/audio/voice/g2/turkce/u05/n01/r01/p1.wav` | ANLATICI | Zeynep resim yapmayı çok sever. Her gün defterine renkli çiçekler ve kuşlar çizer. |
| 219 | `vo.g2.turkce.u05.n01.r01.p2` | `assets/audio/voice/g2/turkce/u05/n01/r01/p2.wav` | ANLATICI | Okulda bir resim sergisi açıldı. Öğretmeni, Zeynep'in kuş resmini panoya astı. |
| 220 | `vo.g2.turkce.u05.n01.r01.p3` | `assets/audio/voice/g2/turkce/u05/n01/r01/p3.wav` | ANLATICI | Annesi ve babası sergiye geldi. Zeynep resmini onlara gururla gösterdi. |
| 221 | `vo.g2.turkce.u05.n01.r01.q1` | `assets/audio/voice/g2/turkce/u05/n01/r01/q1.wav` | ANLATICI | Zeynep ne yapmayı çok sever? |
| 222 | `vo.g2.turkce.u05.n01.r01.q2` | `assets/audio/voice/g2/turkce/u05/n01/r01/q2.wav` | ANLATICI | Öğretmen hangi resmi panoya astı? |
| 223 | `vo.g2.turkce.u05.n01.r01.q3` | `assets/audio/voice/g2/turkce/u05/n01/r01/q3.wav` | ANLATICI | Bu hikâyenin konusu nedir? |
| 224 | `vo.g2.turkce.u05.n01.r02` | `assets/audio/voice/g2/turkce/u05/n01/r02.wav` | ANLATICI | Deniz'in hikâyesini dinle. Sonra soruları cevapla. |
| 225 | `vo.g2.turkce.u05.n01.r02.p1` | `assets/audio/voice/g2/turkce/u05/n01/r02/p1.wav` | ANLATICI | Deniz, okulun müzik gösterisinde flüt çalacaktı. Çok heyecanlıydı. |
| 226 | `vo.g2.turkce.u05.n01.r02.p2` | `assets/audio/voice/g2/turkce/u05/n01/r02/p2.wav` | ANLATICI | Gösteriden önce her akşam evde çalıştı. Annesi de onu sabırla dinledi. |
| 227 | `vo.g2.turkce.u05.n01.r02.p3` | `assets/audio/voice/g2/turkce/u05/n01/r02/p3.wav` | ANLATICI | Gösteri günü Deniz flütünü çok güzel çaldı. Herkes onu uzun uzun alkışladı. |
| 228 | `vo.g2.turkce.u05.n01.r02.q1` | `assets/audio/voice/g2/turkce/u05/n01/r02/q1.wav` | ANLATICI | Deniz hangi çalgıyı çaldı? |
| 229 | `vo.g2.turkce.u05.n01.r02.q2` | `assets/audio/voice/g2/turkce/u05/n01/r02/q2.wav` | ANLATICI | Deniz gösteriden önce ne yaptı? |
| 230 | `vo.g2.turkce.u05.n01.r02.q3` | `assets/audio/voice/g2/turkce/u05/n01/r02/q3.wav` | ANLATICI | Alkışları duyan Deniz nasıl hissetti? |
| 231 | `vo.g2.turkce.u05.n01.r03` | `assets/audio/voice/g2/turkce/u05/n01/r03.wav` | ANLATICI | Hangisi Zeynep'in, hangisi Deniz'in hikâyesindeydi? Her kartı doğru kutuya taşı. |
| 232 | `vo.g2.turkce.u05.n02.intro` | `assets/audio/voice/g2/turkce/u05/n02/intro.wav` | BILGE | Güzel sözler yetenekleri büyütür. Duruma uygun olanı birlikte seçelim! |
| 233 | `vo.g2.turkce.u05.n02.r01` | `assets/audio/voice/g2/turkce/u05/n02/r01.wav` | ANLATICI | Arkadaşın resim yarışmasında ödül alamadı ve üzüldü. Ona ne söylersin? |
| 234 | `vo.g2.turkce.u05.n02.r01.hint` | `assets/audio/voice/g2/turkce/u05/n02/r01/hint.wav` | BILGE | Üzgün bir arkadaşımızı güzel sözlerle sevindiririz. |
| 235 | `vo.g2.turkce.u05.n02.r01.c2` | `assets/audio/voice/g2/turkce/u05/n02/r01/c2.wav` | ANLATICI | Arkadaşın daha çok üzüldü. Üzgün birine moral veririz. |
| 236 | `vo.g2.turkce.u05.n02.r01.c3` | `assets/audio/voice/g2/turkce/u05/n02/r01/c3.wav` | ANLATICI | Arkadaşın kırıldı. Övünmek yerine onu cesaretlendirelim. |
| 237 | `vo.g2.turkce.u05.n02.r02` | `assets/audio/voice/g2/turkce/u05/n02/r02.wav` | ANLATICI | Arkadaşın satranç oynamayı biliyor. Sen de öğrenmek istiyorsun. Ona ne dersin? |
| 238 | `vo.g2.turkce.u05.n02.r02.hint` | `assets/audio/voice/g2/turkce/u05/n02/r02/hint.wav` | BILGE | Bir şey isterken kibar sözler kullanırız. |
| 239 | `vo.g2.turkce.u05.n02.r02.c2` | `assets/audio/voice/g2/turkce/u05/n02/r02/c2.wav` | ANLATICI | Emir gibi konuşunca arkadaşın kırıldı. Kibarca rica ederiz. |
| 240 | `vo.g2.turkce.u05.n02.r02.c3` | `assets/audio/voice/g2/turkce/u05/n02/r02/c3.wav` | ANLATICI | Bu söz arkadaşını üzdü. Herkesin bildiği bir şey vardır. |
| 241 | `vo.g2.turkce.u05.n02.r03` | `assets/audio/voice/g2/turkce/u05/n02/r03.wav` | ANLATICI | Beden eğitimi öğretmeni yeni bir oyunun kurallarını anlatıyor. Nasıl dinlersin? |
| 242 | `vo.g2.turkce.u05.n02.r03.hint` | `assets/audio/voice/g2/turkce/u05/n02/r03/hint.wav` | BILGE | Kuralları bilirsek oyunu doğru oynarız. |
| 243 | `vo.g2.turkce.u05.n02.r03.c2` | `assets/audio/voice/g2/turkce/u05/n02/r03/c2.wav` | ANLATICI | Kuralları kaçırdın. Öğretmen konuşurken onu dinleriz. |
| 244 | `vo.g2.turkce.u05.n02.r03.c3` | `assets/audio/voice/g2/turkce/u05/n02/r03/c3.wav` | ANLATICI | Topun sesi yüzünden kuralları duyamadın. |
| 245 | `vo.g2.turkce.u05.n02.r04` | `assets/audio/voice/g2/turkce/u05/n02/r04.wav` | ANLATICI | Yeni bir şarkı öğrenmek istiyorsun. Ne dinlersin? |
| 246 | `vo.g2.turkce.u05.n02.r04.hint` | `assets/audio/voice/g2/turkce/u05/n02/r04/hint.wav` | BILGE | Bir şarkıyı öğrenmek için onu dinlemeliyiz. |
| 247 | `vo.g2.turkce.u05.n02.r04.c2` | `assets/audio/voice/g2/turkce/u05/n02/r04/c2.wav` | ANLATICI | Hava durumu havayı anlatır, şarkı öğretmez. |
| 248 | `vo.g2.turkce.u05.n02.r04.c3` | `assets/audio/voice/g2/turkce/u05/n02/r04/c3.wav` | ANLATICI | Maç anlatımı maçı anlatır, şarkı öğretmez. |
| 249 | `vo.g2.turkce.u05.n03.intro` | `assets/audio/voice/g2/turkce/u05/n03/intro.wav` | BILGE | Şimdi okuma zamanı! Metni önce sessizce oku. Takılırsan hoparlöre dokunabilirsin. |
| 250 | `vo.g2.turkce.u05.n03.r01` | `assets/audio/voice/g2/turkce/u05/n03/r01.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 251 | `vo.g2.turkce.u05.n03.r01.p1` | `assets/audio/voice/g2/turkce/u05/n03/r01/p1.wav` | ANLATICI | Ela ip atlamayı çok sever. Her teneffüste arkadaşlarıyla bahçede ip atlar. |
| 252 | `vo.g2.turkce.u05.n03.r01.p2` | `assets/audio/voice/g2/turkce/u05/n03/r01/p2.wav` | ANLATICI | Ela önce on kez atlayabiliyordu. Her gün çalıştı. Şimdi yirmi kez atlayabiliyor. |
| 253 | `vo.g2.turkce.u05.n03.r01.q1` | `assets/audio/voice/g2/turkce/u05/n03/r01/q1.wav` | ANLATICI | Bu metnin başlığı hangisi olabilir? |
| 254 | `vo.g2.turkce.u05.n03.r01.q2` | `assets/audio/voice/g2/turkce/u05/n03/r01/q2.wav` | ANLATICI | Ela nasıl daha çok atlayabildi? |
| 255 | `vo.g2.turkce.u05.n03.r02` | `assets/audio/voice/g2/turkce/u05/n03/r02.wav` | ANLATICI | Zıt anlamlı sözcükleri eşleştir. |
| 256 | `vo.g2.turkce.u05.n03.r03` | `assets/audio/voice/g2/turkce/u05/n03/r03.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 257 | `vo.g2.turkce.u05.n03.r03.p1` | `assets/audio/voice/g2/turkce/u05/n03/r03/p1.wav` | ANLATICI | Burak kilden küçük hayvanlar yapar. Bu hafta bir kedi, bir köpek ve bir kaplumbağa yaptı. |
| 258 | `vo.g2.turkce.u05.n03.r03.p2` | `assets/audio/voice/g2/turkce/u05/n03/r03/p2.wav` | ANLATICI | Hepsini rafına dizdi. Kardeşi en çok kaplumbağayı beğendi ve ona bir ad verdi. |
| 259 | `vo.g2.turkce.u05.n03.r03.q1` | `assets/audio/voice/g2/turkce/u05/n03/r03/q1.wav` | ANLATICI | Metnin konusu nedir? |
| 260 | `vo.g2.turkce.u05.n03.r03.q2` | `assets/audio/voice/g2/turkce/u05/n03/r03/q2.wav` | ANLATICI | Kardeşi en çok hangisini beğendi? |
| 261 | `vo.g2.turkce.u05.n03.r04` | `assets/audio/voice/g2/turkce/u05/n03/r04.wav` | ANLATICI | Bu cümleler doğru mu, yanlış mı? Bildiklerini düşün ve kartları kutulara taşı. |
| 262 | `vo.g2.turkce.u05.n04.intro` | `assets/audio/voice/g2/turkce/u05/n04/intro.wav` | BILGE | Olaylar bir sırayla olur. Önce ne oldu, sonra ne oldu? Haydi sıralayalım! |
| 263 | `vo.g2.turkce.u05.n04.r01` | `assets/audio/voice/g2/turkce/u05/n04/r01.wav` | ANLATICI | Zeynep resim yapıyor. Kartları olayların sırasına göre diz. |
| 264 | `vo.g2.turkce.u05.n04.r02` | `assets/audio/voice/g2/turkce/u05/n04/r02.wav` | ANLATICI | Deniz gösteriye hazırlanıyor. Kartları olayların sırasına göre diz. |
| 265 | `vo.g2.turkce.u05.n04.r03` | `assets/audio/voice/g2/turkce/u05/n04/r03.wav` | ANLATICI | Burak kilden bir kaplumbağa yapıyor. Önce ne yaptı? Kartları sırala. |
| 266 | `vo.g2.turkce.u05.n05.intro` | `assets/audio/voice/g2/turkce/u05/n05/intro.wav` | BILGE | Yazarken bazı kurallara uyarız. Soru ekini, kısaltmaları ve büyük harfleri öğrenelim! |
| 267 | `vo.g2.turkce.u05.n05.r01` | `assets/audio/voice/g2/turkce/u05/n05/r01.wav` | ANLATICI | Soru eki ayrı yazılır. Sözcüğün son ünlüsüne bak ve her cümleye uyan soru ekini yanına taşı. |
| 268 | `vo.g2.turkce.u05.n05.r02` | `assets/audio/voice/g2/turkce/u05/n05/r02.wav` | ANLATICI | Kısaltmaları açık yazılışlarıyla eşleştir. |
| 269 | `vo.g2.turkce.u05.n05.r03` | `assets/audio/voice/g2/turkce/u05/n05/r03.wav` | ANLATICI | Bu sözcükler büyük harfle başlar. Her sözcüğü türüyle eşleştir. |
| 270 | `vo.g2.turkce.u06.n01.intro` | `assets/audio/voice/g2/turkce/u06/n01/intro.wav` | BILGE | Merhaba küçük mucit! Merak eden ve çözüm bulan çocukların hikâyelerini dinleyelim. |
| 271 | `vo.g2.turkce.u06.n01.r01` | `assets/audio/voice/g2/turkce/u06/n01/r01.wav` | ANLATICI | Arda'nın hikâyesini dikkatle dinle. Sonra soruları cevapla. |
| 272 | `vo.g2.turkce.u06.n01.r01.p1` | `assets/audio/voice/g2/turkce/u06/n01/r01/p1.wav` | ANLATICI | Arda'nın kalemleri hep masadan yere düşüyordu. Arda bu duruma bir çözüm aradı. |
| 273 | `vo.g2.turkce.u06.n01.r01.p2` | `assets/audio/voice/g2/turkce/u06/n01/r01/p2.wav` | ANLATICI | Boş bir kutu buldu. Kutuyu renkli kâğıtlarla kapladı ve ondan bir kalemlik yaptı. |
| 274 | `vo.g2.turkce.u06.n01.r01.p3` | `assets/audio/voice/g2/turkce/u06/n01/r01/p3.wav` | ANLATICI | Artık kalemleri hiç düşmüyordu. Arda kendi icadına çok sevindi. |
| 275 | `vo.g2.turkce.u06.n01.r01.q1` | `assets/audio/voice/g2/turkce/u06/n01/r01/q1.wav` | ANLATICI | Arda'nın sorunu neydi? |
| 276 | `vo.g2.turkce.u06.n01.r01.q2` | `assets/audio/voice/g2/turkce/u06/n01/r01/q2.wav` | ANLATICI | Arda kalemliği neyden yaptı? |
| 277 | `vo.g2.turkce.u06.n01.r01.q3` | `assets/audio/voice/g2/turkce/u06/n01/r01/q3.wav` | ANLATICI | Arda nasıl bir çocuktur? |
| 278 | `vo.g2.turkce.u06.n01.r02` | `assets/audio/voice/g2/turkce/u06/n01/r02.wav` | ANLATICI | Duru'nun deneyini dinle. Sonra soruları cevapla. |
| 279 | `vo.g2.turkce.u06.n01.r02.p1` | `assets/audio/voice/g2/turkce/u06/n01/r02/p1.wav` | ANLATICI | Duru, hangi eşyaların suda yüzdüğünü merak etti. Büyük bir kaba su doldurdu. |
| 280 | `vo.g2.turkce.u06.n01.r02.p2` | `assets/audio/voice/g2/turkce/u06/n01/r02/p2.wav` | ANLATICI | Suya bir mantar, bir taş ve bir yaprak bıraktı. Sonra dikkatle izledi. |
| 281 | `vo.g2.turkce.u06.n01.r02.p3` | `assets/audio/voice/g2/turkce/u06/n01/r02/p3.wav` | ANLATICI | Taş hemen dibe battı. Mantar ve yaprak ise suyun üstünde yüzdü. |
| 282 | `vo.g2.turkce.u06.n01.r02.q1` | `assets/audio/voice/g2/turkce/u06/n01/r02/q1.wav` | ANLATICI | Duru neyi merak etti? |
| 283 | `vo.g2.turkce.u06.n01.r02.q2` | `assets/audio/voice/g2/turkce/u06/n01/r02/q2.wav` | ANLATICI | Hangisi dibe battı? |
| 284 | `vo.g2.turkce.u06.n01.r02.q3` | `assets/audio/voice/g2/turkce/u06/n01/r02/q3.wav` | ANLATICI | Duru nasıl bir çocuktur? |
| 285 | `vo.g2.turkce.u06.n01.r03` | `assets/audio/voice/g2/turkce/u06/n01/r03.wav` | ANLATICI | Bu eşyalar suda yüzer mi, batar mı? Duru'nun deneyini düşün ve kartları kutulara taşı. |
| 286 | `vo.g2.turkce.u06.n02.intro` | `assets/audio/voice/g2/turkce/u06/n02/intro.wav` | BILGE | Mucitler fikirlerini güzelce anlatır ve dikkatle dinler. Doğru olanı birlikte seçelim! |
| 287 | `vo.g2.turkce.u06.n02.r01` | `assets/audio/voice/g2/turkce/u06/n02/r01.wav` | ANLATICI | Bilim şenliğinde sınıfa icadını anlatacaksın. Nasıl konuşursun? |
| 288 | `vo.g2.turkce.u06.n02.r01.hint` | `assets/audio/voice/g2/turkce/u06/n02/r01/hint.wav` | BILGE | Herkes seni duymalı ve anlamalı. |
| 289 | `vo.g2.turkce.u06.n02.r01.c2` | `assets/audio/voice/g2/turkce/u06/n02/r01/c2.wav` | ANLATICI | Kimse anlayamadı. Bir şey anlatırken açık ve yavaş konuşuruz. |
| 290 | `vo.g2.turkce.u06.n02.r01.c3` | `assets/audio/voice/g2/turkce/u06/n02/r01/c3.wav` | ANLATICI | Arkadaki arkadaşların seni duyamadı. Herkesin duyacağı bir sesle konuşalım. |
| 291 | `vo.g2.turkce.u06.n02.r02` | `assets/audio/voice/g2/turkce/u06/n02/r02.wav` | ANLATICI | Arkadaşının yaptığı oyuncak arabayı çok beğendin. Ona ne dersin? |
| 292 | `vo.g2.turkce.u06.n02.r02.hint` | `assets/audio/voice/g2/turkce/u06/n02/r02/hint.wav` | BILGE | Merak ettiğimiz bir şeyi kibarca sorarız. |
| 293 | `vo.g2.turkce.u06.n02.r02.c2` | `assets/audio/voice/g2/turkce/u06/n02/r02/c2.wav` | ANLATICI | Arkadaşın kırıldı. İstediğimizi kibarca söyleriz. |
| 294 | `vo.g2.turkce.u06.n02.r02.c3` | `assets/audio/voice/g2/turkce/u06/n02/r02/c3.wav` | ANLATICI | Arkadaşın üzüldü. Başkalarının emeğine saygı duyarız. |
| 295 | `vo.g2.turkce.u06.n02.r03` | `assets/audio/voice/g2/turkce/u06/n02/r03.wav` | ANLATICI | Bir deney yapacaksın. Adımları öğrenmek için kimi dinlersin? |
| 296 | `vo.g2.turkce.u06.n02.r03.hint` | `assets/audio/voice/g2/turkce/u06/n02/r03/hint.wav` | BILGE | Deneyi kim biliyor ve anlatıyor? Bir düşün. |
| 297 | `vo.g2.turkce.u06.n02.r03.c2` | `assets/audio/voice/g2/turkce/u06/n02/r03/c2.wav` | ANLATICI | Reklam ürün tanıtır, deneyin adımlarını anlatmaz. |
| 298 | `vo.g2.turkce.u06.n02.r03.c3` | `assets/audio/voice/g2/turkce/u06/n02/r03/c3.wav` | ANLATICI | Ninni insanı uyutur ama deneyi anlatmaz. |
| 299 | `vo.g2.turkce.u06.n02.r04` | `assets/audio/voice/g2/turkce/u06/n02/r04.wav` | ANLATICI | Uçakların nasıl uçtuğunu merak ediyorsun. Ne dinlersin? |
| 300 | `vo.g2.turkce.u06.n02.r04.c2` | `assets/audio/voice/g2/turkce/u06/n02/r04/c2.wav` | ANLATICI | Ninni çok tatlı ama uçakları anlatmaz. |
| 301 | `vo.g2.turkce.u06.n02.r04.c3` | `assets/audio/voice/g2/turkce/u06/n02/r04/c3.wav` | ANLATICI | Maç anlatımı maçı anlatır, uçakları anlatmaz. |
| 302 | `vo.g2.turkce.u06.n03.intro` | `assets/audio/voice/g2/turkce/u06/n03/intro.wav` | BILGE | Şimdi okuma zamanı! Metni önce sessizce oku. Takılırsan hoparlöre dokunabilirsin. |
| 303 | `vo.g2.turkce.u06.n03.r01` | `assets/audio/voice/g2/turkce/u06/n03/r01.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 304 | `vo.g2.turkce.u06.n03.r01.p1` | `assets/audio/voice/g2/turkce/u06/n03/r01/p1.wav` | ANLATICI | Selin tatile gidecekti. Saksıdaki çiçeği susuz kalacak diye üzüldü. |
| 305 | `vo.g2.turkce.u06.n03.r01.p2` | `assets/audio/voice/g2/turkce/u06/n03/r01/p2.wav` | ANLATICI | Bir şişeye su doldurdu. Şişeyi ters çevirip saksıya yerleştirdi. Çiçek her gün azar azar su içti. |
| 306 | `vo.g2.turkce.u06.n03.r01.q1` | `assets/audio/voice/g2/turkce/u06/n03/r01/q1.wav` | ANLATICI | Bu metnin başlığı hangisi olabilir? |
| 307 | `vo.g2.turkce.u06.n03.r01.q2` | `assets/audio/voice/g2/turkce/u06/n03/r01/q2.wav` | ANLATICI | Selin neden üzüldü? |
| 308 | `vo.g2.turkce.u06.n03.r02` | `assets/audio/voice/g2/turkce/u06/n03/r02.wav` | ANLATICI | Zıt anlamlı sözcükleri eşleştir. |
| 309 | `vo.g2.turkce.u06.n03.r03` | `assets/audio/voice/g2/turkce/u06/n03/r03.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 310 | `vo.g2.turkce.u06.n03.r03.p1` | `assets/audio/voice/g2/turkce/u06/n03/r03/p1.wav` | ANLATICI | Can ile dedesi bozuk bir duvar saatini açtılar. İçinde küçük dişliler vardı. |
| 311 | `vo.g2.turkce.u06.n03.r03.p2` | `assets/audio/voice/g2/turkce/u06/n03/r03/p2.wav` | ANLATICI | Bir dişli yerinden çıkmıştı. Dedesi dişliyi yerine taktı. Saat yeniden tık tık çalışmaya başladı. |
| 312 | `vo.g2.turkce.u06.n03.r03.q1` | `assets/audio/voice/g2/turkce/u06/n03/r03/q1.wav` | ANLATICI | Metnin konusu nedir? |
| 313 | `vo.g2.turkce.u06.n03.r03.q2` | `assets/audio/voice/g2/turkce/u06/n03/r03/q2.wav` | ANLATICI | Dede saati nasıl çalıştırdı? |
| 314 | `vo.g2.turkce.u06.n03.r04` | `assets/audio/voice/g2/turkce/u06/n03/r04.wav` | ANLATICI | Bu cümleler doğru mu, yanlış mı? Bildiklerini düşün ve kartları kutulara taşı. |
| 315 | `vo.g2.turkce.u06.n04.intro` | `assets/audio/voice/g2/turkce/u06/n04/intro.wav` | BILGE | Mucitler işlerini adım adım yapar. Önce ne oldu, sonra ne oldu? Haydi sıralayalım! |
| 316 | `vo.g2.turkce.u06.n04.r01` | `assets/audio/voice/g2/turkce/u06/n04/r01.wav` | ANLATICI | Duru deney yapıyor. Kartları olayların sırasına göre diz. |
| 317 | `vo.g2.turkce.u06.n04.r02` | `assets/audio/voice/g2/turkce/u06/n04/r02.wav` | ANLATICI | Arda kâğıttan uçak yapıyor. Kartları olayların sırasına göre diz. |
| 318 | `vo.g2.turkce.u06.n04.r03` | `assets/audio/voice/g2/turkce/u06/n04/r03.wav` | ANLATICI | Bir mucit nasıl çalışır? Önce ne yapar? Kartları sırala. |
| 319 | `vo.g2.turkce.u06.n05.intro` | `assets/audio/voice/g2/turkce/u06/n05/intro.wav` | BILGE | Yazarken bazı kurallara uyarız. Soru ekini, kısaltmaları ve büyük harfleri öğrenelim! |
| 320 | `vo.g2.turkce.u06.n05.r01` | `assets/audio/voice/g2/turkce/u06/n05/r01.wav` | ANLATICI | Soru eki ayrı yazılır. Sözcüğün son ünlüsüne bak ve her cümleye uyan soru ekini yanına taşı. |
| 321 | `vo.g2.turkce.u06.n05.r02` | `assets/audio/voice/g2/turkce/u06/n05/r02.wav` | ANLATICI | Kısaltmaları açık yazılışlarıyla eşleştir. |
| 322 | `vo.g2.turkce.u06.n05.r03` | `assets/audio/voice/g2/turkce/u06/n05/r03.wav` | ANLATICI | Bu sözcükler büyük harfle başlar. Her sözcüğü türüyle eşleştir. |
| 323 | `vo.g2.turkce.u07.n01.intro` | `assets/audio/voice/g2/turkce/u07/n01/intro.wav` | BILGE | Merhaba! Kültürümüz bir hazine gibidir. Bir fıkra ve bir bayram hikâyesi dinleyelim. |
| 324 | `vo.g2.turkce.u07.n01.r01` | `assets/audio/voice/g2/turkce/u07/n01/r01.wav` | ANLATICI | Nasreddin Hoca'nın fıkrasını dikkatle dinle. Sonra soruları cevapla. |
| 325 | `vo.g2.turkce.u07.n01.r01.p1` | `assets/audio/voice/g2/turkce/u07/n01/r01/p1.wav` | ANLATICI | Nasreddin Hoca komşusundan bir kazan ödünç aldı. Geri verirken içine küçük bir tencere koydu. |
| 326 | `vo.g2.turkce.u07.n01.r01.p2` | `assets/audio/voice/g2/turkce/u07/n01/r01/p2.wav` | ANLATICI | Hoca, "Kazanın doğurdu." dedi. Komşu buna inandı ve tencereyi sevinerek aldı. |
| 327 | `vo.g2.turkce.u07.n01.r01.p3` | `assets/audio/voice/g2/turkce/u07/n01/r01/p3.wav` | ANLATICI | Hoca kazanı yine aldı, sonra "Kazan öldü." dedi. "Doğurduğuna inandın, öldüğüne de inan!" diye güldü. |
| 328 | `vo.g2.turkce.u07.n01.r01.q1` | `assets/audio/voice/g2/turkce/u07/n01/r01/q1.wav` | ANLATICI | Hoca kazanın içine ne koydu? |
| 329 | `vo.g2.turkce.u07.n01.r01.q2` | `assets/audio/voice/g2/turkce/u07/n01/r01/q2.wav` | ANLATICI | Komşu tencereyi alırken nasıldı? |
| 330 | `vo.g2.turkce.u07.n01.r01.q3` | `assets/audio/voice/g2/turkce/u07/n01/r01/q3.wav` | ANLATICI | Bu fıkranın kahramanı kimdir? |
| 331 | `vo.g2.turkce.u07.n01.r02` | `assets/audio/voice/g2/turkce/u07/n01/r02.wav` | ANLATICI | Ayşe'nin bayram hikâyesini dinle. Sonra soruları cevapla. |
| 332 | `vo.g2.turkce.u07.n01.r02.p1` | `assets/audio/voice/g2/turkce/u07/n01/r02/p1.wav` | ANLATICI | Bayram sabahı Ayşe erkenden kalktı. Yeni elbisesini giydi ve saçlarını taradı. |
| 333 | `vo.g2.turkce.u07.n01.r02.p2` | `assets/audio/voice/g2/turkce/u07/n01/r02/p2.wav` | ANLATICI | Ailesiyle dedesini ziyarete gittiler. Ayşe kapıda dedesinin elini öptü. |
| 334 | `vo.g2.turkce.u07.n01.r02.p3` | `assets/audio/voice/g2/turkce/u07/n01/r02/p3.wav` | ANLATICI | Dedesi ona şeker ikram etti. Sonra herkes birlikte sofraya oturdu. |
| 335 | `vo.g2.turkce.u07.n01.r02.q1` | `assets/audio/voice/g2/turkce/u07/n01/r02/q1.wav` | ANLATICI | Ayşe bayram sabahı ne giydi? |
| 336 | `vo.g2.turkce.u07.n01.r02.q2` | `assets/audio/voice/g2/turkce/u07/n01/r02/q2.wav` | ANLATICI | Ayşe dedesine nasıl saygı gösterdi? |
| 337 | `vo.g2.turkce.u07.n01.r02.q3` | `assets/audio/voice/g2/turkce/u07/n01/r02/q3.wav` | ANLATICI | Bu hikâyenin konusu nedir? |
| 338 | `vo.g2.turkce.u07.n01.r03` | `assets/audio/voice/g2/turkce/u07/n01/r03.wav` | ANLATICI | Hangisi Hoca'nın fıkrasında, hangisi Ayşe'nin hikâyesindeydi? Her kartı doğru kutuya taşı. |
| 339 | `vo.g2.turkce.u07.n02.intro` | `assets/audio/voice/g2/turkce/u07/n02/intro.wav` | BILGE | Güzel geleneklerimizde güzel sözler vardır. Duruma uygun olanı birlikte seçelim! |
| 340 | `vo.g2.turkce.u07.n02.r01` | `assets/audio/voice/g2/turkce/u07/n02/r01.wav` | ANLATICI | Bayramda babaannenin elini öptün. Ona ne söylersin? |
| 341 | `vo.g2.turkce.u07.n02.r01.hint` | `assets/audio/voice/g2/turkce/u07/n02/r01/hint.wav` | BILGE | Bayramda büyüklerimize güzel dileklerimizi söyleriz. |
| 342 | `vo.g2.turkce.u07.n02.r01.c2` | `assets/audio/voice/g2/turkce/u07/n02/r01/c2.wav` | ANLATICI | Babaannen şaşırdı. Bayramda önce güzel dileklerimizi söyleriz. |
| 343 | `vo.g2.turkce.u07.n02.r01.c3` | `assets/audio/voice/g2/turkce/u07/n02/r01/c3.wav` | ANLATICI | Bu söz kaba kaçtı. Büyüklerimizle sevgiyle konuşuruz. |
| 344 | `vo.g2.turkce.u07.n02.r02` | `assets/audio/voice/g2/turkce/u07/n02/r02.wav` | ANLATICI | Evinize misafir geldi. Kapıyı sen açtın. Ne söylersin? |
| 345 | `vo.g2.turkce.u07.n02.r02.hint` | `assets/audio/voice/g2/turkce/u07/n02/r02/hint.wav` | BILGE | Misafirlerimizi güler yüzle karşılarız. |
| 346 | `vo.g2.turkce.u07.n02.r02.c2` | `assets/audio/voice/g2/turkce/u07/n02/r02/c2.wav` | ANLATICI | Misafir şaşırdı. Misafirlerimizi sıcak ve kibar sözlerle karşılarız. |
| 347 | `vo.g2.turkce.u07.n02.r02.c3` | `assets/audio/voice/g2/turkce/u07/n02/r02/c3.wav` | ANLATICI | Bu söz misafiri üzdü. Kapıda güler yüzle karşılarız. |
| 348 | `vo.g2.turkce.u07.n02.r03` | `assets/audio/voice/g2/turkce/u07/n02/r03.wav` | ANLATICI | Keloğlan masalı dinlemek istiyorsun. Kimi dinlersin? |
| 349 | `vo.g2.turkce.u07.n02.r03.hint` | `assets/audio/voice/g2/turkce/u07/n02/r03/hint.wav` | BILGE | Masalları kim anlatır? Bir düşün. |
| 350 | `vo.g2.turkce.u07.n02.r03.c2` | `assets/audio/voice/g2/turkce/u07/n02/r03/c2.wav` | ANLATICI | Hava durumu havayı anlatır, masal anlatmaz. |
| 351 | `vo.g2.turkce.u07.n02.r03.c3` | `assets/audio/voice/g2/turkce/u07/n02/r03/c3.wav` | ANLATICI | Maç anlatıcısı maçı anlatır, masal anlatmaz. |
| 352 | `vo.g2.turkce.u07.n02.r04` | `assets/audio/voice/g2/turkce/u07/n02/r04.wav` | ANLATICI | Ebru ustası, boyaları suya nasıl serptiğini gösteriyor. Nasıl izlersin? |
| 353 | `vo.g2.turkce.u07.n02.r04.hint` | `assets/audio/voice/g2/turkce/u07/n02/r04/hint.wav` | BILGE | Bir şeyi öğrenmek için dikkatle bakarız. |
| 354 | `vo.g2.turkce.u07.n02.r04.c2` | `assets/audio/voice/g2/turkce/u07/n02/r04/c2.wav` | ANLATICI | Ustanın gösterdiklerini kaçırdın. Öğrenirken dikkatimizi veririz. |
| 355 | `vo.g2.turkce.u07.n02.r04.c3` | `assets/audio/voice/g2/turkce/u07/n02/r04/c3.wav` | ANLATICI | Boyaların nasıl serpildiğini göremedin. |
| 356 | `vo.g2.turkce.u07.n03.intro` | `assets/audio/voice/g2/turkce/u07/n03/intro.wav` | BILGE | Şimdi okuma zamanı! Metni önce sessizce oku. Takılırsan hoparlöre dokunabilirsin. |
| 357 | `vo.g2.turkce.u07.n03.r01` | `assets/audio/voice/g2/turkce/u07/n03/r01.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 358 | `vo.g2.turkce.u07.n03.r01.p1` | `assets/audio/voice/g2/turkce/u07/n03/r01/p1.wav` | ANLATICI | Babaannem ebru yapar. Önce suyun üstüne renkli boyaları serper. |
| 359 | `vo.g2.turkce.u07.n03.r01.p2` | `assets/audio/voice/g2/turkce/u07/n03/r01/p2.wav` | ANLATICI | Sonra suyun üstüne bir kâğıt koyar. Kâğıdı kaldırınca rengârenk desenler çıkar. |
| 360 | `vo.g2.turkce.u07.n03.r01.q1` | `assets/audio/voice/g2/turkce/u07/n03/r01/q1.wav` | ANLATICI | Bu metnin başlığı hangisi olabilir? |
| 361 | `vo.g2.turkce.u07.n03.r01.q2` | `assets/audio/voice/g2/turkce/u07/n03/r01/q2.wav` | ANLATICI | Babaanne boyaları nereye serper? |
| 362 | `vo.g2.turkce.u07.n03.r02` | `assets/audio/voice/g2/turkce/u07/n03/r02.wav` | ANLATICI | Zıt anlamlı sözcükleri eşleştir. |
| 363 | `vo.g2.turkce.u07.n03.r03` | `assets/audio/voice/g2/turkce/u07/n03/r03.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 364 | `vo.g2.turkce.u07.n03.r03.p1` | `assets/audio/voice/g2/turkce/u07/n03/r03/p1.wav` | ANLATICI | Ninem tezgâhta halı dokur. Halıda kırmızı, mavi ve sarı ipler kullanır. |
| 365 | `vo.g2.turkce.u07.n03.r03.p2` | `assets/audio/voice/g2/turkce/u07/n03/r03/p2.wav` | ANLATICI | Bir halıyı aylarca dokur. Bu halıyı bitirince bana hediye edeceğini söyledi. |
| 366 | `vo.g2.turkce.u07.n03.r03.q1` | `assets/audio/voice/g2/turkce/u07/n03/r03/q1.wav` | ANLATICI | Metnin konusu nedir? |
| 367 | `vo.g2.turkce.u07.n03.r03.q2` | `assets/audio/voice/g2/turkce/u07/n03/r03/q2.wav` | ANLATICI | Nine halıyı bitirince ne yapacak? |
| 368 | `vo.g2.turkce.u07.n03.r04` | `assets/audio/voice/g2/turkce/u07/n03/r04.wav` | ANLATICI | Bu eşyalar ebruda mı, halıda mı kullanıldı? Metinleri düşün ve kartları kutulara taşı. |
| 369 | `vo.g2.turkce.u07.n04.intro` | `assets/audio/voice/g2/turkce/u07/n04/intro.wav` | BILGE | Olaylar bir sırayla olur. Önce ne oldu, sonra ne oldu? Haydi sıralayalım! |
| 370 | `vo.g2.turkce.u07.n04.r01` | `assets/audio/voice/g2/turkce/u07/n04/r01.wav` | ANLATICI | Ayşe bayrama hazırlanıyor. Kartları olayların sırasına göre diz. |
| 371 | `vo.g2.turkce.u07.n04.r02` | `assets/audio/voice/g2/turkce/u07/n04/r02.wav` | ANLATICI | Babaanne ebru yapıyor. Kartları olayların sırasına göre diz. |
| 372 | `vo.g2.turkce.u07.n04.r03` | `assets/audio/voice/g2/turkce/u07/n04/r03.wav` | ANLATICI | Hoca'nın fıkrasında önce ne oldu? Kartları sırala. |
| 373 | `vo.g2.turkce.u07.n05.intro` | `assets/audio/voice/g2/turkce/u07/n05/intro.wav` | BILGE | Yazarken bazı kurallara uyarız. Soru ekini, kısaltmaları ve büyük harfleri öğrenelim! |
| 374 | `vo.g2.turkce.u07.n05.r01` | `assets/audio/voice/g2/turkce/u07/n05/r01.wav` | ANLATICI | Soru eki ayrı yazılır. Sözcüğün son ünlüsüne bak ve her cümleye uyan soru ekini yanına taşı. |
| 375 | `vo.g2.turkce.u07.n05.r02` | `assets/audio/voice/g2/turkce/u07/n05/r02.wav` | ANLATICI | Kısaltmaları açık yazılışlarıyla eşleştir. |
| 376 | `vo.g2.turkce.u07.n05.r03` | `assets/audio/voice/g2/turkce/u07/n05/r03.wav` | ANLATICI | Bu sözcükler büyük harfle başlar. Her sözcüğü türüyle eşleştir. |
| 377 | `vo.g2.turkce.u08.n01.intro` | `assets/audio/voice/g2/turkce/u08/n01/intro.wav` | BILGE | Merhaba! Her çocuğun sağlıklı olma ve oyun oynama hakkı vardır. Haydi hikâyeleri dinleyelim. |
| 378 | `vo.g2.turkce.u08.n01.r01` | `assets/audio/voice/g2/turkce/u08/n01/r01.wav` | ANLATICI | Elif'in hikâyesini dikkatle dinle. Sonra soruları cevapla. |
| 379 | `vo.g2.turkce.u08.n01.r01.p1` | `assets/audio/voice/g2/turkce/u08/n01/r01/p1.wav` | ANLATICI | Elif'in dişi ağrıyordu. Annesi onu hemen diş doktoruna götürdü. |
| 380 | `vo.g2.turkce.u08.n01.r01.p2` | `assets/audio/voice/g2/turkce/u08/n01/r01/p2.wav` | ANLATICI | Doktor, Elif'in dişini tedavi etti. Ona dişlerini nasıl fırçalayacağını da gösterdi. |
| 381 | `vo.g2.turkce.u08.n01.r01.p3` | `assets/audio/voice/g2/turkce/u08/n01/r01/p3.wav` | ANLATICI | Elif o günden beri dişlerini her gün sabah ve akşam fırçalıyor. |
| 382 | `vo.g2.turkce.u08.n01.r01.q1` | `assets/audio/voice/g2/turkce/u08/n01/r01/q1.wav` | ANLATICI | Elif'in neresi ağrıyordu? |
| 383 | `vo.g2.turkce.u08.n01.r01.q2` | `assets/audio/voice/g2/turkce/u08/n01/r01/q2.wav` | ANLATICI | Bu hikâyenin konusu nedir? |
| 384 | `vo.g2.turkce.u08.n01.r01.q3` | `assets/audio/voice/g2/turkce/u08/n01/r01/q3.wav` | ANLATICI | Elif doktorun sözünü dinledi mi? |
| 385 | `vo.g2.turkce.u08.n01.r02` | `assets/audio/voice/g2/turkce/u08/n01/r02.wav` | ANLATICI | Öykü'nün hikâyesini dinle. Sonra soruları cevapla. |
| 386 | `vo.g2.turkce.u08.n01.r02.p1` | `assets/audio/voice/g2/turkce/u08/n01/r02/p1.wav` | ANLATICI | Teneffüs zili çaldı. Öykü ve arkadaşları hemen okul bahçesine çıktı. |
| 387 | `vo.g2.turkce.u08.n01.r02.p2` | `assets/audio/voice/g2/turkce/u08/n01/r02/p2.wav` | ANLATICI | Önce ip atladılar, sonra saklambaç oynadılar. Hepsi çok eğlendi. |
| 388 | `vo.g2.turkce.u08.n01.r02.p3` | `assets/audio/voice/g2/turkce/u08/n01/r02/p3.wav` | ANLATICI | Zil yeniden çalınca çocuklar sıraya girdi ve sınıflarına döndü. |
| 389 | `vo.g2.turkce.u08.n01.r02.q1` | `assets/audio/voice/g2/turkce/u08/n01/r02/q1.wav` | ANLATICI | Zil çalınca çocuklar nereye çıktı? |
| 390 | `vo.g2.turkce.u08.n01.r02.q2` | `assets/audio/voice/g2/turkce/u08/n01/r02/q2.wav` | ANLATICI | Teneffüs bitince ne yaptılar? |
| 391 | `vo.g2.turkce.u08.n01.r02.q3` | `assets/audio/voice/g2/turkce/u08/n01/r02/q3.wav` | ANLATICI | Bu hikâyenin konusu nedir? |
| 392 | `vo.g2.turkce.u08.n01.r03` | `assets/audio/voice/g2/turkce/u08/n01/r03.wav` | ANLATICI | Hangisi Elif'in, hangisi Öykü'nün hikâyesindeydi? Her kartı doğru kutuya taşı. |
| 393 | `vo.g2.turkce.u08.n02.intro` | `assets/audio/voice/g2/turkce/u08/n02/intro.wav` | BILGE | Derdimizi güzelce anlatmak da önemlidir. Duruma uygun olanı birlikte seçelim! |
| 394 | `vo.g2.turkce.u08.n02.r01` | `assets/audio/voice/g2/turkce/u08/n02/r01.wav` | ANLATICI | Doktor sana nerenin ağrıdığını soruyor. Nasıl cevap verirsin? |
| 395 | `vo.g2.turkce.u08.n02.r01.hint` | `assets/audio/voice/g2/turkce/u08/n02/r01/hint.wav` | BILGE | Doktor bize yardım etmek ister. Ona derdimizi anlatırız. |
| 396 | `vo.g2.turkce.u08.n02.r01.c2` | `assets/audio/voice/g2/turkce/u08/n02/r01/c2.wav` | ANLATICI | Doktor neyin ağrıdığını bilemedi. Derdimizi açıkça anlatırız. |
| 397 | `vo.g2.turkce.u08.n02.r01.c3` | `assets/audio/voice/g2/turkce/u08/n02/r01/c3.wav` | ANLATICI | Doktor irkildi. Sakin bir sesle konuşuruz. |
| 398 | `vo.g2.turkce.u08.n02.r02` | `assets/audio/voice/g2/turkce/u08/n02/r02.wav` | ANLATICI | Arkadaşların bahçede oyun oynuyor. Sen de katılmak istiyorsun. Ne dersin? |
| 399 | `vo.g2.turkce.u08.n02.r02.hint` | `assets/audio/voice/g2/turkce/u08/n02/r02/hint.wav` | BILGE | Bir şey isterken kibar sözler kullanırız. |
| 400 | `vo.g2.turkce.u08.n02.r02.c2` | `assets/audio/voice/g2/turkce/u08/n02/r02/c2.wav` | ANLATICI | Arkadaşların üzüldü. İsteğimizi kibarca söyleriz. |
| 401 | `vo.g2.turkce.u08.n02.r02.c3` | `assets/audio/voice/g2/turkce/u08/n02/r02/c3.wav` | ANLATICI | Küsmek sorunu çözmez. Kibarca sormayı deneyelim. |
| 402 | `vo.g2.turkce.u08.n02.r03` | `assets/audio/voice/g2/turkce/u08/n02/r03.wav` | ANLATICI | Okulda yangın tatbikatı var. Öğretmen ne yapacağınızı anlatıyor. Neden dikkatle dinlersin? |
| 403 | `vo.g2.turkce.u08.n02.r03.hint` | `assets/audio/voice/g2/turkce/u08/n02/r03/hint.wav` | BILGE | Bu bilgiler bizi korur. |
| 404 | `vo.g2.turkce.u08.n02.r03.c2` | `assets/audio/voice/g2/turkce/u08/n02/r03/c2.wav` | ANLATICI | Bu anlatım uyumak için değil. Güvenliğimiz için dinleriz. |
| 405 | `vo.g2.turkce.u08.n02.r03.c3` | `assets/audio/voice/g2/turkce/u08/n02/r03/c3.wav` | ANLATICI | Tatbikat şaka değildir. Ne yapacağımızı öğrenmek için dinleriz. |
| 406 | `vo.g2.turkce.u08.n02.r04` | `assets/audio/voice/g2/turkce/u08/n02/r04.wav` | ANLATICI | Kardeşin resim defterini izin almadan aldı. Ona ne söylersin? |
| 407 | `vo.g2.turkce.u08.n02.r04.hint` | `assets/audio/voice/g2/turkce/u08/n02/r04/hint.wav` | BILGE | Duygumuzu sakin ve kibar sözlerle anlatırız. |
| 408 | `vo.g2.turkce.u08.n02.r04.c2` | `assets/audio/voice/g2/turkce/u08/n02/r04/c2.wav` | ANLATICI | Kardeşin korktu. Sakin ve kibar konuşuruz. |
| 409 | `vo.g2.turkce.u08.n02.r04.c3` | `assets/audio/voice/g2/turkce/u08/n02/r04/c3.wav` | ANLATICI | Kardeşin izin istemesi gerektiğini öğrenemedi. Duygumuzu kibarca söyleriz. |
| 410 | `vo.g2.turkce.u08.n03.intro` | `assets/audio/voice/g2/turkce/u08/n03/intro.wav` | BILGE | Şimdi okuma zamanı! Metni önce sessizce oku. Takılırsan hoparlöre dokunabilirsin. |
| 411 | `vo.g2.turkce.u08.n03.r01` | `assets/audio/voice/g2/turkce/u08/n03/r01.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 412 | `vo.g2.turkce.u08.n03.r01.p1` | `assets/audio/voice/g2/turkce/u08/n03/r01/p1.wav` | ANLATICI | Her çocuğun bir adı vardır. Adımız bizi başka insanlardan ayırır. |
| 413 | `vo.g2.turkce.u08.n03.r01.p2` | `assets/audio/voice/g2/turkce/u08/n03/r01/p2.wav` | ANLATICI | Bu yüzden arkadaşlarımıza adlarıyla sesleniriz. Onlara lakap takmayız. |
| 414 | `vo.g2.turkce.u08.n03.r01.q1` | `assets/audio/voice/g2/turkce/u08/n03/r01/q1.wav` | ANLATICI | Bu metnin başlığı hangisi olabilir? |
| 415 | `vo.g2.turkce.u08.n03.r01.q2` | `assets/audio/voice/g2/turkce/u08/n03/r01/q2.wav` | ANLATICI | Arkadaşlarımıza nasıl sesleniriz? |
| 416 | `vo.g2.turkce.u08.n03.r02` | `assets/audio/voice/g2/turkce/u08/n03/r02.wav` | ANLATICI | Zıt anlamlı sözcükleri eşleştir. |
| 417 | `vo.g2.turkce.u08.n03.r03` | `assets/audio/voice/g2/turkce/u08/n03/r03.wav` | ANLATICI | Metni sessizce oku. Sonra soruları cevapla. |
| 418 | `vo.g2.turkce.u08.n03.r03.p1` | `assets/audio/voice/g2/turkce/u08/n03/r03/p1.wav` | ANLATICI | Kerem okulunu çok sever. Okulda okumayı, yazmayı ve saymayı öğrendi. |
| 419 | `vo.g2.turkce.u08.n03.r03.p2` | `assets/audio/voice/g2/turkce/u08/n03/r03/p2.wav` | ANLATICI | Kerem her akşam çantasını kendisi hazırlar. Kitaplarını temiz ve düzenli tutar. |
| 420 | `vo.g2.turkce.u08.n03.r03.q1` | `assets/audio/voice/g2/turkce/u08/n03/r03/q1.wav` | ANLATICI | Metnin konusu nedir? |
| 421 | `vo.g2.turkce.u08.n03.r03.q2` | `assets/audio/voice/g2/turkce/u08/n03/r03/q2.wav` | ANLATICI | Kerem her akşam ne yapar? |
| 422 | `vo.g2.turkce.u08.n03.r04` | `assets/audio/voice/g2/turkce/u08/n03/r04.wav` | ANLATICI | Hangisi hakkımız, hangisi görevimiz? Kartları doğru kutuya taşı. |
| 423 | `vo.g2.turkce.u08.n04.intro` | `assets/audio/voice/g2/turkce/u08/n04/intro.wav` | BILGE | Olaylar bir sırayla olur. Önce ne oldu, sonra ne oldu? Haydi sıralayalım! |
| 424 | `vo.g2.turkce.u08.n04.r01` | `assets/audio/voice/g2/turkce/u08/n04/r01.wav` | ANLATICI | Elif diş doktoruna gitti. Kartları olayların sırasına göre diz. |
| 425 | `vo.g2.turkce.u08.n04.r02` | `assets/audio/voice/g2/turkce/u08/n04/r02.wav` | ANLATICI | Öykü teneffüse çıktı. Kartları olayların sırasına göre diz. |
| 426 | `vo.g2.turkce.u08.n04.r03` | `assets/audio/voice/g2/turkce/u08/n04/r03.wav` | ANLATICI | Kerem akşam ne yaptı? Önce ne oldu? Kartları sırala. |
| 427 | `vo.g2.turkce.u08.n05.intro` | `assets/audio/voice/g2/turkce/u08/n05/intro.wav` | BILGE | Yazarken bazı kurallara uyarız. Soru ekini, kısaltmaları ve büyük harfleri öğrenelim! |
| 428 | `vo.g2.turkce.u08.n05.r01` | `assets/audio/voice/g2/turkce/u08/n05/r01.wav` | ANLATICI | Soru eki ayrı yazılır. Sözcüğün son ünlüsüne bak ve her cümleye uyan soru ekini yanına taşı. |
| 429 | `vo.g2.turkce.u08.n05.r02` | `assets/audio/voice/g2/turkce/u08/n05/r02.wav` | ANLATICI | Kısaltmaları açık yazılışlarıyla eşleştir. |
| 430 | `vo.g2.turkce.u08.n05.r03` | `assets/audio/voice/g2/turkce/u08/n05/r03.wav` | ANLATICI | Bu sözcükler büyük harfle başlar. Her sözcüğü türüyle eşleştir. |

---
## Teslim kontrol listesi
- [ ] Dosya adları kimlikle birebir aynı (Türkçe karakter yok)
- [ ] Ses başında ve sonunda uzun sessizlik yok (gerekirse kırp)
- [ ] 005'teki aynı iki ses kullanıldı
- [ ] Commit: `assets: 070 g2 türkçe seslendirme`
