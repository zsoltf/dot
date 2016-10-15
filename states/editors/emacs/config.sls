{% from 'users/map.jinja' import users with context %}
{% import 'cli/init.sls' as cli %}

{% for user, details in users.items() %}

dotspacemacs-for-{{ user }}:
  file.managed:
    - name: {{ [cli.home, user, '.spacemacs']|join("/") }}
    - source: salt://editors/emacs/files/spacemacs

{% endfor %}
