{% set vim = salt['grains.filter_by']( salt['pillar.get']('vim:lookup'), merge=salt['pillar.get']('vim') ) %}
{% set users = salt['grains.filter_by']( salt['pillar.get']('users:lookup')) %}

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

{% for user, details in users.iteritems() %}

manage-vimrc:
  file.managed:
    - name: {{ details.home }}/{{ vim.dotfile }}
    - source: {{ vim.source }}

{% endfor %}
