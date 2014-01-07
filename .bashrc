#
# zsolt's bashrc
#



# Startup scripts


# Shortcuts

alias df='df -h'
alias tree='tree -Ch'
alias ls='ls -h'
alias la='ls -a'
alias vrc='vim ~/.vimrc'
alias c='clear'

alias b="bundle"
alias bi="b install --path vendor"
alias bil="bi --local"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"
alias ber="be rspec"
alias berp="be rake db:test:prepare && ber"

# vi
export EDITOR='vim'
set -o vi

# prompt
PS1="\u: [\W] $ "
export CLICOLOR=1
export LSCOLORS=CxFxCxDxBxegedabagaced

# paths
export PATH="$PATH:$HOME/.rbenv/bin"
eval "$(rbenv init -)"

eval `dircolors ~/.dircolors/dircolors.256dark`
