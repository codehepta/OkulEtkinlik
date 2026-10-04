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

# Faz 3b — Matematik için yeni mekanikler

Ekran görüntüleri: `tools/ui_screenshots.gd` (Faz 3b kareleri). Gerçek cihazda kontrol edilecekler:

## Ortak
1. 1. sınıf profilinde terazi karşılaştırma seçenekleri "daha az / eşit / daha çok" sözcük kartı; her kartın üstündeki minik terazi ikonunda ağır kefe aşağıda ve içinde top var. 2. ve 3. sınıfta `<`, `=`, `>`.
2. Çok adımlı turlarda (sıraya diz, örüntü, eşleştir, grafik kur) birkaç yanlış yapınca yıldız yine en çok bir yanlış sayılmış gibi geliyor.

## Tahmin modu (count_choose, balance)
1. Tahmin karoları "≈10" biçiminde; tahmine dokununca cevap sesi (doğru/yanlış) çalmıyor, karo sola geçiyor.
2. Sayma: her nesneye dokununca üstüne sıra numarası çıkıyor ve sayı okunuyor; aynı nesneye ikinci dokunuş sayılmıyor. Hepsi sayılınca "yakın / uzak" kartları geliyor.
3. Tartma: "+" düğmesi her basışta sağ kefeye bir küp koyuyor, terazi her küpte biraz düzeliyor ve küp sayısı nesneye eşit olunca dengeleniyor.
4. İşlem: doğru sonuç "?" yerine oturunca terazi dengeleniyor, sonra yakın/uzak sorusu geliyor. İpucu 1 (yargıda): iki kartın üstünde tahmin ile sonucun farkı görünüyor.

## Rakam karosu girişi (listen_find yazma)
1. Duyulan sayı hoparlör düğmesiyle tekrar dinlenebiliyor; rakam karoları sıradaki boş kutuyu dolduruyor, dolu kutuya dokununca boşalıyor. Kutular dolmadan onay cevap sayılmıyor; yanlış onaydan sonra rakamlar yerinde kalıyor.

## clock_money (1. sınıf)
1. Saat okumada seçenek karolarında rakam yok, hoparlör var; dokununca saat sesle okunuyor ve karo yukarı kalkıp kesik çerçeve alıyor. Onay düğmesi seçimi denetliyor.
2. Saat kurmada hedef saat yazılı değil; hedef karosuna dokununca saat okunuyor. 1 kuruş artık hiçbir yerde çıkmıyor.

## grid (kareli zemin)
1. Yol kur: ok kartlarına dokununca alttaki programa ekleniyor, programdaki karta dokununca çıkıyor. Oynat düğmesiyle gezgin kare kare yürüyor; duvara ya da kenara çarpınca hafifçe sekip duruyor, başa dönüyor ve program kalıyor. Zorluk 1'de program izi zeminde görünüyor.
2. Yolu izle: verilen programın bittiği kareye dokunmak kolay; kareler en az 128 px.
3. Boyama: kareye dokununca boyanıyor, tekrar dokununca siliniyor; boyalı kare renkten başka iç işaretle de ayırt ediliyor. Simetride verilen yarı kilitli ve farklı görünüyor; eksen kalın kesik çizgi.
4. Silüet ve "N parça": silüet zeminde soluk; N parçada sayaç (zorluk 1) doğru sayıyor, bitişik olmayan kareler kabul edilmiyor.

## chart_build (veri)
1. Nesneler doğru satıra/sütuna sürüklenince grafikte çetele çizgisi, sayı, küçük resim ya da nokta beliriyor; yanlış yere bırakılan nesne geri dönüyor. Beşli çetelede beşinci çizgi çapraz.
2. Sorular sesle soruluyor; "en çok / en az" seçenekleri kategori resimleri. Küçük resimler ve noktalar telefonda da seçilebiliyor (dokunma hedefi değiller ama okunaklı olmalılar).

## Asset geldiğinde (parti 011, 012)
1. `char.grid.gezgin`, `ui.grid.hedef`, `ui.grid.duvar` eklenince kodla çizilen piyon, bayrak ve blok yerine geçiyor ve kareden taşmıyor; gezginin yönü oyunun çizdiği okla anlaşılıyor.
2. `vo.tahmin.*` ve `vo.saat.*` kayıtları geldikten sonra cihazın TTS sesi yerine kayıtlar çalıyor.

