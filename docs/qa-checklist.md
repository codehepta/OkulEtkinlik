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
