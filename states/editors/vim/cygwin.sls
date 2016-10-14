include: [ cli ]

{% import 'cli/init.sls' as cli %}

{% set vim = salt['grains.filter_by']( salt['pillar.get']('vim:lookup') ) %}

check-if-vim-installed:
  cmd.run:
    - name: which vim
    - unless: which vim

install-vim:
  cyg.installed:
    - name: vim
    - onchanges:
      - check-if-vim-installed

manage-vimrc:
  file.managed:
    - name: {{ cli.root }}/usr/share/vim/{{ vim.dotfile }}
    - source: {{ vim.source }}
