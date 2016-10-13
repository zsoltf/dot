{% from "users/map.jinja" import users with context %}

{% for user, details in users.items() %}

{{ user }}:
  user.present:
    {% for key, value in details.items() %}
    - {{ key }}: {{ value }}
    {% endfor %}

{% endfor %}
