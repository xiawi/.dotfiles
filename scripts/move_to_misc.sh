#!/usr/bin/env bash

set -euo pipefail

TARGET="$HOME/misc"

# Declare an associative array
declare -A XDG_DIRS=(
	[DESKTOP]="Desktop"
	[DOCUMENTS]="Documents"
	[DOWNLOAD]="Downloads"
	[MUSIC]="Music"
	[PICTURES]="Pictures"
	[PUBLICSHARE]="Public"
	[TEMPLATES]="Templates"
	[VIDEOS]="Videos"
)

for key in "${!XDG_DIRS[@]}"; do
	dir="${XDG_DIRS[$key]}"
	src="$HOME/$dir"
	dst="$TARGET/$dir"

	if [[ -d "$src" ]]; then
		mv "$src" "$TARGET/"
		xdg-user-dirs-update --set "$key" "$dst"
		echo "Moved & updated: $key -> $dst"
	else
		echo "Skipping $dir (not found)"
	fi
done
