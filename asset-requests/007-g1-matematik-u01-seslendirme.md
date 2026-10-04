# 007 · 1. sınıf Matematik ünite 1 seslendirmesi (Gemini TTS)

**Öncelik: YÜKSEK** (Faz 1, dikey dilim). `content/g1/matematik/u01.json` ("Sayılar ve Nicelikler") duraklarının giriş satırları ve tur yönergeleri. Ayrıca 005'te eksik kalan profil oluşturma satırı (`vo.genel.takma_ad`).

> Bu dosya eklenmeden de oyun çalışır: eksik satırları cihazın Türkçe sesiyle okur. Gerçek kayıtlar geldiğinde kalite çok artar.

Sayılar (`vo.sayi.0`–`vo.sayi.20`) ve genel övgü/yönlendirme satırları 005'te istendi; burada tekrar edilmez.

## Nasıl üretilir
1. **Google AI Studio → "Generate speech"** (Gemini TTS) ekranını aç. Çoklu konuşmacı modunu kapat, tek konuşmacı kullan.
2. **Ses seçimi:** 005'in en altındaki "Seçilen sesler" bölümüne yazdığın **aynı iki sesi** kullan (Anlatıcı ve Bilge). Henüz seçmediysen önce 005'i yap.
3. Her satır için **Üslup talimatı** alanını "Style instructions / system" kısmına, **Metin** alanını konuşma metnine yapıştır.
4. Çıktıyı (`.wav`) **Dosya yolu** sütunundaki isimle kaydet. Klasörler (`g1/matematik/u01/n01/` gibi) yoksa oluştur. `.wav` kabul edilir; istersen `.ogg`'ye çevirebilirsin (mono, 22–44 kHz).
5. Dinleyip kontrol et: Türkçe telaffuz doğru mu, tempo 6 yaşındaki bir çocuk için yeterince yavaş mı?

## Ortak üslup talimatları
- **ANLATICI:** `Sıcak, sakin ve net bir sesle, 6-8 yaşındaki bir çocuğa konuşur gibi, yavaş ve anlaşılır oku. Kelimeleri tane tane söyle, cümle sonlarında kısa bir duraklama yap.`
- **BILGE:** `Neşeli, sevimli ve enerjik bir çizgi film karakteri gibi konuş. Gülümseyerek, coşkulu ama anlaşılır ve çok hızlı olmayan bir tempoyla söyle.`

Ek not (tur yönergeleri): Sayı adlarını (ör. "üç", "on yedi") biraz vurgulayarak ve net söyle; çocuk bu sayıyı ekranda bulacak.

## Satırlar

