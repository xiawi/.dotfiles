#!/usr/bin/env bash

source "$(dirname -- "${BASH_SOURCE[0]}")/constants.sh"

# Components that can be bootstrapped.
declare -A BOOTSTRAP=(
	[apt]="$DOTFILES/packages/apt.sh"
	[ghostty]="$DOTFILES/packages/ghostty.sh"
	[neovim]="$DOTFILES/packages/neovim.sh"
	[spacemono]="$DOTFILES/packages/spacemono.sh"
	[starship]="$DOTFILES/packages/starship.sh"
	[zk]="$DOTFILES/packages/zk.sh"
)

# Components that can be configured.
declare -A INSTALL=(
	[bash]="$DOTFILES/install/bash"
	[ghostty]="$DOTFILES/install/ghostty"
	[git]="$DOTFILES/install/git"
	[github]="$DOTFILES/install/github"
	[starship]="$DOTFILES/install/starship"
	[nvim]="$DOTFILES/install/nvim"
	[xdg]="$DOTFILES/install/xdg"
	[zk]="$DOTFILES/install/zk"
)
