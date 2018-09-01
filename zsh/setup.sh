#!/bin/bash

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