{% if grains['os'] == 'Windows' %}

include:
  - .windows
  - .cygwin

{% elif grains['os_family'] == 'Debian' %}

include:
  - .debian

{% elif grains['os'] == 'Fedora' %}

include:
  - .fedora

{% endif %}
