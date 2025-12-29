#!/usr/bin/env bash

set -euo pipefail

# use zsh
chsh -s $(which zsh)

# use zen
xdg-settings set default-web-browser app.zen_browser.zen.desktop

# git stuff
echo "Git Configurations"
echo "------------------"
echo "Enter Name:"
read name
git config --global user.name $name
echo "Enter Email:"
read email
git config --global user.email $email
git config --global core.editor nvim

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

