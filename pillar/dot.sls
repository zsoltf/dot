dot:
  lookup:
    Windows:
      - name: .bashrc
        source: salt://dot/windows/bashrc
      - name: .tmux.conf
        source: salt://dot/windows/tmux.conf
      - name: .minttyrc
        source: salt://dot/windows/mittyrc
    Debian:
      - name: .bashrc
        source: salt://dot/debian/bashrc
      - name: .tmux.conf
        source: salt://dot/windows/tmux.conf
