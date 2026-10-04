# 005 · Genel seslendirme satırları (Gemini TTS)

**Öncelik: YÜKSEK** (Faz 1). Bu satırlar oyunun her yerinde tekrar kullanılır: övgü, yönlendirme, menüler. İçeriğe özgü satırlar (durak girişleri, soru yönergeleri) içerik yazıldıkça ayrı partilerle gelecek.

> Bu dosya eklenmeden de oyun çalışır: eksik satırları cihazın Türkçe sesiyle okur. Gerçek kayıtlar geldiğinde kalite çok artar.

## Nasıl üretilir
1. **Google AI Studio → "Generate speech"** (Gemini TTS) ekranını aç. Çoklu konuşmacı modunu kapat, tek konuşmacı kullan.
2. **Ses seçimi:**
   - **Anlatıcı** için sıcak ve net bir ses seç (ör. `Leda`, `Aoede` ya da `Kore`'yi dene).
   - **Bilge** için neşeli ve enerjik bir ses seç (ör. `Puck` ya da `Zephyr`'i dene).
   - Seçtiğin ses adlarını bu dosyanın en altındaki "Seçilen sesler" bölümüne yaz; sonraki partilerde aynı sesler kullanılacak.
3. Her satır için **Üslup talimatı** alanını "Style instructions / system" kısmına, **Metin** alanını konuşma metnine yapıştır.
4. Çıktıyı (`.wav`) **Dosya yolu** sütunundaki isimle kaydet. `.wav` kabul edilir; istersen `.ogg`'ye çevirebilirsin (mono, 22–44 kHz).
5. Dinleyip kontrol et: Türkçe telaffuz doğru mu, tempo çocuk için yeterince yavaş mı?

## Ortak üslup talimatları
- **ANLATICI:** `Sıcak, sakin ve net bir sesle, 6-8 yaşındaki bir çocuğa konuşur gibi, yavaş ve anlaşılır oku. Kelimeleri tane tane söyle, cümle sonlarında kısa bir duraklama yap.`
- **BILGE:** `Neşeli, sevimli ve enerjik bir çizgi film karakteri gibi konuş. Gülümseyerek, coşkulu ama anlaşılır ve çok hızlı olmayan bir tempoyla söyle.`

## Satırlar

| # | Kimlik (anahtar) | Dosya yolu | Konuşmacı | Metin |
|---|---|---|---|---|
| 1 | `vo.genel.hosgeldin` | `assets/audio/voice/genel/hosgeldin.wav` | BILGE | Merhaba! Ben Bilge. Bilgi Adası'na hoş geldin! |
| 2 | `vo.genel.profil_sec` | `assets/audio/voice/genel/profil_sec.wav` | BILGE | Kim oynuyor? Resmine dokun! |
| 3 | `vo.genel.avatar_sec` | `assets/audio/voice/genel/avatar_sec.wav` | BILGE | Hangi arkadaş sen olsun? Birini seç! |
| 4 | `vo.genel.sinif_sec` | `assets/audio/voice/genel/sinif_sec.wav` | ANLATICI | Kaçıncı sınıfa gidiyorsun? Birinci, ikinci ya da üçüncü sınıfa dokun. |
| 5 | `vo.genel.harita_giris` | `assets/audio/voice/genel/harita_giris.wav` | BILGE | Bugün nereyi keşfedelim? Bir bölgeye dokun! |
| 6 | `vo.bolge.sayi_ormani` | `assets/audio/voice/bolge/sayi_ormani.wav` | ANLATICI | Sayı Ormanı |
| 7 | `vo.bolge.harf_vadisi` | `assets/audio/voice/bolge/harf_vadisi.wav` | ANLATICI | Harf Vadisi |
| 8 | `vo.bolge.hayat_kasabasi` | `assets/audio/voice/bolge/hayat_kasabasi.wav` | ANLATICI | Hayat Kasabası |
| 9 | `vo.bolge.kesif_laboratuvari` | `assets/audio/voice/bolge/kesif_laboratuvari.wav` | ANLATICI | Keşif Laboratuvarı |
| 10 | `vo.bolge.agac_ev` | `assets/audio/voice/bolge/agac_ev.wav` | ANLATICI | Bilge'nin Ağaç Evi |
| 11 | `vo.bolge.kilitli_lab` | `assets/audio/voice/bolge/kilitli_lab.wav` | BILGE | Burası Keşif Laboratuvarı! Üçüncü sınıfta kapıları açılacak. |
| 12 | `vo.genel.durak_sec` | `assets/audio/voice/genel/durak_sec.wav` | BILGE | Parlayan taşa dokun, başlayalım! |
| 13 | `vo.genel.aferin_1` | `assets/audio/voice/genel/aferin_1.wav` | BILGE | Aferin! |
| 14 | `vo.genel.aferin_2` | `assets/audio/voice/genel/aferin_2.wav` | BILGE | Harikasın! |
| 15 | `vo.genel.aferin_3` | `assets/audio/voice/genel/aferin_3.wav` | BILGE | Süper! Doğru bildin! |
| 16 | `vo.genel.aferin_4` | `assets/audio/voice/genel/aferin_4.wav` | BILGE | Çok güzel! |
| 17 | `vo.genel.aferin_5` | `assets/audio/voice/genel/aferin_5.wav` | BILGE | İşte bu! |
| 18 | `vo.genel.tekrar_dene_1` | `assets/audio/voice/genel/tekrar_dene_1.wav` | BILGE | Hımm, bir daha deneyelim mi? |
| 19 | `vo.genel.tekrar_dene_2` | `assets/audio/voice/genel/tekrar_dene_2.wav` | BILGE | Olsun! Tekrar dene, yapabilirsin. |
| 20 | `vo.genel.tekrar_dene_3` | `assets/audio/voice/genel/tekrar_dene_3.wav` | BILGE | Neredeyse oluyordu! Bir kez daha! |
| 21 | `vo.genel.ipucu` | `assets/audio/voice/genel/ipucu.wav` | BILGE | Sana bir ipucu vereyim. Parlayan yere bak! |
| 22 | `vo.genel.cozum` | `assets/audio/voice/genel/cozum.wav` | BILGE | Gel, birlikte bakalım. Doğru cevap bu! |
| 23 | `vo.genel.sonra_tekrar` | `assets/audio/voice/genel/sonra_tekrar.wav` | BILGE | Bunu birazdan yine soracağım, hazır ol! |
| 24 | `vo.genel.yildiz_1` | `assets/audio/voice/genel/yildiz_1.wav` | BILGE | Bitirdin! Bir yıldız kazandın! |
| 25 | `vo.genel.yildiz_2` | `assets/audio/voice/genel/yildiz_2.wav` | BILGE | Çok iyi! İki yıldız kazandın! |
| 26 | `vo.genel.yildiz_3` | `assets/audio/voice/genel/yildiz_3.wav` | BILGE | Muhteşem! Üç yıldızın hepsi senin! |
| 27 | `vo.genel.cikartma` | `assets/audio/voice/genel/cikartma.wav` | BILGE | Yeni bir çıkartma kazandın! Albümüne ekledim. |
| 28 | `vo.genel.hediye` | `assets/audio/voice/genel/hediye.wav` | BILGE | Ağaç evim için yeni bir süs kazandın! Hadi yerleştirelim! |
| 29 | `vo.genel.yeni_durak` | `assets/audio/voice/genel/yeni_durak.wav` | BILGE | Yeni bir taş açıldı! |
| 30 | `vo.genel.tekrar_bulutu` | `assets/audio/voice/genel/tekrar_bulutu.wav` | BILGE | Tekrar Bulutu geldi! Öğrendiklerimizi hatırlayalım mı? |
| 31 | `vo.genel.album` | `assets/audio/voice/genel/album.wav` | ANLATICI | Çıkartma albümün. |
| 32 | `vo.genel.agac_ev_giris` | `assets/audio/voice/genel/agac_ev_giris.wav` | BILGE | Ağaç evime hoş geldin! Süsleri sürükleyip istediğin yere koyabilirsin. |
| 33 | `vo.genel.uyku_zamani` | `assets/audio/voice/genel/uyku_zamani.wav` | BILGE | Bugünlük bu kadar! Uyku zamanı. Yarın yine oynarız, görüşürüz! |
| 34 | `vo.genel.veli_cagir` | `assets/audio/voice/genel/veli_cagir.wav` | ANLATICI | Burası anne babalar için. Lütfen bir büyüğünü çağır. |
| 35 | `vo.genel.dinle` | `assets/audio/voice/genel/dinle.wav` | ANLATICI | Dinle. |
| 36 | `vo.genel.dokun` | `assets/audio/voice/genel/dokun.wav` | ANLATICI | Doğru olana dokun. |
| 37 | `vo.genel.surukle` | `assets/audio/voice/genel/surukle.wav` | ANLATICI | Parmağınla sürükle ve doğru yere bırak. |
| 38 | `vo.genel.hazir_misin` | `assets/audio/voice/genel/hazir_misin.wav` | BILGE | Hazır mısın? Başlıyoruz! |
| 39 | `vo.genel.bitti_harita` | `assets/audio/voice/genel/bitti_harita.wav` | BILGE | Haritaya dönelim! |

## Rakam ve sayı satırları (sayma oyunları için)
Sayıları ANLATICI üslubuyla, **tek kelime olarak ve net** oku. Dosya yolu: `assets/audio/voice/sayi/<rakam>.wav`. Kimlik: `vo.sayi.<rakam>`.

| Kimlik | Metin | Kimlik | Metin |
|---|---|---|---|
| `vo.sayi.0` | sıfır | `vo.sayi.11` | on bir |
| `vo.sayi.1` | bir | `vo.sayi.12` | on iki |
| `vo.sayi.2` | iki | `vo.sayi.13` | on üç |
| `vo.sayi.3` | üç | `vo.sayi.14` | on dört |
| `vo.sayi.4` | dört | `vo.sayi.15` | on beş |
| `vo.sayi.5` | beş | `vo.sayi.16` | on altı |
| `vo.sayi.6` | altı | `vo.sayi.17` | on yedi |
| `vo.sayi.7` | yedi | `vo.sayi.18` | on sekiz |
| `vo.sayi.8` | sekiz | `vo.sayi.19` | on dokuz |
| `vo.sayi.9` | dokuz | `vo.sayi.20` | yirmi |
| `vo.sayi.10` | on | | |

İpucu: Gemini TTS'te tek kelimelik metinler bazen çok kısa ya da kesik çıkar. Öyle olursa metni `"Bir."` gibi noktalı yaz ya da üslup talimatına `kelimeyi açıkça ve biraz uzatarak söyle` ekle.

## Seçilen sesler
- Anlatıcı: `_____`
- Bilge: `_____`

---
## Teslim kontrol listesi
- [ ] Dosya adları kimlikle birebir aynı (Türkçe karakter yok)
- [ ] Ses başında ve sonunda uzun sessizlik yok (gerekirse kırp)
- [ ] Bütün satırlarda aynı iki ses kullanıldı
- [ ] Commit: `assets: 005 genel seslendirme`
