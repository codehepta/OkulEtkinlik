# Müfredat kaynakları (TYMM resmi öğretim programları)

Bulut ortamının ağ politikası MEB alan adlarını engellediği için PDF'ler sahip tarafından indirilip repoya konmuştur (2026-10-04).

| Dosya | Ders | Kapsam | Sayfa | Resmi kaynak |
|---|---|---|---|---|
| `tymm-ilkokul-matematik.pdf` | İlkokul Matematik | 1–4. sınıf | 162 | https://tymm.meb.gov.tr/assets/pdf/ilkokul-matematik-dersi_20260902_111356_122.pdf |
| `tymm-ilkokul-turkce.pdf` | İlkokul Türkçe | 1–4. sınıf | 223 | https://tymm.meb.gov.tr/assets/pdf/ilkokul-turkce-dersi_20260902_111433_940.pdf |
| `tymm-hayat-bilgisi.pdf` | Hayat Bilgisi | 1–3. sınıf | 89 | https://tymm.meb.gov.tr/assets/pdf/hayat-bilgisi-dersi_20260902_111246_099.pdf |
| `tymm-fen-bilimleri.pdf` | Fen Bilimleri | 3–8. sınıf | 231 | https://tymm.meb.gov.tr/assets/pdf/fen-bilimleri-dersi_20260902_111309_119.pdf |

- Ders sayfası: https://tymm.meb.gov.tr/ogretim-programlari (Temel Eğitim → sınıf → ders)
- PDF dosya adlarındaki `20260902` damgası, MEB'in yayımladığı sürümü gösterir. Güncelleme olursa yeni PDF aynı yöntemle indirilip bu tablo güncellenir.

## Metin dökümleri
Her PDF'in yanındaki `.txt` dosyası `pypdf` ile çıkarılmış düz metindir. Sayfalar `===== SAYFA N =====` satırıyla ayrılır.
- Arama ve okuma için `.txt` kullanılır.
- `outcomes.json`'daki `source.page` alanı **PDF sayfa numarasıdır** (`.txt`'teki SAYFA N ile aynıdır, kitapçıkta basılı sayfa numarasıyla karışmasın).
- Tablolarda metin çıkarımı bozuk olabilir. Şüpheli durumda kodu ve metni PDF'in kendisinden doğrula.

## Not: 1. sınıf Matematik tema sırası
Programdaki tema sırasına göre 1. sınıf Matematik **1. teması `MAT.1.3. Nesnelerin Geometrisi (1)`**, 2. teması `MAT.1.1. Sayılar ve Nicelikler (1)` (bkz. `.txt` ~374. satır). Plan Task 16 "ilk ünite" diyor. Dikey dilim için hangi temanın kullanılacağı sahibin kararıdır; sahip yanıt verene kadar Task 16'nın içerik adımına başlanmaz.

## Lisans notu
Bu belgeler T.C. Millî Eğitim Bakanlığı'nın kamuya açık olarak yayımladığı resmi öğretim programlarıdır. Repoda yalnızca müfredat eşlemesinin kaynağı olarak tutulurlar; projenin MIT / CC BY lisansları bu dosyaları kapsamaz.
