# Müfredat matrisi

> Bu dosya üretilmiştir, elle düzenleme. Kaynak: `outcomes.json`, `themes.json`, `game_map.json`. Yeniden üretmek için: `godot --headless --path . -s res://tools/curriculum_report.gd`.

## Özet

| Sınıf | Ders | Çıktı | tam (full) | kısmi (partial) | yok (none) |
|---|---|---|---|---|---|
| 1 | Matematik | 19 | 15 | 4 | 0 |
| 1 | Türkçe | 17 | 3 | 8 | 6 |
| 1 | Hayat Bilgisi | 23 | 8 | 7 | 8 |
| 2 | Matematik | 25 | 13 | 12 | 0 |
| 2 | Türkçe | 20 | 1 | 8 | 11 |
| 2 | Hayat Bilgisi | 23 | 6 | 15 | 2 |
| 3 | Matematik | 33 | 22 | 11 | 0 |
| 3 | Türkçe | 20 | 0 | 10 | 10 |
| 3 | Hayat Bilgisi | 20 | 5 | 12 | 3 |
| 3 | Fen Bilimleri | 20 | 6 | 14 | 0 |
| **Toplam** | | **220** | **79** | **101** | **40** |

Uygunluk: **tam** = bütün süreç bileşenleri dokunmatik oyunla çalışılabilir; **kısmi** = bir kısmı (hangisi olduğu Not sütununda); **yok** = konuşma, kâğıda yazma, grup ya da beden etkinliği ya da gerçek dünyada gözlem gerektirir.

## 1. sınıf

### Matematik

#### MAT.1.3. Nesnelerin Geometrisi (1)

`g1.matematik.t01` · işleniş sırası 1 · programda 2 çıktı · PDF s. 39

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| MAT.1.3.1 | Hedefe ulaşmak için mesafeleri ve yönleri içeren yönergeleri çözümleyebilme | 39 | tam | `listen_find`, `sequence`, `grid` | a) yer, yön ve konum kavramlarını belirleme listen_find ile, b) yönergeleri izleyerek başlangıçtan hedefe gitme grid (path: follow ve build) ile oynanabilir. |
| MAT.1.3.2 | Nesnelerin eşliğini değerlendirebilme | 39 | tam | `drag_match`, `listen_find` | a) ölçüt (renk, şekil, büyüklük) sesli seçenekler arasından seçilir; b–ç) ölçme, nesnelerin görsel özelliklerini ölçütle karşılaştırma olarak ekranda yapılır. |

#### MAT.1.1. Sayılar ve Nicelikler (1)

`g1.matematik.t02` · işleniş sırası 2 · programda 7 çıktı · PDF s. 20

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| MAT.1.1.1 | Rakamları ve 20’ye kadar olan sayıları (20 dâhil), niceliklerin büyüklüklerini temsil etmek için kullanabilme | 20 | tam | `count_choose`, `drag_match`, `listen_find`, `trace` | c) rakam ve sayı yazma trace ile çalışılır. |
| MAT.1.1.2 | Ögeleri dağınık veya düzenli bir şekilde bulunan bir nesne grubunu sayarken parçalar arasında ilişkileri çözümleyebilme | 20 | tam | `count_choose`, `drag_match`, `sort_bins` |  |
| MAT.1.1.3 | Nesnelerin sıra sayısını gösterebilme | 20 | tam | `listen_find`, `sequence` |  |
| MAT.1.1.4 | İki niceliğin büyüklüğünü “çok”, “daha çok”, “az”, “daha az” veya “eşit” terimleriyle karşılaştırabilme | 20 | kısmi | `drag_match`, `balance` | a) iki niceliği çok/daha çok/az/daha az/eşit terimleriyle karşılaştırma balance (scale/compare, item grupları, 1. sınıfta sözcük kartı, bire bir eşleme çizgisi ipucu) ile, bire bir eşleme drag_match ile oynanabilir; b–c) benzerlik ve farklılıkları listeleme sözlü etkinlik. |
| MAT.1.1.5 | 100’e kadar ileriye ve 20’den geriye doğru ritmik sayabilme | 20 | tam | `sequence`, `pattern`, `count_choose` |  |
| MAT.1.1.6 | Artan veya azalan sayı ve şekil örüntülerini çözümleyebilme | 20 | tam | `pattern`, `sequence` |  |
| MAT.1.1.7 | Verilen bir çokluktaki ilişkilerden yararlanarak 20’ye kadar (20 dâhil) olan nesnelerin sayısını tahmin edebilme | 20 | tam | `count_choose` | b) çokluğun büyüklüğünü aralıklı seçeneklerle tahmin etme, a) ekrandaki çokluğu gözleyip tahmine bağlama ve c) tahmini sayma sonucuyla karşılaştırıp yakın/uzak yargısında bulunma count_choose tahmin modu (estimates) ile oynanabilir. |

#### MAT.1.1. Sayılar ve Nicelikler (2)

`g1.matematik.t03` · işleniş sırası 3 · programda 1 çıktı · PDF s. 26

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| MAT.1.1.8 | Standart olmayan uygun ölçme araçları ile nesnelerin uzunluğunu ve tartacağı kütlenin ölçüm sonuçlarını tahmin edebilme | 26 | kısmi | `listen_find`, `count_choose`, `balance` | a) uzunluğa ve kütleye uygun standart olmayan ölçme aracını belirleme listen_find ile, b) ölçüm sonucunu belirlenen birim cinsinden aralıklı seçeneklerle tahmin etme count_choose ile oynanabilir; c) kütle tahminini terazide birim küplerle sınayıp yakın/uzak yargısında bulunma balance tahmin modu (item + value) ile oynanabilir; uzunluk tahminini ekranda birim dizerek sınama için tahmin modunun dizme adımı henüz yok (spec Açık sorular, Faz 3b); kütleyi elde tartarak tahmin ve gerçek nesneyle ölçme ev etkinliği. |

#### MAT.1.2. İşlemlerden Cebirsel Düşünmeye

`g1.matematik.t04` · işleniş sırası 4 · programda 4 çıktı · PDF s. 34

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| MAT.1.2.1 | Günlük yaşamın içerdiği toplama ve çıkarma işlemlerini çözümleyebilme | 34 | tam | `story`, `drag_match`, `listen_find` |  |
| MAT.1.2.2 | Toplama ve çıkarma işlemlerinin sonuçlarını tahminde bulunarak ve zihinden işlem yaparak muhakeme edebilme | 34 | tam | `balloon_pop`, `drag_match`, `count_choose`, `balance` | a–b) işlem ögelerini ve aralarındaki ilişkileri belirleme oynanabilir; c–ç) sonucu tahmin edip zihinden işlem sonucuyla karşılaştırma ve tutarlılığı (yakın/uzak) seçme balance tahmin modu (eksik değerli terazi) ile oynanabilir. |
| MAT.1.2.3 | Eşit işaretinin anlamını toplama ve çıkarma işlemi bağlamında yorumlayabilme | 34 | kısmi | `balance`, `drag_match` | a–b) eşit işaretini terazi modeliyle inceleme ve işlemi dönüştürme oynanabilir; c) dönüştürdüğü işlemleri kendi cümleleriyle ifade etme sözlü etkinlik. |
| MAT.1.2.4 | Toplama ve çıkarma işlemlerinin ilişkisini yorumlayabilme | 34 | tam | `drag_match`, `balance` | c) ilişkiyi yeniden ifade etme, işlem ailesini model ve işlem kartlarıyla eşleştirerek çalışılır. |

#### MAT.1.1. Sayılar ve Nicelikler (3)

`g1.matematik.t05` · işleniş sırası 5 · programda 1 çıktı · PDF s. 31

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| MAT.1.1.9 | Paraların (1 TL, 5 TL, 10 TL, 20 TL, 50 TL, 100 TL ve 200 TL) temsil ettiği büyüklükleri tanıyabilme | 31 | tam | `clock_money`, `drag_match`, `listen_find` |  |

#### MAT.1.3. Nesnelerin Geometrisi (2)

`g1.matematik.t06` · işleniş sırası 6 · programda 3 çıktı · PDF s. 43

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| MAT.1.3.3 | Günlük yaşamdaki nesneleri biçimsel özelliklerine göre ayırt edebilme | 43 | tam | `sort_bins`, `drag_match` |  |
| MAT.1.3.4 | Günlük yaşamda karşılaşılan geometrik yapılardaki geometrik şekilleri çözümleyebilme | 43 | tam | `listen_find`, `count_choose`, `drag_match` |  |
| MAT.1.3.5 | Biçimsel özelliklerine göre geometrik şekilleri sınıflandırabilme | 43 | tam | `sort_bins`, `drag_match`, `listen_find` |  |

#### MAT.1.4. Veriye Dayalı Araştırma

`g1.matematik.t07` · işleniş sırası 7 · programda 1 çıktı · PDF s. 47

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| MAT.1.4.1 | Kategorik veriye dayalı temel veri grubu ile çalışabilme ve veriye dayalı karar verebilme | 47 | kısmi | `listen_find`, `count_choose`, `sort_bins`, `chart_build` | d) görselleştirme aracını seçme, f) hazır nesne grafiğini yorumlama ve g) sonuçları oyunda verilen araştırma sorusuna göre değerlendirme oynanabilir; e) verilen veriyle çetele, tablo ve grafik oluşturma chart_build ile oynanabilir; a–c) araştırma durumunu ve sorularını belirleme ve plan yapma çocuğun kendi araştırması, ç) veri toplama gerçek dünya etkinliği (sınıf ya da ev). |

### Türkçe

#### İLK OKUMA YAZMAYA HAZIRLIK ÇALIŞMALARI

`g1.turkce.t01` · işleniş sırası 1 · programda 3 çıktı · PDF s. 25

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.1.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 202 | kısmi | `listen_find`, `story`, `sort_bins` | a) sese karşılık gelen harfi tanıma ve b) sesin kaynağını tahmin etme listen_find ile; c) görselden metin hakkında tahmin, ç) yaşantı ve ön bilgiyle çıkarım, e–f) olayların öncesi ve sonrası hakkında tahmin story ile; g) iletileri doğruluk ve gerçeklik açısından ayırma ve ğ) nesneleri fiziksel özelliklerine göre sınıflandırma sort_bins ile oynanabilir; d) sesin geçtiği sözcüklere örnek verme serbest sözlü üretim. |
| T.D.1.3 | Dinlediklerini/izlediklerini çözümleyebilme | 202 | tam | `listen_find`, `sort_bins`, `story`, `drag_match` | a) doğal ve yapay sesleri ayırt etme sort_bins, b) ses–harf ayırt etme listen_find, c) konuyu bulma ve ç) iletilerin benzerliklerini belirleme story anlama soruları, d) söylem–görsel ilişkisi drag_match ile çalışılır. |
| T.Y.1.1 | Yazılı anlatım becerilerini yönetebilme | 204 | kısmi | `trace`, `syllable_build`, `sequence` | b) çizgi çalışmaları trace ile (boyama kâğıt etkinliği); c) harf yazma trace, hece ve sözcük yazma syllable_build, cümle yazma sözcük kartlarını sıralayarak sequence ile; d) verilen kısa metne bakarak sözcük ve cümleleri karolarla yazma ve e) söylenen sözcük ve cümleleri yazma aynı yollarla oynanabilir; a) yazma materyallerini kullanma kâğıt ve kalem gerektirir, ç) kısa metin yazma ve f) yazışmayı selamlaşma ve hitapla başlatma serbest yazılı üretim. |

#### 1. TEMA: GÜZEL DAVRANIŞLARIMIZ

`g1.turkce.t02` · işleniş sırası 2 · programda 10 çıktı · PDF s. 28

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.1.1 | Dinlemeyi/izlemeyi yönetebilme | 202 | kısmi | `listen_find`, `scenario` | a) öğrendiği sesin geçtiği görseli seçme listen_find ile, b) oyunda verilen amaca uygun dinleyeceğini seçme scenario ile oynanabilir; c) dinleme kurallarına uygun dinleme ve ç) uygun zamanda söz alma gerçek iletişimde gözlenen davranış. |
| T.D.1.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 202 | kısmi | `listen_find`, `story`, `sort_bins` | a) sese karşılık gelen harfi tanıma ve b) sesin kaynağını tahmin etme listen_find ile; c) görselden metin hakkında tahmin, ç) yaşantı ve ön bilgiyle çıkarım, e–f) olayların öncesi ve sonrası hakkında tahmin story ile; g) iletileri doğruluk ve gerçeklik açısından ayırma ve ğ) nesneleri fiziksel özelliklerine göre sınıflandırma sort_bins ile oynanabilir; d) sesin geçtiği sözcüklere örnek verme serbest sözlü üretim. |
| T.D.1.3 | Dinlediklerini/izlediklerini çözümleyebilme | 202 | tam | `listen_find`, `sort_bins`, `story`, `drag_match` | a) doğal ve yapay sesleri ayırt etme sort_bins, b) ses–harf ayırt etme listen_find, c) konuyu bulma ve ç) iletilerin benzerliklerini belirleme story anlama soruları, d) söylem–görsel ilişkisi drag_match ile çalışılır. |
| T.D.1.4 | Dinleme/izleme sürecini değerlendirebilme | 202 | yok |  | Bileşenler (a–c) çocuğun kendi dinleme sürecindeki hatalarını belirlemesi, düzeltmesi ve uygun davranışları sonraki dinlemelerine aktarması; öz değerlendirme oyunda denetlenemez. Yönergeyi tekrar dinleme ve yeniden deneme akışı (§3.3) süreci destekler ama ölçmez. |
| T.K.1.2 | Konuşmalarında içerik oluşturabilme | 202 | kısmi | `story` | d) görselden dinleyeceği metin hakkında tahmin story ile oynanabilir; a–c), ç) ve e–j) bileşenleri çocuğun kendi konuşmasında gerçekleşir (konuşma, anlatma, konuşmalarında karşılaştırma ve sınıflandırma, kendi cümleleriyle ifade, öneri, görsel ve benzetme kullanma); sözlü üretim. |
| T.K.1.3 | Konuşma kurallarını uygulayabilme | 203 | yok |  | Bileşenler (a–f) sesli söyleme, konuşma hızı, telaffuz, sözcükleri yerinde kullanma, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez (veli ile sesli anlatma önerilebilir). |
| T.O.1.1 | Okuma sürecini yönetebilme | 203 | kısmi | `drag_match`, `story` | b) sözcükleri ve c) basit, kısa cümleleri sessiz okuyup görselle eşleştirme drag_match ile; e) metnin başlık ve görsellerini inceleme ve ğ) kısa metinler arasından seçtiği metni okuyup anlama sorularını yanıtlama story ile oynanabilir; a) harf ve heceleri seslendirme, ç) telaffuz, d) işitilebilir sesle okuma, f–g) sesli okuma ve h) noktalamaya dikkat ederek okuma sesli okuma gerektirir (oyun çocuğun sesini değerlendirmez). Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.Y.1.1 | Yazılı anlatım becerilerini yönetebilme | 204 | kısmi | `trace`, `syllable_build`, `sequence` | b) çizgi çalışmaları trace ile (boyama kâğıt etkinliği); c) harf yazma trace, hece ve sözcük yazma syllable_build, cümle yazma sözcük kartlarını sıralayarak sequence ile; d) verilen kısa metne bakarak sözcük ve cümleleri karolarla yazma ve e) söylenen sözcük ve cümleleri yazma aynı yollarla oynanabilir; a) yazma materyallerini kullanma kâğıt ve kalem gerektirir, ç) kısa metin yazma ve f) yazışmayı selamlaşma ve hitapla başlatma serbest yazılı üretim. |
| T.Y.1.2 | Yazılarında içerik oluşturabilme | 204 | kısmi | `syllable_build`, `drag_match` | a) görselle ilgili sözcüğü hece ve harf karolarıyla yazma syllable_build ile, b) sözcük ve cümlelerde eksik bırakılan harf, hece ya da sözcüğü tamamlama syllable_build ve drag_match ile oynanabilir; c–h) yazıyı devam ettirme, yazılarında karşılaştırma ve sınıflandırma, olayları kendi ifadeleriyle yazma, görsel kullanma, kısa metin yazma, muhataba göre yazma ve benzetme serbest yazılı üretim. |
| T.Y.1.3 | Yazma kurallarını uygulayabilme | 204 | kısmi | `trace`, `sequence`, `drag_match` | a) sözcük kartlarından anlamlı ve kurallı cümle kurma sequence ile; b) harfleri ve c) rakamları temel formuna ve yazım yönüne göre yazma ile h) rakam ve sayıları yazma trace ile (dik temel harf); d) harflerin büyük yazılışını yerinde kullanma ve ı) büyük harfleri kuralına uygun yazma (cümle başı, özel ad) drag_match ve trace ile; j) soru edatını ayrı yazma karoyu doğru yere yerleştirerek drag_match ile oynanabilir; ç) ve i) harf, sözcük ve satır arası boşluk el yazısı düzeni, e) kaynaktan araştırarak yazma, f–g), ğ) ve k) kendi yazılarında sözcük, mesaj, cümle ve noktalama kullanma serbest yazılı üretim. |

#### 2. TEMA: MUSTAFA KEMAL’DEN ATATÜRK’E

`g1.turkce.t03` · işleniş sırası 3 · programda 10 çıktı · PDF s. 33

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.1.1 | Dinlemeyi/izlemeyi yönetebilme | 202 | kısmi | `listen_find`, `scenario` | a) öğrendiği sesin geçtiği görseli seçme listen_find ile, b) oyunda verilen amaca uygun dinleyeceğini seçme scenario ile oynanabilir; c) dinleme kurallarına uygun dinleme ve ç) uygun zamanda söz alma gerçek iletişimde gözlenen davranış. |
| T.D.1.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 202 | kısmi | `listen_find`, `story`, `sort_bins` | a) sese karşılık gelen harfi tanıma ve b) sesin kaynağını tahmin etme listen_find ile; c) görselden metin hakkında tahmin, ç) yaşantı ve ön bilgiyle çıkarım, e–f) olayların öncesi ve sonrası hakkında tahmin story ile; g) iletileri doğruluk ve gerçeklik açısından ayırma ve ğ) nesneleri fiziksel özelliklerine göre sınıflandırma sort_bins ile oynanabilir; d) sesin geçtiği sözcüklere örnek verme serbest sözlü üretim. |
| T.D.1.3 | Dinlediklerini/izlediklerini çözümleyebilme | 202 | tam | `listen_find`, `sort_bins`, `story`, `drag_match` | a) doğal ve yapay sesleri ayırt etme sort_bins, b) ses–harf ayırt etme listen_find, c) konuyu bulma ve ç) iletilerin benzerliklerini belirleme story anlama soruları, d) söylem–görsel ilişkisi drag_match ile çalışılır. |
| T.D.1.4 | Dinleme/izleme sürecini değerlendirebilme | 202 | yok |  | Bileşenler (a–c) çocuğun kendi dinleme sürecindeki hatalarını belirlemesi, düzeltmesi ve uygun davranışları sonraki dinlemelerine aktarması; öz değerlendirme oyunda denetlenemez. Yönergeyi tekrar dinleme ve yeniden deneme akışı (§3.3) süreci destekler ama ölçmez. |
| T.K.1.2 | Konuşmalarında içerik oluşturabilme | 202 | kısmi | `story` | d) görselden dinleyeceği metin hakkında tahmin story ile oynanabilir; a–c), ç) ve e–j) bileşenleri çocuğun kendi konuşmasında gerçekleşir (konuşma, anlatma, konuşmalarında karşılaştırma ve sınıflandırma, kendi cümleleriyle ifade, öneri, görsel ve benzetme kullanma); sözlü üretim. |
| T.K.1.3 | Konuşma kurallarını uygulayabilme | 203 | yok |  | Bileşenler (a–f) sesli söyleme, konuşma hızı, telaffuz, sözcükleri yerinde kullanma, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez (veli ile sesli anlatma önerilebilir). |
| T.O.1.1 | Okuma sürecini yönetebilme | 203 | kısmi | `drag_match`, `story` | b) sözcükleri ve c) basit, kısa cümleleri sessiz okuyup görselle eşleştirme drag_match ile; e) metnin başlık ve görsellerini inceleme ve ğ) kısa metinler arasından seçtiği metni okuyup anlama sorularını yanıtlama story ile oynanabilir; a) harf ve heceleri seslendirme, ç) telaffuz, d) işitilebilir sesle okuma, f–g) sesli okuma ve h) noktalamaya dikkat ederek okuma sesli okuma gerektirir (oyun çocuğun sesini değerlendirmez). Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.Y.1.1 | Yazılı anlatım becerilerini yönetebilme | 204 | kısmi | `trace`, `syllable_build`, `sequence` | b) çizgi çalışmaları trace ile (boyama kâğıt etkinliği); c) harf yazma trace, hece ve sözcük yazma syllable_build, cümle yazma sözcük kartlarını sıralayarak sequence ile; d) verilen kısa metne bakarak sözcük ve cümleleri karolarla yazma ve e) söylenen sözcük ve cümleleri yazma aynı yollarla oynanabilir; a) yazma materyallerini kullanma kâğıt ve kalem gerektirir, ç) kısa metin yazma ve f) yazışmayı selamlaşma ve hitapla başlatma serbest yazılı üretim. |
| T.Y.1.2 | Yazılarında içerik oluşturabilme | 204 | kısmi | `syllable_build`, `drag_match` | a) görselle ilgili sözcüğü hece ve harf karolarıyla yazma syllable_build ile, b) sözcük ve cümlelerde eksik bırakılan harf, hece ya da sözcüğü tamamlama syllable_build ve drag_match ile oynanabilir; c–h) yazıyı devam ettirme, yazılarında karşılaştırma ve sınıflandırma, olayları kendi ifadeleriyle yazma, görsel kullanma, kısa metin yazma, muhataba göre yazma ve benzetme serbest yazılı üretim. |
| T.Y.1.3 | Yazma kurallarını uygulayabilme | 204 | kısmi | `trace`, `sequence`, `drag_match` | a) sözcük kartlarından anlamlı ve kurallı cümle kurma sequence ile; b) harfleri ve c) rakamları temel formuna ve yazım yönüne göre yazma ile h) rakam ve sayıları yazma trace ile (dik temel harf); d) harflerin büyük yazılışını yerinde kullanma ve ı) büyük harfleri kuralına uygun yazma (cümle başı, özel ad) drag_match ve trace ile; j) soru edatını ayrı yazma karoyu doğru yere yerleştirerek drag_match ile oynanabilir; ç) ve i) harf, sözcük ve satır arası boşluk el yazısı düzeni, e) kaynaktan araştırarak yazma, f–g), ğ) ve k) kendi yazılarında sözcük, mesaj, cümle ve noktalama kullanma serbest yazılı üretim. |

#### 3. TEMA: ÇEVREMİZDEKİ YAŞAM

`g1.turkce.t04` · işleniş sırası 4 · programda 10 çıktı · PDF s. 38

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.1.1 | Dinlemeyi/izlemeyi yönetebilme | 202 | kısmi | `listen_find`, `scenario` | a) öğrendiği sesin geçtiği görseli seçme listen_find ile, b) oyunda verilen amaca uygun dinleyeceğini seçme scenario ile oynanabilir; c) dinleme kurallarına uygun dinleme ve ç) uygun zamanda söz alma gerçek iletişimde gözlenen davranış. |
| T.D.1.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 202 | kısmi | `listen_find`, `story`, `sort_bins` | a) sese karşılık gelen harfi tanıma ve b) sesin kaynağını tahmin etme listen_find ile; c) görselden metin hakkında tahmin, ç) yaşantı ve ön bilgiyle çıkarım, e–f) olayların öncesi ve sonrası hakkında tahmin story ile; g) iletileri doğruluk ve gerçeklik açısından ayırma ve ğ) nesneleri fiziksel özelliklerine göre sınıflandırma sort_bins ile oynanabilir; d) sesin geçtiği sözcüklere örnek verme serbest sözlü üretim. |
| T.D.1.3 | Dinlediklerini/izlediklerini çözümleyebilme | 202 | tam | `listen_find`, `sort_bins`, `story`, `drag_match` | a) doğal ve yapay sesleri ayırt etme sort_bins, b) ses–harf ayırt etme listen_find, c) konuyu bulma ve ç) iletilerin benzerliklerini belirleme story anlama soruları, d) söylem–görsel ilişkisi drag_match ile çalışılır. |
| T.D.1.4 | Dinleme/izleme sürecini değerlendirebilme | 202 | yok |  | Bileşenler (a–c) çocuğun kendi dinleme sürecindeki hatalarını belirlemesi, düzeltmesi ve uygun davranışları sonraki dinlemelerine aktarması; öz değerlendirme oyunda denetlenemez. Yönergeyi tekrar dinleme ve yeniden deneme akışı (§3.3) süreci destekler ama ölçmez. |
| T.K.1.2 | Konuşmalarında içerik oluşturabilme | 202 | kısmi | `story` | d) görselden dinleyeceği metin hakkında tahmin story ile oynanabilir; a–c), ç) ve e–j) bileşenleri çocuğun kendi konuşmasında gerçekleşir (konuşma, anlatma, konuşmalarında karşılaştırma ve sınıflandırma, kendi cümleleriyle ifade, öneri, görsel ve benzetme kullanma); sözlü üretim. |
| T.K.1.3 | Konuşma kurallarını uygulayabilme | 203 | yok |  | Bileşenler (a–f) sesli söyleme, konuşma hızı, telaffuz, sözcükleri yerinde kullanma, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez (veli ile sesli anlatma önerilebilir). |
| T.O.1.1 | Okuma sürecini yönetebilme | 203 | kısmi | `drag_match`, `story` | b) sözcükleri ve c) basit, kısa cümleleri sessiz okuyup görselle eşleştirme drag_match ile; e) metnin başlık ve görsellerini inceleme ve ğ) kısa metinler arasından seçtiği metni okuyup anlama sorularını yanıtlama story ile oynanabilir; a) harf ve heceleri seslendirme, ç) telaffuz, d) işitilebilir sesle okuma, f–g) sesli okuma ve h) noktalamaya dikkat ederek okuma sesli okuma gerektirir (oyun çocuğun sesini değerlendirmez). Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.Y.1.1 | Yazılı anlatım becerilerini yönetebilme | 204 | kısmi | `trace`, `syllable_build`, `sequence` | b) çizgi çalışmaları trace ile (boyama kâğıt etkinliği); c) harf yazma trace, hece ve sözcük yazma syllable_build, cümle yazma sözcük kartlarını sıralayarak sequence ile; d) verilen kısa metne bakarak sözcük ve cümleleri karolarla yazma ve e) söylenen sözcük ve cümleleri yazma aynı yollarla oynanabilir; a) yazma materyallerini kullanma kâğıt ve kalem gerektirir, ç) kısa metin yazma ve f) yazışmayı selamlaşma ve hitapla başlatma serbest yazılı üretim. |
| T.Y.1.2 | Yazılarında içerik oluşturabilme | 204 | kısmi | `syllable_build`, `drag_match` | a) görselle ilgili sözcüğü hece ve harf karolarıyla yazma syllable_build ile, b) sözcük ve cümlelerde eksik bırakılan harf, hece ya da sözcüğü tamamlama syllable_build ve drag_match ile oynanabilir; c–h) yazıyı devam ettirme, yazılarında karşılaştırma ve sınıflandırma, olayları kendi ifadeleriyle yazma, görsel kullanma, kısa metin yazma, muhataba göre yazma ve benzetme serbest yazılı üretim. |
| T.Y.1.3 | Yazma kurallarını uygulayabilme | 204 | kısmi | `trace`, `sequence`, `drag_match` | a) sözcük kartlarından anlamlı ve kurallı cümle kurma sequence ile; b) harfleri ve c) rakamları temel formuna ve yazım yönüne göre yazma ile h) rakam ve sayıları yazma trace ile (dik temel harf); d) harflerin büyük yazılışını yerinde kullanma ve ı) büyük harfleri kuralına uygun yazma (cümle başı, özel ad) drag_match ve trace ile; j) soru edatını ayrı yazma karoyu doğru yere yerleştirerek drag_match ile oynanabilir; ç) ve i) harf, sözcük ve satır arası boşluk el yazısı düzeni, e) kaynaktan araştırarak yazma, f–g), ğ) ve k) kendi yazılarında sözcük, mesaj, cümle ve noktalama kullanma serbest yazılı üretim. |

#### 4. TEMA: YOL ARKADAŞIMIZ KİTAPLAR

