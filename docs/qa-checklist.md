# QA kontrol listesi — Faz 1 dikey dilim (gerçek Android cihaz)

Her maddeyi sırayla uygula; "Beklenen" ile uyuşmayan her şeyi not al.

## 0. Kurulum
1. GitHub'da PR #1 -> **Checks** -> **CI** -> **Artifacts** -> `bilgi-adasi-debug-apk` dosyasını indir, zip'ten çıkar.
2. APK'yı cihaza aktar, "bilinmeyen kaynaklardan kurulum" iznini ver ve kur. Beklenen: uygulama "Bilgi Adası" adıyla kurulur.
3. **İnternet izni yok:** Ayarlar -> Uygulamalar -> Bilgi Adası -> İzinler. Beklenen: hiçbir izin listelenmez (özellikle ağ/internet yok). SDK varsa: `aapt dump permissions bilgi-adasi-debug.apk` çıktısında `INTERNET` bulunmamalı.

## 1. İlk açılış ve profil
1. Uygulamayı aç. Beklenen: açılış ekranı, ardından Bilge'nin "hoş geldin" sesi (ya da Türkçe TTS yedeği).
2. Profil oluştur: avatar seç (ör. tavşan) -> sınıf: 1 -> takma ad (en fazla 12 karakter). Beklenen: her adımda yönerge sesi gelir; sonunda dünya haritası açılır.
3. Haritada yalnızca Sayı Ormanı açık, Keşif Laboratuvarı kilitli (1. sınıf). Kilitli bölgeye dokun: kilit sesi gelir, ekran değişmez.

## 2. Oyun hissi
1. Sayı Ormanı -> ilk durak. Beklenen: yönerge okunur, nesneler ekranda çakışmadan durur.
2. **Dokunma hedefleri:** seçenek kutuları ve düğmeler çocuk parmağıyla rahat basılıyor mu? Yanlış yere basma oluyor mu?
3. **Sürükle-bırak:** ikinci durağa geç (ilk durağı bitirince açılır). Çubuğu sağdaki sayıya sürükle. Beklenen: parmağı takip eder, doğru yuvada oturur, yanlışta geri döner; takılma yok.
4. Yanlış cevap akışı: 1. yanlış -> yönerge tekrar; 2. yanlış -> ipucu; 3. yanlış -> çözüm gösterilir. Ceza, can kaybı ya da süre baskısı olmamalı.
5. Tüm turları doğru bitir. Beklenen: 3 yıldız, çıkartma sesi, "devam" ile patikada sonraki durak açılır. Çıkartma albümünde yeni çıkartma görünür.
6. Her ekranda yönergeyi tekrar dinleme düğmesi çalışır.

## 3. Türkçe TTS yedeği
1. Ayarlar -> Sistem -> Metin okuma (Text-to-speech) -> kurulu Türkçe ses olduğunu doğrula. Beklenen: asset sesi olmayan satırlar Türkçe okunur (doğru telaffuz, anlaşılır).
2. Türkçe ses **yoksa** (ya da kaldır/devre dışı bırak): satırlar sessiz kalmamalı; ekranda altyazı balonu görünmeli.

## 4. Süre sınırı
1. Veli paneli (aşağıda) -> Günlük oyun süresi: **10 dk**.
2. Çocuk profiliyle oyna ve 10 dakika bekle. Beklenen: süre dolunca **mevcut tur biter**, ardından Bilge'nin uyku ekranı gelir; oyun devam ettirilemez.
3. Uyku ekranından çıkıp uygulamayı kapat-aç, aynı profili seç. Beklenen: aynı gün yine uyku ekranı.
4. Panelde "Bugünlük süreyi aç" ile kilit kalkar.
5. **Cihaz başına sınır (Faz 7a):** süre dolunca profil seçimine dön, başka bir profil seç. Beklenen: o profil de uyku ekranına gider; süre bütün profiller için ortaktır.
6. **Günü sıfırla (Faz 7a):** cihaz tarihini 2 gün ileri al, oyna, sonra tarihi bugüne geri getir. Veli paneli -> "Günü sıfırla". Beklenen: "Oyun günü bugüne döndürüldü." mesajı; süre sınırı bugünün sayacıyla yeniden işler.

