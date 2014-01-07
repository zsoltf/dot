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

# vi
export EDITOR='vim'
set -o vi

# prompt
PS1="\u: [\W] $ "
export CLICOLOR=1
export LSCOLORS=CxFxCxDxBxegedabagaced

# paths
export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:/Users/zsolt/perl5";
export PERL_MB_OPT="--install_base /Users/zsolt/perl5";
export PERL_MM_OPT="INSTALL_BASE=/Users/zsolt/perl5";
export PERL5LIB="/Users/zsolt/perl5/lib/perl5:$PERL5LIB";
export PATH="/Users/zsolt/perl5/bin:$PATH";
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
