{% set users = salt['grains.filter_by']( salt['pillar.get']('users:lookup') ) %}
{% set files = salt['grains.filter_by']( salt['pillar.get']('dot:lookup', {}) ) %}

include:
  - users

{% for file in files %}

manage {{ file.name }}:
  file.managed:
    - name: {{ users.default.home }}/{{ file.name }}
    - source: {{ file.source }}

{% endfor %}
