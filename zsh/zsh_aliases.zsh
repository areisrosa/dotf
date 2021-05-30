# ~/.zsh/zsh_aliases.zsh

###############################################################################
# General Configuration --------------------------------------------------- {{{
###############################################################################

# Don"t change. The following determines where Dotfile is installed.
dotf=$HOME/.dotf

# Get operating system
platform='unknown'
unamestr=$(uname)
if [[ $unamestr == 'Linux' ]]; then
  platform='linux'
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi

# Global aliases
alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."
alias -g C="| wc -l"
alias -g H="| head"
alias -g L="| less"
alias -g N="| /dev/null"
alias -g S="| sort"
alias -g G="| grep" # now you can do: ls foo G something

# Dotf support (TODO)
alias dav='dotf vim-add-plugin'
alias ddv='dotf vim-delete-plugin'
alias dlv='dotf vim-list-plugin'
alias dup='dotf update-plugins'
alias dip='dotf init-plugins'

# Function
# (f)ind by (n)ame
# usage: fn foo
# to find all files containing "foo" in the name
function fn() { ls **/*$1* }

###############################################################################
## Apps ------------------------------------------------------------------- {{{
###############################################################################
#
# Alias Editing
TRAPHUP() {
  source $dotf/zsh/zsh_aliases.zsh
}

# Vim && Neovim
alias vi='/usr/bin/vim'
alias vim='/usr/bin/nvim'
alias vimrc='vim ~/.vimrc'
alias nvimrc='vim ~/.config/nvim/init.vim'
# clean the vim swap file
alias nvimc='rm -I ~/.dotf/nvim/swap/*'
# clean the vim undo
alias nvimcu='rm -I ~/.dotf/nvim/undo/*'
# log the keys entered via using vim 
alias nviml='nvim -w ~/.vimlog "$@"'

alias ae='vim $dotf/zsh/zsh_aliases.zsh'       #alias edit
alias ar='source $dotf/zsh/zsh_aliases.zsh'    #alias reload
alias gar='killall -HUP -u \"$USER\" zsh'      #global alias reload

# Zsh and Bash Editing
alias ze='vim ~/.zshrc'
alias zr='source ~/.zshrc'
alias bzl='/bin/zsh'
alias be='vim ~/.bashrc'
alias br='source ~/.bashrc'
alias bbl='/bin/bash'

# Tmux
alias te='vim ~/.tmux/tmux.conf'
alias th="tmux -2 -q has-session && exec tmux -2 attach-session -d || exec tmux -2 new-session -s$USER@$HOSTNAME"

# Oh-My-Zsh
alias ohmyzsh='vim ~/.oh-my-zsh' 

# Don't try to glob with zsh so you can do
# stuff like ga *foo* and correctly have
# git add the right stuff
alias git='noglob git'

# Git and Git Repository View
alias git_view=/usr/bin/grv
alias gitconfig='vim ~/.gitconfig'
alias gs='git status'
alias gstsh='git stash'
alias gst='git stash'
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gsh='git show'
alias gshw='git show'
alias gshow='git show'
alias gi='vim .gitignore'
alias gcm='git ci -m'
alias gcim='git ci -m'
alias gci='git ci'
alias gco='git co'
alias gcp='git cp'
alias ga='git add -A'
alias gap='git add -p'
alias guns='git unstage'
alias gunc='git uncommit'
alias gm='git merge'
alias gms='git merge --squash'
alias gam='git amend --reset-author'
alias grv='git remote -v'
alias grr='git remote rm'
alias grad='git remote add'
alias grs='git remote show'
alias gr='git rebase'
alias gra='git rebase --abort'
alias ggrc='git rebase --continue'
alias gbi='git rebase --interactive'
alias gl='git l'
alias glg='git l'
alias glog='git l'
alias glogd='git log --graph --oneline --decorate'
alias co='git co'
alias gnb='git nb' # new branch aka checkout -b
alias gf='git fetch'
alias gfp='git fetch --prune'
alias gfa='git fetch --all'
alias gfap='git fetch --all --prune'
alias gfch='git fetch'
alias gd='git diff'
alias gb='git b'
# Staged and cached are the same thing
alias gdc='git diff --cached -w'
alias gds='git diff --staged -w'
alias gpub='grb publish'
alias gtr='grb track'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
#alias gpsh='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias grs='git reset'
alias grsh='git reset --hard'
alias gcln='git clean'
alias gclndfx='git clean -dfx'
# want to go ahead and delete the untracked files and directories
alias gclndi= 'git clean -d -i'
alias gsm='git submodule'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gt='git t'
alias gbg='git bisect good'
alias gbb='git bisect bad'
# delete local branch merged with master
alias gdmb="git branch --merged | grep -v '\*' | xargs -n 1 git branch -d"

# Docker
# display the information about a container
alias doi='docker inspect'
# going inside a container
alias doe='docker exec -t -i'
# delete every containers / images
alias dorm='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'
# stats on images
alias dostats='docker stats $(docker ps -q)'
# list docker containers
alias dols='docker ps'
# list images installed
alias dockimg='docker images'
# Docker and Compose
# run as the host user
alias dockcru="docker-compose run --rm -u $(id -u):$(id -g)"
alias dcrm='docker-compose run --rm'
alias dcbncfr='docker-compose build --no-cache --force-rm'
alias dco-compose-dev='docker-compose -f docker-compose-dev.yml'

# Aws
alias getninjas_login_ecr='sudo aws ecr get-login-password | docker login --password-stdin --username AWS "https://590284024382.dkr.ecr.us-east-1.amazonaws.com"'

# Ip and Wifi Connected
alias ip='ip a'
alias wifi_scan='sudo iwlist wlp4s0 scan | grep -i ssid'
alias wifi_connect='sudo wpa_passphrase' # exemple, $ wifi_connect "networkname (ssid)" "password" > /etc/wpa_supplicant/wpa_supplicant.conf

# Vpn
alias vpn='sudo openvpn --daemon --auth-nocache --cd "/etc/openvpn/conf.d" --config "GetNinjas.ovpn"'
alias exit_vpn='sudo killall openvpn'

# Ps
alias psa='ps aux'
alias psg='ps aux | grep '
alias psr='ps aux | grep ruby'

# Kill
alias ka9='killall -9'
alias k9='kill -9'

# i3
alias i3rc='vim ~/.config/i3/config'

# Polybar
alias polybarrc='vim ~/.config/polybar/config'

# Kitty
alias kittyrc='vim ~/.config/kitty/kitty.conf'

# Alacritty
alias alacrittyrc='vim ~/.config/alacritty/alacritty.yml'

# Termite
alias termiterc='vim ~/.config/termite/config'

# Compton
alias comptonrc='vim ~/.config/compton/compton.conf'

# Neofetch
alias neofetchrc='vim ~/.config/neofetch/config.conf'

# Mutt
alias muttrc='vim ~/.mutt/muttrc'

# Ping
alias pg='ping'

# Calculator Bc
alias bc='bc -q'

# Apt-Get
alias agi='sudo apt install'
alias agr='sudo apt remove'
alias agu='sudo apt update'
alias acs='apt-cache search'

# System
alias shutdown='sudo shutdown now'
alias restart='sudo reboot'
alias suspend='sudo pm-suspend'
alias bigf= 'find / -xdev -type f -size +50M'
alias fdev='lsblk -f'

# Clear, Help
alias c='clear'
alias h='history'

# Moving around
alias cdc='cd -;clear'
alias cls='clear;ls'

# Enable default options of mkdir
alias mkdir='mkdir -pv'

# Make commands more human-readable
alias mount='mount | column -t'
alias df='df -H'
alias du='du -ch'

# Prompt when removing more than 3 files
alias rm='rm -i --preserve-root'

# Increase safety when managing files
alias mv='mv -vi'
alias cp='cp -vi'
alias ln='ln -vi'

# mimic vim functions
alias :q='exit'

# Colorls (https://github.com/athityakumar/colorls)
alias lc='colorls -lA --sd'

# Ls_colors (https://github.com/trapd00r/LS_COLORS)
# source ~/.local/share/lscolors.sh

# Lds (https://github.com/Peltoche/lsd)
alias lsd='~/.cargo/bin/lsd'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

if [[ $platform == 'linux' ]]; then
    alias lsd='~/.cargo/bin/lsd'
    alias ls='lsd'
    alias ll='ls -alh'
elif [[ $platform == 'darwin' ]]; then
    alias ls='lsd -Gh'
    alias ll='ls -alGh'
fi

# show me files matching "ls grep"
alias lsg='ll | grep'

# vim using
mvim --version > /dev/null 2>&1
MACVIM_INSTALLED=$?
if [ $MACVIM_INSTALLED -eq 0 ]; then
  alias vim='mvim -v'
fi

# Enable color support for commands
if [ -x /usr/bin/dircolors ]; then
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
# Grep and Ag 
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Wifi
alias wifi='sudo iwlist scan'

# Firefox Dev
alias firefox-dev='/opt/firefox-dev/firefox'

# Node
alias node="nodejs"

# Go Tools
alias work="$HOME/workspace"
alias gwork="$GOPATH/src/github.com/areisrosa"
alias gsrc="$GOPATH/src/"
alias gbin="$GOPATH/bin/"
alias gob="go build"
alias gor="go clean -i" #need repository path
alias gta="go test ./..."
alias gia="go install ./..."

# Gem install
alias sgi='sudo gem install --no-ri --no-rdoc'

# Ruby on Rails
alias rc='rails c'

# Rake
alias rdm='rake db:migrate'
alias rdmr='rake db:migrate:redo'

# Rspec and Spring
alias rs='rspec spec'
alias sr='spring rspec'
alias src='spring rails c'
alias srgm='spring rails g migration'
alias srdm='spring rake db:migrate'
alias srdt='spring rake db:migrate'
alias srdmt='spring rake db:migrate db:test:prepare'

# Vagrant
alias vu='vagrant up'
alias vs='vagrant ssh'
alias vr='vagrant reload'

# Tar
alias tarx='tar -xzvf'
alias starx='sudo tar -xzvf'
# see tar table of content
alias tart='tar -tzf'
alias tarc='tar -cvzf'

# Ssh
alias sshprodql='ssh -Nf prod -L 3306:localhost:3306'

# How2
alias how='/usr/local/bin/how2'

# Postman
alias postman='/snap/bin/postman'

# Vtop
alias vtop='vtop --theme acid'

# Spotify Tui
alias spotify-tui='spt'
alias spotify-tuirc='~/.config/spotify-tui/client.yml'

# Source.io
alias sourcerer='~/.sourcerer/sourcerer'

# IntelliJ
alias idea="$HOME/.local/bin/idea"
alias toolbox="$HOME/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox"

# Bat
alias bat='/usr/bin/batcat'

# Homebrew
alias brewu='brew update && brew upgrade && brew cleanup && brew doctor'
