# ZSH

ZSH=$HOME/.zsh
#ZSH_THEME="af-magic"
#ZSH_THEME="kardan"
ZSH_THEME="sunrise"
#ZSH_THEME="terminalparty"
#ZSH_THEME="dstufft"

DISABLE_AUTO_UPDATE="true"

plugins=(git compleat django last-working-dir lol osx python pip rsync vi-mode virtualenvwrapper)
source $ZSH/oh-my-zsh.sh

# Path

export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:
export VIMRUNTIME=/usr/share/vim/vim73 #ios

# Alias

alias zshconfig="vim ~/.zshrc"
alias vrc="vim ~/.vimrc"
alias v="vim"
alias sc="screen -U -O -R -s /bin/zsh"
alias p="python"
alias dj="python manage.py"

# Source

#source /usr/bin/virtualenvwrapper.sh
