include:
{% if grains['os'] == 'Windows' %}
  - .cygwin
{% else %}
  - .deps
  - .install
  - .config
{% endif %}
