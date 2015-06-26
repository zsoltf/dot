#############
# PROMPT
#############

c_red_inv="\e[38;5;234;48;5;160m"
c_red="\e[38;5;160;48;5;0m"
c_gray="\e[38;5;238m"
c_green="\e[38;5;108m"
c_orange="\e[38;5;166;48;5;234m"
c_off="\e[0m"

function prompt_right() {
  #echo -e "${c_gray}$(echo ${PWD})${c_off}"
  echo "${PWD}"
}

function prompt_left() {
  if [[ $last_command == 0 ]]
  then
    echo -e "${c_orange}λ${c_off}"
  else
    echo -e "${c_red}λ${c_off}"
  fi
}

function prompt() {
    last_command=$?
    compensate=0
    PS1=$(printf "%*s%s " "$(($(tput cols)+${compensate}))" "$(prompt_right)" "$(prompt_left)")
}

PROMPT_COMMAND=prompt

#############
# SETTINGS
#############

# gls and gdircolors for bsd
if [ -x /usr/local/bin/gdircolors ]; then
    test -r ~/.dircolors && eval "$(gdircolors -b ~/.dircolors)" || eval "$(gdircolors -b)"
    alias ls="gls"
fi

# vim
export EDITOR="vim"
set -o vi

# pager
export PAGER="less"
export LESS="-XR"

# disable flow control
stty -ixon

# completion
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi

# history
HISTSIZE=10000
HISTFILESIZE=500000
HISTCONTROL=ignoreboth
shopt -s histappend

#############
# PATH
#############

# ~/bin
export PATH="$PATH:$HOME/bin"

# go
export GOPATH="$HOME/gopath"
export PATH="$GOPATH/bin:$PATH"

# Secrets
[ -f ~/.config/.secrets ] && source ~/.config/.secrets

#############
# UTILS
#############

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS=-x

# xvfb
alias xvfb='Xvfb :1 -screen 5 1024x768x8 &'
#export DISPLAY=:1.5

# fasd
eval "$(fasd --init auto)"
alias v='f -t -e vim -b viminfo'

# rbenv
export PATH="$PATH:$HOME/.rbenv/bin"
eval "$(rbenv init -)"

# always open tmux
if ( tmux list-sessions ); then
  tmux -2u att 2> /dev/null
else
  # set the right term when launching tmux
  if [[ -n "$SSH_TTY" ]]; then
    TERM=xterm tmux -2u new -s $HOSTNAME
  else
    TERM=fbterm tmux -2u new -s $HOSTNAME
  fi
fi

#############
# SCRIPTS
#############

# Load any supplementary scripts
for config in "$HOME"/.bashrc.d/*.bash ; do
    source "$config"
done
unset -v config
