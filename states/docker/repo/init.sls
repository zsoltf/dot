{% load_yaml as pkgrepo %}

url: "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
key: https://download.docker.com/linux/ubuntu/gpg

{% endload %}

apt-transport-https:
  pkg.installed: []

docker-repo:
  pkgrepo.managed:
    - humanname: Docker Debian Repo
    - name: {{ pkgrepo.url }}
    - file: /etc/apt/sources.list.d/docker.list
    - key_url: {{ pkgrepo.key }}
    - clean_file: True
    - order: 1
    - require:
      - pkg: apt-transport-https
    - require_in:
      - pkg: docker