## 5. Veli kapısı
1. Profil seçim ekranında dişli simgesine dokun. Beklenen: aritmetik soru çıkar.
2. Çocuğa (ya da kendine) tahminle rastgele cevap verdir. Beklenen: yanlış cevapla geçilmez; art arda tahminle sonuç elde edilemez, soru değişir.
3. Doğru cevap -> veli paneli açılır.

## 6. Veli paneli
1. **Hareketi azalt:** aç, oyna. Beklenen: zıplama/sallanma animasyonları belirgin biçimde azalır.
2. **1. sınıfta ekran metni göster:** aç/kapat. Beklenen: 1. sınıf profilinde ekran metni görünür/gizlenir.
3. **Yedeği dışa aktar:** Beklenen: "Yedek yazıldı: <yol>" mesajı. Dosya uygulamanın özel klasörüne yazılır (yol mesajda gösterilir); normal dosya yöneticisinden görünmeyebilir.
4. Bir profili sil, ardından **Yedeği içe aktar**. Beklenen: profil ve ilerleme geri gelir.
5. Ses seviyeleri (konuşma/müzik/efekt) kaydırıcıları anında etki eder.
6. **Faz 2 (müfredat verisi):** Veli paneli -> ilerleme: 1. sınıf Matematik çıktı metinleri görünür (`outcomes.json` şema değişikliği sonrası: `theme` yerine `themes`, yeni alanlar). Beklenen: çıktı metinleri eksiksiz ve doğru yazımla (`’`, `â`) listelenir; boş ya da kod görünen satır yok.

## 7. Dayanıklılık
1. **Ders ortasında kapat:** bir dersin 2. turunda uygulamayı son uygulamalardan kapat, yeniden aç. Beklenen: profil, tamamlanan duraklar ve çıkartmalar duruyor; kayıt bozulması uyarısı yok (en fazla yarım kalan ders baştan başlar).
2. **Uçak modu:** uçak modunu aç, uygulamayı baştan sona oyna (profil, ders, albüm, veli paneli). Beklenen: her şey tam çalışır; hiçbir yerde bağlantı hatası/istek yok.
3. **Yatay döndürme:** cihazı sağa/sola çevir. Beklenen: oyun yatay kalır, ekran bozulmadan ters yatayda da çalışır.

## 8. Asset yokken
Gerçek görsel/ses henüz yok. Beklenen: yer tutucular görünür, sesler TTS'e düşer; hiçbir ekran takılmaz ya da çökmez.

---

# Faz 3a — Altı yeni mini oyun şablonu

Bu şablonların henüz ünite içeriği yok (içerik Faz 2 matrisinden sonra yazılacak). Cihazda denemek için geliştirici bir test durağı ekler ya da `tools/ui_screenshots.gd` karelerine (29–43) bakılır. Her şablonda ortak kontroller:

- **Hata akışı:** 1. yanlış → yönerge tekrar; 2. yanlış → şablonun ipucu 1'i; 3. yanlış → çözüm kendiliğinden gösterilir ve tur biter. Hiçbir şablonda tur takılı kalmamalı.
- **Dokunma:** bütün düğmeler, kartlar, balonlar, çentik şeritleri, dilimler çocuk parmağıyla rahat basılıyor; yanlış hedefe basma olmuyor.
- **Hareketi azalt** açıkken salınım / zıplama / eğilme animasyonları kapanır ya da anında olur; hiçbir yerde yanıp sönme yok.
- **Renk körlüğü:** cihazda Ayarlar → Erişilebilirlik → Renk düzeltme (gri tonlama) açılınca da her soru çözülebiliyor.

