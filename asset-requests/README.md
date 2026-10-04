# Asset İstekleri

Bu klasör, oyunun ihtiyaç duyduğu görsel ve sesleri **sahibin üretmesi** için hazırlanmış istek dosyalarını içerir. Her dosya bir "parti"dir.

## Nasıl çalışır
1. Bir parti dosyasını aç (ör. `001-bilge-maskot.md`).
2. Görseller için her promptu **Nano Banana** (Gemini) ile üret. Sesler için dosyadaki talimatları izle.
3. Üretilen dosyayı tabloda yazan **yola, aynı isimle** koy. Sprite'ların arka planını sil.
4. Commit edip push et. Oyun dosyayı otomatik tanır; o ana kadar yer tutucu ve cihaz sesi kullanılır.
5. Partiyi bitirince aşağıdaki durum tablosunu güncelle.

Kurallar: [`docs/assets/style-guide.md`](../docs/assets/style-guide.md) · [`docs/assets/naming.md`](../docs/assets/naming.md)

## Durum

| Parti | Konu | Öncelik | Durum |
|---|---|---|---|
| 001 | Bilge maskot: karakter sayfası + 9 poz | En yüksek | ⏳ Bekliyor |
| 002 | Ada haritası, bölge arka planları, ikonlar, duraklar | Yüksek | ⏳ Bekliyor |
| 003 | Profil avatarları + arayüz ikonları | Yüksek | ⏳ Bekliyor |
| 004 | Sayma ve eşleştirme nesneleri (28 nesne) | Yüksek | ⏳ Bekliyor |
| 005 | Genel seslendirme (Gemini TTS) + sayılar 0–20 | Yüksek | ⏳ Bekliyor |
| 006 | Müzik (6 parça) + ses efektleri (12) | Orta | ⏳ Bekliyor |
| 007 | 1. sınıf Matematik ünite 1 seslendirmesi (32 satır) + `vo.genel.takma_ad` | Yüksek | ⏳ Bekliyor |
| 008 | 1. sınıf Matematik ünite 1 çıkartmaları (6) + `ui.replay` ikonu | Orta | ⏳ Bekliyor |
| 009 | Oturum sonu: gece zemini (`ui.bg_night`) + "büyüğünü çağır" ikonu (`ui.call_grownup`) | Orta | ⏳ Bekliyor |
| 010 | Faz 3 şablonları: 5 madeni para + 6 banknot (`item.para.*`), bütün pizza (`item.yiyecek.pizza`), saat kadranı (`ui.clock_face`). 1 kuruş iptal (Faz 3b) | Orta | ⏳ Bekliyor |
| 011 | Faz 3b `grid` şablonu: gezgin karakter (`char.grid.gezgin`), hedef bayrağı (`ui.grid.hedef`), duvar taşı (`ui.grid.duvar`) | Orta | ⏳ Bekliyor |
| 012 | Faz 3b seslendirmesi: tahmin modu yönergeleri (`vo.tahmin.*`, 4) + 1. sınıf tam ve yarım saatler (`vo.saat.*`, 24) | Orta | ⏳ Bekliyor |
| 015 | Faz 4a Türkçe şablonları: iz kalemi (`ui.trace_pencil`), sonraki sayfa oku (`ui.page_next`), kitap (`ui.book`) | Orta | ⏳ Bekliyor |
| 016 | Faz 4a Türkçe şablonları: sayfa çevirme sesi (`sfx.page_turn`) | Düşük | ⏳ Bekliyor |
| 023 | Ağaç Evi süs eşyaları (12 `decor.*`) | Orta | ⏳ Bekliyor |
| 024 | Faz 7a seslendirmesi: Tekrar Bulutu girişi + Ağaç Evi (3 satır) | Orta | ⏳ Bekliyor |
| 040 | 2. sınıf Matematik: geometrik cisim ve şekiller (`item.cisim.*`, `item.sekil.*`; 1. ve 3. sınıfla ortak) | Yüksek | ⏳ Bekliyor |
| 041 | 2. sınıf Matematik: cisim örneği nesneler, yapılar ve modeller (`item.nesne.*`, `item.yapi.*`, `item.model.*`) | Yüksek | ⏳ Bekliyor |
| 042 | 2. sınıf Matematik: sıvı ve ölçme birimleri, sahneler, simetri nesneleri, kutu simgeleri | Orta | ⏳ Bekliyor |
| 043 | 2. sınıf Matematik durak çıkartmaları (42 `st.matematik.g2_*`) | Orta | ⏳ Bekliyor |
| 044 | 2. sınıf Matematik: sayılar 21–100 + kart sesleri (`vo.sayi.*`, `vo.mat2.*`) | Yüksek | ⏳ Bekliyor |
| 045 | 2. sınıf Matematik ünite 1–6 seslendirmesi (`vo.g2.matematik.*`) | Yüksek | ⏳ Bekliyor |
| 090 | Fen 3 görselleri, ünite 1–3 (69 `item.fen.*`: canlılar, duyular, yaşam döngüleri, kayaçlar, fosiller) | Orta | ⏳ Bekliyor |
| 091 | Fen 3 görselleri, ünite 4–6 (64 `item.fen.*`: maddeler, karışımlar, atıklar, hareket, elektrikli araç gereç, davranış kartları) | Orta | ⏳ Bekliyor |
| 092 | Fen 3 görselleri, ünite 7–8 (39 `item.fen.*`: toprak, bitki yetiştirme, yaşam alanları) | Orta | ⏳ Bekliyor |
| 093 | Fen 3 durum sahneleri (19 `item.fen.sahne.*`, 16:9) | Orta | ⏳ Bekliyor |
| 094 | Fen 3 çıkartmaları (20 `st.fen.*`) | Orta | ⏳ Bekliyor |
| 095 | Fen 3 seslendirmesi, ünite 1–4 (77 satır) | Orta | ⏳ Bekliyor |
| 096 | Fen 3 seslendirmesi, ünite 5–8 + ortak kart sesleri (164 satır) | Orta | ⏳ Bekliyor |

Önerilen sıra: 001 → 003 → 002 → 004 → 005 → 007 → 006 → 008 → 009 → 010 → 011 → 012 → 015 → 016 → 023 → 024 → 044 → 040 → 041 → 045 → 042 → 043 → 090 → 093 → 091 → 092 → 094 → 095 → 096. Bilge karakter sayfası diğer bütün partilerin stil referansıdır.

## Geliştiriciler (agent) için
- Yeni bir içerik ünitesi eklendiğinde eksik asset'ler için `tools/missing_assets.gd` çalıştırılır ve sıradaki numarayla yeni bir parti dosyası açılır.
- Her prompt `docs/assets/style-guide.md`'deki sabit bloklardan biriyle (STYLE_SPRITE / STYLE_SCENE / STYLE_ICON) **tam metin olarak** biter ya da başlar; sahip kopyala-yapıştır yapabilmelidir.
- Görsellerde asla metin, harf ya da rakam istenmez.
- Dosya biçimi önceki partilerle aynı kalır: özet tablo + numaralı promptlar + teslim kontrol listesi.
