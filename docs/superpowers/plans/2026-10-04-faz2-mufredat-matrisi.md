# Faz 2 — Müfredat Matrisi: Uygulama Planı

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 1–3. sınıf Matematik, Türkçe, Hayat Bilgisi ve 3. sınıf Fen Bilimleri öğretim programlarının bütün öğrenme çıktılarını resmi kod, metin, süreç bileşenleri, tema ve PDF sayfasıyla `docs/curriculum/` altına makine tarafından denetlenebilir biçimde çıkarmak ve her çıktıyı oyun şablonlarına eşlemek.

**Architecture:** Resmi veri (`outcomes.json`, `themes.json`) ile tasarım kararı (`game_map.json`) ayrı dosyalarda tutulur. Böylece MEB PDF'i güncellenince resmi veri yeniden çıkarılır, eşleme kararları ezilmez. `tools/curriculum/` altındaki saf denetleyici, her kodun ve metnin belirtilen PDF sayfasının metin dökümünde birebir geçtiğini GUT testinde doğrular. Uydurma ya da yanlış kopyalanmış kod CI'dan geçemez. İnsan için okunur matris (`matrix.md`) bu üç dosyadan üretilir; ayrı bir test, commit edilmiş `matrix.md`'nin güncel olduğunu denetler.

**Tech Stack:** Godot 4.7.1/4.7.2 headless, GDScript (statik tipli), GUT 9.7.x.

**Spec:** `docs/superpowers/specs/2026-10-04-bilgi-adasi-design.md` (§2 kaynak kuralı, §3.7 şablonlar, §4.3 içerik modeli, §8 Faz 2). Ayrıca `CLAUDE.md` ve `docs/curriculum/sources/README.md`.

## Global Constraints