## Faz 3d — 2. sınıf Matematik
1. `grid` döndürme: referans şekil soluk gösteriliyor; döndürülmüş şekil zeminin herhangi bir yerine boyanınca kabul ediliyor, ayna görüntüsü kabul edilmiyor. Büyütmede her kare 2 × 2 boyanınca kabul ediliyor.
2. Haritada 2. sınıf Matematik bölgesinde 6 ünite ve 42 durak açılıyor; her durağın girişini Bilge okuyor, tur yönergeleri hoparlörle tekrar dinlenebiliyor.
3. 21–100 arası sayılar (rakam yazma, sayı adı eşleme, onluk/birlik) doğru seslendiriliyor; kayıt yoksa cihazın Türkçe sesi düzgün okuyor ("kırk yedi").
4. Para turlarında 1 kuruş yok; "100 kuruş = 1 lira", "yarım lira = 50 kuruş" eşleşmeleri tek doğru cevaplı.
5. Tahmin turlarında (bardak, metre çubuğu, kilogramlık ağırlık) tahmin cevap sayılmıyor; kontrol adımında her nesneye dokunuluyor, sonra yakın/uzak kararı geliyor.
6. Veri turlarında grafikler iki kategoriyle kuruluyor; "en çok / en az / kaç fazla / toplam" soruları sesle soruluyor.
7. Bir sınıf öğretmeni ünite içeriklerini programla karşılaştırıyor (özellikle MAT.2.3.2–2.3.3 yapı/model sahneleri ve MAT.2.1.10 zaman birimleri).

## Asset geldiğinde (parti 040–045)
1. `item.cisim.*`, `item.sekil.*`, `item.yapi.*`, `item.model.*` görselleri gelince kartlardaki yazılı yer tutucu kalkıyor; dönmüş ve küçük çeşitler aynı nesne olarak tanınıyor.
2. `vo.sayi.21`–`100`, `vo.mat2.*` ve `vo.g2.matematik.*` kayıtları geldikten sonra cihaz sesi yerine kayıtlar çalıyor.

# Faz 6 — Fen Bilimleri 3 (Keşif Laboratuvarı)

Sekiz ünite, 20 durak (`content/g3/fen/u01`–`u08.json`). Görseller ve sesler gelene kadar her kart Türkçe adını yazan bir yer tutucu, her satır cihazın Türkçe sesi olarak görünür/duyulur.

## Bölge
1. 1. ve 2. sınıf profiliyle haritaya gir. Beklenen: Keşif Laboratuvarı soluk, sisli ve kilitli görünür; dokununca Bilge "Üçüncü sınıfta kapıları açılacak" der, patika açılmaz.
2. 3. sınıf profiliyle lab'a dokun. Beklenen: patikada 20 durak, ünite sırasıyla (Bilimsel Keşif Yolculuğu ilk).

## İçerik akışı
1. Her ünitenin ilk durağını oyna. Beklenen: Bilge'nin girişi, 3–5 tur, sonuçta yıldız ve Fen albümüne yeni çıkartma.
2. "Bilim insanları" durağı: hikâye iki sayfa, sorular sayfaya dönerek cevaplanabiliyor; metin seçenekli soruda kartlar okunaklı.
3. Metin kartlı turlar ("Dokunma", "Mineraller", "Yön değiştirir"): kart yazısı telefonda rahat okunuyor mu? Küçük kalan varsa not al.
4. `listen_find` metin turlarında hoparlör düğmesi soruyu yeniden okuyor.
5. "Elektriği tasarruflu kullanalım": sayı kartlı sorularda (4, 12) doğru sayı kabul ediliyor; yanlışta nazik sonuç ve ipucu geliyor.
6. Güvenlik turlarında (ıslak el, yıpranmış kablo, fişi kablodan çekmek, yola koşmak) yanlış seçim korkutucu değil; sonuç cümlesi okunuyor.
7. Albümün Fen sayfasında 20 çıkartma yeri var; kazanılanlar renkli görünüyor.

## Asset geldiğinde (parti 090–096)
1. `item.fen.*` görselleri kartlarda ve kutularda kesilmeden, aynı ışık ve bakış açısıyla görünüyor.
2. Senaryo sahneleri (093) çerçeveye sığıyor; `alti_lamba` sahnesinde altı ışıklı pencere sayılabiliyor; `tuketim_grafik` sahnesinde sağdaki sütun belirgin kısa.
3. Seslendirmede (095, 096) bilimsel terimler (paleontolog, mikroskop, mineral) doğru telaffuz ediliyor.
