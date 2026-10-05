# Bilgi Adası — Tasarım Dokümanı (Spec)

- **Tarih:** 2026-10-04
- **Durum:** Onaylandı (sahip onayı, 2026-10-04)
- **Repo:** https://github.com/codehepta/OkulEtkinlik
- **Çalışma adı:** Bilgi Adası · **Maskot:** Bilge (kil görünümlü baykuş). İkisi de `res://content/strings.tr.json` içinden değiştirilebilir.

---

## 1. Amaç ve başarı ölçütleri

### 1.1 Amaç
MEB 1., 2. ve 3. sınıf öğretim programlarıyla (Türkiye Yüzyılı Maarif Modeli) uyumlu, 6–9 yaş çocukların **evde tablet/telefonda tek başına** oynadığı, **ücretsiz ve açık kaynak**, görsel ve işitsel olarak çekici, öğretici ve sürükleyici bir mobil oyun.

### 1.2 Sahibin verdiği kararlar
| Konu | Karar |
|---|---|
| Kullanım bağlamı | Evde tablet/telefon; çocuk tek başına oynar, veli takip eder |
| Amaç / model | Ücretsiz, açık kaynak. Reklam yok, satın alma yok |
| Kapsam | 1–3. sınıfların tüm temel dersleri; içerik sınıfa göre farklılaşır |
| Platform | **Mobil (Android + iOS)** → **Godot 4** |
| Görsel stil | **3D oyuncak / kil (claymation) görünümü** |
| Asset üretimi | Sahip, Gemini **Nano Banana** ile görselleri, Gemini TTS ile sesleri üretir. Gerekirse Blender kullanılır. Ekip promptları `.md` dosyaları halinde verir, sahip dosyaları belirtilen klasöre koyar |
| Geliştirme | Uygulama cloud agent'a devredilir |

### 1.3 Varsayımlar (sahip düzeltebilir)
- 1. sınıf çocuğu ilk dönem okuma bilmez → **her yönerge seslendirilir**, ekranda metin ikincil kalır.
- Yatay (landscape) ekran yönü.
- Hedef cihaz alt sınırı: 2 GB RAM'li, Android 8+ tablet/telefon.
- Uygulama dili yalnızca Türkçe.

### 1.4 Başarı ölçütleri
1. 1. sınıf bir çocuk, yetişkin yardımı olmadan profil seçip bir durağı baştan sona oynayabilir (yalnızca sesli yönlendirmeyle).
2. Her içerik durağı en az bir doğrulanmış MEB öğrenme çıktısına bağlıdır. Uydurma kod yoktur.
3. Asset dosyaları eksik olsa bile oyun çökmeden, yer tutucularla oynanabilir.
4. Ağ bağlantısı olmadan tam çalışır. Hiçbir kişisel veri cihaz dışına çıkmaz.
5. CI her push'ta testleri çalıştırır ve imzasız bir Android debug APK üretir.

