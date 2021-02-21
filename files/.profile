# ~/.profile: executed by Bourne-compatible login shells.

# Exports

export HISTSIZE=1000000
# Fix pbcopy utf problems
export LANG=en_US.UTF-8

# Path
export GOPATH=$HOME/go
export PATH=/usr/local/sbin:~/dotfiles/bin:$GOPATH/bin:$PATH
# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
# Groovy
export GROOVY_HOME="$(brew --prefix groovysdk)/libexec"
# moar path stuff

# This loads nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# https://virtualenvwrapper.readthedocs.io
export WORKON_HOME=~/Envs

# Directives

# Disallow write access to your terminal
mesg n
# Vi mode
set -o vi

# Alias

alias cd..='cd ..'
alias ..='cd ..'
alias cdg="while true; do [ ! -d .git ] && cd .. || break; done"
alias cdt="cd \$(mktemp -d)"
alias gti="git"
#alias git=hub # requires hub
alias sort=gsort
alias sed=gsed

alias gz="tar cvzf"
alias ugz="tar xvzf"
alias bz="tar cvjf"
alias ubz="tar xvjf"

# resume scp downloads 
alias rscp="rsync --partial --progress --rsh=ssh"

alias ag=ack-grep
alias ackprod="ack --ignore-file=match:/_test.go/ --ignore-file=match:/mock.go/ "
#--ignore-dir=test "
alias gosources="ack -g '^(?!.*_test).*$' --go"
alias godeps="go list -f '{{ join .Deps  \"\n\"}}' "
alias goimps="go list -f '{{ join .Imports  \"\n\"}}' "

alias h=history
alias hg='history|grep'
alias m='make'
alias li='clear; make lint'
alias sy='govendor sync'
alias syli='govendor sync && make lint'
alias mc='clear; make check'
alias c='vimcat'
alias b='brew'
alias v='vim'
alias va='vagrant'
alias a='aws'
alias g='git'
alias gn='git --no-pager'
alias gll="git log --graph --abbrev-commit --decorate --pretty=oneline"
alias gl="gll --color=always |head -15"
alias gla="gl --all"
alias gl2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' "
alias gl3="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' "
alias gs='git status'
alias ga='git add '
alias gc='git commit -m '
alias gp='git pull '
alias gpv='git pull && govendor sync '
alias gf='git push -f '
alias gA='git add -A '
alias gd='git diff '
alias gca='git commit -a -m '
alias gcam='git commit --amend '
alias gln='git lg --no-merges'
alias glh='clear; git lg --no-merges |head; echo "..."'
alias grh="git reset HEAD "
alias gco="git checkout "
alias gcod="git checkout develop "
alias gcom="git checkout main "
alias gcomm="git checkout master "
alias gco-="gco @{-1}"

alias d="docker"
alias dco="docker-compose "
alias dcr="docker-compose run "
alias docker-clean=' \
  docker container prune -f ; \
  docker image prune -f ; \
  docker network prune -f ; \
  docker volume prune -f '
alias minikube-date='minikube ssh "sudo date --set=\"$(date -u)\""'
#alias ll='ls -alF'
alias ll='exa -la --git'
alias la='ls -A'
alias l='ls -CF'
alias fm='free -m'
alias tl='tload'
alias tf='terraform'
alias con='php app/console'
alias conl='php app/console |less -R'
alias csfix='git diff --name-only --cached | xargs -n 1 -I {} sh -c "php-cs-fixer fix {}; git add {}"'
alias gitd='git diff --ignore-submodules'
alias lld="ls -d1 */"
alias lr="ls -alFrt"
alias fig='findgrep'
#alias rm="trash-put"
alias vmod="git status --porcelain | sed -ne 's/^ M //p'| vimargs"
alias vimgo='vim -u ~/.vimrc.go'
alias pythonserver='python -m SimpleHTTPServer'
alias httpserve='pythonserver | ngrok http 8000'
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias k=kubectl

alias yd="youtube-dl -f best"

# Functions

theme_dark() {echo -e "\033]50;SetProfile=Default\a"}
theme_clear_solarized() {echo -e "\033]50;SetProfile=JuanClear\a"}
theme_clear() {echo -e "\033]50;SetProfile=Clear2\a"}
mcd() { mkdir $1 && cd $1; }
calc () { echo "$*" | bc -l;  }
psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
lesscolor() {  ccze -A < $1 |less -R }
yamlvalidation() { python -c 'import yaml,sys;yaml.safe_load(sys.stdin)' < $1 }

sshjenkins() {
    ssh -i /Users/jhernandez/.ssh/jenkins/id_rsa_jenkins jenkins@$1 $2 $3 $4 $5
}

# Bitbucket
#function bitbucketremote_add() {
#    git remote add bb https://{{ bitbucket_user }}@bitbucket.org/$USERNAME/$1.git
#}
#function bitbucketremote_create() {
#    bitbucket create --username {{ bitbucket_user }} --private --protocol https $1
#}

vssh() {
     vagrant up $1; vagrant ssh $1
}
vfs() {
     vagrant sshfs $1; vagrant ssh $1
}

goland() {
    /Applications/GoLand.app/Contents/MacOS/goland $(pwd)/$1
}

goland_stdin() {
    xargs -L1 -I{} /Applications/GoLand.app/Contents/MacOS/goland $(pwd)/{}
}

goland_git() {
    git ls-files -m |xargs -L1 -I{} /Applications/GoLand.app/Contents/MacOS/goland $(pwd)/{}
}

idea() {
    /Applications/IntelliJ\ IDEA\ CE.app/Contents/MacOS/idea $(pwd)/$1 &
}
pycharm() {
    /Applications/PyCharm\ CE.app/Contents/MacOS/pycharm $(pwd)/$1 &
}

webstorm() {
    /usr/local/bin/webstorm $(pwd)/$1 
}

gst() {
	#git status --porcelain | ftree
	git status --short | ftree
}
gsu() {
	git branch --set-upstream-to=origin/$1 $1
}
vimargs() {
    xargs bash -c '</dev/tty vim "$@"' ignoreme
}

gitrelease() {
    #git --no-pager log $1...$2 --no-merges --pretty=format:"* (%h) %s" --reverse
    git --no-pager log $(git ls-remote --tags origin|sort -t '/' -k 3 -V|tail -1|awk '{print $1}')...origin/master --no-merges --pretty=format:"* (%h) %s" --reverse
    echo
}
gitrelease_merges() {
    git --no-pager log $(git ls-remote --tags origin|sort -t '/' -k 3 -V|tail -1|awk '{print $1}')...origin/master --pretty=format:"* (%h) %s" --reverse
    echo
}

gcor() {
    git fetch && git checkout -b $1 origin/$1
}

gdc() {
	git diff ${1-head}^..${1-head}
}

gdcc() {
	git diff $1..$2
}

dbash() {
	docker exec -ti $1 /bin/bash
}

gol() {
    gofmt -w -s $1 ; goimports -w $1
}

source ~/.profile.nr