## sequence (sıraya diz)
1. Kartı parmakla sürükle, doğru yuvaya bırak. Beklenen: kart yerine oturur; yanlış yuvada geri seker; yuva dışına bırakınca sessizce geri döner (yanlış sayılmaz).
2. Zorluk 1'de ilk (ve 4+ kartta son) kart baştan yerinde durur.
3. İpucu 1: sıradaki boş yuva ve ona ait kart parlar. Çözüm: kalan kartlar soldan sağa sırayla yerleşir.

## balloon_pop (balon patlat)
1. Balonlar yerinde hafifçe salınır; **ekrandan kaçmaz, kaybolmaz, hiçbir sayaç yok.** 1 dakika bekle: aynı balonlar aynı yerde.
2. Doğru balon yumuşak bir sesle patlar; yanlış balon yalnızca hafifçe sallanır ve yerinde kalır.
3. İpucu 1 (küçük sayılar): işlemin altında daire + kare modeli; çıkarmada son taneler çizili. Büyük sayılarda yanlış balonların yarısı soluklaşır.

## pattern (örüntüyü tamamla)
1. Şekil örüntüsü: şekiller (daire, üçgen, yıldız...) renkten bağımsız olarak da ayırt edilebiliyor.
2. Birden çok boşlukta boşluklar soldan sağa dolar; sayı örüntüsünde her boşlukta seçenekler yenilenir.
3. İpucu 1: ilk birim çerçevelenir (şekil) ya da terimler arasına "+5" gibi adım karoları gelir (sayı).

## balance (terazi ve sayı doğrusu)
1. Karşılaştırma: terazi başta mavi takozlar üstünde düz durur; doğru `<`, `=`, `>` seçilince takozlar çekilir ve terazi ağır yana eğilir. İpucu 1: takozlar yarıya iner, terazi biraz eğilir.
2. 1. sınıf nesne grupları (elma) iki kefede rahat sayılabiliyor.
3. Eksik değer: terazi başta eğik; doğru sayı "?" yerine oturunca terazi dengelenir.
4. Sayı doğrusu: işaretçi çentiğin tam üstünde; yerleştirmede doğru çentiğe dokunmak kolay (komşu çentiğe kaymıyor).

## clock_money (saat ve para)
1. Saat oku: rakamlar okunaklı, akrep kısa-kalın, yelkovan uzun-ince. Dijital seçenekler "3.30" biçiminde (bkz. Açık soru S2).
2. Saat kur: akrep ve yelkovan −/+ düğmeleri; yelkovan 12'yi geçince akrep de ilerler. Onay düğmesine basmadan cevap sayılmaz; yanlış onayda kurulan saat bozulmaz.
3. Para say: küpürlerin üstündeki "5 TL", "50 kr" yazıları okunaklı. İpucu 1: paralar büyükten küçüğe dizilir, altlarında ara toplamlar çıkar.
4. Para öde: cüzdandaki paraya dokununca tepsiye eklenir, tepsideki paraya dokununca geri çıkar; zorluk 1'de toplam canlı görünür.

## fraction_pizza (kesir pizzası)
1. Böl: "eş parçalara bölünmüş" pizza ile eşit olmayan bölmeler gözle rahat ayırt ediliyor.
2. Seç: dilime dokununca dilim dışa kayar, kalın kenar ve onay işareti alır; tekrar dokununca geri döner. 12 dilimli pizzada bile doğru dilim seçiliyor.
3. İpucu 1: dilimler sırayla vurgulanıp sesli sayılır, sonra pay parlar.

## Asset geldiğinde (parti 010)
1. `item.para.*`, `item.yiyecek.pizza`, `ui.clock_face` dosyaları eklenince yer tutucu çizimlerin yerini alır; değer etiketleri paraların ortasında, pizza dilimleri görselin çemberiyle örtüşüyor, kadran rakamları kenara taşmıyor.

