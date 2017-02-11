{% from "common/map.jinja" import common with context %}

{% for name, value in common.grains.items() %}

common_grain_{{ name }}:
  grains.present:
    - name: {{ name }}
    - value: {{ value }}

{% endfor %}
