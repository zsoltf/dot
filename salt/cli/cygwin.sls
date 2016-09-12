check-if-cygwin-is-installed:
  cmd.run:
    - unless: cygcheck -V

install-cygwin:
  module.run:
    - name: cyg.install
    - m_name: tree
    - cyg_arch: x86
    - onfail:
      - check-if-cygwin-is-installed

has-cygwin:
  grains.present:
    - value: True
