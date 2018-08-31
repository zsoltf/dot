{% load_yaml as scripts %}

  - backlight
  - brightness
  - touchpadon
  - touchpadoff

{% endload %}

{% for script in scripts %}

{{ script }}_script:
  file.managed:
    - name: /usr/local/bin/{{ script }}
    - mode: 774
    - source: salt://cli/scripts/{{ script }}

{% endfor %}
