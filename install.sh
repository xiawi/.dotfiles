#!/usr/bin/env bash

./scripts/install_packages.sh
./scripts/move_to_misc.sh
./scripts/set_defaults.sh
./scripts/new_home.sh

source packages.sh

for pac in ${PACKAGES[@]}; do
	stow -D $pac
	echo "Stowing $pac"
	stow $pac
done
