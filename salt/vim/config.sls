clone-vim-config:
  cmd.run:
    - name: git clone https://github.com/zsoltf/dot-vim.git ~/.vim
    - cwd: ~
    - runas: krieger
    - shell: /bin/bash
    - timeout: 300
    - unless: test -d ~/.vim

clone-vundle:
  cmd.run:
    - name: git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    - runas: krieger
    - shell: /bin/bash
    - timeout: 300
    - unless: test -d ~/.vim/bundle/vundle
    - require:
        - clone-vim-config

install-vim-plugins:
  cmd.run:
    - name: vim -e +BundleInstall +qall
    - runas: krieger
    - shell: /bin/bash
    - timeout: 300
    - require:
        - clone-vundle

make-vimproc:
  cmd.run:
    - name: ~/.vim/bundle/vimproc.vim/make
    - runas: krieger
    - cwd: ~
