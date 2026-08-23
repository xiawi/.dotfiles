#!/usr/bin/env bash

set -euo pipefail

source "$(dirname -- "${BASH_SOURCE[0]}")/../lib/functions.sh"

if command -v nvim &>/dev/null; then
	warning "Neovim already installed. Skipping..."
	exit 0
fi

# install build prerequisites

sudo apt update
sudo apt install -y \
	ninja-build \
	gettext \
	cmake \
	curl \
	build-essential \
	git

# clone, build, and install neovim
rm -rf /tmp/neovim

git clone https://github.com/neovim/neovim /tmp/neovim

cd /tmp/neovim

make CMAKE_BUILD_TYPE=RelWithDebInfo

sudo make install

