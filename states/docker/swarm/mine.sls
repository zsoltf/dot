include:
  - docker.package

salt-mine-swarm-conf:
  file.managed:
    - name: /etc/salt/minion.d/swarm.conf
    - contents: |
        mine_functions:
          manager_token:
            - mine_function: cmd.run
            - 'docker swarm join-token manager -q'
          manager_ip:
            - mine_function: network.ip_addrs
            - eno1
          worker_token:
            - mine_function: cmd.run
            - 'docker swarm join-token worker -q'
    - require:
      - pkg: docker-pkg
