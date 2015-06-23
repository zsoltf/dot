#############
# PROMPT
#############

#function prompt_right() {
#  echo -e "\033[1;30m$(echo ${PWD})\033[0m"
#}
#
#function prompt_left() {
#  if [[ $last_command == 0 ]]
#  then
#    echo -e "\033[1;30;42mλ\033[0m"
#  else
#    echo -e "\033[1;41mλ\033[0m"
#  fi
#}
#
#function prompt() {
#    last_command=$?
#    compensate=4
#    PS1=$(printf "%*s%s " "$(($(tput cols)+${compensate}))" "$(prompt_right)" "$(prompt_left)")
#}

c_red="\e[38;5;160m"
c_red_inv="\e[38;5;234;48;5;160m"
c_gray="\e[38;5;237;48m"
c_orange="\e[38;5;166;48m"
c_blue="\e[38;5;67;48m"
c_off="\e[0m"

prompt() {
  local COL=$(expr `tput cols` - 13 - `git branch | grep '*' | wc -m`)
  red_prompt="$c_red λ $c_off"
  PS1='$(ret=$?; if [ $ret -ne 0 ]; then echo -e $red_prompt; else echo -e "$c_orange λ $c_off"; fi) '
  tput sc
  tput cuf $COL
  echo -e "${c_gray}‹${c_blue}${PWD: -12}${c_off}$(git branch | grep '*' | cut -c2-)"
  tput rc
}
PROMPT_COMMAND=prompt

#############
# SETTINGS
#############

# dircolors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# vim
export EDITOR="vim"
set -o vi

# disable flow control
stty -ixon

# completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
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
