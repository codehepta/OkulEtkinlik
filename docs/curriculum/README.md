# Müfredat verisi (Faz 2)

MEB Türkiye Yüzyılı Maarif Modeli (TYMM) öğretim programlarından çıkarılan, kod ve oyun eşlemesi için tek doğruluk kaynağı. Kapsam: Matematik, Türkçe ve Hayat Bilgisi 1–3. sınıf, Fen Bilimleri yalnızca 3. sınıf (toplam 220 öğrenme çıktısı, 70 tema).

| Dosya | İçerik |
|---|---|
| `outcomes.json` | Resmi öğrenme çıktıları: kod, metin, süreç bileşenleri, kaynak sayfası |
| `themes.json` | Resmi temalar ve programdaki işleniş sırası |
| `game_map.json` | Çıktı → oyun şablonu eşlemesi ve oynanabilirlik |
| `matrix.md` | Üç dosyadan **üretilmiş** okunur matris (elle düzenlenmez) |
| `sources/` | Resmi PDF'ler ve `.txt` dökümleri (bkz. `sources/README.md`) |

Kodlar resmi kaynaktan doğrulanır, uydurulmaz. Kapı testi (`tests/unit/test_curriculum_data.gd`) her kodu, metni ve süreç bileşenini `sources/*.txt` dökümüyle karşılaştırır.

## Veri sözleşmesi

### `outcomes.json`
Anahtar resmi koddur (sondaki nokta olmadan).
```json
"MAT.1.1.1": {
	"grade": 1,
	"subject": "matematik",
	"text": "<çıktı metni, dökümden birebir>",
	"printed_code": "MAT.1.1.1.",
	"steps": ["a) ...", "b) ..."],
	"themes": ["g1.matematik.t02"],
	"source": { "doc": "...", "file": "docs/curriculum/sources/....pdf", "page": 20, "url": "..." }
}
```
- `subject`: `matematik`, `turkce`, `hayat_bilgisi`, `fen` (ContentDB ile aynı).
- `steps`, kaynakta süreç bileşeni varsa bulunur (35 Hayat Bilgisi çıktısı dahil); harf etiketiyle (`"a) "`) dökümdeki gibi yazılır. Süreç bileşeni olmayan çıktıda alan yoktur.
- `themes`: çıktının geçtiği tema kimlikleri. Türkçede bir kod birden çok temada geçer.
- `source.page` PDF sayfa numarasıdır (`.txt`'teki `===== SAYFA N =====`), basılı sayfa numarası değil. Türkçede kanonik kaynak EK 1'dir (PDF s. 202 ve sonrası).
- Kaçış (yalnızca döküm bozuksa): `"text_check": "manual"` ve boş olmayan `"manual_note"` (PDF'te nasıl doğrulandığı). Bu durumda yalnızca kodun sayfada geçmesi denetlenir; `matrix.md` bu kayıtları "Sahibe notlar"da listeler. Şu an böyle kayıt yoktur.

### `themes.json`
Anahtar `g<sınıf>.<ders>.t<NN>`, NN = programdaki işleniş sırası.
```json
"g1.matematik.t02": {
	"grade": 1,
	"subject": "matematik",
	"order": 2,
	"official": "MAT.1.1. Sayılar ve Nicelikler (1)",
	"declared_count": 7,
	"outcomes": ["MAT.1.1.1", "..."],
	"source": { "file": "docs/curriculum/sources/tymm-ilkokul-matematik.pdf", "page": 20 }
}
```
- `order` ve `declared_count` programın tema/süre tablosundan alınır. Pekiştirme ya da hatırlatma haftası ve okul temelli planlama tema değildir.
- `outcomes` temanın sayfalarında listelenen kodlardır; sırası programdaki sıradır. `source.page` temanın ilk öğrenme çıktısı sayfasıdır.
- Tablo sayısı ile tema gövdesi uyuşmazsa sayı düzeltilmez; `"declared_count_note"` alanına açıklama yazılır ve sahibe bildirilir. Şu an böyle tema yoktur.
- Matematik temaları parçalıdır (`MAT.1.1. ... (1)`, `(2)`); her parça ayrı kayıttır.

### `game_map.json`
Anahtar koddur; her çıktının kaydı vardır.
```json
"MAT.1.1.4": {
	"fit": "partial",
	"templates": ["drag_match"],
	"proposed": ["compare_groups"],
	"note": "a) iki grubu karşılaştırma oynanabilir; b–c) benzerlik/farklılık listeleme sözlü etkinlik."
}
```
- `fit`: `full` (bütün süreç bileşenleri tek başına dokunmatik oyunla çalışılabilir), `partial` (bir kısmı; hangileri olduğu `note`'ta harfle yazılır), `none` (konuşma, kâğıda yazma, grup ya da beden etkinliği, gerçek dünyada gözlem gerektirir).
- `templates`: spec §3.7'deki 14 şablon kimliğinin alt kümesi. `full`/`partial` ise boş olamaz, `none` ise boş olmalıdır.
- `proposed` (isteğe bağlı): spec'te olmayan, gereken yeni mekanik (snake_case).
- `note` Türkçe ve kısadır; `partial` ve `none` için zorunludur.
- Eşleme kuralının ayrıntısı ve sahip kararı bekleyen konular: spec "Açık sorular (Faz 2)".

### Biçim
JSON dosyaları tab girintili, UTF-8'dir; metinler dökümden karakteri karakterine kopyalanır (`’`, `“ ”`, `â` dahil).

## MEB yeni PDF yayımlayınca

1. Yeni PDF'i `sources/` altına koy, `sources/README.md` tablosunu (dosya adı damgası, sayfa sayısı, URL) güncelle. Gerekirse `tools/curriculum/curriculum_check.gd` içindeki `SUBJECT_SOURCES` yollarını ve URL'lerini düzelt.
2. `.txt` dökümünü `pypdf` ile yeniden çıkar (sayfalar `===== SAYFA N =====` ile ayrılır). Tablolar bozuksa şüpheli yerleri PDF'ten doğrula.
3. Taslak çıkar: `godot --headless --path . -s res://tools/extract_outcomes.gd -- <ders> <ilk_sayfa> <son_sayfa>`. Türkçe için taslak, programın EK 1 bölümünden (bütün süreç bileşenlerinin listelendiği yer) çıkarılır: `-- turkce 202 <EK 1'in son sayfası>`. Sonuç `build/curriculum/<ders>.draft.json` olur (git'e girmez).
4. Taslağı `outcomes.json` ile karşılaştırıp farkları tek tek gözden geçir: yeni, silinen ve metni değişen çıktılar. Sayfa numaralarını, `themes.json`'daki sırayı ve sayıları (`declared_count`) güncelle. Kodları taslaktan körü körüne alma, dökümden doğrula.
5. Değişen ya da yeni çıktılar için `game_map.json` kayıtlarını eşleme kuralına göre güncelle.
6. Matrisi üret: `godot --headless --path . -s res://tools/curriculum_report.gd`. Kapı testi `test_matrix_md_is_up_to_date` ile `matrix.md`'nin güncelliğini de denetlediği için matris, kapı testinden önce üretilir.
7. Kapı testini çalıştır: `godot --headless --path . -s addons/gut/gut_cmdln.gd -gselect=test_curriculum_data -gexit`. `EXPECTED_COUNTS` (programdaki TOPLAM satırları) gerekiyorsa aynı değişiklikte güncellenir.
8. Tam paketi çalıştır ve `outcomes.json`, `themes.json`, `game_map.json`, `matrix.md` dosyalarını birlikte commit et.
