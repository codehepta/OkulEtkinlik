#!/usr/bin/env bash
# CI: dışa aktarılan APK'yı doğrular.
#  1) Hiçbir Android izni istenmez (özellikle android.permission.INTERNET). `aapt2 dump permissions`
#     çıktısında "package:" dışında satır (uses-permission / permission) varsa başarısız olur.
#  2) İçerik pakete girmiştir. Godot 4 Android dışa aktarımı (gradle'sız) proje dosyalarını tek tek
#     APK'nın assets/ klasörüne yazar (ör. assets/content/g1/matematik/u01.json); bu yüzden
#     `unzip -l` yeterlidir. Dosyalar bir .pck içine gömülmüşse (assets/*.pck) PCK dizinindeki
#     yol adları düz metin olduğundan `grep -a` ile aranır (şifreleme kapalı).
#  3) Testler ve GUT pakete girmez (export_presets.cfg exclude_filter).
# Kullanım: scripts/ci-check-apk.sh <apk> [aapt2 yolu]
set -euo pipefail

APK="${1:?APK yolu gerekli}"
SDK_PATH="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-}}"
AAPT2="${2:-${SDK_PATH}/build-tools/35.0.1/aapt2}"
REQUIRED=("content/g1/matematik/u01.json" "docs/curriculum/outcomes.json" "content/strings.tr.json" "content/voice_lines.tr.json")
FAIL=0

echo "== İzinler (${AAPT2} dump permissions)"
PERMS="$("$AAPT2" dump permissions "$APK")"
echo "$PERMS"
if ! grep -q '^package:' <<<"$PERMS"; then
  echo "HATA: aapt2 çıktısı beklenen biçimde değil (package: satırı yok)." >&2
  FAIL=1
fi
EXTRA="$(grep -v '^package:' <<<"$PERMS" | grep -v '^[[:space:]]*$' || true)"
if [[ -n "$EXTRA" ]]; then
  echo "HATA: APK izin istiyor ya da tanımlıyor (uygulama hiçbir izin kullanmaz):" >&2
  echo "$EXTRA" >&2
  FAIL=1
fi
if grep -qi 'android.permission.INTERNET' <<<"$PERMS"; then
  echo "HATA: android.permission.INTERNET var." >&2
  FAIL=1
fi

echo "== İçerik"
LISTING="$(unzip -Z1 "$APK")"
PCK_LIST="$(grep -E '^assets/.*\.pck$' <<<"$LISTING" || true)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
for pck in $PCK_LIST; do
  unzip -q -o "$APK" "$pck" -d "$TMP"
done
for f in "${REQUIRED[@]}"; do
  if grep -qx "assets/${f}" <<<"$LISTING"; then
    echo "var: assets/${f}"
  elif [[ -n "$PCK_LIST" ]] && grep -rqaF "$f" "$TMP"; then
    echo "var (pck içinde): ${f}"
  else
    echo "HATA: pakette yok: ${f}" >&2
    FAIL=1
  fi
done

echo "== Pakete girmemesi gerekenler"
LEAK="$(grep -E '^assets/(tests|addons/gut)/' <<<"$LISTING" || true)"
if [[ -n "$LEAK" ]]; then
  echo "HATA: testler/GUT pakete girmiş:" >&2
  head -20 <<<"$LEAK" >&2
  FAIL=1
else
  echo "yok: assets/tests/, assets/addons/gut/"
fi

exit "$FAIL"