| # | Kimlik (anahtar) | Dosya yolu | Konuşmacı | Metin |
|---|---|---|---|---|
| 1 | `vo.genel.takma_ad` | `assets/audio/voice/genel/takma_ad.wav` | BILGE | İstersen kendine bir takma ad yazabilirsin. Bir büyüğünden yardım iste. İstemezsen Geç düğmesine dokun. |
| 2 | `vo.g1.matematik.u01.n01.intro` | `assets/audio/voice/g1/matematik/u01/n01/intro.wav` | BILGE | Merhaba! Haydi birlikte sayalım. Nesneleri parmağınla tek tek say! |
| 3 | `vo.g1.matematik.u01.n01.r01` | `assets/audio/voice/g1/matematik/u01/n01/r01.wav` | ANLATICI | Kaç elma var? Say ve doğru sayıya dokun! |
| 4 | `vo.g1.matematik.u01.n01.r02` | `assets/audio/voice/g1/matematik/u01/n01/r02.wav` | ANLATICI | Kaç top var? Parmağınla tek tek say! |
| 5 | `vo.g1.matematik.u01.n01.r03` | `assets/audio/voice/g1/matematik/u01/n01/r03.wav` | ANLATICI | Kaç civciv var? Say ve doğru sayıya dokun! |
| 6 | `vo.g1.matematik.u01.n01.r04` | `assets/audio/voice/g1/matematik/u01/n01/r04.wav` | ANLATICI | Kaç çiçek var? Dikkatle say ve dokun! |
| 7 | `vo.g1.matematik.u01.n02.intro` | `assets/audio/voice/g1/matematik/u01/n02/intro.wav` | BILGE | Bak, bu çubuklar da sayıları gösterir! Çubukları sayıp eşleştirelim. |
| 8 | `vo.g1.matematik.u01.n02.r01` | `assets/audio/voice/g1/matematik/u01/n02/r01.wav` | ANLATICI | Çubukları say. Her birini doğru sayıya sürükle! |
| 9 | `vo.g1.matematik.u01.n02.r02` | `assets/audio/voice/g1/matematik/u01/n02/r02.wav` | ANLATICI | Çubuk gruplarını say. Her grubu doğru sayıya bırak! |
| 10 | `vo.g1.matematik.u01.n02.r03` | `assets/audio/voice/g1/matematik/u01/n02/r03.wav` | ANLATICI | Çubukları tek tek say, sonra doğru sayıya sürükle! |
| 11 | `vo.g1.matematik.u01.n02.r04` | `assets/audio/voice/g1/matematik/u01/n02/r04.wav` | ANLATICI | Hepsini eşleştir! Çubukları say ve doğru sayıya bırak. |
| 12 | `vo.g1.matematik.u01.n03.intro` | `assets/audio/voice/g1/matematik/u01/n03/intro.wav` | BILGE | Şimdi kulaklarını aç! Duyduğun sayıyı bulalım. |
| 13 | `vo.g1.matematik.u01.n03.r01` | `assets/audio/voice/g1/matematik/u01/n03/r01.wav` | ANLATICI | Dinle ve bul: iki! İki rakamına dokun. |
| 14 | `vo.g1.matematik.u01.n03.r02` | `assets/audio/voice/g1/matematik/u01/n03/r02.wav` | ANLATICI | Dinle ve bul: üç! Üç rakamına dokun. |
| 15 | `vo.g1.matematik.u01.n03.r03` | `assets/audio/voice/g1/matematik/u01/n03/r03.wav` | ANLATICI | Dinle ve bul: dört! Dört rakamına dokun. |
| 16 | `vo.g1.matematik.u01.n03.r04` | `assets/audio/voice/g1/matematik/u01/n03/r04.wav` | ANLATICI | Dinle ve bul: beş! Beş rakamına dokun. |
| 17 | `vo.g1.matematik.u01.n04.intro` | `assets/audio/voice/g1/matematik/u01/n04/intro.wav` | BILGE | Sayılar büyüyor! Bu kez daha çok nesne sayacağız. |
| 18 | `vo.g1.matematik.u01.n04.r01` | `assets/audio/voice/g1/matematik/u01/n04/r01.wav` | ANLATICI | Kaç silgi var? Say ve doğru sayıya dokun! |
| 19 | `vo.g1.matematik.u01.n04.r02` | `assets/audio/voice/g1/matematik/u01/n04/r02.wav` | ANLATICI | Kaç balık var? Parmağınla tek tek say! |
| 20 | `vo.g1.matematik.u01.n04.r03` | `assets/audio/voice/g1/matematik/u01/n04/r03.wav` | ANLATICI | Kaç kalem var? Hepsini say ve dokun! |
| 21 | `vo.g1.matematik.u01.n04.r04` | `assets/audio/voice/g1/matematik/u01/n04/r04.wav` | ANLATICI | Kaç kelebek var? Dikkatle say ve dokun! |
| 22 | `vo.g1.matematik.u01.n04.r05` | `assets/audio/voice/g1/matematik/u01/n04/r05.wav` | ANLATICI | Kaç küp var? Say ve doğru sayıya dokun! |
| 23 | `vo.g1.matematik.u01.n05.intro` | `assets/audio/voice/g1/matematik/u01/n05/intro.wav` | BILGE | Şimdi on birden yirmiye kadar sayılarla oynayalım! |
| 24 | `vo.g1.matematik.u01.n05.r01` | `assets/audio/voice/g1/matematik/u01/n05/r01.wav` | ANLATICI | Kaç çilek var? Yavaş yavaş say ve dokun! |
| 25 | `vo.g1.matematik.u01.n05.r02` | `assets/audio/voice/g1/matematik/u01/n05/r02.wav` | ANLATICI | Dinle ve bul: sekiz! Sekiz rakamına dokun. |
| 26 | `vo.g1.matematik.u01.n05.r03` | `assets/audio/voice/g1/matematik/u01/n05/r03.wav` | ANLATICI | Kaç arı var? Tek tek say ve dokun! |
| 27 | `vo.g1.matematik.u01.n05.r04` | `assets/audio/voice/g1/matematik/u01/n05/r04.wav` | ANLATICI | Dinle ve bul: on beş! On beş sayısına dokun. |
| 28 | `vo.g1.matematik.u01.n05.r05` | `assets/audio/voice/g1/matematik/u01/n05/r05.wav` | ANLATICI | Kaç top var? Hepsini say ve doğru sayıya dokun! |
| 29 | `vo.g1.matematik.u01.n06.intro` | `assets/audio/voice/g1/matematik/u01/n06/intro.wav` | BILGE | Tahmin oyunu zamanı! Nesnelere iyice bak ve tahmin et. |
| 30 | `vo.g1.matematik.u01.n06.r01` | `assets/audio/voice/g1/matematik/u01/n06/r01.wav` | ANLATICI | Kaç mantar var? Bir bak, tahmin et, sonra doğru sayıya dokun! |
| 31 | `vo.g1.matematik.u01.n06.r02` | `assets/audio/voice/g1/matematik/u01/n06/r02.wav` | ANLATICI | Kaç kitap var? Tahmin et, sonra doğru sayıya dokun! |
| 32 | `vo.g1.matematik.u01.n06.r03` | `assets/audio/voice/g1/matematik/u01/n06/r03.wav` | ANLATICI | Kaç ördek var? İyice bak, tahmin et ve doğru sayıya dokun! |
| 33 | `vo.g1.matematik.u01.n06.r04` | `assets/audio/voice/g1/matematik/u01/n06/r04.wav` | ANLATICI | Kaç taş var? Tahmin et ve doğru sayıya dokun! |

---
## Teslim kontrol listesi
- [ ] Dosya adları kimlikle birebir aynı (Türkçe karakter yok)
- [ ] Ses başında ve sonunda uzun sessizlik yok (gerekirse kırp)
- [ ] 005'teki aynı iki ses kullanıldı
- [ ] Commit: `assets: 007 g1 matematik u01 seslendirme`
