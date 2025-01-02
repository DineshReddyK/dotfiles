# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@ \[\033[32m\]\$PWD\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias l='ls -lrt'
alias c='clear'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias ..='cd ..'
alias ...='cd ../../'

# For typos..
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export GOPATH=$HOME/go
export PATH=$PATH:/home/fedora/go/bin

#source all aliases
source ~/.alias

function up() {
  times=$1
  while [ "$times" -gt "0" ]; do
    cd ..
    times=$(($times - 1))
  done
}

function extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.tar.xz)    tar Jxvf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       rar x $1       ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xvjf $1    ;;
      *.tgz)       tar xvzf $1    ;;
      *.zip)       unzip -d `echo $1 | sed 's/\(.*\)\.zip/\1/'` $1;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "don't know how to extract '$1'" ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}
