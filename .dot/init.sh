#! /bin/bash

# helpers

# check if a package has been installed
installed()
{
  echo -n "$1: "
  if [[ -n `which $1` ]]; then
    echo "already installed"
    return 0
  else
    echo -n "installing..."
    return 1
  fi
}

# create src folder for packages
! [ -d ~/src ] && mkdir ~/src
cd ~/src


# essentials
############

# tmux
if ! installed tmux; then
  #TODO
  wget http://tmux
  wget libevent
fi

# vim
if ! installed vim; then
  #TODO
  install_vim.sh
fi

# ruby
if ! installed rbenv; then
  #TODO
  install_rbenv.sh
fi

# utils
#######

# ls++
if ! installed ls++; then
  sudo cpan Term::ExtendedColor
  git clone git://github.com/zsoltf/ls--.git
  cd ls--
  perl Makefile.PL
  make
  sudo make install
  cp ls++.conf ~/.ls++.conf
  cd -
fi

# fasd
if ! installed fasd; then
  wget https://github.com/clvv/fasd/tarball/1.0.1 -O fasd101.tar.gz
  tar xf fasd101.tar.gz
  cd *fasd*
  # if permissions aren't right
  #sudo chown $USER /usr/local/bin
  #sudo chown -R $USER /usr/local/share
  make install
  cd -
fi

# gotermimg
if ! installed gotermimg; then
  # display images and even gifs in the terminal
  # 175mb of go is worth it
  sudo apt-get -y install golang
  go get github.com/moshen/gotermimg/...
fi

# dfc
if ! installed dfc; then
  sudo apt-get -y install dfc
fi

# cdu
if ! installed cdu; then
  wget http://arsunik.free.fr/pkg/cdu-0.37.tar.gz
  tar xf cdu-0.37.tar.gz
  cd cdu*
  make install
  cd -
fi

# framebuffer
#############

# fbterm
if ! installed fbterm; then
  sudo apt-get -y install fbterm rungetty
  sudo ln -s ~/.fbtermrc /root/
  sudo cp ~/.dot/tty1.override /etc/init/
  echo "done"
fi

# fim
if ! installed fim; then
  sudo apt-get -y install libjpeg-dev libgif-dev bison flex
  wget http://download.savannah.nongnu.org/releases/fbi-improved/fim-0.5-trunk.tar.gz
  tar xf fim-0.5-trunk.tar.gz
  cd fim*
  ./configure --disable-exif
  make
  sudo make install
  echo "done"
fi

# dotfiles
##########

cd ~
if (git status > /dev/null); then
  echo "config already cloned"
else
  git clone https://github.com/zsoltf/dot ~
fi
