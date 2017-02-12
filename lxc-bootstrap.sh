#!/bin/bash

# lxc bootstrap script

if [ -z "$2" ]; then
  image="ubuntu:16.04"
else
  image="$2"
fi

name="$1"

bootstrap() {

  lxc launch "$1" "$2" >/dev/null
  lxc file push /etc/salt/bootstrap.sh $2/root/
  
  if [ -f /etc/apt/apt.conf.d/00proxy ]; then
    lxc file push /etc/apt/apt.conf.d/00proxy $2/etc/apt/apt.conf.d/
  fi
  
  sleep 8 # wait for ip
  lxc exec $2 -- sh -c "(/root/bootstrap.sh)" >/dev/null
  lxc exec $2 -- salt-call test.ping

}

echo "bootstrapping $name in the background"
bootstrap "$image" "$name" &
