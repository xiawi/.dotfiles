#!/usr/bin/env bash

set -euo pipefail

source "$(dirname -- "${BASH_SOURCE[0]}")/../lib/functions.sh"

if command -v bookokrat &>/dev/null; then
	warning "Bookokrat already installed. Skipping..."
	exit 0
fi

# install build prerequisities
sudo apt update
sudo apt install -y \
	build-essential \
	pkg-config \
	libfontconfig1-dev \
	clang \
	libclang-dev \
	gcc \
	make \

# install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

source "$HOME/.cargo/env"

# install bookokrat
cargo install bookokrat
