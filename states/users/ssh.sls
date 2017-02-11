{% for username, details in pillar.get('users', {}).items() %}

{% if 'pub_ssh_keys' in details %}
{{ username }}_ssh:
  ssh_auth.present:
    - user: {{ username }}
    - names:
    {% for pub_ssh_key in details.get('pub_ssh_keys', []) %}
      - {{ pub_ssh_key }}
    {% endfor %}
    - require:
      - user: {{ username }}
{% endif %}

{% endfor %}
