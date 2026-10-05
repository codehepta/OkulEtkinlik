# CLAUDE.md — Bilgi Adası (OkulEtkinlik)

MEB 1–3. sınıf öğretim programlarıyla (Türkiye Yüzyılı Maarif Modeli) uyumlu, 6–9 yaş için **ücretsiz ve açık kaynak** bir mobil eğitim oyunu. Motor **Godot 4.7.2 + GDScript**, hedef **Android + iOS**, görsel stil **3D kil / oyuncak**.

## Önce oku
1. **Spec:** `docs/superpowers/specs/2026-10-04-bilgi-adasi-design.md`. Tasarımın tek doğruluk kaynağı budur.
2. **Uygulama planı:** `docs/superpowers/plans/` altındaki en güncel plan (şu an: `2026-10-04-faz0-faz1-dikey-dilim.md`). Görevleri sırayla uygula, tamamlananları `- [x]` olarak işaretle. Yürütme yöntemi: **subagent-driven** (her görev için ayrı uygulayıcı + ayrı gözden geçirici). Superpowers yoksa görevleri kendin sırayla uygula ve her görev sonunda testleri çalıştır.
3. **Asset kuralları:** `docs/assets/style-guide.md`, `docs/assets/naming.md`, `asset-requests/README.md`.

## Sahibin kalıcı kuralları (pazarlık konusu değil)
- Commit mesajlarına, PR açıklamalarına ya da başka herhangi bir çıktıya **`Co-Authored-By`, "Generated with Claude Code" ya da benzeri bir atıf satırı EKLEME.**
- Uygulama **ağ isteği yapmaz**. Analitik, reklam, uygulama içi satın alma, hesap ya da üçüncü taraf SDK yoktur. Android manifestinde INTERNET izni kapalı kalır.
- Müfredat öğrenme çıktısı kodlarını **uydurma.** Her kod resmi MEB kaynağından (PDF adı ve sayfası) doğrulanıp `docs/curriculum/outcomes.json`'a kaynağıyla girilir. Doğrulayamıyorsan içeriği yazma, durumu sahibe bildir.
- İhtiyaç olduğunda `asset-requests/NNN-konu.md` parti dosyası yazarsın (biçim: mevcut 001–006 dosyaları). Prompt'lar Gemini / Nano Banana uyumlu, İngilizce, kopyala-yapıştıra hazır olmalı ve stil bloğunu tam metin içermeli. Görsellerde asla metin, harf ya da rakam istenmez.
- **Görseller:** Parti dosyalarındaki görseller için yerel açık modellerle (`tools/imagegen/`) ya da Blender'la (geometrik öğeler) **aday** üretebilirsin. **Seçimi ve onayı sahip yapar;** onaylanmamış görsel `assets/`'e girmez. Yalnızca Apache 2.0 / MIT gibi CC BY 4.0 ile uyumlu lisanslı modeller kullanılır (şu an: Z-Image Turbo, FLUX.2 [klein] 4B, BiRefNet). "Ticari olmayan" ya da "araştırma" lisanslı modeller (ör. FLUX.2 klein 9B / dev, Qwen-Image-2.1) yasaktır. Her onaylı görselin model, sürüm, tohum ve prompt kaydı tutulur. Sahip görselleri Nano Banana ile kendisi de üretebilir.
- **Sesleri sen üretmezsin; sahip üretir.**
- Asset eksikliği **asla** geliştirmeyi durdurmaz. `AssetRegistry` yer tutucu gösterir, `Narrator` cihazın Türkçe TTS'ine düşer.
- Çocuk UX'i: ceza, can kaybı, süre baskısı, şans kutusu ya da seri (streak) baskısı yok. Bütün yönergeler seslendirilir ve tekrar dinlenebilir.

