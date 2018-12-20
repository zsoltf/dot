{% set user = pillar.get('user') %}

dotspacemacs-for-{{ user }}:
  file.managed:
    - name: /home/{{ user }}/.spacemacs
    - source: salt://editors/emacs/files/spacemacs
