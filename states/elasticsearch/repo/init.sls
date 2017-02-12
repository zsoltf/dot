elastic-repo:
  pkgrepo.managed:
    - humanname: Elastic Repo
    - name: deb https://artifacts.elastic.co/packages/5.x/apt stable main
    - file: /etc/apt/sources.list.d/elastic-5x.list
    - key_url: https://artifacts.elastic.co/GPG-KEY-elasticsearch
    #- keyid: D88E42B4
    - clean_file: True
    - require_in:
      - pkg: elasticsearch

