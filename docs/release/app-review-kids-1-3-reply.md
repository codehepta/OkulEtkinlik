# App Review: Yönerge 1.3 (Çocuklar kategorisi) bilgi talebine yanıt

Apple, 2 Kasım 2026'da 1.0.1 (2) için otomatik soru listesi gönderdi ve sürümü "Rejected (2.1.0 Performance: App Completeness)" yaptı. Bu bir hata bildirimi değildir: Çocuklar kategorisine gönderilen uygulamalara dört soru sorulur ve yanıt istenir. Kodda değişiklik ya da yeni build gerekmez.

Yanıttaki iddiaların dayanağı (2026-11-05'te kontrol edildi):
- `scenes`, `scripts`, `autoload` altında ağ sınıfı yok (`HTTPRequest`, `HTTPClient`, `WebSocket`, `StreamPeerTCP`, `PacketPeerUDP`, `ENetMultiplayer`), dış bağlantı (`OS.shell_open`) yok.
- `addons/` içinde yalnızca GUT var; o da `exclude_filter` ile pakete girmez. Üçüncü taraf SDK yok.
- `PrivacyInfo.xcprivacy`: `NSPrivacyTracking=false`, toplanan veri türü yok. App Privacy: "Data Not Collected".
- Cihazda saklananların listesi `PRIVACY.md` ile aynıdır.

## App Review mesajına yapıştırılan metin (İngilizce)

Gönderildi: 5 Kasım 2026, aynı mesaj dizisine. Yeniden gönderim yapılmadı; Apple'ın dönüşü bekleniyor.

Hello,

Thank you for reviewing Bilgi Adası: 1-3. Sınıf. The answer to all four questions is No.

1. Third-party analytics: No. The app contains no analytics SDK or service of any kind (no crash reporter, no attribution SDK) and does not measure usage, locally or remotely.

2. Third-party advertising: No. There are no ads, no ad network SDK, no promotional content, and no links that open outside the app.

3. Data shared with third parties: No. The app shares no data with anyone, including the developer. It makes no network requests at all: there is no server, account, sign-in, in-app purchase, or cloud sync. The app works fully in Airplane Mode.

4. Other user or device data collection: No. The app does not collect or transmit any user or device data. It never accesses the advertising identifier, location, contacts, camera, microphone, or photo library.

For completeness, the app stores only the following, inside its own sandbox on the device, and never transmits it:
- Child profiles: the chosen animal avatar, an optional nickname (a real name is not required), and the school grade.
- Game progress: completed stops, stars, mastery values, review schedule, stickers, and the tree house layout.
- Settings: sound levels, the daily time limit, and daily usage time.
Deleting the app deletes all of this. A parent can also delete a single profile in the parent area.

The only way any of this can leave the app's storage is the parent's own action: behind a parental gate (a multiplication question), the parent area can save a backup file into the app's own folder, which is visible in the Files app. The app itself sends nothing.

Instructions are read aloud from recordings bundled in the app. If a recording is missing, the app uses the on-device system text-to-speech. No audio is recorded.

The game is built with the open-source Godot engine and includes no third-party SDKs. The privacy manifest declares no tracking and no collected data types, and App Privacy is published as "Data Not Collected".

The privacy policy is available in the app (parent area, "Gizlilik" section, offline) and at:
https://github.com/codehepta/OkulEtkinlik/blob/main/PRIVACY.md

Thank you.

## Süreç notları
- Yanıtı gönderdikten sonra **yeniden gönderme yapma**. Kelime Avcısı'nda (Eylül 2026) yanıttan sonra aynı build yeniden gönderildi; yeni inceleme aynı soruları sordu ve sürüm yine reddedildi. Apple'ın dönüşünü bekle, uzarsa Contact Us → App Review.
- Aynı sorular yeniden gelirse aynı dizide kısa bir yanıt yeterlidir: dört soruya da "No", ardından bu metne atıf.
- Uygulamaya ağ, analitik ya da veri toplama eklenirse bu yanıt **geçersiz** olur; `PRIVACY.md`, App Privacy ve bu metin birlikte yeniden yazılır.
