{% from "common/map.jinja" import common with context %}

common_packages:
  pkg.installed:
    - pkgs: {{ common.pkgs }}
