include:
  - docker.package
  - docker.swarm.mine
  - docker.swarm.drain

initialize-swarm-cluster:
  cmd.run:
    - name: 'docker swarm init'
    - require:
      - pkg: docker-pkg
    - require_in:
      - cmd: drain-manager
