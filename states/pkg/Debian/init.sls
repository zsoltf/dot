{% set pkg_server = 'neutron' %}

{% if grains.host.startswith(pkg_server) %}

include:
  - .server
  - .proxy

{% else %}

include:
  - .proxy

{% endif %}
