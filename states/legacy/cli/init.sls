include:

{% if grains.os == 'Windows' %}

  - .cygwin

{% elif grains.os == 'Ubuntu' %}

  - .fonts
  - .scripts
  - .tools

{% endif %}
