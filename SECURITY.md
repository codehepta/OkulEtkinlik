# Güvenlik ve Gizlilik Politikası

Bilgi Adası 6–9 yaş çocuklar için yapılmıştır; güvenlik ve gizlilik en önemli önceliğimizdir.

## Tasarım gereği
- Uygulama **hiçbir ağ isteği yapmaz**; Android paketinde INTERNET dahil hiçbir izin yoktur. CI her APK'da bunu denetler (`scripts/ci-check-apk.sh`).
- Analitik, reklam, uygulama içi satın alma, hesap ya da üçüncü taraf SDK yoktur.
- Saklanan tek kişisel veri isteğe bağlı takma addır; cihazda (`user://`) kalır.
- Dışa aktarma, içe aktarma ve ayarlar yalnızca veli kapısının arkasındadır.

## Desteklenen sürümler
Proje erken geliştirme aşamasındadır; güvenlik düzeltmeleri yalnızca `main` dalına ve en son sürüme uygulanır.

## Açık bildirme
Bir güvenlik ya da gizlilik açığı bulduysan (ör. bir ağ isteği, veli kapısının aşılabilmesi, kayıt dosyasından veri sızması, izin eklenmesi):

1. **Herkese açık issue açma.**
2. GitHub'da [özel güvenlik bildirimi](https://github.com/codehepta/OkulEtkinlik/security/advisories/new) oluştur.
3. Sorunu, nasıl tekrarlandığını ve etkisini anlat. Çocuklara ait gerçek veri paylaşma.

Bildirimi en geç 7 gün içinde yanıtlamaya, doğrulanan sorunları öncelikle düzeltmeye çalışırız. Düzeltme yayımlandıktan sonra, istersen katkın teşekkür notunda anılır.
