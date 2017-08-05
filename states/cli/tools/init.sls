tools:
  pkg.installed:
    - pkgs:
      - cmus
      - dfc
      - fish
      - mc
      - ncdu
      - ranger
      - tig
      - tree

{% load_yaml as tools %}

  cdu: '0.37'
  dmenu: '0.7'
  dwm: '6.1'
  fasd: '1.0.1'
  fzf: '0.16.11'
  lsr: '0.1'
  slstatus: '1.0'
  surf: '0.7'
  tabbed: '0.6'

{% endload %}

{% macro extract_archive(name, version) %}
extract_{{ name }}_{{ version }}_archive:
  archive.extracted:
    - name: /tmp/
    - source: salt://cli/tools/{{ name }}-{{version}}.tar.gz
{% endmacro %}

{% macro install(name) %}
install_{{ name }}:
  cmd.run:
    - name: |
        cd *{{ name }}*
        cp {{ name }} /usr/local/bin/
    - cwd: /tmp/
    - unless: which {{ name }}
{% endmacro %}

{% for name, version in tools.items() %}

{{ extract_archive(name, version) }}
{{ install(name) }}

{% endfor %}

# dmenu
dmenu_run_history:
  cmd.run:
    - name: |
        cd dmenu*
        cp dmenu_run_history /usr/local/bin/dmenu_run
    - cwd: /tmp/
    - unless: which dmenu_run

# dwm
start-dwm-script:
  file.managed:
    - name: /usr/local/bin/startdwm
    - mode: 755
    - contents: |
        #!/usr/bin/env bash
        slstatus -d
        exec dwm

xsessions-login:
  file.managed:
    - name: /usr/share/xsessions/dwm.desktop
    - contents: |
        [Desktop Entry]
        Encoding=UTF-8
        Name=DWM
        Comment=Dynamic window manager
        Exec=/usr/local/bin/startdwm
        Icon=dwm
        Type=Application
