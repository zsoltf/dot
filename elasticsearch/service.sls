extend:
  elasticsearch:
    service.running:
      - enable: True
      - watch:
        - pkg: elasticsearch
      - require:
        - pkg: elasticsearch
