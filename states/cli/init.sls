include:

{% if grains.os == 'Windows' %}

  - .cygwin

{%- else %}

  - .dwm
  - .fonts
  - .st
  - .tools

{% endif %}
