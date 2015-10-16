#############
# Aliases
#############

shopt -s expand_aliases

# ls
alias ls="lsr"
alias l="lsr -l"
alias lss="lsr -lS"
alias lsp="lsr -lP"
alias lst="lsr -lt"
alias lstp="lsr -ltP"
alias ll="lsr -al"
alias llt="lsr -alt"
alias lltp="lsr -altP"
alias llp="lsr -alP"
alias lls="lsr -alS"
alias llsp="lsr -alSP"

alias df="dfc"
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

# vim man
m()
{
  if [ -n "$1" ]; then
    vim "+Man $1 | wincmd o"
  else
    echo 'boo'
  fi
}
alias man='m'

# splunk
alias splunk="sudo /opt/splunk/bin/splunk"
