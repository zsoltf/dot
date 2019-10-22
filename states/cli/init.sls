{% set user = pillar.get('user') %}

include:
  - ruby

#
# dwm on fedora
#

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

{% endif %}


#
# configs
#

install_tools:
  pkg.installed:
    - pkgs:
      - compton
      - fasd
      - feh
      - htop
      - ranger
      - rofi
      - slock
      - tig
      - tree
      - xscreensaver

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

install-fzf:
  cmd.run:
    - name: |
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install --all --no-zsh --no-fish
    - runas: {{ user }}
    - cwd: ~
    - unless: test -d ~/.fzf

gtk-3-config:
  file.managed:
    - name: /home/{{ user }}/.config/gtk-3.0/settings.ini
    - user: {{ user }}
    - contents: |
        [Settings]
        gtk-application-prefer-dark-theme=1 

gtk-4-config:
  file.managed:
    - name: /home/{{ user }}/.config/gtk-4.0/settings.ini
    - user: {{ user }}
    - contents: |
        [Settings]
        gtk-application-prefer-dark-theme=1 

#
# custom tools
#

{% load_yaml as tools %}

  cdu: '0.37'
  lsr: '0.1'

{% endload %}

{% macro extract_archive(name, version) %}
extract_{{ name }}_{{ version }}_archive:
  archive.extracted:
    - name: /tmp/
    - source: salt://cli/tools/{{ name }}-{{version}}.tar.gz
{% endmacro %}

{% macro install(name) %}
install_{{ name }}:
  cmd.run:
    - name: |
        cd *{{ name }}*
        cp {{ name }} /usr/local/bin/
    - cwd: /tmp/
    - unless: which {{ name }}
{% endmacro %}

{% for name, version in tools.items() %}

{{ extract_archive(name, version) }}
{{ install(name) }}

{% endfor %}

# dmenu with history
dmenu_run_history:
  file.managed:
    - name: /usr/bin/dmenu_run
    - source: salt://cli/tools/dmenu_run_history


# herbsluftwm
install-herbstluftwm:
  cmd.run:
    - name: |
        apt install -y glib2.0-dev libx11-dev libxext-dev libxinerama-dev
        wget https://herbstluftwm.org/tarballs/herbstluftwm-0.7.2.tar.gz
        tar xzf herbstluftwm-0.7.2.tar.gz
        cd herbstluftwm-0.7.2/
        make all-nodoc
        make install-nodoc
        cd ..
        rm -rf herbstluftwm-0.7.2/
    - cwd: /tmp
    - unless: which herbstluftwm
  file.managed:
    - name: /home/{{ pillar.user }}/.config/herbstluftwm/autorun
    - source: salt://cli/files/herbstluftwm

# google chrome
google-chrome:
  pkgrepo.managed:
    - humanname: Google Repo
    - name: deb http://dl.google.com/linux/chrome/deb/ stable main
    - file: /etc/apt/sources.list.d/google.list
    - key_url: https://dl.google.com/linux/linux_signing_key.pub
    #- keyid: D88E42B4
    - clean_file: True
    - require_in:
      - pkg: google-chrome
  pkg.installed:
    - name: google-chrome-stable
