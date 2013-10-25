#
# zsolt's bashrc
#

# Prompt

set -o vi

PS1="\u: [\W] $ "

export CLICOLOR=1
export LSCOLORS=CxFxCxDxBxegedabagaced

export EDITOR='vim'

# Startup scripts

#source /usr/local/bin/virtualenvwrapper.sh

# Shortcuts

alias df='df -h'
alias tree='tree -Ch'
alias ls='ls -h'
alias la='ls -a'

alias vrc='vim ~/.vimrc'

# Mac specific stuff -- from the Internets
#
# QuickLook from the command line
# Display files in Quick Look
function ql ()
{
(qlmanage -p "$@" > /dev/null 2>&1 &
local ql_pid=$!
read -sn 1
kill ${ql_pid}) > /dev/null 2>&1
}
# Display any filetype as plain text
function qlt ()
{
(qlmanage -p -c public.plain-text "$@" > /dev/null 2>&1 &
local ql_pid=$!
read -sn 1
kill ${ql_pid}) > /dev/null 2>&1
}
# Mac End

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:/Users/zsolt/perl5";
export PERL_MB_OPT="--install_base /Users/zsolt/perl5";
export PERL_MM_OPT="INSTALL_BASE=/Users/zsolt/perl5";
export PERL5LIB="/Users/zsolt/perl5/lib/perl5:$PERL5LIB";
export PATH="/Users/zsolt/perl5/bin:$PATH";
