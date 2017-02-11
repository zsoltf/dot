{% if grains.os == 'Ubuntu' %}

include:
  - .repo

salt-minion:
  pkg.installed:
    - fromrepo: xenial
    - refresh: True
    - version: 2016.11.2+ds-1

{% else %}

salt-minion:
  pkg.installed:
    - refresh: True

{% endif %}
