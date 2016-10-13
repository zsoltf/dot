{% if salt['grains.get']('has-cygwin') %}

include:
  - .cygwin

{% set root = 'C:/cyg' %}
{% set home = 'C:/cyg/home' %}

{% elif grains.os == 'Ubuntu' %}

include:
  - .cli
  - .dwm
  - .fonts
  - .st

{% set root = '/' %}
{% set home = '/home' %}

{% else %}

include:
  - .cli

{% endif %}
