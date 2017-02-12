{% load_yaml as pkgrepo %}

url:
  - deb http://repo.saltstack.com/apt
  - {{ grains.os|lower }}
  - {{ grains.osrelease }}
  - amd64
  - latest {{ grains.oscodename }} main

key:
  - https://repo.saltstack.com/apt
  - {{ grains.os|lower }}
  - {{ grains.osrelease }}
  - amd64/latest/SALTSTACK-GPG-KEY.pub

{% endload %}

saltstack-repo:
  pkgrepo.managed:
    - humanname: SaltStack Debian Repo
    - name: {{ pkgrepo.url|join('/') }}
    - file: /etc/apt/sources.list.d/saltstack.list
    - key_url: {{ pkgrepo.key|join('/') }}
    - clean_file: True
    - order: 1
    - require_in:
      - pkg: salt-minion
