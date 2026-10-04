#!/usr/bin/env bash
# CI için Android debug dışa aktarımını hazırlar: debug keystore üretir,
# Godot'nun beklediği ortam değişkenlerini ve editör ayarlarını yazar.
# Önkoşul: JDK (keytool) ve Android SDK kurulu olmalı (ANDROID_HOME / ANDROID_SDK_ROOT).
set -euo pipefail

KEYSTORE_DIR="${HOME}/.android"
KEYSTORE_PATH="${KEYSTORE_DIR}/debug.keystore"
SETTINGS_DIR="${HOME}/.config/godot"
SETTINGS_FILE="${SETTINGS_DIR}/editor_settings-4.7.tres"

SDK_PATH="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-}}"
if [[ -z "$SDK_PATH" ]]; then
  echo "ANDROID_HOME ya da ANDROID_SDK_ROOT tanımlı değil." >&2
  exit 1
fi

JAVA_PATH="${JAVA_HOME:-}"
if [[ -z "$JAVA_PATH" ]]; then
  JAVA_PATH="$(dirname "$(dirname "$(readlink -f "$(command -v keytool)")")")"
fi

# 1) Debug keystore
mkdir -p "$KEYSTORE_DIR"
if [[ ! -f "$KEYSTORE_PATH" ]]; then
  keytool -genkeypair -v -keystore "$KEYSTORE_PATH" \
    -storepass android -keypass android -alias androiddebugkey \
    -keyalg RSA -keysize 2048 -validity 10000 \
    -dname "CN=Android Debug,O=Android,C=US"
fi

# 2) Godot'nun debug imzalama için okuduğu ortam değişkenleri
if [[ -n "${GITHUB_ENV:-}" ]]; then
  {
    echo "GODOT_ANDROID_KEYSTORE_DEBUG_PATH=${KEYSTORE_PATH}"
    echo "GODOT_ANDROID_KEYSTORE_DEBUG_USER=androiddebugkey"
    echo "GODOT_ANDROID_KEYSTORE_DEBUG_PASSWORD=android"
  } >> "$GITHUB_ENV"
fi

# 3) Editör ayarları: SDK ve JDK yolları
mkdir -p "$SETTINGS_DIR"
if [[ ! -f "$SETTINGS_FILE" ]]; then
  printf '[gd_resource type="EditorSettings" format=3]\n\n[resource]\n' > "$SETTINGS_FILE"
fi
set_key() {
  local key="$1" value="$2"
  # Varsa eski satırı sil, [resource] bölümünün sonuna ekle.
  sed -i "\|^${key} = |d" "$SETTINGS_FILE"
  printf '%s = "%s"\n' "$key" "$value" >> "$SETTINGS_FILE"
}
set_key "export/android/android_sdk_path" "$SDK_PATH"
set_key "export/android/java_sdk_path" "$JAVA_PATH"

echo "Android dışa aktarma ayarları yazıldı: ${SETTINGS_FILE}"
