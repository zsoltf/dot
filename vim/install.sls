clone-vim-repo:
  cmd.run:
    - name: |
        git clone https://github.com/vim/vim /tmp/vim
    - cwd: /tmp
    - shell: /bin/bash
    - timeout: 300
    - unless: which vim || test -d /tmp/vim

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
