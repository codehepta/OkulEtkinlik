# 065 · 1. sınıf Türkçe ünite 1–5 seslendirmesi (durak girişleri ve tur yönergeleri)

**Öncelik: YÜKSEK** (Faz 4b). Okumaya hazırlık ve harf ünitelerinin (`content/g1/turkce/u01–u05.json`) durak girişleri, tur yönergeleri ve cümle okumaları.

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

Ek not: Yönergelerdeki harf adları ("a sesi", "büyük A harfi") net ve vurgulu söylenir; çocuk bu harfi ekranda bulacak.

## Satırlar

| # | Kimlik (anahtar) | Dosya yolu | Konuşmacı | Metin |
|---|---|---|---|---|
| 1 | `vo.g1.turkce.u01.n01.intro` | `assets/audio/voice/g1/turkce/u01/n01/intro.wav` | BILGE | Kulaklarını aç! Çevremizde bir sürü ses var. Bakalım kimin sesi? |
| 2 | `vo.g1.turkce.u01.n01.r01` | `assets/audio/voice/g1/turkce/u01/n01/r01.wav` | ANLATICI | Bu ses kimden geliyor? Dinle ve sesin sahibine dokun. |
| 3 | `vo.g1.turkce.u01.n01.r02` | `assets/audio/voice/g1/turkce/u01/n01/r02.wav` | ANLATICI | Bu ses kimden geliyor? Dinle ve sesin sahibine dokun. |
| 4 | `vo.g1.turkce.u01.n01.r03` | `assets/audio/voice/g1/turkce/u01/n01/r03.wav` | ANLATICI | Bu ses kimden geliyor? Dinle ve sesin sahibine dokun. |
| 5 | `vo.g1.turkce.u01.n01.r04` | `assets/audio/voice/g1/turkce/u01/n01/r04.wav` | ANLATICI | Bu ses kimden geliyor? Dinle ve sesin sahibine dokun. |
| 6 | `vo.g1.turkce.u01.n01.r05` | `assets/audio/voice/g1/turkce/u01/n01/r05.wav` | ANLATICI | Bu ses kimden geliyor? Dinle ve sesin sahibine dokun. |
| 7 | `vo.g1.turkce.u01.n02.intro` | `assets/audio/voice/g1/turkce/u01/n02/intro.wav` | BILGE | Bazı sesler doğadan gelir, bazılarını makineler çıkarır. Haydi ayıralım! |
| 8 | `vo.g1.turkce.kutu.dogal` | `assets/audio/voice/g1/turkce/kutu/dogal.wav` | ANLATICI | Doğadan gelen sesler |
| 9 | `vo.g1.turkce.kutu.yapay` | `assets/audio/voice/g1/turkce/kutu/yapay.wav` | ANLATICI | İnsanların yaptığı şeylerin sesleri |
| 10 | `vo.g1.turkce.u01.n02.r01` | `assets/audio/voice/g1/turkce/u01/n02/r01.wav` | ANLATICI | Bu sesler doğadan mı geliyor, insanların yaptığı şeylerden mi? Her resmi doğru kutuya taşı. |
| 11 | `vo.g1.turkce.u01.n02.r02` | `assets/audio/voice/g1/turkce/u01/n02/r02.wav` | ANLATICI | Doğadan gelen sesleri yaprak kutusuna, makinelerin seslerini çark kutusuna taşı. |
| 12 | `vo.g1.turkce.u01.n02.r03` | `assets/audio/voice/g1/turkce/u01/n02/r03.wav` | ANLATICI | Dinle, düşün ve ayır! Doğal sesler bir kutuya, yapay sesler öbür kutuya. |
| 13 | `vo.g1.turkce.u01.n03.intro` | `assets/audio/voice/g1/turkce/u01/n03/intro.wav` | BILGE | Kalemini hazırla! Önce çizgilerle ısınalım. |
| 14 | `vo.g1.turkce.u01.n03.r01` | `assets/audio/voice/g1/turkce/u01/n03/r01.wav` | ANLATICI | Yukarıdan aşağıya düz bir çizgi çiz! Yeşil noktadan başla. |
| 15 | `vo.g1.turkce.u01.n03.r02` | `assets/audio/voice/g1/turkce/u01/n03/r02.wav` | ANLATICI | Soldan sağa yatay bir çizgi çiz! Yeşil noktadan başla. |
| 16 | `vo.g1.turkce.u01.n03.r03` | `assets/audio/voice/g1/turkce/u01/n03/r03.wav` | ANLATICI | Şimdi iki eğik çizgi çiz! Oku izle. |
| 17 | `vo.g1.turkce.u01.n03.r04` | `assets/audio/voice/g1/turkce/u01/n03/r04.wav` | ANLATICI | Kocaman bir yuvarlak çiz! Yeşil noktadan başla, oku izle. |
| 18 | `vo.g1.turkce.u02.n01.intro` | `assets/audio/voice/g1/turkce/u02/n01/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: a! Arı sözcüğünde a sesini duyuyor musun? |
| 19 | `vo.g1.turkce.u02.n01.r01` | `assets/audio/voice/g1/turkce/u02/n01/r01.wav` | ANLATICI | Hangi resmin adında a sesi var? Dinle ve resme dokun. |
| 20 | `vo.g1.turkce.u02.n01.r02` | `assets/audio/voice/g1/turkce/u02/n01/r02.wav` | ANLATICI | Bir resim daha! Adında a sesi olan resme dokun. |
| 21 | `vo.g1.turkce.u02.n01.r03` | `assets/audio/voice/g1/turkce/u02/n01/r03.wav` | ANLATICI | Küçük a harfini yaz! Yeşil noktadan başla, oku izle. |
| 22 | `vo.g1.turkce.u02.n01.r04` | `assets/audio/voice/g1/turkce/u02/n01/r04.wav` | ANLATICI | Şimdi büyük A harfini yaz! Yeşil noktadan başla. |
| 23 | `vo.g1.turkce.u02.n02.intro` | `assets/audio/voice/g1/turkce/u02/n02/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: n! Nar sözcüğünde n sesini duyuyor musun? |
| 24 | `vo.g1.turkce.u02.n02.r01` | `assets/audio/voice/g1/turkce/u02/n02/r01.wav` | ANLATICI | Hangi resmin adında n sesi var? Dinle ve resme dokun. |
| 25 | `vo.g1.turkce.u02.n02.r02` | `assets/audio/voice/g1/turkce/u02/n02/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 26 | `vo.g1.turkce.u02.n02.r03` | `assets/audio/voice/g1/turkce/u02/n02/r03.wav` | ANLATICI | Küçük n harfini yaz! Yeşil noktadan başla, oku izle. |
| 27 | `vo.g1.turkce.u02.n02.r04` | `assets/audio/voice/g1/turkce/u02/n02/r04.wav` | ANLATICI | Şimdi büyük N harfini yaz! Yeşil noktadan başla. |
| 28 | `vo.g1.turkce.u02.n02.r05` | `assets/audio/voice/g1/turkce/u02/n02/r05.wav` | ANLATICI | Harfleri sırayla seç, an hecesini yaz! |
| 29 | `vo.g1.turkce.u02.n03.intro` | `assets/audio/voice/g1/turkce/u02/n03/intro.wav` | BILGE | Rakam yazma zamanı! Bugün bir, iki rakamlarını yazacağız. |
| 30 | `vo.g1.turkce.u02.n03.r01` | `assets/audio/voice/g1/turkce/u02/n03/r01.wav` | ANLATICI | Bir rakamını yaz! Yeşil noktadan başla. |
| 31 | `vo.g1.turkce.u02.n03.r02` | `assets/audio/voice/g1/turkce/u02/n03/r02.wav` | ANLATICI | İki rakamını yaz! Yeşil noktadan başla. |
| 32 | `vo.g1.turkce.u02.n03.r03` | `assets/audio/voice/g1/turkce/u02/n03/r03.wav` | ANLATICI | Dinle ve duyduğun rakama dokun! |
| 33 | `vo.g1.turkce.u02.n03.r04` | `assets/audio/voice/g1/turkce/u02/n03/r04.wav` | ANLATICI | Dinle ve duyduğun rakama dokun! |
| 34 | `vo.g1.turkce.u02.n04.intro` | `assets/audio/voice/g1/turkce/u02/n04/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: e! Ev sözcüğünde e sesini duyuyor musun? |
| 35 | `vo.g1.turkce.u02.n04.r01` | `assets/audio/voice/g1/turkce/u02/n04/r01.wav` | ANLATICI | Hangi resmin adında e sesi var? Dinle ve resme dokun. |
| 36 | `vo.g1.turkce.u02.n04.r02` | `assets/audio/voice/g1/turkce/u02/n04/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 37 | `vo.g1.turkce.u02.n04.r03` | `assets/audio/voice/g1/turkce/u02/n04/r03.wav` | ANLATICI | Küçük e harfini yaz! Yeşil noktadan başla, oku izle. |
| 38 | `vo.g1.turkce.u02.n04.r04` | `assets/audio/voice/g1/turkce/u02/n04/r04.wav` | ANLATICI | Şimdi büyük E harfini yaz! Yeşil noktadan başla. |
| 39 | `vo.g1.turkce.u02.n04.r05` | `assets/audio/voice/g1/turkce/u02/n04/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, anne sözcüğünü yaz! |
| 40 | `vo.g1.turkce.u02.n05.intro` | `assets/audio/voice/g1/turkce/u02/n05/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: t! Top sözcüğünde t sesini duyuyor musun? |
| 41 | `vo.g1.turkce.u02.n05.r01` | `assets/audio/voice/g1/turkce/u02/n05/r01.wav` | ANLATICI | Hangi resmin adında t sesi var? Dinle ve resme dokun. |
| 42 | `vo.g1.turkce.u02.n05.r02` | `assets/audio/voice/g1/turkce/u02/n05/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 43 | `vo.g1.turkce.u02.n05.r03` | `assets/audio/voice/g1/turkce/u02/n05/r03.wav` | ANLATICI | Küçük t harfini yaz! Yeşil noktadan başla, oku izle. |
| 44 | `vo.g1.turkce.u02.n05.r04` | `assets/audio/voice/g1/turkce/u02/n05/r04.wav` | ANLATICI | Şimdi büyük T harfini yaz! Yeşil noktadan başla. |
| 45 | `vo.g1.turkce.u02.n05.r05` | `assets/audio/voice/g1/turkce/u02/n05/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, at sözcüğünü yaz! |
| 46 | `vo.g1.turkce.u02.n06.intro` | `assets/audio/voice/g1/turkce/u02/n06/intro.wav` | BILGE | Rakam yazma zamanı! Bugün üç, dört rakamlarını yazacağız. |
| 47 | `vo.g1.turkce.u02.n06.r01` | `assets/audio/voice/g1/turkce/u02/n06/r01.wav` | ANLATICI | Üç rakamını yaz! Yeşil noktadan başla. |
| 48 | `vo.g1.turkce.u02.n06.r02` | `assets/audio/voice/g1/turkce/u02/n06/r02.wav` | ANLATICI | Dört rakamını yaz! Yeşil noktadan başla. |
| 49 | `vo.g1.turkce.u02.n06.r03` | `assets/audio/voice/g1/turkce/u02/n06/r03.wav` | ANLATICI | Dinle ve duyduğun rakama dokun! |
| 50 | `vo.g1.turkce.u02.n06.r04` | `assets/audio/voice/g1/turkce/u02/n06/r04.wav` | ANLATICI | Dinle ve duyduğun rakama dokun! |
| 51 | `vo.g1.turkce.u02.n07.intro` | `assets/audio/voice/g1/turkce/u02/n07/intro.wav` | BILGE | Aferin! Artık a, n, e ve t ile sözcük okuyabiliriz. |
| 52 | `vo.g1.turkce.u02.n07.r01` | `assets/audio/voice/g1/turkce/u02/n07/r01.wav` | ANLATICI | Sözcükleri oku. Her sözcüğü resmiyle eşleştir! |
| 53 | `vo.g1.turkce.u02.n07.r02` | `assets/audio/voice/g1/turkce/u02/n07/r02.wav` | ANLATICI | Harfleri sırayla seç, et sözcüğünü yaz! |
| 54 | `vo.g1.turkce.u02.n07.r03` | `assets/audio/voice/g1/turkce/u02/n07/r03.wav` | ANLATICI | Sözcükleri sessizce oku ve resimlerine taşı! |
| 55 | `vo.g1.turkce.u02.n07.r04` | `assets/audio/voice/g1/turkce/u02/n07/r04.wav` | ANLATICI | Heceleri sırayla seç, anne sözcüğünü yaz! |
| 56 | `vo.g1.turkce.u03.n01.intro` | `assets/audio/voice/g1/turkce/u03/n01/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: i! İnek sözcüğünde i sesini duyuyor musun? |
| 57 | `vo.g1.turkce.u03.n01.r01` | `assets/audio/voice/g1/turkce/u03/n01/r01.wav` | ANLATICI | Hangi resmin adında i sesi var? Dinle ve resme dokun. |
| 58 | `vo.g1.turkce.u03.n01.r02` | `assets/audio/voice/g1/turkce/u03/n01/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 59 | `vo.g1.turkce.u03.n01.r03` | `assets/audio/voice/g1/turkce/u03/n01/r03.wav` | ANLATICI | Küçük i harfini yaz! Yeşil noktadan başla, oku izle. |
| 60 | `vo.g1.turkce.u03.n01.r04` | `assets/audio/voice/g1/turkce/u03/n01/r04.wav` | ANLATICI | Şimdi büyük İ harfini yaz! Yeşil noktadan başla. |
| 61 | `vo.g1.turkce.u03.n01.r05` | `assets/audio/voice/g1/turkce/u03/n01/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, nine sözcüğünü yaz! |
| 62 | `vo.g1.turkce.u03.n02.intro` | `assets/audio/voice/g1/turkce/u03/n02/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: l! Limon sözcüğünde l sesini duyuyor musun? |
| 63 | `vo.g1.turkce.u03.n02.r01` | `assets/audio/voice/g1/turkce/u03/n02/r01.wav` | ANLATICI | Hangi resmin adında l sesi var? Dinle ve resme dokun. |
| 64 | `vo.g1.turkce.u03.n02.r02` | `assets/audio/voice/g1/turkce/u03/n02/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 65 | `vo.g1.turkce.u03.n02.r03` | `assets/audio/voice/g1/turkce/u03/n02/r03.wav` | ANLATICI | Küçük l harfini yaz! Yeşil noktadan başla, oku izle. |
| 66 | `vo.g1.turkce.u03.n02.r04` | `assets/audio/voice/g1/turkce/u03/n02/r04.wav` | ANLATICI | Şimdi büyük L harfini yaz! Yeşil noktadan başla. |
| 67 | `vo.g1.turkce.u03.n02.r05` | `assets/audio/voice/g1/turkce/u03/n02/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, lale sözcüğünü yaz! |
| 68 | `vo.g1.turkce.u03.n03.intro` | `assets/audio/voice/g1/turkce/u03/n03/intro.wav` | BILGE | Birinci gruptaki bütün sesleri öğrendin! Şimdi sözcük okuyalım. |
| 69 | `vo.g1.turkce.u03.n03.r01` | `assets/audio/voice/g1/turkce/u03/n03/r01.wav` | ANLATICI | Sözcükleri oku ve resimleriyle eşleştir! |
| 70 | `vo.g1.turkce.u03.n03.r02` | `assets/audio/voice/g1/turkce/u03/n03/r02.wav` | ANLATICI | Sessizce oku. Her sözcüğü doğru resme taşı! |
| 71 | `vo.g1.turkce.u03.n03.r03` | `assets/audio/voice/g1/turkce/u03/n03/r03.wav` | ANLATICI | Harfleri sırayla seç, el sözcüğünü yaz! |
| 72 | `vo.g1.turkce.u03.n03.r04` | `assets/audio/voice/g1/turkce/u03/n03/r04.wav` | ANLATICI | Dört sözcük var! Oku ve resimleriyle eşleştir. |
| 73 | `vo.g1.turkce.u03.n04.intro` | `assets/audio/voice/g1/turkce/u03/n04/intro.wav` | BILGE | Rakam yazma zamanı! Bugün beş, altı, yedi rakamlarını yazacağız. |
| 74 | `vo.g1.turkce.u03.n04.r01` | `assets/audio/voice/g1/turkce/u03/n04/r01.wav` | ANLATICI | Beş rakamını yaz! Yeşil noktadan başla. |
| 75 | `vo.g1.turkce.u03.n04.r02` | `assets/audio/voice/g1/turkce/u03/n04/r02.wav` | ANLATICI | Altı rakamını yaz! Yeşil noktadan başla. |
| 76 | `vo.g1.turkce.u03.n04.r03` | `assets/audio/voice/g1/turkce/u03/n04/r03.wav` | ANLATICI | Yedi rakamını yaz! Yeşil noktadan başla. |
| 77 | `vo.g1.turkce.u03.n04.r04` | `assets/audio/voice/g1/turkce/u03/n04/r04.wav` | ANLATICI | Dinle ve duyduğun rakama dokun! |
| 78 | `vo.g1.turkce.u03.n04.r05` | `assets/audio/voice/g1/turkce/u03/n04/r05.wav` | ANLATICI | Dinle ve duyduğun rakama dokun! |
| 79 | `vo.g1.turkce.u03.n05.intro` | `assets/audio/voice/g1/turkce/u03/n05/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: o! Otobüs sözcüğünde o sesini duyuyor musun? |
| 80 | `vo.g1.turkce.u03.n05.r01` | `assets/audio/voice/g1/turkce/u03/n05/r01.wav` | ANLATICI | Hangi resmin adında o sesi var? Dinle ve resme dokun. |
| 81 | `vo.g1.turkce.u03.n05.r02` | `assets/audio/voice/g1/turkce/u03/n05/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 82 | `vo.g1.turkce.u03.n05.r03` | `assets/audio/voice/g1/turkce/u03/n05/r03.wav` | ANLATICI | Küçük o harfini yaz! Yeşil noktadan başla, oku izle. |
| 83 | `vo.g1.turkce.u03.n05.r04` | `assets/audio/voice/g1/turkce/u03/n05/r04.wav` | ANLATICI | Şimdi büyük O harfini yaz! Yeşil noktadan başla. |
| 84 | `vo.g1.turkce.u03.n05.r05` | `assets/audio/voice/g1/turkce/u03/n05/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, olta sözcüğünü yaz! |
| 85 | `vo.g1.turkce.u03.n06.intro` | `assets/audio/voice/g1/turkce/u03/n06/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: k! Kedi sözcüğünde k sesini duyuyor musun? |
| 86 | `vo.g1.turkce.u03.n06.r01` | `assets/audio/voice/g1/turkce/u03/n06/r01.wav` | ANLATICI | Hangi resmin adında k sesi var? Dinle ve resme dokun. |
| 87 | `vo.g1.turkce.u03.n06.r02` | `assets/audio/voice/g1/turkce/u03/n06/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 88 | `vo.g1.turkce.u03.n06.r03` | `assets/audio/voice/g1/turkce/u03/n06/r03.wav` | ANLATICI | Küçük k harfini yaz! Yeşil noktadan başla, oku izle. |
| 89 | `vo.g1.turkce.u03.n06.r04` | `assets/audio/voice/g1/turkce/u03/n06/r04.wav` | ANLATICI | Şimdi büyük K harfini yaz! Yeşil noktadan başla. |
| 90 | `vo.g1.turkce.u03.n06.r05` | `assets/audio/voice/g1/turkce/u03/n06/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, kale sözcüğünü yaz! |
| 91 | `vo.g1.turkce.u03.n07.intro` | `assets/audio/voice/g1/turkce/u03/n07/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: u! Uçak sözcüğünde u sesini duyuyor musun? |
| 92 | `vo.g1.turkce.u03.n07.r01` | `assets/audio/voice/g1/turkce/u03/n07/r01.wav` | ANLATICI | Hangi resmin adında u sesi var? Dinle ve resme dokun. |
| 93 | `vo.g1.turkce.u03.n07.r02` | `assets/audio/voice/g1/turkce/u03/n07/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 94 | `vo.g1.turkce.u03.n07.r03` | `assets/audio/voice/g1/turkce/u03/n07/r03.wav` | ANLATICI | Küçük u harfini yaz! Yeşil noktadan başla, oku izle. |
| 95 | `vo.g1.turkce.u03.n07.r04` | `assets/audio/voice/g1/turkce/u03/n07/r04.wav` | ANLATICI | Şimdi büyük U harfini yaz! Yeşil noktadan başla. |
| 96 | `vo.g1.turkce.u03.n07.r05` | `assets/audio/voice/g1/turkce/u03/n07/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, kutu sözcüğünü yaz! |
| 97 | `vo.g1.turkce.u03.n08.intro` | `assets/audio/voice/g1/turkce/u03/n08/intro.wav` | BILGE | Rakam yazma zamanı! Bugün sekiz, dokuz, sıfır rakamlarını yazacağız. |
| 98 | `vo.g1.turkce.u03.n08.r01` | `assets/audio/voice/g1/turkce/u03/n08/r01.wav` | ANLATICI | Sekiz rakamını yaz! Yeşil noktadan başla. |
| 99 | `vo.g1.turkce.u03.n08.r02` | `assets/audio/voice/g1/turkce/u03/n08/r02.wav` | ANLATICI | Dokuz rakamını yaz! Yeşil noktadan başla. |
| 100 | `vo.g1.turkce.u03.n08.r03` | `assets/audio/voice/g1/turkce/u03/n08/r03.wav` | ANLATICI | Sıfır rakamını yaz! Yeşil noktadan başla. |
| 101 | `vo.g1.turkce.u03.n08.r04` | `assets/audio/voice/g1/turkce/u03/n08/r04.wav` | ANLATICI | Dinle ve duyduğun rakama dokun! |
| 102 | `vo.g1.turkce.u03.n08.r05` | `assets/audio/voice/g1/turkce/u03/n08/r05.wav` | ANLATICI | Dinle ve duyduğun rakama dokun! |
| 103 | `vo.g1.turkce.u03.n09.intro` | `assets/audio/voice/g1/turkce/u03/n09/intro.wav` | BILGE | Artık cümle kurabiliriz! Sözcükleri yan yana dizelim. |
| 104 | `vo.g1.turkce.u03.n09.r01` | `assets/audio/voice/g1/turkce/u03/n09/r01.wav` | ANLATICI | Sözcük kartlarını sırala, cümleyi kur! |
| 105 | `vo.g1.turkce.u03.n09.r02` | `assets/audio/voice/g1/turkce/u03/n09/r02.wav` | ANLATICI | Sözcükleri doğru sıraya koy, cümleyi kur! |
| 106 | `vo.g1.turkce.u03.n09.r03` | `assets/audio/voice/g1/turkce/u03/n09/r03.wav` | ANLATICI | Cümleleri sessizce oku. Her cümleyi resmiyle eşleştir! |
| 107 | `vo.g1.turkce.u03.n09.r04` | `assets/audio/voice/g1/turkce/u03/n09/r04.wav` | ANLATICI | Heceleri sırayla seç, okul sözcüğünü yaz! |
| 108 | `vo.g1.turkce.u04.n01.intro` | `assets/audio/voice/g1/turkce/u04/n01/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: r! Robot sözcüğünde r sesini duyuyor musun? |
| 109 | `vo.g1.turkce.u04.n01.r01` | `assets/audio/voice/g1/turkce/u04/n01/r01.wav` | ANLATICI | Hangi resmin adında r sesi var? Dinle ve resme dokun. |
| 110 | `vo.g1.turkce.u04.n01.r02` | `assets/audio/voice/g1/turkce/u04/n01/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 111 | `vo.g1.turkce.u04.n01.r03` | `assets/audio/voice/g1/turkce/u04/n01/r03.wav` | ANLATICI | Küçük r harfini yaz! Yeşil noktadan başla, oku izle. |
| 112 | `vo.g1.turkce.u04.n01.r04` | `assets/audio/voice/g1/turkce/u04/n01/r04.wav` | ANLATICI | Şimdi büyük R harfini yaz! Yeşil noktadan başla. |
| 113 | `vo.g1.turkce.u04.n01.r05` | `assets/audio/voice/g1/turkce/u04/n01/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, tarak sözcüğünü yaz! |
| 114 | `vo.g1.turkce.u04.n02.intro` | `assets/audio/voice/g1/turkce/u04/n02/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: ı! Irmak sözcüğünde ı sesini duyuyor musun? |
| 115 | `vo.g1.turkce.u04.n02.r01` | `assets/audio/voice/g1/turkce/u04/n02/r01.wav` | ANLATICI | Hangi resmin adında ı sesi var? Dinle ve resme dokun. |
| 116 | `vo.g1.turkce.u04.n02.r02` | `assets/audio/voice/g1/turkce/u04/n02/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 117 | `vo.g1.turkce.u04.n02.r03` | `assets/audio/voice/g1/turkce/u04/n02/r03.wav` | ANLATICI | Küçük ı harfini yaz! Yeşil noktadan başla, oku izle. |
| 118 | `vo.g1.turkce.u04.n02.r04` | `assets/audio/voice/g1/turkce/u04/n02/r04.wav` | ANLATICI | Şimdi büyük I harfini yaz! Yeşil noktadan başla. |
| 119 | `vo.g1.turkce.u04.n02.r05` | `assets/audio/voice/g1/turkce/u04/n02/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, arı sözcüğünü yaz! |
| 120 | `vo.g1.turkce.u04.n03.intro` | `assets/audio/voice/g1/turkce/u04/n03/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: m! Mantar sözcüğünde m sesini duyuyor musun? |
| 121 | `vo.g1.turkce.u04.n03.r01` | `assets/audio/voice/g1/turkce/u04/n03/r01.wav` | ANLATICI | Hangi resmin adında m sesi var? Dinle ve resme dokun. |
| 122 | `vo.g1.turkce.u04.n03.r02` | `assets/audio/voice/g1/turkce/u04/n03/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 123 | `vo.g1.turkce.u04.n03.r03` | `assets/audio/voice/g1/turkce/u04/n03/r03.wav` | ANLATICI | Küçük m harfini yaz! Yeşil noktadan başla, oku izle. |
| 124 | `vo.g1.turkce.u04.n03.r04` | `assets/audio/voice/g1/turkce/u04/n03/r04.wav` | ANLATICI | Şimdi büyük M harfini yaz! Yeşil noktadan başla. |
| 125 | `vo.g1.turkce.u04.n03.r05` | `assets/audio/voice/g1/turkce/u04/n03/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, elma sözcüğünü yaz! |
| 126 | `vo.g1.turkce.u04.n04.intro` | `assets/audio/voice/g1/turkce/u04/n04/intro.wav` | BILGE | İkinci grubu da bitirdin! Haydi okuyalım ve cümle kuralım. |
| 127 | `vo.g1.turkce.u04.n04.r01` | `assets/audio/voice/g1/turkce/u04/n04/r01.wav` | ANLATICI | Sözcükleri sessizce oku ve resimleriyle eşleştir! |
| 128 | `vo.g1.turkce.u04.n04.r02` | `assets/audio/voice/g1/turkce/u04/n04/r02.wav` | ANLATICI | Sözcük kartlarını sırala, cümleyi kur! |
| 129 | `vo.g1.turkce.u04.n04.r03` | `assets/audio/voice/g1/turkce/u04/n04/r03.wav` | ANLATICI | Cümleyi kur! İlk sözcük büyük harfle başlar. |
| 130 | `vo.g1.turkce.u04.n04.r04` | `assets/audio/voice/g1/turkce/u04/n04/r04.wav` | ANLATICI | Dört sözcüğü oku ve doğru resimlere taşı! |
| 131 | `vo.g1.turkce.u04.n05.intro` | `assets/audio/voice/g1/turkce/u04/n05/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: ü! Üzüm sözcüğünde ü sesini duyuyor musun? |
| 132 | `vo.g1.turkce.u04.n05.r01` | `assets/audio/voice/g1/turkce/u04/n05/r01.wav` | ANLATICI | Hangi resmin adında ü sesi var? Dinle ve resme dokun. |
| 133 | `vo.g1.turkce.u04.n05.r02` | `assets/audio/voice/g1/turkce/u04/n05/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 134 | `vo.g1.turkce.u04.n05.r03` | `assets/audio/voice/g1/turkce/u04/n05/r03.wav` | ANLATICI | Küçük ü harfini yaz! Yeşil noktadan başla, oku izle. |
| 135 | `vo.g1.turkce.u04.n05.r04` | `assets/audio/voice/g1/turkce/u04/n05/r04.wav` | ANLATICI | Şimdi büyük Ü harfini yaz! Yeşil noktadan başla. |
| 136 | `vo.g1.turkce.u04.n05.r05` | `assets/audio/voice/g1/turkce/u04/n05/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, ütü sözcüğünü yaz! |
| 137 | `vo.g1.turkce.u04.n06.intro` | `assets/audio/voice/g1/turkce/u04/n06/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: s! Saat sözcüğünde s sesini duyuyor musun? |
| 138 | `vo.g1.turkce.u04.n06.r01` | `assets/audio/voice/g1/turkce/u04/n06/r01.wav` | ANLATICI | Hangi resmin adında s sesi var? Dinle ve resme dokun. |
| 139 | `vo.g1.turkce.u04.n06.r02` | `assets/audio/voice/g1/turkce/u04/n06/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 140 | `vo.g1.turkce.u04.n06.r03` | `assets/audio/voice/g1/turkce/u04/n06/r03.wav` | ANLATICI | Küçük s harfini yaz! Yeşil noktadan başla, oku izle. |
| 141 | `vo.g1.turkce.u04.n06.r04` | `assets/audio/voice/g1/turkce/u04/n06/r04.wav` | ANLATICI | Şimdi büyük S harfini yaz! Yeşil noktadan başla. |
| 142 | `vo.g1.turkce.u04.n06.r05` | `assets/audio/voice/g1/turkce/u04/n06/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, masa sözcüğünü yaz! |
| 143 | `vo.g1.turkce.u04.n07.intro` | `assets/audio/voice/g1/turkce/u04/n07/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: ö! Ördek sözcüğünde ö sesini duyuyor musun? |
| 144 | `vo.g1.turkce.u04.n07.r01` | `assets/audio/voice/g1/turkce/u04/n07/r01.wav` | ANLATICI | Hangi resmin adında ö sesi var? Dinle ve resme dokun. |
| 145 | `vo.g1.turkce.u04.n07.r02` | `assets/audio/voice/g1/turkce/u04/n07/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 146 | `vo.g1.turkce.u04.n07.r03` | `assets/audio/voice/g1/turkce/u04/n07/r03.wav` | ANLATICI | Küçük ö harfini yaz! Yeşil noktadan başla, oku izle. |
| 147 | `vo.g1.turkce.u04.n07.r04` | `assets/audio/voice/g1/turkce/u04/n07/r04.wav` | ANLATICI | Şimdi büyük Ö harfini yaz! Yeşil noktadan başla. |
| 148 | `vo.g1.turkce.u04.n07.r05` | `assets/audio/voice/g1/turkce/u04/n07/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, örtü sözcüğünü yaz! |
| 149 | `vo.g1.turkce.u04.n08.intro` | `assets/audio/voice/g1/turkce/u04/n08/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: y! Yumurta sözcüğünde y sesini duyuyor musun? |
| 150 | `vo.g1.turkce.u04.n08.r01` | `assets/audio/voice/g1/turkce/u04/n08/r01.wav` | ANLATICI | Hangi resmin adında y sesi var? Dinle ve resme dokun. |
| 151 | `vo.g1.turkce.u04.n08.r02` | `assets/audio/voice/g1/turkce/u04/n08/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 152 | `vo.g1.turkce.u04.n08.r03` | `assets/audio/voice/g1/turkce/u04/n08/r03.wav` | ANLATICI | Küçük y harfini yaz! Yeşil noktadan başla, oku izle. |
| 153 | `vo.g1.turkce.u04.n08.r04` | `assets/audio/voice/g1/turkce/u04/n08/r04.wav` | ANLATICI | Şimdi büyük Y harfini yaz! Yeşil noktadan başla. |
| 154 | `vo.g1.turkce.u04.n08.r05` | `assets/audio/voice/g1/turkce/u04/n08/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, ayı sözcüğünü yaz! |
| 155 | `vo.g1.turkce.u04.n09.intro` | `assets/audio/voice/g1/turkce/u04/n09/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: d! Davul sözcüğünde d sesini duyuyor musun? |
| 156 | `vo.g1.turkce.u04.n09.r01` | `assets/audio/voice/g1/turkce/u04/n09/r01.wav` | ANLATICI | Hangi resmin adında d sesi var? Dinle ve resme dokun. |
| 157 | `vo.g1.turkce.u04.n09.r02` | `assets/audio/voice/g1/turkce/u04/n09/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 158 | `vo.g1.turkce.u04.n09.r03` | `assets/audio/voice/g1/turkce/u04/n09/r03.wav` | ANLATICI | Küçük d harfini yaz! Yeşil noktadan başla, oku izle. |
| 159 | `vo.g1.turkce.u04.n09.r04` | `assets/audio/voice/g1/turkce/u04/n09/r04.wav` | ANLATICI | Şimdi büyük D harfini yaz! Yeşil noktadan başla. |
| 160 | `vo.g1.turkce.u04.n09.r05` | `assets/audio/voice/g1/turkce/u04/n09/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, kedi sözcüğünü yaz! |
| 161 | `vo.g1.turkce.u04.n10.intro` | `assets/audio/voice/g1/turkce/u04/n10/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: z! Zürafa sözcüğünde z sesini duyuyor musun? |
| 162 | `vo.g1.turkce.u04.n10.r01` | `assets/audio/voice/g1/turkce/u04/n10/r01.wav` | ANLATICI | Hangi resmin adında z sesi var? Dinle ve resme dokun. |
| 163 | `vo.g1.turkce.u04.n10.r02` | `assets/audio/voice/g1/turkce/u04/n10/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 164 | `vo.g1.turkce.u04.n10.r03` | `assets/audio/voice/g1/turkce/u04/n10/r03.wav` | ANLATICI | Küçük z harfini yaz! Yeşil noktadan başla, oku izle. |
| 165 | `vo.g1.turkce.u04.n10.r04` | `assets/audio/voice/g1/turkce/u04/n10/r04.wav` | ANLATICI | Şimdi büyük Z harfini yaz! Yeşil noktadan başla. |
| 166 | `vo.g1.turkce.u04.n10.r05` | `assets/audio/voice/g1/turkce/u04/n10/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, üzüm sözcüğünü yaz! |
| 167 | `vo.g1.turkce.u04.n11.intro` | `assets/audio/voice/g1/turkce/u04/n11/intro.wav` | BILGE | Çok güzel! Şimdi kısa cümleler okuyalım. |
| 168 | `vo.g1.turkce.u04.n11.r01` | `assets/audio/voice/g1/turkce/u04/n11/r01.wav` | ANLATICI | Cümleleri sessizce oku. Her cümleyi resmiyle eşleştir! |
| 169 | `vo.g1.turkce.u04.n11.r02` | `assets/audio/voice/g1/turkce/u04/n11/r02.wav` | ANLATICI | Sözcükleri sırala, cümleyi kur! |
| 170 | `vo.g1.turkce.u04.n11.r03` | `assets/audio/voice/g1/turkce/u04/n11/r03.wav` | ANLATICI | Üç cümle var! Sessizce oku ve resimleriyle eşleştir. |
| 171 | `vo.g1.turkce.u04.n11.r04` | `assets/audio/voice/g1/turkce/u04/n11/r04.wav` | ANLATICI | Heceleri sırayla seç, deniz sözcüğünü yaz! |
| 172 | `vo.g1.turkce.u05.n01.intro` | `assets/audio/voice/g1/turkce/u05/n01/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: ç! Çiçek sözcüğünde ç sesini duyuyor musun? |
| 173 | `vo.g1.turkce.u05.n01.r01` | `assets/audio/voice/g1/turkce/u05/n01/r01.wav` | ANLATICI | Hangi resmin adında ç sesi var? Dinle ve resme dokun. |
| 174 | `vo.g1.turkce.u05.n01.r02` | `assets/audio/voice/g1/turkce/u05/n01/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 175 | `vo.g1.turkce.u05.n01.r03` | `assets/audio/voice/g1/turkce/u05/n01/r03.wav` | ANLATICI | Küçük ç harfini yaz! Yeşil noktadan başla, oku izle. |
| 176 | `vo.g1.turkce.u05.n01.r04` | `assets/audio/voice/g1/turkce/u05/n01/r04.wav` | ANLATICI | Şimdi büyük Ç harfini yaz! Yeşil noktadan başla. |
| 177 | `vo.g1.turkce.u05.n01.r05` | `assets/audio/voice/g1/turkce/u05/n01/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, çanta sözcüğünü yaz! |
| 178 | `vo.g1.turkce.u05.n02.intro` | `assets/audio/voice/g1/turkce/u05/n02/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: b! Balık sözcüğünde b sesini duyuyor musun? |
| 179 | `vo.g1.turkce.u05.n02.r01` | `assets/audio/voice/g1/turkce/u05/n02/r01.wav` | ANLATICI | Hangi resmin adında b sesi var? Dinle ve resme dokun. |
| 180 | `vo.g1.turkce.u05.n02.r02` | `assets/audio/voice/g1/turkce/u05/n02/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 181 | `vo.g1.turkce.u05.n02.r03` | `assets/audio/voice/g1/turkce/u05/n02/r03.wav` | ANLATICI | Küçük b harfini yaz! Yeşil noktadan başla, oku izle. |
| 182 | `vo.g1.turkce.u05.n02.r04` | `assets/audio/voice/g1/turkce/u05/n02/r04.wav` | ANLATICI | Şimdi büyük B harfini yaz! Yeşil noktadan başla. |
| 183 | `vo.g1.turkce.u05.n02.r05` | `assets/audio/voice/g1/turkce/u05/n02/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, bebek sözcüğünü yaz! |
| 184 | `vo.g1.turkce.u05.n03.intro` | `assets/audio/voice/g1/turkce/u05/n03/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: g! Gemi sözcüğünde g sesini duyuyor musun? |
| 185 | `vo.g1.turkce.u05.n03.r01` | `assets/audio/voice/g1/turkce/u05/n03/r01.wav` | ANLATICI | Hangi resmin adında g sesi var? Dinle ve resme dokun. |
| 186 | `vo.g1.turkce.u05.n03.r02` | `assets/audio/voice/g1/turkce/u05/n03/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 187 | `vo.g1.turkce.u05.n03.r03` | `assets/audio/voice/g1/turkce/u05/n03/r03.wav` | ANLATICI | Küçük g harfini yaz! Yeşil noktadan başla, oku izle. |
| 188 | `vo.g1.turkce.u05.n03.r04` | `assets/audio/voice/g1/turkce/u05/n03/r04.wav` | ANLATICI | Şimdi büyük G harfini yaz! Yeşil noktadan başla. |
| 189 | `vo.g1.turkce.u05.n03.r05` | `assets/audio/voice/g1/turkce/u05/n03/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, gözlük sözcüğünü yaz! |
| 190 | `vo.g1.turkce.u05.n04.intro` | `assets/audio/voice/g1/turkce/u05/n04/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: c! Ceket sözcüğünde c sesini duyuyor musun? |
| 191 | `vo.g1.turkce.u05.n04.r01` | `assets/audio/voice/g1/turkce/u05/n04/r01.wav` | ANLATICI | Hangi resmin adında c sesi var? Dinle ve resme dokun. |
| 192 | `vo.g1.turkce.u05.n04.r02` | `assets/audio/voice/g1/turkce/u05/n04/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 193 | `vo.g1.turkce.u05.n04.r03` | `assets/audio/voice/g1/turkce/u05/n04/r03.wav` | ANLATICI | Küçük c harfini yaz! Yeşil noktadan başla, oku izle. |
| 194 | `vo.g1.turkce.u05.n04.r04` | `assets/audio/voice/g1/turkce/u05/n04/r04.wav` | ANLATICI | Şimdi büyük C harfini yaz! Yeşil noktadan başla. |
| 195 | `vo.g1.turkce.u05.n04.r05` | `assets/audio/voice/g1/turkce/u05/n04/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, cüzdan sözcüğünü yaz! |
| 196 | `vo.g1.turkce.u05.n05.intro` | `assets/audio/voice/g1/turkce/u05/n05/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: ş! Şemsiye sözcüğünde ş sesini duyuyor musun? |
| 197 | `vo.g1.turkce.u05.n05.r01` | `assets/audio/voice/g1/turkce/u05/n05/r01.wav` | ANLATICI | Hangi resmin adında ş sesi var? Dinle ve resme dokun. |
| 198 | `vo.g1.turkce.u05.n05.r02` | `assets/audio/voice/g1/turkce/u05/n05/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 199 | `vo.g1.turkce.u05.n05.r03` | `assets/audio/voice/g1/turkce/u05/n05/r03.wav` | ANLATICI | Küçük ş harfini yaz! Yeşil noktadan başla, oku izle. |
| 200 | `vo.g1.turkce.u05.n05.r04` | `assets/audio/voice/g1/turkce/u05/n05/r04.wav` | ANLATICI | Şimdi büyük Ş harfini yaz! Yeşil noktadan başla. |
| 201 | `vo.g1.turkce.u05.n05.r05` | `assets/audio/voice/g1/turkce/u05/n05/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, güneş sözcüğünü yaz! |
| 202 | `vo.g1.turkce.u05.n06.intro` | `assets/audio/voice/g1/turkce/u05/n06/intro.wav` | BILGE | Harika gidiyorsun! Yeni cümleler seni bekliyor. |
| 203 | `vo.g1.turkce.u05.n06.r01` | `assets/audio/voice/g1/turkce/u05/n06/r01.wav` | ANLATICI | Cümleleri sessizce oku ve resimleriyle eşleştir! |
| 204 | `vo.g1.turkce.u05.n06.r02` | `assets/audio/voice/g1/turkce/u05/n06/r02.wav` | ANLATICI | Sözcükleri sırala, cümleyi kur! |
| 205 | `vo.g1.turkce.u05.n06.r03` | `assets/audio/voice/g1/turkce/u05/n06/r03.wav` | ANLATICI | Üç cümleyi oku. Her birini doğru resme taşı! |
| 206 | `vo.g1.turkce.u05.n06.r04` | `assets/audio/voice/g1/turkce/u05/n06/r04.wav` | ANLATICI | Heceleri sırayla seç, çocuk sözcüğünü yaz! |
| 207 | `vo.g1.turkce.u05.n07.intro` | `assets/audio/voice/g1/turkce/u05/n07/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: p! Portakal sözcüğünde p sesini duyuyor musun? |
| 208 | `vo.g1.turkce.u05.n07.r01` | `assets/audio/voice/g1/turkce/u05/n07/r01.wav` | ANLATICI | Hangi resmin adında p sesi var? Dinle ve resme dokun. |
| 209 | `vo.g1.turkce.u05.n07.r02` | `assets/audio/voice/g1/turkce/u05/n07/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 210 | `vo.g1.turkce.u05.n07.r03` | `assets/audio/voice/g1/turkce/u05/n07/r03.wav` | ANLATICI | Küçük p harfini yaz! Yeşil noktadan başla, oku izle. |
| 211 | `vo.g1.turkce.u05.n07.r04` | `assets/audio/voice/g1/turkce/u05/n07/r04.wav` | ANLATICI | Şimdi büyük P harfini yaz! Yeşil noktadan başla. |
| 212 | `vo.g1.turkce.u05.n07.r05` | `assets/audio/voice/g1/turkce/u05/n07/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, kirpi sözcüğünü yaz! |
| 213 | `vo.g1.turkce.u05.n08.intro` | `assets/audio/voice/g1/turkce/u05/n08/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: h! Horoz sözcüğünde h sesini duyuyor musun? |
| 214 | `vo.g1.turkce.u05.n08.r01` | `assets/audio/voice/g1/turkce/u05/n08/r01.wav` | ANLATICI | Hangi resmin adında h sesi var? Dinle ve resme dokun. |
| 215 | `vo.g1.turkce.u05.n08.r02` | `assets/audio/voice/g1/turkce/u05/n08/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 216 | `vo.g1.turkce.u05.n08.r03` | `assets/audio/voice/g1/turkce/u05/n08/r03.wav` | ANLATICI | Küçük h harfini yaz! Yeşil noktadan başla, oku izle. |
| 217 | `vo.g1.turkce.u05.n08.r04` | `assets/audio/voice/g1/turkce/u05/n08/r04.wav` | ANLATICI | Şimdi büyük H harfini yaz! Yeşil noktadan başla. |
| 218 | `vo.g1.turkce.u05.n08.r05` | `assets/audio/voice/g1/turkce/u05/n08/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, halı sözcüğünü yaz! |
| 219 | `vo.g1.turkce.u05.n09.intro` | `assets/audio/voice/g1/turkce/u05/n09/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: v! Vazo sözcüğünde v sesini duyuyor musun? |
| 220 | `vo.g1.turkce.u05.n09.r01` | `assets/audio/voice/g1/turkce/u05/n09/r01.wav` | ANLATICI | Hangi resmin adında v sesi var? Dinle ve resme dokun. |
| 221 | `vo.g1.turkce.u05.n09.r02` | `assets/audio/voice/g1/turkce/u05/n09/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 222 | `vo.g1.turkce.u05.n09.r03` | `assets/audio/voice/g1/turkce/u05/n09/r03.wav` | ANLATICI | Küçük v harfini yaz! Yeşil noktadan başla, oku izle. |
| 223 | `vo.g1.turkce.u05.n09.r04` | `assets/audio/voice/g1/turkce/u05/n09/r04.wav` | ANLATICI | Şimdi büyük V harfini yaz! Yeşil noktadan başla. |
| 224 | `vo.g1.turkce.u05.n09.r05` | `assets/audio/voice/g1/turkce/u05/n09/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, havuç sözcüğünü yaz! |
| 225 | `vo.g1.turkce.u05.n10.intro` | `assets/audio/voice/g1/turkce/u05/n10/intro.wav` | BILGE | Yeni bir harf öğreniyoruz: yumuşak g! Dağ sözcüğünün sonunda saklanıyor. |
| 226 | `vo.g1.turkce.u05.n10.r01` | `assets/audio/voice/g1/turkce/u05/n10/r01.wav` | ANLATICI | Hangi resmin adında yumuşak g var? Dinle ve resme dokun. |
| 227 | `vo.g1.turkce.u05.n10.r02` | `assets/audio/voice/g1/turkce/u05/n10/r02.wav` | ANLATICI | Yumuşak g hangisi? Dinle ve harfe dokun. |
| 228 | `vo.g1.turkce.u05.n10.r03` | `assets/audio/voice/g1/turkce/u05/n10/r03.wav` | ANLATICI | Küçük ğ harfini yaz! Yeşil noktadan başla, oku izle. |
| 229 | `vo.g1.turkce.u05.n10.r04` | `assets/audio/voice/g1/turkce/u05/n10/r04.wav` | ANLATICI | Şimdi büyük Ğ harfini yaz! Yeşil noktadan başla. |
| 230 | `vo.g1.turkce.u05.n10.r05` | `assets/audio/voice/g1/turkce/u05/n10/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, ağaç sözcüğünü yaz! |
| 231 | `vo.g1.turkce.u05.n11.intro` | `assets/audio/voice/g1/turkce/u05/n11/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: f! Fil sözcüğünde f sesini duyuyor musun? |
| 232 | `vo.g1.turkce.u05.n11.r01` | `assets/audio/voice/g1/turkce/u05/n11/r01.wav` | ANLATICI | Hangi resmin adında f sesi var? Dinle ve resme dokun. |
| 233 | `vo.g1.turkce.u05.n11.r02` | `assets/audio/voice/g1/turkce/u05/n11/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 234 | `vo.g1.turkce.u05.n11.r03` | `assets/audio/voice/g1/turkce/u05/n11/r03.wav` | ANLATICI | Küçük f harfini yaz! Yeşil noktadan başla, oku izle. |
| 235 | `vo.g1.turkce.u05.n11.r04` | `assets/audio/voice/g1/turkce/u05/n11/r04.wav` | ANLATICI | Şimdi büyük F harfini yaz! Yeşil noktadan başla. |
| 236 | `vo.g1.turkce.u05.n11.r05` | `assets/audio/voice/g1/turkce/u05/n11/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, fare sözcüğünü yaz! |
| 237 | `vo.g1.turkce.u05.n12.intro` | `assets/audio/voice/g1/turkce/u05/n12/intro.wav` | BILGE | Yeni bir ses öğreniyoruz: j! Jöle sözcüğünde j sesini duyuyor musun? |
| 238 | `vo.g1.turkce.u05.n12.r01` | `assets/audio/voice/g1/turkce/u05/n12/r01.wav` | ANLATICI | Hangi resmin adında j sesi var? Dinle ve resme dokun. |
| 239 | `vo.g1.turkce.u05.n12.r02` | `assets/audio/voice/g1/turkce/u05/n12/r02.wav` | ANLATICI | Bu ses hangi harf? Dinle ve harfe dokun. |
| 240 | `vo.g1.turkce.u05.n12.r03` | `assets/audio/voice/g1/turkce/u05/n12/r03.wav` | ANLATICI | Küçük j harfini yaz! Yeşil noktadan başla, oku izle. |
| 241 | `vo.g1.turkce.u05.n12.r04` | `assets/audio/voice/g1/turkce/u05/n12/r04.wav` | ANLATICI | Şimdi büyük J harfini yaz! Yeşil noktadan başla. |
| 242 | `vo.g1.turkce.u05.n12.r05` | `assets/audio/voice/g1/turkce/u05/n12/r05.wav` | ANLATICI | Resme bak. Parçaları sırayla seç, pijama sözcüğünü yaz! |
| 243 | `vo.g1.turkce.u05.n13.intro` | `assets/audio/voice/g1/turkce/u05/n13/intro.wav` | BILGE | Tebrikler! Bütün harfleri öğrendin. Artık her şeyi okuyabilirsin! |
| 244 | `vo.g1.turkce.u05.n13.r01` | `assets/audio/voice/g1/turkce/u05/n13/r01.wav` | ANLATICI | Cümleleri sessizce oku ve resimleriyle eşleştir! |
| 245 | `vo.g1.turkce.u05.n13.r02` | `assets/audio/voice/g1/turkce/u05/n13/r02.wav` | ANLATICI | Sözcükleri sırala, cümleyi kur! |
| 246 | `vo.g1.turkce.u05.n13.r03` | `assets/audio/voice/g1/turkce/u05/n13/r03.wav` | ANLATICI | Üç cümleyi oku. Her birini doğru resme taşı! |
| 247 | `vo.g1.turkce.u05.n13.r04` | `assets/audio/voice/g1/turkce/u05/n13/r04.wav` | ANLATICI | Heceleri sırayla seç, kaplumbağa sözcüğünü yaz! |

---
## Teslim kontrol listesi
- [ ] Dosya adı ve yolu tablodaki ile birebir aynı
- [ ] Telaffuz ve tempo dinlenerek kontrol edildi
- [ ] Commit: `assets: 065 g1 turkce u01 u05 seslendirme`
