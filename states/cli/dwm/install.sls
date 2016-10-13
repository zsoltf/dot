dwm-dependencies:
  pkg.installed:
    - pkgs:
      - build-essential
      - libxft-dev
      - libx11-dev
      - libxinerama-dev
      - sharutils
      - suckless-tools

download-dwm:
  cmd.run:
    - name: |
        wget http://dl.suckless.org/dwm/dwm-6.1.tar.gz
        tar xzf dwm-6.1.tar.gz
    - cwd: /tmp
    - unless: which dwm || test -d /tmp/dwm-6.1

dwm-config:
  file.managed:
    - name: /tmp/dwm-6.1/config.def.h
    - source: salt://cli/dwm/config.h
    - create: False
    - require:
      - download-dwm

dwm-config-mk:
  file.managed:
    - name: /tmp/dwm-6.1/config.mk
    - source: salt://cli/dwm/config.mk
    - create: False
    - require:
      - download-dwm

install-dwm:
  cmd.run:
    - name: cd /tmp/dwm-6.1 && make install clean
    - shell: /bin/bash
    - unless: test -f /usr/local/bin/dwm
    - require:
      - dwm-config
      - dwm-config-mk

xsessions-login:
  file.managed:
    - name: /usr/share/xsessions/dwm.desktop
    - contents: |
        [Desktop Entry]
        Encoding=UTF-8
        Name=DWM
        Comment=Dynamic window manager
        Exec=/home/krieger/.startdwm
        Icon=dwm
        Type=Application

start-dwm-script:
  file.managed:
    - name: /home/krieger/.startdwm
    - mode: 755
    - contents: |
        #!/usr/bin/env bash
        exec dwm

dwm-cleanup:
  cmd.run:
    - name: rm -rf /tmp/dwm-6.1*
    - cwd: /tmp
    - onlyif: test -d /tmp/dwm-6.1
