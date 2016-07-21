clone-dotfiles:
  cmd.run:
    - name: |
        git init .
        git remote add origin https://github.com/zsoltf/dot.git
        mv ~/.gitconfig ~/.gitconfig.old
        mv ~/.bashrc ~/.bashrc.old
        git pull origin ubuntux
    - cwd: ~
    - runas: krieger
    - unless: test -d ~/.git
