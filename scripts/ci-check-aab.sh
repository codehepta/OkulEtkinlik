#!/usr/bin/env bash
# CI: Play Store paketini (AAB) doğrular. AAB doğrudan cihaza kurulmaz; Play onu cihaza özel
# APK'lara böler. Burada bundletool ile "evrensel" APK üretilir ve APK denetiminin aynısı
# (izin yok, içerik var, testler yok, boyut bütçesi) onun üzerinde çalışır. Godot AAB'de
# içerik ayrı bir kurulum anı varlık paketine (asset pack) gidebildiği için evrensel APK,
# cihaza gerçekten inenin doğru temsilidir.
# Kullanım: scripts/ci-check-aab.sh <aab> [aapt2 yolu]
# Önkoşul: Java; imza için ~/.android/debug.keystore (scripts/ci-android-setup.sh üretir).
set -euo pipefail

AAB="${1:?AAB yolu gerekli}"
SDK_PATH="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-}}"
AAPT2="${2:-${SDK_PATH}/build-tools/35.0.1/aapt2}"
BUNDLETOOL_VERSION="1.17.2"
HERE="$(cd "$(dirname "$0")" && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

JAR="$TMP/bundletool.jar"
curl -fsSL -o "$JAR" "https://github.com/google/bundletool/releases/download/${BUNDLETOOL_VERSION}/bundletool-all-${BUNDLETOOL_VERSION}.jar"

echo "== AAB: $(( ($(stat -c %s "$AAB") + 1048575) / 1048576 )) MB"
java -jar "$JAR" validate --bundle="$AAB" > /dev/null
java -jar "$JAR" build-apks --bundle="$AAB" --output="$TMP/out.apks" --mode=universal \
  --ks="$HOME/.android/debug.keystore" --ks-pass=pass:android --ks-key-alias=androiddebugkey --key-pass=pass:android
unzip -q -o "$TMP/out.apks" universal.apk -d "$TMP"

echo "== Evrensel APK denetimi"
"$HERE/ci-check-apk.sh" "$TMP/universal.apk" "$AAPT2"
