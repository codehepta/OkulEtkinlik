## Ne değişti?
<!-- Kısa özet. İlgili issue: Closes #NN -->

## Tür
- [ ] Özellik / şablon / ekran
- [ ] Hata düzeltme
- [ ] İçerik / müfredat
- [ ] Asset (görsel / ses / asset isteği)
- [ ] Doküman / CI / bakım

## Kontrol listesi
- [ ] Testler yerelde geçti (`godot --headless --path . -s addons/gut/gut_cmdln.gd -gdir=res://tests -ginclude_subdirs -gexit`)
- [ ] Yeni davranış için önce test yazıldı (TDD)
- [ ] Ağ isteği, analitik, reklam, satın alma ya da yeni izin **yok**
- [ ] Kullanıcıya görünen metinler `content/strings.tr.json` / `content/voice_lines.tr.json` içinde; kodda sabit metin yok
- [ ] GDScript statik tipli; `.uid` / `.import` dosyaları commit'te
- [ ] Çocuk UX'i: ceza / süre baskısı yok, yönergeler seslendiriliyor, dokunma hedefleri ≥128 px
- [ ] Commit mesajlarında ve bu açıklamada atıf satırı (`Co-Authored-By` vb.) yok

### İçerik değiştiyse
- [ ] Her öğrenme çıktısı `docs/curriculum/outcomes.json`'da resmi kaynak (PDF + sayfa) ile doğrulandı
- [ ] `ContentValidator` testi geçiyor

### Arayüz değiştiyse
- [ ] Önce / sonra ekran görüntüleri eklendi (`tools/ui_screenshots.gd`)

### Asset gerekiyorsa
- [ ] `asset-requests/NNN-*.md` partisi yazıldı ve `asset-requests/README.md` güncellendi

## Açık sorular
<!-- Spec'in sessiz kaldığı ya da çeliştiği noktalar; sahibin kararı gerekenler. Yoksa "Yok". -->

## Cihazda nasıl denenir?
<!-- QA listesinden ilgili adımlar ya da kısa test senaryosu. APK: bu PR → Checks → CI → Artifacts. -->
