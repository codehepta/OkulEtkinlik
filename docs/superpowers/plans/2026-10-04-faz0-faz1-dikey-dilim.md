# Faz 0 + Faz 1 — Altyapı ve Oynanabilir Dikey Dilim: Uygulama Planı

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Boş repodan, Android'de çalışan, 1. sınıf Matematik ilk ünitesini profil → harita → patika → durak → yıldız/çıkartma döngüsüyle baştan sona oynatan bir Godot projesine ulaşmak. Asset'ler eksikken yer tutucular ve cihaz TTS'iyle çalışmalı.

**Architecture:** Saf mantık `scripts/core/` altında sahnesiz sınıflar olarak tutulur ve GUT ile test edilir. İnce autoload servisler bu mantığı sarar: kayıt, asset, ses, içerik, ilerleme, süre. Mini oyunlar `MiniGame` sözleşmesini uygulayan bağımsız sahnelerdir; akışı `LessonRunner` yönetir. İçerik JSON'dan gelir ve yükleme sırasında doğrulanır.

**Tech Stack:** Godot 4.7.2-stable, GDScript (statik tipli), GUT 9.7.x, GitHub Actions, Android export (JDK 17, Android SDK).

**Spec:** `docs/superpowers/specs/2026-10-04-bilgi-adasi-design.md`. Her görev bu spec'le birlikte okunur. Ayrıca `CLAUDE.md`, `docs/assets/naming.md`.

## Global Constraints

- Godot **4.7.2-stable**, yalnızca GDScript; .NET yok. Bütün değişken, parametre ve dönüşler statik tipli.
- Taban çözünürlük **1920×1080**, `stretch_mode=canvas_items`, `aspect=expand`, yön **sensor_landscape**.
- Dokunma hedefleri **en az 128×128 px** (1080p tabanında).
- Kullanıcıya görünen bütün metinler `content/strings.tr.json`, ses satırı metinleri `content/voice_lines.tr.json` içinde. Kodda Türkçe sabit metin yok.
- **Ağ isteği yok.** Android preset'inde INTERNET dahil bütün izinler kapalı.
- Asset anahtarı → yol eşlemesi birebir `docs/assets/naming.md`'deki gibi. Görseller `.png`; ses için `.ogg`, `.wav`, `.mp3` bu sırayla denenir.
- Dışa aktarılmış derlemede `res://` dosya varlığı **`ResourceLoader.exists()`** ile kontrol edilir; `FileAccess.file_exists()` içe aktarılmış asset'lerde export sonrası yanlış sonuç verir.
- Ustalık: `m = m*0.7 + r*0.3`, başlangıç 0.0; r = 1.0 (1. deneme), 0.6 (2.), 0.3 (3., ipucu sonrası), 0.0 (yardımlı).
- Leitner: 5 kutu, aralıklar **0, 1, 3, 7, 14** gün. Durak ≥2 yıldız → çıktı bir kutu ilerler (en fazla 5). Yardımlı tur → 1. kutu.
- Yıldız: durak toplam yanlış ≤1 → 3, ≤3 → 2, aksi halde 1.
- Hata akışı: 1. yanlış → yönerge tekrar; 2. yanlış → `show_hint(1)`; 3. yanlış → `show_hint(2)`, tur yardımlı, durak sonuna **bir kez** yeniden eklenir.
- Zorluk: oynanan = clamp(taban + ayar, 1, 3); ayar = +1 (ustalık ≥0.8), −1 (≤0.4), 0.
- Müzik, anlatım sırasında **−12 dB** iner.
- Profil sayısı en fazla **4**. Günlük süre seçenekleri **10 / 15 / 20 / 30 dk / kapalı (0)**.
- Commit ve PR'larda atıf satırı (`Co-Authored-By` vb.) yok.

## Review Focus

1. **Uygulama kayıt yazarken öldürülürse ya da kayıt dosyası bozulursa:** son sağlam kayıt (`.bak`) yüklenmeli, ilerleme kaybolmamalı. Test: Task 5 `test_corrupt_main_falls_back_to_backup`.
2. **Cihazda Türkçe TTS sesi yoksa:** anlatım sessiz geçmeli ama metin balonu (`subtitle_requested`) yayılmalı, çökme olmamalı. Test: Task 7 `test_no_turkish_voice_emits_subtitle`.
3. **Çocuk cihaz saatini geri alırsa:** süre sınırı sıfırlanmamalı; kullanım günü hiçbir zaman geri gitmemeli. Test: Task 10 `test_clock_moved_back_does_not_reset_usage`.
4. **Geri bildirim animasyonu sırasında hızlı çoklu dokunma:** tek bir cevap sayılmalı, yanlış sayısı şişmemeli. Test: Task 11 `test_input_locked_during_feedback`, Task 12 `test_double_answer_counted_once`.
5. **Veli sınıfı değiştirirse:** önceki sınıftaki ilerleme korunmalı, harita yeni sınıfın içeriğini göstermeli; geri dönünce eski yıldızlar duruyor olmalı. Test: Task 9 `test_grade_change_preserves_progress`.

---

## Dosya haritası

| Dosya | Sorumluluk |
|---|---|
| `project.godot`, `default_bus_layout.tres`, `export_presets.cfg` | Proje ayarları, ses kanalları, Android preset |
| `scripts/core/mastery.gd` | Ustalık hesabı ve zorluk ayarı (saf) |
| `scripts/core/leitner.gd` | Aralıklı tekrar kutuları (saf) |
| `scripts/core/stars.gd` | Yıldız hesabı (saf) |
| `scripts/core/parent_gate_quiz.gd` | Veli kapısı sorusu üretimi (saf) |
| `scripts/core/asset_paths.gd` | Anahtar → yol çözümü (saf) |
| `scripts/core/day_clock.gd` | "Bugün" gün sayısı; testte enjekte edilebilir saat |
| `scripts/core/content_validator.gd` | İçerik şema doğrulaması (saf) |
| `scripts/core/template_registry.gd` | Şablon kimliği → sahne yolu, parametre doğrulama |
| `scripts/core/round_context.gd`, `round_result.gd` | Şablon ↔ runner veri tipleri |
| `autoload/save_service.gd` | Atomik JSON kayıt, yedek, göç |
| `autoload/asset_registry.gd` | Texture/ses yükleme, eksik listesi |
| `autoload/audio_director.gd` | Müzik/efekt çalma, ducking |
| `autoload/narrator.gd` | Ses satırı çalma, TTS yedeği, altyazı sinyali |
| `autoload/content_db.gd` | İçerik yükleme, sorgular |
| `autoload/progress.gd` | Profil ilerlemesi: yıldız, ustalık, Leitner, çıkartma, kilit açma |
| `autoload/session_timer.gd` | Günlük süre sınırı |
| `autoload/app_state.gd` | Aktif profil ve sahne geçişleri |
| `scenes/components/*` | `AssetImage`, `ClayTile`, `BigButton`, `ReplayVoiceButton`, `SubtitleBubble` |
| `scenes/games/mini_game.gd` | `MiniGame` taban sınıfı |
| `scenes/games/{count_choose,drag_match,listen_find}/` | İlk üç şablon |
| `scenes/ui/*` | Kabuk ekranlar |
| `tools/missing_assets.gd` | Eksik asset raporu ve parti taslağı |
| `content/**` | Metinler, ses satırları, çıkartmalar, 1. sınıf Matematik ünite 1 |
| `docs/curriculum/outcomes.json` | Doğrulanmış öğrenme çıktıları (kaynaklı) |

---

## FAZ 0 — Altyapı

### Task 1: Godot proje iskeleti, GUT ve lisanslar

