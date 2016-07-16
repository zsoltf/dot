rbenv-deps:
  pkg.installed:
    - names:
      - bash
      - git
      - openssl
      - libssl-dev
      - make
      - curl
      - autoconf
      - bison
      - build-essential
      - libffi-dev
      - libyaml-dev
      - libreadline6-dev
      - zlib1g-dev
      - libncurses5-dev

ruby-2.3.1:
  rbenv.installed:
    - default: True
    - require:
      - pkg: rbenv-deps

ruby-2.2.5:
  rbenv.installed:
    - require:
      - pkg: rbenv-deps

ruby-2.1.9:
  rbenv.installed:
    - require:
      - pkg: rbenv-deps
