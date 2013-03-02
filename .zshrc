# ZSH

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="af-magic"

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git compleat django last-working-dir lol osx python pip rsync vi-mode virtualenvwrapper)
source $ZSH/oh-my-zsh.sh

# Path

export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:

# Alias

alias zshconfig="vim ~/.zshrc"
alias vrc="vim ~/.vimrc"
alias v="vim"

# Source

source /usr/local/bin/virtualenvwrapper.sh
source /usr/bin/virtualenvwrapper.sh