**Files:**
- Create: `project.godot`, `icon.svg`, `scenes/ui/splash.tscn`, `scenes/ui/splash.gd`, `addons/gut/**` (GUT v9.7.1 release'inden), `.gutconfig.json`, `tests/unit/test_smoke.gd`, `LICENSE` (MIT), `LICENSE-CONTENT.md` (CC BY 4.0: `content/`, `assets/`, `docs/`), `assets/fonts/` (Andika, SIL OFL) + `assets/fonts/LICENSES.md`
- Modify: `README.md` (lisans bölümü)

**Interfaces:**
- Produces: `godot --headless --path . -s addons/gut/gut_cmdln.gd -gdir=res://tests -ginclude_subdirs -gexit` komutu 0 ile çıkar.

- [ ] **Step 1:** `scripts/setup-godot.sh` çalıştır, `godot --version` çıktısında `4.7.2.stable` gör.
- [ ] **Step 2:** GUT v9.7.1'i `addons/gut/` altına koy (release zip'inden yalnızca `addons/gut`). Sürüm notlarında Godot 4.7 uyumluluğunu kontrol et; uyumsuzsa 9.7.x serisinin uyumlu en son sürümünü seç ve sürümü commit mesajına yaz.
- [ ] **Step 3:** `project.godot` dosyasını oluştur:
  - `application/config/name="Bilgi Adası"`, `run/main_scene="res://scenes/ui/splash.tscn"`
  - `display/window/size/viewport_width=1920`, `viewport_height=1080`, `stretch/mode="canvas_items"`, `stretch/aspect="expand"`, `handheld/orientation=6` (sensor_landscape)
  - `rendering/renderer/rendering_method="mobile"`
  - GUT eklentisi etkin
  - Varsayılan tema yazı tipi Andika
- [ ] **Step 4:** Başarısız duman testi yaz:

```gdscript
# tests/unit/test_smoke.gd
extends GutTest
func test_main_scene_is_splash() -> void:
	assert_eq(ProjectSettings.get_setting("application/run/main_scene"), "res://scenes/ui/splash.tscn")
func test_splash_instantiates() -> void:
	var s: Node = load("res://scenes/ui/splash.tscn").instantiate()
	assert_not_null(s)
	s.free()
```

- [ ] **Step 5:** Testleri çalıştır. Splash sahnesi yoksa FAIL beklenir.
- [ ] **Step 6:** `splash.tscn` oluştur: tam ekran renkli arka plan ve ortada `strings.tr.json`'dan oyun adı. Bu görevde `content/strings.tr.json` dosyasını `{"app.title": "Bilgi Adası"}` ile başlat ve doğrudan `JSON.parse_string` ile oku; Task 7 bunu Narrator/Strings servisine taşıyacak.
- [ ] **Step 7:** Testleri çalıştır, PASS. `godot --headless --path . --import` hatasız bitsin.
- [ ] **Step 8:** Commit: `chore: Godot 4.7.2 proje iskeleti, GUT, lisanslar`

### Task 2: CI ve Android debug export

**Files:**
- Create: `.github/workflows/ci.yml`, `export_presets.cfg`, `scripts/ci-android-setup.sh`
- Modify: `CLAUDE.md` (gerekirse komut düzeltmeleri)

**Interfaces:**
- Consumes: Task 1 test komutu, `scripts/setup-godot.sh --with-templates`.
- Produces: Her push ve PR'da `test` işi; `main`'e push'ta ve PR'larda `android-debug` işi `bilgi-adasi-debug.apk` artefaktını yükler.

- [ ] **Step 1:** `export_presets.cfg` içinde tek preset oluştur: `name="Android"`, `platform="Android"`, `export_path="build/android/bilgi-adasi-debug.apk"`, paket adı `io.github.codehepta.bilgiadasi`, mimariler `arm64-v8a` ve `armeabi-v7a`, gradle build kapalı, **bütün `permissions/*` false** (internet dahil). Keystore yolları boş kalır, CI ortam değişkenleriyle verilir.
- [ ] **Step 2:** `scripts/ci-android-setup.sh` yaz:
  - Debug keystore'u `keytool` ile üret.
  - `GODOT_ANDROID_KEYSTORE_DEBUG_PATH`, `GODOT_ANDROID_KEYSTORE_DEBUG_USER=androiddebugkey`, `GODOT_ANDROID_KEYSTORE_DEBUG_PASSWORD=android` değerlerini `$GITHUB_ENV`'e yaz.
  - `~/.config/godot/editor_settings-4.7.tres` içine `export/android/android_sdk_path` ve `export/android/java_sdk_path` değerlerini yaz.
- [ ] **Step 3:** `ci.yml` iki işten oluşur:
  - **`test`** (ubuntu-latest): checkout → `scripts/setup-godot.sh` → `godot --headless --path . --import` → GUT komutu. JUnit çıktısı (`-gjunit_xml_file=build/junit.xml`) artefakt olarak yüklenir.
  - **`android-debug`** (`needs: test`): `actions/setup-java@v4` (temurin 17) → `android-actions/setup-android@v3` → `scripts/setup-godot.sh --with-templates` → `scripts/ci-android-setup.sh` → import → `godot --headless --path . --export-debug "Android" build/android/bilgi-adasi-debug.apk` → `actions/upload-artifact@v4`. Godot export şablonları önbelleğe alınır (`actions/cache`, anahtar: Godot sürümü).
- [ ] **Step 4:** Dalı push et, PR aç. İki işin de yeşil olduğunu ve APK artefaktının ≥1 MB olduğunu doğrula. Kırmızıysa log'a göre düzelt (en sık sorunlar: SDK yolu, build-tools sürümü, keystore ortam değişkenleri).
- [ ] **Step 5:** Commit: `ci: test ve Android debug APK iş akışı`

---

## FAZ 1 — Çekirdek çatı ve dikey dilim

### Task 3: Saf mantık — ustalık, Leitner, yıldız

**Files:**
- Create: `scripts/core/mastery.gd`, `scripts/core/leitner.gd`, `scripts/core/stars.gd`
- Test: `tests/unit/test_mastery.gd`, `tests/unit/test_leitner.gd`, `tests/unit/test_stars.gd`

**Interfaces:**
- Produces:
  - `class_name Mastery` — `static func result_value(attempt: int, helped: bool) -> float`, `static func update(m: float, r: float) -> float`, `static func difficulty_adjust(m: float) -> int`, `static func played_difficulty(base: int, m: float) -> int`
  - `class_name Leitner` — `const INTERVALS: Array[int] = [0, 1, 3, 7, 14]`, `static func promote(box: int) -> int`, `static func reset() -> int` (1 döner), `static func due_day(box: int, today: int) -> int`, `static func is_due(due: int, today: int) -> bool`
  - `class_name Stars` — `static func compute(total_wrong: int) -> int`

- [ ] **Step 1:** Başarısız testleri yaz (önemli doğrulamalar):

