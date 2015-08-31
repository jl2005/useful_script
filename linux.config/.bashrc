# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -l'
alias m='make DEBUG=y -j10'

alias fgrep='fgrep --color'
alias egrep='egrep --color'
alias grep='grep --color'

alias svndiff='svn diff -x -w | vim -R -'
alias ds='du --max-depth=1 | sort -n'
# alias ssh='ssh -i ~/.ssh/id_dsa -i ~/.ssh/spider_id_dsa'
alias rsync='rsync --progress'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
[[ "$(printenv LANG)" =~ ^[^\.]*$ ]] && [[ -z "$(printenv LC_ALL)" ]] && [[ -z "$(printenv LC_CTYPE)" ]] && export LANG=en_US.utf-8
[[ -z "$(printenv LC_ALL)" ]] && [[ -z "$(printenv LC_CTYPE)" ]] && export LC_ALL=en_US.utf-8

#export PS1="[@\\H($(ps hp $$ | awk '{print $2}'),\\j) \\W]\\\$ "
#export PS1="[\\u@\\H(\\j) \\W]\\\$ "
export PS1="[\\u@\\w]\\\$ "

export GOROOT=/usr/local/go/
export GOPATH=/Users/jiaolong/workspace/go-path
export PATH=$PATH:$HOME/bin:/opt/bin/:$GOROOT/bin
#export PATH=$PATH:/opt/bin/
export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH
export SVN_EDITOR=vim

export PATH="/usr/local/Cellar/ctags/5.8_1/bin/:$PATH"

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/jiaolong/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

#source /usr/local/rvm/scripts/rvm
#source /virtualenv/py2.6/bin/activate

man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		man "$@"
}

# auto completion
complete -C "perl -e '@w=split(/ /,\$ENV{COMP_LINE},-1);\$w=pop(@w);for(qx(screen -ls)){print qq/\$1\n/ if (/^\s*\$w/&&/(\d+\.\w+)/||/\d+\.(\$w\w*)/)}'" screen

