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

# Source

#source /usr/local/bin/virtualenvwrapper.sh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=/usr/local/bin:/Users/zsolt/.rvm/gems/ruby-2.0.0-p247/bin:/Users/zsolt/.rvm/gems/ruby-2.0.0-p247@global/bin:/Users/zsolt/.rvm/rubies/ruby-2.0.0-p247/bin:/Users/zsolt/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin::/Users/zsolt/.rvm/bin