### 1.5 Kapsam dışı (v1)
- Çok oyunculu, sınıf / akıllı tahta modu, öğretmen paneli.
- Hesap, bulut senkronizasyonu, sunucu.
- İngilizce (2–3. sınıf), Müzik, Görsel Sanatlar, Beden Eğitimi dersleri. Çatı bunlara modül olarak açık tasarlanır; v1 sonrası değerlendirilir.
- Gerçek zamanlı 3D sahneler (3D maskot Faz 9'da opsiyonel).

---

## 2. Ders ve sınıf kapsamı

| Bölge (harita) | Ders | 1. sınıf | 2. sınıf | 3. sınıf |
|---|---|---|---|---|
| 🔢 Sayı Ormanı | Matematik | ✓ | ✓ | ✓ |
| 🔤 Harf Vadisi | Türkçe | ✓ (ilk okuma-yazma, ses temelli) | ✓ | ✓ |
| 🏡 Hayat Kasabası | Hayat Bilgisi | ✓ | ✓ | ✓ |
| 🔬 Keşif Laboratuvarı | Fen Bilimleri | — (bölge kilitli/gizli) | — | ✓ |

**Kaynak kuralı:** İçerik, her ders ve sınıf için yürürlükteki güncel öğretim programına (TYMM; resmi kaynaklar `tymm.meb.gov.tr`, `mufredat.meb.gov.tr`) göre eşlenir. Faz 2'de `docs/curriculum/` altında **sınıf × ders × ünite/tema × öğrenme çıktısı (resmi kod ve metin) → oyun şablonu** matrisi çıkarılır. Her satır kaynak PDF adı ve sayfa numarasıyla belgelenir. Doğrulanamayan kod içeriğe girmez.

**Pedagojik ilkeler:**
- 1. sınıf Türkçe, MEB'in **ses temelli cümle yöntemi** sırasını izler. Harf izleme **dik temel harflerle** yapılır.
- Somuttan soyuta: sayma nesneleri → görsel model → sembol.
- Kısa ve odaklı turlar: bir durak 3–5 tur, toplam 2–4 dakika.
- Hata öğrenme fırsatıdır: ceza, can kaybı ya da "kaybettin" ekranı yoktur.

---

## 3. Oyun tasarımı

### 3.1 Dünya
- **Bilgi Adası** tek bir harita ekranıdır; dört bölge ve ortada **Bilge'nin Ağaç Evi** bulunur.
- Her bölgede kıvrımlı bir **patika** vardır. Patikadaki her **durak** bir öğrenme çıktısına (ya da küçük bir çıktı grubuna) karşılık gelir.
- Profildeki **sınıf**, patikanın içeriğini belirler. Harita aynı kalır, duraklar o sınıfın içerik dosyalarından gelir.
- Keşif Laboratuvarı 1–2. sınıfta "yakında açılacak" görseliyle kapalı durur.

### 3.2 Çekirdek döngü
```
Harita → bölge → patika → durak
  → Bilge'nin sesli girişi (≤10 sn)
  → 3–5 mini oyun turu
  → sonuç: 1–3 yıldız + çıkartma
  → ağaç evi için süs eşyası (eşiklerde)
  → sonraki durak açılır → patikaya dönüş
```
- **Yıldız kuralı (durak bazında):** toplam yanlış ≤1 → 3 yıldız, ≤3 → 2 yıldız, aksi halde 1 yıldız. Durağı tamamlamak her zaman en az 1 yıldız verir.
- Durak tekrar oynanabilir. En yüksek yıldız saklanır.

### 3.3 Hata ve ipucu akışı (her turda)
1. 1. yanlış: yumuşak "boop" sesi, nesne hafifçe sallanır, yönerge tekrar okunur.
2. 2. yanlış: **ipucu** (şablona özgü: doğru alanı parlatma, nesneyi birer birer sayma, hece vurgulama).
3. 3. yanlış: doğru cevap animasyonla gösterilir, tur "yardımlı" olarak işaretlenir ve **aynı beceri durağın sonunda yeniden sorulur**.

### 3.4 Uyarlanabilir motor
- Her öğrenme çıktısı için bir **ustalık puanı** (0.0–1.0) tutulur. Güncelleme üstel hareketli ortalamayla yapılır: `m = m*0.7 + sonuç*0.3`. Başlangıç değeri 0.0'dır. Sonuç değerleri: doğru ilk denemede 1.0, ikinci denemede 0.6, üçüncü denemede (ipucundan sonra) 0.3, yardımlı (çözüm gösterildi) 0.0.
- **Aralıklı tekrar (Leitner, 5 kutu):** tekrar aralıkları 0, 1, 3, 7, 14 gün. Durağı ≥2 yıldızla bitiren çıktı bir kutu ilerler; yardımlı tur içeren çıktı 1. kutuya döner.
- Patikada vadesi gelen çıktılar için **"Tekrar Bulutu"** durağı belirir. Bu durak, karışık sorulardan oluşan 3 turluk bir tekrar oturumudur.
  - Uygulama (Faz 7a): bulut, dersin tamamlanmış duraklarında geçen çıktılardan vadesi gelen varsa patikanın sağ üstünde görünür. Turlar vadesi en eski çıktıdan başlayarak her çıktıdan birer tane seçilir ve karıştırılır. Leitner kuralı duraktakiyle aynıdır. Tekrar düğüm yıldızını, çıkartmayı ve Ağaç Evi yıldız toplamını değiştirmez.
- **Zorluk seviyesi:** Her turun içerikte bir taban `difficulty: 1..3` değeri vardır. Oynanan seviye = taban + ayar, 1–3 aralığına sıkıştırılır. Ayar, turun ilk öğrenme çıktısının ustalığına göre belirlenir: ≥0.8 ise +1, ≤0.4 ise −1, arada 0. Daha ince ayar Faz 7'de yapılır.

### 3.5 Ödül sistemi
- **Çıkartma Albümü:** her ders için bir sayfa. Durak tamamlandığında temaya uygun bir çıkartma kazanılır.
- **Bilge'nin Ağaç Evi:** belirli yıldız eşiklerinde (5, 15, 30, ...) süs eşyası açılır. Çocuk eşyaları sürükleyerek odayı düzenler.
  - Uygulama (Faz 7a): eşikler 5, 15, 30, sonra 20'şer (50, 70, ...); toplam yıldız = bütün durakların en yüksek yıldızlarının toplamı. 12 süs `content/tree_house.json` sırasıyla açılır. Açılan süs rafta durur, odaya sürüklenir, rafa geri sürüklenebilir; konum profilde saklanır. Sıradaki süsün yerinde kilit ve yıldız sayacı görünür.
- **Yasaklar:** kutu açma ve şans mekaniği, seri (streak) kaybı baskısı, süre baskısı, sosyal karşılaştırma.

### 3.6 Profiller ve veli
- Bir cihazda en fazla **4 çocuk profili** olabilir. Her profilde avatar (hazır kil hayvanlardan seçilir), takma ad (opsiyonel, yalnızca cihazda) ve sınıf (1/2/3) bulunur.
- **Veli kapısı:** Yazıyla verilen, yetişkin seviyesinde bir işlem sorulur (ör. "on dört ile altıyı çarpın"). Cevap rakam tuş takımıyla girilir. Yanlış cevapta yeni soru gelir.
- **Veli paneli:**
  - Ders ve öğrenme çıktısı bazında ilerleme (ustalık çubukları, son oynanma tarihi).
  - Günlük süre sınırı (10 / 15 / 20 / 30 dk / kapalı).
  - Ses seviyeleri (anlatım, müzik, efekt).
  - Sınıf değiştirme, profil silme.
  - İlerlemeyi JSON olarak dışa ve içe aktarma (paylaşım menüsü üzerinden).
- **Süre dolunca:** mevcut tur bitirilir, ardından Bilge "Uyku zamanı!" animasyonu ve sesiyle oturumu kapatır. Ertesi güne kadar veli kapısı olmadan devam edilemez.

### 3.7 Mini oyun şablonları
Her şablon bağımsız bir sahnedir ve ortak `MiniGame` arayüzünü uygular (bkz. §4.4). Parametreler içerik JSON'undan gelir.

| # | Şablon kimliği | Mekanik | Örnek kullanım |
|---|---|---|---|
| 1 | `drag_match` | Sürükle-bırak eşleştirme | rakam↔miktar, büyük↔küçük harf, hayvan↔yavru |
| 2 | `count_choose` | Nesneleri say, doğru seçeneğe dokun | 1–20 sayma, gruplar |
| 3 | `sequence` | Kartları doğru sıraya diz | sayı dizisi, hikâye olayları, yaşam döngüsü |
| 4 | `sort_bins` | Nesneleri kutulara ayır | canlı/cansız, tek/çift, sesli/sessiz harf |
| 5 | `trace` | Parmakla yol izleme (dik temel harf) | harf ve rakam yazımı |
| 6 | `syllable_build` | Hecelerden kelime kur | Türkçe hece ve kelime |
| 7 | `listen_find` | Dinle ve doğru görsele/harfe dokun | ses-harf ilişkisi, kelime anlamı |
| 8 | `balloon_pop` | Doğru cevabı taşıyan balonu patlat (süre baskısı yok) | toplama/çıkarma pratiği |
| 9 | `pattern` | Örüntüyü tamamla | şekil ve sayı örüntüleri |
| 10 | `balance` | Terazi / sayı doğrusu | eşitlik, karşılaştırma, sayı doğrusu |
| 11 | `clock_money` | Saat kur / para say | zaman ölçme, paralarımız |
| 12 | `story` | Sesli etkileşimli hikâye + anlama soruları | okuma ve anlama, değerler |
| 13 | `scenario` | Durum seç (ne yapmalıyız?) | trafik, güvenlik, sağlık, görgü |
| 14 | `fraction_pizza` | Bütünü parçala ve seç | 3. sınıf kesirler |
| 15 | `grid` | Kareli zemin: ok kartlarıyla yol (hareket) ve kare boyama (kopyala, simetri, kodla çiz, silüeti eşle, N parça kullan) | yön ve konum, yol planlama, simetri, şekil çizme, şekillerle model |
| 16 | `chart_build` | Nesneleri sürükleyerek çetele, sıklık tablosu, nesne ya da nokta grafiği kur, sonra grafikle ilgili soruları yanıtla | veri toplama ve görselleştirme, veriye dayalı karar |

**Şablon modları (Faz 3b):** Bazı mekanikler ayrı şablon değil, mevcut şablonların modudur:
- `balance` `scale/compare` + `item` grupları: iki grubu karşılaştırma ("daha çok / daha az / eşit"); ipucu bire bir eşleme çizgileri. 1. sınıfta seçenekler sözcük kartı + ağır kefe ikonu, 2. sınıftan itibaren `<`, `=`, `>`.
- **Tahmin modu** ("tahmin et → kontrol et → karşılaştır"): önce aralıklı tahmin seçilir (doğru/yanlış sayılmaz), sonra sonuç kontrol edilir, en sonda tahminin sonuca "yakın" mı "uzak" mı olduğu seçilir. `count_choose` (`estimates`: nesnelere dokunarak sayma) ve `balance` (`ask: estimate`: birim küplerle tartma ya da eksik değerli terazide zihinden işlem).
- **Rakam karosu girişi:** 2–3. sınıfta çok basamaklı sayı yazma iz sürme yerine rakam karolarıyla yapılır (`listen_find` `answer: digits`). 1. sınıfta rakam yazımı `trace` ile kalır.
- `free_build` ayrı şablon değildir: denetlenebilir hedefle (`grid` `paint/silhouette`, `paint/pieces`) oynanır ve ustalık hesabına girer.

Şablonlar ihtiyaç sırasıyla yazılır (bkz. §8). Matris yeni bir mekanik gerektirirse spec'e şablon eklenir.

---

## 4. Teknik mimari

### 4.1 Teknoloji
- **Godot 4.7.2-stable**, **GDScript** (statik tipli: `var x: int`, dönüş tipleri zorunlu). .NET kullanılmaz.
- **Test:** GUT 9.7.x (`addons/gut`, repoya dahil). Testler headless çalışır.
- **CI:** GitHub Actions. Linux'ta headless test + Android debug APK export artefaktı.
- **Hedefler:** Android (öncelik, APK/AAB) ve iOS (macOS + Xcode üzerinde sahip yapar). Web export yalnızca isteğe bağlı demo içindir.
- **Ekran:** taban çözünürlük 1920×1080, `stretch_mode=canvas_items`, `aspect=expand`. Güvenli alan (çentik) dikkate alınır. Yön: sensor_landscape.

### 4.2 Klasör yapısı
```
project.godot
addons/gut/                     # test çatısı (repoya dahil)
autoload/                       # tekil servisler (Project Settings > Autoload)
  app_state.gd                  # aktif profil, sahne geçişleri
  asset_registry.gd             # mantıksal anahtar → dosya, yer tutucu yedeği
  audio_director.gd             # müzik / anlatım / efekt kanalları, ducking
  narrator.gd                   # ses satırı çal; yoksa DisplayServer TTS (tr)
  content_db.gd                 # içerik JSON yükleme + doğrulama
  save_service.gd               # user:// JSON kayıt, sürüm göçü
  progress.gd                   # ustalık, Leitner, yıldız, ödüller
  session_timer.gd              # günlük süre sınırı
scripts/core/                   # saf mantık (sahnesiz, test edilebilir)
  mastery.gd  leitner.gd  stars.gd  content_validator.gd  parent_gate_quiz.gd
scenes/ui/                      # Splash, ProfileSelect, ProfileCreate, WorldMap,
                                # RegionPath, LessonRunner, Result, StickerAlbum,
                                # TreeHouse, ParentGate, ParentPanel, SessionEnd
scenes/components/              # BigButton, ReplayVoiceButton, Placeholder, StarBurst...
scenes/games/<şablon_kimliği>/  # <sablon>.tscn + <sablon>.gd (MiniGame alt sınıfı)
content/
  strings.tr.json               # tüm arayüz metinleri ve isimler
  voice_lines.tr.json           # ses satırı kimliği → metin + üslup notu
  stickers.json  decor.json     # ödül katalogları
  g1/ g2/ g3/                   # sınıf
    matematik/ turkce/ hayat_bilgisi/ fen/   # ders
      u01.json ...              # ünite/tema dosyaları
docs/
  superpowers/specs/  superpowers/plans/
  curriculum/                   # müfredat matrisi (Faz 2)
  assets/style-guide.md         # görsel stil rehberi ve sabit prompt blokları
  assets/naming.md              # dosya isimlendirme sözleşmesi
asset-requests/                 # sahibe verilen prompt .md dosyaları (NNN-konu.md)
assets/
  images/characters/ images/map/ images/regions/ images/items/ images/ui/ images/stickers/ images/decor/ images/avatars/
  audio/voice/ audio/music/ audio/sfx/
  fonts/
tools/                          # headless GDScript araçları (eksik asset raporu vb.)
tests/unit/  tests/integration/
scripts/setup-godot.sh          # cloud/CI için Godot kurulumu
.github/workflows/ci.yml
export_presets.cfg              # Android debug preset (sır içermez)
```

### 4.3 İçerik veri modeli
Ünite dosyası örneği (`content/g1/matematik/u01.json`):
```json
{
  "id": "g1.matematik.u01",
  "grade": 1,
  "subject": "matematik",
  "title_key": "unit.g1.matematik.u01",
  "source": { "program": "TYMM Matematik 1", "doc": "<resmi PDF adı>", "page": 0 },
  "nodes": [
    {
      "id": "g1.matematik.u01.n01",
      "outcomes": ["<resmi öğrenme çıktısı kodu>"],
      "title_key": "node.g1.matematik.u01.n01",
      "intro_voice": "vo.g1.matematik.u01.n01.intro",
      "sticker": "st.matematik.elma",
      "rounds": [
        {
          "template": "count_choose",
          "difficulty": 1,
          "voice": "vo.g1.matematik.u01.n01.r01",
          "params": { "item": "item.meyve.elma", "count": 3, "choices": [2, 3, 4] }
        }
      ]
    }
  ]
}
```
- Kimlik biçimi: `g<sınıf>.<ders>.u<NN>.n<NN>`. Ses satırları `vo.<...>`, görseller `item.<kategori>.<ad>` biçimindedir.
- **ContentValidator** şunları denetler: zorunlu alanlar, kimlik benzersizliği, şablonun var olması, şablona özgü parametre şeması (her şablon `static func validate_params(p: Dictionary) -> Array[String]` sunar), `outcomes` alanının boş olmaması ve geçerli kodların `docs/curriculum` matrisindeki listede yer alması, `voice` ve `title_key` anahtarlarının metin dosyalarında bulunması.
- `outcomes` asla boş bırakılamaz. Matris dosyası (`docs/curriculum/outcomes.json`) Faz 1'de yalnızca 1. sınıf Matematik ilk ünitesinin doğrulanmış çıktılarıyla başlatılır; Faz 2 onu tüm sınıf ve derslere genişletir. Validator yalnızca bu dosyadaki kodları kabul eder.

### 4.4 MiniGame sözleşmesi
```gdscript
class_name MiniGame extends Control
signal answered(correct: bool)          # her deneme
signal finished(result: RoundResult)    # tur bitti
func setup(params: Dictionary, difficulty: int, ctx: RoundContext) -> void
func show_hint(level: int) -> void      # 1: ipucu, 2: çözümü göster
static func validate_params(p: Dictionary) -> Array[String]
```
- Akışı **LessonRunner** yönetir: turları sırayla yükler, `answered` sinyallerini sayar, ipucu ve çözüm adımlarını tetikler, yardımlı turları sona ekler, yıldızı hesaplar, `Progress`'e yazar.
- Şablonlar kayda ya da ilerlemeye doğrudan dokunmaz. Görsel ve ses isteklerini yalnızca `AssetRegistry` ve `Narrator` üzerinden yapar.

### 4.5 Asset kayıt defteri ve yer tutucular
- Mantıksal anahtar dosya yoluna isimlendirme sözleşmesiyle çözülür (`docs/assets/naming.md`). Örnek: `item.meyve.elma` → `res://assets/images/items/meyve/elma.png`.
- Ses için `.ogg`, `.wav` ve `.mp3` sırasıyla denenir.
- **Dosya yoksa:**
  - Görsel: anahtar adından türetilen sabit renkli, köşeleri yuvarlatılmış bir kart ve üzerinde Türkçe etiket (`strings.tr.json`).
  - Ses satırı: `DisplayServer.tts_speak` ile Türkçe sesle okunur (`voice_lines.tr.json`'daki metin). Türkçe ses yoksa sessiz geçilir, ekranda metin balonu gösterilir.
  - Müzik ve efekt: sessiz.
- `tools/missing_assets.gd` (headless) tüm içerikleri tarar, eksik dosyaları listeler ve `asset-requests/` için taslak prompt dosyası üretir. Taslaklar elle cilalanıp sahibe verilir.

### 4.6 Ses yönetimi
- Kanallar: `Voice`, `Music`, `SFX` (Godot AudioBus).
- Anlatım çalarken müzik −12 dB'ye iner (ducking).
- Her oyun ekranında sol üstte büyük bir **"tekrar dinle" (hoparlör) butonu** bulunur.
- Dokunma geri bildirimi her etkileşimde vardır: ses ve 0.1 sn ölçek "pop".

### 4.7 Kayıt
- `user://save_v1.json` dosyası profilleri, ilerlemeyi ve ayarları tutar. Yazma atomiktir: önce geçici dosyaya yazılır, sonra yeniden adlandırılır.
- `schema_version` alanı ve göç fonksiyonları zinciri vardır.
- Bozuk dosya algılanırsa yedeğe (`save_v1.bak.json`) dönülür.

### 4.8 Gizlilik ve güvenlik
- Uygulama **hiçbir ağ isteği yapmaz** (Android manifestinde INTERNET izni kapalı). Analitik, reklam ve üçüncü taraf SDK yoktur.
- Kişisel veri olarak yalnızca isteğe bağlı takma ad tutulur, o da cihazda kalır.
- Harici bağlantı, satın alma ve paylaşım düğmeleri yalnızca veli kapısının arkasında bulunur.

### 4.9 Erişilebilirlik ve çocuk UX'i
- Dokunma hedefleri en az 128×128 px (1080p tabanında ≈ 64 dp).
- Renk tek başına anlam taşımaz; renk her zaman şekil ya da ikonla birlikte kullanılır.
- **Yazı tipi:** Andika (SIL OFL) kullanılır. Harf izleme için dik temel harf yolları vektör olarak `trace` şablonunda tanımlanır. Lisansı uygun bir dik temel harf yazı tipi bulunursa (OFL / CC0) eklenir; lisans `assets/fonts/LICENSES.md`'ye yazılır.
- Metin her zaman büyük puntolu ve kısadır. 1. sınıf modunda ekran metni opsiyoneldir (veli ayarı).
- Animasyonlar yumuşaktır, yanıp sönme yoktur. Veli panelinde "hareketi azalt" seçeneği bulunur.

---

## 5. Görsel ve işitsel tasarım

### 5.1 Görsel stil — 3D kil / oyuncak
- Yumuşak hamur (plasticine) yüzey, hafif parmak izi dokusu ve mat malzeme.
- Sıcak stüdyo ışığı, yumuşak gölgeler, minyatür diorama hissi.
- Doygun "şeker" pastel palet. Her bölgenin baskın rengi farklıdır: Sayı Ormanı yeşil-turuncu, Harf Vadisi mor-pembe, Hayat Kasabası sarı-mavi, Keşif Laboratuvarı turkuaz-beyaz.
- Karakterler büyük başlı, büyük ve ifadeli gözlü, yuvarlak hatlıdır.
- **Görsellerde asla metin, harf ya da rakam üretilmez** (model Türkçe karakterleri bozar). Harf ve rakamlar oyun içinde yazı tipiyle, kil dokulu karolar üzerine çizilir.
- Ayrıntılar ve sabit prompt blokları: `docs/assets/style-guide.md`.

### 5.2 Asset üretim akışı
1. Ekip, `asset-requests/NNN-konu.md` dosyasında her görsel için hedef yolu, en-boy oranını, açıklamayı ve hazır İngilizce promptu yazar. Her prompt sabit stil bloğuyla başlar.
2. Sahip Nano Banana ile görseli üretir. Karakter tutarlılığı için ilgili referans görseli (ör. Bilge karakter sayfası) prompta ekler.
3. Arka planı siler (sprite ise), PNG olarak belirtilen yola koyar ve commit eder.
4. Oyun dosyayı otomatik olarak tanır; yer tutucunun yerini gerçek görsel alır.
5. Sesler için `asset-requests/` altındaki seslendirme dosyaları satır kimliğini, metni ve üslup talimatını içerir. Sahip bunları Gemini TTS ile üretip `assets/audio/voice/<kimlik>.wav|ogg` olarak koyar.

### 5.3 Ses
- **Anlatıcı:** sıcak, net, yavaş tempolu bir kadın ya da erkek sesi. Anlatıcı ve Bilge için tutarlı tek bir ses seçilir.
- **Bilge:** neşeli ve hafif yüksek perdeli.
- **Müzik:** her bölge için sakin, döngülenebilir, 60–90 sn'lik bir parça (önerilen kaynak Lyria/Gemini ya da CC0). Ağaç Evi ve menü için ayrı parçalar.
- **Efektler:** doğru (parlak "ding" + kısa arp), yanlış (yumuşak "boop", asla sert buzzer değil), yıldız, çıkartma, dokunma, sürükleme ve bırakma. Kaynak CC0 paketler (ör. Kenney) ya da üretim; lisanslar `assets/audio/LICENSES.md`'ye yazılır.

---

## 6. Hata yönetimi
- İçerik doğrulama hatası:
  - Geliştirme derlemesinde ekranda kırmızı hata kartı gösterilir ve log yazılır.
  - Sürüm derlemesinde hatalı durak gizlenir, log yazılır, çökme olmaz.
- Eksik asset: yer tutucu kullanılır (§4.5). Bu bir hata değildir.
- Kayıt okuma hatası: önce yedeğe dönülür; yedek de yoksa temiz kayıtla başlanır ve veli panelinde uyarı gösterilir.
- Şablon çalışma zamanı hatası: LessonRunner turu atlar ve "yardımlı" olarak işaretler. Çocuk bir sonraki tura geçer.

## 7. Test stratejisi
- **Birim (GUT):** mastery, leitner, stars, parent_gate_quiz, content_validator, save göçleri, asset_registry yol çözümü.
- **İçerik testi:** tüm `content/**.json` dosyaları ContentValidator'dan geçmelidir. CI bu testi zorunlu tutar.
- **Entegrasyon (GUT, headless):** LessonRunner bir ünitede sahte cevaplarla çalıştırılır; yıldız, ipucu tetiklenmesi, yardımlı turun yeniden sorulması ve Progress'e yazma doğrulanır.
- **Şablon testleri:** her şablon için `validate_params` testleri ve doğru/yanlış cevap simülasyonu yazılır.
- **Manuel:** her fazın sonunda Android cihazda kontrol listesi (`docs/qa-checklist.md`) uygulanır.

## 8. Yol haritası

| Faz | İçerik | Çıktı |
|---|---|---|
| 0 | Altyapı: Godot projesi, GUT, CI, Android export preset, isimlendirme ve stil dokümanları | Yeşil CI, boş açılış sahnesi, APK artefaktı |
| 1 | Çekirdek çatı: autoload servisleri, kayıt, profil, harita, patika, LessonRunner, sonuç/yıldız, çıkartma albümü, veli kapısı ve paneli, süre sınırı, yer tutucular, TTS yedeği + 3 şablon (`count_choose`, `drag_match`, `listen_find`) + 1. sınıf Matematik ilk ünitesi | **Oynanabilir dikey dilim** |
| 2 | Müfredat matrisi (3 sınıf × 4 ders), kaynaklı | `docs/curriculum/*` (outcomes, themes, game_map, matrix) |
| 3 | Matematik 1–3 içerikleri + gereken şablonlar (`sequence`, `balloon_pop`, `pattern`, `balance`, `clock_money`, `fraction_pizza`) | Sayı Ormanı tam |
| 4 | Türkçe 1–3 + `trace`, `syllable_build`, `story` | Harf Vadisi tam |
| 5 | Hayat Bilgisi 1–3 + `sort_bins`, `scenario` | Hayat Kasabası tam |
| 6 | Fen Bilimleri 3 | Keşif Laboratuvarı tam |
| 7 | Ağaç Evi dekorasyonu, Tekrar Bulutu, uyarlanabilir zorluk ince ayarı | Tam ödül ve tekrar döngüsü |
| 8 | Cila: erişilebilirlik denetimi, performans (düşük cihaz), ses miksajı, QA | Sürüm adayı |
| 9 | Yayın: Android imzalı AAB (Play Store / F-Droid), iOS (sahip, Mac üzerinde); opsiyonel Blender 3D maskot | v1.0 |

Her faz kendi uygulama planını (`docs/superpowers/plans/`) alır. İlk ayrıntılı plan Faz 0 ve Faz 1'i kapsar.

## 9. Riskler
| Risk | Önlem |
|---|---|
| AI görsellerinde stil ve karakter tutarsızlığı | Sabit stil bloğu, karakter sayfası referansı, küçük partiler halinde üretip gözden geçirme |
| Müfredat kodlarının yanlış girilmesi | Matris kaynaklı ve sayfa numaralı; validator matris dışı kodu reddeder |
| Cihazda Türkçe TTS sesinin bulunmaması | Metin balonu yedeği; gerçek ses dosyaları öncelikli asset partisi |
| Uygulama boyutu (çok sayıda görsel ve ses) | WebP/lossy içe aktarma, mono 22 kHz OGG, 2048 px üst sınır |
| Cloud ortamında Godot indirme ağ kısıtı | `scripts/setup-godot.sh`; ortamın GitHub release indirmesine izin vermesi gerekir |

## Açık sorular (Faz 1 uygulaması)
- **1. sınıf Matematik ünite 1 (MAT.1.1. Sayılar ve Nicelikler (1)) kapsamı:** MAT.1.1.7 (tahmin) yalnızca kısmen karşılanıyor. `count_choose` aralıklı seçeneklerle tahmine yönlendiriyor ama "önce tahmin et, sonra say ve karşılaştır" adımı yok; bunun için ayrı bir tahmin şablonu ya da modu gerekiyor. MAT.1.1.4 (çok/daha çok/az/daha az/eşit karşılaştırma) uygulanmadı, çünkü iki grubu yan yana gösteren bir karşılaştırma şablonu yok. Sahip Faz 3'te karar verecek.
  - **Karar (sahip onayıyla önerilen seçim, Faz 3b):** MAT.1.1.4 `balance` `scale/compare` + `item` gruplarıyla (bire bir eşleme çizgisi ipucu) karşılanır. MAT.1.1.7 `count_choose` tahmin moduyla karşılanır. Ünite içeriği Faz 3c'de yazılır.
- **Süre dolunca yarım kalan durak (R7):** Günlük süre bir durağın ortasında dolarsa yalnızca oynanan turların ustalığı kaydediliyor. Yıldız, çıkartma, oynama sayısı, Leitner değişikliği ve sonraki durağın açılması yok (`stars = 0`, `time_up = true`). Gerekçe: üç turdan birini oynamak §3.2'deki "durak tamamlama" sayılmamalı. Sahip kısmi ödül istiyorsa değiştirilecek. Sahip onayı bekleniyor.
  - **Karar (sahip onayıyla önerilen seçim, Faz 7a):** Mevcut davranış kalır: yalnızca oynanan turların ustalığı kaydedilir, ödül yok. Tekrar Bulutu yarıda kalırsa da yalnızca ustalık işlenir.
- **1 yıldızlı tekrar oyunda Leitner vadesi:** Bir durak yeniden oynanıp 1 yıldız alınınca çıktının Leitner kutusu değişmiyor, ama vade bugünden yeniden hesaplanıyor. Bu, tekrar tarihini ileri itebilir. Vade korunsun mu, yeniden mi hesaplansın?
  - **Karar (sahip onayıyla önerilen seçim, Faz 7a):** Kutu değişmiyorsa (yardımsız ve 2 yıldızın altında) mevcut vade korunur, ileri itilmez. Çıktı ilk kez oynanıyorsa vade 1. kutudan hesaplanır (bugün).
- **Cihaz saati ileri alınırsa:** `last_day_seen` asla azalmadığı için saat günlerce ileri alınıp geri getirilirse etkin gün ileride kalıyor. Süre sınırı o günlerce kilitli kalabilir, veli açması da gerçek tarih o güne yetişene kadar geçerli kalıyor. Bu, çevrimdışı bir sınırlama (güvenilir saat kaynağı yok). Kabul mü, yoksa veli panelinde "günü sıfırla" gibi bir çıkış mı gerekli?
  - **Karar (sahip onayıyla önerilen seçim, Faz 7a):** Veli panelinde veli kapısı arkasında "Günü sıfırla" düğmesi var: etkin gün cihazın bugününe döner, gelecekteki günün kullanımı sıfırlanır, gelecekteki veli açması iptal olur, çıktıların son oynanma günü ve tekrar vadesi bugüne çekilir (`scripts/core/day_reset.gd`).
- **Süre sınırı profil başına mı, cihaz başına mı:** Şu an günlük sayaç profil başına tutuluyor ve sınır ayarı tüm profiller için ortak. Süresi dolan çocuk başka bir profile geçerek yeniden oynayabilir. Sınır cihaz başına (tüm profillerin toplamı) mı olmalı?
  - **Karar (sahip onayıyla önerilen seçim, Faz 7a):** Cihaz başına: günlük sayaç kayıt kökündeki `usage` alanında bütün profiller için ortaktır, profil değiştirerek aşılamaz. Kayıt şeması v2'ye geçti; v1 kayıtlarda en son günün profil saniyeleri toplanarak taşınır.

## Açık sorular (Faz 2)
Faz 2 müfredat matrisinden (`docs/curriculum/outcomes.json`, `themes.json`, `game_map.json`) çıkan, sahip kararı bekleyen konular. 220 çıktının uyum dağılımı: Matematik 43 full / 34 partial / 0 none; Türkçe 4 / 26 / 27; Hayat Bilgisi 19 / 34 / 13; Fen 6 / 14 / 0.

- **Eşleme kuralı (dört derste aynı uygulandı):** Seçmeye dayalı bir süreç bileşeni, cevabı oyunun sunabileceği kapalı bir küme olduğunda oynanabilir sayılır (tanıma). Serbest üretim (listeleme, açıklama, tanım yapma, özetleme, sözlü ifade) konuşma ya da üretim gerektirir ve oynanabilir sayılmaz. Uygulamadaki ayrıntılar:
  - "İfade eder", "geneller", "değerlendirir", "yargıda bulunur", "önerme oluşturur" bileşenleri, cevap oyunun gösterdiği bir kümeden seçiliyorsa oynanabilir (ör. MAT.2.2.6 c, MAT.2.1.4 c). "Kendi cümleleriyle", "kendi ifadeleriyle", "sözlü olarak" geçen bileşenler oynanabilir değildir.
  - "Listeler", "örnek verir", "açıklar", "özetler", "tanımını yapar", "anlatır", "söyler", "öneride bulunur" serbest üretimdir. Buna karşılık "niteliklerini / özelliklerini tanımlar", gösterilen varlığa ait nitelikleri kapalı bir nitelik kümesinden seçmek olarak oynanabilir (FB.3.4.1 a, FB.3.8.2 a); tanım yapmak değildir.
  - Doğru cevabı olmayan kişisel tercihler (ilgi alanına göre seçme, merak ettiği konuyu belirleme, görüş bildirme, kendi duygusunu ifade) kapalı küme sayılmaz. Amaç oyunda verildiğinde "amacına uygun seçer" oynanabilir.
  - Çocuğun kendi süreci üzerindeki öz değerlendirme (hatalarını belirler, düzeltir, sonrakine aktarır; kendi ortamını gözden geçirir), gerçek veri toplama, ölçme, deney, grup etkinliği ve davranışın kendisi oynanabilir değildir. Oyun konuşmayı değerlendirmediği için konuşmada ve sesli okumada gerçekleşen bileşenler `none`/`partial` olur.
  - **Oyunun verdiği veri çocuğunkinin yerine ne zaman geçer:** Veriyi işleyen adımlar (sınıflandırma, karşılaştırma, veri setine ya da tabloya düzenleme, yorumlama, değerlendirme, sonuç çıkarma, tahminin geçerliliğini sorgulama) oyunun verdiği veri, bilgi ya da gözlem (animasyon, kart, tablo) üzerinde oynanabilir (ör. HB.1.5.1 c, HB.3.2.2 ç, FB.3.2.2 c, FB.3.5.2 b–d, FB.3.8.1 b). Genel bir beceri, oyunun sunduğu bir sahnede uygulanabilir (doğadaki ipuçlarından yön bulma HB.2.5.2, krokide konum belirleme HB.3.5.2 a, kurala uygun davranışı seçme). Deneyimden yararlanarak kapalı bir çıkarım yapmak da oynanabilir (MAT.2.1.10 b, MAT.3.1.14 b). Yerine geçmez: verinin kendisini toplamak, gözlemlemek, ölçmek ve kayıt tutmak; kendi deneyimini ilişkilendirmek ya da gözden geçirmek; çıktının konusu çocuğun kendisi olduğunda (bedeni, duyguları, güçlü yanları, tercihleri; HB.1.1.4, HB.1.4.4, HB.1.4.5, HB.3.1.1) ve çocuğun kendi belirli çevresi olduğunda (kendi sınıfı ve okulu HB.1.1.2, yakın çevresi HB.2.4.1, yaşadığı yer, kendi dinleme, konuşma, okuma ve yazma ortamı T.*.x.4). Bu durumlarda genel görsellerle pekiştirme çıktıyı karşılamaz.
  - Yazma: verilen içeriği iz sürerek (`trace`), hece ve harf karolarıyla (`syllable_build`) ya da sözcük kartlarıyla (`sequence`) yazmak oynanabilir. "Yazılarında … kullanır" biçimindeki bileşenler çocuğun kendi yazısını ister, oynanabilir değildir.
  - Süreç bileşeni olmayan Hayat Bilgisi çıktılarında karar, programın öğrenme-öğretme uygulamalarındaki etkinliklere göre verildi: davranış çıktılarında doğru davranışı durum içinde seçmek (`scenario`) oynanabilir, gerçek ortamda davranmak değildir.
  - `full` yalnızca bütün bileşenler mevcut 14 şablonla oynanabiliyorsa verildi. Önerilen bir mekanik gereken kayıt `partial` kaldı.
  Sahip bu kuralı onaylıyor mu? Değişirse bazı kayıtlar full ↔ partial arasında kayar.
- **(a) Önerilen mekanikler (`proposed`):** Aşağıdakiler §3.7 tablosuna eklenmedi. Eklensin mi, yoksa mevcut şablonların modu mu olsun? Türkçe ve Hayat Bilgisi eşlemesi yeni mekanik gerektirmedi.
  - **Karar (sahip onayıyla önerilen seçim, Faz 3b):** `compare_groups` → `balance` `compare` modu; `estimate_then_count` → `count_choose` ve `balance` için ortak tahmin modu; `grid_path` + `grid_draw` → tek `grid` şablonu (§3.7 #15); `chart_build` → yeni şablon (§3.7 #16); `free_build` → denetlenebilir hedefle `grid` modu (silüeti eşle, N parça kullan), ustalık hesabına girer. Ayrıntı: `docs/superpowers/plans/2026-10-06-faz3b-matematik-mekanikleri.md`. `docs/curriculum/game_map.json` buna göre güncellendi (Matematik: 50 full / 27 partial).
  - `compare_groups`: İki nesne grubu yan yana gösterilir, çocuk "daha çok / daha az / eşit" seçer, ipucu bire bir eşleme çizgileridir. 1 çıktı: MAT.1.1.4. `balance` şablonunun bir "karşılaştırma" modu olabilir (§3.7'de `balance` karşılaştırmayı zaten içeriyor).
  - `estimate_then_count`: Önce aralıklı seçenekle tahmin, sonra sayma, ekranda birim dizme, terazi ya da bardakla doldurma, hesaplama veya saat animasyonuyla kontrol, ardından tahmin ile sonucu karşılaştırıp "yakın / uzak" yargısını seçme. 14 çıktı: MAT.1.1.7, 1.1.8, 1.2.2, 2.1.6, 2.1.11, 2.2.2, 2.2.5, 2.3.5, 3.1.8, 3.1.14, 3.2.1, 3.2.3, 3.3.4, 3.3.5 (sayma, uzunluk, kütle, sıvı, çevre, süre ve zihinden işlem). Ayrı bir şablon yerine `count_choose`, `balance` ve doldurma etkileşimleriyle çalışan genel bir "tahmin et → kontrol et → karşılaştır" modu olarak tanımlanması önerilir. Tahmin bileşeni (seçenekli tahmin) mevcut `count_choose` ile oynanabilir sayıldı; yalnızca karşılaştırma ve yargı bu modu gerektiriyor.
  - `grid_path`: Kareli zeminde ok kartlarıyla (ileri, sağ, sol) karakteri hedefe götürme, yönergeyi izleme, en kısa yolu seçme, engel eklenince yeniden planlama. 2 çıktı: MAT.1.3.1, 2.3.6.
  - `grid_draw`: Kareli ya da noktalı zeminde kare boyayarak veya noktaları birleştirerek şekil çizme: simetrik tamamlama, kodlanmış yönergeyle çizim, şekli büyütme ya da döndürme. 4 çıktı: MAT.2.3.4, 3.3.3, 3.3.7, 3.3.8. `grid_path` ile örtüşüyor (ikisi de kareli zemin ve ok kodları; MAT.3.3.8 b esasen kalemli bir `grid_path`). Tek bir `grid` şablonu (hareket ve boyama modları) önerilir. MAT.2.3.4 b'deki döndürme ve büyütme ayrı bir jest isteyebilir.
  - `free_build`: Şekil ya da cisim parçalarını serbestçe birleştirerek özgün yapı veya model kurma (ağaç evi düzenleme etkileşimine benzer). 2 çıktı: MAT.2.3.2, 2.3.3. Değerlendirmesiz tanımlandı, ama `MiniGame` `answered(correct)` ve `RoundResult` üretmek zorunda (§4.4) ve ustalık (§3.4) bunlara dayanıyor. Ya denetlenebilir bir hedef verilmeli ("N küp kullan", "silüeti eşle") ya da bu etkinlik ustalık hesabının dışında tutulmalı. Hangisi?
  - `chart_build`: Sahnedeki nesneleri sayıp sürükleyerek çetele, sıklık tablosu ya da nesne, şekil veya nokta grafiği oluşturma, sonra grafikle ilgili soruları yanıtlama. 3 çıktı: MAT.1.4.1, 2.4.1, 3.4.1.
  - **`trace` ile çok basamaklı sayı yazma:** MAT.2.1.1 c ve MAT.3.1.1 c'de 2–3 basamaklı sayı yazımı `trace` ile eşlendi. 2–3. sınıfta iz sürme yerine rakam tuş takımı ya da rakam karosu girişi daha uygun olabilir. Hangisi?
    - **Karar (sahip onayıyla önerilen seçim, Faz 3b):** 2–3. sınıfta rakam karosu girişi (ortak `digit_input` bileşeni, `listen_find` `answer: digits`). 1. sınıfta rakam yazımı `trace` ile kalır.
- **(b) `fit: none` çıktılar:** 40 çıktı hiçbir şablonla oynanamıyor: Matematik 0, Türkçe 27, Hayat Bilgisi 13, Fen 0. Türkçede bunlar ağırlıkla konuşma, sesli okuma, serbest yazma ve öz değerlendirme çıktıları. Hayat Bilgisinde konusu çocuğun kendisi (bireysel özellikleri, millî ve dinî günlerdeki duyguları, merak ettikleri, güçlü yanları) ya da kendi çevresi (kendi okulu, yakın çevresi) olan çıktılar, gerçek tanışma, sınıf içi grup etkinliği ve proje çıktıları. Ayrıca `partial` kayıtların notlarında oynanamayan bileşenler için ev ve veli etkinliği ipuçları var. Bu çıktılar veli panelinde çıktı bazında bir "evde etkinlik önerisi" metni olarak yer alsın mı? (Metinler `content/` JSON'unda tutulur, çevrimdışıdır, ustalık hesabına girmez.)
  - **Karar (sahip onayıyla önerilen seçim, Faz 7a):** Eklendi. `content/home_activities.tr.json` 40 `none` çıktının hepsi ve oynanamayan bileşeni evde yapılabilen 105 `partial` çıktı için çıktı bazında öneri metni tutar (yalnızca önerilen mekaniği eksik olan MAT.1.2.2, MAT.2.2.2, MAT.3.2.1 dışarıda). Veli paneli seçili profilin sınıfının önerilerini ders bazında gösterir; çevrimdışıdır, ustalık hesabına girmez. Dosya `scripts/core/home_activities.gd` doğrulamasından geçer (kod `outcomes.json`'da olmalı, `full` çıktıya öneri yazılmaz, her `none` çıktının önerisi bulunur).
- **(c) `declared_count_note` ve `manual_note`:** Faz 2 verisinde hiç yok. Bütün temalarda programdaki çıktı sayısı tema gövdesiyle uyuştu (`declared_count_note` gerekmedi) ve bütün çıktılar PDF dökümünden doğrudan doğrulandı (`text_check: manual` gerekmedi).
- **(d) Tema sırası:** `themes.json` programın işleniş sırası tablosunu izler. 1. sınıf Matematikte bu sıra `t01` Nesnelerin Geometrisi (1), `t02` Sayılar ve Nicelikler (1), `t03` Sayılar ve Nicelikler (2), `t04` İşlemlerden Cebirsel Düşünmeye, `t05` Sayılar ve Nicelikler (3), `t06` Nesnelerin Geometrisi (2), `t07` Veriye Dayalı Araştırma şeklindedir. Faz 1 dilimi ise Sayılar ve Nicelikler (1) ile başlıyor (`g1.matematik.u01` = `t02`). 1. ve 2. sınıf Matematik tema gövdelerindeki "N. TEMA" numaralandırması da tablodan farklı (gövdede Sayılar ve Nicelikler 1. tema). Faz 3'te ünite dosyaları işleniş sırasına göre mi numaralanacak (geometri önce), yoksa Faz 1'deki gibi gövde numaralandırmasına göre mi?
- **(e) Sessiz okuma modu:** Okuma çıktıları (T.O.*) `story` ve `drag_match` ile eşlendi. Bu eşleme yalnızca metin, ilk cevaba kadar seslendirilmeden gösterilirse okumayı ölçer; aksi halde dinlemeyi ölçer ve T.D.* çıktılarını tekrarlar. `story` ve `drag_match` için T.O.* duraklarında "sessiz okuma modu" (seslendirme ilk cevaptan sonra ya da ikinci yanlışta ipucu olarak açılır) eklensin mi? İlgili kayıtların notlarında bu bağımlılık yazıyor. Yönerge (komut cümlesi) yine seslendirilir ve tekrar dinlenebilir; yalnızca okuma parçasının seslendirmesi ilk cevaba kadar tutulur, dolayısıyla "bütün yönergeler seslendirilir" kuralıyla çelişmez. Mod eklenmezse okuma bileşenleri oynanamaz olur: T.O.1.3 (tek bileşen) `none`'a, T.O.1.2 en fazla `partial`'a düşer (yalnızca c'deki görselden tahmin kalır); T.O.1.1 b–c ve ğ, T.O.2.1 a, T.O.2.2 a–f, T.O.2.3 b–ç, T.O.3.1 a, T.O.3.2 a–h ve T.O.3.3 b–e notları "oynanamaz" olarak değişir, bu kayıtların çoğu `none` olur.
  - **Karar (sahip onayıyla önerilen seçim, Faz 4a):** Sessiz okuma kipi eklendi (`story` ve `drag_match`, `read: "silent"`). Yönerge ve sorular her zaman seslendirilir; okuma parçasının (sayfa metni, kart sözcüğü) sesi ilk cevaptan sonra hoparlörle açılır ve ikinci yanlışta ipucu olarak kendiliğinden okunur. T.O.* durakları bu kipi kullanır; eşleme notları değişmez. Ayrıntı: `docs/superpowers/plans/2026-10-04-faz4a-turkce-sablonlari.md`.

## Açık sorular (Faz 4a)
- **Dik temel harf vuruş sırası ve yönü:** `trace` şablonunun iz yolları (`content/trace/glyphs.json`: 29 küçük, 29 büyük harf, 10 rakam) MEB'in 1. sınıf yazım yönergesiyle birebir karşılaştırılamadı; resmi bir vektör kaynak bulunamadı. Yollar yaygın dik temel harf öğretimine göre yazıldı (yukarıdan aşağıya, soldan sağa, yuvarlak harflerde saat yönünün tersi). Önerilen seçimle ilerlendi: bir sınıf öğretmeni glifleri gözden geçirir (`docs/qa-checklist.md` Faz 4a), düzeltme yalnızca veri dosyasında yapılır. Özellikle bakılacaklar: `T` (önce yatay mı, dikey mi), `5` (üst çizgi en son), `k` / `K` (kol tek vuruş), `y` (iki vuruş), büyük harflerde noktanın ve şapkanın yeri.
- **Karar (önerilen seçim):** `trace` toleransı cömert (zorluğa göre 0.34 / 0.27 / 0.21 birim, 1 birim ≈ 180 px), yön ve sıra ipucu kalem canlandırmasıyla verilir. Yoldan çıkmak ceza değildir: ilerleme silinmez, yön ipucu hemen oynar; §3.3 akışı için bir yanlış sayılır.
- **Karar (önerilen seçim):** `syllable_build` hece ve harf karoları içerik JSON'unda düz metindir (`"parts": ["el", "ma"]`); rakamlar gibi öğrenme malzemesi sayıldı. Hikâye sayfaları, sorular ve metin seçenekleri `strings.tr.json` anahtarıdır; `ContentValidator` params içindeki `voice` ve `text` anahtarlarını da denetler.

## Açık sorular (Faz 4b)
- **Karar (sahip onayıyla önerilen seçim, Faz 4b):** 1. sınıf Türkçe harf sırası programın ses grubu sırasını izler (a n e t i l / o k u r ı m / ü s ö y d z / ç b g c ş / p h v ğ f j; program PDF s. 7, Şekil 1); temaların harf ve rakamları tema tanıtımlarından alındı (s. 27, 32, 37, 42). `fit: none` çıktılar oyuna girmez, evde etkinlik önerilerinde kalır. Harf ünitelerinde okunan ve yazılan her öğe yalnızca öğrenilmiş harflerden oluşur. Ayrıntı: `docs/superpowers/plans/2026-10-04-faz4b-turkce-1.md`.
- **Hikâye ve cümle metinleri:** Program her tema için şiir ve öyküleyici dinleme metinleri ister ama metin vermez. Kısa özgün metinler yazıldı; bir sınıf öğretmeninin düzey ve tema uygunluğu açısından gözden geçirmesi önerilir. Önerilen seçimle ilerlendi.
- **Harf sesi kayıtları:** Harf duraklarında harfin adı değil sesi okunmalı. Kayıt (parti 064) gelene kadar cihaz TTS'i bazı ünsüzleri adıyla ("ne", "te") okuyabilir. Önerilen seçim: 064 öncelikli üretilir; TTS tek sesi doğru üretemezse sahip kendi sesiyle kaydeder.

## Açık sorular (Faz 3b)
Faz 3b'de sahibin talimatıyla önerilen seçimle ilerlendi; aşağıdakiler sonraki fazlarda karar ister.
- **Tahmin modunun diğer kontrol adımları:** Tahmin modu sayma (`count_choose`), birim küple tartma ve zihinden toplama/çıkarma (`balance`) ile yazıldı. Sıvıyı bardakla doldurma (MAT.2.3.5, 3.3.5), cetvel ya da birim dizme ile uzunluk (MAT.1.1.8 uzunluk kısmı, 2.1.11), saat animasyonuyla süre (MAT.3.1.14), birim kenar sayarak çevre (MAT.3.3.4) ve çarpma/bölme tahmini (MAT.2.2.5, 3.2.3) için kontrol adımı yok; bu çıktılar `partial` ve `proposed: estimate_then_count` olarak kaldı. Ayrıca `count_choose` en çok 20 nesne gösterdiği için 50'ye ve 100'e kadar tahmin (MAT.2.1.6, 3.1.8) için gruplu sayma adımı gerekir. Önerilen seçim: ilgili içerik fazında (3d, 3e) bu kontrol adımları mevcut şablonlara (`count_choose`, `clock_money`, `grid`, `balance`) mod olarak eklenir.
  - **Karar (sahip onayıyla önerilen seçim, Faz 3d):** 2. sınıf için yeni mod eklenmedi. Sıvı (MAT.2.3.5), uzunluk ve kütle (MAT.2.1.11) tahminlerinin kontrol adımı bardak, metre çubuğu, santimetre küpü ve kilogramlık ağırlık resimlerini `count_choose` tahmin modunda saymaktır; çarpma/bölme tahmini (MAT.2.2.5) `balance` tahmininde tekrarlı toplama olarak yazıldı. Bu çıktıların `proposed` alanı kaldırıldı, `fit` `partial` kaldı (gerçek ölçme ev etkinliğidir). MAT.2.1.6'da sayılar 20 ile sınırlı; 21–50 arası gruplu sayma adımı 3e'ye (MAT.3.1.8 ile birlikte) açık kalır.
- **`grid` döndürme ve büyütme (MAT.2.3.4 b):** İlk sürümde yok; `proposed: grid_transform` olarak kaldı. Önerilen seçim: `paint/copy` modunun hedefi döndürülmüş ya da ölçeklenmiş referansla gösterilir (yeni jest gerekmez), 3d'de eklenir.
  - **Karar (sahip onayıyla önerilen seçim, Faz 3d):** eklendi. `grid` `paint/copy` + `transform: rotate | scale` + `reference`; döndürmede yer serbest, büyütmede her kare 2 × 2. `proposed: grid_transform` kaldırıldı.

## Açık sorular (Faz 3d)
Faz 3d'de sahibin talimatıyla önerilen seçimle ilerlendi; aşağıdakiler sahibin onayını bekler.
- **MAT.2.3.2 / 2.3.3 eşlemesine `scenario`:** "yapıyı oluşturan cisimleri / modeli oluşturan şekilleri belirleme" turları, yapı ya da model resmini sahne kartında gösterip "kulesi hangi cisim?" diye soran `scenario` turlarıyla yazıldı; `game_map.json` eşlemesine `scenario` eklendi. Gerçek bloklarla yapı kurmak ev etkinliği olarak kalır (`fit: partial`).
- **MAT.2.4.1 veri grubu sayısı:** program metni "en çok iki veri grubu" diyor; bu, iki kategori olarak yorumlandı ve bütün `chart_build` turları iki kategoriyle yazıldı. Yorum "iki ayrı veri seti" ise 3–4 kategorili turlar eklenebilir.
- **Yer tutucu etiketleri:** asset gelene kadar kartlarda nesnenin adı (`label.*`) yazılı görünür. Okuma bilmeyen çocuk için bu bir ipucu değildir ama 2. sınıfta "adı okuyup bulma" kolaylığı yaratır; asset partileri 040–043 tamamlanınca kendiliğinden kalkar.

## Açık sorular (Faz 6)
- **Keşif Laboratuvarı 1–2. sınıfta nasıl görünür?** §2 "kilitli/gizli", §3.1 "yakında açılacak görseliyle kapalı" diyor.
  - **Karar (sahip onayıyla önerilen seçim, Faz 6):** Gizlenmez, kilitli görünür: bölge haritada soluk, sis ve kilit ikonuyla durur; dokununca Bilge "Üçüncü sınıfta kapıları açılacak" der (`vo.bolge.kilitli_lab`). Merak uyandırır, ceza hissi vermez. Davranış Faz 1'den beri `scenes/ui/world_map.gd`'de var.
- **Karar (önerilen seçim, Faz 6):** Fen ünite dosyaları programın işleniş sırasını izler (`g3.fen.uNN` = `themes.json` `g3.fen.tNN`). Her turun şablonu `game_map.json`'da o çıktı için listelenen şablonlardan biridir; eşlemede `scenario` olmayan çıktılarda sesli seçenekten seçme `listen_find` ile (soru hedefin sesi, seçenekler metin kartı) yazılır. Fen görselleri `item.fen.<ad>` (senaryo sahneleri `item.fen.sahne.<ad>`) anahtarlarıyla `assets/images/items/fen/` altında toplanır. FB.3.1.2 hikâyesindeki bilim insanları kurgusaldır. Ayrıntı: `docs/superpowers/plans/2026-10-05-faz6-fen3.md`.

## Açık sorular (Faz 4c)
- **Ünite ve durak düzeni (2–3. sınıf Türkçe):** Spec Türkçe 2–3 için durak yapısını tanımlamıyor. Önerilen seçimle ilerlendi: `uNN` = `themes.json` `g<N>.turkce.tNN` (Faz 2 (d) kararı); her ünite aynı beş duraktan oluşur: Dinle ve Anla (T.D.x.3, T.D.x.2), Doğru Seçim (T.K.x.1, T.D.x.1; 3. sınıf 3. ve 8. temada T.K.3.5), Sessiz Oku (T.O.x.*), Olay Sırası (2. sınıf T.K.2.2) ya da Konuşmayı Tahmin Et (3. sınıf T.K.3.2), Yazım Kuralları (T.Y.x.3). Temalar arasında farklılaşan yalnızca metinlerin konusudur, çünkü programda bütün temalar aynı çıktıları tekrarlar. `fit: none` çıktılar oyunda yer almaz (veli panelindeki evde etkinlik önerilerinde zaten var).
- **Karar (önerilen seçim):** Okuma durakları (`T.O.*` ile başlayan) `story` ve `drag_match` turlarını sessiz okuma kipinde oynatır; içerik kapısı (`tests/unit/test_turkce_g23_content.gd`) bunu denetler.
- **Karar (önerilen seçim):** Metin karoları boşluktan iki satıra bölünebilir (`token_view.gd`); her metin karosunda yazı en az 34 px olur (1920×1080 tuval). Kapı testi her 2–3. sınıf Türkçe karosunu şablonun gerçek karo boyuyla ölçer.
- **Kaynak kitap metni yok:** Hikâye ve okuma metinleri ders kitaplarından alınmadı; programın tema adlarına göre özgün yazıldı. Tarihî bilgiler (Atatürk'ün doğum yeri ve yılı, anne ve babasının adı, "Kemal" adı, 23 Nisan, Seyit Onbaşı) yaygın bilinenlerle sınırlı tutuldu. Bir sınıf öğretmeninin metinleri gözden geçirmesi önerilir (`docs/qa-checklist.md` Faz 4c).

## Açık sorular (Faz 5b)
Hayat Bilgisi 1–3 içeriği (Hayat Kasabası). Ayrıntı: `docs/superpowers/plans/2026-10-05-faz5b-hayat-bilgisi.md`.
- **Karar (önerilen seçim):** Oynanabilir 53 HB çıktısının her biri bir durakla oyunda (17 ünite, 53 durak, 173 tur). 1. sınıf 6. tema (Bilim, Teknoloji ve Sanat) üç çıktısı da `none` olduğundan ünite dosyası yok; bu tema yalnızca veli panelindeki evde etkinlik önerilerinde yer alır.
- **Karar (önerilen seçim):** Gerçek kişiler (Atatürk, Mehmet Akif Ersoy, sanatçılar) görselle gösterilmez; yerler ve semboller kullanılır (§5.1, stil rehberi "Kaçınılacaklar").
- **Karar (önerilen seçim):** 1. sınıfta seçenekler görsel karttır (tek istisna: HB.1.4.3'te Atatürk'ün anne ve baba adları). Metin seçenekli hikâye sorularında soru cümlesi seçenekleri de sesli söyler, çünkü `story` seçenekleri seslendirmez.
- **Karar (önerilen seçim):** `game_map.json`'daki şablonlar öneri sayıldı; birkaç çıktıda başka bir şablon daha uygun düştü (ör. HB.3.2.2 a'da `listen_find` hedefin adını seslendirip cevabı söyleyeceği için `scenario`). Eşleme değerleri değişmedi.
- **Öğretmen gözden geçirmesi (önerilen seçimle ilerlendi):** Atatürk'ün hayatı ve okulları (HB.1.4.3, HB.2.4.3, HB.3.4.3), millî ve dinî bayram hikâyeleri (HB.2.4.4, HB.2.4.5) ve doğada yön bulma ipuçları (HB.2.5.2; Kutup Yıldızı kuzey, yosun genellikle kuzeye bakan yüzde) programın öğrenme-öğretme uygulamalarına göre yazıldı. Bir sınıf öğretmeni metinleri gözden geçirir (`docs/qa-checklist.md` Faz 5b); düzeltme yalnızca `content/` dosyalarında yapılır.
