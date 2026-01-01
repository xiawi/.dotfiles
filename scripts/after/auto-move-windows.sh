#!/usr/bin/env bash

set -euo pipefail

EXT_ID="auto-move-windows@gnome-shell-extensions.gcampax.github.com"

# enable auto-move-windows
gnome-extensions enable "$EXT_ID"

# apply rules
gsettings set org.gnome.shell.extensions.auto-move-windows application-list \
"['app.zen_browser.zen.desktop:2', 'md.obsidian.Obsidian.desktop:3', 'app.ytmdesktop.ytmdesktop.desktop:4', 'org.gnome.Ptyxis.desktop:1', 'org.gnome.Papers.desktop:5']"
