{% set interface = salt.network.ifacestartswith(10)|first %}

{% load_yaml as leader %}

  network: {{ salt.network.interface(interface)|first }}
  port: 2377

{% endload %}

include:
  - docker.package

initialize-swarm-cluster:
  cmd.wait:
    - name: docker swarm init --advertise-addr {{ leader.network.address }}:{{ leader.port }}
    - onchanges_in:
      - cmd: update-manager-docker_worker_token-parameter
      - cmd: update-manager-docker_manager_token-parameter
      - cmd: update-manager-docker_swarm_leader-parameter
    - watch:
      - pkg: docker-pkg

update-manager-docker_swarm_leader-parameter:
  cmd.script:
    - defaults:
        command: echo 'true'
        hostgroup: 4
        parameter: docker-swarm-leader
        url: https://foreman.discdrive.bayphoto.com
    - source: salt://docker/swarm/tokens.jinja
    - template: jinja

update-manager-docker_manager_token-parameter:
  cmd.script:
    - defaults:
        command: docker swarm join-token manager -q
        hostgroup: 4
        parameter: docker-manager-token
        url: https://foreman.discdrive.bayphoto.com
    - source: salt://docker/swarm/tokens.jinja
    - template: jinja

update-manager-docker_worker_token-parameter:
  cmd.script:
    - defaults:
        command: docker swarm join-token worker -q
        hostgroup: 4
        parameter: docker-worker-token
        url: https://foreman.discdrive.bayphoto.com
    - source: salt://docker/swarm/tokens.jinja
    - template: jinja
