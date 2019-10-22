{% load_yaml as os_map %}

  base:
    packages:
      - ruby

  Ubuntu:
    packages:
      - ruby
      - ruby-dev

  Fedora:
    packages:
      - ruby
      - ruby-devel

{% endload %}

{% set ruby = salt.grains.filter_by(os_map, base='base') %}

ruby:
  pkg.installed:
    - names: {{ ruby.packages }}
