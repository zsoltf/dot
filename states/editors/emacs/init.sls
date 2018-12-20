{% set user = pillar.get('user') %}

include:
  - .config

emacs:
  pkg.installed: []

spacemacs:
  git.latest:
    - name: https://github.com/syl20bnr/spacemacs
    - target: /home/{{ user }}/.emacs.d
    - user: {{ user }}
