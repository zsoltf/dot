jre:
  pkg.installed:
    - name: openjdk-8-jre-headless
    - require_in:
      - elasticsearch
      - logstash
      - kibana