# Faz 4a — Türkçe şablonları ve sessiz okuma

Bu şablonların henüz ünite içeriği yok (Faz 4b, 4c). Cihazda denemek için geliştirici bir test durağı ekler ya da `tools/ui_screenshots.gd` karelerine (44–55) bakılır. Faz 3a'daki ortak kontroller (hata akışı, dokunma, hareketi azalt, renk körlüğü) burada da geçerlidir.

## trace (iz sür)
1. Harfi parmakla izle: numaralı yeşil noktadan başla, iz yolu boyunca kaydır. Beklenen: parmağın arkasından mürekkep çıkar, vuruş bitince boyanır ve sıradaki vuruşun numaralı noktası belirir.
2. Başka bir yere basmak hiçbir şey yapmaz (yalnızca başlangıç noktası büyüyüp küçülür); yanlış sayılmaz.
3. Yoldan bilerek çok uzaklaş. Beklenen: yumuşak "boop", kalem vuruşu baştan sona yavaşça çizer; yarım kalan mürekkep silinmez, kalınan yerden devam edilebilir.
4. Tolerans: 6 yaşında bir çocuğun biraz titrek izi zorluk 1–2'de kabul ediliyor; sondan başa (ters yönde) izlemek kabul edilmiyor.
5. `i`, `j`, `ö`, `ü`, `İ` gibi noktalı harflerde nokta tek dokunuşla konuyor.
6. **Öğretmen gözden geçirmesi (açık soru):** 29 küçük, 29 büyük harf ve 10 rakamın vuruş sırası ve yönü sınıfta öğretilenle aynı mı? (`content/trace/glyphs.json`; özellikle `T`, `5`, `k`, `K`, `y`.) Farklı olanları listele.

## syllable_build (hece kur)
1. Karoya dokun: sıradaki yuvanın hecesiyse yuvaya uçar ve yeşile döner; değilse hafifçe sallanıp yerinde kalır.
2. Kelime tamamlanınca (ses satırı varsa) kelime okunur.
3. "baba" gibi aynı heceyi iki kez içeren kelimede iki "ba" karosundan hangisine basılsa da doğru sayılır.
4. Zorluk 1'de çeldirici karo yok, zorluk 3'te hepsi var; 5 parçalı bir kelimede bile karolar ekrana sığıyor.

## story (hikâye)
1. Dinleme kipi: her sayfa açılınca okunur; hoparlör sayfayı yeniden okutur; ok sayfayı çevirir (sayfa çevirme sesi).
2. Son sayfadan sonra soru seslendirilir; kitap düğmesi hikâyeye döndürür (yanlış sayılmaz).
3. Sayfa metni büyük ve okunaklı; uzun cümleler kutudan taşmıyor.
4. **Sessiz okuma:** yönerge ve soru okunur ama sayfa okunmaz, hoparlör görünmez. İlk cevaptan sonra hikâyeye dönünce hoparlör çıkar. 2. yanlışta sorunun dayandığı sayfa kendiliğinden okunur.

## drag_match (sessiz okuma kipi)
1. `read: silent` durakta sözcük kartını tutmak ilk cevaba kadar ses çıkarmaz; ilk cevaptan sonra tutunca sözcük okunur. 2. yanlışta sıradaki çiftin sözcüğü okunur.
2. Faz 1 ünitesindeki çetele–rakam eşleştirmesi eskisi gibi (kart tutunca ses yok).

## Asset geldiğinde (parti 015, 016)
1. `ui.trace_pencil` gelince yön ipucunda sarı top yerine kalem görünür; kalemin ucu iz yolunun üstünde ilerliyor.
2. `ui.page_next`, `ui.book` hikâye düğmelerinde kodla çizilen ok ve kitabın yerini alır; `sfx.page_turn` sayfa çevrilirken çalar.

