{%- set version = salt['pillar.get']('elasticsearch:version') %}

include:
  - .repo
  - .jre

elasticsearch:
  pkg.installed:
    - version: {{ version }}
    - hold: True
    - require:
      - repo
      - jre
