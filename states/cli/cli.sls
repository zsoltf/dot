{% from "users/map.jinja" import users with context %}

install-fasd:
  cmd.run:
    - name: |
        wget https://github.com/clvv/fasd/tarball/1.0.1
        tar xzf 1.0.1
        cd clvv-fasd-*
        make install
        cd ..
        rm -rf clvv-fasd-*
        rm 1.0.1
    - cwd: /tmp
    - unless: which fasd

install-lsr:
  cmd.run:
    - name: |
        wget https://github.com/zsoltf/lsr/raw/master/lsr
        chmod +x lsr
    - cwd: /usr/local/bin
    - unless: which lsr

install-golang:
  pkg.installed:
     - name: golang

install-dfc:
  pkg.installed:
    - name: dfc

install-cdu:
  cmd.run:
    - name: |
        wget http://arsunik.free.fr/pkg/cdu-0.37.tar.gz
        tar xf cdu-0.37.tar.gz
        cd cdu*
        make install
        cd ..
        rm -rf cdu*
    - cwd: /tmp
    - unless: which cdu

install-tree:
  pkg.installed:
    - name: tree

install-tig:
  pkg.installed:
    - name: tig


{% for user, details in users.items() %}

install-fzf:
  cmd.run:
    - name: |
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install
    - cwd: ~
    - runas: {{ user }}
    - unless: test -d ~/.fzf

install-gotermimg:
  cmd.run:
    - name: go get github.com/moshen/gotermimg/...
    - require:
      - install-golang
    - runas: {{ user }}

{% endfor %}