## Faz 7a — Ağaç Evi, Tekrar Bulutu, veli paneli
1. **Ağaç Evi girişi:** haritada ortadaki ağaç eve dokun. Beklenen: "Bilge'nin Ağaç Evi" okunur, oda açılır. Hiç süs yokken Bilge "Ağaç evim şimdilik boş..." der; rafta kilitli bir yuva ve yıldız sayacı (ör. "2 / 5") görünür.
2. **Süs açılması:** toplam 5 yıldıza ulaşan durağı bitir. Beklenen: sonuç ekranında çıkartmadan sonra süs görseli çıkar ve Bilge "Ağaç evim için yeni bir süs kazandın!" der.
3. **Sürükle-düzenle:** Ağaç Evi'nde raftaki süsü parmakla odaya sürükle, bırak. Beklenen: süs bırakılan yerde kalır; parmağın altında hafifçe büyür (hareketi azalt açıkken büyümez). Süsü rafa geri sürükle: rafa döner. Uygulamayı kapat-aç: yerleşim korunur.
4. **Kilitli yuva:** kilide dokun. Beklenen: Bilge "Bu süs için biraz daha yıldız toplayalım!" der; ceza ya da bekleme yok.
5. **Tekrar Bulutu:** bir durağı 1 yıldızla bitir (çok yanlış yap) ya da ertesi gün 3 yıldızlı bir durağın patikasına gir. Beklenen: patikanın sağ üstünde Tekrar Bulutu belirir, Bilge "Tekrar Bulutu geldi!" der. Buluta dokun: 3 karışık tur oynanır; sonuçta yıldız görünür, "Tekrar oyna" düğmesi yoktur. "Devam" ile patikaya dönülür; iyi oynandıysa bulut kaybolur.
6. **Evde etkinlik önerileri:** veli paneli -> "Evde etkinlik önerileri". Beklenen: seçili profilin sınıfına göre ders başlıkları altında çıktı adı ve öneri metni listelenir; sınıf değişince liste değişir. Metinler doğru Türkçe yazımla ve çevrimdışı görünür.

## Asset geldiğinde (parti 023, 024)
1. `decor.*` görselleri eklenince rafta ve odada yer tutucuların yerini alır; süsler kırpılmadan ve aynı ışıkta görünür.
2. `vo.genel.tekrar_giris`, `vo.genel.agac_ev_bos`, `vo.genel.agac_ev_kilitli` kayıtları cihaz sesinin yerine çalar.

---

# Faz 5a — `sort_bins` ve `scenario` şablonları

