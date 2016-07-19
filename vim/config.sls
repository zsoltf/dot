clone-vim-config:
  cmd.run:
    - name: |
        git clone https://github.com/zsoltf/dot-vim.git ~/.vim
        git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    - cwd: ~
    - shell: /bin/bash
    - timeout: 300
    - unless: test -d ~/.vim
