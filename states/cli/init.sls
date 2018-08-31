{% set user = grains.get('user') %}

{% if grains.os == 'Fedora' %}

install_sl_tools:
  pkg.installed:
    - pkgs:
      - dwm-user
      - st-user

dwm_start_patch:
  file.patch:
    - name: /usr/bin/dwm-start
    - source: salt://cli/files/dwm/dwm-start.diff
    - hash: 844dea41f14d04987afa381847492169
    - require:
      - pkg: install_sl_tools

dwm_startup:
  file.managed:
    - name: {{ '/home/' ~ user ~ '/.dwm/startup' }}
    - source: salt://cli/files/dwm/startup

dwm_config:
  file.managed:
    - name: {{ '/home/' ~ user ~ '/.dwm/config.h' }}
    - source: salt://cli/files/dwm/config.h
    - user: {{ user }}
    - makedirs: True

dwm_patch_attachaside:
  file.managed:
    - name: {{ '/home/' ~ user ~ '/.dwm/patches/dwm-attachaside-6.1.diff' }}
    - source: salt://cli/files/dwm/dwm-attachaside-6.1.diff
    - user: {{ user }}
    - makedirs: True

dwm_patch_hidetags:
  file.managed:
    - name: {{ '/home/' ~ user ~ '/.dwm/patches/dwm-hide_vacant_tags-6.1.diff' }}
    - source: salt://cli/files/dwm/dwm-hide_vacant_tags-6.1.diff
    - user: {{ user }}
    - makedirs: True

dwm_patch_pertag:
  file.managed:
    - name: {{ '/home/' ~ user ~ '/.dwm/patches/dwm-pertag-6.1.diff' }}
    - source: salt://cli/files/dwm/dwm-pertag-6.1.diff
    - user: {{ user }}
    - makedirs: True

install_tools:
  pkg.installed:
    - pkgs:
      - fasd
      - htop
      - ranger
      - tig
      - tree

bashrc:
  file.managed:
    - name: {{ '/home/' ~ user ~ '/.bashrc' }}
    - source: salt://cli/files/bashrc
    - user: {{ user }}

gitconfig:
  file.managed:
    - name: {{ '/home/' ~ user ~ '/.gitconfig' }}
    - source: salt://cli/files/gitconfig
    - user: {{ user }}

gitconfig_local:
  file.managed:
    - name: {{ '/home/' ~ user ~ '/.gitconfig.local' }}
    - source: salt://cli/files/gitconfig.local
    - user: {{ user }}

inputrc:
  file.managed:
    - name: {{ '/home/' ~ user ~ '/.inputrc' }}
    - source: salt://cli/files/inputrc
    - user: {{ user }}

tmux_conf:
  file.managed:
    - name: {{ '/home/' ~ user ~ '/.tmux.conf' }}
    - source: salt://cli/files/tmux.conf
    - user: {{ user }}

terminalrc:
  file.managed:
    - name: {{ '/home/' ~ user ~ '/.config/xfce4/terminal/terminalrc' }}
    - source: salt://cli/files/terminalrc
    - user: {{ user }}
    - makedirs: True

{% endif %}
