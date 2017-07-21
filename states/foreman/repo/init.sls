{% load_yaml as pkgrepo %}

url: deb http://deb.theforeman.org/ {{ grains.oscodename }} 1.14
key: https://deb.theforeman.org/pubkey.gpg

{% endload %}

foreman-repo:
  pkgrepo.managed:
    - humanname: Foreman Debian Repo
    - name: {{ pkgrepo.url }}
    - file: /etc/apt/sources.list.d/foreman.list
    - key_url: {{ pkgrepo.key }}
    - order: 1

foreman-plugins-repo:
  pkgrepo.managed:
    - humanname: Foreman Plugins Debian Repo
    - name: deb http://deb.theforeman.org/ plugins 1.14
    - file: /etc/apt/sources.list.d/foreman_plugins.list
    - key_url: {{ pkgrepo.key }}
    - order: 2
