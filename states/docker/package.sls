{% if grains.os == 'Ubuntu' %}

include:
  - .repo

docker-pkg:
  pkg.installed:
    - name: docker-ce
    - fromrepo: xenial
    - refresh: True
    - version: 17.03.1~ce-0~ubuntu-xenial
    - require:
      - pkgrepo: docker-repo

{% endif %}
