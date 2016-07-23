{%- set version = salt['pillar.get']('elasticsearch:version') %}

include:
  - .repo
  - .jre

elasticsearch:
  pkg.installed:
    - version: {{ version }}
    - hold: True

logstash:
  pkg.installed:
    - hold: True

kibana:
  pkg.installed:
    - hold: True

install-elasticsearch-kopf-plugin:
  cmd.run:
    - name: bin/plugin install lmenezes/elasticsearch-kopf/2.1.1
    - cwd: /usr/share/elasticsearch
    - unless: test -d /usr/share/elasticsearch/plugins/kopf
