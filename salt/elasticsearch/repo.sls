{%- set repo_version = salt['pillar.get']('elasticsearch:repo_version') %}

elastic-repo:
  pkgrepo.managed:
    - humanname: Elastic Repo
    - name: deb http://packages.elastic.co/elasticsearch/2.x/debian stable main
    - file: /etc/apt/sources.list.d/elastic.list
    - keyid: D88E42B4
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: elasticsearch

logstash-repo:
  pkgrepo.managed:
    - humanname: Logstash Repo
    - name: deb http://packages.elastic.co/logstash/2.3/debian stable main
    - file: /etc/apt/sources.list.d/elastic.list
    - keyid: D88E42B4
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: logstash

kibana-repo:
  pkgrepo.managed:
    - humanname: Kibana Repo
    - name: deb http://packages.elastic.co/kibana/4.5/debian stable main
    - file: /etc/apt/sources.list.d/elastic.list
    - keyid: D88E42B4
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: kibana
