#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

#
# Functions:
#

function echo_info() {
	echo "[dotfiles/brew] INFO setup.sh - $1" >&1
}

function echo_error() {
	echo "[dotfiles/brew] ERROR setup.sh - $1" >&1
}

#
# Constants:
#

DIR="$(cd "$(dirname "$0")"; pwd -P)"

# 1. Install Homebrew
if [[ ! $(command -v brew) ]]; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# 2. Add Taps
brew tap caskroom/fonts
brew tap caskroom/versions

# 3. Install Java 8
brew cask install java8
brew install maven

# 4. Install Scala and SBT
brew install scala
brew install sbt

# 5. Install Packages
brew install cookiecutter
brew install fzf
brew install htop
brew install jq
brew install netcat
brew install nmap
brew install recode
brew install sshfs
brew install telnet
brew install tmux
brew install tree
brew install unrar
brew install vim
brew install wget
brew install zsh
brew install zsh-completions

# 6. Install Applications
brew cask install adobe-acrobat-reader
brew cask install docker
brew cask install flux
brew cask install google-chrome
brew cask install intellij-idea-ce
brew cask install iterm2
brew cask install spectacle
brew cask install spotify
brew cask install sublime-text

#7. Install Fonts
brew cask install font-meslo-for-powerline
