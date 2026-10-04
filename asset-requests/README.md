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
| 060 | 1. sınıf Türkçe: sözcük ve nesne görselleri (70 `item.*`) | Yüksek | ⏳ Bekliyor |
| 061 | 1. sınıf Türkçe: hikâye, cümle, durum ve davranış sahneleri (96 `item.*`) | Orta | ⏳ Bekliyor |
| 062 | 1. sınıf Türkçe: kutu simgeleri, duygu yüzleri, ses simgeleri (13 `item.*`) | Orta | ⏳ Bekliyor |
| 063 | 1. sınıf Türkçe çıkartmaları (65 `st.turkce.g1_*`) | Düşük | ⏳ Bekliyor |
| 064 | 1. sınıf Türkçe: harf sesleri, heceler, sözcükler, ses kaynakları (77 satır) | En yüksek | ⏳ Bekliyor |
| 065 | 1. sınıf Türkçe ünite 1–5 seslendirmesi (247 satır) | Yüksek | ⏳ Bekliyor |
| 066 | 1. sınıf Türkçe ünite 6–9 seslendirmesi (219 satır) | Orta | ⏳ Bekliyor |

Önerilen sıra: 001 → 003 → 002 → 004 → 005 → 007 → 006 → 008 → 009 → 010 → 011 → 012 → 015 → 016 → 023 → 024 → 064 → 060 → 065 → 061 → 062 → 066 → 063. Bilge karakter sayfası diğer bütün partilerin stil referansıdır.

## Geliştiriciler (agent) için
- Yeni bir içerik ünitesi eklendiğinde eksik asset'ler için `tools/missing_assets.gd` çalıştırılır ve sıradaki numarayla yeni bir parti dosyası açılır.
- Her prompt `docs/assets/style-guide.md`'deki sabit bloklardan biriyle (STYLE_SPRITE / STYLE_SCENE / STYLE_ICON) **tam metin olarak** biter ya da başlar; sahip kopyala-yapıştır yapabilmelidir.
- Görsellerde asla metin, harf ya da rakam istenmez.
- Dosya biçimi önceki partilerle aynı kalır: özet tablo + numaralı promptlar + teslim kontrol listesi.
