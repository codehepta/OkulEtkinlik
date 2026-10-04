# Faz 7a — Ağaç Evi, Tekrar Bulutu ve Veli Paneli Düzeltmeleri: Uygulama Planı

**Goal:** Spec §3.4–§3.6'daki ödül ve tekrar döngüsünü tamamlamak (Bilge'nin Ağaç Evi, Tekrar Bulutu), Faz 1 açık sorularını önerilen seçimlerle uygulamak ve veli paneline "evde etkinlik önerisi" eklemek. Görev listesi: `/mnt/project-files/plans/kalan-fazlar.md` → Faz 7a.

**Spec:** `docs/superpowers/specs/2026-10-04-bilgi-adasi-design.md` (§3.4, §3.5, §3.6, "Açık sorular (Faz 1 uygulaması)", "Açık sorular (Faz 2)" (b)).

## Kararlar (sahip onayıyla önerilen seçimler)

1. **Süre dolunca yarım kalan durak:** mevcut davranış kalır (yalnızca oynanan turların ustalığı, ödül yok). Tekrar Bulutu yarıda kalırsa da yalnızca ustalık işlenir.
2. **1 yıldızlı tekrar oyunda Leitner vadesi:** kutu değişmiyorsa mevcut vade korunur (ileri itilmez).
3. **Cihaz saati ileri alınırsa:** veli panelinde, veli kapısı arkasında "Günü sıfırla" düğmesi.
4. **Süre sınırı:** cihaz başına (bütün profillerin toplamı); kayıt şeması v2, kullanım kökteki `usage` alanında.
5. **Evde etkinlik önerileri:** eklendi; `content/home_activities.tr.json`, çevrimdışı, ustalık hesabına girmez, kodlar `outcomes.json`'dan.
6. **Ağaç Evi eşikleri:** 5, 15, 30, sonra 20'şer.

Uygulamada verilen ek kararlar (spec'te ayrıntı yoktu, önerilen seçim mantığıyla):
- Tekrar Bulutu yalnızca **tamamlanmış duraklardaki** çıktılardan beslenir; yarım kalan durak tekrar kaynağı değildir. Bulut dersin patikasında, sağ üstte görünür (patika boyunca kaymaz).
- Tekrar oturumu en çok 3 tur; vadesi en eski çıktıdan başlayarak her çıktıdan birer tur, sonra karışık sıra. Tekrar sonucunda yıldız gösterilir ama düğüm yıldızına, çıkartmaya ve Ağaç Evi toplamına girmez; "Tekrar oyna" düğmesi yoktur.
- Ağaç Evi toplamı bütün sınıf ve derslerdeki durakların en yüksek yıldızlarının toplamıdır; süs kataloğu 12 eşyadır (`content/tree_house.json`).
- Evde etkinlik önerilerinde yalnızca önerilen mekaniği eksik olan ve evde karşılığı olmayan üç `partial` çıktı (MAT.1.2.2, MAT.2.2.2, MAT.3.2.1) dışarıda bırakıldı.

## Görevler

- [x] Kayıt şeması v2: kök `usage`, profil `decor`; v1 göçü (`scripts/core/save_schema.gd`), içe aktarma doğrulaması (`progress_export.gd`).
- [x] `SessionTimer` cihaz başına sayaç; `reset_day()` ve `scripts/core/day_reset.gd`.
- [x] `Progress`: Leitner vadesini koruma, `record_review`, `review_codes`, `review_node`; Ağaç Evi (`total_stars`, `decor_unlocked`, `place_decor`, `store_decor`), `record_node` dönüşünde `new_decor`.
- [x] `scripts/core/review_picker.gd`, `scripts/core/tree_house_rules.gd` (saf mantık, birim testli).
- [x] `LessonRunner` tekrar modu (`{"review": ders}`), turların kendi çıktıları.
- [x] Patikada Tekrar Bulutu durağı; sonuç ekranında yeni süs; tekrar sonucunda "Tekrar oyna" gizli.
- [x] `scenes/ui/tree_house.{gd,tscn}`: raf, sürükle-bırak, kilitli yuva ve yıldız sayacı; haritadan giriş.
- [x] Veli paneli: "Günü sıfırla" ve sınıfa göre evde etkinlik önerileri (`scripts/core/home_activities.gd` + içerik kapısı testi).
- [x] Asset partileri 023 (süsler) ve 024 (seslendirme), `asset-requests/README.md`.
- [x] Spec kararları, `docs/qa-checklist.md` Faz 7a bölümü, ekran görüntüsü aracına Ağaç Evi kareleri.

## Testler

`tests/unit/test_session_timer.gd`, `test_day_reset.gd`, `test_save_service.gd`, `test_progress.gd`, `test_review_picker.gd`, `test_tree_house_rules.gd`, `test_home_activities.gd`; `tests/integration/test_map_flow.gd` (Ağaç Evi, Tekrar Bulutu akışı, sonuçta süs), `test_parent_flow.gd` (günü sıfırla, öneriler).