## Dil ve kod kuralları
- Kullanıcıya görünen bütün metinler **Türkçe**dir ve `content/strings.tr.json` / `content/voice_lines.tr.json` içinde tutulur. Kodda sabit metin bulunmaz.
  - **İstisnalar (kullanıcıya görünmez):** yalnızca geliştirici/sahip için çıktı üreten araçlar (`tools/*` ve yalnızca `tools/missing_assets.gd`'yi besleyen `scripts/core/missing_assets_scan.gd`) Türkçe sabit metin içerebilir. `push_error` / `push_warning` geliştirici günlükleri de bu kurala tabi değildir. Uygulama kodunun (sahneler, autoload'lar, diğer `scripts/core/` dosyaları) ekrana ya da sese giden metinleri her zaman JSON'dan gelir.
- Dokümanlar ve kod yorumları Türkçe, tanımlayıcılar (değişken, fonksiyon, dosya, sınıf adları) İngilizce.
- GDScript **statik tipli** yazılır: değişken, parametre ve dönüş tipleri belirtilir. `class_name` yalnızca gerçekten paylaşılan tipler için kullanılır.
- Saf mantık `scripts/core/` altında, sahnesiz ve test edilebilir tutulur. Autoload'lar ince kalır ve bu mantığı çağırır.
- Dosya ve klasör adları `snake_case`'tir, Türkçe karakter içermez.
- İçerik JSON'u `ContentValidator`'dan geçmeden commit edilmez.

## Komutlar
```bash
# Godot kurulumu (cloud ortamında her oturum başında gerekebilir)
scripts/setup-godot.sh                 # yalnızca editör/headless
scripts/setup-godot.sh --with-templates  # + export şablonları (APK için)
export PATH="$HOME/.local/bin:$PATH"

# İlk içe aktarma (yeni asset'ler ya da temiz klon sonrası)
godot --headless --path . --import

# Testler (GUT)
godot --headless --path . -s addons/gut/gut_cmdln.gd -gdir=res://tests -ginclude_subdirs -gexit

# Eksik asset raporu
godot --headless --path . -s res://tools/missing_assets.gd

# Yerel görsel aday üretimi (Apple Silicon; ayrıntı: tools/imagegen/README.md)
uv run --project tools/imagegen python tools/imagegen/generate.py 060 --items 1-5
uv run --project tools/imagegen python tools/imagegen/approve.py 060 1=1000   # sahip seçtikten sonra

# Android debug APK (şablonlar kurulu olmalı)
godot --headless --path . --export-debug "Android" build/android/bilgi-adasi-debug.apk
```
Test paketini **sıralı** çalıştır: aynı anda yalnızca bir `godot` süreci (önce `pgrep godot`). Paralel süreçler `user://` test dizinlerini ve import önbelleğini bozar.
`tools/*` altındaki geliştirici araçlarının çıktısı Türkçe sabit metin içerebilir; "kodda sabit metin yok" kuralı çocuğa ve veliye görünen uygulama metinleri içindir.
`--import` bayrağı çalışmazsa `godot --headless --path . --editor --quit-after 2` kullan.

Cloud ortamında Godot indirmesi başarısız olursa (ağ kısıtı), ortamın `github.com` ve `objects.githubusercontent.com` adreslerinden indirmeye izin vermesi gerekir. Bunu sahibe bildir; çözüm aramak için başka kaynaklardan ikili dosya indirme.

## İş akışı
- Katkı süreci, dal adları, commit biçimi ve PR kontrol listesi: `CONTRIBUTING.md` ve `.github/pull_request_template.md`. Depo ayarları: `docs/github-ayarlari.md`.
- Plandaki her görev grubu için `main`'den bir dal aç (`feat/<konu>`), küçük ve anlamlı commit'ler at, PR aç. CI yeşil olmadan birleştirme.
- TDD: önce başarısız testi yaz, sonra kodu.
- Bir görev spec'le çelişiyorsa ya da spec bir konuda sessizse, varsayım yapıp ilerleme. Spec'e "Açık soru" olarak ekle ve sahibe sor.
- Faz sonunda `docs/qa-checklist.md`'deki manuel kontrol adımlarını sahip için güncelle.
- Yeni asset gerektiren her içerik işinin sonunda ilgili `asset-requests` partisini yaz ve `asset-requests/README.md` durum tablosunu güncelle.
