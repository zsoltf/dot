include:
  - users
  - cli

{% from 'users/map.jinja' import users with context %}
{% import 'cli/init.sls' as cli %}

{% set files = salt['grains.filter_by']( salt['pillar.get']('dot:lookup', {}) ) %}

{% for user, details in users.items() %}
{% for file in files %}

manage {{ file.name }} for {{ user }}:
  file.managed:
    - name: {{ [cli.home, user, file.name]|join("/") }}
    - source: {{ file.source }}

{% endfor %}
{% endfor %}
