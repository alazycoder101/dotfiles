# TO DEBUG zsh
# setopt xtrace
# setopt noxtrace
#
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

# Path to your oh-my-zsh installation.
export ZSH=/Users/joeyw/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
# bind ^R
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
#[ -f $ZSH_CUSTOM/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ] \
#    && source $ZSH_CUSTOM/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    # Autocompletion or alias
    adb
    autojump brew bundler
    history wd web-search
    tmux tmuxinator sublime
    ssh-agent osx

    screen supervisor
    git git-flow mercurial docker docker-compose aws
    mvn scala sbt
    #virtualenvwrapper
    python pip pylint pep8 virtualenv fabric
    gem
    node npm bower gulp
    colored-man-pages
    # Useful tools
    colorize catimg command-not-found common-aliases
    encode64 jsontools urltools sudo gitignore themes
    emoji-clock
    # Just for fun
    rand-quote
    # Note that zsh-syntax-highlighting must be the last plugin sourced
    kubectl
    #custom ones
    vi-mode
    #kube-aliases
    kube-ps1
    youtube-dl you-should-use
    #alias-tips almostontop docker-aliases docker-machine
    docker-machine
    zsh-autosuggestions
    history-substring-search zsh-navigation-tools
    flutter
  )
  # Note that zsh-history-substring-search should be after zsh-syntax-highlighting
### }}}


