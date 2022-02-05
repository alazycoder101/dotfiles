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
# https://zaiste.net/posts/shell-commands-rust/
brew install bat exa procs sd dust ripgrep tokei ytop
# ytop https://github.com/cjbassi/ytop
brew tap cjbassi/ytop
brew install ytop

brew install bat ffmpeg curl postman lftp
brew install git git-interactive-rebase-tool
# shell nushell fish
brew install zsh
# hyperfine: benchmarking
brew install hyperfine

# compress
brew install xz unar

brew install fzf thefuck parallel jq htop

brew install autojump

# network
brew install bandwhich postman wget curl postman aria2 netcat  \
     siege tcpdump wireshark nmap netcat
# proxy
# brew install caddy mitmproxy
# ssl
# brew install mkcrt

# dev tools
# grex: Command-line tool for generating regular expressions
brew install grex rmesg

# DB
brew install redis postgres

# env pyenv rbenv nvm
brew install asdf

# Editor: vim vsc
brew install visual-studio-code vim sublime-text
# office
brew install libreoffice

# cask
# note: simplenote fsnotes
# Tp-Note - Minimalistic note taking: save and edit your clipboard content as a note file
# glow: Render markdown on the CLI
brew install fsnotes simplenote mark-text glow

brew install 1password alfred libreoffice

# media
brew install ffmpeg youtube-dl you-get imagemagick

# container podman/docker
brew install qemu lima colima docker-compose docker

# setup zsh
cd $ZSH_CUSTOM/plugins
git clone https://github.com/katrinleinweber/oh-my-zsh-youtube-dl-aliases youtube-dl
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git

