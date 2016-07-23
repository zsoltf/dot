include:
  - elasticsearch

elasticsearch_config:
  file.managed:
    - name: '/etc/elasticsearch/elasticsearch.yml'
    - source: 'salt://elasticsearch/elasticsearch.yml.jinja'
    - template: jinja
    - user: root
    - watch_in:
      - service: elasticsearch
    - defaults:
        cluster_name: atom
        node_name: neutron
        network_host: 0.0.0.0
        network_port: 9200
