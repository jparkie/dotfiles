#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

#
# Functions:
#

function echo_info() {
	echo "[dotfiles/zsh] INFO setup.sh - $1" >&1
}

function echo_error() {
	echo "[dotfiles/zsh] ERROR setup.sh - $1" >&1
}

#
# Constants:
#

DIR="$(cd "$(dirname "$0")"; pwd -P)"
FILES=(
	"${DIR}/.zsh"
	"${DIR}/.zpreztorc"
	"${DIR}/.zshrc"
	)

# 1. Set Default
if [[ $SHELL != "/bin/zsh" ]]; then
	chsh -s $(which zsh)
	return
fi

# 2. Download Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# 3. Reset Configs
rm $HOME/.zshrc

# 4. Configure Prezto
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# 5. Copy Files
for file in "${FILES[@]}"; do
	echo_info "Copying file ${file}"
	cp -R "${file}" "${HOME}"
done