`g1.turkce.t05` · işleniş sırası 5 · programda 9 çıktı · PDF s. 43

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.1.1 | Dinlemeyi/izlemeyi yönetebilme | 202 | kısmi | `listen_find`, `scenario` | a) öğrendiği sesin geçtiği görseli seçme listen_find ile, b) oyunda verilen amaca uygun dinleyeceğini seçme scenario ile oynanabilir; c) dinleme kurallarına uygun dinleme ve ç) uygun zamanda söz alma gerçek iletişimde gözlenen davranış. |
| T.D.1.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 202 | kısmi | `listen_find`, `story`, `sort_bins` | a) sese karşılık gelen harfi tanıma ve b) sesin kaynağını tahmin etme listen_find ile; c) görselden metin hakkında tahmin, ç) yaşantı ve ön bilgiyle çıkarım, e–f) olayların öncesi ve sonrası hakkında tahmin story ile; g) iletileri doğruluk ve gerçeklik açısından ayırma ve ğ) nesneleri fiziksel özelliklerine göre sınıflandırma sort_bins ile oynanabilir; d) sesin geçtiği sözcüklere örnek verme serbest sözlü üretim. |
| T.D.1.3 | Dinlediklerini/izlediklerini çözümleyebilme | 202 | tam | `listen_find`, `sort_bins`, `story`, `drag_match` | a) doğal ve yapay sesleri ayırt etme sort_bins, b) ses–harf ayırt etme listen_find, c) konuyu bulma ve ç) iletilerin benzerliklerini belirleme story anlama soruları, d) söylem–görsel ilişkisi drag_match ile çalışılır. |
| T.D.1.4 | Dinleme/izleme sürecini değerlendirebilme | 202 | yok |  | Bileşenler (a–c) çocuğun kendi dinleme sürecindeki hatalarını belirlemesi, düzeltmesi ve uygun davranışları sonraki dinlemelerine aktarması; öz değerlendirme oyunda denetlenemez. Yönergeyi tekrar dinleme ve yeniden deneme akışı (§3.3) süreci destekler ama ölçmez. |
| T.K.1.2 | Konuşmalarında içerik oluşturabilme | 202 | kısmi | `story` | d) görselden dinleyeceği metin hakkında tahmin story ile oynanabilir; a–c), ç) ve e–j) bileşenleri çocuğun kendi konuşmasında gerçekleşir (konuşma, anlatma, konuşmalarında karşılaştırma ve sınıflandırma, kendi cümleleriyle ifade, öneri, görsel ve benzetme kullanma); sözlü üretim. |
| T.K.1.3 | Konuşma kurallarını uygulayabilme | 203 | yok |  | Bileşenler (a–f) sesli söyleme, konuşma hızı, telaffuz, sözcükleri yerinde kullanma, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez (veli ile sesli anlatma önerilebilir). |
| T.O.1.1 | Okuma sürecini yönetebilme | 203 | kısmi | `drag_match`, `story` | b) sözcükleri ve c) basit, kısa cümleleri sessiz okuyup görselle eşleştirme drag_match ile; e) metnin başlık ve görsellerini inceleme ve ğ) kısa metinler arasından seçtiği metni okuyup anlama sorularını yanıtlama story ile oynanabilir; a) harf ve heceleri seslendirme, ç) telaffuz, d) işitilebilir sesle okuma, f–g) sesli okuma ve h) noktalamaya dikkat ederek okuma sesli okuma gerektirir (oyun çocuğun sesini değerlendirmez). Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.Y.1.1 | Yazılı anlatım becerilerini yönetebilme | 204 | kısmi | `trace`, `syllable_build`, `sequence` | b) çizgi çalışmaları trace ile (boyama kâğıt etkinliği); c) harf yazma trace, hece ve sözcük yazma syllable_build, cümle yazma sözcük kartlarını sıralayarak sequence ile; d) verilen kısa metne bakarak sözcük ve cümleleri karolarla yazma ve e) söylenen sözcük ve cümleleri yazma aynı yollarla oynanabilir; a) yazma materyallerini kullanma kâğıt ve kalem gerektirir, ç) kısa metin yazma ve f) yazışmayı selamlaşma ve hitapla başlatma serbest yazılı üretim. |
| T.Y.1.3 | Yazma kurallarını uygulayabilme | 204 | kısmi | `trace`, `sequence`, `drag_match` | a) sözcük kartlarından anlamlı ve kurallı cümle kurma sequence ile; b) harfleri ve c) rakamları temel formuna ve yazım yönüne göre yazma ile h) rakam ve sayıları yazma trace ile (dik temel harf); d) harflerin büyük yazılışını yerinde kullanma ve ı) büyük harfleri kuralına uygun yazma (cümle başı, özel ad) drag_match ve trace ile; j) soru edatını ayrı yazma karoyu doğru yere yerleştirerek drag_match ile oynanabilir; ç) ve i) harf, sözcük ve satır arası boşluk el yazısı düzeni, e) kaynaktan araştırarak yazma, f–g), ğ) ve k) kendi yazılarında sözcük, mesaj, cümle ve noktalama kullanma serbest yazılı üretim. |

#### 5. TEMA: YETENEKLERİMİZİ KEŞFEDİYORUZ

`g1.turkce.t06` · işleniş sırası 6 · programda 11 çıktı · PDF s. 47

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.1.1 | Dinlemeyi/izlemeyi yönetebilme | 202 | kısmi | `listen_find`, `scenario` | a) öğrendiği sesin geçtiği görseli seçme listen_find ile, b) oyunda verilen amaca uygun dinleyeceğini seçme scenario ile oynanabilir; c) dinleme kurallarına uygun dinleme ve ç) uygun zamanda söz alma gerçek iletişimde gözlenen davranış. |
| T.D.1.3 | Dinlediklerini/izlediklerini çözümleyebilme | 202 | tam | `listen_find`, `sort_bins`, `story`, `drag_match` | a) doğal ve yapay sesleri ayırt etme sort_bins, b) ses–harf ayırt etme listen_find, c) konuyu bulma ve ç) iletilerin benzerliklerini belirleme story anlama soruları, d) söylem–görsel ilişkisi drag_match ile çalışılır. |
| T.K.1.1 | Konuşmalarını yönetebilme | 202 | kısmi | `scenario` | a) konunun özelliğine uygun konuşma üslubunu (nazik, samimi) verilen durumlarda seçme scenario ile oynanabilir; b) göz teması, c) uygun zamanda söz alma ve ç) konuşmada selamlaşma ve hitap ifadeleri kullanma çocuğun gerçek konuşmasını gerektirir. |
| T.K.1.2 | Konuşmalarında içerik oluşturabilme | 202 | kısmi | `story` | d) görselden dinleyeceği metin hakkında tahmin story ile oynanabilir; a–c), ç) ve e–j) bileşenleri çocuğun kendi konuşmasında gerçekleşir (konuşma, anlatma, konuşmalarında karşılaştırma ve sınıflandırma, kendi cümleleriyle ifade, öneri, görsel ve benzetme kullanma); sözlü üretim. |
| T.K.1.3 | Konuşma kurallarını uygulayabilme | 203 | yok |  | Bileşenler (a–f) sesli söyleme, konuşma hızı, telaffuz, sözcükleri yerinde kullanma, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez (veli ile sesli anlatma önerilebilir). |
| T.O.1.1 | Okuma sürecini yönetebilme | 203 | kısmi | `drag_match`, `story` | b) sözcükleri ve c) basit, kısa cümleleri sessiz okuyup görselle eşleştirme drag_match ile; e) metnin başlık ve görsellerini inceleme ve ğ) kısa metinler arasından seçtiği metni okuyup anlama sorularını yanıtlama story ile oynanabilir; a) harf ve heceleri seslendirme, ç) telaffuz, d) işitilebilir sesle okuma, f–g) sesli okuma ve h) noktalamaya dikkat ederek okuma sesli okuma gerektirir (oyun çocuğun sesini değerlendirmez). Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.1.2 | Okudukları ile ilgili anlam oluşturabilme | 203 | tam | `story`, `drag_match` | a) ön bilgiyi kullanma ve b) metindeki bilgiyle ön bilgi arasında bağlantı kurma ön bilgi gerektiren anlama sorularıyla, c) başlık ve görselden konu tahmini story ile; ç) okuduğu yönergeyi uygulama (nesneyi istenen yere sürükleme) drag_match ile çalışılır. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.1.3 | Okuduklarını çözümleyebilme | 203 | tam | `story` | a) okuduğu metnin konusunu bulma story anlama sorusuyla çalışılır. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.Y.1.1 | Yazılı anlatım becerilerini yönetebilme | 204 | kısmi | `trace`, `syllable_build`, `sequence` | b) çizgi çalışmaları trace ile (boyama kâğıt etkinliği); c) harf yazma trace, hece ve sözcük yazma syllable_build, cümle yazma sözcük kartlarını sıralayarak sequence ile; d) verilen kısa metne bakarak sözcük ve cümleleri karolarla yazma ve e) söylenen sözcük ve cümleleri yazma aynı yollarla oynanabilir; a) yazma materyallerini kullanma kâğıt ve kalem gerektirir, ç) kısa metin yazma ve f) yazışmayı selamlaşma ve hitapla başlatma serbest yazılı üretim. |
| T.Y.1.2 | Yazılarında içerik oluşturabilme | 204 | kısmi | `syllable_build`, `drag_match` | a) görselle ilgili sözcüğü hece ve harf karolarıyla yazma syllable_build ile, b) sözcük ve cümlelerde eksik bırakılan harf, hece ya da sözcüğü tamamlama syllable_build ve drag_match ile oynanabilir; c–h) yazıyı devam ettirme, yazılarında karşılaştırma ve sınıflandırma, olayları kendi ifadeleriyle yazma, görsel kullanma, kısa metin yazma, muhataba göre yazma ve benzetme serbest yazılı üretim. |
| T.Y.1.3 | Yazma kurallarını uygulayabilme | 204 | kısmi | `trace`, `sequence`, `drag_match` | a) sözcük kartlarından anlamlı ve kurallı cümle kurma sequence ile; b) harfleri ve c) rakamları temel formuna ve yazım yönüne göre yazma ile h) rakam ve sayıları yazma trace ile (dik temel harf); d) harflerin büyük yazılışını yerinde kullanma ve ı) büyük harfleri kuralına uygun yazma (cümle başı, özel ad) drag_match ve trace ile; j) soru edatını ayrı yazma karoyu doğru yere yerleştirerek drag_match ile oynanabilir; ç) ve i) harf, sözcük ve satır arası boşluk el yazısı düzeni, e) kaynaktan araştırarak yazma, f–g), ğ) ve k) kendi yazılarında sözcük, mesaj, cümle ve noktalama kullanma serbest yazılı üretim. |

#### 6. TEMA: MİNİK KÂŞİFLER

`g1.turkce.t07` · işleniş sırası 7 · programda 12 çıktı · PDF s. 52

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.1.1 | Dinlemeyi/izlemeyi yönetebilme | 202 | kısmi | `listen_find`, `scenario` | a) öğrendiği sesin geçtiği görseli seçme listen_find ile, b) oyunda verilen amaca uygun dinleyeceğini seçme scenario ile oynanabilir; c) dinleme kurallarına uygun dinleme ve ç) uygun zamanda söz alma gerçek iletişimde gözlenen davranış. |
| T.D.1.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 202 | kısmi | `listen_find`, `story`, `sort_bins` | a) sese karşılık gelen harfi tanıma ve b) sesin kaynağını tahmin etme listen_find ile; c) görselden metin hakkında tahmin, ç) yaşantı ve ön bilgiyle çıkarım, e–f) olayların öncesi ve sonrası hakkında tahmin story ile; g) iletileri doğruluk ve gerçeklik açısından ayırma ve ğ) nesneleri fiziksel özelliklerine göre sınıflandırma sort_bins ile oynanabilir; d) sesin geçtiği sözcüklere örnek verme serbest sözlü üretim. |
| T.D.1.3 | Dinlediklerini/izlediklerini çözümleyebilme | 202 | tam | `listen_find`, `sort_bins`, `story`, `drag_match` | a) doğal ve yapay sesleri ayırt etme sort_bins, b) ses–harf ayırt etme listen_find, c) konuyu bulma ve ç) iletilerin benzerliklerini belirleme story anlama soruları, d) söylem–görsel ilişkisi drag_match ile çalışılır. |
| T.K.1.1 | Konuşmalarını yönetebilme | 202 | kısmi | `scenario` | a) konunun özelliğine uygun konuşma üslubunu (nazik, samimi) verilen durumlarda seçme scenario ile oynanabilir; b) göz teması, c) uygun zamanda söz alma ve ç) konuşmada selamlaşma ve hitap ifadeleri kullanma çocuğun gerçek konuşmasını gerektirir. |
| T.K.1.2 | Konuşmalarında içerik oluşturabilme | 202 | kısmi | `story` | d) görselden dinleyeceği metin hakkında tahmin story ile oynanabilir; a–c), ç) ve e–j) bileşenleri çocuğun kendi konuşmasında gerçekleşir (konuşma, anlatma, konuşmalarında karşılaştırma ve sınıflandırma, kendi cümleleriyle ifade, öneri, görsel ve benzetme kullanma); sözlü üretim. |
| T.K.1.3 | Konuşma kurallarını uygulayabilme | 203 | yok |  | Bileşenler (a–f) sesli söyleme, konuşma hızı, telaffuz, sözcükleri yerinde kullanma, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez (veli ile sesli anlatma önerilebilir). |
| T.O.1.1 | Okuma sürecini yönetebilme | 203 | kısmi | `drag_match`, `story` | b) sözcükleri ve c) basit, kısa cümleleri sessiz okuyup görselle eşleştirme drag_match ile; e) metnin başlık ve görsellerini inceleme ve ğ) kısa metinler arasından seçtiği metni okuyup anlama sorularını yanıtlama story ile oynanabilir; a) harf ve heceleri seslendirme, ç) telaffuz, d) işitilebilir sesle okuma, f–g) sesli okuma ve h) noktalamaya dikkat ederek okuma sesli okuma gerektirir (oyun çocuğun sesini değerlendirmez). Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.1.2 | Okudukları ile ilgili anlam oluşturabilme | 203 | tam | `story`, `drag_match` | a) ön bilgiyi kullanma ve b) metindeki bilgiyle ön bilgi arasında bağlantı kurma ön bilgi gerektiren anlama sorularıyla, c) başlık ve görselden konu tahmini story ile; ç) okuduğu yönergeyi uygulama (nesneyi istenen yere sürükleme) drag_match ile çalışılır. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.1.3 | Okuduklarını çözümleyebilme | 203 | tam | `story` | a) okuduğu metnin konusunu bulma story anlama sorusuyla çalışılır. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.Y.1.1 | Yazılı anlatım becerilerini yönetebilme | 204 | kısmi | `trace`, `syllable_build`, `sequence` | b) çizgi çalışmaları trace ile (boyama kâğıt etkinliği); c) harf yazma trace, hece ve sözcük yazma syllable_build, cümle yazma sözcük kartlarını sıralayarak sequence ile; d) verilen kısa metne bakarak sözcük ve cümleleri karolarla yazma ve e) söylenen sözcük ve cümleleri yazma aynı yollarla oynanabilir; a) yazma materyallerini kullanma kâğıt ve kalem gerektirir, ç) kısa metin yazma ve f) yazışmayı selamlaşma ve hitapla başlatma serbest yazılı üretim. |
| T.Y.1.2 | Yazılarında içerik oluşturabilme | 204 | kısmi | `syllable_build`, `drag_match` | a) görselle ilgili sözcüğü hece ve harf karolarıyla yazma syllable_build ile, b) sözcük ve cümlelerde eksik bırakılan harf, hece ya da sözcüğü tamamlama syllable_build ve drag_match ile oynanabilir; c–h) yazıyı devam ettirme, yazılarında karşılaştırma ve sınıflandırma, olayları kendi ifadeleriyle yazma, görsel kullanma, kısa metin yazma, muhataba göre yazma ve benzetme serbest yazılı üretim. |
| T.Y.1.3 | Yazma kurallarını uygulayabilme | 204 | kısmi | `trace`, `sequence`, `drag_match` | a) sözcük kartlarından anlamlı ve kurallı cümle kurma sequence ile; b) harfleri ve c) rakamları temel formuna ve yazım yönüne göre yazma ile h) rakam ve sayıları yazma trace ile (dik temel harf); d) harflerin büyük yazılışını yerinde kullanma ve ı) büyük harfleri kuralına uygun yazma (cümle başı, özel ad) drag_match ve trace ile; j) soru edatını ayrı yazma karoyu doğru yere yerleştirerek drag_match ile oynanabilir; ç) ve i) harf, sözcük ve satır arası boşluk el yazısı düzeni, e) kaynaktan araştırarak yazma, f–g), ğ) ve k) kendi yazılarında sözcük, mesaj, cümle ve noktalama kullanma serbest yazılı üretim. |

#### 7. TEMA: ATALARIMIZIN İZLERİ

`g1.turkce.t08` · işleniş sırası 8 · programda 17 çıktı · PDF s. 57

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.1.1 | Dinlemeyi/izlemeyi yönetebilme | 202 | kısmi | `listen_find`, `scenario` | a) öğrendiği sesin geçtiği görseli seçme listen_find ile, b) oyunda verilen amaca uygun dinleyeceğini seçme scenario ile oynanabilir; c) dinleme kurallarına uygun dinleme ve ç) uygun zamanda söz alma gerçek iletişimde gözlenen davranış. |
| T.D.1.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 202 | kısmi | `listen_find`, `story`, `sort_bins` | a) sese karşılık gelen harfi tanıma ve b) sesin kaynağını tahmin etme listen_find ile; c) görselden metin hakkında tahmin, ç) yaşantı ve ön bilgiyle çıkarım, e–f) olayların öncesi ve sonrası hakkında tahmin story ile; g) iletileri doğruluk ve gerçeklik açısından ayırma ve ğ) nesneleri fiziksel özelliklerine göre sınıflandırma sort_bins ile oynanabilir; d) sesin geçtiği sözcüklere örnek verme serbest sözlü üretim. |
| T.D.1.3 | Dinlediklerini/izlediklerini çözümleyebilme | 202 | tam | `listen_find`, `sort_bins`, `story`, `drag_match` | a) doğal ve yapay sesleri ayırt etme sort_bins, b) ses–harf ayırt etme listen_find, c) konuyu bulma ve ç) iletilerin benzerliklerini belirleme story anlama soruları, d) söylem–görsel ilişkisi drag_match ile çalışılır. |
| T.D.1.4 | Dinleme/izleme sürecini değerlendirebilme | 202 | yok |  | Bileşenler (a–c) çocuğun kendi dinleme sürecindeki hatalarını belirlemesi, düzeltmesi ve uygun davranışları sonraki dinlemelerine aktarması; öz değerlendirme oyunda denetlenemez. Yönergeyi tekrar dinleme ve yeniden deneme akışı (§3.3) süreci destekler ama ölçmez. |
| T.K.1.1 | Konuşmalarını yönetebilme | 202 | kısmi | `scenario` | a) konunun özelliğine uygun konuşma üslubunu (nazik, samimi) verilen durumlarda seçme scenario ile oynanabilir; b) göz teması, c) uygun zamanda söz alma ve ç) konuşmada selamlaşma ve hitap ifadeleri kullanma çocuğun gerçek konuşmasını gerektirir. |
| T.K.1.2 | Konuşmalarında içerik oluşturabilme | 202 | kısmi | `story` | d) görselden dinleyeceği metin hakkında tahmin story ile oynanabilir; a–c), ç) ve e–j) bileşenleri çocuğun kendi konuşmasında gerçekleşir (konuşma, anlatma, konuşmalarında karşılaştırma ve sınıflandırma, kendi cümleleriyle ifade, öneri, görsel ve benzetme kullanma); sözlü üretim. |
| T.K.1.3 | Konuşma kurallarını uygulayabilme | 203 | yok |  | Bileşenler (a–f) sesli söyleme, konuşma hızı, telaffuz, sözcükleri yerinde kullanma, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez (veli ile sesli anlatma önerilebilir). |
| T.K.1.4 | Konuşma sürecini değerlendirebilme | 203 | yok |  | Bileşenler (a–c) kendi konuşmasındaki hataları fark edip düzeltme ve olumlu davranışları sonraki konuşmalarına aktarma; kendi konuşması üzerinde öz değerlendirme. |
| T.O.1.1 | Okuma sürecini yönetebilme | 203 | kısmi | `drag_match`, `story` | b) sözcükleri ve c) basit, kısa cümleleri sessiz okuyup görselle eşleştirme drag_match ile; e) metnin başlık ve görsellerini inceleme ve ğ) kısa metinler arasından seçtiği metni okuyup anlama sorularını yanıtlama story ile oynanabilir; a) harf ve heceleri seslendirme, ç) telaffuz, d) işitilebilir sesle okuma, f–g) sesli okuma ve h) noktalamaya dikkat ederek okuma sesli okuma gerektirir (oyun çocuğun sesini değerlendirmez). Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.1.2 | Okudukları ile ilgili anlam oluşturabilme | 203 | tam | `story`, `drag_match` | a) ön bilgiyi kullanma ve b) metindeki bilgiyle ön bilgi arasında bağlantı kurma ön bilgi gerektiren anlama sorularıyla, c) başlık ve görselden konu tahmini story ile; ç) okuduğu yönergeyi uygulama (nesneyi istenen yere sürükleme) drag_match ile çalışılır. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.1.3 | Okuduklarını çözümleyebilme | 203 | tam | `story` | a) okuduğu metnin konusunu bulma story anlama sorusuyla çalışılır. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.1.4 | Okuma sürecine etki eden durumları gözden geçirebilme | 203 | yok |  | Tek bileşen a) okuduğu ortamın fiziksel özelliklerini açıklama; açıklama serbest sözlü üretim ve çocuğun kendi okuma ortamına bağlı. |
| T.O.1.5 | Okuma sürecini değerlendirebilme | 203 | yok |  | Bileşenler (a–c) kendi okuma sürecindeki hataları belirleme, düzeltme ve olumlu davranışları sonraki okumalarına aktarma; öz değerlendirme ve sesli okuma gerektirir. |
| T.Y.1.1 | Yazılı anlatım becerilerini yönetebilme | 204 | kısmi | `trace`, `syllable_build`, `sequence` | b) çizgi çalışmaları trace ile (boyama kâğıt etkinliği); c) harf yazma trace, hece ve sözcük yazma syllable_build, cümle yazma sözcük kartlarını sıralayarak sequence ile; d) verilen kısa metne bakarak sözcük ve cümleleri karolarla yazma ve e) söylenen sözcük ve cümleleri yazma aynı yollarla oynanabilir; a) yazma materyallerini kullanma kâğıt ve kalem gerektirir, ç) kısa metin yazma ve f) yazışmayı selamlaşma ve hitapla başlatma serbest yazılı üretim. |
| T.Y.1.2 | Yazılarında içerik oluşturabilme | 204 | kısmi | `syllable_build`, `drag_match` | a) görselle ilgili sözcüğü hece ve harf karolarıyla yazma syllable_build ile, b) sözcük ve cümlelerde eksik bırakılan harf, hece ya da sözcüğü tamamlama syllable_build ve drag_match ile oynanabilir; c–h) yazıyı devam ettirme, yazılarında karşılaştırma ve sınıflandırma, olayları kendi ifadeleriyle yazma, görsel kullanma, kısa metin yazma, muhataba göre yazma ve benzetme serbest yazılı üretim. |
| T.Y.1.3 | Yazma kurallarını uygulayabilme | 204 | kısmi | `trace`, `sequence`, `drag_match` | a) sözcük kartlarından anlamlı ve kurallı cümle kurma sequence ile; b) harfleri ve c) rakamları temel formuna ve yazım yönüne göre yazma ile h) rakam ve sayıları yazma trace ile (dik temel harf); d) harflerin büyük yazılışını yerinde kullanma ve ı) büyük harfleri kuralına uygun yazma (cümle başı, özel ad) drag_match ve trace ile; j) soru edatını ayrı yazma karoyu doğru yere yerleştirerek drag_match ile oynanabilir; ç) ve i) harf, sözcük ve satır arası boşluk el yazısı düzeni, e) kaynaktan araştırarak yazma, f–g), ğ) ve k) kendi yazılarında sözcük, mesaj, cümle ve noktalama kullanma serbest yazılı üretim. |
| T.Y.1.4 | Yazma sürecini değerlendirebilme | 204 | yok |  | Bileşenler (a–c) kendi yazılarındaki hataları bulup düzeltme ve uygun davranışları sonraki yazılarına aktarma; kendi kâğıt yazısı üzerinde öz değerlendirme. |

#### 8. TEMA: SORUMLULUKLARIMIZIN FARKINDAYIZ

`g1.turkce.t09` · işleniş sırası 9 · programda 17 çıktı · PDF s. 64

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.1.1 | Dinlemeyi/izlemeyi yönetebilme | 202 | kısmi | `listen_find`, `scenario` | a) öğrendiği sesin geçtiği görseli seçme listen_find ile, b) oyunda verilen amaca uygun dinleyeceğini seçme scenario ile oynanabilir; c) dinleme kurallarına uygun dinleme ve ç) uygun zamanda söz alma gerçek iletişimde gözlenen davranış. |
| T.D.1.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 202 | kısmi | `listen_find`, `story`, `sort_bins` | a) sese karşılık gelen harfi tanıma ve b) sesin kaynağını tahmin etme listen_find ile; c) görselden metin hakkında tahmin, ç) yaşantı ve ön bilgiyle çıkarım, e–f) olayların öncesi ve sonrası hakkında tahmin story ile; g) iletileri doğruluk ve gerçeklik açısından ayırma ve ğ) nesneleri fiziksel özelliklerine göre sınıflandırma sort_bins ile oynanabilir; d) sesin geçtiği sözcüklere örnek verme serbest sözlü üretim. |
| T.D.1.3 | Dinlediklerini/izlediklerini çözümleyebilme | 202 | tam | `listen_find`, `sort_bins`, `story`, `drag_match` | a) doğal ve yapay sesleri ayırt etme sort_bins, b) ses–harf ayırt etme listen_find, c) konuyu bulma ve ç) iletilerin benzerliklerini belirleme story anlama soruları, d) söylem–görsel ilişkisi drag_match ile çalışılır. |
| T.D.1.4 | Dinleme/izleme sürecini değerlendirebilme | 202 | yok |  | Bileşenler (a–c) çocuğun kendi dinleme sürecindeki hatalarını belirlemesi, düzeltmesi ve uygun davranışları sonraki dinlemelerine aktarması; öz değerlendirme oyunda denetlenemez. Yönergeyi tekrar dinleme ve yeniden deneme akışı (§3.3) süreci destekler ama ölçmez. |
| T.K.1.1 | Konuşmalarını yönetebilme | 202 | kısmi | `scenario` | a) konunun özelliğine uygun konuşma üslubunu (nazik, samimi) verilen durumlarda seçme scenario ile oynanabilir; b) göz teması, c) uygun zamanda söz alma ve ç) konuşmada selamlaşma ve hitap ifadeleri kullanma çocuğun gerçek konuşmasını gerektirir. |
| T.K.1.2 | Konuşmalarında içerik oluşturabilme | 202 | kısmi | `story` | d) görselden dinleyeceği metin hakkında tahmin story ile oynanabilir; a–c), ç) ve e–j) bileşenleri çocuğun kendi konuşmasında gerçekleşir (konuşma, anlatma, konuşmalarında karşılaştırma ve sınıflandırma, kendi cümleleriyle ifade, öneri, görsel ve benzetme kullanma); sözlü üretim. |
| T.K.1.3 | Konuşma kurallarını uygulayabilme | 203 | yok |  | Bileşenler (a–f) sesli söyleme, konuşma hızı, telaffuz, sözcükleri yerinde kullanma, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez (veli ile sesli anlatma önerilebilir). |
| T.K.1.4 | Konuşma sürecini değerlendirebilme | 203 | yok |  | Bileşenler (a–c) kendi konuşmasındaki hataları fark edip düzeltme ve olumlu davranışları sonraki konuşmalarına aktarma; kendi konuşması üzerinde öz değerlendirme. |
| T.O.1.1 | Okuma sürecini yönetebilme | 203 | kısmi | `drag_match`, `story` | b) sözcükleri ve c) basit, kısa cümleleri sessiz okuyup görselle eşleştirme drag_match ile; e) metnin başlık ve görsellerini inceleme ve ğ) kısa metinler arasından seçtiği metni okuyup anlama sorularını yanıtlama story ile oynanabilir; a) harf ve heceleri seslendirme, ç) telaffuz, d) işitilebilir sesle okuma, f–g) sesli okuma ve h) noktalamaya dikkat ederek okuma sesli okuma gerektirir (oyun çocuğun sesini değerlendirmez). Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.1.2 | Okudukları ile ilgili anlam oluşturabilme | 203 | tam | `story`, `drag_match` | a) ön bilgiyi kullanma ve b) metindeki bilgiyle ön bilgi arasında bağlantı kurma ön bilgi gerektiren anlama sorularıyla, c) başlık ve görselden konu tahmini story ile; ç) okuduğu yönergeyi uygulama (nesneyi istenen yere sürükleme) drag_match ile çalışılır. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.1.3 | Okuduklarını çözümleyebilme | 203 | tam | `story` | a) okuduğu metnin konusunu bulma story anlama sorusuyla çalışılır. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.1.4 | Okuma sürecine etki eden durumları gözden geçirebilme | 203 | yok |  | Tek bileşen a) okuduğu ortamın fiziksel özelliklerini açıklama; açıklama serbest sözlü üretim ve çocuğun kendi okuma ortamına bağlı. |
| T.O.1.5 | Okuma sürecini değerlendirebilme | 203 | yok |  | Bileşenler (a–c) kendi okuma sürecindeki hataları belirleme, düzeltme ve olumlu davranışları sonraki okumalarına aktarma; öz değerlendirme ve sesli okuma gerektirir. |
| T.Y.1.1 | Yazılı anlatım becerilerini yönetebilme | 204 | kısmi | `trace`, `syllable_build`, `sequence` | b) çizgi çalışmaları trace ile (boyama kâğıt etkinliği); c) harf yazma trace, hece ve sözcük yazma syllable_build, cümle yazma sözcük kartlarını sıralayarak sequence ile; d) verilen kısa metne bakarak sözcük ve cümleleri karolarla yazma ve e) söylenen sözcük ve cümleleri yazma aynı yollarla oynanabilir; a) yazma materyallerini kullanma kâğıt ve kalem gerektirir, ç) kısa metin yazma ve f) yazışmayı selamlaşma ve hitapla başlatma serbest yazılı üretim. |
| T.Y.1.2 | Yazılarında içerik oluşturabilme | 204 | kısmi | `syllable_build`, `drag_match` | a) görselle ilgili sözcüğü hece ve harf karolarıyla yazma syllable_build ile, b) sözcük ve cümlelerde eksik bırakılan harf, hece ya da sözcüğü tamamlama syllable_build ve drag_match ile oynanabilir; c–h) yazıyı devam ettirme, yazılarında karşılaştırma ve sınıflandırma, olayları kendi ifadeleriyle yazma, görsel kullanma, kısa metin yazma, muhataba göre yazma ve benzetme serbest yazılı üretim. |
| T.Y.1.3 | Yazma kurallarını uygulayabilme | 204 | kısmi | `trace`, `sequence`, `drag_match` | a) sözcük kartlarından anlamlı ve kurallı cümle kurma sequence ile; b) harfleri ve c) rakamları temel formuna ve yazım yönüne göre yazma ile h) rakam ve sayıları yazma trace ile (dik temel harf); d) harflerin büyük yazılışını yerinde kullanma ve ı) büyük harfleri kuralına uygun yazma (cümle başı, özel ad) drag_match ve trace ile; j) soru edatını ayrı yazma karoyu doğru yere yerleştirerek drag_match ile oynanabilir; ç) ve i) harf, sözcük ve satır arası boşluk el yazısı düzeni, e) kaynaktan araştırarak yazma, f–g), ğ) ve k) kendi yazılarında sözcük, mesaj, cümle ve noktalama kullanma serbest yazılı üretim. |
| T.Y.1.4 | Yazma sürecini değerlendirebilme | 204 | yok |  | Bileşenler (a–c) kendi yazılarındaki hataları bulup düzeltme ve uygun davranışları sonraki yazılarına aktarma; kendi kâğıt yazısı üzerinde öz değerlendirme. |