```gdscript
# test_mastery.gd
assert_eq(Mastery.result_value(1, false), 1.0)
assert_eq(Mastery.result_value(2, false), 0.6)
assert_eq(Mastery.result_value(3, false), 0.3)
assert_eq(Mastery.result_value(3, true), 0.0)
assert_almost_eq(Mastery.update(0.0, 1.0), 0.3, 0.0001)
assert_almost_eq(Mastery.update(0.5, 0.6), 0.53, 0.0001)
assert_eq(Mastery.difficulty_adjust(0.8), 1)
assert_eq(Mastery.difficulty_adjust(0.4), -1)
assert_eq(Mastery.difficulty_adjust(0.6), 0)
assert_eq(Mastery.played_difficulty(1, 0.0), 1)   # alt sınır
assert_eq(Mastery.played_difficulty(3, 0.9), 3)   # üst sınır
assert_eq(Mastery.played_difficulty(2, 0.9), 3)
# test_leitner.gd
assert_eq(Leitner.promote(1), 2); assert_eq(Leitner.promote(5), 5)
assert_eq(Leitner.due_day(1, 100), 100); assert_eq(Leitner.due_day(4, 100), 107); assert_eq(Leitner.due_day(5, 100), 114)
assert_true(Leitner.is_due(100, 100)); assert_false(Leitner.is_due(101, 100))
# test_stars.gd
assert_eq(Stars.compute(0), 3); assert_eq(Stars.compute(1), 3)
assert_eq(Stars.compute(2), 2); assert_eq(Stars.compute(3), 2); assert_eq(Stars.compute(4), 1)
```

- [ ] **Step 2:** Çalıştır → FAIL (sınıflar yok).
- [ ] **Step 3:** Üç dosyayı uygula. `attempt` 1'den başlar; `attempt >= 3 && !helped` için 0.3 döner.
- [ ] **Step 4:** Çalıştır → PASS.
- [ ] **Step 5:** Commit: `feat(core): ustalık, Leitner ve yıldız hesapları`

### Task 4: Saf mantık — veli kapısı sorusu

**Files:**
- Create: `scripts/core/parent_gate_quiz.gd`
- Test: `tests/unit/test_parent_gate_quiz.gd`

**Interfaces:**
- Produces: `class_name ParentGateQuiz` — `static func generate(rng: RandomNumberGenerator) -> Dictionary` döner: `{"text": String, "answer": int}`. `static func check(q: Dictionary, input: String) -> bool`

Soru biçimi: `"{A} ile {B_acc} çarpın."` A ∈ 11..19, B ∈ 3..9. Bu, spec'teki tek metin istisnasıdır: kalıp ve sözcükler `strings.tr.json`'da tutulur (`gate.question` = `"{a} ile {b} çarpın."`, `num.11`…`num.19`, `num_acc.3`…`num_acc.9`). Değerler:
- 11–19: on bir, on iki, on üç, on dört, on beş, on altı, on yedi, on sekiz, on dokuz
- Belirtme hali (3–9): üçü, dördü, beşi, altıyı, yediyi, sekizi, dokuzu

- [ ] **Step 1:** Başarısız testleri yaz:
  - Sabit tohumla (`rng.seed = 42`) üretilen sorunun `answer == A*B` olması ve metnin `" ile "` ile `" çarpın."` içermesi.
  - 1000 üretimde A ∈ [11,19] ve B ∈ [3,9].
  - `check(q, "84")` doğru cevapta true; `check(q, " 84 ")` true (boşluk kırpılır); `check(q, "abc")` false; `check(q, "")` false.
  - `14×6` için metin `"on dört ile altıyı çarpın."`.
- [ ] **Step 2:** Çalıştır → FAIL.
- [ ] **Step 3:** Uygula. Metinleri `Strings` (Task 7) hazır olmadığı için bu görevde `strings.tr.json`'u doğrudan okuyan küçük bir yardımcıyla al; Task 7 bunu `Strings.t()`'ye çevirir. Anahtarları `strings.tr.json`'a ekle.
- [ ] **Step 4:** Çalıştır → PASS.
- [ ] **Step 5:** Commit: `feat(core): veli kapısı soru üretici`

### Task 5: SaveService — atomik kayıt, yedek, göç

**Files:**
- Create: `autoload/save_service.gd`, `scripts/core/save_schema.gd`
- Modify: `project.godot` (autoload `SaveService`)
- Test: `tests/unit/test_save_service.gd`

**Interfaces:**
- Produces:
  - `SaveSchema.new_save() -> Dictionary`, `SaveSchema.new_profile(id: String, avatar: String, nickname: String, grade: int) -> Dictionary`, `SaveSchema.migrate(data: Dictionary) -> Dictionary`, `const VERSION: int = 1`
  - `SaveService`: `var data: Dictionary`, `func load_or_create() -> void`, `func save() -> void`, `func set_base_dir(dir: String) -> void` (test için; varsayılan `user://`), `signal recovered_from_backup`, `signal reset_to_fresh`
- Kayıt şeması (v1):
```json
{ "schema_version": 1, "last_day_seen": 0,
  "settings": { "daily_limit_min": 0, "vol_voice": 1.0, "vol_music": 0.6, "vol_sfx": 0.8,
                "show_text_g1": false, "reduce_motion": false },
  "profiles": [ { "id": "p1", "avatar": "tavsan", "nickname": "", "grade": 1, "created_day": 0,
      "nodes": { "<node_id>": { "best_stars": 0, "plays": 0 } },
      "outcomes": { "<kod>": { "mastery": 0.0, "box": 1, "due": 0 } },
      "stickers": [], "usage": { "day": 0, "seconds": 0 } } ] }
```

- [ ] **Step 1:** Başarısız testleri yaz (her test geçici bir `user://test_<rastgele>/` dizini kullanır):
  - `test_fresh_install_creates_default`
  - `test_roundtrip_preserves_data`
  - `test_save_writes_backup_of_previous`: ikinci `save()` sonrası `save_v1.bak.json` önceki içeriği taşır.
  - `test_corrupt_main_falls_back_to_backup`: ana dosyaya `"{bozuk"` yaz → `load_or_create()` yedeği yükler ve `recovered_from_backup` yayar.
  - `test_both_corrupt_resets_and_signals`
  - `test_migrate_unknown_future_version_does_not_crash`: `schema_version: 99` → veri olduğu gibi yüklenir, yazma devre dışı kalmaz.
- [ ] **Step 2:** Çalıştır → FAIL.
- [ ] **Step 3:** Uygula. Yazma sırası: `save_v1.tmp.json`'a yaz → var olan ana dosyayı `.bak`'a kopyala → `DirAccess.rename` ile tmp'yi ana dosyaya taşı.
- [ ] **Step 4:** Çalıştır → PASS.
- [ ] **Step 5:** Commit: `feat: atomik kayıt servisi, yedekten kurtarma`

### Task 6: AssetRegistry ve yer tutucu bileşenleri

**Files:**
- Create: `scripts/core/asset_paths.gd`, `autoload/asset_registry.gd`, `scenes/components/asset_image.gd` + `.tscn`, `scenes/components/clay_tile.gd` + `.tscn`
- Modify: `project.godot` (autoload `AssetRegistry`)
- Test: `tests/unit/test_asset_paths.gd`, `tests/unit/test_asset_registry.gd`

**Interfaces:**
- Produces:
  - `class_name AssetPaths` — `static func image_path(key: String) -> String`, `static func audio_candidates(key: String) -> PackedStringArray`, `static func is_audio_key(key: String) -> bool`, `static func placeholder_color(key: String) -> Color`
  - `AssetRegistry`: `func texture(key: String) -> Texture2D` (yoksa `null`), `func audio(key: String) -> AudioStream` (yoksa `null`), `func missing_keys() -> PackedStringArray`, `func clear_cache() -> void`
  - `AssetImage` (TextureRect tabanlı): `@export var key: String`. Görsel varsa gösterir; yoksa `placeholder_color` ile köşesi yuvarlatılmış panel ve üzerinde `Strings.t("label." + key)` ya da anahtarın son parçasını gösterir.
  - `ClayTile` (Panel tabanlı): `@export var text: String`. Kil renkli, yuvarlak köşeli kutu üzerinde büyük Andika yazısı. Rakam ve harfler bununla çizilir.

