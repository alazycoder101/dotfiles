#!/usr/bin/env bash

set -e

if ! xcode-select -p 1>/dev/null; then
  xcode-select --install
else
  echo "Commandline Tools installed"
fi

if ! which -s brew; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# delta/sh
# bandwhich: Terminal bandwidth utilization tool
# find=>fd cd=>zoxide ls=>exa ps=>procs tldr=>tealdeer du=>dust
# sed=>sd grep=>ripgrep dmesg=>rmesg diff=>delta
brew install bat exa procs sd dust ripgrep tokei ytop
# ytop https://github.com/cjbassi/ytop
brew tap cjbassi/ytop
brew install ytop

brew install bat ffmpeg curl lftp git
# shell nushell
brew install zsh
# hyperfine: benchmarking
brew install hyperfine

# network
brew install bandwhich postman wget curl aria2 netcat siege tcpdump netcat

# dev tools
# grex: Command-line tool for generating regular expressions
brew install grex rmesg

# DB
brew install redis postgres

# env
brew install pyenv rbenv

# Editor: vim vsc
brew install visual-studio-code vim sublime-text
# office
brew install libreoffice

# cask
# note: simplenote fsnotes
# Tp-Note - Minimalistic note taking: save and edit your clipboard content as a note file
brew install fsnotes simplenote

brew install 1password alfred libreoffice

# setup zsh
cd $ZSH_CUSTOM/plugins
git clone https://github.com/katrinleinweber/oh-my-zsh-youtube-dl-aliases youtube-dl
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git

