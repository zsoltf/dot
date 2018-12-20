fonts:
  archive.extracted:
    - name: /usr/share/fonts/
    - enforce_toplevel: False
    - source: salt://fonts/fonts.tar.gz
  cmd.watch:
    - name: fc-cache -f
    - require:
      - archive: fonts
