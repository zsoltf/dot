st-dependencies:
  pkg.installed:
    - pkgs:
      - build-essential
      - libxft-dev
      - libx11-dev
      - suckless-tools

download-st:
  cmd.run:
    - name: |
        wget http://dl.suckless.org/st/st-0.6.tar.gz
        tar xzf st-0.6.tar.gz
    - cwd: /tmp
    - unless: which st || test -d /tmp/st-0.6

st-config:
  file.managed:
    - name: /tmp/st-0.6/config.def.h
    - source: salt://st/config.h
    - create: False
    - require:
      - download-st

install-st:
  cmd.run:
    - name: cd /tmp/st-0.6 && make install clean
    - shell: /bin/bash
    - unless: test -f /usr/local/bin/st
    - require:
      - st-config

st-cleanup:
  cmd.run:
    - name: rm -rf /tmp/st-0.6*
    - cwd: /tmp
    - onlyif: test -d /tmp/st-0.6
