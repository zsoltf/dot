include:
  - .ssh

{% for username, details in pillar.get('users', {}).items() %}
{{ username }}:

  user.present:
    - fullname: {{ details.get('fullname', '') }}
    - name: {{ username }}
    - shell: /bin/bash
    - home: /home/{{ username }}

{% endfor %}
