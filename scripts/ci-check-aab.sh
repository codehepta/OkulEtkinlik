#!/usr/bin/env bash
# CI: Play Store paketini (AAB) doğrular.
#  1) Manifestte hiçbir izin yok (özellikle INTERNET). AAB manifesti protobuf biçimindedir;
#     izin adları düz metin olarak durduğu için `grep -a` yeterlidir.
#  2) İçerik pakettedir (base/assets/ altında).
#  3) Testler ve GUT pakete girmez.
# Kullanım: scripts/ci-check-aab.sh <aab>
set -euo pipefail

AAB="${1:?AAB yolu gerekli}"
FAIL=0
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "== İzinler"
unzip -q -o "$AAB" "base/manifest/AndroidManifest.xml" -d "$TMP"
PERMS="$(grep -aoE 'android\.permission\.[A-Z_]+' "$TMP/base/manifest/AndroidManifest.xml" | sort -u || true)"
if [[ -n "$PERMS" ]]; then
  echo "HATA: AAB izin istiyor (uygulama hiçbir izin kullanmaz):" >&2
  echo "$PERMS" >&2
  FAIL=1
else
  echo "izin yok"
fi

echo "== İçerik"
LISTING="$(unzip -Z1 "$AAB")"
PCKS="$(grep -E '^base/assets/.*\.pck$' <<<"$LISTING" || true)"
for pck in $PCKS; do
  unzip -q -o "$AAB" "$pck" -d "$TMP"
done
for f in "content/g1/matematik/u01.json" "docs/curriculum/outcomes.json" "content/strings.tr.json"; do
  if grep -qx "base/assets/${f}" <<<"$LISTING"; then
    echo "var: ${f}"
  elif [[ -n "$PCKS" ]] && grep -rqaF "$f" "$TMP/base/assets"; then
    echo "var (pck içinde): ${f}"
  else
    echo "HATA: pakette yok: ${f}" >&2
    FAIL=1
  fi
done

echo "== Pakete girmemesi gerekenler"
if grep -qE '^base/assets/(tests|addons/gut)/' <<<"$LISTING"; then
  echo "HATA: testler/GUT pakete girmiş." >&2
  FAIL=1
else
  echo "yok"
fi

echo "== Boyut"
echo "AAB: $(( ($(stat -c %s "$AAB") + 1048575) / 1048576 )) MB"
exit "$FAIL"
