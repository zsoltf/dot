{% set vim = salt['grains.filter_by']( salt['pillar.get']('vim:lookup') ) %}

check-if-vim-installed:
  cmd.run:
    - name: which vim
    - unless: which vim


install-vim:
  module.run:
    - name: cyg.install
    - m_name: vim
    - cyg_arch: x86
    - onchanges:
      - check-if-vim-installed

manage-vimrc:
  file.managed:
    - name: C:/cyg/usr/share/vim/{{ vim.dotfile }}
    - source: {{ vim.source }}
