{%- set repo_version = salt['pillar.get']('elasticsearch:repo_version') %}

repo:
  pkgrepo.managed:
    - humanname: Elastic Repo
    - name: deb http://packages.elastic.co/elasticsearch/{{ repo_version }}/debian stable main
    - file: /etc/apt/sources.list.d/elastic.list
    - keyid: D88E42B4
    - keyserver: keyserver.ubuntu.com