- [ ] **Step 1:** Başarısız testleri yaz:

```gdscript
assert_eq(AssetPaths.image_path("char.bilge.happy"), "res://assets/images/characters/bilge/happy.png")
assert_eq(AssetPaths.image_path("st.matematik.elma"), "res://assets/images/stickers/matematik/elma.png")
assert_eq(AssetPaths.image_path("region.sayi_ormani.bg"), "res://assets/images/regions/sayi_ormani/bg.png")
assert_eq(AssetPaths.audio_candidates("vo.g1.matematik.u01.n01.intro"), PackedStringArray([
  "res://assets/audio/voice/g1/matematik/u01/n01/intro.ogg",
  "res://assets/audio/voice/g1/matematik/u01/n01/intro.wav",
  "res://assets/audio/voice/g1/matematik/u01/n01/intro.mp3"]))
assert_eq(AssetPaths.audio_candidates("vo.sayi.3")[0], "res://assets/audio/voice/sayi/3.ogg")
assert_eq(AssetPaths.placeholder_color("item.meyve.elma"), AssetPaths.placeholder_color("item.meyve.elma")) # deterministik
assert_eq(AssetPaths.image_path("bilinmeyen.x"), "")  # tanımsız önek → boş
```
  Registry testleri:
  - `texture("item.yok.yok")` null döner ve `missing_keys()` içinde yer alır.
  - Kök geçersiz kılma: `AssetRegistry.set_root_override("res://tests/fixtures/assets")` sonrası `texture("ui.test_fixture")` → `tests/fixtures/assets/images/ui/test_fixture.png` dosyasını yükler (null değil). Bu metot `AssetRegistry` arayüzüne eklenir: `func set_root_override(root: String) -> void` (boş string varsayılana döner).
- [ ] **Step 2:** Çalıştır → FAIL.
- [ ] **Step 3:** Uygula. Önek tablosu `naming.md`'den birebir alınır. Varlık kontrolü `ResourceLoader.exists()` ile yapılır. Renk: `hash(key)` → `Color.from_hsv(h, 0.45, 0.95)`.
- [ ] **Step 4:** Çalıştır → PASS.
- [ ] **Step 5:** Commit: `feat: asset kayıt defteri ve yer tutucu bileşenler`

### Task 7: Strings, Narrator, AudioDirector

