#!/usr/bin/env bash

set -euo pipefail

sudo apt update
sudo apt install -y \
	git \
	curl \
	stow \
	gh \
	fastfetch \
	fzf \
	tree \
	ripgrep \
