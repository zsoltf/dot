include:
  - .powerline

fonts:
  archive.extracted:
    - name: /usr/local/share/fonts/
    - enforce_toplevel: False
    - source: salt://fonts/fonts.tar.gz
  cmd.run:
    - name: fc-cache -f
    - onchanges:
      - archive: fonts