**Files:**
- Create: `autoload/strings.gd`, `autoload/narrator.gd`, `autoload/audio_director.gd`, `default_bus_layout.tres`, `content/voice_lines.tr.json`, `scenes/components/subtitle_bubble.gd` + `.tscn`, `scenes/components/replay_voice_button.gd` + `.tscn`
- Modify: `project.godot` (autoload: `Strings`, `AudioDirector`, `Narrator` — bu sırayla, `AssetRegistry`'den sonra), Task 1/4'teki doğrudan JSON okumalarını `Strings.t()`'ye çevir
- Test: `tests/unit/test_strings.gd`, `tests/unit/test_narrator.gd`

**Interfaces:**
- Produces:
  - `Strings`: `func t(key: String, args: Dictionary = {}) -> String` (`{a}` biçiminde yer değiştirme; anahtar yoksa anahtarın kendisini döndürür ve uyarı loglar), `func has(key: String) -> bool`
  - `AudioDirector`: kanallar `Master`, `Voice`, `Music`, `SFX`. `func play_music(key: String) -> void`, `func play_sfx(key: String) -> void`, `func set_ducked(on: bool) -> void` (Music −12 dB), `func apply_volumes(settings: Dictionary) -> void`
  - `Narrator`: `signal subtitle_requested(text: String)`, `signal line_finished(id: String)`, `func say(id: String) -> void`, `func replay_last() -> void`, `func stop() -> void`, `var tts_backend: Callable` (test enjeksiyonu; varsayılan `DisplayServer.tts_speak` sarmalayıcı), `var tts_voice_lookup: Callable` (varsayılan `DisplayServer.tts_get_voices_for_language("tr")`)
  - `voice_lines.tr.json` biçimi: `{ "<id>": { "text": "...", "speaker": "BILGE"|"ANLATICI" } }`. `asset-requests/005` içindeki tüm satırlar ve `vo.sayi.0`–`vo.sayi.20` buraya girer.
- Davranış: `say(id)` → (1) ses dosyası varsa çal, ducking aç, bitince kapat; (2) yoksa ve Türkçe ses varsa TTS ile oku; (3) hiçbiri yoksa sessiz geç. Her durumda `subtitle_requested(text)` yayılır (ekranda gösterilip gösterilmeyeceğine UI karar verir) ve en sonunda `line_finished(id)` gelir. TTS ya da sessiz yolda `line_finished`, metin uzunluğuna göre tahmini süre sonunda yayılır: `max(1.0, karakter * 0.07)` sn.

- [ ] **Step 1:** Başarısız testleri yaz:
  - `test_t_substitutes_args`, `test_t_missing_key_returns_key`
  - `test_audio_file_preferred_over_tts`: registry'de ses varmış gibi enjekte et; `tts_backend` çağrılmamalı.
  - `test_falls_back_to_tts_when_no_file`: `tts_backend` bir kez çağrılır ve parametresi doğru metindir.
  - `test_no_turkish_voice_emits_subtitle`: `tts_voice_lookup` boş dizi döndürür → `tts_backend` çağrılmaz, `subtitle_requested` yayılır, `line_finished` gelir.
  - `test_unknown_line_id_does_not_crash`
- [ ] **Step 2:** Çalıştır → FAIL.
- [ ] **Step 3:** Uygula. `ReplayVoiceButton` 128×128 px, sol üstte durur ve `Narrator.replay_last()` çağırır. `SubtitleBubble`, `subtitle_requested`'e bağlanır; aktif profil 1. sınıfsa ve `show_text_g1` false ise gizli kalır, TTS sesi yoksa her durumda görünür.
- [ ] **Step 4:** Çalıştır → PASS.
- [ ] **Step 5:** Commit: `feat: metin servisi, anlatıcı (TTS yedekli), ses yönetimi`

### Task 8: İçerik — şema, doğrulayıcı, ContentDB, şablon kayıt defteri

**Files:**
- Create: `scripts/core/content_validator.gd`, `scripts/core/template_registry.gd`, `scripts/core/round_context.gd`, `scripts/core/round_result.gd`, `scenes/games/mini_game.gd`, `autoload/content_db.gd`, `content/stickers.json`, `docs/curriculum/outcomes.json` (yalnızca test için `"TEST.1"` girdisiyle başlar; gerçek kodlar Task 16'da), `tests/fixtures/content/g1/matematik/u01.json`
- Modify: `project.godot` (autoload `ContentDB`)
- Test: `tests/unit/test_content_validator.gd`, `tests/unit/test_content_db.gd`, `tests/unit/test_all_content_valid.gd`

**Interfaces:**
- Produces:
  - `class_name MiniGame extends Control`: `signal answered(correct: bool)`, `signal finished(result: RoundResult)`, `func setup(params: Dictionary, difficulty: int, ctx: RoundContext) -> void`, `func show_hint(level: int) -> void`, `static func validate_params(p: Dictionary) -> Array[String]`. Ayrıca korumalı yardımcılar: `var input_locked: bool`, `func _lock_input(seconds: float) -> void`
  - `class_name RoundContext extends RefCounted`: `var rng: RandomNumberGenerator`, `var voice_id: String`, `var outcomes: PackedStringArray`
  - `class_name RoundResult extends RefCounted`: `var attempts: int`, `var wrong: int`, `var helped: bool`, `var outcomes: PackedStringArray`
  - `class_name TemplateRegistry`: `const SCENES: Dictionary` (`"count_choose"`, `"drag_match"`, `"listen_find"` → `res://scenes/games/<id>/<id>.tscn`), `static func has(id: String) -> bool`, `static func validate(id: String, params: Dictionary) -> Array[String]` (şablon betiğinin static `validate_params` metodunu çağırır)
  - `class_name ContentValidator`: `static func validate_unit(unit: Dictionary, known_outcomes: PackedStringArray, has_string: Callable, has_voice: Callable) -> Array[String]`. Hata mesajları Türkçe, `<node_id>: <açıklama>` biçiminde.
  - `ContentDB`: `func load_all(root: String = "res://content") -> void`, `func units(grade: int, subject: String) -> Array[Dictionary]`, `func node(id: String) -> Dictionary`, `func next_node_id(id: String) -> String` (aynı dersin sonraki durağı, ünite sınırı geçilir; yoksa `""`), `func subjects_for_grade(grade: int) -> PackedStringArray` (1–2: `matematik`, `turkce`, `hayat_bilgisi`; 3: + `fen`), `var errors: Array[String]`
  - `const SUBJECT_REGION := {"matematik": "sayi_ormani", "turkce": "harf_vadisi", "hayat_bilgisi": "hayat_kasabasi", "fen": "kesif_laboratuvari"}`. Bu sabit `ContentDB` içinde durur.
  - `outcomes.json` biçimi: `{ "<kod>": { "grade": 1, "subject": "matematik", "text": "...", "source": { "doc": "...", "page": 0, "url": "..." } } }`
- Kurallar: spec §4.3. Ünite şemasında zorunlu alanlar `id`, `grade`, `subject`, `title_key`, `source`, `nodes[]`; her durakta `id`, `outcomes` (boş değil, hepsi bilinen), `title_key`, `intro_voice`, `sticker`, `rounds[]` (≥1); her turda `template` (kayıtlı), `difficulty` (1–3), `voice`, `params` (şablon doğrulamasından geçer). Kimlik biçimi `^g[1-3]\.[a-z_]+\.u\d{2}\.n\d{2}$`, birim kimliği ile öneki tutarlı olmalı. Sürüm derlemesinde (`OS.is_debug_build() == false`) hatalı durak atlanır.

- [ ] **Step 1:** Başarısız testleri yaz:
  - Geçerli fixture → `[]`.
  - Her kural için bir negatif test: boş `outcomes`, bilinmeyen kod, bilinmeyen şablon, `difficulty: 4`, yinelenen düğüm kimliği, hatalı kimlik biçimi, eksik `voice` anahtarı, şablon parametre hatası.
  - `next_node_id` ünite sınırını geçer; son durakta `""` döner.
  - `subjects_for_grade(3)` `fen` içerir, `subjects_for_grade(1)` içermez.
  - `test_all_content_valid`: `res://content` altındaki her ünite dosyası `validate_unit`'ten boş hata listesiyle geçer. Bu test CI'da içerik kapısıdır.
- [ ] **Step 2:** Çalıştır → FAIL.
- [ ] **Step 3:** Uygula. Bu görevde şablon sahneleri henüz yok. `TemplateRegistry.validate` için test fixture'ında `count_choose` kullan ve Task 11 tamamlanana kadar bu testi `pending()` ile işaretle; ya da Task 11'in `count_choose.gd` dosyasını yalnızca `validate_params` ile burada oluştur. **İkincisi tercih edilir.**
- [ ] **Step 4:** Çalıştır → PASS.
- [ ] **Step 5:** Commit: `feat: içerik şeması, doğrulayıcı, ContentDB`

### Task 9: Progress — profil ilerlemesi

**Files:**
- Create: `autoload/progress.gd`, `scripts/core/day_clock.gd`
- Modify: `project.godot` (autoload `Progress`)
- Test: `tests/unit/test_progress.gd`

**Interfaces:**
- Consumes: `SaveService.data`, `Mastery`, `Leitner`, `Stars`, `ContentDB`
- Produces:
  - `class_name DayClock extends RefCounted`: `func today() -> int` (yerel tarihe göre epoch'tan bu yana gün; `Time.get_unix_time_from_system()` + `Time.get_time_zone_from_system().bias`), testte `var fixed_day: int = -1` ile sabitlenir
  - `Progress`: `var clock: DayClock`
    - `func create_profile(avatar: String, nickname: String, grade: int) -> String` (en fazla 4; doluysa `""`)
    - `func delete_profile(id: String) -> void`, `func profiles() -> Array[Dictionary]`
    - `func set_grade(id: String, grade: int) -> void`
    - `func node_state(profile_id: String, node_id: String) -> String` → `"locked" | "open" | "done"`. Bir dersin ilk durağı her zaman açıktır; bir durak, önceki durak `done` ise açılır.
    - `func best_stars(profile_id: String, node_id: String) -> int`
    - `func outcome_mastery(profile_id: String, code: String) -> float`
    - `func record_node(profile_id: String, node_id: String, results: Array[RoundResult]) -> Dictionary` → `{"stars": int, "new_sticker": String, "unlocked": String}`. Yıldızı `Stars` ile hesaplar, en iyisini saklar, `plays`'i artırır; her `RoundResult` için çıktıların ustalığını günceller; Leitner'i günceller; ilk tamamlanışta durağın `sticker`'ını ekler; `next_node_id`'yi döndürür; ardından `SaveService.save()` çağırır.
    - `func due_outcomes(profile_id: String) -> PackedStringArray`
- Ustalıkta kullanılan `attempt` değeri `RoundResult.wrong + 1`'dir; `helped` doğrudan aktarılır.

- [ ] **Step 1:** Başarısız testleri yaz (bellek içi SaveService ve fixture içerikle):
  - `test_create_up_to_four_profiles`: beşinci profil `""` döner.
  - `test_first_node_open_others_locked`
  - `test_record_node_unlocks_next_and_awards_sticker_once`: aynı durak ikinci kez oynanınca çıkartma tekrar verilmez.
  - `test_best_stars_kept`: 3 yıldız ardından 1 yıldız → 3 kalır.
  - `test_mastery_updates_from_results`: wrong=0 olan tek tur → ustalık 0.3; wrong=1 → 0.18.
  - `test_leitner_promote_on_two_stars_reset_on_helped`
  - `test_grade_change_preserves_progress`: 1. sınıfta durak tamamla → `set_grade(2)` → `set_grade(1)` → yıldızlar duruyor.
- [ ] **Step 2:** Çalıştır → FAIL.
- [ ] **Step 3:** Uygula.
- [ ] **Step 4:** Çalıştır → PASS.
- [ ] **Step 5:** Commit: `feat: ilerleme servisi (yıldız, ustalık, Leitner, çıkartma)`

### Task 10: SessionTimer — günlük süre sınırı

**Files:**
- Create: `autoload/session_timer.gd`
- Modify: `project.godot` (autoload `SessionTimer`)
- Test: `tests/unit/test_session_timer.gd`

**Interfaces:**
- Consumes: `SaveService.data.settings.daily_limit_min`, `profile.usage`, `DayClock`, `SaveService.data.last_day_seen`
- Produces: `signal limit_reached`, `func start(profile_id: String) -> void`, `func stop() -> void`, `func tick(delta_s: float) -> void` (testte doğrudan çağrılır, `_process` de bunu çağırır), `func is_locked(profile_id: String) -> bool`, `func remaining_seconds(profile_id: String) -> int` (sınır kapalıysa `-1`), `func parent_unlock_today(profile_id: String) -> void` (bugünlük sınırı kaldırır)
- Kurallar:
  - Etkin gün = `max(clock.today(), last_day_seen)`. `last_day_seen` asla azalmaz.
  - `usage.day` etkin günden küçükse `seconds` sıfırlanır.
  - Sınıra ulaşıldığında `limit_reached` **bir kez** yayılır. UI mevcut turu bitirip SessionEnd'e gider (Task 15).
  - Kullanım her 15 saniyede bir ve `stop()` çağrıldığında kaydedilir.

- [ ] **Step 1:** Başarısız testleri yaz:
  - `test_disabled_limit_never_locks`
  - `test_limit_reached_emits_once`: 10 dk sınırla `tick(601)` → sinyal bir kez yayılır; ardından `tick(10)` → tekrar yayılmaz.
  - `test_new_day_resets_usage`
  - `test_clock_moved_back_does_not_reset_usage`: 100. günde sınır doluyken saat 99. güne alınır → hâlâ kilitli.
  - `test_parent_unlock_today`
- [ ] **Step 2:** Çalıştır → FAIL.
- [ ] **Step 3:** Uygula.
- [ ] **Step 4:** Çalıştır → PASS.
- [ ] **Step 5:** Commit: `feat: günlük süre sınırı`

### Task 11: İlk üç mini oyun şablonu

**Files:**
- Create: `scenes/games/count_choose/count_choose.{gd,tscn}`, `scenes/games/drag_match/drag_match.{gd,tscn}`, `scenes/games/listen_find/listen_find.{gd,tscn}`, `scenes/games/token_view.{gd,tscn}`
- Test: `tests/unit/test_template_params.gd`, `tests/integration/test_templates_play.gd`

**Interfaces:**
- Consumes: `MiniGame`, `RoundContext`, `RoundResult`, `AssetImage`, `ClayTile`, `Narrator`, `AudioDirector`
- Produces:
  - **Token** (bütün şablonlarda ortak öğe tanımı): `{"type": "item", "value": "<asset key>"}` | `{"type": "number", "value": <int>}` | `{"type": "text", "value": "<strings key>"}`, isteğe bağlı `"voice": "<vo id>"`. `TokenView` bir token'ı çizer: item → `AssetImage`, number/text → `ClayTile`.
  - `count_choose` parametreleri: `{"item": String, "count": int (1–20), "choices": Array[int] (2–4 eleman, count'u içerir, tekrarsız)}`. Nesneler sahnede `count` adet olarak (rng ile hafif dağınık, çakışmasız) dizilir. Seçenekler `ClayTile` butonlarıdır. İpucu 1: nesneler sırayla zıplar ve `vo.sayi.<n>` okunur. İpucu 2: doğru seçenek parlar ve otomatik seçilir.
  - `drag_match` parametreleri: `{"pairs": Array[{"left": Token, "right": Token}] (2–4)}`. Sağ sütun rng ile karıştırılır. Doğru bırakmada öğe yerine oturur; yanlış bırakmada geri seker ve `answered(false)` yayılır. Tüm çiftler eşleşince `finished` gelir. İpucu 1: eşleşmemiş ilk çiftin hedefi parlar. İpucu 2: o çift otomatik eşleşir. Yardım kalan çiftler için sürer.
  - `listen_find` parametreleri: `{"target": Token (voice zorunlu), "options": Array[Token] (2–4, target'ı içerir)}`. Kurulumda hedefin sesi okunur, seçenekler karışık dizilir. İpucu 1: yanlış seçeneklerden biri soluklaşır. İpucu 2: doğru seçenek parlar.
- Ortak davranış (MiniGame tabanında):
  - Her cevaptan sonra `input_locked = true`. Doğru cevapta kilit 0.8 sn, yanlışta 0.6 sn sürer (`reduce_motion` açıkken 0.3 sn).
  - Kilitliyken gelen dokunmalar yok sayılır.
  - Doğru cevapta `sfx.correct` + rastgele bir `vo.genel.aferin_1..5` çalar, ardından `finished(result)` yayılır.
  - Dokunma hedefleri ≥128 px.

- [ ] **Step 1:** Başarısız parametre testlerini yaz: her şablon için bir geçerli örnek ve en az üç geçersiz örnek. Örnekler: `count: 0`, `count: 21`, choices'ta count yok, `pairs` 1 eleman, options'ta target yok, target'ta voice yok.
- [ ] **Step 2:** Başarısız oyun testlerini yaz (sahneyi örnekle, `setup` çağır, cevabı simüle et):
  - `test_count_choose_correct_emits_finished`
  - `test_count_choose_wrong_emits_answered_false`
  - `test_input_locked_during_feedback`: yanlış cevaptan hemen sonra ikinci dokunma → `answered` toplamda bir kez yayılır.
  - `test_drag_match_finishes_after_all_pairs`
  - `test_listen_find_speaks_target_on_setup`: sahte `Narrator` ile `say` çağrısı yakalanır.
  - `test_show_hint_2_resolves_round`: her şablonda `show_hint(2)` sonunda `finished` yayılır.
  Simülasyonda şablonlar test için `func _debug_choose(index: int) -> void` (count_choose, listen_find) ve `func _debug_drop(left_index: int, right_index: int) -> void` (drag_match) sunar. Bunlar gerçek girişle aynı kod yolunu kullanır.
- [ ] **Step 3:** Çalıştır → FAIL.
- [ ] **Step 4:** Uygula.
- [ ] **Step 5:** Çalıştır → PASS.
- [ ] **Step 6:** Commit: `feat(games): count_choose, drag_match, listen_find şablonları`

### Task 12: LessonRunner

**Files:**
- Create: `scenes/ui/lesson_runner.{gd,tscn}`, `scenes/components/big_button.{gd,tscn}`
- Test: `tests/integration/test_lesson_runner.gd`

**Interfaces:**
- Consumes: `ContentDB.node()`, `TemplateRegistry.SCENES`, `Mastery.played_difficulty`, `Progress.outcome_mastery`, `Progress.record_node`, `Narrator`, `MiniGame` sinyalleri
- Produces: `signal lesson_completed(summary: Dictionary)` (`record_node`'un dönüşü + `node_id`), `func start(profile_id: String, node_id: String, rng_seed: int = -1) -> void`, `func current_round_index() -> int`, `func current_game() -> MiniGame` (test için)
- Akış:
  1. `intro_voice` okunur.
  2. Turlar sırayla yüklenir: zorluk `Mastery.played_difficulty(round.difficulty, Progress.outcome_mastery(profile, node.outcomes[0]))`.
  3. Tur içi yanlış sayacına göre: 1 → `Narrator.replay_last()` + `sfx.wrong` + rastgele `vo.genel.tekrar_dene_1..3`; 2 → `vo.genel.ipucu` + `show_hint(1)`; 3 → `vo.genel.cozum` + `show_hint(2)`, `helped = true`, tur (yeniden eklenmemişse) kuyruğun sonuna eklenir ve `vo.genel.sonra_tekrar` okunur.
  4. Kuyruk bitince `Progress.record_node(...)` çağrılır ve `lesson_completed` yayılır.
  5. Üst çubukta `ReplayVoiceButton` ve ev butonu (onaysız çıkış; ilerleme kaydedilmez) bulunur.
  6. `SessionTimer.limit_reached` gelirse mevcut tur bitince ders sonlandırılır, ilerleme kaydedilir ve `lesson_completed` yine yayılır (`summary.time_up = true`).

- [ ] **Step 1:** Başarısız entegrasyon testlerini yaz (fixture ünite: 3 turlu bir durak; sahte Narrator; SaveService geçici dizinde):
  - `test_all_correct_gives_three_stars_and_unlocks`
  - `test_two_wrong_triggers_hint_level_1`
  - `test_three_wrong_requeues_round_once`: tur sayısı 3'ten 4'e çıkar; yeniden eklenen turda tekrar 3 yanlış → bir daha eklenmez.
  - `test_double_answer_counted_once`: aynı karede iki `answered(false)` yayılır ama yanlış sayısı 1 artar (runner da kilit uygular).
  - `test_time_up_finishes_after_current_round`
  - `test_difficulty_uses_mastery`: ustalık 0.9 iken taban 1 → şablona 2 gider.
- [ ] **Step 2:** Çalıştır → FAIL.
- [ ] **Step 3:** Uygula.
- [ ] **Step 4:** Çalıştır → PASS.
- [ ] **Step 5:** Commit: `feat: LessonRunner (ipucu, yeniden sorma, yıldız)`

### Task 13: AppState ve profil akışı

**Files:**
- Create: `autoload/app_state.gd`, `scenes/ui/splash.gd` (güncelle), `scenes/ui/profile_select.{gd,tscn}`, `scenes/ui/profile_create.{gd,tscn}`
- Modify: `project.godot` (autoload `AppState` en sonda)
- Test: `tests/integration/test_profile_flow.gd`

**Interfaces:**
- Produces:
  - `AppState`: `var profile_id: String`, `const SCENES := {"splash", "profile_select", "profile_create", "world_map", "region_path", "lesson", "result", "album", "parent_gate", "parent_panel", "session_end"}` → yollar, `func goto(scene: String, args: Dictionary = {}) -> void` (hedef sahnede varsa `func enter(args: Dictionary) -> void` çağrılır), `func current_scene_name() -> String`
- Ekranlar:
  - **Splash:** 1.5 sn logo ve `vo.genel.hosgeldin`. Profil yoksa ProfileCreate'e, varsa ProfileSelect'e geçer.
  - **ProfileSelect:** en fazla 4 avatar kartı, "+" kartı (4 profil varsa gizli), sağ altta küçük dişli simgesi (veli kapısı). Açılışta `vo.genel.profil_sec` okunur.
  - **ProfileCreate:** 3 adım. (1) 6 avatar ızgarası (`avatar.*`) + `vo.genel.avatar_sec`; (2) 1/2/3 büyük `ClayTile` + `vo.genel.sinif_sec`; (3) isteğe bağlı takma ad alanı: Türkçe klavye, en fazla 12 karakter, "Geç" butonu. Takma ad alanının üstünde "Bu adımı bir büyüğünle yap" metni (strings) bulunur.
  - Profil oluşturulunca `SessionTimer` kilidi kontrol edilir: kilitliyse SessionEnd'e, değilse WorldMap'e geçilir.

- [ ] **Step 1:** Başarısız testleri yaz: profil yokken splash → `profile_create`; avatar ve sınıf seçimi → `Progress.profiles().size() == 1` ve sahne `world_map`; 4 profil varken "+" kartı görünmez; kilitli profil seçilince sahne `session_end`.
- [ ] **Step 2:** Çalıştır → FAIL.
- [ ] **Step 3:** Uygula.
- [ ] **Step 4:** Çalıştır → PASS.
- [ ] **Step 5:** Commit: `feat(ui): uygulama durumu ve profil akışı`

### Task 14: Harita, patika, sonuç ekranı, çıkartma albümü

**Files:**
- Create: `scenes/ui/world_map.{gd,tscn}`, `scenes/ui/region_path.{gd,tscn}`, `scenes/ui/result.{gd,tscn}`, `scenes/ui/sticker_album.{gd,tscn}`, `scenes/components/star_burst.{gd,tscn}`
- Test: `tests/integration/test_map_flow.gd`

**Interfaces:**
- Consumes: `ContentDB.subjects_for_grade`, `ContentDB.units`, `ContentDB.SUBJECT_REGION`, `Progress.node_state`, `Progress.best_stars`, `LessonRunner.lesson_completed`, `AppState.goto`
- Ekranlar:
  - **WorldMap:** `map.island` arka planı, 4 bölge butonu (`region.<r>.icon` + bölge adı sesi), ortada ağaç ev (Faz 7'ye kadar "yakında" sesi), üst köşede albüm ve avatar. Sınıf 1–2'de Keşif Laboratuvarı soluk ve kilitli görünür, dokununca `vo.bolge.kilitli_lab` okunur. Bölge müziği yerine `music.menu` çalar.
  - **RegionPath** (`args.subject`): `region.<r>.bg`, dersin bütün düğümleri yatay kaydırılabilir kıvrımlı patikada dizilir, durum ikonları `map.stop_open|done|locked` olur, yanlarında yıldızlar gösterilir. Kilitli düğüme dokunulunca hafif sallanır. Açılışta `music.<region>` ve `vo.genel.durak_sec` çalar. İçeriği olmayan ders için Bilge "yakında" sesiyle haritaya döner.
  - **Lesson:** `AppState.goto("lesson", {"node_id": id})` → LessonRunner. Bitince Result'a geçilir.
  - **Result:** `StarBurst` ile 1–3 yıldız tek tek gelir (`sfx.star` + `vo.genel.yildiz_N`), yeni çıkartma varsa çıkartma animasyonu + `vo.genel.cikartma` gelir. "Devam" (patikaya dön, yeni açılan düğüm parlar) ve "Tekrar oyna" butonları bulunur. `time_up` ise doğrudan SessionEnd'e gidilir.
  - **StickerAlbum:** her ders için bir sekme; `content/stickers.json`'daki sırayla ızgara. Kazanılmamış çıkartmalar `ui.sticker_frame` boş yuvası olarak gösterilir.
- `stickers.json` biçimi: `{ "matematik": ["st.matematik.elma", ...], "turkce": [...], ... }`

- [ ] **Step 1:** Başarısız testleri yaz:
  - 1. sınıf profilde WorldMap'te `fen` bölgesi kilitli, 3. sınıf profilde açık.
  - RegionPath ilk düğümü `open`, diğerlerini `locked` gösterir.
  - Ders tamamlanınca Result'a gidilir, ardından "Devam" → RegionPath'te ikinci düğüm `open` olur.
  - Albüm kazanılan çıkartmayı dolu gösterir.
- [ ] **Step 2:** Çalıştır → FAIL.
- [ ] **Step 3:** Uygula.
- [ ] **Step 4:** Çalıştır → PASS.
- [ ] **Step 5:** Commit: `feat(ui): harita, patika, sonuç ve çıkartma albümü`

### Task 15: Veli kapısı, veli paneli, oturum sonu

**Files:**
- Create: `scenes/ui/parent_gate.{gd,tscn}`, `scenes/ui/parent_panel.{gd,tscn}`, `scenes/ui/session_end.{gd,tscn}`, `scripts/core/progress_export.gd`
- Test: `tests/unit/test_progress_export.gd`, `tests/integration/test_parent_flow.gd`

**Interfaces:**
- Consumes: `ParentGateQuiz`, `SessionTimer`, `Progress`, `SaveService`, `AudioDirector.apply_volumes`
- Produces:
  - `class_name ProgressExport`: `static func to_json(save: Dictionary) -> String`, `static func from_json(text: String) -> Dictionary` (geçersizse `{}`; `schema_version` ve `profiles` dizisi zorunlu)
  - **ParentGate** (`args.next`: hedef sahne + argümanlar): soru metni, 0–9 tuş takımı, sil ve tamam tuşları. Açılışta `vo.genel.veli_cagir` okunur. Yanlış cevapta yeni soru gelir. Doğru cevapta `args.next`'e gidilir.
  - **ParentPanel:**
    - Profil seçici.
    - Her ders ve öğrenme çıktısı için ustalık çubuğu (çıktı metni `outcomes.json`'dan) ve son oynanma tarihi.
    - Günlük sınır seçimi (0/10/15/20/30).
    - Üç ses kaydırıcısı (anlık uygulanır).
    - "1. sınıfta ekran metni" ve "hareketi azalt" anahtarları.
    - Sınıf değiştirme; profil silme (ikinci onay iletişim kutusuyla).
    - "Bugünlük süreyi aç" (`parent_unlock_today`).
    - Dışa aktar: `OS.get_user_data_dir()` altına `bilgi-adasi-yedek-<gün>.json` yazılır, Android'de paylaşım için yol gösterilir.
    - İçe aktar: dosya seçici ile alınır, `from_json` boş dönerse hata mesajı gösterilir ve **mevcut kayıt değişmez**.
  - **SessionEnd:** `char.bilge.sleepy` + `vo.genel.uyku_zamani`, tek buton: veli kapısı → ParentPanel.
  - WorldMap, RegionPath ve LessonRunner `SessionTimer.limit_reached`'e bağlanır (LessonRunner zaten Task 12'de bağlı). Diğer ekranlar sinyal gelince doğrudan SessionEnd'e gider.

- [ ] **Step 1:** Başarısız testleri yaz:
  - `ProgressExport` gidiş-dönüşü veriyi korur.
  - `from_json("{bozuk")` → `{}`; `from_json('{"profiles": 3}')` → `{}`.
  - `test_import_invalid_keeps_current_save`
  - Kapıda doğru cevap → `parent_panel`, yanlış cevap → aynı sahnede yeni soru.
  - Sınır değiştirilince `SaveService.data.settings.daily_limit_min` güncellenir ve kaydedilir.
- [ ] **Step 2:** Çalıştır → FAIL.
- [ ] **Step 3:** Uygula.
- [ ] **Step 4:** Çalıştır → PASS.
- [ ] **Step 5:** Commit: `feat(ui): veli kapısı, veli paneli, oturum sonu`

### Task 16: 1. sınıf Matematik ilk ünite içeriği ve eksik asset aracı

**Files:**
- Create: `content/g1/matematik/u01.json`, `tools/missing_assets.gd`, `asset-requests/007-g1-matematik-u01-seslendirme.md`
- Modify: `docs/curriculum/outcomes.json` (`TEST.1`'i yalnızca fixture'da bırak, gerçek kodları ekle), `content/strings.tr.json`, `content/voice_lines.tr.json`, `content/stickers.json`, `asset-requests/README.md`
- Test: `tests/unit/test_all_content_valid.gd` (Task 8; artık gerçek içeriği kapsar)

**Interfaces:**
- Consumes: Task 8 şeması, Task 11 şablon parametreleri
- Produces: `godot --headless --path . -s res://tools/missing_assets.gd` → stdout'a eksik anahtar listesi (tür bazında gruplu) yazar ve `build/missing_assets.md` taslağını üretir. Taslakta görseller için `docs/assets/style-guide.md` blok adı, ses satırları için tablo yer alır.

- [ ] **Step 1: Kaynak doğrulama.** Resmi TYMM 1. sınıf Matematik öğretim programını (tymm.meb.gov.tr ya da mufredat.meb.gov.tr) bul. İlk temanın ya da ünitenin öğrenme çıktılarını **kod, metin, PDF adı, sayfa ve URL** ile `outcomes.json`'a yaz. Kaynağa erişilemiyorsa **dur** ve sahibe bildir: hangi URL'ler denendi, hangi hata alındı. Kod uydurma.
- [ ] **Step 2:** `u01.json`'u yaz:
  - Doğrulanan çıktılara karşılık gelen **4–6 durak**, her durakta 3–5 tur.
  - Yalnızca `count_choose`, `drag_match` ve `listen_find` kullanılır; nesneler `asset-requests/004`'teki anahtarlardan seçilir.
  - Zorluk durak içinde 1'den 2'ye doğru yükselir.
  - Her durağa bir `sticker` atanır (`st.matematik.<ad>`).
- [ ] **Step 3:** Bütün `title_key`, `label.*`, `vo.*` metinlerini ilgili JSON dosyalarına ekle. Ses satırı metinleri kısa, somut ve 6 yaşa uygun olmalı.
- [ ] **Step 4:** İçerik testini çalıştır → PASS. Hata varsa içeriği düzelt; doğrulayıcıyı gevşetme.
- [ ] **Step 5:** `tools/missing_assets.gd`'yi yaz ve çalıştır.
- [ ] **Step 6:** Çıktıdan `asset-requests/007-g1-matematik-u01-seslendirme.md`'yi 005 biçiminde oluştur: kimlik, dosya yolu, konuşmacı, metin. 001–006'da zaten olan anahtarlar tekrar edilmez; yeni görsel ihtiyacı varsa ayrı bir `008-...` partisi açılır. `asset-requests/README.md` tablosunu güncelle.
- [ ] **Step 7:** Commit: `content: 1. sınıf Matematik ünite 1 ve eksik asset aracı`

### Task 17: Uçtan uca doğrulama ve QA listesi

**Files:**
- Create: `docs/qa-checklist.md`, `tests/integration/test_e2e_vertical_slice.gd`
- Modify: `README.md` (durum: "Faz 1 tamam — oynanabilir dikey dilim"), `CLAUDE.md` (keşfedilen komut düzeltmeleri)

- [ ] **Step 1:** Başarısız uçtan uca testi yaz: temiz kayıt → profil oluştur (avatar `tavsan`, sınıf 1) → harita → Sayı Ormanı → ilk durak → bütün turları `_debug_choose` / `_debug_drop` ile doğru cevapla → Result'ta 3 yıldız → albümde çıkartma var → ikinci durak `open`. Asset dizini boşken (yer tutucularla) çalışmalı.
- [ ] **Step 2:** Çalıştır → bileşenler önceki görevlerde tamamsa PASS beklenir; FAIL ise kök nedeni ilgili görevin dosyasında düzelt.
- [ ] **Step 3:** `docs/qa-checklist.md`'yi yaz. Sahibin gerçek Android cihazda adım adım kontrol edeceği maddeler:
  - Kurulum (CI artefaktı APK).
  - İlk açılış sesi.
  - Profil oluşturma.
  - Dokunma hedeflerinin rahatlığı.
  - Sürükle-bırak hissi.
  - TTS yedeğinin Türkçe okuması.
  - Süre sınırı (10 dk seç, bekle; tur bitince Bilge uyku ekranı gelmeli).
  - Uygulamayı ders ortasında kapatıp açma (kayıt bütünlüğü).
  - Uçak modunda tam çalışma.
  - Veli kapısının çocuk tarafından tahminle geçilemediği.
- [ ] **Step 4:** Tüm test paketini çalıştır → PASS. CI'nın yeşil olduğunu ve APK artefaktının üretildiğini doğrula.
- [ ] **Step 5:** Commit: `test: dikey dilim uçtan uca testi ve QA listesi`. PR açıklamasında sahip için: APK'nın nereden indirileceği, QA listesi bağlantısı ve öncelikli asset partileri (001, 003, 002, 004, 005).

---

## Sonraki planlar
Faz 2 (müfredat matrisi) ve sonrası, bu plan tamamlandığında spec §8'e göre ayrı plan dosyalarıyla yazılır: `docs/superpowers/plans/YYYY-MM-DD-faz2-mufredat-matrisi.md` vb.