### Hayat Bilgisi

#### 1. BEN VE OKULUM

`g1.hayat_bilgisi.t01` · işleniş sırası 1 · programda 4 çıktı · PDF s. 15

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| HB.1.1.1 | Öğretmeni ve arkadaşlarıyla tanışabilme | 15 | yok |  | Süreç bileşeni yok. Çıktı öğretmen ve arkadaşlarla gerçek tanışma, tanışma ifadeleri ve beden dili kullanma (programda istop, örümcek ağı gibi etkileşim etkinlikleri); sınıf içi sosyal etkinlik. |
| HB.1.1.2 | Sınıf ve okul ortamını tanıyabilme | 15 | yok |  | Süreç bileşeni yok. Çıktının konusu çocuğun kendi sınıfı ve okulu (bölümleri, çalışanları, araç gereçleri; programda okul gezisi ve gözlem). Genel okul görselleriyle tanıma bu çevrenin yerine geçmez; okul etkinliği. |
| HB.1.1.3 | Sınıf ve okul ortamında kurallara uygun davranabilme | 15 | kısmi | `scenario`, `sort_bins` | Süreç bileşeni yok. Sınıf ve okul kurallarına uygun davranışı verilen durumlarda seçme scenario ile, uygun ve uygun olmayan davranışları ayırma sort_bins ile oynanabilir; kurallara gerçek ortamda uyma okulda gözlenen davranış. |
| HB.1.1.4 | Bireysel özelliklerini açıklayabilme | 15 | yok |  | Süreç bileşeni yok. Çıktının konusu çocuğun kendi fiziksel özellikleri ve duyguları; açıklama serbest sözlü üretim (programda ayna, kukla, konuşma halkası). Görsellerdeki başka kişilerin özelliklerini tanıma kendi özelliklerinin yerine geçmez. |

#### 2. SAĞLIĞIM VE GÜVENLİĞİM

`g1.hayat_bilgisi.t02` · işleniş sırası 2 · programda 4 çıktı · PDF s. 19

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| HB.1.2.1 | Sağlıklı büyüme ve gelişme için yapılması gerekenleri belirleyebilme | 19 | tam | `sort_bins`, `scenario` | Süreç bileşeni yok. Beslenme, uyku, kişisel bakım, ağız ve diş sağlığı ve temizlik için yapılması gerekenleri verilen örnekler üzerinden belirleme sort_bins ve scenario ile çalışılır. |
| HB.1.2.2 | Kişisel alan sınırlarını koruyabilme | 19 | kısmi | `scenario` | Süreç bileşeni yok. Kişisel alanı ihlal eden durumu tanıma ve verilen örnek olaylarda doğru davranışı seçme scenario ile oynanabilir; kişisel alan sınırını gerçek ilişkilerde koruma ve kendi cümleleriyle ifade etme yaşamda ve rol oynamayla gerçekleşir. |
| HB.1.2.3 | Temel trafik kurallarına uygun davranabilme | 19 | kısmi | `scenario`, `sort_bins` | Süreç bileşeni yok. Yaya ve yolcu olarak uyulacak kuralları (karşıya geçerken sağa ve sola bakma, emniyet kemeri, arka koltuk) verilen durumlarda seçme scenario ile, doğru ve yanlış davranışları ayırma sort_bins ile oynanabilir; trafikte kurala uygun davranma gerçek yaşamda gözlenir. |
| HB.1.2.4 | Acil durumlarda yapılması gerekenleri belirleyebilme | 19 | tam | `scenario`, `drag_match` | Süreç bileşeni yok. Çarpma, düşme, kaybolma, gaz kaçağı gibi acil durumlarda yapılması gerekenleri seçme scenario ile, durumu haber verilecek kişi ya da 112 ile eşleme drag_match ile çalışılır. |

#### 3. AİLEM VE TOPLUM

`g1.hayat_bilgisi.t03` · işleniş sırası 3 · programda 3 çıktı · PDF s. 23

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| HB.1.3.1 | Ailenin özelliklerini ifade edebilme | 23 | tam | `sort_bins`, `drag_match`, `story` | Süreç bileşeni yok. Çekirdek ve geniş aileyi oluşturan bireyleri ayırma sort_bins, aile bireylerini akrabalık adlarıyla eşleme drag_match, aile değerlerine ilişkin hikâye story ile çalışılır; özellikler sesli seçenekler arasından seçilerek ifade edilir. |
| HB.1.3.2 | Aile yaşamında nezaket ve görgü kurallarına uygun davranabilme | 23 | kısmi | `scenario` | Süreç bileşeni yok. Aile yaşamında nezaket ifadesini ve görgü kuralına uygun davranışı verilen durumlarda seçme scenario ile oynanabilir; kurallara evde gerçekten uyma aile yaşamında gözlenir. |
| HB.1.3.3 | Aile bireylerinin görev ve sorumluluklarını çözümleyebilme | 23 | tam | `sort_bins`, `drag_match` | a) aile içinde çocuğun üstlenebileceği görev ve sorumlulukları belirleme sort_bins ile, b) aile bireylerini görev ve sorumluluklarıyla ilişkilendirme drag_match ile çalışılır. |

#### 4. YAŞADIĞIM YER VE ÜLKEM

`g1.hayat_bilgisi.t04` · işleniş sırası 4 · programda 5 çıktı · PDF s. 26

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| HB.1.4.1 | Yaşadığı yerin ve ülkemizin genel özelliklerini açıklayabilme | 26 | kısmi | `listen_find`, `drag_match` | Süreç bileşeni yok. Ülkemizin adını, başkentini, para birimini ve üç tarafındaki denizleri harita ve görsellerde tanıma listen_find ve drag_match ile oynanabilir; yaşadığı yerin özelliklerini açıklama serbest sözlü üretim (cihaz çocuğun yaşadığı yeri bilmez). |
| HB.1.4.2 | Türk bayrağı ve İstiklâl Marşı’nın önemini ifade edebilme | 26 | tam | `story`, `listen_find`, `scenario` | Süreç bileşeni yok. Bayrağın şekil ve rengini, İstiklâl Marşı’nın şairini tanıma listen_find, bağımsızlık sembolü olma önemini sesli seçenekler arasından seçerek ifade etme story, törende saygı davranışını seçme scenario ile çalışılır. |
| HB.1.4.3 | Mustafa Kemal Atatürk’ün hayatıyla ilgili bilgileri ifade edebilme | 26 | tam | `story`, `sequence`, `listen_find` | Süreç bileşeni yok. Atatürk’ün doğum yeri, anne ve babasının adı, Anıtkabir gibi bilgileri hikâye ve anlama soruları story, hayatındaki olayları sıralama sequence, ilgili görseli bulma listen_find ile çalışılır. |
| HB.1.4.4 | Millî gün ve bayramlarda yaşadığı duyguları ifade edebilme | 26 | yok |  | Süreç bileşeni yok. Çıktı çocuğun millî gün ve bayramlarda yaşadığı kendi duygularını paylaşması; doğru cevabı olmayan kişisel ifade (programda pano, konuşma halkası). Bayram adlarını tanıma içerik olarak pekiştirilebilir ama çıktıyı karşılamaz. |
| HB.1.4.5 | Dinî gün ve bayramlarda yaşadığı duyguları ifade edebilme | 26 | yok |  | Süreç bileşeni yok. Çıktı çocuğun dinî gün ve bayramlarda yaşadığı kendi duygularını paylaşması; doğru cevabı olmayan kişisel ifade (programda pano çalışması). Gün ve bayram adlarını tanıma içerik olarak pekiştirilebilir ama çıktıyı karşılamaz. |

#### 5. DOĞA VE ÇEVRE

`g1.hayat_bilgisi.t05` · işleniş sırası 5 · programda 4 çıktı · PDF s. 30

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| HB.1.5.1 | Yakın çevresinde bulunan doğadaki varlıkları gözlemleyebilme | 30 | kısmi | `sort_bins` | c) doğadaki varlıklara ilişkin oyunda verilen gözlem kartlarını sınıflandırarak tabloya yerleştirme sort_bins ile oynanabilir; a) gözlem amacını belirleme kişisel karar, b) veri toplama gerçek gözlem (doğa yürüyüşü veli etkinliği olarak önerilebilir). |
| HB.1.5.2 | Modeller üzerinden gök cisimlerini karşılaştırabilme | 30 | kısmi | `drag_match`, `listen_find` | a) modeller üzerinden Güneş, Dünya ve Ay’ın özelliklerini belirleme drag_match ve listen_find ile oynanabilir; b–c) benzerlik ve farklılıkları listeleme serbest üretim. |
| HB.1.5.3 | Afet türlerini tanıyabilme | 30 | tam | `listen_find`, `drag_match` | Süreç bileşeni yok. Deprem, sel, yangın, heyelan, çığ gibi afet türlerini görselde tanıma listen_find, afeti nedeni ve sonucuyla eşleme drag_match ile çalışılır. |
| HB.1.5.4 | Geri dönüştürülebilen atıkları sınıflandırabilme | 30 | tam | `sort_bins`, `drag_match` | a) geri dönüştürülebilen atıkları belirleme, b) ayrıştırma ve c) tasnif etme sort_bins ile, ç) etiketleme drag_match ile çalışılır. |

#### 6. BİLİM, TEKNOLOJİ VE SANAT

`g1.hayat_bilgisi.t06` · işleniş sırası 6 · programda 3 çıktı · PDF s. 34

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| HB.1.6.1 | Bilimle ilgili merak ettiklerini sorabilme | 34 | yok |  | a) bilimle ilgili merak ettiği konuları belirleme doğru/yanlışı olmayan kişisel seçim, b) soru sorma sözlü üretim; veli için merak sorusu sohbeti önerilebilir. |
| HB.1.6.2 | Teknoloji ile ilgili merak ettiklerini sorabilme | 34 | yok |  | a) teknolojiyle ilgili merak ettiği konuları belirleme doğru/yanlışı olmayan kişisel seçim, b) soru sorma sözlü üretim; veli için merak sorusu sohbeti önerilebilir. |
| HB.1.6.3 | Sanatla ilgili merak ettiklerini sorabilme | 34 | yok |  | a) sanatla ilgili merak ettiği konuları belirleme doğru/yanlışı olmayan kişisel seçim, b) soru sorma sözlü üretim; veli için merak sorusu sohbeti önerilebilir. |

## 2. sınıf

### Matematik

#### MAT.2.3. Nesnelerin Geometrisi (1)

`g2.matematik.t01` · işleniş sırası 1 · programda 5 çıktı · PDF s. 72

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| MAT.2.3.1 | Günlük yaşamda kullanılan nesneleri biçimsel özelliklerine göre geometrik cisim olarak sınıflandırabilme | 72 | tam | `sort_bins`, `drag_match`, `listen_find` |  |
| MAT.2.3.2 | Geometrik cisim modellerini kullanarak yapılar sentezleyebilme | 72 | kısmi | `listen_find`, `drag_match`, `grid`, `scenario` | a) yapılardaki geometrik cisimleri belirleme scenario (blok yapı görselinde parçanın cismini seçme) ile, b) cisimleri yüzlerindeki şekillerle ilişkilendirme drag_match ile oynanabilir; c) birleştirerek yapı oluşturma denetlenebilir hedefle (silüeti eşle, N parça kullan) grid (paint: silhouette, pieces) ile ekranda kare birimlerle oynanabilir; özgün yapı somut bloklarla kurma ev etkinliği olarak önerilebilir. |
| MAT.2.3.3 | Geometrik şekiller kullanarak modeller sentezleyebilme | 72 | kısmi | `listen_find`, `drag_match`, `grid`, `scenario` | a) modellerdeki geometrik şekilleri belirleme scenario (şekillerden yapılmış model görselinde parçanın şeklini seçme) ile, b) şekilleri köşe sayısıyla ilişkilendirme drag_match ile oynanabilir; c) şekilleri birleştirerek model oluşturma denetlenebilir hedefle (silüeti eşle, N parça kullan) grid (paint: silhouette, pieces) ile oynanabilir; serbest özgün model ustalık hesabına girmediği için ev etkinliği olarak önerilebilir. |
| MAT.2.3.4 | Geometrik şekil ve cisimlerin yön, konum veya büyüklükleri değiştiğinde biçimsel özelliklerinin değişmediğini yorumlayabilme | 72 | kısmi | `sort_bins`, `listen_find`, `grid` | a) ve c) farklı yön ve büyüklükteki şekil ve cisimleri tanıyıp aynı şekil olarak ayırma oynanabilir; b) şekli kareli zeminde döndürerek ya da iki kat büyüterek oluşturma grid (paint/copy, transform: rotate, scale) ile oynanabilir; cisimleri farklı yön ve büyüklükte oluşturma somut model ister, ev etkinliği. |
| MAT.2.3.5 | Standart olmayan sıvı ölçme araçları ile sıvı miktarını tahmin edebilme | 72 | kısmi | `count_choose` | b) sıvı miktarını seçenekli tahmin etme ve c) tahmini, dolan bardakları sayarak bulunan ölçüm sonucuyla karşılaştırıp yakın/uzak yargısında bulunma count_choose tahmin modu (estimates) ile oynanabilir; a) gerçek kaplarla sıvı ölçme deneyimi ev etkinliği. |

#### MAT.2.1. Sayılar ve Nicelikler (1)

`g2.matematik.t02` · işleniş sırası 2 · programda 6 çıktı · PDF s. 51

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| MAT.2.1.1 | 100’e kadar olan niceliklerin büyüklüklerini temsil etmede sayıların sembolik temsillerinden yararlanabilme | 51 | tam | `count_choose`, `drag_match`, `listen_find` | c) sayı yazma 2–3. sınıfta iz sürme yerine rakam karosu girişiyle (listen_find yazma modu, answer: digits) çalışılır. |
| MAT.2.1.2 | İki basamaklı sayıları çözümleyebilme | 51 | tam | `drag_match`, `sort_bins`, `count_choose`, `listen_find` |  |
| MAT.2.1.3 | Sayıların sırasını belirleyebilme | 51 | tam | `sequence`, `balance` |  |
| MAT.2.1.4 | İleriye ve geriye doğru ritmik sayabilme | 51 | tam | `pattern`, `sequence`, `listen_find` | a) yüzlük tablo listen_find ızgarası olarak verilir; c) genelleme sesli okunan kural seçenekleri arasından seçilir. |
| MAT.2.1.5 | Sayı ve sayı temsiline dönüşen şekil örüntülerine dayalı çıkarım yapabilme | 51 | kısmi | `pattern`, `listen_find` | a) varsayımı sesli seçenekler arasından seçme, c) gösterilen örüntünün varsayımı karşılayıp karşılamadığını sınama ve d) gösterilen örüntüyü değerlendirme pattern ve listen_find ile oynanabilir; b) örüntüleri örnekler üzerinde listeleme ve ç) kuralı sözlü olarak ifade etme serbest üretim. |
| MAT.2.1.6 | Bir çokluktaki ilişkilerden yararlanarak 50’ye kadar olan nesnelerin sayısını tahmin edebilme | 51 | kısmi | `count_choose` | b) aralıklı seçeneklerle tahmin, a) parça-bütün ilişkisinden yararlanma ve c) tahmini sayma sonucuyla karşılaştırma count_choose tahmin modu (estimates) ile oynanabilir. count_choose en çok 20 nesne gösterdiği için 21–50 aralığındaki çokluklar için tahmin modunun sayma adımı büyütülmeli (spec Açık sorular, Faz 3b). |

#### MAT.2.2. İşlemlerden Cebirsel Düşünmeye

`g2.matematik.t03` · işleniş sırası 3 · programda 6 çıktı · PDF s. 66

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| MAT.2.2.1 | Toplama ve çıkarma işlemleri gerektiren günlük yaşam problemlerini çözebilme | 66 | kısmi | `story`, `drag_match`, `count_choose`, `balloon_pop`, `sort_bins` | a–c) verilen ve istenenleri belirleme, işlemi seçme, temsile dönüştürme ve e) çözümü uygulama story, drag_match, count_choose ve balloon_pop ile; ğ) çözüm stratejisinin uygulanabileceği problemleri verilen problemler arasından seçme drag_match ile; h) genellemeyi verilen örneklerle sınama sort_bins ile oynanabilir; ç) kendi ifadeleriyle açıklama ve d) strateji geliştirme serbest üretim, f–g) kendi kullandığı stratejiyi kontrol edip değiştirme ve gözden geçirme öz değerlendirme (oyun çocuğun stratejisini göremez). |
| MAT.2.2.2 | Toplama ve çıkarma işlemlerinin sonuçlarını tahminde bulunarak ve zihinden işlem yaparak muhakeme edebilme | 66 | tam | `balloon_pop`, `drag_match`, `count_choose`, `balance` | a–b) işlem ögelerini ve aralarındaki ilişkileri belirleme oynanabilir; c–ç) sonucu tahmin edip zihinden işlem sonucuyla karşılaştırma ve tutarlılığı (yakın/uzak) seçme balance tahmin modu (eksik değerli terazi) ile oynanabilir. |
| MAT.2.2.3 | Toplama ve çıkarma işlemlerinin ilişkisini yorumlayabilme | 66 | tam | `drag_match`, `balance` | c) ilişkiyi yeniden ifade etme, işlem ailesini model ve işlem kartlarıyla eşleştirerek çalışılır. |
| MAT.2.2.4 | Çarpma ve bölme işlemlerini toplama ve çıkarma işlemlerine dayalı olarak çözümleyebilme | 66 | tam | `drag_match`, `count_choose`, `sort_bins` |  |
| MAT.2.2.5 | Çarpma ve bölme işlemlerinin sonuçlarını tahminde bulunarak ve zihinden işlem yaparak muhakeme edebilme | 66 | kısmi | `drag_match`, `count_choose`, `balloon_pop`, `balance` | a–b) çarpma ve bölmenin bileşenlerini ve ilişkilerini belirleme oynanabilir; c) sonucu tahmin edip zihinden işlem sonucuyla karşılaştırma balance tahmin modu (tekrarlı toplama olarak kurulmuş eksik değerli terazi) ile oynanabilir; ç) sonuçları açıklama sözlü etkinlik. |
| MAT.2.2.6 | Dört işlem bağlamında eşitliğin farklı anlamlarını yorumlayabilme | 66 | tam | `balance`, `drag_match`, `listen_find` | c) eşitliğin anlamları (işlemin sonucu; iki tarafın eşit değeri) terazi modelli sesli seçenekler arasından seçilerek ifade edilir. |

#### MAT.2.1. Sayılar ve Nicelikler (2)

`g2.matematik.t04` · işleniş sırası 4 · programda 5 çıktı · PDF s. 58

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| MAT.2.1.7 | Bütün, yarım ve çeyrek arasındaki ilişkiyi çözümleyebilme | 58 | tam | `fraction_pizza`, `drag_match` |  |
| MAT.2.1.8 | Paraları değerlerine göre ilişkilendirerek çözümleyebilme | 58 | tam | `clock_money`, `drag_match`, `sort_bins` |  |
| MAT.2.1.9 | Zaman ölçü birimlerini okuyabilme ve yazabilme | 58 | tam | `clock_money`, `drag_match`, `sort_bins` | Yazma, dijital saati kurma ve eşleştirmeyle çalışılır. |
| MAT.2.1.10 | Standart uzunluk ve kütle ölçme araçlarının ve birimlerinin gerekliliğini yansıtabilme | 58 | kısmi | `scenario`, `listen_find` | b–c) farklı karışlarla farklı sonuç çıkan durumdan standart birim gereğini çıkarma scenario ile oynanabilir; a) kendi standart olmayan ölçme deneyimlerini gözden geçirme gerçek ölçme deneyimi ister. |
| MAT.2.1.11 | Standart uzunluk ve kütle ölçü birimleri cinsinden uzunlukları ve kütleleri tahmin edebilme | 58 | kısmi | `listen_find`, `drag_match`, `count_choose` | b) uygun standart birimi seçme listen_find, nesneyle eşleştirme drag_match ve birim cinsinden aralıklı seçeneklerle tahmin count_choose ile oynanabilir; c) tahmini ölçüm sonucuyla karşılaştırıp yargıda bulunma count_choose tahmin modu (estimates) ile, metre çubuklarını, kilogramlık ağırlıkları ya da santimetre küplerini sayarak kontrol edip oynanabilir; a) standart birimlerle gerçek ölçme deneyimini ilişkilendirme ev etkinliği. |

#### MAT.2.3. Nesnelerin Geometrisi (2)

`g2.matematik.t05` · işleniş sırası 5 · programda 2 çıktı · PDF s. 77

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| MAT.2.3.6 | Mesafe ve yönleri içerecek şekilde hedefe ulaşmak için uygun stratejilere karar verebilme | 77 | kısmi | `count_choose`, `listen_find`, `grid` | b) ölçüte uygun bilgiyi toplama (yolların kare sayısını sayma) count_choose ile, d) seçenekler arasından ölçüte uygun yolu seçme listen_find ile, c) yol oluşturma, ç) yolu mantıksal denetleme ve e) engel eklenince yeniden planlama grid (path/build, shortest, walls) ile oynanabilir; a) ölçütü kendisi belirleme doğru/yanlışı olmayan kişisel karar, oyunda ölçüt hazır verilir. |
| MAT.2.3.7 | Verilen şekiller arasından simetrik olanları ayırt edebilme | 77 | tam | `sort_bins`, `listen_find` |  |

#### MAT.2.4. Veriye Dayalı Araştırma

`g2.matematik.t06` · işleniş sırası 6 · programda 1 çıktı · PDF s. 81

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| MAT.2.4.1 | Kategorik veriye dayalı en çok iki veri grubu ile çalışabilme ve veriye dayalı karar verebilme | 81 | kısmi | `listen_find`, `count_choose`, `sort_bins`, `chart_build` | d) görselleştirme aracını seçme, f) hazır şekil grafiğini yorumlama ve g) sonuçları oyunda verilen araştırma sorusuna göre değerlendirme oynanabilir; e) verilen veriyle çetele, tablo ve grafik oluşturma chart_build ile oynanabilir; a–c) araştırma durumunu ve sorularını belirleme ve plan yapma çocuğun kendi araştırması, ç) veri toplama gerçek dünya etkinliği (sınıf ya da ev). |

### Türkçe

#### 1. TEMA: DEĞERLERİMİZLE VARIZ

`g2.turkce.t01` · işleniş sırası 1 · programda 12 çıktı · PDF s. 71

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.2.1 | Dinlemeyi/izlemeyi yönetebilme | 205 | kısmi | `scenario` | a) oyunda verilen amaca uygun dinleyeceğini seçme scenario ile oynanabilir (ilgi alanına göre tercih doğru/yanlışı olmayan kişisel seçim); b) dinleme kurallarına uygun dinleme ve c) uygun zamanda söz alma gerçek iletişimde gözlenen davranış. |
| T.D.2.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 205 | kısmi | `story`, `sort_bins` | a) yaşantı ve ön bilgiyle çıkarım, b) görsellerden konu tahmini, c–ç) olayların öncesi ve sonrası hakkında tahmin ve f) metindeki bilgileri doğruluk açısından karşılaştırma story ile; e) iletileri doğruluk ve gerçeklik açısından ayırma ve g) nesne ve karakterleri özelliklerine göre sınıflandırma sort_bins ile oynanabilir; d) kendi ilgi alanına uygun çıkarım kişiseldir, oyun doğruluğunu denetleyemez; ğ) düşüncelerini ifade etme serbest sözlü üretim. |
| T.D.2.3 | Dinlediklerini/izlediklerini çözümleyebilme | 205 | tam | `story`, `drag_match` | a) olayları belirleme, b) konuyu bulma ve c) iletilerin benzerlik ve farklılıklarını belirleme story anlama soruları, ç) söylem–görsel ilişkisi drag_match ile çalışılır. |
| T.K.2.1 | Konuşmalarını yönetebilme | 205 | kısmi | `scenario` | a) konunun özelliğine uygun konuşma üslubunu verilen durumlarda seçme scenario ile oynanabilir; b–c) konuşmasını tür ve amaca göre belirleme, ç) göz teması, d) uygun zamanda söz alma, e) selamlaşma ve hitap ifadeleri kullanma ve f) konuşma planı hazırlama çocuğun kendi konuşmasını ve sözlü üretimi gerektirir. |
| T.K.2.2 | Konuşmalarında içerik oluşturabilme | 205 | kısmi | `sequence` | b) görsellerden olayların oluş sırası hakkında tahmin sequence ile oynanabilir; a) ve c–h) ifade etme, açıklama, sınıflandırarak anlatma, zıt anlamlı sözcük ve benzetme kullanma, olayları kendi ifadeleriyle anlatma, görüş bildirme, neden-sonuç söyleme ve görsel kullanma sözlü üretim. |
| T.K.2.3 | Konuşma kurallarını uygulayabilme | 206 | yok |  | Bileşenler (a–h) konuşma hızı, plana uygun konuşma, vurgu ve tonlama, sözcük ve cümle kullanımı, bağlama ögeleri, jest, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez. |
| T.O.2.1 | Okuma sürecini yönetebilme | 206 | kısmi | `story` | a) okuyacağı metnin başlık ve görsellerini inceleme story ile oynanabilir; b) ilgi alanına göre metin seçme doğru/yanlışı olmayan kişisel tercih (oyun seçim sunabilir ama değerlendiremez); c) sesli okuma ve ç) noktalamaya dikkat ederek okuma sesli okuma gerektirir. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.2.2 | Okudukları ile ilgili anlam oluşturabilme | 206 | kısmi | `story`, `sort_bins`, `drag_match` | a) bilgiler ile ön bilgi arasında bağlantı kurma, b–c) başlık ve görsellerden konu ve olay tahmini, ç) verilerden çıkarım story ile; d) iletileri ön bilgiyle karşılaştırma (doğru, yanlış) ve e) nesne ve kişileri sınıflandırma sort_bins ile; f) zıt anlamlı sözcükleri bulma drag_match ile oynanabilir; g) iletilere katılıp katılmadığını ifade etme doğru cevabı olmayan kişisel görüş. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.2.3 | Okuduklarını çözümleyebilme | 206 | kısmi | `story`, `drag_match` | b) konuyu bulma ve c) iletilerin benzerlik ve farklılıklarını belirleme story ile, ç) içerik ile tablo ve grafik arasındaki ilişkiyi belirleme drag_match ile oynanabilir; a) karakter, olay ve bilgileri açıklama serbest sözlü üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.Y.2.1 | Yazılı anlatım becerilerini yönetebilme | 207 | yok |  | Bileşenler (a–d) hazırlık yaparak ve yazı türüne göre yazma, yazışmayı selamlaşma ve uygun ifadelerle başlatıp sonlandırma, yazma planı hazırlama; hepsi serbest yazılı üretim. |
| T.Y.2.2 | Yazılarında içerik oluşturabilme | 207 | yok |  | Bütün bileşenler (a–m) çocuğun kendi yazısını üretmesini ister: eksik cümle ve metin yazma, tahminini yazma, yazılarında karşılaştırma, sınıflandırma ve sözcük kullanma, olayları kendi ifadeleriyle yazma, yönerge, görüş, istek ve öneri yazma, yazıyı sunma, görsel, benzetme ve örnek kullanma, neden-sonuç yazma; serbest yazılı üretim. Eksik bir cümleyi ya da metni yazmak bütün bir cümle üretimidir; T.Y.1.2 b’deki harf, hece ya da sözcük tamamlama ise kapalı karo kümesiyle yapılır. |
| T.Y.2.3 | Yazma kurallarını uygulayabilme | 207 | kısmi | `drag_match` | d) soru edatını ayrı yazma (mı/mi karosunu cümlede doğru yere yerleştirme), e) kısaltmaları kuralına uygun yazma (doğru yazılmış kısaltmayı açılımıyla eşleme) ve f) büyük harfleri kuralına uygun yazma drag_match ile oynanabilir; a) plana uygun yazma, b) kaynaktan araştırarak yazma, c) sözcükleri yerinde kullanma, ç) mesajı açık ifade etme, g) yazım alanını kullanma ve ğ) noktalama işaretlerini kullanma çocuğun kendi yazısında gerçekleşir, serbest yazılı üretim. |

