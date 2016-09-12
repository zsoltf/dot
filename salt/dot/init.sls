include:
  - users
  - cli

{% import 'users/init.sls' as users %}
{% import 'cli/init.sls' as cli %}

{% set files = salt['grains.filter_by']( salt['pillar.get']('dot:lookup', {}) ) %}

{% for user, details in users.list.get('present', {}).items() %}
{% for file in files %}

manage {{ file.name }} for {{ user }}:
  file.managed:
    - name: {{ [cli.home, user, file.name]|join("/") }}
    - source: {{ file.source }}

{% endfor %}
{% endfor %}
