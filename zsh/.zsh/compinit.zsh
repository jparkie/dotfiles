#!/usr/local/bin/zsh

# Completion System:
zstyle :compinstall filename '/Users/jparkie/.zshrc'
autoload -Uz compinit
compinit

# jEnv:
if command -v jenv 1>/dev/null 2>&1; then
  eval "$(jenv init -)"
fi

# pyenv:
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
