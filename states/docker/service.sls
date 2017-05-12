{% if grains.os == 'Ubuntu' %}

include:
  - .package

docker-service:
  service.running:
    - name: docker
    - enable: True
    - require:
      - pkg: docker-pkg

{% endif %}
