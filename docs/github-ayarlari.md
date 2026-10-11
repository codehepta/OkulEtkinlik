# GitHub depo ayarları (sahip için)

Depodaki dosyalar (`CONTRIBUTING.md`, şablonlar, `CODEOWNERS`, `dependabot.yml`, etiket iş akışı) otomatik çalışır. Aşağıdaki ayarlar ise yalnızca GitHub arayüzünden, depo sahibi tarafından yapılabilir. Hepsi **Settings** sekmesindedir.

## 1. Genel (Settings → General)
- **Description:** `MEB 1–3. sınıf müfredatıyla uyumlu, ücretsiz ve açık kaynak eğitici çocuk oyunu (Godot)`
- **Topics:** `godot`, `gdscript`, `education`, `egitim`, `children`, `meb`, `maarif-modeli`, `android`, `open-source`, `offline`
- **Features:** Issues ✅ · Discussions ✅ (soru-cevap için önerilir) · Projects isteğe bağlı · Wiki ❌ (dokümanlar repoda)
- **Pull Requests:**
  - ✅ Allow merge commits (varsayılan yöntemimiz)
  - ❌ Allow squash merging · ❌ Allow rebase merging (geçmiş tutarlı kalsın; istersen squash açık kalabilir)
  - ✅ Always suggest updating pull request branches
  - ✅ Automatically delete head branches

## 2. Dal koruması (Settings → Rules → Rulesets → New branch ruleset)
- **Name:** `main koruması` · **Enforcement:** Active · **Target:** Default branch (`main`)
- **Şu an (geliştirme aşaması, tek geliştirici; 2026-10-12'de kuruldu):**
  - ✅ Restrict deletions · ✅ Block force pushes
  - ✅ Require a pull request before merging — Required approvals: **0** · birleştirme yöntemi: merge commit. PR'ları sahip onaylar ve birleştirir (PR'lar sahibin hesabından açıldığı için GitHub kendi PR'ını onaylatmaz; onay birleştirme düğmesidir).
  - Status check zorunlu değil: CI PR'larda kapalı (`.github/workflows/ci.yml` yalnızca `main`'e push'ta ve elle çalışır). Testler birleştirmeden önce yerelde çalıştırılır.
- **Katkıcı gelince:** `ci.yml`'e `pull_request` tetikleyicisini geri ekle; Required approvals **1** ve ✅ Require review from Code Owners; ✅ Require status checks to pass — **`test`** ve **`android-debug`** · ✅ Require branches to be up to date.
- **Bypass list:** gerekirse kendini ekle (acil durum için).

## 3. Güvenlik (Settings → Code security / Advanced Security)
- ✅ **Private vulnerability reporting** (SECURITY.md bu yolu kullanır)
- ✅ Dependabot alerts · ✅ Dependabot security updates (`dependabot.yml` Actions sürümlerini aylık günceller)
- ✅ Secret scanning ve Push protection

## 4. Actions (Settings → Actions → General)
- Workflow permissions: **Read repository contents** (varsayılan); etiket iş akışı kendi `issues: write` iznini ister.
- ✅ Require approval for first-time contributors (fork PR'ları için)
- Artifact retention: 30–90 gün (APK'lar için yeterli).

## 5. Etiketler
`.github/labels.tsv` değişince `main`'e push'ta **Etiketler** iş akışı etiketleri kendiliğinden oluşturur/günceller. İlk kez çalıştırmak için: **Actions → Etiketler → Run workflow**.

## 6. Sosyal önizleme (isteğe bağlı)
Settings → General → Social preview: `assets/images/map/island.png` gibi bir görsel yükle (1280×640).