- **Kod uydurma yok.** Her kod, metin ve süreç bileşeni `docs/curriculum/sources/*.txt` dökümünden **karakteri karakterine** kopyalanır (tırnak, kesme işareti ve şapka dahil: `’`, `“ ”`, `â`). Doğrulanamayan çıktı dosyaya girmez, sahibe bildirilir.
- `source.page` = **PDF sayfa numarası** (`.txt`'teki `===== SAYFA N =====`), kitapçıkta basılı sayfa numarası değil.
- Kapsam: Matematik, Türkçe ve Hayat Bilgisi için **1–3. sınıflar**, Fen Bilimleri için **yalnızca 3. sınıf**. `MAT.4.*`, `T.?.4.*`, `FB.4.*` ve sonrası **girmez**.
- Ders kimlikleri: `matematik`, `turkce`, `hayat_bilgisi`, `fen` (ContentDB ile aynı).
- Kaynak dosyaları:
  - `matematik` → `docs/curriculum/sources/tymm-ilkokul-matematik.pdf`, doc `"İlkokul Matematik Dersi Öğretim Programı"`
  - `turkce` → `docs/curriculum/sources/tymm-ilkokul-turkce.pdf`, doc `"İlkokul Türkçe Dersi Öğretim Programı"`
  - `hayat_bilgisi` → `docs/curriculum/sources/tymm-hayat-bilgisi.pdf`, doc `"Hayat Bilgisi Dersi Öğretim Programı"`
  - `fen` → `docs/curriculum/sources/tymm-fen-bilimleri.pdf`, doc `"Fen Bilimleri Dersi Öğretim Programı"`
  - `url` alanı `docs/curriculum/sources/README.md` tablosundaki resmi URL'dir.
- Spec'teki 14 şablon kimliği (§3.7): `drag_match`, `count_choose`, `sequence`, `sort_bins`, `trace`, `syllable_build`, `listen_find`, `balloon_pop`, `pattern`, `balance`, `clock_money`, `story`, `scenario`, `fraction_pizza`.
- JSON dosyaları tab girintili, UTF-8, anahtarlar mevcut `outcomes.json` sırasıyla yazılır. `content/**` dosyalarına bu fazda **dokunulmaz**.
- `tools/*` geliştirici aracıdır, Türkçe sabit metin içerebilir. Uygulama kodunda değişiklik yok.
- Test paketi sıralı çalışır, aynı anda tek `godot` süreci (`pgrep -f "path . "` ile bu projede çalışan yok mu bak).
- Commit ve PR'larda atıf satırı (`Co-Authored-By`, "Generated with Claude Code" vb.) **yok**.
- Dal: `feat/faz2-mufredat-matrisi`. Her görev ayrı commit.

**Komutlar**
- Tek test dosyası: `godot --headless --path . -s addons/gut/gut_cmdln.gd -gselect=<dosya_adı> -gexit`
- Tüm paket: `godot --headless --path . -s addons/gut/gut_cmdln.gd -gdir=res://tests -ginclude_subdirs -gexit`
- Taslak çıkarma (Task 2): `godot --headless --path . -s res://tools/extract_outcomes.gd -- <ders> <ilk_sayfa> <son_sayfa>`
- Rapor (Task 8): `godot --headless --path . -s res://tools/curriculum_report.gd`

## Veri sözleşmesi

**`docs/curriculum/outcomes.json`** (anahtar = resmi kod, sondaki nokta olmadan):
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
- `steps` isteğe bağlıdır (Hayat Bilgisi'nde süreç bileşeni yoktur). Varsa harf etiketiyle (`"a) "`) dökümdeki gibi yazılır.
- Mevcut 7 kayıttaki eski `"theme"` metin alanı kaldırılır, yerine `"themes"` dizisi gelir. Kodda `theme` alanını okuyan yer yoktur.
- **Kaçış (yalnızca döküm bozuksa):** `"text_check": "manual"` ve boş olmayan `"manual_note": "<PDF'te nasıl doğrulandı>"`. Bu durumda yalnızca kodun sayfada geçmesi denetlenir. Rapor bu kayıtları "Sahibe" bölümünde listeler.
- **Türkçe:** kanonik kaynak **EK 1** (PDF s. 202 ve sonrası; sınıf düzeyine göre bütün çıktılar ve bütün süreç bileşenleri). `source.page` EK 1 sayfasıdır. Aynı kod birden çok temada geçer, bu yüzden `themes` birden çok öğe içerir.

**`docs/curriculum/themes.json`** (anahtar = `g<sınıf>.<ders>.t<NN>`, NN = programdaki **işleniş sırası**):
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
- `order` ve `declared_count` programın tema/süre tablosundan alınır (Matematik PDF s. 10–11, Türkçe s. 19–20, Hayat Bilgisi "öğrenme alanı" tablosu, Fen 3. sınıf tablosu). Pekiştirme / hatırlatma haftası ve okul temelli planlama tema **değildir**. Türkçe 1. sınıfta "İLK OKUMA YAZMAYA HAZIRLIK ÇALIŞMALARI" `t01`, "1. TEMA" `t02` olur.
- `outcomes` temanın sayfalarında listelenen kodlardır, sırası programdaki sıradır. `source.page` temanın ilk öğrenme çıktısı sayfasıdır.
- Tablo sayısı ile tema gövdesi uyuşmazsa sayı **düzeltilmez**. `"declared_count_note"` alanına açıklama yazılır ve sahibe bildirilir.
- Matematik temaları parçalıdır (`MAT.1.1. ... (1)` ve `(2)`). Her parça ayrı tema kaydıdır.

**`docs/curriculum/game_map.json`** (anahtar = kod):
```json
"MAT.1.1.4": {
	"fit": "partial",
	"templates": ["drag_match"],
	"proposed": ["compare_groups"],
	"note": "a) iki grubu karşılaştırma oynanabilir; b–c) benzerlik/farklılık listeleme sözlü etkinlik."
}
```
- `fit`: `full` (çıktının bütün süreç bileşenleri tek başına dokunmatik oyunla çalışılabilir), `partial` (bir kısmı; hangileri olduğu `note`'ta harfle yazılır), `none` (konuşma, kâğıda yazma, grup ya da beden etkinliği, gerçek dünyada gözlem gerektirir).
- `templates` ⊆ spec'teki 14 kimlik. `full`/`partial` ise boş olamaz, `none` ise boş olmalı.
- `proposed`: spec'te olmayan, gereken yeni mekanik (snake_case). İsteğe bağlı.
- `note` Türkçe ve kısa; `partial` ve `none` için zorunlu.

---

## Dosya haritası

| Dosya | Sorumluluk |
|---|---|
| `tools/curriculum/curriculum_check.gd` | Saf denetleyici: normalleştirme, sayfa ayırma, outcomes/themes/game_map denetimi, sayım |
| `tools/curriculum/outcome_extract.gd` | Saf taslak çıkarıcı: sayfa aralığından kod + metin + süreç bileşeni |
| `tools/extract_outcomes.gd` | CLI: taslak JSON'u `build/curriculum/<ders>.draft.json`'a yazar |
| `tools/curriculum/report.gd` | Saf: üç JSON'dan `matrix.md` metnini üretir |
| `tools/curriculum_report.gd` | CLI: `docs/curriculum/matrix.md`'yi yazar |
| `docs/curriculum/outcomes.json` | Resmi çıktılar (genişletilir) |
| `docs/curriculum/themes.json` | Resmi temalar ve işleniş sırası (yeni) |
| `docs/curriculum/game_map.json` | Çıktı → şablon eşlemesi (yeni) |
| `docs/curriculum/matrix.md` | Üretilmiş okunur matris (yeni) |
| `docs/curriculum/README.md` | Veri sözleşmesi ve güncelleme yöntemi (yeni) |
| `tests/unit/test_curriculum_check.gd` | Denetleyici birim testleri |
| `tests/unit/test_outcome_extract.gd` | Çıkarıcı birim testleri |
| `tests/unit/test_curriculum_data.gd` | Gerçek veri kapısı: kaynak doğrulama, sayımlar, eşleme kapsamı, rapor güncelliği |

## Review Focus

1. **PDF dökümünde tablo bozulması (sütunlar karışık, satır sonu tirelemesi `ör -\nnekler`, sekme karakterleri):** doğru kopyalanmış metin yine eşleşmeli; yalnızca gerçekten bozuk dökümde manuel kaçış kullanılmalı, kaçış notsuz kabul edilmemeli. Test: Task 1 `test_normalize_ignores_whitespace_tabs_and_hyphenation`, `test_manual_text_check_requires_note`.
2. **Çıktı metni ya da süreç bileşenleri sayfa sonunda bölünürse:** sonraki sayfaya taşan metin kabul edilmeli, ama kod belirtilen sayfada olmalı. Test: Task 1 `test_text_may_continue_on_next_page`, `test_code_must_be_on_stated_page`.
3. **Öneki çakışan kodlar (`MAT.1.1.1` ile `MAT.1.1.10`):** biri sayfada yokken diğerinin varlığı onu doğrulanmış göstermemeli. Test: Task 1 `test_code_prefix_collision_not_accepted`.
4. **4. sınıf ya da yanlış derse ait kod (`MAT.4.1.1`, `FB.4.1.1`, matematik kaydında `HB.` kodu, kodla uyuşmayan `grade`):** reddedilmeli. Test: Task 1 `test_out_of_scope_or_mismatched_codes_rejected`.
5. **Türkçe'de aynı kodun birden çok temada geçmesi:** tema ↔ çıktı üyeliği iki yönlü tutarlı olmalı; bir tarafta eksik üyelik hata vermeli. Ayrıca şema değişikliğinden sonra Faz 1 içeriği ve veli panelindeki çıktı metni çalışmaya devam etmeli. Test: Task 1 `test_theme_membership_must_be_bidirectional`, Task 3 `test_vertical_slice_outcomes_still_resolve`.

---

### Task 1: Müfredat denetleyicisi (saf)

**Files:**
- Create: `tools/curriculum/curriculum_check.gd`
- Test: `tests/unit/test_curriculum_check.gd`

**Interfaces:**
- Produces (hepsi `static`, `extends RefCounted`, `class_name` **yok**; kullananlar `const CurriculumCheck := preload("res://tools/curriculum/curriculum_check.gd")`):
  - `const SUBJECT_SOURCES: Dictionary` — ders → `{"file": String, "doc": String, "url": String}` (Global Constraints'teki değerler)
  - `const SPEC_TEMPLATES: PackedStringArray` — 14 kimlik
  - `const FITS: PackedStringArray = ["full", "partial", "none"]`
  - `func normalize(s: String) -> String` — bütün boşluk karakterlerini (boşluk, `\t`, `\n`, `\r`, U+00A0), `-` ve yumuşak tireyi (U+00AD) siler; başka hiçbir şeyi değiştirmez (büyük/küçük harf, tırnak aynen kalır).
  - `func split_pages(txt: String) -> Dictionary` — `int` sayfa → o sayfanın metni (`===== SAYFA N =====` satırından sonraki her şey, bir sonraki işarete kadar).
  - `func load_pages(pdf_path: String) -> Dictionary` — `res://` + pdf yolunun `.txt` kardeşini okuyup `split_pages` döner.
  - `func code_grade(code: String, subject: String) -> int` — ders desenine uyan kodun sınıfı, uymuyorsa `0`. Desenler: matematik `^MAT\.([1-3])\.[1-4]\.\d+$`, turkce `^T\.[DKOY]\.([1-3])\.\d+$`, hayat_bilgisi `^HB\.([1-3])\.\d+\.\d+$`, fen `^FB\.(3)\.\d+\.\d+$`.
  - `func check_outcomes(outcomes: Dictionary, themes: Dictionary, pages_by_file: Dictionary) -> Array[String]` — `pages_by_file`: pdf yolu → `split_pages` sonucu.
  - `func check_themes(themes: Dictionary, outcomes: Dictionary) -> Array[String]`
  - `func check_game_map(game_map: Dictionary, outcomes: Dictionary, subjects: PackedStringArray) -> Array[String]` — yalnızca `subjects` içindeki derslerin çıktıları için kapsam istenir.
  - `func count_by_grade_subject(outcomes: Dictionary) -> Dictionary` — `"g1.matematik"` → `int`.
- Hata iletileri Türkçe, kodu/tema kimliğini içerir (ör. `"MAT.1.1.1: metin s.20-21'de bulunamadı"`).

`check_outcomes` her kayıt için şunları denetler: ders `SUBJECT_SOURCES`'ta var; `code_grade(code, subject) > 0` ve `== grade`; `printed_code == code + "."`; `text` boş değil; `source.file`/`doc`/`url` dersin değerleriyle aynı; `source.page` tamsayı ve o dosyanın sayfaları içinde; `normalize(printed_code)` **`page` sayfasında** geçer; `normalize(text)` ve her `normalize(step)` **`page` + `page+1`** sayfalarının birleşiminde geçer (`text_check == "manual"` ise bu metin denetimi atlanır ama `manual_note` boş olamaz); `themes` boş olmayan dizi ve her öğe `themes` sözlüğünde var.

`check_themes` şunları denetler: kimlik `^g([1-3])\.(matematik|turkce|hayat_bilgisi|fen)\.t(\d{2})$`, `grade`/`subject`/`order` kimlikle aynı; aynı sınıf × derste `order` 1..N kesintisiz; `official` boş değil; `outcomes` boş değil, her kod `outcomes`'ta var ve aynı sınıf/derste; `declared_count == outcomes.size()` ya da boş olmayan `declared_count_note`; iki yönlü üyelik (kod temanın listesinde ⇔ tema kodun `themes` dizisinde).

`check_game_map` şunları denetler: kapsamdaki her çıktının kaydı var; `game_map`'te `outcomes`'ta olmayan kod yok; `fit` ∈ `FITS`; `templates` ⊆ `SPEC_TEMPLATES`; `full`/`partial` → `templates` boş değil; `none` → `templates` boş; `partial`/`none` → `note` boş değil; `proposed` varsa her öğe `^[a-z][a-z0-9_]*$`.

- [x] **Step 1: Testleri yaz** — `tests/unit/test_curriculum_check.gd`, sahte sayfalarla (`{"docs/curriculum/sources/tymm-ilkokul-matematik.pdf": {20: "...", 21: "..."}}`) ve elle kurulmuş küçük sözlüklerle:
  - `test_split_pages_parses_markers`: `"x\n===== SAYFA 1 =====\nA\n===== SAYFA 2 =====\nB"` → `keys == [1, 2]`, `[2]` `"B"` içerir.
  - `test_normalize_ignores_whitespace_tabs_and_hyphenation`: `normalize("Dinlediği\tsesin  kay-\nnağını ör -\nnek")` == `normalize("Dinlediği sesin kaynağını örnek")`; `normalize("“eşit”")` `“` içerir.
  - `test_valid_outcome_passes`: kod `MAT.1.1.1`, s.20'de kod + metin + iki adım → `[]`.
  - `test_text_may_continue_on_next_page`: kod ve metin s.20'de, `b)` adımı s.21'de → `[]`.
  - `test_code_must_be_on_stated_page`: kod yalnızca s.21'de, `page: 20` → 1 hata, kodu içerir.
  - `test_wrong_text_rejected`: metinde bir harf farklı → hata.
  - `test_code_prefix_collision_not_accepted`: sayfada yalnızca `MAT.1.1.10.` var, kayıt `MAT.1.1.1` → hata.
  - `test_out_of_scope_or_mismatched_codes_rejected`: `MAT.4.1.1`, `FB.4.1.1`, `subject: "matematik"` ile `HB.1.1.1`, `grade: 2` ile `MAT.1.1.1` → her biri hata; `code_grade("T.D.3.5", "turkce") == 3`.
  - `test_manual_text_check_requires_note`: `text_check: "manual"` ve not yok → hata; notla, metin sayfada olmasa da kod sayfadaysa → `[]`.
  - `test_unknown_theme_reference_rejected`: `themes: ["g1.matematik.t09"]` sözlükte yok → hata.
  - `test_theme_membership_must_be_bidirectional`: tema listesinde var, çıktının `themes` dizisinde yok → hata; tersi de hata.
  - `test_theme_order_must_be_contiguous`: g1 matematik `t01` ve `t03` → hata.
  - `test_declared_count_mismatch_needs_note`: 2 çıktı, `declared_count: 3` → hata; `declared_count_note` ile → `[]`.
  - `test_game_map_rules`: eksik kayıt, `fit: "maybe"`, spec dışı şablon, `none` + şablon, notsuz `partial`, `proposed: ["Compare"]` → her biri hata; geçerli `full` → `[]`; `subjects` dışındaki dersin eksik kaydı → hata değil.
  - `test_count_by_grade_subject`: iki g1 matematik, bir g3 fen → `{"g1.matematik": 2, "g3.fen": 1}`.
- [x] **Step 2: Çalıştır, başarısız olduğunu gör** — `-gselect=test_curriculum_check`; beklenen: betik yok / fonksiyon tanımsız.
- [x] **Step 3: `tools/curriculum/curriculum_check.gd`'yi yaz** (Interfaces'teki imzalar; regex için `RegEx`).
- [x] **Step 4: Testler geçiyor** — aynı komut, hepsi PASS.
- [x] **Step 5: Commit** — `git add tools/curriculum tests/unit/test_curriculum_check.gd*` · `tools: müfredat denetleyicisi (kod ve metin kaynak sayfada doğrulanır)`

---

### Task 2: Taslak çıkarıcı

Elle 240 çıktı kopyalamak yerine sayfa aralığından taslak üretilir. Taslak her zaman gözden geçirilir; nihai doğruluk Task 1 denetleyicisiyle sağlanır.

**Files:**
- Create: `tools/curriculum/outcome_extract.gd`, `tools/extract_outcomes.gd`
- Test: `tests/unit/test_outcome_extract.gd`

**Interfaces:**
- Consumes: `CurriculumCheck.split_pages`, `load_pages`, `SUBJECT_SOURCES`, `code_grade`.
- Produces: `static func extract(pages: Dictionary, subject: String, first_page: int, last_page: int) -> Dictionary` — kod → `{"grade", "subject", "text", "printed_code", "steps"?, "source": {"doc","file","page","url"}}` (`themes` yok; o elle eklenir). Kodun **ilk göründüğü** sayfa `page` olur.

Satır kuralları: bir satırda `<kod>. <metin>` biçimi (satır başında ya da `VE SÜREÇ BİLEŞENLERİ ` gibi tablo etiketinden sonra) bir çıktı başlatır; `code_grade(kod, subject) == 0` olan kod yok sayılır. Başlık metni bir sonraki adım, kod ya da büyük harfli bölüm etiketi (`İÇERİK ÇERÇEVESİ`, `ÖĞRENME`, `Anahtar Kavramlar`, `===== SAYFA`) satırına kadar sürer. `^[a-zçğıöşü]\)\s` ile başlayan satır yeni adımdır; sonraki satırlar aynı bitiş kurallarıyla adıma eklenir. Satırlar tek boşlukla birleştirilir, sekmeler tek boşluğa indirilir, satır sonu tirelemesi (`-` ile biten satır) birleştirilir. Aynı kod ikinci kez görülürse ilk kayıt korunur.

- [x] **Step 1: Testleri yaz** — `tests/unit/test_outcome_extract.gd`:
  - `test_extracts_code_title_and_steps`: Fen biçimli sayfa (s.19: `FB.3.1.1. Bilimsel bilgiye ulaşma yollarını sorgulayabilme`, `a) ...`, `b) ...`, `İÇERİK ÇERÇEVESİ ...`) → `text` doğru, `steps.size() == 2`, `page == 19`, `printed_code == "FB.3.1.1."`.
  - `test_table_label_prefix_and_tabs`: `VE SÜREÇ BİLEŞENLERİ T.D.1.2. Dinledikleri/izledikleri ile ilgili anlam oluşturabilme` + `b)\t Dinlediği\tsesin\tkaynağını\ttahmin\teder.` → `text` etiketsiz, adım `"b) Dinlediği sesin kaynağını tahmin eder."`.
  - `test_wrapped_title_and_hyphenation_joined`: iki satıra bölünmüş, tireli başlık tek metin olur.
  - `test_out_of_scope_codes_skipped`: `MAT.4.1.1.` satırı sonuçta yok.
  - `test_first_occurrence_wins`: aynı kod s.20 ve s.40'ta → `page == 20`.
  - `test_extracted_entry_passes_checker`: çıkarılan kayda `themes` eklenip `check_outcomes`'a verilince (tek temalı sahte `themes` sözlüğüyle) metin/kod hatası yok.
- [x] **Step 2: Başarısız olduğunu gör.**
- [x] **Step 3: `outcome_extract.gd`'yi yaz; `tools/extract_outcomes.gd` (`extends SceneTree`, `_init`'te `OS.get_cmdline_user_args()` → ders, ilk, son; sonucu `JSON.stringify(d, "\t")` ile `res://build/curriculum/<ders>.draft.json`'a yazar, kod sayısını yazdırır, `quit()`).**
- [x] **Step 4: Testler geçer; CLI'yi gerçek veride dene:** `godot --headless --path . -s res://tools/extract_outcomes.gd -- fen 1 60` → `build/curriculum/fen.draft.json` oluşur, `FB.3.*` kodları içerir. (`build/` git'te yok sayılıyor.)
- [x] **Step 5: Commit** — `tools: müfredat taslak çıkarıcı`

---

### Task 3: Matematik 1–3 (77 çıktı) ve gerçek veri kapısı

**Files:**
- Modify: `docs/curriculum/outcomes.json` (mevcut 7 kayıt: `theme` → `themes`, kalanlar eklenir)
- Create: `docs/curriculum/themes.json`, `tests/unit/test_curriculum_data.gd`
- Modify: `tests/unit/test_content_db_autoload.gd` (gerçek `ContentDB` tekilini kullanır)

**Interfaces:**
- Consumes: Task 1 `CurriculumCheck`, Task 2 CLI.
- Produces: `test_curriculum_data.gd` içinde `const EXPECTED_COUNTS: Dictionary` (sonraki görevler satır ekler) ve `const MAPPED_SUBJECTS: PackedStringArray = []` (Task 6–7 doldurur).

- [x] **Step 1: Kapı testini yaz** — `tests/unit/test_curriculum_data.gd`, gerçek dosyaları okur:
  - `test_outcomes_match_sources`: `check_outcomes(outcomes, themes, pages)` == `[]` (`pages`, `SUBJECT_SOURCES`'taki her dosya için `load_pages`).
  - `test_themes_consistent`: `check_themes` == `[]`.
  - `test_counts_match_program`: `count_by_grade_subject(outcomes)` içinde `EXPECTED_COUNTS`'taki her anahtar eşit **ve** sonuçta `EXPECTED_COUNTS` dışında anahtar yok. Bu görevde `{"g1.matematik": 19, "g2.matematik": 25, "g3.matematik": 33}` (PDF s.10–11 "TOPLAM" satırları).
  - `test_game_map_covers_mapped_subjects`: `check_game_map(game_map, outcomes, MAPPED_SUBJECTS)` == `[]`; `game_map.json` yoksa boş sözlük kabul edilir.
  - `test_content_db_autoload.gd`'ye `test_vertical_slice_outcomes_still_resolve`: tekil `ContentDB` (gerçek `outcomes.json`) ile `outcome_info("MAT.1.1.1")["text"]` boş değil ve `content/g1/matematik/u01.json`'daki her kod `outcome_info`'da bulunur.
- [x] **Step 2: Çalıştır; sayım testi başarısız (7 ≠ 19…), tema testi başarısız (`themes.json` yok).**
- [x] **Step 3: Veriyi üret.** `extract_outcomes.gd -- matematik <ilk> <son>` ile 1–3. sınıf bölümünün taslağını al (sayfa aralığını `.txt`'te `MAT.1.`… başlıklarından bul; 4. sınıf kodları zaten atlanır). Taslağı gözden geçir, `.txt` ile karşılaştır. `themes.json`'a 1–3. sınıf temalarını işleniş sırasıyla gir (s.10–11 tabloları; ör. 1. sınıf `t01 = MAT.1.3. Nesnelerin Geometrisi (1)`, `t02 = MAT.1.1. Sayılar ve Nicelikler (1)`). Her çıktının `themes` alanını doldur. Mevcut 7 kaydın metni değişmez.
- [x] **Step 4: Tüm paketi çalıştır** — yeni testler ve mevcut 282 test PASS (özellikle `test_all_content_valid`).
- [x] **Step 5: Commit** — `docs(curriculum): Matematik 1–3 öğrenme çıktıları ve temaları`

---

### Task 4: Türkçe 1–3 (57 çıktı)

**Files:** Modify `docs/curriculum/outcomes.json`, `docs/curriculum/themes.json`, `tests/unit/test_curriculum_data.gd`

- [x] **Step 1:** `EXPECTED_COUNTS`'a `"g1.turkce": 17, "g2.turkce": 20, "g3.turkce": 20` ekle (EK 1'deki farklı kod sayıları). Çalıştır → başarısız.
- [x] **Step 2:** Taslağı EK 1 sayfalarından çıkar (`-- turkce 202 <3. sınıfın son EK 1 sayfası>`). Bütün süreç bileşenleri (`a)`…`ğ)`) EK 1'deki gibi girer. `source.page` EK 1 sayfasıdır.
- [x] **Step 3:** `themes.json`'a 1–3. sınıf temalarını s.19–20 tablosundaki sırayla gir (1. sınıf: `t01` hazırlık, `t02`–`t09` = 1.–8. TEMA; 2. ve 3. sınıf: `t01`–`t08`). Her temanın `outcomes` listesi, o temanın program sayfalarında "ÖĞRENME ÇIKTILARI VE SÜREÇ BİLEŞENLERİ" altında geçen kodlardır. `declared_count` tablodaki sayıdır. Tema gövdesindeki farklı kod sayısı tabloyla uyuşmazsa `declared_count_note` yaz.
- [x] **Step 4:** `test_curriculum_data.gd` ve tüm paket PASS.
- [x] **Step 5: Commit** — `docs(curriculum): Türkçe 1–3 öğrenme çıktıları ve temaları`

---

### Task 5: Hayat Bilgisi 1–3 (66) ve Fen Bilimleri 3 (20)

**Files:** Modify `docs/curriculum/outcomes.json`, `docs/curriculum/themes.json`, `tests/unit/test_curriculum_data.gd`

- [x] **Step 1:** `EXPECTED_COUNTS`'a `"g1.hayat_bilgisi": 23, "g2.hayat_bilgisi": 23, "g3.hayat_bilgisi": 20, "g3.fen": 20` ekle. Bu sayıları öğrenme alanı / tema tablolarıyla karşılaştır. Tablo farklı bir sayı veriyorsa **dur**: sayıyı ve sayfayı rapor et, tahminle değiştirme. Çalıştır → başarısız.
- [x] **Step 2:** Hayat Bilgisi taslağı (çıktılar s.15'ten itibaren; süreç bileşeni yok, `steps` alanı girmez). Temalar = her sınıfın 6 öğrenme alanı (`1. BEN VE OKULUM` … `6. BİLİM, TEKNOLOJİ VE SANAT`), `official` dökümdeki yazımla. Döküm bozuk yazdıysa (`Y AŞADIĞIM`) PDF'teki doğru yazım kullanılır (`YAŞADIĞIM`) ve bu `themes.json`'da sorun yaratmaz, çünkü tema başlığı sayfayla denetlenmez.
- [x] **Step 3:** Fen taslağı yalnızca 3. sınıf bölümünden. Temalar 3. sınıf tema tablosundan (`TOPLAM 20` olan tablo).
- [x] **Step 4:** Kapı testi ve tüm paket PASS.
- [x] **Step 5: Commit** — `docs(curriculum): Hayat Bilgisi 1–3 ve Fen Bilimleri 3 öğrenme çıktıları`

---

### Task 6: Oyun eşlemesi — Matematik ve Fen

**Files:** Create `docs/curriculum/game_map.json`; Modify `tests/unit/test_curriculum_data.gd`

Her çıktının süreç bileşenleri tek tek okunur ve Veri sözleşmesindeki `fit` tanımına göre karar verilir. Pedagojik ilkeler (spec §2): somuttan soyuta; tur 3–5, durak 2–4 dk; ceza ve süre baskısı yok. Örnek kararlar:
- `MAT.1.1.1` → `full`, `["count_choose", "drag_match", "listen_find"]`
- `MAT.1.1.4` → `partial`, `["drag_match"]`, `proposed: ["compare_groups"]`, not: hangi bileşenler sözlü.
- `MAT.1.1.7` → `partial`, `["count_choose"]`, `proposed: ["estimate_then_count"]` (spec Açık sorular ile tutarlı).
- `FB.3.1.1` (merak ettiği konuyu sorgulama, bilgi toplama) → büyük olasılıkla `none` ya da `partial`; gerekçeyi `note`'a yaz.

- [x] **Step 1:** `MAPPED_SUBJECTS = ["matematik", "fen"]` yap; çalıştır → eksik kayıt hataları.
- [x] **Step 2:** 97 kaydı yaz.
- [x] **Step 3:** Kapı testi PASS.
- [x] **Step 4: Commit** — `docs(curriculum): Matematik ve Fen çıktılarının şablon eşlemesi`

---

### Task 7: Oyun eşlemesi — Türkçe ve Hayat Bilgisi; spec güncellemesi

**Files:** Modify `docs/curriculum/game_map.json`, `tests/unit/test_curriculum_data.gd`, `docs/superpowers/specs/2026-10-04-bilgi-adasi-design.md`

Türkçe'de konuşma (`T.K.*`) ve yazma (`T.Y.*`) çıktılarının çoğu `none` ya da `partial` olur. `trace` dik temel harf yazımını, `syllable_build` hece ve kelime kurmayı, `listen_find` ses-harf ilişkisini karşılar (spec §2: 1. sınıf ses temelli cümle yöntemi). Hayat Bilgisi'nde `scenario` ve `sort_bins` ağırlıklıdır.

- [x] **Step 1:** `MAPPED_SUBJECTS`'e `"turkce"`, `"hayat_bilgisi"` ekle → başarısız.
- [x] **Step 2:** 123 kaydı yaz. Kapı testi PASS.
- [x] **Step 3: Spec'i güncelle:** §8 tablosunda Faz 2 çıktısı `docs/curriculum/*` (outcomes, themes, game_map, matrix). Dosyanın sonuna **"Açık sorular (Faz 2)"** bölümü ekle: (a) `game_map`'teki her `proposed` mekanik için bir satır: kimlik, kısa mekanik tanımı, gerektiren kodlar; spec §3.7'ye eklenip eklenmeyeceği sahibe sorulur (tabloya **eklenmez**); (b) `fit: none` olan çıktıların sayısı ve bunların veli paneline "evde etkinlik önerisi" olarak girip girmeyeceği; (c) her `declared_count_note` ve `manual_note`; (d) 1. sınıf Matematik'te program sırası (`t01` geometri) ile Faz 1 dilimindeki sıra farkı: Faz 3'te ünite dosyaları işleniş sırasına göre mi numaralanacak?
- [x] **Step 4: Commit** — `docs(curriculum): Türkçe ve Hayat Bilgisi şablon eşlemesi; Faz 2 açık soruları`

---

### Task 8: Okunur matris, README ve QA

**Files:**
- Create: `tools/curriculum/report.gd`, `tools/curriculum_report.gd`, `docs/curriculum/matrix.md`, `docs/curriculum/README.md`
- Modify: `tests/unit/test_curriculum_data.gd`, `docs/curriculum/sources/README.md`, `docs/qa-checklist.md`

**Interfaces:**
- Produces: `static func render(outcomes: Dictionary, themes: Dictionary, game_map: Dictionary) -> String` (`tools/curriculum/report.gd`).

`matrix.md` düzeni: başlık ve "bu dosya üretilmiştir, elle düzenleme; `tools/curriculum_report.gd`" uyarısı; özet tablo (sınıf × ders: çıktı sayısı, full / partial / none); sonra sınıf → ders (`matematik`, `turkce`, `hayat_bilgisi`, `fen` sırası) → tema (`order` sırası, başlık `official`) için tablo: `| Kod | Öğrenme çıktısı | s. | Uygunluk | Şablonlar | Not |` (Türkçe'de bir kod her temasında tekrar görünür); sonda "Önerilen yeni şablonlar" (proposed → kodlar) ve "Sahibe notlar" (`manual_note`, `declared_count_note`). Tablo hücrelerinde `|` kaçışlanır. Çıktı deterministiktir (sözlük sırasına değil, açık sıralamaya dayanır) ve `\n` ile biter.

- [x] **Step 1: Test yaz** — `test_curriculum_data.gd`'ye:
  - `test_matrix_md_is_up_to_date`: `render(...)` == `FileAccess.get_file_as_string("res://docs/curriculum/matrix.md")`; mesaj: "tools/curriculum_report.gd'yi çalıştır".
  - `test_render_lists_every_outcome`: `outcomes`'taki her kod `render` çıktısında `| <kod> |` olarak geçer.
- [x] **Step 2: Başarısız olduğunu gör.**
- [x] **Step 3:** `report.gd` ve CLI'yi yaz; CLI'yi çalıştırıp `matrix.md`'yi üret.
- [x] **Step 4:** `docs/curriculum/README.md` yaz: üç JSON'un sözleşmesi (bu plandaki "Veri sözleşmesi"nin kısa hali), MEB yeni PDF yayımlayınca güncelleme adımları (PDF + `.txt` döküm → taslak çıkarıcı → fark gözden geçirme → kapı testi → rapor). `sources/README.md`'deki "Faz 2'de yeniden düzenlenebilir" notunu `themes.json`'a yönlendir. `docs/qa-checklist.md`'ye Faz 2 maddesi: "Veli paneli → ilerleme: 1. sınıf Matematik çıktı metinleri görünür (outcomes.json şema değişikliği sonrası)".
- [x] **Step 5:** Tüm paketi çalıştır, hepsi PASS. `godot --headless --path . -s res://tools/missing_assets.gd` hata vermeden biter.
- [x] **Step 6: Commit** — `docs(curriculum): okunur müfredat matrisi ve güncelleme rehberi`.
- [ ] **Step 7: PR aç** — başlık: `Faz 2: müfredat matrisi`; açıklamada sayılar ve spec'e eklenen açık sorular; atıf satırı yok.