#### 2. TEMA: ATATÜRK VE ÇOCUK

`g2.turkce.t02` · işleniş sırası 2 · programda 12 çıktı · PDF s. 77

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.2.1 | Dinlemeyi/izlemeyi yönetebilme | 205 | kısmi | `scenario` | a) oyunda verilen amaca uygun dinleyeceğini seçme scenario ile oynanabilir (ilgi alanına göre tercih doğru/yanlışı olmayan kişisel seçim); b) dinleme kurallarına uygun dinleme ve c) uygun zamanda söz alma gerçek iletişimde gözlenen davranış. |
| T.D.2.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 205 | kısmi | `story`, `sort_bins` | a) yaşantı ve ön bilgiyle çıkarım, b) görsellerden konu tahmini, c–ç) olayların öncesi ve sonrası hakkında tahmin ve f) metindeki bilgileri doğruluk açısından karşılaştırma story ile; e) iletileri doğruluk ve gerçeklik açısından ayırma ve g) nesne ve karakterleri özelliklerine göre sınıflandırma sort_bins ile oynanabilir; d) kendi ilgi alanına uygun çıkarım kişiseldir, oyun doğruluğunu denetleyemez; ğ) düşüncelerini ifade etme serbest sözlü üretim. |
| T.D.2.3 | Dinlediklerini/izlediklerini çözümleyebilme | 205 | tam | `story`, `drag_match` | a) olayları belirleme, b) konuyu bulma ve c) iletilerin benzerlik ve farklılıklarını belirleme story anlama soruları, ç) söylem–görsel ilişkisi drag_match ile çalışılır. |
| T.K.2.1 | Konuşmalarını yönetebilme | 205 | kısmi | `scenario` | a) konunun özelliğine uygun konuşma üslubunu verilen durumlarda seçme scenario ile oynanabilir; b–c) konuşmasını tür ve amaca göre belirleme, ç) göz teması, d) uygun zamanda söz alma, e) selamlaşma ve hitap ifadeleri kullanma ve f) konuşma planı hazırlama çocuğun kendi konuşmasını ve sözlü üretimi gerektirir. |
| T.K.2.2 | Konuşmalarında içerik oluşturabilme | 205 | kısmi | `sequence` | b) görsellerden olayların oluş sırası hakkında tahmin sequence ile oynanabilir; a) ve c–h) ifade etme, açıklama, sınıflandırarak anlatma, zıt anlamlı sözcük ve benzetme kullanma, olayları kendi ifadeleriyle anlatma, görüş bildirme, neden-sonuç söyleme ve görsel kullanma sözlü üretim. |
| T.K.2.3 | Konuşma kurallarını uygulayabilme | 206 | yok |  | Bileşenler (a–h) konuşma hızı, plana uygun konuşma, vurgu ve tonlama, sözcük ve cümle kullanımı, bağlama ögeleri, jest, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez. |
| T.O.2.1 | Okuma sürecini yönetebilme | 206 | kısmi | `story` | a) okuyacağı metnin başlık ve görsellerini inceleme story ile oynanabilir; b) ilgi alanına göre metin seçme doğru/yanlışı olmayan kişisel tercih (oyun seçim sunabilir ama değerlendiremez); c) sesli okuma ve ç) noktalamaya dikkat ederek okuma sesli okuma gerektirir. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.2.2 | Okudukları ile ilgili anlam oluşturabilme | 206 | kısmi | `story`, `sort_bins`, `drag_match` | a) bilgiler ile ön bilgi arasında bağlantı kurma, b–c) başlık ve görsellerden konu ve olay tahmini, ç) verilerden çıkarım story ile; d) iletileri ön bilgiyle karşılaştırma (doğru, yanlış) ve e) nesne ve kişileri sınıflandırma sort_bins ile; f) zıt anlamlı sözcükleri bulma drag_match ile oynanabilir; g) iletilere katılıp katılmadığını ifade etme doğru cevabı olmayan kişisel görüş. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.2.3 | Okuduklarını çözümleyebilme | 206 | kısmi | `story`, `drag_match` | b) konuyu bulma ve c) iletilerin benzerlik ve farklılıklarını belirleme story ile, ç) içerik ile tablo ve grafik arasındaki ilişkiyi belirleme drag_match ile oynanabilir; a) karakter, olay ve bilgileri açıklama serbest sözlü üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.Y.2.1 | Yazılı anlatım becerilerini yönetebilme | 207 | yok |  | Bileşenler (a–d) hazırlık yaparak ve yazı türüne göre yazma, yazışmayı selamlaşma ve uygun ifadelerle başlatıp sonlandırma, yazma planı hazırlama; hepsi serbest yazılı üretim. |
| T.Y.2.2 | Yazılarında içerik oluşturabilme | 207 | yok |  | Bütün bileşenler (a–m) çocuğun kendi yazısını üretmesini ister: eksik cümle ve metin yazma, tahminini yazma, yazılarında karşılaştırma, sınıflandırma ve sözcük kullanma, olayları kendi ifadeleriyle yazma, yönerge, görüş, istek ve öneri yazma, yazıyı sunma, görsel, benzetme ve örnek kullanma, neden-sonuç yazma; serbest yazılı üretim. Eksik bir cümleyi ya da metni yazmak bütün bir cümle üretimidir; T.Y.1.2 b’deki harf, hece ya da sözcük tamamlama ise kapalı karo kümesiyle yapılır. |
| T.Y.2.3 | Yazma kurallarını uygulayabilme | 207 | kısmi | `drag_match` | d) soru edatını ayrı yazma (mı/mi karosunu cümlede doğru yere yerleştirme), e) kısaltmaları kuralına uygun yazma (doğru yazılmış kısaltmayı açılımıyla eşleme) ve f) büyük harfleri kuralına uygun yazma drag_match ile oynanabilir; a) plana uygun yazma, b) kaynaktan araştırarak yazma, c) sözcükleri yerinde kullanma, ç) mesajı açık ifade etme, g) yazım alanını kullanma ve ğ) noktalama işaretlerini kullanma çocuğun kendi yazısında gerçekleşir, serbest yazılı üretim. |

#### 3. TEMA: DOĞADA NELER OLUYOR?

`g2.turkce.t03` · işleniş sırası 3 · programda 13 çıktı · PDF s. 83

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.2.1 | Dinlemeyi/izlemeyi yönetebilme | 205 | kısmi | `scenario` | a) oyunda verilen amaca uygun dinleyeceğini seçme scenario ile oynanabilir (ilgi alanına göre tercih doğru/yanlışı olmayan kişisel seçim); b) dinleme kurallarına uygun dinleme ve c) uygun zamanda söz alma gerçek iletişimde gözlenen davranış. |
| T.D.2.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 205 | kısmi | `story`, `sort_bins` | a) yaşantı ve ön bilgiyle çıkarım, b) görsellerden konu tahmini, c–ç) olayların öncesi ve sonrası hakkında tahmin ve f) metindeki bilgileri doğruluk açısından karşılaştırma story ile; e) iletileri doğruluk ve gerçeklik açısından ayırma ve g) nesne ve karakterleri özelliklerine göre sınıflandırma sort_bins ile oynanabilir; d) kendi ilgi alanına uygun çıkarım kişiseldir, oyun doğruluğunu denetleyemez; ğ) düşüncelerini ifade etme serbest sözlü üretim. |
| T.D.2.3 | Dinlediklerini/izlediklerini çözümleyebilme | 205 | tam | `story`, `drag_match` | a) olayları belirleme, b) konuyu bulma ve c) iletilerin benzerlik ve farklılıklarını belirleme story anlama soruları, ç) söylem–görsel ilişkisi drag_match ile çalışılır. |
| T.K.2.1 | Konuşmalarını yönetebilme | 205 | kısmi | `scenario` | a) konunun özelliğine uygun konuşma üslubunu verilen durumlarda seçme scenario ile oynanabilir; b–c) konuşmasını tür ve amaca göre belirleme, ç) göz teması, d) uygun zamanda söz alma, e) selamlaşma ve hitap ifadeleri kullanma ve f) konuşma planı hazırlama çocuğun kendi konuşmasını ve sözlü üretimi gerektirir. |
| T.K.2.2 | Konuşmalarında içerik oluşturabilme | 205 | kısmi | `sequence` | b) görsellerden olayların oluş sırası hakkında tahmin sequence ile oynanabilir; a) ve c–h) ifade etme, açıklama, sınıflandırarak anlatma, zıt anlamlı sözcük ve benzetme kullanma, olayları kendi ifadeleriyle anlatma, görüş bildirme, neden-sonuç söyleme ve görsel kullanma sözlü üretim. |
| T.K.2.3 | Konuşma kurallarını uygulayabilme | 206 | yok |  | Bileşenler (a–h) konuşma hızı, plana uygun konuşma, vurgu ve tonlama, sözcük ve cümle kullanımı, bağlama ögeleri, jest, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez. |
| T.K.2.5 | Konuşma sürecini değerlendirebilme | 206 | yok |  | Bileşenler (a–c) kendi konuşmasındaki hataları düzeltme ve olumlu davranışları fark edip sonraki konuşmalarına aktarma; kendi konuşması üzerinde öz değerlendirme. |
| T.O.2.1 | Okuma sürecini yönetebilme | 206 | kısmi | `story` | a) okuyacağı metnin başlık ve görsellerini inceleme story ile oynanabilir; b) ilgi alanına göre metin seçme doğru/yanlışı olmayan kişisel tercih (oyun seçim sunabilir ama değerlendiremez); c) sesli okuma ve ç) noktalamaya dikkat ederek okuma sesli okuma gerektirir. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.2.2 | Okudukları ile ilgili anlam oluşturabilme | 206 | kısmi | `story`, `sort_bins`, `drag_match` | a) bilgiler ile ön bilgi arasında bağlantı kurma, b–c) başlık ve görsellerden konu ve olay tahmini, ç) verilerden çıkarım story ile; d) iletileri ön bilgiyle karşılaştırma (doğru, yanlış) ve e) nesne ve kişileri sınıflandırma sort_bins ile; f) zıt anlamlı sözcükleri bulma drag_match ile oynanabilir; g) iletilere katılıp katılmadığını ifade etme doğru cevabı olmayan kişisel görüş. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.2.3 | Okuduklarını çözümleyebilme | 206 | kısmi | `story`, `drag_match` | b) konuyu bulma ve c) iletilerin benzerlik ve farklılıklarını belirleme story ile, ç) içerik ile tablo ve grafik arasındaki ilişkiyi belirleme drag_match ile oynanabilir; a) karakter, olay ve bilgileri açıklama serbest sözlü üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.Y.2.1 | Yazılı anlatım becerilerini yönetebilme | 207 | yok |  | Bileşenler (a–d) hazırlık yaparak ve yazı türüne göre yazma, yazışmayı selamlaşma ve uygun ifadelerle başlatıp sonlandırma, yazma planı hazırlama; hepsi serbest yazılı üretim. |
| T.Y.2.2 | Yazılarında içerik oluşturabilme | 207 | yok |  | Bütün bileşenler (a–m) çocuğun kendi yazısını üretmesini ister: eksik cümle ve metin yazma, tahminini yazma, yazılarında karşılaştırma, sınıflandırma ve sözcük kullanma, olayları kendi ifadeleriyle yazma, yönerge, görüş, istek ve öneri yazma, yazıyı sunma, görsel, benzetme ve örnek kullanma, neden-sonuç yazma; serbest yazılı üretim. Eksik bir cümleyi ya da metni yazmak bütün bir cümle üretimidir; T.Y.1.2 b’deki harf, hece ya da sözcük tamamlama ise kapalı karo kümesiyle yapılır. |
| T.Y.2.3 | Yazma kurallarını uygulayabilme | 207 | kısmi | `drag_match` | d) soru edatını ayrı yazma (mı/mi karosunu cümlede doğru yere yerleştirme), e) kısaltmaları kuralına uygun yazma (doğru yazılmış kısaltmayı açılımıyla eşleme) ve f) büyük harfleri kuralına uygun yazma drag_match ile oynanabilir; a) plana uygun yazma, b) kaynaktan araştırarak yazma, c) sözcükleri yerinde kullanma, ç) mesajı açık ifade etme, g) yazım alanını kullanma ve ğ) noktalama işaretlerini kullanma çocuğun kendi yazısında gerçekleşir, serbest yazılı üretim. |

#### 4. TEMA: OKUMA SERÜVENİMİZ

`g2.turkce.t04` · işleniş sırası 4 · programda 16 çıktı · PDF s. 88

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.2.1 | Dinlemeyi/izlemeyi yönetebilme | 205 | kısmi | `scenario` | a) oyunda verilen amaca uygun dinleyeceğini seçme scenario ile oynanabilir (ilgi alanına göre tercih doğru/yanlışı olmayan kişisel seçim); b) dinleme kurallarına uygun dinleme ve c) uygun zamanda söz alma gerçek iletişimde gözlenen davranış. |
| T.D.2.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 205 | kısmi | `story`, `sort_bins` | a) yaşantı ve ön bilgiyle çıkarım, b) görsellerden konu tahmini, c–ç) olayların öncesi ve sonrası hakkında tahmin ve f) metindeki bilgileri doğruluk açısından karşılaştırma story ile; e) iletileri doğruluk ve gerçeklik açısından ayırma ve g) nesne ve karakterleri özelliklerine göre sınıflandırma sort_bins ile oynanabilir; d) kendi ilgi alanına uygun çıkarım kişiseldir, oyun doğruluğunu denetleyemez; ğ) düşüncelerini ifade etme serbest sözlü üretim. |
| T.D.2.3 | Dinlediklerini/izlediklerini çözümleyebilme | 205 | tam | `story`, `drag_match` | a) olayları belirleme, b) konuyu bulma ve c) iletilerin benzerlik ve farklılıklarını belirleme story anlama soruları, ç) söylem–görsel ilişkisi drag_match ile çalışılır. |
| T.D.2.4 | Dinleme/izleme sürecine etki eden durumları gözden geçirebilme | 205 | yok |  | Tek bileşen a) dinleme yapacağı gerçek ortamın uygunluğunu gözden geçirme; çocuğun kendi ortamına bağlı. Uygun ve uygun olmayan ortam görsellerini ayırma içerik olarak pekiştirilebilir ama bileşeni karşılamaz. |
| T.D.2.5 | Dinleme/izleme sürecini değerlendirebilme | 205 | yok |  | Bileşenler (a–c) kendi dinleme sürecindeki hataları belirleme, düzeltme ve uygun davranışları aktarma; öz değerlendirme oyunda denetlenemez. |
| T.K.2.1 | Konuşmalarını yönetebilme | 205 | kısmi | `scenario` | a) konunun özelliğine uygun konuşma üslubunu verilen durumlarda seçme scenario ile oynanabilir; b–c) konuşmasını tür ve amaca göre belirleme, ç) göz teması, d) uygun zamanda söz alma, e) selamlaşma ve hitap ifadeleri kullanma ve f) konuşma planı hazırlama çocuğun kendi konuşmasını ve sözlü üretimi gerektirir. |
| T.K.2.2 | Konuşmalarında içerik oluşturabilme | 205 | kısmi | `sequence` | b) görsellerden olayların oluş sırası hakkında tahmin sequence ile oynanabilir; a) ve c–h) ifade etme, açıklama, sınıflandırarak anlatma, zıt anlamlı sözcük ve benzetme kullanma, olayları kendi ifadeleriyle anlatma, görüş bildirme, neden-sonuç söyleme ve görsel kullanma sözlü üretim. |
| T.K.2.3 | Konuşma kurallarını uygulayabilme | 206 | yok |  | Bileşenler (a–h) konuşma hızı, plana uygun konuşma, vurgu ve tonlama, sözcük ve cümle kullanımı, bağlama ögeleri, jest, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez. |
| T.O.2.1 | Okuma sürecini yönetebilme | 206 | kısmi | `story` | a) okuyacağı metnin başlık ve görsellerini inceleme story ile oynanabilir; b) ilgi alanına göre metin seçme doğru/yanlışı olmayan kişisel tercih (oyun seçim sunabilir ama değerlendiremez); c) sesli okuma ve ç) noktalamaya dikkat ederek okuma sesli okuma gerektirir. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.2.2 | Okudukları ile ilgili anlam oluşturabilme | 206 | kısmi | `story`, `sort_bins`, `drag_match` | a) bilgiler ile ön bilgi arasında bağlantı kurma, b–c) başlık ve görsellerden konu ve olay tahmini, ç) verilerden çıkarım story ile; d) iletileri ön bilgiyle karşılaştırma (doğru, yanlış) ve e) nesne ve kişileri sınıflandırma sort_bins ile; f) zıt anlamlı sözcükleri bulma drag_match ile oynanabilir; g) iletilere katılıp katılmadığını ifade etme doğru cevabı olmayan kişisel görüş. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.2.3 | Okuduklarını çözümleyebilme | 206 | kısmi | `story`, `drag_match` | b) konuyu bulma ve c) iletilerin benzerlik ve farklılıklarını belirleme story ile, ç) içerik ile tablo ve grafik arasındaki ilişkiyi belirleme drag_match ile oynanabilir; a) karakter, olay ve bilgileri açıklama serbest sözlü üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.2.4 | Okuma sürecine etki eden durumları gözden geçirebilme | 207 | yok |  | a) okuduğu ortamın okumasına etkisini açıklama serbest sözlü üretim; b) ortamın fiziksel özelliklerini dikkate alarak okuma çocuğun gerçek okuma ortamındaki davranışı. |
| T.Y.2.1 | Yazılı anlatım becerilerini yönetebilme | 207 | yok |  | Bileşenler (a–d) hazırlık yaparak ve yazı türüne göre yazma, yazışmayı selamlaşma ve uygun ifadelerle başlatıp sonlandırma, yazma planı hazırlama; hepsi serbest yazılı üretim. |
| T.Y.2.2 | Yazılarında içerik oluşturabilme | 207 | yok |  | Bütün bileşenler (a–m) çocuğun kendi yazısını üretmesini ister: eksik cümle ve metin yazma, tahminini yazma, yazılarında karşılaştırma, sınıflandırma ve sözcük kullanma, olayları kendi ifadeleriyle yazma, yönerge, görüş, istek ve öneri yazma, yazıyı sunma, görsel, benzetme ve örnek kullanma, neden-sonuç yazma; serbest yazılı üretim. Eksik bir cümleyi ya da metni yazmak bütün bir cümle üretimidir; T.Y.1.2 b’deki harf, hece ya da sözcük tamamlama ise kapalı karo kümesiyle yapılır. |
| T.Y.2.3 | Yazma kurallarını uygulayabilme | 207 | kısmi | `drag_match` | d) soru edatını ayrı yazma (mı/mi karosunu cümlede doğru yere yerleştirme), e) kısaltmaları kuralına uygun yazma (doğru yazılmış kısaltmayı açılımıyla eşleme) ve f) büyük harfleri kuralına uygun yazma drag_match ile oynanabilir; a) plana uygun yazma, b) kaynaktan araştırarak yazma, c) sözcükleri yerinde kullanma, ç) mesajı açık ifade etme, g) yazım alanını kullanma ve ğ) noktalama işaretlerini kullanma çocuğun kendi yazısında gerçekleşir, serbest yazılı üretim. |
| T.Y.2.5 | Yazma sürecini değerlendirebilme | 208 | yok |  | Bileşenler (a–c) kendi yazılarındaki hataları bulup düzeltme ve uygun davranışları sonraki yazılarına aktarma; kendi kâğıt yazısı üzerinde öz değerlendirme. |

#### 5. TEMA: YETENEKLERİMİZİ TANIYORUZ

`g2.turkce.t05` · işleniş sırası 5 · programda 13 çıktı · PDF s. 93

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.2.1 | Dinlemeyi/izlemeyi yönetebilme | 205 | kısmi | `scenario` | a) oyunda verilen amaca uygun dinleyeceğini seçme scenario ile oynanabilir (ilgi alanına göre tercih doğru/yanlışı olmayan kişisel seçim); b) dinleme kurallarına uygun dinleme ve c) uygun zamanda söz alma gerçek iletişimde gözlenen davranış. |
| T.D.2.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 205 | kısmi | `story`, `sort_bins` | a) yaşantı ve ön bilgiyle çıkarım, b) görsellerden konu tahmini, c–ç) olayların öncesi ve sonrası hakkında tahmin ve f) metindeki bilgileri doğruluk açısından karşılaştırma story ile; e) iletileri doğruluk ve gerçeklik açısından ayırma ve g) nesne ve karakterleri özelliklerine göre sınıflandırma sort_bins ile oynanabilir; d) kendi ilgi alanına uygun çıkarım kişiseldir, oyun doğruluğunu denetleyemez; ğ) düşüncelerini ifade etme serbest sözlü üretim. |
| T.D.2.3 | Dinlediklerini/izlediklerini çözümleyebilme | 205 | tam | `story`, `drag_match` | a) olayları belirleme, b) konuyu bulma ve c) iletilerin benzerlik ve farklılıklarını belirleme story anlama soruları, ç) söylem–görsel ilişkisi drag_match ile çalışılır. |
| T.K.2.1 | Konuşmalarını yönetebilme | 205 | kısmi | `scenario` | a) konunun özelliğine uygun konuşma üslubunu verilen durumlarda seçme scenario ile oynanabilir; b–c) konuşmasını tür ve amaca göre belirleme, ç) göz teması, d) uygun zamanda söz alma, e) selamlaşma ve hitap ifadeleri kullanma ve f) konuşma planı hazırlama çocuğun kendi konuşmasını ve sözlü üretimi gerektirir. |
| T.K.2.2 | Konuşmalarında içerik oluşturabilme | 205 | kısmi | `sequence` | b) görsellerden olayların oluş sırası hakkında tahmin sequence ile oynanabilir; a) ve c–h) ifade etme, açıklama, sınıflandırarak anlatma, zıt anlamlı sözcük ve benzetme kullanma, olayları kendi ifadeleriyle anlatma, görüş bildirme, neden-sonuç söyleme ve görsel kullanma sözlü üretim. |
| T.K.2.3 | Konuşma kurallarını uygulayabilme | 206 | yok |  | Bileşenler (a–h) konuşma hızı, plana uygun konuşma, vurgu ve tonlama, sözcük ve cümle kullanımı, bağlama ögeleri, jest, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez. |
| T.O.2.1 | Okuma sürecini yönetebilme | 206 | kısmi | `story` | a) okuyacağı metnin başlık ve görsellerini inceleme story ile oynanabilir; b) ilgi alanına göre metin seçme doğru/yanlışı olmayan kişisel tercih (oyun seçim sunabilir ama değerlendiremez); c) sesli okuma ve ç) noktalamaya dikkat ederek okuma sesli okuma gerektirir. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.2.2 | Okudukları ile ilgili anlam oluşturabilme | 206 | kısmi | `story`, `sort_bins`, `drag_match` | a) bilgiler ile ön bilgi arasında bağlantı kurma, b–c) başlık ve görsellerden konu ve olay tahmini, ç) verilerden çıkarım story ile; d) iletileri ön bilgiyle karşılaştırma (doğru, yanlış) ve e) nesne ve kişileri sınıflandırma sort_bins ile; f) zıt anlamlı sözcükleri bulma drag_match ile oynanabilir; g) iletilere katılıp katılmadığını ifade etme doğru cevabı olmayan kişisel görüş. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.2.3 | Okuduklarını çözümleyebilme | 206 | kısmi | `story`, `drag_match` | b) konuyu bulma ve c) iletilerin benzerlik ve farklılıklarını belirleme story ile, ç) içerik ile tablo ve grafik arasındaki ilişkiyi belirleme drag_match ile oynanabilir; a) karakter, olay ve bilgileri açıklama serbest sözlü üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.Y.2.1 | Yazılı anlatım becerilerini yönetebilme | 207 | yok |  | Bileşenler (a–d) hazırlık yaparak ve yazı türüne göre yazma, yazışmayı selamlaşma ve uygun ifadelerle başlatıp sonlandırma, yazma planı hazırlama; hepsi serbest yazılı üretim. |
| T.Y.2.2 | Yazılarında içerik oluşturabilme | 207 | yok |  | Bütün bileşenler (a–m) çocuğun kendi yazısını üretmesini ister: eksik cümle ve metin yazma, tahminini yazma, yazılarında karşılaştırma, sınıflandırma ve sözcük kullanma, olayları kendi ifadeleriyle yazma, yönerge, görüş, istek ve öneri yazma, yazıyı sunma, görsel, benzetme ve örnek kullanma, neden-sonuç yazma; serbest yazılı üretim. Eksik bir cümleyi ya da metni yazmak bütün bir cümle üretimidir; T.Y.1.2 b’deki harf, hece ya da sözcük tamamlama ise kapalı karo kümesiyle yapılır. |
| T.Y.2.3 | Yazma kurallarını uygulayabilme | 207 | kısmi | `drag_match` | d) soru edatını ayrı yazma (mı/mi karosunu cümlede doğru yere yerleştirme), e) kısaltmaları kuralına uygun yazma (doğru yazılmış kısaltmayı açılımıyla eşleme) ve f) büyük harfleri kuralına uygun yazma drag_match ile oynanabilir; a) plana uygun yazma, b) kaynaktan araştırarak yazma, c) sözcükleri yerinde kullanma, ç) mesajı açık ifade etme, g) yazım alanını kullanma ve ğ) noktalama işaretlerini kullanma çocuğun kendi yazısında gerçekleşir, serbest yazılı üretim. |
| T.Y.2.4 | Yazma sürecine etki eden durumları gözden geçirebilme | 208 | yok |  | Tek bileşen a) yazma yapacağı gerçek ortamın uygunluğunu gözden geçirme; çocuğun kendi ortamına bağlı. |

#### 6. TEMA: MUCİT ÇOCUK

`g2.turkce.t06` · işleniş sırası 6 · programda 13 çıktı · PDF s. 98

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.2.1 | Dinlemeyi/izlemeyi yönetebilme | 205 | kısmi | `scenario` | a) oyunda verilen amaca uygun dinleyeceğini seçme scenario ile oynanabilir (ilgi alanına göre tercih doğru/yanlışı olmayan kişisel seçim); b) dinleme kurallarına uygun dinleme ve c) uygun zamanda söz alma gerçek iletişimde gözlenen davranış. |
| T.D.2.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 205 | kısmi | `story`, `sort_bins` | a) yaşantı ve ön bilgiyle çıkarım, b) görsellerden konu tahmini, c–ç) olayların öncesi ve sonrası hakkında tahmin ve f) metindeki bilgileri doğruluk açısından karşılaştırma story ile; e) iletileri doğruluk ve gerçeklik açısından ayırma ve g) nesne ve karakterleri özelliklerine göre sınıflandırma sort_bins ile oynanabilir; d) kendi ilgi alanına uygun çıkarım kişiseldir, oyun doğruluğunu denetleyemez; ğ) düşüncelerini ifade etme serbest sözlü üretim. |
| T.D.2.3 | Dinlediklerini/izlediklerini çözümleyebilme | 205 | tam | `story`, `drag_match` | a) olayları belirleme, b) konuyu bulma ve c) iletilerin benzerlik ve farklılıklarını belirleme story anlama soruları, ç) söylem–görsel ilişkisi drag_match ile çalışılır. |
| T.K.2.1 | Konuşmalarını yönetebilme | 205 | kısmi | `scenario` | a) konunun özelliğine uygun konuşma üslubunu verilen durumlarda seçme scenario ile oynanabilir; b–c) konuşmasını tür ve amaca göre belirleme, ç) göz teması, d) uygun zamanda söz alma, e) selamlaşma ve hitap ifadeleri kullanma ve f) konuşma planı hazırlama çocuğun kendi konuşmasını ve sözlü üretimi gerektirir. |
| T.K.2.2 | Konuşmalarında içerik oluşturabilme | 205 | kısmi | `sequence` | b) görsellerden olayların oluş sırası hakkında tahmin sequence ile oynanabilir; a) ve c–h) ifade etme, açıklama, sınıflandırarak anlatma, zıt anlamlı sözcük ve benzetme kullanma, olayları kendi ifadeleriyle anlatma, görüş bildirme, neden-sonuç söyleme ve görsel kullanma sözlü üretim. |
| T.K.2.3 | Konuşma kurallarını uygulayabilme | 206 | yok |  | Bileşenler (a–h) konuşma hızı, plana uygun konuşma, vurgu ve tonlama, sözcük ve cümle kullanımı, bağlama ögeleri, jest, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez. |
| T.K.2.4 | Konuşma sürecine etki eden durumları gözden geçirebilme | 206 | yok |  | Tek bileşen a) konuşma yapacağı gerçek ortamın uygunluğunu gözden geçirme; çocuğun kendi ortamına bağlı. |
| T.O.2.1 | Okuma sürecini yönetebilme | 206 | kısmi | `story` | a) okuyacağı metnin başlık ve görsellerini inceleme story ile oynanabilir; b) ilgi alanına göre metin seçme doğru/yanlışı olmayan kişisel tercih (oyun seçim sunabilir ama değerlendiremez); c) sesli okuma ve ç) noktalamaya dikkat ederek okuma sesli okuma gerektirir. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.2.2 | Okudukları ile ilgili anlam oluşturabilme | 206 | kısmi | `story`, `sort_bins`, `drag_match` | a) bilgiler ile ön bilgi arasında bağlantı kurma, b–c) başlık ve görsellerden konu ve olay tahmini, ç) verilerden çıkarım story ile; d) iletileri ön bilgiyle karşılaştırma (doğru, yanlış) ve e) nesne ve kişileri sınıflandırma sort_bins ile; f) zıt anlamlı sözcükleri bulma drag_match ile oynanabilir; g) iletilere katılıp katılmadığını ifade etme doğru cevabı olmayan kişisel görüş. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.2.3 | Okuduklarını çözümleyebilme | 206 | kısmi | `story`, `drag_match` | b) konuyu bulma ve c) iletilerin benzerlik ve farklılıklarını belirleme story ile, ç) içerik ile tablo ve grafik arasındaki ilişkiyi belirleme drag_match ile oynanabilir; a) karakter, olay ve bilgileri açıklama serbest sözlü üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.Y.2.1 | Yazılı anlatım becerilerini yönetebilme | 207 | yok |  | Bileşenler (a–d) hazırlık yaparak ve yazı türüne göre yazma, yazışmayı selamlaşma ve uygun ifadelerle başlatıp sonlandırma, yazma planı hazırlama; hepsi serbest yazılı üretim. |
| T.Y.2.2 | Yazılarında içerik oluşturabilme | 207 | yok |  | Bütün bileşenler (a–m) çocuğun kendi yazısını üretmesini ister: eksik cümle ve metin yazma, tahminini yazma, yazılarında karşılaştırma, sınıflandırma ve sözcük kullanma, olayları kendi ifadeleriyle yazma, yönerge, görüş, istek ve öneri yazma, yazıyı sunma, görsel, benzetme ve örnek kullanma, neden-sonuç yazma; serbest yazılı üretim. Eksik bir cümleyi ya da metni yazmak bütün bir cümle üretimidir; T.Y.1.2 b’deki harf, hece ya da sözcük tamamlama ise kapalı karo kümesiyle yapılır. |
| T.Y.2.3 | Yazma kurallarını uygulayabilme | 207 | kısmi | `drag_match` | d) soru edatını ayrı yazma (mı/mi karosunu cümlede doğru yere yerleştirme), e) kısaltmaları kuralına uygun yazma (doğru yazılmış kısaltmayı açılımıyla eşleme) ve f) büyük harfleri kuralına uygun yazma drag_match ile oynanabilir; a) plana uygun yazma, b) kaynaktan araştırarak yazma, c) sözcükleri yerinde kullanma, ç) mesajı açık ifade etme, g) yazım alanını kullanma ve ğ) noktalama işaretlerini kullanma çocuğun kendi yazısında gerçekleşir, serbest yazılı üretim. |

