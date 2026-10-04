#!/usr/bin/env bash
# Godot'yu (headless kullanım için) Linux/macOS üzerine kurar.
# Kullanım: scripts/setup-godot.sh [--with-templates]
# Sonrasında: export PATH="$HOME/.local/bin:$PATH"; godot --version
set -euo pipefail

GODOT_VERSION="${GODOT_VERSION:-4.7.2}"
GODOT_RELEASE="${GODOT_VERSION}-stable"
BASE_URL="https://github.com/godotengine/godot/releases/download/${GODOT_RELEASE}"
INSTALL_DIR="${HOME}/.local/godot/${GODOT_RELEASE}"
BIN_DIR="${HOME}/.local/bin"
WITH_TEMPLATES=false
[[ "${1:-}" == "--with-templates" ]] && WITH_TEMPLATES=true

mkdir -p "$INSTALL_DIR" "$BIN_DIR"

case "$(uname -s)-$(uname -m)" in
  Linux-x86_64)  ZIP="Godot_v${GODOT_RELEASE}_linux.x86_64.zip";  EXE="Godot_v${GODOT_RELEASE}_linux.x86_64" ;;
  Linux-aarch64) ZIP="Godot_v${GODOT_RELEASE}_linux.arm64.zip";   EXE="Godot_v${GODOT_RELEASE}_linux.arm64" ;;
  Darwin-*)      ZIP="Godot_v${GODOT_RELEASE}_macos.universal.zip"; EXE="Godot.app/Contents/MacOS/Godot" ;;
  *) echo "Desteklenmeyen platform: $(uname -s)-$(uname -m)" >&2; exit 1 ;;
esac

if [[ ! -e "${INSTALL_DIR}/${EXE}" ]]; then
  echo "Godot ${GODOT_RELEASE} indiriliyor..."
  curl -fsSL -o "${INSTALL_DIR}/${ZIP}" "${BASE_URL}/${ZIP}"
  (cd "$INSTALL_DIR" && unzip -q -o "$ZIP" && rm -f "$ZIP")
fi
ln -sf "${INSTALL_DIR}/${EXE}" "${BIN_DIR}/godot"

if $WITH_TEMPLATES; then
  TPL_DIR_LINUX="${HOME}/.local/share/godot/export_templates/${GODOT_VERSION}.stable"
  TPL_DIR_MAC="${HOME}/Library/Application Support/Godot/export_templates/${GODOT_VERSION}.stable"
  TPL_DIR="$TPL_DIR_LINUX"; [[ "$(uname -s)" == "Darwin" ]] && TPL_DIR="$TPL_DIR_MAC"
  if [[ ! -d "$TPL_DIR" ]]; then
    echo "Export şablonları indiriliyor (büyük dosya)..."
    TPZ="Godot_v${GODOT_RELEASE}_export_templates.tpz"
    curl -fsSL -o "/tmp/${TPZ}" "${BASE_URL}/${TPZ}"
    mkdir -p "$TPL_DIR"
    unzip -q -o "/tmp/${TPZ}" -d "/tmp/godot_tpl"
    mv /tmp/godot_tpl/templates/* "$TPL_DIR"/
    rm -rf "/tmp/${TPZ}" /tmp/godot_tpl
  fi
fi

"${BIN_DIR}/godot" --version
