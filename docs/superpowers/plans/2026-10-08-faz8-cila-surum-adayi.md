# Faz 8 — Cila ve Sürüm Adayı: Uygulama Planı

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [x]`) syntax for tracking.

**Goal:** Erişilebilirlik, düşük cihaz performansı (2 GB RAM, Android 8) ve ses miksajı için otomatik denetimleri ve ölçüm araçlarını kurmak; sahibin cihazda yapacağı sürüm adayı QA'sını hazırlamak.

**Dayanak:** proje dosyası `plans/kalan-fazlar.md` (Faz 8: "Cihaz testleri sahibin gerçek Android cihazında yapılır; cloud görevi ölçüm araçlarını, `docs/qa-checklist.md`'yi ve otomatik denetimleri (dokunma hedefi, kontrast, APK boyutu) hazırlar"); CONTRIBUTING §1 (çocuk UX'i kuralları).

**Tech Stack:** Godot 4.7.2-stable, GDScript (statik tipli), GUT, Bash.

## Görevler
- [x] **1. Dokunma hedefi denetimi:** `tests/integration/test_a11y_screens.gd` bütün ekranları (profil, harita, patika, albüm, ağaç evi, sonuç, oturum sonu, veli kapısı, veli paneli) açar; görünen her düğme ≥128×128 px. Şablonlar zaten kendi testlerinde denetleniyor (`touch_targets`). Mevcut ekranların hepsi geçti; düzeltme gerekmedi.
- [x] **2. Kontrast denetimi:** `tests/unit/test_contrast.gd` (WCAG 2.2 göreli parlaklık): INK bütün kil dolgularında, başlık mürekkebi sıcak zeminlerde, veli panelinin ikincil ve uyarı metni, yarı saydam altyazı balonu en açık zeminde ≥4.5:1. Hepsi geçti.
- [x] **3. Düşük cihaz ayarları:** Android çizim yöntemi `gl_compatibility` (`rendering/renderer/rendering_method.mobile`); `tests/unit/test_low_end_settings.gd` (ETC2, arm64 + armeabi-v7a, INTERNET kapalı, API 26 desteklenir).
- [x] **4. Ölçüm aracı:** `tools/perf_probe.gd` içerik yükleme süresi/bellek ve her şablonun en kalabalık turunun kurulum süresi, düğüm sayısı, bellek artışı; `build/perf_probe.md`.
- [x] **5. APK boyut bütçesi:** `scripts/ci-check-apk.sh` 150 MB (`MAX_APK_MB`).
- [x] **6. Ses miksajı:** ana kanalda sınırlayıcı (`default_bus_layout.tres`), test `test_audio_director.gd`; seviye hedefleri ve ffmpeg komutları `docs/assets/audio-mix.md`.
- [x] **7. Belgeler:** `docs/qa-checklist.md` Faz 8 (cihaz protokolü, sürüm adayı ölçütleri), spec "Açık sorular (Faz 8)", CONTRIBUTING araç komutları.

## Ölçüm (masaüstü, headless, ısınmadan sonra)
İçerik yükleme ~250 ms ve +14.5 MB; şablon kurulumu 6–10 ms (bir kare beklemesi dahil), en kalabalık sahne `pattern` 99 düğüm. Bütçelerin hiçbiri aşılmadı. Düşük cihazda içerik yükleme kabaca 1.5 sn tahmin edilir ve açılış ekranının bekleme süresiyle (1.5 sn) örtüşür.

## Kararlar
- Android'de `gl_compatibility`; masaüstü `mobile` kalır.
- APK bütçesi 150 MB; aşılırsa önce sesler `.ogg`'ye çevrilir, görseller küçültülür.
- Kontrast eşiği her metinde 4.5:1.
- Gerçek cihaz ölçümü (FPS, ısınma, pil) otomatikleştirilmedi; sahibin cihazında QA listesiyle yapılır.
