# Faz 3e — 3. Sınıf Matematik İçeriği: Uygulama Planı

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [x]`) syntax for tracking.

**Goal:** TYMM İlkokul Matematik programının 3. sınıf altı temasını (`themes.json` `g3.matematik.t01–t06`) Sayı Ormanı'nda altı ünite olarak oynanabilir kılmak; oynanabilir (`fit` full/partial) her MAT.3 çıktısı en az bir durakta çalışılır.

**Dayanak:** proje dosyası `plans/kalan-fazlar.md` (Faz 3e, önerilen seçimler); spec §3.7 şablonları; `docs/curriculum/outcomes.json` (kaynak: `docs/curriculum/sources/tymm-ilkokul-matematik.pdf`, s. 85, 93, 100, 108, 114, 118); `game_map.json`.

**Tech Stack:** Godot 4.7.2-stable, GDScript (statik tipli), GUT.

## Global Constraints
Faz 3a/3b kısıtları geçerlidir (dokunma hedefi ≥128 px, renk tek başına anlam taşımaz, süre baskısı yok, görsellerde rakam yok, kodda sabit metin yok). Ek olarak:
- Ünite numarası temanın numarasıdır (uNN = tNN); ünite `source` alanı temanın sayfasını ve resmi adını taşır.
- Durağın şablonları çıktının `game_map.json` şablonlarındandır.
- Kart, kutu ve sıralama metinleri en çok 12 karakter; hikâye metin seçenekleri tek satır.
- Asset partisi numaraları: 050–059.

## Görevler
- [x] **1. balloon_pop çarpma ve bölme** (MAT.3.2.3, 3.2.4): `op` `×` ve `÷`; kalansız bölme doğrulaması; model ipucu yalnızca `+`/`-`. Test: `test_params_faz3.gd`, `test_play_balloon_pop.gd`.
- [x] **2. grid yatay simetri ekseni** (MAT.3.3.7): `axis_dir`, `GridLogic.mirror_axis`, yatay kesik eksen çizgisi. Test: `test_params_grid.gd`, `test_play_grid.gd`.
- [x] **3. İçerik kapısı testi:** `tests/unit/test_matematik_g3_content.gd` (kapsam, şablon eşlemesi, tema sırası, kaynak sayfası, çıkartmalar, kısa kart metinleri).
- [x] **4. Ünite içerikleri:** `content/g3/matematik/u01–u06.json` (36 durak, 168 tur), metinler, sesler, 36 çıkartma.
- [x] **5. Oynanış duman testi:** `tests/integration/test_matematik_g3_rounds.gd` her turu gerçek sahnede doğru cevaplarla bitirir.
- [x] **6. Eşleme ve matris:** `game_map.json` şablon listeleri, `matrix.md` yeniden üretildi.
- [x] **7. Asset partileri:** 050 nesneler, 051 çıkartmalar, 052–053 seslendirme; `asset-requests/README.md`.
- [x] **8. Belgeler:** spec "Açık sorular (Faz 3e)", `docs/qa-checklist.md` Faz 3e.

## Kararlar
- Balon patlatmaya çarpma/bölme modu eklendi; yeni şablon yazılmadı.
- Grid simetrisine yatay eksen eklendi.
- Tahmin modunun süre, çevre, sıvı ve çarpma/bölme kontrol adımları ertelendi; ilgili çıktılar `partial` kaldı (spec "Açık sorular (Faz 3e)").
- `fit` değerleri değişmedi; ev etkinliği önerileri değişmedi.