#### 7. TEMA: KÜLTÜR HAZİNEMİZ

`g2.turkce.t07` · işleniş sırası 7 · programda 13 çıktı · PDF s. 103

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.2.1 | Dinlemeyi/izlemeyi yönetebilme | 205 | kısmi | `scenario` | a) oyunda verilen amaca uygun dinleyeceğini seçme scenario ile oynanabilir (ilgi alanına göre tercih doğru/yanlışı olmayan kişisel seçim); b) dinleme kurallarına uygun dinleme ve c) uygun zamanda söz alma gerçek iletişimde gözlenen davranış. |
| T.D.2.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 205 | kısmi | `story`, `sort_bins` | a) yaşantı ve ön bilgiyle çıkarım, b) görsellerden konu tahmini, c–ç) olayların öncesi ve sonrası hakkında tahmin ve f) metindeki bilgileri doğruluk açısından karşılaştırma story ile; e) iletileri doğruluk ve gerçeklik açısından ayırma ve g) nesne ve karakterleri özelliklerine göre sınıflandırma sort_bins ile oynanabilir; d) kendi ilgi alanına uygun çıkarım kişiseldir, oyun doğruluğunu denetleyemez; ğ) düşüncelerini ifade etme serbest sözlü üretim. |
| T.D.2.3 | Dinlediklerini/izlediklerini çözümleyebilme | 205 | tam | `story`, `drag_match` | a) olayları belirleme, b) konuyu bulma ve c) iletilerin benzerlik ve farklılıklarını belirleme story anlama soruları, ç) söylem–görsel ilişkisi drag_match ile çalışılır. |
| T.K.2.1 | Konuşmalarını yönetebilme | 205 | kısmi | `scenario` | a) konunun özelliğine uygun konuşma üslubunu verilen durumlarda seçme scenario ile oynanabilir; b–c) konuşmasını tür ve amaca göre belirleme, ç) göz teması, d) uygun zamanda söz alma, e) selamlaşma ve hitap ifadeleri kullanma ve f) konuşma planı hazırlama çocuğun kendi konuşmasını ve sözlü üretimi gerektirir. |
| T.K.2.2 | Konuşmalarında içerik oluşturabilme | 205 | kısmi | `sequence` | b) görsellerden olayların oluş sırası hakkında tahmin sequence ile oynanabilir; a) ve c–h) ifade etme, açıklama, sınıflandırarak anlatma, zıt anlamlı sözcük ve benzetme kullanma, olayları kendi ifadeleriyle anlatma, görüş bildirme, neden-sonuç söyleme ve görsel kullanma sözlü üretim. |
| T.K.2.3 | Konuşma kurallarını uygulayabilme | 206 | yok |  | Bileşenler (a–h) konuşma hızı, plana uygun konuşma, vurgu ve tonlama, sözcük ve cümle kullanımı, bağlama ögeleri, jest, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez. |
| T.O.2.1 | Okuma sürecini yönetebilme | 206 | kısmi | `story` | a) okuyacağı metnin başlık ve görsellerini inceleme story ile oynanabilir; b) ilgi alanına göre metin seçme doğru/yanlışı olmayan kişisel tercih (oyun seçim sunabilir ama değerlendiremez); c) sesli okuma ve ç) noktalamaya dikkat ederek okuma sesli okuma gerektirir. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.2.2 | Okudukları ile ilgili anlam oluşturabilme | 206 | kısmi | `story`, `sort_bins`, `drag_match` | a) bilgiler ile ön bilgi arasında bağlantı kurma, b–c) başlık ve görsellerden konu ve olay tahmini, ç) verilerden çıkarım story ile; d) iletileri ön bilgiyle karşılaştırma (doğru, yanlış) ve e) nesne ve kişileri sınıflandırma sort_bins ile; f) zıt anlamlı sözcükleri bulma drag_match ile oynanabilir; g) iletilere katılıp katılmadığını ifade etme doğru cevabı olmayan kişisel görüş. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.2.3 | Okuduklarını çözümleyebilme | 206 | kısmi | `story`, `drag_match` | b) konuyu bulma ve c) iletilerin benzerlik ve farklılıklarını belirleme story ile, ç) içerik ile tablo ve grafik arasındaki ilişkiyi belirleme drag_match ile oynanabilir; a) karakter, olay ve bilgileri açıklama serbest sözlü üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.2.5 | Okuma sürecini değerlendirebilme | 207 | yok |  | Bileşenler (a–c) kendi okuma sürecindeki hataları belirleme, düzeltme ve olumlu davranışları sonraki okumalarına aktarma; öz değerlendirme ve sesli okuma gerektirir. |
| T.Y.2.1 | Yazılı anlatım becerilerini yönetebilme | 207 | yok |  | Bileşenler (a–d) hazırlık yaparak ve yazı türüne göre yazma, yazışmayı selamlaşma ve uygun ifadelerle başlatıp sonlandırma, yazma planı hazırlama; hepsi serbest yazılı üretim. |
| T.Y.2.2 | Yazılarında içerik oluşturabilme | 207 | yok |  | Bütün bileşenler (a–m) çocuğun kendi yazısını üretmesini ister: eksik cümle ve metin yazma, tahminini yazma, yazılarında karşılaştırma, sınıflandırma ve sözcük kullanma, olayları kendi ifadeleriyle yazma, yönerge, görüş, istek ve öneri yazma, yazıyı sunma, görsel, benzetme ve örnek kullanma, neden-sonuç yazma; serbest yazılı üretim. Eksik bir cümleyi ya da metni yazmak bütün bir cümle üretimidir; T.Y.1.2 b’deki harf, hece ya da sözcük tamamlama ise kapalı karo kümesiyle yapılır. |
| T.Y.2.3 | Yazma kurallarını uygulayabilme | 207 | kısmi | `drag_match` | d) soru edatını ayrı yazma (mı/mi karosunu cümlede doğru yere yerleştirme), e) kısaltmaları kuralına uygun yazma (doğru yazılmış kısaltmayı açılımıyla eşleme) ve f) büyük harfleri kuralına uygun yazma drag_match ile oynanabilir; a) plana uygun yazma, b) kaynaktan araştırarak yazma, c) sözcükleri yerinde kullanma, ç) mesajı açık ifade etme, g) yazım alanını kullanma ve ğ) noktalama işaretlerini kullanma çocuğun kendi yazısında gerçekleşir, serbest yazılı üretim. |

#### 8. TEMA: HAKLARIMIZI BİLİYORUZ

`g2.turkce.t08` · işleniş sırası 8 · programda 16 çıktı · PDF s. 108

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.2.1 | Dinlemeyi/izlemeyi yönetebilme | 205 | kısmi | `scenario` | a) oyunda verilen amaca uygun dinleyeceğini seçme scenario ile oynanabilir (ilgi alanına göre tercih doğru/yanlışı olmayan kişisel seçim); b) dinleme kurallarına uygun dinleme ve c) uygun zamanda söz alma gerçek iletişimde gözlenen davranış. |
| T.D.2.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 205 | kısmi | `story`, `sort_bins` | a) yaşantı ve ön bilgiyle çıkarım, b) görsellerden konu tahmini, c–ç) olayların öncesi ve sonrası hakkında tahmin ve f) metindeki bilgileri doğruluk açısından karşılaştırma story ile; e) iletileri doğruluk ve gerçeklik açısından ayırma ve g) nesne ve karakterleri özelliklerine göre sınıflandırma sort_bins ile oynanabilir; d) kendi ilgi alanına uygun çıkarım kişiseldir, oyun doğruluğunu denetleyemez; ğ) düşüncelerini ifade etme serbest sözlü üretim. |
| T.D.2.3 | Dinlediklerini/izlediklerini çözümleyebilme | 205 | tam | `story`, `drag_match` | a) olayları belirleme, b) konuyu bulma ve c) iletilerin benzerlik ve farklılıklarını belirleme story anlama soruları, ç) söylem–görsel ilişkisi drag_match ile çalışılır. |
| T.D.2.5 | Dinleme/izleme sürecini değerlendirebilme | 205 | yok |  | Bileşenler (a–c) kendi dinleme sürecindeki hataları belirleme, düzeltme ve uygun davranışları aktarma; öz değerlendirme oyunda denetlenemez. |
| T.K.2.1 | Konuşmalarını yönetebilme | 205 | kısmi | `scenario` | a) konunun özelliğine uygun konuşma üslubunu verilen durumlarda seçme scenario ile oynanabilir; b–c) konuşmasını tür ve amaca göre belirleme, ç) göz teması, d) uygun zamanda söz alma, e) selamlaşma ve hitap ifadeleri kullanma ve f) konuşma planı hazırlama çocuğun kendi konuşmasını ve sözlü üretimi gerektirir. |
| T.K.2.2 | Konuşmalarında içerik oluşturabilme | 205 | kısmi | `sequence` | b) görsellerden olayların oluş sırası hakkında tahmin sequence ile oynanabilir; a) ve c–h) ifade etme, açıklama, sınıflandırarak anlatma, zıt anlamlı sözcük ve benzetme kullanma, olayları kendi ifadeleriyle anlatma, görüş bildirme, neden-sonuç söyleme ve görsel kullanma sözlü üretim. |
| T.K.2.3 | Konuşma kurallarını uygulayabilme | 206 | yok |  | Bileşenler (a–h) konuşma hızı, plana uygun konuşma, vurgu ve tonlama, sözcük ve cümle kullanımı, bağlama ögeleri, jest, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez. |
| T.K.2.5 | Konuşma sürecini değerlendirebilme | 206 | yok |  | Bileşenler (a–c) kendi konuşmasındaki hataları düzeltme ve olumlu davranışları fark edip sonraki konuşmalarına aktarma; kendi konuşması üzerinde öz değerlendirme. |
| T.O.2.1 | Okuma sürecini yönetebilme | 206 | kısmi | `story` | a) okuyacağı metnin başlık ve görsellerini inceleme story ile oynanabilir; b) ilgi alanına göre metin seçme doğru/yanlışı olmayan kişisel tercih (oyun seçim sunabilir ama değerlendiremez); c) sesli okuma ve ç) noktalamaya dikkat ederek okuma sesli okuma gerektirir. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.2.2 | Okudukları ile ilgili anlam oluşturabilme | 206 | kısmi | `story`, `sort_bins`, `drag_match` | a) bilgiler ile ön bilgi arasında bağlantı kurma, b–c) başlık ve görsellerden konu ve olay tahmini, ç) verilerden çıkarım story ile; d) iletileri ön bilgiyle karşılaştırma (doğru, yanlış) ve e) nesne ve kişileri sınıflandırma sort_bins ile; f) zıt anlamlı sözcükleri bulma drag_match ile oynanabilir; g) iletilere katılıp katılmadığını ifade etme doğru cevabı olmayan kişisel görüş. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.2.3 | Okuduklarını çözümleyebilme | 206 | kısmi | `story`, `drag_match` | b) konuyu bulma ve c) iletilerin benzerlik ve farklılıklarını belirleme story ile, ç) içerik ile tablo ve grafik arasındaki ilişkiyi belirleme drag_match ile oynanabilir; a) karakter, olay ve bilgileri açıklama serbest sözlü üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.2.4 | Okuma sürecine etki eden durumları gözden geçirebilme | 207 | yok |  | a) okuduğu ortamın okumasına etkisini açıklama serbest sözlü üretim; b) ortamın fiziksel özelliklerini dikkate alarak okuma çocuğun gerçek okuma ortamındaki davranışı. |
| T.O.2.5 | Okuma sürecini değerlendirebilme | 207 | yok |  | Bileşenler (a–c) kendi okuma sürecindeki hataları belirleme, düzeltme ve olumlu davranışları sonraki okumalarına aktarma; öz değerlendirme ve sesli okuma gerektirir. |
| T.Y.2.1 | Yazılı anlatım becerilerini yönetebilme | 207 | yok |  | Bileşenler (a–d) hazırlık yaparak ve yazı türüne göre yazma, yazışmayı selamlaşma ve uygun ifadelerle başlatıp sonlandırma, yazma planı hazırlama; hepsi serbest yazılı üretim. |
| T.Y.2.2 | Yazılarında içerik oluşturabilme | 207 | yok |  | Bütün bileşenler (a–m) çocuğun kendi yazısını üretmesini ister: eksik cümle ve metin yazma, tahminini yazma, yazılarında karşılaştırma, sınıflandırma ve sözcük kullanma, olayları kendi ifadeleriyle yazma, yönerge, görüş, istek ve öneri yazma, yazıyı sunma, görsel, benzetme ve örnek kullanma, neden-sonuç yazma; serbest yazılı üretim. Eksik bir cümleyi ya da metni yazmak bütün bir cümle üretimidir; T.Y.1.2 b’deki harf, hece ya da sözcük tamamlama ise kapalı karo kümesiyle yapılır. |
| T.Y.2.3 | Yazma kurallarını uygulayabilme | 207 | kısmi | `drag_match` | d) soru edatını ayrı yazma (mı/mi karosunu cümlede doğru yere yerleştirme), e) kısaltmaları kuralına uygun yazma (doğru yazılmış kısaltmayı açılımıyla eşleme) ve f) büyük harfleri kuralına uygun yazma drag_match ile oynanabilir; a) plana uygun yazma, b) kaynaktan araştırarak yazma, c) sözcükleri yerinde kullanma, ç) mesajı açık ifade etme, g) yazım alanını kullanma ve ğ) noktalama işaretlerini kullanma çocuğun kendi yazısında gerçekleşir, serbest yazılı üretim. |

### Hayat Bilgisi

#### 1. BEN VE OKULUM

`g2.hayat_bilgisi.t01` · işleniş sırası 1 · programda 4 çıktı · PDF s. 37

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| HB.2.1.1 | Planlı olmanın kişisel yaşama etkilerini fark edebilme | 37 | tam | `sort_bins`, `sequence`, `scenario` | Süreç bileşeni yok. Günlük işleri yapıldıkları zamana göre gruplandırma sort_bins, günlük rutini sıralama sequence, planlı ve plansız günün sonuçlarını karşılaştırıp planlı olmanın etkisini fark etme scenario ile çalışılır. |
| HB.2.1.2 | Öğretmen ve arkadaşlarıyla etkili iletişim kurabilme | 37 | kısmi | `scenario` | Süreç bileşeni yok. İletişim kurallarına (sözü kesmeme, göz teması, ses tonu) uygun davranışı verilen durumlarda seçme scenario ile oynanabilir; öğretmen ve arkadaşlarla gerçek iletişim kurma sınıfta gözlenir. |
| HB.2.1.3 | Arkadaşlık ilişkilerini düzenleyebilme | 37 | kısmi | `sort_bins`, `scenario` | Süreç bileşeni yok. Arkadaşlık ilişkilerini olumlu ve olumsuz etkileyen davranışları ayırma sort_bins, örnek olayda ilişkiyi düzeltecek davranışı seçme scenario ile oynanabilir; gerçek arkadaşlık ilişkilerini düzenleme ve duyguları paylaşma yaşamda gerçekleşir. |
| HB.2.1.4 | Sınıf içi karar alma süreçlerinde sosyal temas oluşturabilme | 37 | yok |  | Bileşenler (a–ç) sınıf içi karar alma sürecinde grup iletişimini başlatma, katılma, katkıda bulunma ve değerlendirme; sınıfta grup etkinliği. |

#### 2. SAĞLIĞIM VE GÜVENLİĞİM

`g2.hayat_bilgisi.t02` · işleniş sırası 2 · programda 4 çıktı · PDF s. 41

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| HB.2.2.1 | Sağlıklı büyüme ve gelişme ile alışkanlıkları arasındaki ilişkiyi çözümleyebilme | 41 | tam | `sort_bins`, `drag_match` | a) sağlıklı büyüme ve gelişmeye yönelik alışkanlıkları belirleme sort_bins ile, b) alışkanlık ile büyüme ve gelişme arasındaki ilişkiyi belirleme drag_match ile çalışılır. |
| HB.2.2.2 | Çevrim içi ortamlarda kişisel güvenliğini sağlayabilme | 41 | kısmi | `sort_bins`, `scenario` | Süreç bileşeni yok. Kişisel bilgilerden paylaşılmaması gerekenleri ayırma sort_bins, çevrim içi örnek olayda güvenli davranışı (tanımadığıyla iletişim kurmama, aile büyüğüne haber verme) seçme scenario ile oynanabilir; gerçek çevrim içi ortamda güvenliğini sağlama yaşamda gerçekleşir (uygulama çevrim içi değildir). |
| HB.2.2.3 | Temel trafik işaret levhalarını tanıyabilme | 41 | tam | `drag_match`, `listen_find` | Süreç bileşeni yok. Işıklı işaret cihazı, yaya geçidi, okul geçidi, bisiklet yolu gibi levhaları anlamlarıyla eşleme drag_match, adı söylenen levhayı bulma listen_find ile çalışılır. |
| HB.2.2.4 | Acil bir durumda yetkililerle etkili iletişim kurabilme | 41 | kısmi | `sort_bins`, `scenario` | Süreç bileşeni yok. 112’ye verilecek bilgileri (durumun türü, yeri, zamanı, etkilenen kişi sayısı) gereksiz bilgilerden ayırma sort_bins, arama sırasında doğru davranışı (sakin kalma, sözü kesmeme, gereksiz aramama) seçme scenario ile oynanabilir; yetkiliyle gerçek sözlü iletişim canlandırmayla çalışılır. |

#### 3. AİLEM VE TOPLUM

`g2.hayat_bilgisi.t03` · işleniş sırası 3 · programda 3 çıktı · PDF s. 45

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| HB.2.3.1 | Ailenin önemini yorumlayabilme | 45 | kısmi | `story` | a) ailenin önemine ilişkin verilen örnekleri inceleme story ile oynanabilir; b) örnekleri özgün örneklere dönüştürme ve c) kendi cümleleriyle ifade etme serbest üretim. |
| HB.2.3.2 | Toplumsal yaşamda nezaket ve görgü kurallarına uygun davranabilme | 45 | kısmi | `scenario` | Süreç bileşeni yok. Toplumsal yaşamdaki nezaket ve görgü kurallarına (sıra bekleme, toplu taşımada yer verme, kütüphanede sessizlik) uygun davranışı verilen durumlarda seçme scenario ile oynanabilir; kurallara gerçek ortamda uyma yaşamda gözlenir. |
| HB.2.3.3 | Yakın çevresinde üzerine düşen görev ve sorumlulukları günlük yaşamına yansıtabilme | 45 | kısmi | `scenario` | b) yakın çevresindeki görev ve sorumluluklara ilişkin çıkarımı sesli seçenekler arasından seçme scenario ile oynanabilir; a) kendi görev ve sorumluluklarını gözden geçirme ve c) bunlara ilişkin değerlendirme yapma öz değerlendirme. |

#### 4. YAŞADIĞIM YER VE ÜLKEM

`g2.hayat_bilgisi.t04` · işleniş sırası 4 · programda 5 çıktı · PDF s. 49

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| HB.2.4.1 | Yakın çevresinde bulunan tarihî mekân ve doğal güzellikleri belirleyebilme | 49 | yok |  | Süreç bileşeni yok. Çıktının konusu çocuğun kendi yakın çevresindeki tarihî mekân ve doğal güzellikler (programda ziyaret ve gezi); cihaz yaşadığı yeri bilmez. Tarihî mekân ve doğal güzellikleri genel görsellerle ayırma içerik olarak pekiştirilebilir ama çıktıyı karşılamaz. |
| HB.2.4.2 | Yaşadığı yerin yönetim birimleri ile ilgili kaynaklardan bilgi toplayabilme | 49 | kısmi | `scenario` | a) yönetim birimleri hakkında bilgi toplanacak uygun kaynakları belirleme scenario ile oynanabilir; b) kaynaklardan bilgi bulma ve ç) kaydetme gerçek araştırma, c) kaynakların uygunluğunu açıklama serbest üretim. |
| HB.2.4.3 | Mustafa Kemal Atatürk’ün öğrencilik hayatını ifade edebilme | 49 | tam | `story`, `sequence` | Süreç bileşeni yok. Atatürk’ün okuduğu okullar, öğrencilik yıllarındaki başarı ve tutumları hikâye ve anlama soruları story, okulları sıralama sequence ile çalışılır. |
| HB.2.4.4 | Millî gün ve bayramların önemini yorumlayabilme | 49 | kısmi | `story` | a) millî gün ve bayramların önemine ilişkin verilen örnekleri inceleme story ile oynanabilir; b) örnekleri özgün örneklere dönüştürme ve c) kendi cümleleriyle ifade etme serbest üretim. |
| HB.2.4.5 | Dinî gün ve bayramların önemini yorumlayabilme | 49 | kısmi | `story` | a) dinî gün ve bayramların önemine ilişkin verilen örnekleri inceleme story ile oynanabilir; b) örnekleri özgün örneklere dönüştürme ve c) kendi cümleleriyle ifade etme serbest üretim. |

#### 5. DOĞA VE ÇEVRE

`g2.hayat_bilgisi.t05` · işleniş sırası 5 · programda 4 çıktı · PDF s. 53

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| HB.2.5.1 | Hava olayları ve mevsimler arasındaki ilişkiyi çözümleyebilme | 53 | tam | `sort_bins`, `drag_match` | a) hava olaylarının ve mevsimlerin özelliklerini belirleme sort_bins ile, b) hava olayları ile mevsimler arasındaki ilişkiyi belirleme drag_match ile çalışılır. |
| HB.2.5.2 | Doğadan yararlanarak yönünü belirleyebilme | 53 | kısmi | `drag_match`, `listen_find` | Süreç bileşeni yok. Güneş’in konumu, gölge, yosun, karınca yuvası ve Kutup Yıldızı ipuçlarını ana yönlerle eşleme drag_match, sahnede istenen yönü bulma listen_find ile oynanabilir; gerçek ortamda doğadan yararlanarak kendi yönünü belirleme dış etkinlik. |
| HB.2.5.3 | Afetlere karşı alınması gereken önlemlere ilişkin bilgi toplayabilme | 53 | kısmi | `scenario`, `sort_bins` | a) önlemlere ilişkin bilgi toplamak için uygun araçları belirleme scenario ile, c) oyunda verilen bilgilerin doğruluğunu sınama sort_bins ile oynanabilir; b) araçlarla bilgi bulma ve ç) kaydetme gerçek araştırma. |
| HB.2.5.4 | Doğal kaynakları tasarruflu kullanma davranışlarını günlük yaşamına yansıtabilme | 53 | kısmi | `scenario` | b) doğal kaynakları tasarruflu kullanmaya yönelik çıkarımı verilen durumlarda seçme scenario ile oynanabilir; a) kendi davranışlarını gözden geçirme ve c) ulaştığı çıkarımları değerlendirme öz değerlendirme. |

#### 6. BİLİM, TEKNOLOJİ VE SANAT

`g2.hayat_bilgisi.t06` · işleniş sırası 6 · programda 3 çıktı · PDF s. 57

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| HB.2.6.1 | Bilim insanlarının bilime katkılarına yönelik kaynaklardan bilgi toplayabilme | 57 | kısmi | `scenario` | a) bilim insanlarının katkılarına ilişkin bilgi toplanacak uygun kaynakları belirleme scenario ile oynanabilir; b) kaynaklardan bilgi bulma ve ç) kaydetme gerçek araştırma, c) kaynakların uygunluğunu açıklama serbest üretim. |
| HB.2.6.2 | Teknolojik bir ürünün değişim ve sürekliliğine dair kanıta dayalı öngörüde bulunabilme | 57 | tam | `sequence`, `scenario` | a) teknolojik bir ürünün zaman içindeki değişimini görsel kanıtlarla sıralama sequence ile, b) gelecekteki değişimine ilişkin çıkarımı sesli seçenekler arasından seçme scenario ile çalışılır. |
| HB.2.6.3 | Sanatın günlük yaşamdaki yerini belirleyebilme | 57 | kısmi | `sort_bins`, `listen_find` | Süreç bileşeni yok. Sanat dallarını (müzik, resim, ebru, tiyatro) ayırma sort_bins, günlük yaşam sahnesinde sanat ögesini bulma listen_find ile oynanabilir; sanat unsurlarını listeleme, örnek verme, duygu ve düşünceleri ifade etme ve ürün oluşturma serbest üretim. |

## 3. sınıf

### Matematik

#### MAT.3.1. Sayılar ve Nicelikler (1)

`g3.matematik.t01` · işleniş sırası 1 · programda 8 çıktı · PDF s. 85

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| MAT.3.1.1 | Niceliklerin büyüklüklerine karşılık gelen 1000’e kadar olan sayıların temsillerinden yararlanabilme | 85 | tam | `count_choose`, `drag_match`, `listen_find` | c) sayı yazma 2–3. sınıfta iz sürme yerine rakam karosu girişiyle (listen_find yazma modu, answer: digits) çalışılır. |
| MAT.3.1.2 | 1000’e kadar olan sayıları çözümleyebilme | 85 | tam | `drag_match`, `sort_bins`, `count_choose` |  |
| MAT.3.1.3 | Sayıları sıralayabilme | 85 | tam | `sequence`, `balance`, `sort_bins`, `drag_match` |  |
| MAT.3.1.4 | Sayıları ileriye ve geriye doğru ritmik sayabilme | 85 | tam | `pattern`, `sequence`, `listen_find`, `drag_match`, `balance` | c) genelleme sesli okunan kural seçenekleri arasından seçilir. |
| MAT.3.1.5 | Sayıları tek-çift olarak sınıflandırabilme | 85 | tam | `sort_bins`, `listen_find`, `pattern` |  |
| MAT.3.1.6 | Tek ve çift sayıların toplamlarının tek ya da çift olma durumu arasındaki ilişkiye yönelik tümevarımsal akıl yürütebilme | 85 | tam | `sort_bins`, `pattern`, `listen_find` | c) genelleme sesli okunan kural seçenekleri arasından seçilir. |
| MAT.3.1.7 | Sayı ve sayı temsiline dönüşen şekil örüntülerine dayalı çıkarım yapabilme | 85 | kısmi | `pattern`, `listen_find`, `drag_match`, `sort_bins` | a) varsayımı sesli seçenekler arasından seçme, c) gösterilen örüntünün varsayımı karşılayıp karşılamadığını sınama ve d) gösterilen örüntüyü değerlendirme pattern ve listen_find ile oynanabilir; b) örüntüleri örnekler üzerinde listeleme ve ç) kuralı sözlü olarak ifade etme serbest üretim. |
| MAT.3.1.8 | Bir çokluktaki ilişkilerden yararlanarak 100’e kadar olan nesnelerin sayısını tahmin edebilme | 85 | kısmi | `count_choose` | Tek bileşen a): çokluğu gruplar hâlinde gösterip bir grubu sayarak bütünü seçme (parça-bütün ilişkisi) count_choose ile kısmen oynanabilir; tahmini sayma sonucuyla karşılaştırma count_choose tahmin modu ile yapılır, ancak mod en çok 20 nesne gösterir; 100'e kadar çokluk için sayma adımının gruplu sürümü gerekir (spec Açık sorular, Faz 3b). |

#### MAT.3.1. Sayılar ve Nicelikler (2)

