{% set user = pillar.get('user') %}

vim dependencies:
  pkg.installed:
    - pkgs:
      - libncurses5-dev
      - python-dev
      - ruby-dev
      - lua5.1
      - luajit
      - libluajit-5.1-dev
      - liblua5.1-dev
      - libtolua-dev
      - mercurial
      - git
      - exuberant-ctags
      - curl

clone-vim-repo:
  cmd.run:
    - name: |
        git clone https://github.com/vim/vim /tmp/vim
    - cwd: /tmp
    - shell: /bin/bash
    - timeout: 300
    - unless: which vim

configure-vim:
  cmd.run:
    - name: |
        ./configure \
        --with-features=huge \
        --enable-multibyte \
        --enable-rubyinterp \
        --enable-pythoninterp \
        --enable-luainterp \
        --with-luajit \
        --enable-cscope \
        --with-compiledby="Zsolt Fekete (zsoltf@me.com)"
    - cwd: /tmp/vim
    - shell: /bin/bash
    - timeout: 300
    - unless: which vim
    - require:
      - clone-vim-repo

make-install-vim:
  cmd.run:
    - name: |
        make install clean
    - cwd: /tmp/vim
    - shell: /bin/bash
    - timeout: 300
    - unless: which vim
    - require:
      - configure-vim

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