source $ZSH/oh-my-zsh.sh
#source <(kubectl completion zsh)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#source "/usr/local/opt/zsh-git-prompt/zshrc.sh"
fpath=(/usr/local/share/zsh-completions $fpath)
#. /usr/local/etc/profile.d/z.sh
#eval "$(thefuck --alias)"
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# ALIASES
alias dud='du -a . | sort -n -r | head -n 10'
alias ducks='du -cks * | sort -rn | head'
alias mount_disk='sudo -u root -- sh -c "mount -a -t exfat /dev/disk2s5 /Users/joeyw/mnt/Data; mount -a -t exfat /dev/disk2s3 /Users/joeyw/mnt/Window; mount -a -t hfs /dev/disk2s1 /Users/joeyw/mnt/MacBook\ Air/; mount -a -t hfs /dev/disk2s2 /Users/joeyw/mnt/MacBook/"'
alias rmc='docker rm $(docker ps --filter "status=exited" -q)'
#alias wakeupiMac="ssh 10.100.1.250 'sh wakeup.sh'"
function ttfb {
  curl -o /dev/null \
    -H 'Cache-Control: no-cache' \
    -s \
    -w "Connect: %{time_connect} TTFB: %{time_starttransfer} Total time: %{time_total} \n" \
    $1
}
function update_nginx {
  [ $# -eq 0 ] && { echo "Usage: $0 [0|1]"; exit 1; }
  local id="$1"
  SERVER="nginx$id"
  gcloud compute scp prod/nginx/nginx.conf $SERVER:/etc/nginx/ && gcloud compute ssh $SERVER --command='sudo nginx -t && sudo service nginx reload'
}

function nr {
  [ $# -eq 0 ] && {  }
  local id="$1"
  SERVER="nginx0"
  FILE="access.log"
  [ "$id" -gt "0" ] && { FILE="access.log.$id" }
  gcloud compute ssh $SERVER --command="sudo goaccess --all-static-files -f /var/log/nginx/$FILE > /tmp/report.html" && gcloud compute scp $SERVER:/tmp/report.html ./
}
alias ncache="gcloud compute ssh nginx0 --command='sudo du -sh /var/cache/nginx/' && gcloud compute ssh nginx1 --command='sudo du -sh /var/cache/nginx/'"
ducks='du -cks * | sort -rn | head'

#alias wakeupiMac="wakeonlan 00:22:41:34:ce:4c"
#alias iMac="wakeupiMac && ssh 10.100.1.63"
alias pyserver='python -m SimpleHTTPServer 8000'
alias pserver='php -S 0.0.0.0:8000'
alias rserver="ruby -rwebrick -e'WEBrick::HTTPServer.new(:Port => 8000, :DocumentRoot => Dir.pwd).start'"
alias rbserver='ruby -run -ehttpd . -p8000'
#alias json2csv="jq -r '(map(keys) | add | unique) as \$cols | map(. as \$row | \$cols | map(\$row[.])) as \$rows | \$cols, \$rows[] | @csv'"
alias chrome='open -a Google\ Chrome --args --disable-web-security -–allow-file-access-from-files'
alias http3='open -a Google\ Chrome --args --enable-quic --quic-version=h3-27'
alias webdebug='open -a Google\ Chrome --args --auto-open-devtools-for-tabs  --log-net-log=/tmp/chrome.json --enable-logging --v=1'

alias javahome='cd /Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home'
#alias flashlog='cd /Users/joeyw/Library/Preferences/Macromedia/Flash\ Player/Logs'
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
alias filetree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias opened='lsof -i | grep ESTABLISHED'
alias gbpurge='git branch --merged | grep -v "\*" | grep -v "master" | grep -v "develop" | grep -v "staging" | xargs -n 1 git branch -d'
alias gl='git pull --rebase'
alias mongodb='mongod --dbpath /usr/local/var/mongodb/'
alias yg=you-get

# net work short command
alias nmap_scan='nmap -sP -PE -PP -PS21,22,23,25,80,113,21339 -PA80,113,443,10042 --source_port 53'
alias urldecode='python -c "import sys, urllib as ul; \
        print ul.unquote_plus(sys.argv[1])"'
alias urlencode='python -c "import sys, urllib as ul; \
        print ul.quote_plus(sys.argv[1])"'

alias cmd=tldr
alias soffice=/Applications/LibreOffice.app/Contents/MacOS/soffice

alias check_crt='openssl s_client -servername $domain -connect $domain:443 2> /dev/null | openssl x509 -noout -dates'

#bindkey -M viins ‘jj’ vi-cmd-mode
#bindkey '^R' history-incremental-search-backward
#bindkey '^r' history-incremental-search-backward
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    #RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/.rbenv/shims:~/Library/Android/sdk/platform-tools:$PATH"
export PATH="${PATH}:${HOME}/.krew/bin"

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm

vol () {
  if [ -z $1 ]; then
    osascript -e "output volume of (get volume settings) & output muted of (get volume settings)"
  else
    osascript -e "set volume output volume $*";
  fi
}
#eval "$(direnv hook zsh)"
export PATH="/usr/local/opt/binutils/bin:$PATH"

if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi
#source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
export KUBECONFIG=$HOME/.kube/config:$HOME/.kube/config.global-dev:$HOME/.kube/config.re-global-dev:$HOME/.kube/config.re-global-prod

export CLOUDSDK_PYTHON=python2

### ZCA's installer added snippet ###
fpath=( "$fpath[@]" "$HOME/.config/zca/zsh-cmd-architect" )
autoload h-list zca zca-usetty-wrapper zca-widget
zle -N zca-widget
bindkey '^T' zca-widget
### END ###

## Addition of the history file
setopt APPEND_HISTORY
## Ignore all repetitions of commands
setopt HIST_IGNORE_ALL_DUPS
## Do not display the string found earlier
setopt HIST_FIND_NO_DUPS
## Ignore rows if they are duplicates
setopt HIST_IGNORE_DUPS
## Delete empty lines from history file
setopt HIST_REDUCE_BLANKS
## Ignore a record starting with a space
setopt HIST_IGNORE_SPACE
## Do not add history and fc commands to the history
setopt HIST_NO_STORE

# autosuggest
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^ ' autosuggest-accept
bindkey '^l' autosuggest-execute
bindkey '^k' autosuggest-clear
bindkey '^/' autosuggest-fetch
bindkey '^;' autosuggest-toggle

# Debug zsh -o sourcetrace  zsh -x
export PATH="/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/python@3.8/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/google-cloud-sdk/completion.zsh.inc'; fi
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
export PATH="/Users/joeyw/Library/Android/sdk/emulator:/Users/joeyw/Library/Android/sdk/cmdline-tools/latest/bin:/Users/joeyw/Library/Android/sdk/platform-tools:/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
# Add pyenv executable to PATH and
# enable shims by adding the following
# to ~/.profile and ~/.zprofile:

#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"

# Set it so ~/.pyenv provides Python before others of the same name:
export PYENV_ROOT=$(pyenv root)
export PATH="$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init --path)"

# Load pyenv into the shell by adding
# the following to ~/.zshrc:

eval "$(pyenv init -)"
[[ -e "/opt/homebrew/Cellar/oci-cli/2.25.3/libexec/lib/python3.9/site-packages/oci_cli/bin/oci_autocomplete.sh" ]] && source "/opt/homebrew/Cellar/oci-cli/2.25.3/libexec/lib/python3.9/site-packages/oci_cli/bin/oci_autocomplete.sh"

if [ -f ~/.zsh/re.zsh ]; then
    source ~/.zsh/re.zsh
else
    print "404: ~/.zsh/re not found."
fi
