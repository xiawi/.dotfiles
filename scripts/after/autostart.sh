#!/usr/bin/env bash

AUTOSTART="$HOME/.config/autostart"
TO_START="$HOME/.dotfiles/scripts/after/autostart"

cp "$TO_START"/* "$AUTOSTART"
