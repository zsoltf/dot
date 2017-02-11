saltstack-repo:
  pkgrepo.managed:
    - humanname: SaltStack Debian Repo
    - name: deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main
    - file: /etc/apt/sources.list.d/saltstack.list
    - key_url: https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub
    - clean_file: True
    - order: 1
