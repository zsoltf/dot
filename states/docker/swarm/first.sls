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
        parameter: docker-swarm-leader
        node: {{ grains.id }}
        url: https://foreman.discdrive.bayphoto.com
    - source: salt://docker/swarm/tokens.jinja
    - template: jinja

update-manager-docker_manager_token-parameter:
  cmd.script:
    - defaults:
        command: docker swarm join-token manager -q
        parameter: docker-manager-token
        node: {{ grains.id }}
        url: https://foreman.discdrive.bayphoto.com
    - source: salt://docker/swarm/tokens.jinja
    - template: jinja

update-manager-docker_worker_token-parameter:
  cmd.script:
    - defaults:
        command: docker swarm join-token worker -q
        parameter: docker-worker-token
        node: {{ grains.id }}
        url: https://foreman.discdrive.bayphoto.com
    - source: salt://docker/swarm/tokens.jinja
    - template: jinja
