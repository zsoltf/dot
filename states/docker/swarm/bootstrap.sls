{% for manager in salt['saltutil.runner']('cache.grains', tgt='swarmmanager', expr_form='nodegroup') %}

{% if loop.first %}
{% set manager_sls = 'docker.swarm.first' %}
{% else %}
{% set manager_sls = 'docker.swarm.join.manager' %}
{% endif %}

bootstrap-swarm-manager-{{ manager }}:
  salt.state:
    - sls: {{ manager_sls }}
    - tgt: {{ manager }}

update-mine-for-{{ manager }}:
  salt.function:
    - name: mine.update
    - tgt: '*'
    - require:
      - salt: bootstrap-swarm-manager-{{ manager }}

{% endfor %}

{% for worker in salt['saltutil.runner']('cache.grains', tgt='swarmworker', expr_form='nodegroup') %}

bootstrap swarm worker {{ worker }}:
  salt.state:
    - sls: docker.swarm.join.worker
    - tgt: {{ worker }}

{% endfor %}