`g3.matematik.t02` · işleniş sırası 2 · programda 8 çıktı · PDF s. 93

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| MAT.3.1.9 | Bütün, yarım ve çeyreğin kesirle gösterimi için modellerden yararlanabilme | 93 | tam | `fraction_pizza`, `drag_match`, `listen_find` |  |
| MAT.3.1.10 | Bir bütünü eş parçalar oluşturacak şekilde birim kesir olarak çözümleyebilme | 93 | tam | `fraction_pizza`, `drag_match` |  |
| MAT.3.1.11 | Bir kesrin payı ile paydası arasındaki ilişkiyi çözümleyebilme | 93 | tam | `fraction_pizza`, `drag_match`, `count_choose` |  |
| MAT.3.1.12 | Analog ve dijital saatlerde zamanı okuyabilme ve yazabilme | 93 | tam | `clock_money`, `drag_match` | Yazma, dijital saati kurma ve analog-dijital eşleştirmeyle çalışılır. |
| MAT.3.1.13 | Zaman ölçü birimlerini çözümleyebilme | 93 | tam | `drag_match`, `sequence` |  |
| MAT.3.1.14 | Olayların oluş sürelerini tahmin ederek yargıda bulunabilme | 93 | kısmi | `sequence`, `sort_bins` | a) olayları sürelerine göre ilişkilendirip sıralama sequence ile, b) süreye ilişkin çıkarımı (uygun birim, kısa ya da uzun) seçme sort_bins ile oynanabilir; c) çıkarımı oyunun gösterdiği gerçek süreyle (saat animasyonu) karşılaştırıp yargıda bulunma önerilen estimate_then_count gerektirir; gerçek eylemin süresini tutma ev etkinliği önerilebilir. |
| MAT.3.1.15 | Uzunluk ve kütle birimleri arasındaki ilişkileri kullanarak bu birimleri kendi içerisinde çözümleyebilme | 93 | tam | `drag_match`, `balance`, `sort_bins` |  |
| MAT.3.1.16 | Madenî ve kâğıt paraları değerlerine göre ilişkilendirerek yorumlayabilme | 93 | tam | `clock_money`, `drag_match`, `balance` |  |

#### MAT.3.2. İşlemlerden Cebirsel Düşünmeye

`g3.matematik.t03` · işleniş sırası 3 · programda 8 çıktı · PDF s. 100

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| MAT.3.2.1 | Toplama ve çıkarma işlemlerinin sonuçlarını tahminde bulunarak ve zihinden işlem yaparak muhakeme edebilme | 100 | tam | `balloon_pop`, `drag_match`, `count_choose`, `balance` | a–b) işlem ögelerini ve aralarındaki ilişkileri belirleme oynanabilir; c–ç) sonucu tahmin edip zihinden işlem sonucuyla karşılaştırma ve tutarlılığı (yakın/uzak) seçme balance tahmin modu (eksik değerli terazi) ile oynanabilir. |
| MAT.3.2.2 | Toplama ve çıkarma işlemlerini çözümleyebilme | 100 | tam | `sequence`, `drag_match`, `balloon_pop` |  |
| MAT.3.2.3 | Çarpma ve bölme işlemlerinin sonuçlarını tahminde bulunarak ve zihinden işlem yaparak muhakeme edebilme | 100 | kısmi | `drag_match`, `count_choose`, `balloon_pop` | a–b) çarpma ve bölmenin bileşenlerini ve ilişkilerini belirleme oynanabilir; c) tahmin ve zihinden işlem sonucunu karşılaştırma önerilen estimate_then_count gerektirir; ç) sonuçları kendi cümleleriyle açıklama sözlü etkinlik. |
| MAT.3.2.4 | Çarpma ve bölme işlemlerini çözümleyebilme | 100 | tam | `sequence`, `drag_match`, `balloon_pop` |  |
| MAT.3.2.5 | Dört işlem gerektiren durumlar için verilen yönergeleri takip ederek yorumlayabilme | 100 | tam | `story`, `drag_match`, `sequence` |  |
| MAT.3.2.6 | Dört işlem gerektiren günlük yaşam problemlerini çözebilme | 100 | kısmi | `story`, `drag_match`, `count_choose`, `balloon_pop`, `sort_bins` | a–c) verilen ve istenenleri belirleme, işlemi seçme, temsile dönüştürme ve e) çözümü uygulama story, drag_match, count_choose ve balloon_pop ile; ğ) çözüm stratejisinin uygulanabileceği problemleri verilen problemler arasından seçme drag_match ile; h) genellemeyi verilen örneklerle sınama sort_bins ile oynanabilir; ç) kendi ifadeleriyle açıklama ve d) strateji geliştirme serbest üretim, f–g) kendi kullandığı stratejiyi kontrol edip değiştirme ve gözden geçirme öz değerlendirme (oyun çocuğun stratejisini göremez). |
| MAT.3.2.7 | Dört işlem gerektiren problem durumlarını yapılandırabilme | 100 | kısmi | `drag_match`, `sequence`, `story` | a) problem durumundaki ilişkileri kurma (durumu soruyla eşleştirme, olayları sıralama) oynanabilir; b) özgün problem oluşturma sözlü ya da yazılı etkinlik. |
| MAT.3.2.8 | Dört işlem bağlamında eşitliğin farklı anlamlarını yorumlayabilme | 101 | tam | `balance`, `drag_match`, `listen_find` | c) eşitliğin anlamları (işlemin sonucu; iki tarafın eşit değeri) terazi modelli sesli seçenekler arasından seçilerek ifade edilir. |

#### MAT.3.3. Nesnelerin Geometrisi (1)

`g3.matematik.t04` · işleniş sırası 4 · programda 5 çıktı · PDF s. 108

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| MAT.3.3.1 | Geometrik cisimlerin özelliklerini yorumlayabilme | 108 | kısmi | `count_choose`, `drag_match`, `listen_find`, `story` | a–b) cisimlerin köşe, yüz ve ayrıt sayılarını inceleme ve belirleme oynanabilir; c) terimleri kendi ifadeleriyle açıklama sözlü etkinlik. |
| MAT.3.3.2 | Kenar sayılarına göre geometrik şekilleri sınıflandırabilme | 108 | tam | `sort_bins`, `count_choose`, `listen_find`, `drag_match`, `story` |  |
| MAT.3.3.3 | Matematiksel araç ve teknolojileri kullanarak çeşitli geometrik şekilleri ve cisimleri çizebilme | 108 | kısmi | `listen_find`, `drag_match`, `grid`, `sort_bins` | a–b) çizim araçlarını tanıma ve uygun aracı seçme oynanabilir; c) aracı kullanarak çizme grid (paint: copy, code) ile ekranda yapılabilir; cetvelle kâğıda çizme sınıf ya da ev etkinliği. |
| MAT.3.3.4 | Standart olmayan ve standart ölçme araçları ile geometrik şekillerin çevre uzunluğunu tahmin edebilme | 108 | kısmi | `count_choose`, `story`, `balloon_pop` | b) kareli zemindeki şeklin ya da karışla ölçülen nesnenin çevresini seçenekli tahmin etme story ve count_choose ile oynanabilir; c) tahmini birim kenarları sayarak ölçümle karşılaştırma önerilen estimate_then_count gerektirir; a) gerçek ölçme araçlarıyla deneyim ev etkinliği. |
| MAT.3.3.5 | Standart sıvı ölçü birimleri cinsinden sıvı miktarını tahmin edebilme | 108 | kısmi | `count_choose`, `drag_match`, `sort_bins`, `story`, `sequence` | b) sıvı miktarını standart birimle seçenekli tahmin etme oynanabilir; c) tahmini ekranda ölçü kabıyla doldurma sonucuyla karşılaştırma önerilen estimate_then_count gerektirir; a) gerçek kaplarla sıvı ölçme deneyimi ev etkinliği. |

#### MAT.3.3. Nesnelerin Geometrisi (2)

`g3.matematik.t05` · işleniş sırası 5 · programda 3 çıktı · PDF s. 114

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| MAT.3.3.6 | Birden fazla simetri doğrusu olan şekilleri çözümleyebilme | 114 | tam | `listen_find`, `count_choose`, `drag_match`, `story` |  |
| MAT.3.3.7 | Bir parçası verilen simetrik şekli simetri doğrusuna göre yapılandırabilme | 114 | tam | `listen_find`, `drag_match`, `grid` | a) bir parçası verilen şekli inceleyip doğru tamamlanmış şekli ya da ayna parçasını seçme oynanabilir; b) şekli kareli zeminde kendisi tamamlama grid (paint/symmetry) ile oynanabilir. |
| MAT.3.3.8 | Yönerge ile yapılandırılan ve bir parçası verilen bir şekli tamamlayarak simetrisini oluşturmaya ilişkin kodlama stratejilerini kullanarak yargıda bulunabilme | 114 | tam | `drag_match`, `listen_find`, `grid`, `story` | a) yönergeleri ok kodlarıyla eşleştirerek yeniden ifade etme ve c) oluşan simetri hakkında yargı seçme oynanabilir; b) kodlanmış yönergeyi izleyerek şekli kareli zeminde tamamlama grid (paint: code, symmetry) ile oynanabilir. |

#### MAT.3.4. Veriye Dayalı Araştırma

`g3.matematik.t06` · işleniş sırası 6 · programda 1 çıktı · PDF s. 118

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| MAT.3.4.1 | Kategorik ve sayma ile elde edilen nicel veriye dayalı tek veri grubu ile çalışabilme ve veriye dayalı karar verebilme | 118 | kısmi | `listen_find`, `count_choose`, `sort_bins`, `chart_build`, `story` | d) görselleştirme aracını seçme, f) hazır nokta grafiğini yorumlama ve g) sonuçları oyunda verilen araştırma sorusuna göre değerlendirme oynanabilir; e) verilen veriyle çetele, tablo ve grafik oluşturma chart_build ile oynanabilir; a–c) araştırma durumunu ve sorularını belirleme ve plan yapma çocuğun kendi araştırması, ç) veri toplama gerçek dünya etkinliği (sınıf ya da ev). |

### Türkçe

#### 1. TEMA: DEĞERLERİMİZLE YAŞIYORUZ

`g3.turkce.t01` · işleniş sırası 1 · programda 11 çıktı · PDF s. 113

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.3.1 | Dinlemeyi/izlemeyi yönetebilme | 209 | kısmi | `scenario` | a) oyunda verilen amaca uygun dinleyeceğini seçme ve b) konuya ve amaca uygun dinleme stratejisini seçme scenario ile oynanabilir (ilgi alanına göre tercih kişisel seçim); c) dinleme kurallarına uygun dinleme ve ç) düşüncelerini belirtmek için söz alma gerçek iletişimde gözlenen davranış. |
| T.D.3.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 209 | kısmi | `story`, `sort_bins` | a) konu tahmini, b–c) olayların öncesi ve sonrası hakkında tahmin, ç) bilgiler ile ön bilgi arasında bağlantı kurma, d) oyunda verilen amaca uygun çıkarım ve f) metindeki bilgileri karşılaştırma story ile; e) iletileri doğruluk ve gerçeklik açısından ayırma ve g) durum, nesne ve karakterleri sınıflandırma sort_bins ile oynanabilir; ğ) ve ı) düşüncelerini ifade etme ile h) iletilere ilişkin öneride bulunma serbest sözlü üretim. |
| T.D.3.3 | Dinlediklerini/izlediklerini çözümleyebilme | 209 | kısmi | `story`, `sort_bins` | a) olayları belirleme, b) ana fikri ya da ana duyguyu bulma, c) konuyu bulma ve ç) iletilerin benzerlik ve farklılıklarını belirleme story ile, d) iletileri benzerlik ve farklılık yönüyle ilişkilendirme sort_bins ile oynanabilir; e) söylem ile görsel arasındaki ilişkiyi açıklama serbest sözlü üretim. |
| T.K.3.1 | Konuşmalarını yönetebilme | 209 | kısmi | `scenario` | a) konunun özelliğine uygun konuşma üslubunu verilen durumlarda seçme scenario ile oynanabilir; b–c) konuşmasını tür ve amaca göre belirleme, ç) kurallara uygun iletişimi sürdürme ve d) konuşma planı hazırlama çocuğun kendi konuşmasını ve sözlü üretimi gerektirir. |
| T.K.3.2 | Konuşmalarında içerik oluşturabilme | 209 | kısmi | `story`, `sort_bins` | b) dinlediği konuşmanın nasıl sonuçlanacağını tahmin etme story ile, ç) metinlerdeki nesne ve kişileri karşılaştırma sort_bins ile oynanabilir; a) örnek verme, c) plana uygun konuşma, d–f) konuşmalarında sınıflandırma ve zıt ya da eş anlamlı sözcük kullanma, g) kendi cümleleriyle ifade, ğ–h) görüş ve öneri, ı–k) benzetme, örneklendirme, içerik oluşturma ve sunum, l) neden-sonuç ilişkisini ve m) atasözlerinin anlamını söyleme sözlü üretim. |
| T.K.3.3 | Konuşma kurallarını uygulayabilme | 210 | yok |  | Bileşenler (a–ı) ses düzeyi, plana uygun konuşma, vurgu ve tonlama, sözcük, atasözü, zaman ifadesi ve bağlama ögesi kullanımı, açık ve kurallı cümle, jest, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez. |
| T.O.3.1 | Okuma sürecini yönetebilme | 210 | kısmi | `story`, `scenario` | a) okuyacağı metnin başlık ve görsellerini inceleme story ile; c) oyunda verilen amaca uygun metni seçme ve ç) okuma amacına uygun okuma stratejisine karar verme scenario ile oynanabilir (ilgi alanına göre tercih kişisel seçim); b) noktalama işaretlerine dikkat ederek okuma sesli okuma gerektirir. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.3.2 | Okudukları ile ilgili anlam oluşturabilme | 210 | kısmi | `story`, `sequence`, `sort_bins`, `drag_match` | a) bağlantı kurma, b–c) ve d) bilgi ve olayların öncesi ve sonrası hakkında tahmin, e) metnin amacına uygun çıkarım ve g) iletileri metindeki diğer bilgilerle karşılaştırma story ile; ç) olayların sırası hakkında tahmin sequence ile; f) iletileri ön bilgiyle karşılaştırma ve ğ) olay, nesne ve kişileri sınıflandırma sort_bins ile; h) zıt ve eş anlamlı sözcükleri bulma drag_match ile oynanabilir; ı) katılıp katılmadığını nedenleriyle ifade etme, i) öneride bulunma ve j) görüş oluşturma serbest üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.3.3 | Okuduklarını çözümleyebilme | 211 | kısmi | `story`, `sort_bins`, `drag_match` | b) konuyu ve c) ana fikri ya da ana duyguyu bulma ile ç) iletileri benzerlik ve farklılık yönüyle ilişkilendirme story ile; d) gerçek ve mecaz anlamlı sözcükleri metinle ilişkilendirme sort_bins ile; e) noktalama işaretinin içerikle ilişkisini belirleme drag_match ile oynanabilir; a) karakter, olay, bilgi ya da duyguları açıklama serbest sözlü üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.Y.3.2 | Yazılarında içerik oluşturabilme | 211 | yok |  | Bütün bileşenler (a–o) çocuğun kendi yazısını üretmesini ister: metni devam ettirme, tahmin ve çıkarım yazma, yazılarında karşılaştırma, sınıflandırma, zıt ve eş anlamlı sözcük, benzetme ve örnek kullanma, kendi ifadeleriyle yazma, yönerge, öneri, istek ve şikâyet yazma, bilginin kaynağını yazma, yazılarını sunma ve neden-sonuç yazma; serbest yazılı üretim. |
| T.Y.3.3 | Yazma kurallarını uygulayabilme | 212 | kısmi | `drag_match`, `syllable_build` | d) kısaltmalara gelen ekleri kuralına uygun yazma (kesme işareti ve eki doğru karoyla ekleme) ve f) büyük harfleri kuralına uygun yazma drag_match ile, e) pekiştirmeli sözcükleri doğru yazma syllable_build ile oynanabilir; a) plana uygun yazma, b) sözcükleri yerinde kullanma, c) deyim ve atasözü kullanma, ç) mesajı açık ifade etme ve g) noktalama işaretlerini kullanma çocuğun kendi yazısında gerçekleşir, serbest yazılı üretim. |

#### 2. TEMA: ATATÜRK VE KAHRAMANLARIMIZ

`g3.turkce.t02` · işleniş sırası 2 · programda 12 çıktı · PDF s. 118

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.3.1 | Dinlemeyi/izlemeyi yönetebilme | 209 | kısmi | `scenario` | a) oyunda verilen amaca uygun dinleyeceğini seçme ve b) konuya ve amaca uygun dinleme stratejisini seçme scenario ile oynanabilir (ilgi alanına göre tercih kişisel seçim); c) dinleme kurallarına uygun dinleme ve ç) düşüncelerini belirtmek için söz alma gerçek iletişimde gözlenen davranış. |
| T.D.3.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 209 | kısmi | `story`, `sort_bins` | a) konu tahmini, b–c) olayların öncesi ve sonrası hakkında tahmin, ç) bilgiler ile ön bilgi arasında bağlantı kurma, d) oyunda verilen amaca uygun çıkarım ve f) metindeki bilgileri karşılaştırma story ile; e) iletileri doğruluk ve gerçeklik açısından ayırma ve g) durum, nesne ve karakterleri sınıflandırma sort_bins ile oynanabilir; ğ) ve ı) düşüncelerini ifade etme ile h) iletilere ilişkin öneride bulunma serbest sözlü üretim. |
| T.D.3.3 | Dinlediklerini/izlediklerini çözümleyebilme | 209 | kısmi | `story`, `sort_bins` | a) olayları belirleme, b) ana fikri ya da ana duyguyu bulma, c) konuyu bulma ve ç) iletilerin benzerlik ve farklılıklarını belirleme story ile, d) iletileri benzerlik ve farklılık yönüyle ilişkilendirme sort_bins ile oynanabilir; e) söylem ile görsel arasındaki ilişkiyi açıklama serbest sözlü üretim. |
| T.K.3.1 | Konuşmalarını yönetebilme | 209 | kısmi | `scenario` | a) konunun özelliğine uygun konuşma üslubunu verilen durumlarda seçme scenario ile oynanabilir; b–c) konuşmasını tür ve amaca göre belirleme, ç) kurallara uygun iletişimi sürdürme ve d) konuşma planı hazırlama çocuğun kendi konuşmasını ve sözlü üretimi gerektirir. |
| T.K.3.2 | Konuşmalarında içerik oluşturabilme | 209 | kısmi | `story`, `sort_bins` | b) dinlediği konuşmanın nasıl sonuçlanacağını tahmin etme story ile, ç) metinlerdeki nesne ve kişileri karşılaştırma sort_bins ile oynanabilir; a) örnek verme, c) plana uygun konuşma, d–f) konuşmalarında sınıflandırma ve zıt ya da eş anlamlı sözcük kullanma, g) kendi cümleleriyle ifade, ğ–h) görüş ve öneri, ı–k) benzetme, örneklendirme, içerik oluşturma ve sunum, l) neden-sonuç ilişkisini ve m) atasözlerinin anlamını söyleme sözlü üretim. |
| T.K.3.3 | Konuşma kurallarını uygulayabilme | 210 | yok |  | Bileşenler (a–ı) ses düzeyi, plana uygun konuşma, vurgu ve tonlama, sözcük, atasözü, zaman ifadesi ve bağlama ögesi kullanımı, açık ve kurallı cümle, jest, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez. |
| T.O.3.1 | Okuma sürecini yönetebilme | 210 | kısmi | `story`, `scenario` | a) okuyacağı metnin başlık ve görsellerini inceleme story ile; c) oyunda verilen amaca uygun metni seçme ve ç) okuma amacına uygun okuma stratejisine karar verme scenario ile oynanabilir (ilgi alanına göre tercih kişisel seçim); b) noktalama işaretlerine dikkat ederek okuma sesli okuma gerektirir. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.3.2 | Okudukları ile ilgili anlam oluşturabilme | 210 | kısmi | `story`, `sequence`, `sort_bins`, `drag_match` | a) bağlantı kurma, b–c) ve d) bilgi ve olayların öncesi ve sonrası hakkında tahmin, e) metnin amacına uygun çıkarım ve g) iletileri metindeki diğer bilgilerle karşılaştırma story ile; ç) olayların sırası hakkında tahmin sequence ile; f) iletileri ön bilgiyle karşılaştırma ve ğ) olay, nesne ve kişileri sınıflandırma sort_bins ile; h) zıt ve eş anlamlı sözcükleri bulma drag_match ile oynanabilir; ı) katılıp katılmadığını nedenleriyle ifade etme, i) öneride bulunma ve j) görüş oluşturma serbest üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.3.3 | Okuduklarını çözümleyebilme | 211 | kısmi | `story`, `sort_bins`, `drag_match` | b) konuyu ve c) ana fikri ya da ana duyguyu bulma ile ç) iletileri benzerlik ve farklılık yönüyle ilişkilendirme story ile; d) gerçek ve mecaz anlamlı sözcükleri metinle ilişkilendirme sort_bins ile; e) noktalama işaretinin içerikle ilişkisini belirleme drag_match ile oynanabilir; a) karakter, olay, bilgi ya da duyguları açıklama serbest sözlü üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.Y.3.1 | Yazılı anlatım becerilerini yönetebilme | 211 | yok |  | Bileşenler (a–f) hazırlıksız ve türüne göre yazma, yazışmayı başlatma, sürdürme ve sonlandırma ifadeleri (çevrim içi dahil), imzada adını kullanma ve yazma planı hazırlama; hepsi serbest yazılı üretim. |
| T.Y.3.2 | Yazılarında içerik oluşturabilme | 211 | yok |  | Bütün bileşenler (a–o) çocuğun kendi yazısını üretmesini ister: metni devam ettirme, tahmin ve çıkarım yazma, yazılarında karşılaştırma, sınıflandırma, zıt ve eş anlamlı sözcük, benzetme ve örnek kullanma, kendi ifadeleriyle yazma, yönerge, öneri, istek ve şikâyet yazma, bilginin kaynağını yazma, yazılarını sunma ve neden-sonuç yazma; serbest yazılı üretim. |
| T.Y.3.3 | Yazma kurallarını uygulayabilme | 212 | kısmi | `drag_match`, `syllable_build` | d) kısaltmalara gelen ekleri kuralına uygun yazma (kesme işareti ve eki doğru karoyla ekleme) ve f) büyük harfleri kuralına uygun yazma drag_match ile, e) pekiştirmeli sözcükleri doğru yazma syllable_build ile oynanabilir; a) plana uygun yazma, b) sözcükleri yerinde kullanma, c) deyim ve atasözü kullanma, ç) mesajı açık ifade etme ve g) noktalama işaretlerini kullanma çocuğun kendi yazısında gerçekleşir, serbest yazılı üretim. |

#### 3. TEMA: DOĞAYI TANIYORUZ

`g3.turkce.t03` · işleniş sırası 3 · programda 15 çıktı · PDF s. 123

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.3.1 | Dinlemeyi/izlemeyi yönetebilme | 209 | kısmi | `scenario` | a) oyunda verilen amaca uygun dinleyeceğini seçme ve b) konuya ve amaca uygun dinleme stratejisini seçme scenario ile oynanabilir (ilgi alanına göre tercih kişisel seçim); c) dinleme kurallarına uygun dinleme ve ç) düşüncelerini belirtmek için söz alma gerçek iletişimde gözlenen davranış. |
| T.D.3.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 209 | kısmi | `story`, `sort_bins` | a) konu tahmini, b–c) olayların öncesi ve sonrası hakkında tahmin, ç) bilgiler ile ön bilgi arasında bağlantı kurma, d) oyunda verilen amaca uygun çıkarım ve f) metindeki bilgileri karşılaştırma story ile; e) iletileri doğruluk ve gerçeklik açısından ayırma ve g) durum, nesne ve karakterleri sınıflandırma sort_bins ile oynanabilir; ğ) ve ı) düşüncelerini ifade etme ile h) iletilere ilişkin öneride bulunma serbest sözlü üretim. |
| T.D.3.3 | Dinlediklerini/izlediklerini çözümleyebilme | 209 | kısmi | `story`, `sort_bins` | a) olayları belirleme, b) ana fikri ya da ana duyguyu bulma, c) konuyu bulma ve ç) iletilerin benzerlik ve farklılıklarını belirleme story ile, d) iletileri benzerlik ve farklılık yönüyle ilişkilendirme sort_bins ile oynanabilir; e) söylem ile görsel arasındaki ilişkiyi açıklama serbest sözlü üretim. |
| T.D.3.5 | Dinleme/izleme sürecini değerlendirebilme | 209 | yok |  | a) tercih ettiği dinleme stratejilerini açıklama ve b) dinleyeceği türü tercih nedenleriyle belirtme serbest sözlü üretim; c) uygun davranışlarını sonraki dinlemelerine aktarma öz değerlendirme. |
| T.K.3.1 | Konuşmalarını yönetebilme | 209 | kısmi | `scenario` | a) konunun özelliğine uygun konuşma üslubunu verilen durumlarda seçme scenario ile oynanabilir; b–c) konuşmasını tür ve amaca göre belirleme, ç) kurallara uygun iletişimi sürdürme ve d) konuşma planı hazırlama çocuğun kendi konuşmasını ve sözlü üretimi gerektirir. |
| T.K.3.2 | Konuşmalarında içerik oluşturabilme | 209 | kısmi | `story`, `sort_bins` | b) dinlediği konuşmanın nasıl sonuçlanacağını tahmin etme story ile, ç) metinlerdeki nesne ve kişileri karşılaştırma sort_bins ile oynanabilir; a) örnek verme, c) plana uygun konuşma, d–f) konuşmalarında sınıflandırma ve zıt ya da eş anlamlı sözcük kullanma, g) kendi cümleleriyle ifade, ğ–h) görüş ve öneri, ı–k) benzetme, örneklendirme, içerik oluşturma ve sunum, l) neden-sonuç ilişkisini ve m) atasözlerinin anlamını söyleme sözlü üretim. |
| T.K.3.3 | Konuşma kurallarını uygulayabilme | 210 | yok |  | Bileşenler (a–ı) ses düzeyi, plana uygun konuşma, vurgu ve tonlama, sözcük, atasözü, zaman ifadesi ve bağlama ögesi kullanımı, açık ve kurallı cümle, jest, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez. |
| T.K.3.5 | Konuşma sürecini değerlendirebilme | 210 | kısmi | `scenario` | a) başkalarının (oyundaki karakterlerin) konuşmalarındaki hataları fark etme scenario ile oynanabilir; b) kendi konuşmasındaki olumlu davranışları sonraki konuşmalarına aktarma öz değerlendirme. |
| T.O.3.1 | Okuma sürecini yönetebilme | 210 | kısmi | `story`, `scenario` | a) okuyacağı metnin başlık ve görsellerini inceleme story ile; c) oyunda verilen amaca uygun metni seçme ve ç) okuma amacına uygun okuma stratejisine karar verme scenario ile oynanabilir (ilgi alanına göre tercih kişisel seçim); b) noktalama işaretlerine dikkat ederek okuma sesli okuma gerektirir. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.3.2 | Okudukları ile ilgili anlam oluşturabilme | 210 | kısmi | `story`, `sequence`, `sort_bins`, `drag_match` | a) bağlantı kurma, b–c) ve d) bilgi ve olayların öncesi ve sonrası hakkında tahmin, e) metnin amacına uygun çıkarım ve g) iletileri metindeki diğer bilgilerle karşılaştırma story ile; ç) olayların sırası hakkında tahmin sequence ile; f) iletileri ön bilgiyle karşılaştırma ve ğ) olay, nesne ve kişileri sınıflandırma sort_bins ile; h) zıt ve eş anlamlı sözcükleri bulma drag_match ile oynanabilir; ı) katılıp katılmadığını nedenleriyle ifade etme, i) öneride bulunma ve j) görüş oluşturma serbest üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.3.3 | Okuduklarını çözümleyebilme | 211 | kısmi | `story`, `sort_bins`, `drag_match` | b) konuyu ve c) ana fikri ya da ana duyguyu bulma ile ç) iletileri benzerlik ve farklılık yönüyle ilişkilendirme story ile; d) gerçek ve mecaz anlamlı sözcükleri metinle ilişkilendirme sort_bins ile; e) noktalama işaretinin içerikle ilişkisini belirleme drag_match ile oynanabilir; a) karakter, olay, bilgi ya da duyguları açıklama serbest sözlü üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.3.5 | Okuma sürecini değerlendirebilme | 211 | yok |  | a) belirlediği okuma hatalarını düzeltme, b) ve ç) olumlu davranışlarını sonraki ve çevrim içi okumalarına aktarma öz değerlendirme; c) tür veya ilgi alanına göre okuma tercihini belirtme doğru/yanlışı olmayan kişisel tercih. |
| T.Y.3.1 | Yazılı anlatım becerilerini yönetebilme | 211 | yok |  | Bileşenler (a–f) hazırlıksız ve türüne göre yazma, yazışmayı başlatma, sürdürme ve sonlandırma ifadeleri (çevrim içi dahil), imzada adını kullanma ve yazma planı hazırlama; hepsi serbest yazılı üretim. |
| T.Y.3.2 | Yazılarında içerik oluşturabilme | 211 | yok |  | Bütün bileşenler (a–o) çocuğun kendi yazısını üretmesini ister: metni devam ettirme, tahmin ve çıkarım yazma, yazılarında karşılaştırma, sınıflandırma, zıt ve eş anlamlı sözcük, benzetme ve örnek kullanma, kendi ifadeleriyle yazma, yönerge, öneri, istek ve şikâyet yazma, bilginin kaynağını yazma, yazılarını sunma ve neden-sonuç yazma; serbest yazılı üretim. |
| T.Y.3.3 | Yazma kurallarını uygulayabilme | 212 | kısmi | `drag_match`, `syllable_build` | d) kısaltmalara gelen ekleri kuralına uygun yazma (kesme işareti ve eki doğru karoyla ekleme) ve f) büyük harfleri kuralına uygun yazma drag_match ile, e) pekiştirmeli sözcükleri doğru yazma syllable_build ile oynanabilir; a) plana uygun yazma, b) sözcükleri yerinde kullanma, c) deyim ve atasözü kullanma, ç) mesajı açık ifade etme ve g) noktalama işaretlerini kullanma çocuğun kendi yazısında gerçekleşir, serbest yazılı üretim. |

