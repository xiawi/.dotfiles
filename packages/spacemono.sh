#!/usr/bin/env bash

set -euo pipefail

source "$(dirname -- "${BASH_SOURCE[0]}")/../lib/functions.sh"
FONT_NAME="SpaceMono"
FONT_DISPLAY_NAME="SpaceMono Nerd Font"
FONT_DIR="$HOME/.local/share/fonts"
FONT_ARCHIVE="$(mktemp --suffix=".tar.xz")"

cleanup() {
	rm -f "$FONT_ARCHIVE"
}

trap cleanup EXIT

if find "$FONT_DIR" -type f \
	\( -iname "SpaceMonoNerdFont*.ttf" -o -iname "SpaceMonoNerdFont*.otf" \) \
	-print -quit | grep -q .; then
	warning "$FONT_DISPLAY_NAME already installed. Skipping..."
	exit 0
fi

mkdir -p "$FONT_DIR"

curl -fL \
	"https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FONT_NAME}.tar.xz" \
	-o "$FONT_ARCHIVE"

tar -xf "$FONT_ARCHIVE" -C "$FONT_DIR"

fc-cache -f "$FONT_DIR"

