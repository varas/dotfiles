# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n

export PATH=/usr/local/share/npm/bin/:/root/packer/:~/.composer/vendor/bin/:$PATH

# if $(which trash &> /dev/null); then
#   alias rm='trash'
# elif $(which trash-put &> /dev/null); then 
#   alias rm='trash-put'
# else
#   #trash-cli is not available on debian, so skip anoying message
#   if grep -vi debian /etc/issue.net; then
#     echo "Your rm's may harm you. Install trash package: apt-get install trash-cli"
#   fi
# fi

# Alias

alias cd..='cd ..'
alias ..='cd ..'
alias gti="git"

alias gz="tar cvzf"
alias ugz="tar xvzf"

alias bz="tar cvjf"
alias ubz="tar xvjf"

# resume scp downloads 
alias rscp="rsync --partial --progress --rsh=ssh"

# mac pbcopy and pbpaste utilities
alias pbcopy="xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"

alias ag=ack-grep

alias c='vimcat'
alias v='vim'
alias g='git'
alias gl='git lg'
alias gst='git status'
alias ga='git add '
alias gc='git commit -m '

alias composer='php -dmemory_limit=1G /usr/local/bin/composer'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias fm='free -m'
alias tl='tload'
alias con='php app/console'
alias conl='php app/console |less -R'
alias gitd='git diff --ignore-submodules'
alias lld="ls -d1 */"
alias lr="ls -alFrt"
alias gA='git add -A '
alias gd='git diff '
alias gca='git commit -a -m '
alias gcam='git commit --amend '
alias fgr='findgrep'
alias gln='git lg --no-merges'
alias glh='clear; git lg --no-merges |head; echo "..."'
alias grh="git reset HEAD "
alias gco="git checkout "
alias fig='findgrep'
alias wpw='sudo -u www-data wp'
alias pp="ps axuf | pager"
alias behatv="vendor/bin/behat"
#alias rm="trash-put"
alias vmod="git status --porcelain | sed -ne 's/^ M //p'| vimargs"

function vimargs() {
    xargs bash -c '</dev/tty vim "$@"' ignoreme
}

function bitbucketremote_add() {
    git remote add bb https://{{ bitbucket_user }}@bitbucket.org/juanveiss/$1.git
}
function bitbucketremote_create() {
    bitbucket create --username {{ bitbucket_user }} --private --protocol https $1
}
function lesscolor(){
    ccze -A < $1 |less -R
}
function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
function mcd() { mkdir $1 && cd $1; }

# z (jump around) https://github.com/rupa/z
. /home/{{user }}/.zeta/z.sh

