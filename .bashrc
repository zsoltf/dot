# zsolt's bashrc for mac os x

# activate virtualenv
source /usr/local/bin/virtualenvwrapper.sh

export PROJECT_HOME=/Users/pottyos/dev
export WORKON_HOME=/Users/pottyos/.virtualenvs

export mysite=~/dev/mysite
set -o vi

export CLICOLOR=1 
export LSCOLORS=FxFxCxDxBxegedabagacad

#
# aliases
#

alias cl='clear'
alias vb='vim ~/.bashrc'
alias vv='vim ~/.vimrc'
alias cellar='/usr/local/Cellar'

alias la='ls -lAXh --color=always'   #Show all, sort by extension
alias ls-al='ls -al'   #fix typo missing space
alias l="ls -l"
alias la="ls -la"

alias cd..='cd ..'
alias ..='cd ..'

alias .='echo $PWD'

alias rm='rm -i'

#alias icanhaz='sudo apt-get install'

alias google='/home/pottyos/firefox/firefox http://www.google.com'

alias w='workon'
alias d='deactivate'

alias p="python"
alias m="python manage.py"

alias tree="tree -hsCI *.pyc"
