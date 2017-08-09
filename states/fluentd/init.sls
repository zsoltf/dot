fluentd-repo:
  pkgrepo.managed:
    - humanname: Fluentd Repo
    - name: deb http://packages.treasuredata.com/2/ubuntu/xenial/ xenial contrib
    - file: /etc/apt/sources.list.d/fluentd.list
    - key_url: https://packages.treasuredata.com/GPG-KEY-td-agent
    #- keyid: D88E42B4
    - clean_file: True
    - require_in:
      - pkg: fluentd


fluentd:
  pkg.installed:
    - name: td-agent
