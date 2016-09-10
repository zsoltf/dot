install-powerline-fonts:
  cmd.run:
    - name: |
        git clone https://github.com/powerline/fonts ./fonts
        ./fonts/install.sh
        rm -rf ./fonts
    - cwd: /tmp
    - runas: krieger
    - unless: test -d ~/.local/share/fonts