#### 4. TEMA: BİLGİ HAZİNEMİZ

`g3.turkce.t04` · işleniş sırası 4 · programda 13 çıktı · PDF s. 128

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.3.1 | Dinlemeyi/izlemeyi yönetebilme | 209 | kısmi | `scenario` | a) oyunda verilen amaca uygun dinleyeceğini seçme ve b) konuya ve amaca uygun dinleme stratejisini seçme scenario ile oynanabilir (ilgi alanına göre tercih kişisel seçim); c) dinleme kurallarına uygun dinleme ve ç) düşüncelerini belirtmek için söz alma gerçek iletişimde gözlenen davranış. |
| T.D.3.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 209 | kısmi | `story`, `sort_bins` | a) konu tahmini, b–c) olayların öncesi ve sonrası hakkında tahmin, ç) bilgiler ile ön bilgi arasında bağlantı kurma, d) oyunda verilen amaca uygun çıkarım ve f) metindeki bilgileri karşılaştırma story ile; e) iletileri doğruluk ve gerçeklik açısından ayırma ve g) durum, nesne ve karakterleri sınıflandırma sort_bins ile oynanabilir; ğ) ve ı) düşüncelerini ifade etme ile h) iletilere ilişkin öneride bulunma serbest sözlü üretim. |
| T.D.3.3 | Dinlediklerini/izlediklerini çözümleyebilme | 209 | kısmi | `story`, `sort_bins` | a) olayları belirleme, b) ana fikri ya da ana duyguyu bulma, c) konuyu bulma ve ç) iletilerin benzerlik ve farklılıklarını belirleme story ile, d) iletileri benzerlik ve farklılık yönüyle ilişkilendirme sort_bins ile oynanabilir; e) söylem ile görsel arasındaki ilişkiyi açıklama serbest sözlü üretim. |
| T.K.3.1 | Konuşmalarını yönetebilme | 209 | kısmi | `scenario` | a) konunun özelliğine uygun konuşma üslubunu verilen durumlarda seçme scenario ile oynanabilir; b–c) konuşmasını tür ve amaca göre belirleme, ç) kurallara uygun iletişimi sürdürme ve d) konuşma planı hazırlama çocuğun kendi konuşmasını ve sözlü üretimi gerektirir. |
| T.K.3.2 | Konuşmalarında içerik oluşturabilme | 209 | kısmi | `story`, `sort_bins` | b) dinlediği konuşmanın nasıl sonuçlanacağını tahmin etme story ile, ç) metinlerdeki nesne ve kişileri karşılaştırma sort_bins ile oynanabilir; a) örnek verme, c) plana uygun konuşma, d–f) konuşmalarında sınıflandırma ve zıt ya da eş anlamlı sözcük kullanma, g) kendi cümleleriyle ifade, ğ–h) görüş ve öneri, ı–k) benzetme, örneklendirme, içerik oluşturma ve sunum, l) neden-sonuç ilişkisini ve m) atasözlerinin anlamını söyleme sözlü üretim. |
| T.K.3.3 | Konuşma kurallarını uygulayabilme | 210 | yok |  | Bileşenler (a–ı) ses düzeyi, plana uygun konuşma, vurgu ve tonlama, sözcük, atasözü, zaman ifadesi ve bağlama ögesi kullanımı, açık ve kurallı cümle, jest, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez. |
| T.O.3.1 | Okuma sürecini yönetebilme | 210 | kısmi | `story`, `scenario` | a) okuyacağı metnin başlık ve görsellerini inceleme story ile; c) oyunda verilen amaca uygun metni seçme ve ç) okuma amacına uygun okuma stratejisine karar verme scenario ile oynanabilir (ilgi alanına göre tercih kişisel seçim); b) noktalama işaretlerine dikkat ederek okuma sesli okuma gerektirir. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.3.2 | Okudukları ile ilgili anlam oluşturabilme | 210 | kısmi | `story`, `sequence`, `sort_bins`, `drag_match` | a) bağlantı kurma, b–c) ve d) bilgi ve olayların öncesi ve sonrası hakkında tahmin, e) metnin amacına uygun çıkarım ve g) iletileri metindeki diğer bilgilerle karşılaştırma story ile; ç) olayların sırası hakkında tahmin sequence ile; f) iletileri ön bilgiyle karşılaştırma ve ğ) olay, nesne ve kişileri sınıflandırma sort_bins ile; h) zıt ve eş anlamlı sözcükleri bulma drag_match ile oynanabilir; ı) katılıp katılmadığını nedenleriyle ifade etme, i) öneride bulunma ve j) görüş oluşturma serbest üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.3.3 | Okuduklarını çözümleyebilme | 211 | kısmi | `story`, `sort_bins`, `drag_match` | b) konuyu ve c) ana fikri ya da ana duyguyu bulma ile ç) iletileri benzerlik ve farklılık yönüyle ilişkilendirme story ile; d) gerçek ve mecaz anlamlı sözcükleri metinle ilişkilendirme sort_bins ile; e) noktalama işaretinin içerikle ilişkisini belirleme drag_match ile oynanabilir; a) karakter, olay, bilgi ya da duyguları açıklama serbest sözlü üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.Y.3.1 | Yazılı anlatım becerilerini yönetebilme | 211 | yok |  | Bileşenler (a–f) hazırlıksız ve türüne göre yazma, yazışmayı başlatma, sürdürme ve sonlandırma ifadeleri (çevrim içi dahil), imzada adını kullanma ve yazma planı hazırlama; hepsi serbest yazılı üretim. |
| T.Y.3.2 | Yazılarında içerik oluşturabilme | 211 | yok |  | Bütün bileşenler (a–o) çocuğun kendi yazısını üretmesini ister: metni devam ettirme, tahmin ve çıkarım yazma, yazılarında karşılaştırma, sınıflandırma, zıt ve eş anlamlı sözcük, benzetme ve örnek kullanma, kendi ifadeleriyle yazma, yönerge, öneri, istek ve şikâyet yazma, bilginin kaynağını yazma, yazılarını sunma ve neden-sonuç yazma; serbest yazılı üretim. |
| T.Y.3.3 | Yazma kurallarını uygulayabilme | 212 | kısmi | `drag_match`, `syllable_build` | d) kısaltmalara gelen ekleri kuralına uygun yazma (kesme işareti ve eki doğru karoyla ekleme) ve f) büyük harfleri kuralına uygun yazma drag_match ile, e) pekiştirmeli sözcükleri doğru yazma syllable_build ile oynanabilir; a) plana uygun yazma, b) sözcükleri yerinde kullanma, c) deyim ve atasözü kullanma, ç) mesajı açık ifade etme ve g) noktalama işaretlerini kullanma çocuğun kendi yazısında gerçekleşir, serbest yazılı üretim. |
| T.Y.3.5 | Yazma sürecini değerlendirebilme | 212 | yok |  | Bileşenler (a–c) kendi yazılarındaki hataları bulup düzeltme ve uygun davranışları sonraki yazılarına aktarma; kendi kâğıt yazısı üzerinde öz değerlendirme. |

#### 5. TEMA: YETENEKLERİMİZİ KULLANIYORUZ

`g3.turkce.t05` · işleniş sırası 5 · programda 12 çıktı · PDF s. 133

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.3.1 | Dinlemeyi/izlemeyi yönetebilme | 209 | kısmi | `scenario` | a) oyunda verilen amaca uygun dinleyeceğini seçme ve b) konuya ve amaca uygun dinleme stratejisini seçme scenario ile oynanabilir (ilgi alanına göre tercih kişisel seçim); c) dinleme kurallarına uygun dinleme ve ç) düşüncelerini belirtmek için söz alma gerçek iletişimde gözlenen davranış. |
| T.D.3.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 209 | kısmi | `story`, `sort_bins` | a) konu tahmini, b–c) olayların öncesi ve sonrası hakkında tahmin, ç) bilgiler ile ön bilgi arasında bağlantı kurma, d) oyunda verilen amaca uygun çıkarım ve f) metindeki bilgileri karşılaştırma story ile; e) iletileri doğruluk ve gerçeklik açısından ayırma ve g) durum, nesne ve karakterleri sınıflandırma sort_bins ile oynanabilir; ğ) ve ı) düşüncelerini ifade etme ile h) iletilere ilişkin öneride bulunma serbest sözlü üretim. |
| T.D.3.3 | Dinlediklerini/izlediklerini çözümleyebilme | 209 | kısmi | `story`, `sort_bins` | a) olayları belirleme, b) ana fikri ya da ana duyguyu bulma, c) konuyu bulma ve ç) iletilerin benzerlik ve farklılıklarını belirleme story ile, d) iletileri benzerlik ve farklılık yönüyle ilişkilendirme sort_bins ile oynanabilir; e) söylem ile görsel arasındaki ilişkiyi açıklama serbest sözlü üretim. |
| T.K.3.1 | Konuşmalarını yönetebilme | 209 | kısmi | `scenario` | a) konunun özelliğine uygun konuşma üslubunu verilen durumlarda seçme scenario ile oynanabilir; b–c) konuşmasını tür ve amaca göre belirleme, ç) kurallara uygun iletişimi sürdürme ve d) konuşma planı hazırlama çocuğun kendi konuşmasını ve sözlü üretimi gerektirir. |
| T.K.3.2 | Konuşmalarında içerik oluşturabilme | 209 | kısmi | `story`, `sort_bins` | b) dinlediği konuşmanın nasıl sonuçlanacağını tahmin etme story ile, ç) metinlerdeki nesne ve kişileri karşılaştırma sort_bins ile oynanabilir; a) örnek verme, c) plana uygun konuşma, d–f) konuşmalarında sınıflandırma ve zıt ya da eş anlamlı sözcük kullanma, g) kendi cümleleriyle ifade, ğ–h) görüş ve öneri, ı–k) benzetme, örneklendirme, içerik oluşturma ve sunum, l) neden-sonuç ilişkisini ve m) atasözlerinin anlamını söyleme sözlü üretim. |
| T.K.3.3 | Konuşma kurallarını uygulayabilme | 210 | yok |  | Bileşenler (a–ı) ses düzeyi, plana uygun konuşma, vurgu ve tonlama, sözcük, atasözü, zaman ifadesi ve bağlama ögesi kullanımı, açık ve kurallı cümle, jest, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez. |
| T.O.3.1 | Okuma sürecini yönetebilme | 210 | kısmi | `story`, `scenario` | a) okuyacağı metnin başlık ve görsellerini inceleme story ile; c) oyunda verilen amaca uygun metni seçme ve ç) okuma amacına uygun okuma stratejisine karar verme scenario ile oynanabilir (ilgi alanına göre tercih kişisel seçim); b) noktalama işaretlerine dikkat ederek okuma sesli okuma gerektirir. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.3.2 | Okudukları ile ilgili anlam oluşturabilme | 210 | kısmi | `story`, `sequence`, `sort_bins`, `drag_match` | a) bağlantı kurma, b–c) ve d) bilgi ve olayların öncesi ve sonrası hakkında tahmin, e) metnin amacına uygun çıkarım ve g) iletileri metindeki diğer bilgilerle karşılaştırma story ile; ç) olayların sırası hakkında tahmin sequence ile; f) iletileri ön bilgiyle karşılaştırma ve ğ) olay, nesne ve kişileri sınıflandırma sort_bins ile; h) zıt ve eş anlamlı sözcükleri bulma drag_match ile oynanabilir; ı) katılıp katılmadığını nedenleriyle ifade etme, i) öneride bulunma ve j) görüş oluşturma serbest üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.3.3 | Okuduklarını çözümleyebilme | 211 | kısmi | `story`, `sort_bins`, `drag_match` | b) konuyu ve c) ana fikri ya da ana duyguyu bulma ile ç) iletileri benzerlik ve farklılık yönüyle ilişkilendirme story ile; d) gerçek ve mecaz anlamlı sözcükleri metinle ilişkilendirme sort_bins ile; e) noktalama işaretinin içerikle ilişkisini belirleme drag_match ile oynanabilir; a) karakter, olay, bilgi ya da duyguları açıklama serbest sözlü üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.Y.3.1 | Yazılı anlatım becerilerini yönetebilme | 211 | yok |  | Bileşenler (a–f) hazırlıksız ve türüne göre yazma, yazışmayı başlatma, sürdürme ve sonlandırma ifadeleri (çevrim içi dahil), imzada adını kullanma ve yazma planı hazırlama; hepsi serbest yazılı üretim. |
| T.Y.3.2 | Yazılarında içerik oluşturabilme | 211 | yok |  | Bütün bileşenler (a–o) çocuğun kendi yazısını üretmesini ister: metni devam ettirme, tahmin ve çıkarım yazma, yazılarında karşılaştırma, sınıflandırma, zıt ve eş anlamlı sözcük, benzetme ve örnek kullanma, kendi ifadeleriyle yazma, yönerge, öneri, istek ve şikâyet yazma, bilginin kaynağını yazma, yazılarını sunma ve neden-sonuç yazma; serbest yazılı üretim. |
| T.Y.3.3 | Yazma kurallarını uygulayabilme | 212 | kısmi | `drag_match`, `syllable_build` | d) kısaltmalara gelen ekleri kuralına uygun yazma (kesme işareti ve eki doğru karoyla ekleme) ve f) büyük harfleri kuralına uygun yazma drag_match ile, e) pekiştirmeli sözcükleri doğru yazma syllable_build ile oynanabilir; a) plana uygun yazma, b) sözcükleri yerinde kullanma, c) deyim ve atasözü kullanma, ç) mesajı açık ifade etme ve g) noktalama işaretlerini kullanma çocuğun kendi yazısında gerçekleşir, serbest yazılı üretim. |

#### 6. TEMA: BİLİM YOLCULUĞU

`g3.turkce.t06` · işleniş sırası 6 · programda 15 çıktı · PDF s. 138

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.3.1 | Dinlemeyi/izlemeyi yönetebilme | 209 | kısmi | `scenario` | a) oyunda verilen amaca uygun dinleyeceğini seçme ve b) konuya ve amaca uygun dinleme stratejisini seçme scenario ile oynanabilir (ilgi alanına göre tercih kişisel seçim); c) dinleme kurallarına uygun dinleme ve ç) düşüncelerini belirtmek için söz alma gerçek iletişimde gözlenen davranış. |
| T.D.3.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 209 | kısmi | `story`, `sort_bins` | a) konu tahmini, b–c) olayların öncesi ve sonrası hakkında tahmin, ç) bilgiler ile ön bilgi arasında bağlantı kurma, d) oyunda verilen amaca uygun çıkarım ve f) metindeki bilgileri karşılaştırma story ile; e) iletileri doğruluk ve gerçeklik açısından ayırma ve g) durum, nesne ve karakterleri sınıflandırma sort_bins ile oynanabilir; ğ) ve ı) düşüncelerini ifade etme ile h) iletilere ilişkin öneride bulunma serbest sözlü üretim. |
| T.D.3.3 | Dinlediklerini/izlediklerini çözümleyebilme | 209 | kısmi | `story`, `sort_bins` | a) olayları belirleme, b) ana fikri ya da ana duyguyu bulma, c) konuyu bulma ve ç) iletilerin benzerlik ve farklılıklarını belirleme story ile, d) iletileri benzerlik ve farklılık yönüyle ilişkilendirme sort_bins ile oynanabilir; e) söylem ile görsel arasındaki ilişkiyi açıklama serbest sözlü üretim. |
| T.D.3.4 | Dinleme/izleme sürecine etki eden durumları gözden geçirebilme | 209 | yok |  | a) dinleme yapacağı gerçek ortamın uygunluğunu gözden geçirme çocuğun kendi ortamına bağlı; b) ortamın duygu, düşünce ve davranışlarına etkisini açıklama serbest sözlü üretim. |
| T.D.3.5 | Dinleme/izleme sürecini değerlendirebilme | 209 | yok |  | a) tercih ettiği dinleme stratejilerini açıklama ve b) dinleyeceği türü tercih nedenleriyle belirtme serbest sözlü üretim; c) uygun davranışlarını sonraki dinlemelerine aktarma öz değerlendirme. |
| T.K.3.1 | Konuşmalarını yönetebilme | 209 | kısmi | `scenario` | a) konunun özelliğine uygun konuşma üslubunu verilen durumlarda seçme scenario ile oynanabilir; b–c) konuşmasını tür ve amaca göre belirleme, ç) kurallara uygun iletişimi sürdürme ve d) konuşma planı hazırlama çocuğun kendi konuşmasını ve sözlü üretimi gerektirir. |
| T.K.3.2 | Konuşmalarında içerik oluşturabilme | 209 | kısmi | `story`, `sort_bins` | b) dinlediği konuşmanın nasıl sonuçlanacağını tahmin etme story ile, ç) metinlerdeki nesne ve kişileri karşılaştırma sort_bins ile oynanabilir; a) örnek verme, c) plana uygun konuşma, d–f) konuşmalarında sınıflandırma ve zıt ya da eş anlamlı sözcük kullanma, g) kendi cümleleriyle ifade, ğ–h) görüş ve öneri, ı–k) benzetme, örneklendirme, içerik oluşturma ve sunum, l) neden-sonuç ilişkisini ve m) atasözlerinin anlamını söyleme sözlü üretim. |
| T.K.3.3 | Konuşma kurallarını uygulayabilme | 210 | yok |  | Bileşenler (a–ı) ses düzeyi, plana uygun konuşma, vurgu ve tonlama, sözcük, atasözü, zaman ifadesi ve bağlama ögesi kullanımı, açık ve kurallı cümle, jest, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez. |
| T.O.3.1 | Okuma sürecini yönetebilme | 210 | kısmi | `story`, `scenario` | a) okuyacağı metnin başlık ve görsellerini inceleme story ile; c) oyunda verilen amaca uygun metni seçme ve ç) okuma amacına uygun okuma stratejisine karar verme scenario ile oynanabilir (ilgi alanına göre tercih kişisel seçim); b) noktalama işaretlerine dikkat ederek okuma sesli okuma gerektirir. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.3.2 | Okudukları ile ilgili anlam oluşturabilme | 210 | kısmi | `story`, `sequence`, `sort_bins`, `drag_match` | a) bağlantı kurma, b–c) ve d) bilgi ve olayların öncesi ve sonrası hakkında tahmin, e) metnin amacına uygun çıkarım ve g) iletileri metindeki diğer bilgilerle karşılaştırma story ile; ç) olayların sırası hakkında tahmin sequence ile; f) iletileri ön bilgiyle karşılaştırma ve ğ) olay, nesne ve kişileri sınıflandırma sort_bins ile; h) zıt ve eş anlamlı sözcükleri bulma drag_match ile oynanabilir; ı) katılıp katılmadığını nedenleriyle ifade etme, i) öneride bulunma ve j) görüş oluşturma serbest üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.3.3 | Okuduklarını çözümleyebilme | 211 | kısmi | `story`, `sort_bins`, `drag_match` | b) konuyu ve c) ana fikri ya da ana duyguyu bulma ile ç) iletileri benzerlik ve farklılık yönüyle ilişkilendirme story ile; d) gerçek ve mecaz anlamlı sözcükleri metinle ilişkilendirme sort_bins ile; e) noktalama işaretinin içerikle ilişkisini belirleme drag_match ile oynanabilir; a) karakter, olay, bilgi ya da duyguları açıklama serbest sözlü üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.3.5 | Okuma sürecini değerlendirebilme | 211 | yok |  | a) belirlediği okuma hatalarını düzeltme, b) ve ç) olumlu davranışlarını sonraki ve çevrim içi okumalarına aktarma öz değerlendirme; c) tür veya ilgi alanına göre okuma tercihini belirtme doğru/yanlışı olmayan kişisel tercih. |
| T.Y.3.1 | Yazılı anlatım becerilerini yönetebilme | 211 | yok |  | Bileşenler (a–f) hazırlıksız ve türüne göre yazma, yazışmayı başlatma, sürdürme ve sonlandırma ifadeleri (çevrim içi dahil), imzada adını kullanma ve yazma planı hazırlama; hepsi serbest yazılı üretim. |
| T.Y.3.2 | Yazılarında içerik oluşturabilme | 211 | yok |  | Bütün bileşenler (a–o) çocuğun kendi yazısını üretmesini ister: metni devam ettirme, tahmin ve çıkarım yazma, yazılarında karşılaştırma, sınıflandırma, zıt ve eş anlamlı sözcük, benzetme ve örnek kullanma, kendi ifadeleriyle yazma, yönerge, öneri, istek ve şikâyet yazma, bilginin kaynağını yazma, yazılarını sunma ve neden-sonuç yazma; serbest yazılı üretim. |
| T.Y.3.3 | Yazma kurallarını uygulayabilme | 212 | kısmi | `drag_match`, `syllable_build` | d) kısaltmalara gelen ekleri kuralına uygun yazma (kesme işareti ve eki doğru karoyla ekleme) ve f) büyük harfleri kuralına uygun yazma drag_match ile, e) pekiştirmeli sözcükleri doğru yazma syllable_build ile oynanabilir; a) plana uygun yazma, b) sözcükleri yerinde kullanma, c) deyim ve atasözü kullanma, ç) mesajı açık ifade etme ve g) noktalama işaretlerini kullanma çocuğun kendi yazısında gerçekleşir, serbest yazılı üretim. |

#### 7. TEMA: MİLLÎ KÜLTÜRÜMÜZ

`g3.turkce.t07` · işleniş sırası 7 · programda 14 çıktı · PDF s. 144

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.3.1 | Dinlemeyi/izlemeyi yönetebilme | 209 | kısmi | `scenario` | a) oyunda verilen amaca uygun dinleyeceğini seçme ve b) konuya ve amaca uygun dinleme stratejisini seçme scenario ile oynanabilir (ilgi alanına göre tercih kişisel seçim); c) dinleme kurallarına uygun dinleme ve ç) düşüncelerini belirtmek için söz alma gerçek iletişimde gözlenen davranış. |
| T.D.3.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 209 | kısmi | `story`, `sort_bins` | a) konu tahmini, b–c) olayların öncesi ve sonrası hakkında tahmin, ç) bilgiler ile ön bilgi arasında bağlantı kurma, d) oyunda verilen amaca uygun çıkarım ve f) metindeki bilgileri karşılaştırma story ile; e) iletileri doğruluk ve gerçeklik açısından ayırma ve g) durum, nesne ve karakterleri sınıflandırma sort_bins ile oynanabilir; ğ) ve ı) düşüncelerini ifade etme ile h) iletilere ilişkin öneride bulunma serbest sözlü üretim. |
| T.D.3.3 | Dinlediklerini/izlediklerini çözümleyebilme | 209 | kısmi | `story`, `sort_bins` | a) olayları belirleme, b) ana fikri ya da ana duyguyu bulma, c) konuyu bulma ve ç) iletilerin benzerlik ve farklılıklarını belirleme story ile, d) iletileri benzerlik ve farklılık yönüyle ilişkilendirme sort_bins ile oynanabilir; e) söylem ile görsel arasındaki ilişkiyi açıklama serbest sözlü üretim. |
| T.D.3.4 | Dinleme/izleme sürecine etki eden durumları gözden geçirebilme | 209 | yok |  | a) dinleme yapacağı gerçek ortamın uygunluğunu gözden geçirme çocuğun kendi ortamına bağlı; b) ortamın duygu, düşünce ve davranışlarına etkisini açıklama serbest sözlü üretim. |
| T.D.3.5 | Dinleme/izleme sürecini değerlendirebilme | 209 | yok |  | a) tercih ettiği dinleme stratejilerini açıklama ve b) dinleyeceği türü tercih nedenleriyle belirtme serbest sözlü üretim; c) uygun davranışlarını sonraki dinlemelerine aktarma öz değerlendirme. |
| T.K.3.1 | Konuşmalarını yönetebilme | 209 | kısmi | `scenario` | a) konunun özelliğine uygun konuşma üslubunu verilen durumlarda seçme scenario ile oynanabilir; b–c) konuşmasını tür ve amaca göre belirleme, ç) kurallara uygun iletişimi sürdürme ve d) konuşma planı hazırlama çocuğun kendi konuşmasını ve sözlü üretimi gerektirir. |
| T.K.3.2 | Konuşmalarında içerik oluşturabilme | 209 | kısmi | `story`, `sort_bins` | b) dinlediği konuşmanın nasıl sonuçlanacağını tahmin etme story ile, ç) metinlerdeki nesne ve kişileri karşılaştırma sort_bins ile oynanabilir; a) örnek verme, c) plana uygun konuşma, d–f) konuşmalarında sınıflandırma ve zıt ya da eş anlamlı sözcük kullanma, g) kendi cümleleriyle ifade, ğ–h) görüş ve öneri, ı–k) benzetme, örneklendirme, içerik oluşturma ve sunum, l) neden-sonuç ilişkisini ve m) atasözlerinin anlamını söyleme sözlü üretim. |
| T.K.3.3 | Konuşma kurallarını uygulayabilme | 210 | yok |  | Bileşenler (a–ı) ses düzeyi, plana uygun konuşma, vurgu ve tonlama, sözcük, atasözü, zaman ifadesi ve bağlama ögesi kullanımı, açık ve kurallı cümle, jest, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez. |
| T.O.3.1 | Okuma sürecini yönetebilme | 210 | kısmi | `story`, `scenario` | a) okuyacağı metnin başlık ve görsellerini inceleme story ile; c) oyunda verilen amaca uygun metni seçme ve ç) okuma amacına uygun okuma stratejisine karar verme scenario ile oynanabilir (ilgi alanına göre tercih kişisel seçim); b) noktalama işaretlerine dikkat ederek okuma sesli okuma gerektirir. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.3.2 | Okudukları ile ilgili anlam oluşturabilme | 210 | kısmi | `story`, `sequence`, `sort_bins`, `drag_match` | a) bağlantı kurma, b–c) ve d) bilgi ve olayların öncesi ve sonrası hakkında tahmin, e) metnin amacına uygun çıkarım ve g) iletileri metindeki diğer bilgilerle karşılaştırma story ile; ç) olayların sırası hakkında tahmin sequence ile; f) iletileri ön bilgiyle karşılaştırma ve ğ) olay, nesne ve kişileri sınıflandırma sort_bins ile; h) zıt ve eş anlamlı sözcükleri bulma drag_match ile oynanabilir; ı) katılıp katılmadığını nedenleriyle ifade etme, i) öneride bulunma ve j) görüş oluşturma serbest üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.3.3 | Okuduklarını çözümleyebilme | 211 | kısmi | `story`, `sort_bins`, `drag_match` | b) konuyu ve c) ana fikri ya da ana duyguyu bulma ile ç) iletileri benzerlik ve farklılık yönüyle ilişkilendirme story ile; d) gerçek ve mecaz anlamlı sözcükleri metinle ilişkilendirme sort_bins ile; e) noktalama işaretinin içerikle ilişkisini belirleme drag_match ile oynanabilir; a) karakter, olay, bilgi ya da duyguları açıklama serbest sözlü üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.Y.3.1 | Yazılı anlatım becerilerini yönetebilme | 211 | yok |  | Bileşenler (a–f) hazırlıksız ve türüne göre yazma, yazışmayı başlatma, sürdürme ve sonlandırma ifadeleri (çevrim içi dahil), imzada adını kullanma ve yazma planı hazırlama; hepsi serbest yazılı üretim. |
| T.Y.3.2 | Yazılarında içerik oluşturabilme | 211 | yok |  | Bütün bileşenler (a–o) çocuğun kendi yazısını üretmesini ister: metni devam ettirme, tahmin ve çıkarım yazma, yazılarında karşılaştırma, sınıflandırma, zıt ve eş anlamlı sözcük, benzetme ve örnek kullanma, kendi ifadeleriyle yazma, yönerge, öneri, istek ve şikâyet yazma, bilginin kaynağını yazma, yazılarını sunma ve neden-sonuç yazma; serbest yazılı üretim. |
| T.Y.3.3 | Yazma kurallarını uygulayabilme | 212 | kısmi | `drag_match`, `syllable_build` | d) kısaltmalara gelen ekleri kuralına uygun yazma (kesme işareti ve eki doğru karoyla ekleme) ve f) büyük harfleri kuralına uygun yazma drag_match ile, e) pekiştirmeli sözcükleri doğru yazma syllable_build ile oynanabilir; a) plana uygun yazma, b) sözcükleri yerinde kullanma, c) deyim ve atasözü kullanma, ç) mesajı açık ifade etme ve g) noktalama işaretlerini kullanma çocuğun kendi yazısında gerçekleşir, serbest yazılı üretim. |

#### 8. TEMA: HAK VE SORUMLULUKLARIMIZ

