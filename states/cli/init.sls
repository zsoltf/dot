include:

{% if grains.os == 'Windows' %}

  - .cygwin

{%- else %}

  - .fonts
  - .scripts
  - .tools

{% endif %}
