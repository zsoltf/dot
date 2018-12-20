{% set user = pillar.get('user') %}

vim-enhanced:
  pkg.installed: []

#TODO: manage default vimrc instead of user vimrc
clone-vim-config:
  cmd.run:
    - name: git clone https://github.com/zsoltf/dot-vim.git ~/.vim
    - cwd: ~
    - runas: {{ user }}
    - shell: /bin/bash
    - timeout: 300
    - unless: test -d ~/.vim

clone-vundle:
  cmd.run:
    - name: git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    - runas: {{ user }}
    - shell: /bin/bash
    - timeout: 300
    - onchanges:
      - cmd: clone-vim-config

install-vim-plugins:
  cmd.run:
    - name: vim -e +BundleInstall +qall
    - runas: {{ user }}
    - shell: /bin/bash
    - timeout: 300
    - onchanges:
      - cmd: clone-vim-config

make-vimproc:
  cmd.run:
    - name: make
    - runas: {{ user }}
    - cwd: /home/{{ user }}/.vim/bundle/vimproc.vim
    - onchanges:
      - cmd: clone-vim-config

chown-vim-config:
  cmd.run:
    - name: chown -R {{ user }} /home/{{ user }}/.vim
    - onchanges:
      - cmd: clone-vim-config