`g3.turkce.t08` · işleniş sırası 8 · programda 19 çıktı · PDF s. 149

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| T.D.3.1 | Dinlemeyi/izlemeyi yönetebilme | 209 | kısmi | `scenario` | a) oyunda verilen amaca uygun dinleyeceğini seçme ve b) konuya ve amaca uygun dinleme stratejisini seçme scenario ile oynanabilir (ilgi alanına göre tercih kişisel seçim); c) dinleme kurallarına uygun dinleme ve ç) düşüncelerini belirtmek için söz alma gerçek iletişimde gözlenen davranış. |
| T.D.3.2 | Dinledikleri/izledikleri ile ilgili anlam oluşturabilme | 209 | kısmi | `story`, `sort_bins` | a) konu tahmini, b–c) olayların öncesi ve sonrası hakkında tahmin, ç) bilgiler ile ön bilgi arasında bağlantı kurma, d) oyunda verilen amaca uygun çıkarım ve f) metindeki bilgileri karşılaştırma story ile; e) iletileri doğruluk ve gerçeklik açısından ayırma ve g) durum, nesne ve karakterleri sınıflandırma sort_bins ile oynanabilir; ğ) ve ı) düşüncelerini ifade etme ile h) iletilere ilişkin öneride bulunma serbest sözlü üretim. |
| T.D.3.3 | Dinlediklerini/izlediklerini çözümleyebilme | 209 | kısmi | `story`, `sort_bins` | a) olayları belirleme, b) ana fikri ya da ana duyguyu bulma, c) konuyu bulma ve ç) iletilerin benzerlik ve farklılıklarını belirleme story ile, d) iletileri benzerlik ve farklılık yönüyle ilişkilendirme sort_bins ile oynanabilir; e) söylem ile görsel arasındaki ilişkiyi açıklama serbest sözlü üretim. |
| T.D.3.4 | Dinleme/izleme sürecine etki eden durumları gözden geçirebilme | 209 | yok |  | a) dinleme yapacağı gerçek ortamın uygunluğunu gözden geçirme çocuğun kendi ortamına bağlı; b) ortamın duygu, düşünce ve davranışlarına etkisini açıklama serbest sözlü üretim. |
| T.D.3.5 | Dinleme/izleme sürecini değerlendirebilme | 209 | yok |  | a) tercih ettiği dinleme stratejilerini açıklama ve b) dinleyeceği türü tercih nedenleriyle belirtme serbest sözlü üretim; c) uygun davranışlarını sonraki dinlemelerine aktarma öz değerlendirme. |
| T.K.3.1 | Konuşmalarını yönetebilme | 209 | kısmi | `scenario` | a) konunun özelliğine uygun konuşma üslubunu verilen durumlarda seçme scenario ile oynanabilir; b–c) konuşmasını tür ve amaca göre belirleme, ç) kurallara uygun iletişimi sürdürme ve d) konuşma planı hazırlama çocuğun kendi konuşmasını ve sözlü üretimi gerektirir. |
| T.K.3.2 | Konuşmalarında içerik oluşturabilme | 209 | kısmi | `story`, `sort_bins` | b) dinlediği konuşmanın nasıl sonuçlanacağını tahmin etme story ile, ç) metinlerdeki nesne ve kişileri karşılaştırma sort_bins ile oynanabilir; a) örnek verme, c) plana uygun konuşma, d–f) konuşmalarında sınıflandırma ve zıt ya da eş anlamlı sözcük kullanma, g) kendi cümleleriyle ifade, ğ–h) görüş ve öneri, ı–k) benzetme, örneklendirme, içerik oluşturma ve sunum, l) neden-sonuç ilişkisini ve m) atasözlerinin anlamını söyleme sözlü üretim. |
| T.K.3.3 | Konuşma kurallarını uygulayabilme | 210 | yok |  | Bileşenler (a–ı) ses düzeyi, plana uygun konuşma, vurgu ve tonlama, sözcük, atasözü, zaman ifadesi ve bağlama ögesi kullanımı, açık ve kurallı cümle, jest, mimik ve beden dili; hepsi çocuğun kendi konuşmasında gerçekleşir, oyun konuşmayı değerlendirmez. |
| T.K.3.4 | Konuşma sürecine etki eden durumları gözden geçirebilme | 210 | yok |  | a) konuşma yapacağı gerçek ortamın uygunluğunu gözden geçirme çocuğun kendi ortamına bağlı; b) ortamın duygu, düşünce ve davranışlarına etkisini açıklama serbest sözlü üretim. |
| T.K.3.5 | Konuşma sürecini değerlendirebilme | 210 | kısmi | `scenario` | a) başkalarının (oyundaki karakterlerin) konuşmalarındaki hataları fark etme scenario ile oynanabilir; b) kendi konuşmasındaki olumlu davranışları sonraki konuşmalarına aktarma öz değerlendirme. |
| T.O.3.1 | Okuma sürecini yönetebilme | 210 | kısmi | `story`, `scenario` | a) okuyacağı metnin başlık ve görsellerini inceleme story ile; c) oyunda verilen amaca uygun metni seçme ve ç) okuma amacına uygun okuma stratejisine karar verme scenario ile oynanabilir (ilgi alanına göre tercih kişisel seçim); b) noktalama işaretlerine dikkat ederek okuma sesli okuma gerektirir. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.3.2 | Okudukları ile ilgili anlam oluşturabilme | 210 | kısmi | `story`, `sequence`, `sort_bins`, `drag_match` | a) bağlantı kurma, b–c) ve d) bilgi ve olayların öncesi ve sonrası hakkında tahmin, e) metnin amacına uygun çıkarım ve g) iletileri metindeki diğer bilgilerle karşılaştırma story ile; ç) olayların sırası hakkında tahmin sequence ile; f) iletileri ön bilgiyle karşılaştırma ve ğ) olay, nesne ve kişileri sınıflandırma sort_bins ile; h) zıt ve eş anlamlı sözcükleri bulma drag_match ile oynanabilir; ı) katılıp katılmadığını nedenleriyle ifade etme, i) öneride bulunma ve j) görüş oluşturma serbest üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.3.3 | Okuduklarını çözümleyebilme | 211 | kısmi | `story`, `sort_bins`, `drag_match` | b) konuyu ve c) ana fikri ya da ana duyguyu bulma ile ç) iletileri benzerlik ve farklılık yönüyle ilişkilendirme story ile; d) gerçek ve mecaz anlamlı sözcükleri metinle ilişkilendirme sort_bins ile; e) noktalama işaretinin içerikle ilişkisini belirleme drag_match ile oynanabilir; a) karakter, olay, bilgi ya da duyguları açıklama serbest sözlü üretim. Okuma bileşenleri metnin ilk cevaba kadar seslendirilmeden gösterilmesini (sessiz okuma modu) gerektirir (spec Açık sorular, Faz 2: sessiz okuma modu). |
| T.O.3.4 | Okuma sürecine etki eden durumları gözden geçirebilme | 211 | yok |  | a) okuma yapacağı gerçek ortamın uygunluğunu değerlendirme ve b) ortamın fiziksel özelliklerini dikkate alarak okuma çocuğun kendi okuma ortamına bağlı. |
| T.O.3.5 | Okuma sürecini değerlendirebilme | 211 | yok |  | a) belirlediği okuma hatalarını düzeltme, b) ve ç) olumlu davranışlarını sonraki ve çevrim içi okumalarına aktarma öz değerlendirme; c) tür veya ilgi alanına göre okuma tercihini belirtme doğru/yanlışı olmayan kişisel tercih. |
| T.Y.3.1 | Yazılı anlatım becerilerini yönetebilme | 211 | yok |  | Bileşenler (a–f) hazırlıksız ve türüne göre yazma, yazışmayı başlatma, sürdürme ve sonlandırma ifadeleri (çevrim içi dahil), imzada adını kullanma ve yazma planı hazırlama; hepsi serbest yazılı üretim. |
| T.Y.3.2 | Yazılarında içerik oluşturabilme | 211 | yok |  | Bütün bileşenler (a–o) çocuğun kendi yazısını üretmesini ister: metni devam ettirme, tahmin ve çıkarım yazma, yazılarında karşılaştırma, sınıflandırma, zıt ve eş anlamlı sözcük, benzetme ve örnek kullanma, kendi ifadeleriyle yazma, yönerge, öneri, istek ve şikâyet yazma, bilginin kaynağını yazma, yazılarını sunma ve neden-sonuç yazma; serbest yazılı üretim. |
| T.Y.3.3 | Yazma kurallarını uygulayabilme | 212 | kısmi | `drag_match`, `syllable_build` | d) kısaltmalara gelen ekleri kuralına uygun yazma (kesme işareti ve eki doğru karoyla ekleme) ve f) büyük harfleri kuralına uygun yazma drag_match ile, e) pekiştirmeli sözcükleri doğru yazma syllable_build ile oynanabilir; a) plana uygun yazma, b) sözcükleri yerinde kullanma, c) deyim ve atasözü kullanma, ç) mesajı açık ifade etme ve g) noktalama işaretlerini kullanma çocuğun kendi yazısında gerçekleşir, serbest yazılı üretim. |
| T.Y.3.4 | Yazma sürecine etki eden durumları gözden geçirebilme | 212 | yok |  | a) yazma yapacağı gerçek ortamın uygunluğunu gözden geçirme çocuğun kendi ortamına bağlı; b) ortamın duygu, düşünce ve davranışlarına etkisini açıklama serbest sözlü üretim. |

### Hayat Bilgisi

#### 1. BEN VE OKULUM

`g3.hayat_bilgisi.t01` · işleniş sırası 1 · programda 3 çıktı · PDF s. 61

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| HB.3.1.1 | Güçlü ve gelişime açık olduğu alanlara karar verebilme | 61 | yok |  | Bileşenler (a–e) çocuğun kendi güçlü ve gelişime açık alanlarına karar vermesi: amaç belirleme, kendisi hakkında bilgi toplama, seçenek oluşturma, denetleme, seçim ve yansıtma; doğru cevabı olmayan kişisel karar ve öz değerlendirme (aynı karar süreci MAT.2.3.6’da oyunun sunduğu bir problemle oynanabilir, burada konu çocuğun kendisi). |
| HB.3.1.2 | Okuldaki hak ve sorumluluklarına uygun davranabilme | 61 | kısmi | `sort_bins`, `scenario` | Süreç bileşeni yok. Okuldaki hakları ve sorumlulukları ayırma sort_bins, verilen durumlarda hak ve sorumluluğa uygun davranışı seçme scenario ile oynanabilir; okulda uygun davranma, görüşme ve görev paylaşımı okul etkinliği. |
| HB.3.1.3 | Çocuk haklarını tanıtmak için fikirlerini eyleme dönüştürebilme | 61 | yok |  | Bileşenler (a–c) çocuk haklarını tanıtmak için plan yapma, planı uygulama ve değerlendirme; gerçek proje etkinliği. |

#### 2. SAĞLIĞIM VE GÜVENLİĞİM

`g3.hayat_bilgisi.t02` · işleniş sırası 2 · programda 3 çıktı · PDF s. 65

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| HB.3.2.1 | Sağlığını korumaya yönelik davranışlarını düzenleyebilme | 65 | kısmi | `sort_bins`, `scenario` | Süreç bileşeni yok. Sağlığı koruyan ve bozan davranışları (uyku düzeni, beslenme, mevsime göre giyinme, temizlik) ayırma sort_bins, verilen durumda doğru davranışı seçme scenario ile oynanabilir; kendi davranışlarını izleyip düzenleme (günlük tutma) gerçek yaşamda gerçekleşir. |
| HB.3.2.2 | Güvenliğini tehdit eden bir durumla karşılaştığında yapılması gerekenleri sorgulayabilme | 65 | kısmi | `listen_find`, `sort_bins`, `scenario` | a) güvenliğini tehdit eden durumları tanımlama, verilen görsel ve olaylar arasından tehdit oluşturanları seçme listen_find ile; ç) oyunda verilen bilgilerin doğruluğunu değerlendirme sort_bins ile; d) yapılması gerekenlere ilişkin çıkarımı seçme scenario ile oynanabilir; b) soru sorma sözlü üretim, c) bilgi toplama gerçek araştırma. |
| HB.3.2.3 | Trafik kurallarına uymanın önemine ilişkin özgün ürünler sentezleyebilme | 65 | kısmi | `scenario`, `drag_match` | a) trafik kurallarına uymanın önemini belirleme scenario ile, b) kurala uyma ile güvenlik arasında ilişki kurma (kural–sonuç eşleme) drag_match ile oynanabilir; c) özgün ürün oluşturma serbest üretim. |

#### 3. AİLEM VE TOPLUM

`g3.hayat_bilgisi.t03` · işleniş sırası 3 · programda 3 çıktı · PDF s. 69

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| HB.3.3.1 | Aile ve toplum arasındaki ilişkiyi çözümleyebilme | 69 | tam | `sort_bins`, `drag_match` | a) aile ve toplumun özelliklerini belirleme sort_bins ile, b) aile ile toplum arasındaki ilişkiyi belirleme drag_match ile çalışılır. |
| HB.3.3.2 | Yardıma ihtiyacı olan bireylerin yaşamını kolaylaştırmak için fikirlerini eyleme dönüştürebilme | 69 | yok |  | Bileşenler (a–c) yardıma ihtiyacı olan bireylerin yaşamını kolaylaştırmak için plan yapma, planı uygulama ve değerlendirme; gerçek proje etkinliği. |
| HB.3.3.3 | Mesleklerin toplumsal yaşamdaki önemini yorumlayabilme | 69 | kısmi | `story` | a) mesleklerin toplumsal yaşamdaki önemine ilişkin verilen örnekleri inceleme story ile oynanabilir; b) örnekleri özgün örneklere dönüştürme ve c) kendi cümleleriyle ifade etme serbest üretim. |

#### 4. YAŞADIĞIM YER VE ÜLKEM

`g3.hayat_bilgisi.t04` · işleniş sırası 4 · programda 4 çıktı · PDF s. 73

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| HB.3.4.1 | Yakın çevresindeki tarihî mekân ve doğal güzelliklerin korunmasının önemini fark edebilme | 73 | tam | `scenario`, `sort_bins` | Süreç bileşeni yok. Tarihî mekân ve doğal güzellikleri koruyan ve zarar veren davranışları ayırma sort_bins, korumanın önemini örnek olaylarda fark edip doğru seçeneği seçme scenario ile çalışılır. |
| HB.3.4.2 | Ülkemizin yönetim şekli ile ilgili kaynaklardan bilgi toplayabilme | 73 | kısmi | `scenario` | a) ülkemizin yönetim şekli hakkında bilgi toplanacak uygun kaynakları belirleme scenario ile oynanabilir; b) kaynaklardan bilgi bulma ve ç) kaydetme gerçek araştırma, c) kaynakların uygunluğunu açıklama serbest üretim. |
| HB.3.4.3 | Mustafa Kemal Atatürk’ün kişilik özelliklerini çözümleyebilme | 73 | tam | `story`, `drag_match` | a) Atatürk’ün kişilik özelliklerini ve başarılarını belirleme story ile, b) kişilik özellikleri ile başarıları arasında ilişki kurma drag_match ile çalışılır. |
| HB.3.4.4 | Millî birlik ve beraberliğimizin ülkemize katkılarını açıklayabilme | 73 | kısmi | `sort_bins`, `scenario` | Süreç bileşeni yok. Millî birlik ve beraberliği güçlendiren olayları (millî bayramlar, millî takım müsabakaları, afette dayanışma) ayırma sort_bins, birlikte hareket etmenin sonucuna ilişkin çıkarımı seçme scenario ile oynanabilir; katkıları açıklama serbest sözlü üretim. |

#### 5. DOĞA VE ÇEVRE

`g3.hayat_bilgisi.t05` · işleniş sırası 5 · programda 4 çıktı · PDF s. 77

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| HB.3.5.1 | Doğadaki varlıkların insan yaşamı için önemini yorumlayabilme | 77 | kısmi | `story` | a) doğadaki varlıkların insan yaşamı için önemine ilişkin verilen örnekleri inceleme story ile oynanabilir; b) örnekleri özgün örneklere dönüştürme ve c) kendi cümleleriyle ifade etme serbest üretim. |
| HB.3.5.2 | Krokiyi kullanarak bulunduğu yerin konumunu algılayabilme | 77 | kısmi | `listen_find` | a) krokiyi kullanarak konum belirleme genel bir beceri olarak oyunun verdiği krokide (“buradasın” işaretiyle) listen_find ile oynanabilir; b) bulunduğu yerin konumsal görselleştirmesini (kendi çevresinin krokisini) yapma çocuğun kendi çevresine bağlı, c) konumsal özellikleri özetleme serbest üretim. |
| HB.3.5.3 | Afetlere yönelik yapılması gerekenleri sınıflandırabilme | 77 | tam | `sort_bins`, `drag_match` | a) ölçütleri afet öncesi, afet anı ve afet sonrası olarak belirleme, b) ayrıştırma ve c) tasnif etme sort_bins ile, ç) etiketleme drag_match ile çalışılır. |
| HB.3.5.4 | Çevresel sürdürülebilirliğe yönelik kaynaklardan bilgi toplayabilme | 77 | kısmi | `scenario` | a) çevresel sürdürülebilirlik hakkında bilgi toplanacak uygun kaynakları belirleme scenario ile oynanabilir; b) kaynaklardan bilgi bulma ve ç) kaydetme gerçek araştırma, c) kaynakların uygunluğunu açıklama serbest üretim. |

#### 6. BİLİM, TEKNOLOJİ VE SANAT

`g3.hayat_bilgisi.t06` · işleniş sırası 6 · programda 3 çıktı · PDF s. 82

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| HB.3.6.1 | Bilimsel gelişmelerin günlük yaşama etkisini yorumlayabilme | 82 | kısmi | `story` | a) bilimsel gelişmelerin günlük yaşama etkisine ilişkin verilen örnekleri inceleme story ile oynanabilir; b) örnekleri özgün örneklere dönüştürme ve c) kendi cümleleriyle ifade etme serbest üretim. |
| HB.3.6.2 | Teknolojik gelişmelerin günlük yaşama etkisini çözümleyebilme | 82 | tam | `sort_bins`, `drag_match` | a) teknolojik gelişmelerin günlük yaşama etkisini belirleme sort_bins ile, b) gelişme ile günlük yaşam arasında ilişki kurma (eski ve yeni araç ile etkisini eşleme) drag_match ile çalışılır. |
| HB.3.6.3 | Sanatçıların sanata katkılarına yönelik kaynaklardan bilgi toplayabilme | 82 | kısmi | `scenario` | a) sanatçıların katkılarına ilişkin bilgi toplanacak uygun kaynakları belirleme scenario ile oynanabilir; b) kaynaklardan bilgi bulma ve ç) kaydetme gerçek araştırma, c) kaynakların uygunluğunu açıklama serbest üretim. |

### Fen Bilimleri

#### 1. BİLİMSEL KEŞİF YOLCULUĞU

`g3.fen.t01` · işleniş sırası 1 · programda 2 çıktı · PDF s. 19

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| FB.3.1.1 | Bilimsel bilgiye ulaşma yollarını sorgulayabilme | 19 | kısmi | `scenario`, `sort_bins` | ç–d) bilgiye ulaşma yollarının uygunluğunu değerlendirme ve oyunda verilen bilgilerden çıkarım seçme oynanabilir; a–c) merak ettiği konuyu belirleme, soru sorma ve bilgi toplama gerçek araştırma ve sözlü etkinlik (veli etkinliği önerilebilir). |
| FB.3.1.2 | Bilim insanlarının özelliklerini genelleyebilme | 19 | kısmi | `story`, `sort_bins`, `listen_find` | b–ç) hikâyede tanıtılan bilim insanlarının ortak ve farklı özelliklerini ayırma ve sesli önermeler arasından seçme oynanabilir; a) bilim insanları hakkında bilgi toplama araştırma etkinliği. |

#### 2. CANLILAR DÜNYASINA YOLCULUK

`g3.fen.t02` · işleniş sırası 2 · programda 3 çıktı · PDF s. 22

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| FB.3.2.1 | Canlıları; mikroskopla görülebilen canlılar, mantarlar, bitkiler ve hayvanlar olarak sınıflandırabilme | 22 | tam | `sort_bins`, `drag_match`, `listen_find` |  |
| FB.3.2.2 | Canlıların çevrelerini farklı yollarla algılamaları konusunda bilimsel çıkarım yapabilme | 22 | kısmi | `drag_match`, `listen_find`, `sort_bins` | a) duyu organlarını işlevleri ve algılama biçimleriyle eşleştirme drag_match ve listen_find ile, c) canlıların algılama biçimlerine ilişkin oyunda verilen verileri (hangi canlı neyi nasıl algılar tablosu) yorumlayıp değerlendirme sort_bins ile oynanabilir; b) duyu organlarıyla veri toplayıp kaydetme gerçek gözlem (ev etkinliği önerilebilir). |
| FB.3.2.3 | Canlıların yaşam döngülerini açıklamada tümevarımsal akıl yürütebilme | 22 | tam | `sequence`, `pattern`, `listen_find` | b) genelleme yeni bir canlının döngüsünü sıralama ve sesli seçenekler arasından seçmeyle çalışılır. |

#### 3. YER BİLİMCİLER İŞ BAŞINDA

`g3.fen.t03` · işleniş sırası 3 · programda 2 çıktı · PDF s. 26

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| FB.3.3.1 | Kayaçlar, madenler ve mineraller ile ilgili tümdengelimsel akıl yürütebilme | 26 | tam | `listen_find`, `drag_match`, `sort_bins` | c) genelden özele çıkarım sesli seçenekler arasından seçilir. |
| FB.3.3.2 | Fosil oluşumu ile ilgili bilgileri sentezleyebilme | 26 | tam | `sequence`, `drag_match` |  |

#### 4. MADDEYİ TANIYALIM, KARIŞTIRIP AYIRALIM

`g3.fen.t04` · işleniş sırası 4 · programda 3 çıktı · PDF s. 29

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| FB.3.4.1 | Çevresindeki maddeleri hâllerine göre sınıflandırabilme | 29 | tam | `sort_bins`, `drag_match`, `listen_find` | a) maddelerin niteliklerini tanımlama, gösterilen maddeye ait nitelikleri (sert, akışkan, kabın şeklini alır vb.) sesli nitelik kartları arasından seçmektir; tanım yapma değildir. |
| FB.3.4.2 | Günlük yaşamda karşılaştığı karışımların ayrılmasında kullanılabilecek uygun yöntemleri kullanarak deney yapabilme | 29 | kısmi | `scenario`, `drag_match` | Yalnızca a)’nın karışıma uygun ayırma yöntemini (mıknatıs, süzme, eleme) seçme kısmı oynanabilir; deneyi tasarlama üretimdir. b) ölçme ve veri analizi bileşeninin çekirdeği gerçek deneyde ölçmedir (veri analizi kısmı verilen ölçümlerle çalışılabilir ama bileşen ölçmeyi ister). |
| FB.3.4.3 | Atıkların ayrıştırılmasına ilişkin problem çözebilme | 29 | kısmi | `scenario`, `sort_bins` | c) oyunda verilen veriye (kutulardaki karışık atıklar) dayalı çözüm önerisini tahmin etme scenario ile; ç) önermeler üzerinden akıl yürütme scenario ile ve önerilen kutu düzenini atıkları ayırarak sınama sort_bins ile oynanabilir; a) problemi yapılandırma ve b) özetleme serbest üretim, d) kendi çözümüne yönelik yansıtma ve değerlendirme öz değerlendirme. |

#### 5. HAREKETİ KEŞFEDİYORUM

`g3.fen.t05` · işleniş sırası 5 · programda 2 çıktı · PDF s. 33

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| FB.3.5.1 | Varlıkların hareket durumlarını gözleme dayalı tahmin edebilme | 33 | kısmi | `sort_bins`, `scenario`, `listen_find` | b–c) animasyonla gösterilen varlıkların hareket durumu hakkında çıkarım ve sonuç tahmini oynanabilir; a) kendi gözlem ve deneyimlerini ilişkilendirme gerçek gözlem ister. |
| FB.3.5.2 | Kuvvetin varlıklar üzerindeki etkilerini bilimsel gözleme dayalı tahmin edebilme | 33 | tam | `scenario`, `sort_bins` | a) nedene ilişkin önermeyi sesli seçenekler arasından seçme scenario ile ve durumları nedenine göre (itme, çekme) ayırma sort_bins ile; b) oyunda gösterilen gözleme (animasyon) dayalı önermeleri karşılaştırma ve c) bu gözlem verisinden sonuç çıkarma scenario ile; ç) gözlemlenmemiş durumda tahmin ve d) tahminin geçerliliğini gösterilen sonuçla sorgulama scenario ile çalışılır. |

#### 6. YAŞAMIMIZI KOLAYLAŞTIRAN ELEKTRİK

`g3.fen.t06` · işleniş sırası 6 · programda 3 çıktı · PDF s. 37

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| FB.3.6.1 | Bazı araç gerecin elektrikli olduğuna ilişkin bilimsel çıkarım yapabilme | 37 | kısmi | `sort_bins`, `listen_find` | a) araç gereçlerin niteliklerini tanımlama ve elektrikli olanları ayırma listen_find ve sort_bins ile, c) elektrikli araç gereçlerle ilgili oyunda verilen verileri değerlendirme sort_bins ile oynanabilir; b) evdeki araç gereçlerle ilgili veri toplayıp kaydetme gerçek dünya etkinliği (ev etkinliği önerilebilir). |
| FB.3.6.2 | Elektrikli araç gerecin güvenli kullanımı ile ilgili eleştirel düşünebilme | 37 | kısmi | `scenario`, `sort_bins` | a–b) verilen güvenlik durumlarını sorgulama ve güvenli davranışı seçme oynanabilir; c) çıkarımları yansıtma sözlü etkinlik. |
| FB.3.6.3 | Elektriği tasarruflu kullanma konusunda bilimsel veriye dayalı tahmin edebilme | 37 | kısmi | `scenario`, `sort_bins`, `count_choose` | a) tasarruflu ve savurgan davranışları ayırma sort_bins ve veriye dayalı önermeyi seçme scenario ile; c) oyunda verilen tüketim verileriyle hesaplayarak tahmin etme count_choose ile; ç) tahminin geçerliliğini gösterilen sonuçla sorgulama scenario ile oynanabilir; b) önermelerini ölçüm verisiyle gerekçelendirme serbest üretim (gerekçe açıklamadır). |

#### 7. TOPRAĞI TANIYORUM, TARIMI KEŞFEDİYORUM

`g3.fen.t07` · işleniş sırası 7 · programda 2 çıktı · PDF s. 41

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| FB.3.7.1 | Toprak oluşumunu ve yapısını bilimsel olarak gözlemleyebilme | 41 | kısmi | `sequence`, `listen_find` | a) toprağın oluşum aşamalarını sıralama ve yapısındaki bileşenleri tanıma oynanabilir; b–c) toprak örneği inceleyip veri toplama, kaydetme ve açıklama gerçek gözlem ve sözlü etkinlik (ev etkinliği önerilebilir). |
| FB.3.7.2 | Bir bitkinin yetişmesi için gerekenleri genelleyebilme | 41 | kısmi | `sort_bins`, `drag_match`, `sequence` | b–c) bitkilerin ortak ve farklı ihtiyaçlarını belirleme sort_bins ve drag_match ile, ç) yapılması gerekenleri sıralama sequence ile oynanabilir; a) çevredeki tarım ürünlerini araştırıp bilgi toplama gerçek dünya etkinliği. |

#### 8. CANLILARIN YAŞAM ALANLARINA YOLCULUK

`g3.fen.t08` · işleniş sırası 8 · programda 3 çıktı · PDF s. 45

| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |
|---|---|---|---|---|---|
| FB.3.8.1 | Canlıların yaşam alanlarının özelliklerini belirlemeye yönelik kanıt kullanabilme | 45 | kısmi | `sort_bins` | b) oyunda verilen gözlem kartlarından yaşam alanlarına ilişkin veri seti (tablo) oluşturma sort_bins ile oynanabilir; a) yaşam alanından veri toplayıp kaydetme gerçek gözlem (bahçe ya da park gözlemi veli etkinliği olarak önerilebilir), c) veriye dayalı açıklama yapma serbest üretim. |
| FB.3.8.2 | Yaşam alanındaki canlı çeşitliliğini operasyonel olarak tanımlayabilme | 45 | kısmi | `drag_match`, `listen_find` | a) yaşam alanının özelliklerini tanımlama, gösterilen yaşam alanına ait özellikleri sesli kartlar arasından seçerek oynanabilir; b) yaşam alanındaki canlı çeşitliliğini ölçme gerçek gözlem, c) canlı çeşitliliğinin tanımını yapma serbest üretim. |
| FB.3.8.3 | Yaşam alanlarının korunması için yapılacakları sorgulayabilme | 45 | kısmi | `scenario`, `sort_bins` | ç–d) oyunda verilen bilgilerin doğruluğunu değerlendirme ve yaşam alanını korumaya yönelik çıkarım seçme oynanabilir; a–c) merak ettiği konuyu belirleme, soru sorma ve bilgi toplama gerçek araştırma ve sözlü etkinlik. |

## Önerilen yeni şablonlar

Spec §3.7'deki 14 şablonda karşılığı olmayan mekanikler (karar için bkz. spec "Açık sorular (Faz 2)").

| Öneri | Çıktı sayısı | Kodlar |
|---|---|---|
| `estimate_then_count` | 7 | MAT.1.1.8, MAT.2.1.6, MAT.3.1.8, MAT.3.1.14, MAT.3.2.3, MAT.3.3.4, MAT.3.3.5 |

## Sahibe notlar

Açık sorular ve alınan kararlar: `docs/superpowers/specs/2026-10-04-bilgi-adasi-design.md` içindeki "Açık sorular (Faz 2)" bölümü.

### Elle doğrulanan çıktılar (`manual_note`)

Yok.

### Tablo ve tema gövdesi sayısı uyuşmayan temalar (`declared_count_note`)

Yok.
