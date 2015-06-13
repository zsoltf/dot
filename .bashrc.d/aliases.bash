#############
# Aliases
#############

shopt -s expand_aliases
alias df="dfc"
alias l="lsr -l"
alias ll="lsr -al"
alias ls="lsr"
alias img="gotermimg -u=true"
alias du="cdu -i -d h"
alias c="clear;"
alias g="git"
alias gc="git commit -m"
alias apt="sudo apt-get"

alias vc="vim ~/.vim/vimrc"
alias vb="vim ~/.bashrc"
alias vba="vim ~/.bashrc.d/aliases.bash"

# bundler
alias b="bundle"
alias bi="b install --path vendor"
alias bil="bi --local"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo vendor/ruby >> .gitignore"
alias ber="be rspec"
alias berp="be rake db:test:prepare && ber"

# dropbox
alias drop="python ~/.dropbox/dropbox.py"