Bu şablonların henüz ünite içeriği yok (içerik Faz 5b, 3c–3e ve 6'da gelir). Cihazda denemek için geliştirici bir test durağı ekler ya da `tools/ui_screenshots.gd` karelerine (60–63) bakılır. Faz 3a'daki ortak kontroller (hata akışı, dokunma, hareketi azalt, renk körlüğü) burada da geçerlidir.

## sort_bins (kutulara ayır)
1. Öğeyi parmakla sürükle, doğru kutuya bırak. Beklenen: öğe küçülerek kutunun iç bölmesine oturur; yanlış kutuda geri seker; kutu dışına bırakınca sessizce geri döner (yanlış sayılmaz).
2. Kutular hem şekil rozetiyle (kalp, kare, yıldız...) hem renkle ayrılıyor; gri tonlamada da hangi kutunun hangisi olduğu anlaşılıyor.
3. Kutuya (öğe sürüklemeden) dokununca etiketin adı okunur; cevap sayılmaz.
4. Zorluk 1'de her kutuda bir örnek öğe baştan durur; zorluk 3'te kutular boş başlar.
5. İpucu 1: sıradaki öğe ve kutusu parlar. Çözüm: kalan öğeler sırayla kutularına yerleşir. 9 öğede bile yerleşen öğeler kutunun içinde kalıyor.

## scenario (durum seç)
1. Üstte durum görseli, altta 2–3 davranış kartı; soru seslendirilir ve tekrar dinlenebilir.
2. Yanlış karta dokun. Beklenen: kart hafifçe eğilir, sahne kısa süre sonucu gösterir, (varsa) sonuç cümlesi okunur, sonra sahne geri gelir. Ceza hissi yok: titreşim ya da kırmızı çarpı yok, yalnızca olağan yumuşak "boop" sesi. Denenen kart soluklaşır ve yeniden seçilemez.
3. Sonuç gösterilirken başka karta dokunmak bir şey yapmaz.
4. Zorluk 1'de 2 seçenek, zorluk 2–3'te 3 seçenek görünür.
5. 2. yanlışta ipucu: ipucu cümlesi okunur, sahne parlar; geriye yalnızca doğru kart kalır.

---

# Faz 5b — Hayat Kasabası (Hayat Bilgisi 1–3)

17 ünite, 53 durak (`content/g1–g3/hayat_bilgisi/`). Görseller ve sesler gelene kadar kartlar yer tutucu rengiyle, satırlar cihazın Türkçe sesiyle gelir; aşağıdaki adımlar asset'ler gelince yeniden yapılır.

## Akış
1. Her sınıf için bir profil aç (1, 2, 3). Haritada Hayat Kasabası'na dokun. Beklenen: 1. sınıfta 15, 2. sınıfta 21, 3. sınıfta 17 durak; patika kayıyor, numaralar sırayla.
2. Her ünitenin ilk durağını baştan sona oyna. Giriş satırını Bilge söyler, her tur yönergesi okunur ve tekrar dinlenebilir.
3. Senaryo turlarında yanlış karta dokun: ipucu cümlesi okunur, ceza hissi yok.
4. Kutulara ayırma turlarında kutuya dokununca etiketin adı okunur ("Uygun davranış", "Geri dönüşüm" gibi).
5. Hikâye turlarında sayfalar okunur, sorular sesli sorulur. 2–3. sınıftaki metin seçenekli sorularda soru cümlesi iki seçeneği de söylüyor.
6. Durağı bitirince Hayat Bilgisi çıkartması albüme düşer (albüm → Hayat Bilgisi sekmesi).

## İçerik gözden geçirmesi (sınıf öğretmeni)
1. Atatürk durakları: doğum yeri ve yılı, anne ve baba adları, okulların sırası (Mahalle Mektebi → Şemsi Efendi Okulu → Askerî Rüştiye → Askerî İdadi → Harp Okulu), kişilik özelliği ↔ başarı eşleşmeleri.
2. Millî ve dinî bayram hikâyeleri (2. sınıf 4. ünite): dil sıcak, kapsayıcı ve programın vurguladığı değerlerle (paylaşma, büyüklere saygı, dayanışma) uyumlu mu?
3. Kişisel alan ve güvenlik senaryoları (1. sınıf 2. ünite, 3. sınıf 2. ünite): çocuğu korkutmadan doğru davranışı gösteriyor mu?
4. Yön bulma (2. sınıf 5. ünite) ve afet önlemleri (2. sınıf 5. ünite, 3. sınıf 5. ünite) bilgileri doğru mu?
Düzeltmeler yalnızca `content/*.json` dosyalarında yapılır; `ContentValidator` testi geçmelidir.

## Asset geldiğinde (parti 080–086)
1. Davranış kartları yan yana konduğunda çocuk yazıya bakmadan doğru davranışı ayırt edebiliyor mu? Aynı çocuk figürü bütün kartlarda tutarlı mı?
2. Sahneler senaryo çerçevesinde (16:9) kırpılmadan görünüyor mu?
3. Krokiler (3. sınıf 5. ünite): üç kroki aynı mahalle, yalnızca kırmızı yıldızın yeri farklı.
4. Seslendirme: "yüz on iki", tarihler ve özel adlar (Zübeyde Hanım, Ali Rıza Efendi, Şemsi Efendi) doğru okunuyor.
