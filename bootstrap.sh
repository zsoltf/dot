#!/bin/bash

# salt bootstrap script

# detect os
os='unknown'
case "$OSTYPE" in
  solaris*) os="SOLARIS" ;;
  darwin*)  os="OSX" ;; 
  linux*)   os="LINUX" ;;
  bsd*)     os="BSD" ;;
  msys*)    os="WINDOWS" ;;
  *)        os="unknown: $OSTYPE" ;;
esac

# ubuntu: latest salt from saltstack repo
if [ $(lsb_release -si) == 'Ubuntu' ]; then

  key=`apt-key list | grep salt`
  if [ -z "$key" ]; then

    wget -O - "https://repo.saltstack.com/apt/ubuntu/$(lsb_release -sr)/amd64/latest/SALTSTACK-GPG-KEY.pub" | sudo apt-key add -

  fi

  repo='/etc/apt/sources.list.d/saltstack.list'
  if [ ! -f $repo ]; then

    touch $repo
    echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" > $repo
    sudo apt-get update

  fi

  if [ ! $(which salt-minion) ]; then
    apt install git salt-minion -y
  fi
  echo "Salt Minion $(salt-minion --version) is installed"

fi


