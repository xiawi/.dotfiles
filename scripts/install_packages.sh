#!/usr/bin/env bash

set -euo pipefail

PACKAGES=(
	zsh
	neovim
	stow
)

FLATPAK=(
	flathub
	md.obsidian.Obsidian
	com.bitwarden.desktop
	app.zen_browser.zen
	app.ytmdesktop.ytmdesktop
)

sudo dnf install -y ${PACKAGES[@]}

sudo flatpak install ${FLATPAK[@]}
