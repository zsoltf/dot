{% from "elastic/elasticsearch/map.jinja" import elastic with context %}

{% if grains.os == 'Ubuntu' %}

include:
  - .repo

java:
  pkg.installed:
    - name: openjdk-8-jre-headless
    - require_in:
      - pkg: elasticsearch_package

elasticsearch_package:
  pkg.installed:
    - name: {{ elastic.package }}
    - fromrepo: stable
    - version: 5.2.0

{% else %}

elasticsearch_package:
  pkg.installed:
    - name: {{ elastic.package }}

{% endif %}
