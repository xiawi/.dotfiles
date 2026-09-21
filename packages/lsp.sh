#!/usr/bin/env bash

set -euo pipefail

source "$(dirname -- "${BASH_SOURCE[0]}")/../lib/functions.sh"

INSTALL_LUA=1

if command -v lua-language-server &> /dev/null; then
	warning "Lua Language Server already installed. Skipping..."
	INSTALL_LUA=0
fi

# install build prerequisities
sudo apt update
sudo apt install -y \
	build-essential \
	unzip \
	git \
	ninja-build \

if [ $INSTALL_LUA -eq 1 ]; then
	# clone source
	rm -rf /tmp/lua-language-server
	git clone --recurse-submodules https://github.com/LuaLS/lua-language-server /tmp/lua-language-server
	cd /tmp/lua-language-server

	# build
	./make.sh

	# install
	sudo mkdir -p /opt/lua-language-server
	sudo mkdir -p /opt/lua-language-server/log
	sudo chmod -R 777 /opt/lua-language-server/log

	sudo cp -r bin \
		locale \
		meta \
		script \
		debugger.lua \
		main.lua \
		/opt/lua-language-server/

	sudo ln -sf \
		/opt/lua-language-server/bin/lua-language-server \
		/usr/local/bin/lua-language-server

	sudo chmod +x /usr/local/bin/lua-language-server
fi

# cleanup
rm -rf /tmp/lua-language-server
