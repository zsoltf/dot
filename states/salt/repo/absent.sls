drop-saltstack-pkgrepo:
  pkgrepo.absent:
    - name: deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main
  file.absent:
    - name: /etc/apt/sources.list.d/saltstack.list

drop-saltstack-apt-key:
  file.absent:
    - name: /etc/apt/trusted.gpg.d/saltstack.gpg
