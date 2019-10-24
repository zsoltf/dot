{% if grains.os == 'Ubuntu' %}
{% set user = pillar.get('user') %}

include:
  - .repo

docker:
  pkg.installed:
    - name: docker-ce
    - refresh: True
  group.present:
    - members:
      - {{ user }}
  service.running:
    - enable: True
    - require:
      - pkg: docker

docker-compose:
  pkg.installed: []

{% endif %}
