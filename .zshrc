# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/fedora/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"

ZSH_THEME="powerlevel9k/powerlevel9k"
export TERM="xterm-256color"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
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
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    docker
    tmux
    dnf
    git
    golang
    python
    extract
    zsh-autosuggestions
    zsh-syntax-highlighting
    z
    )

#source  ~/.local/share/fonts/*sh
#POWERLEVEL9K_MODE='awesome-fontconfig'
[[ ! -z "$VNCDESKTOP" ]] && POWERLEVEL9K_MODE='nerdfont-complete'
source $ZSH/oh-my-zsh.sh

POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_VCS_HIDE_TAGS=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_CUSTOM_CONTEXT="echo -n '☠' din"
POWERLEVEL9K_CUSTOM_CONTEXT="echo '❤ din' | lolcat -f"
POWERLEVEL9K_CUSTOM_CONTEXT_FOREGROUND="003"
POWERLEVEL9K_CUSTOM_CONTEXT_BACKGROUND="black"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

if [[ ! -z "$VNCDESKTOP" ]]
then
    POWERLEVEL9K_VCS_GIT_ICON='\uF113 '
    POWERLEVEL9K_CUSTOM_CONTEXT="echo '\uf302  din'"
    #POWERLEVEL9K_CUSTOM_CONTEXT="echo '\uf30a  din'"
    #POWERLEVEL9K_CUSTOM_CONTEXT="echo '\ue77d  din'"
    POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%F{white}"
    POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%F{white} "
else
    POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%F{white}"
    POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\u2500%F{white} "
fi

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_context dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)

#POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
#POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
#POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
#POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
#POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='white'
#POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
#POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='black'
#POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='blue'

#source /home/fedora/.config/din-pwl9k/mavam

export PATH=$PATH:/home/fedora/bin/:/home/fedora/bin:/home/fedora/bin/rcp-utils:/home/fedora/conde-wb/conde
eval `dircolors /home/fedora/.dircolors-solarized/dircolors.ansi-dark`
#source $(dirname $(gem which colorls))/tab_complete.sh


#auto cd to dir. `d` to list `#num` to go to that dir
setopt autocd autopushd pushdignoredups

#history size
export HISTSIZE=500000
export SAVEHIST=$HISTSIZE
setopt histignorealldups

# Completion
autoload -U promptinit && promptinit
autoload -U compinit compdef && compinit
setopt correct

# User specific aliases and functions
alias l='ls -lrt'
alias c='clear'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias ..='cd ..'
alias ...='cd ../../'

[[ ! -z "$VNCDESKTOP" ]] && alias ls='colorls --gs'

# For typos..
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'

alias -s {yml,yaml, json, toml, config}=vim

e() {
    ./flexiserver/build/svnenv.sh -p common
}

alias t="tmux"

#source all aliases
source ~/.alias

export GOPATH=$HOME/go
export PATH=$PATH:/home/fedora/go/bin

function ..() {
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
