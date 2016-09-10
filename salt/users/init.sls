{% set users = salt['grains.filter_by']( salt['pillar.get']('users:lookup', {}) ) %}


{% for user, details in users.get('present', {}).items() %}

{{ user }}:
  user.present:
    {% for key, value in details.items() %}
    - {{ key }}: {{ value }}
    {% endfor %}

{% endfor %}


{% for user in users.get('absent', {}) %}

{{ user }}:
  user.absent

{% endfor %}
