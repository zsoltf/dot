extend:
  elasticsearch:
    service.running:
      - enable: True
      - watch:
        - pkg: elasticsearch
      - require:
        - pkg: elasticsearch

  logstash:
    service.running:
      - enable: True
      - watch:
        - pkg: logstash
      - require:
        - pkg: logstash

  kibana:
    service.running:
      - enable: True
      - watch:
        - pkg: kibana
      - require:
        - pkg: kibana
