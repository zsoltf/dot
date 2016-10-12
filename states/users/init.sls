{% set list = salt['grains.filter_by']( salt['pillar.get']('users:lookup', {}) ) %}


{% for user, details in list.present.items() %}

{{ user }}:
  user.present:
    {% for key, value in details.items() %}
    - {{ key }}: {{ value }}
    {% endfor %}

{% endfor %}


{% for user in list.get('absent', {}) %}

{{ user }}:
  user.absent

{% endfor %}
