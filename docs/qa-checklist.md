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
