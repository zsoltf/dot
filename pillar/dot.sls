dot:
  lookup:
    Windows:
      - name: .bashrc
        source: salt://dot/files/windows/bashrc
      - name: .gitconfig
        source: salt://dot/files/windows/gitconfig
      - name: .tmux.conf
        source: salt://dot/files/windows/tmux.conf
      - name: .minttyrc
        source: salt://dot/files/windows/minttyrc
    Debian:
      - name: .bashrc
        source: salt://dot/files/debian/bashrc
      - name: .tmux.conf
        source: salt://dot/files/debian/tmux.conf
      - name: .gitconfig
        source: salt://dot/files/debian/gitconfig
      - name: .config/xfce4/terminal/terminalrc
        source: salt://dot/files/debian/terminalrc
