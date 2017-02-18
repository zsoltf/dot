include:
  - common
  - users

{% from "dot/map.jinja" import files with context %}

{% for user, details in pillar.get('users', {}).items() %}
{% for file in files %}

manage {{ file.name }} for {{ user }}:
  file.managed:
    - name: {{ [grains.get.os_home, user, file.name]|join("/") }}
    - makedirs: True
    - source: salt://dot/files/{{ [grains.get.os, file.source]|join("/") }}
    - template: jinja
    - user: {{ user }}

{% endfor %}
{% endfor %}
