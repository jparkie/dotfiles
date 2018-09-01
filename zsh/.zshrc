# Prezto:
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Bind Key:
bindkey -e

# History:
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob

# Configs:
typeset -ga SOURCES

SOURCES+="$HOME/.zsh/alias.zsh"
SOURCES+="$HOME/.zsh/compinit.zsh"
SOURCES+="$HOME/.zsh/env.zsh"
SOURCES+="$HOME/.zsh/fzf.zsh"
SOURCES+="$HOME/.zsh/path.zsh"
SOURCES+="$HOME/.zsh/prompt.zsh"

foreach ZSH_FILE (`echo $SOURCES`)
  if [[ -e $ZSH_FILE ]]; then
    source $ZSH_FILE
  fi
end