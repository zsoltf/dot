{% from "elastic/elasticsearch/map.jinja" import elastic with context %}

{% load_yaml as config %}

  cluster.name: atom
  http.port: 9200
  network.host: {{ salt['network.ipaddrs']()[0] }}
  node.name: {{ grains.host }}
  path.data: /var/db/elasticsearch
  path.logs: /var/log/elasticsearch
  path.scripts: /etc/elasticsearch/scripts

{% endload %}

elasticsearch_data_dir:
  file.directory:
    - name: /var/db/elasticsearch
    - makedirs: True
    - user: elasticsearch

elasticsearch_config:
  file.managed:
    - name: {{ elastic.config_path }}
    - contents: |
        {{ config|yaml(False)|indent(8) }}
