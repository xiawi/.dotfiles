#!/usr/bin/env bash

./scripts/install_packages.sh
./scripts/move_to_misc.sh
./scripts/set_defaults.sh

source packages.sh

for PAC in ${PACKAGES[@]}; do
	stow -D $PAC
	echo "Stowing $PAC"
	stow $PAC
done
