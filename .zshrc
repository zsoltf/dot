# ZSH

ZSH=$HOME/.zsh
ZSH_THEME="af-magic"

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git compleat django last-working-dir lol osx python pip rsync vi-mode virtualenvwrapper)
source $ZSH/oh-my-zsh.sh

# Path

export PATH=$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:
export EDITOR='vim'

# Alias

alias zshconfig="vim ~/.zshrc"
alias vrc="vim ~/.vimrc"
alias v="vim"
alias tree="tree -Ch"
alias t='byobu'
alias tmux='byobu'

# Source

#source /usr/local/bin/virtualenvwrapper.sh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
