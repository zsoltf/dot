#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='mbriggs'

# Load Bash It
source $BASH_IT/bash_it.sh

# homebrew
export PATH=/usr/local/sbin:$PATH

# bashrc
source ~/.bashrc
