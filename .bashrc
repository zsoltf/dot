#
# zsolt's bashrc
# for cygwin
#

# Shortcuts

alias df='df -h'
alias tree='tree -Ch'
alias ls='ls -h'
alias la='ls -a'
alias ll='ls -al'
alias vrc='vim ~/.vimrc'
alias c='clear'
alias g='git'

# vi
export EDITOR='vim'
set -o vi

stty -ixon

export PATH=$PATH:/cygdrive/c/nodejs
export PATH=$PATH:/cygdrive/c/Program\ Files/Oracle/VirtualBox
export PATH=$PATH:~/bin
export PATH=/cygdrive/c/Users/Zsolt/AppData/Roaming/npm:$PATH

export PS1=' '

# virtualbox

trusty()
{
  if [ "$1" = "start" ]; then
    VBoxManage startvm trusty64 --type headless
  elif [ "$1" = "stop" ]; then
    VBoxManage controlvm trusty64 poweroff
  fi
  ssh trusty
}
