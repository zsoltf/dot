{% from "elastic/elasticsearch/map.jinja" import elastic with context %}

include:
  - .package
  - .config

elasticsearch_service:
  service.running:
    - name: {{ elastic.service }}
    - enable: True
    - require:
      - pkg: elasticsearch_package
      - file: elasticsearch_config
    - watch:
      - pkg: elasticsearch_package
      - file: elasticsearch_config

