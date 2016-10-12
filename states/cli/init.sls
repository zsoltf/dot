{% if salt['grains.get']('has-cygwin') %}

include:
  - .cygwin

{% set root = 'C:/cyg' %}
{% set home = 'C:/cyg/home' %}

{% elif salt['grains.get']('lsb_distrib_id:Xubuntu') %}

include:
  - .cli
  - .dwm
  - .fonts
  - .st

{% else %}

include:
  - .cli

{% endif %}
