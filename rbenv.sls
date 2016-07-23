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
    - user: krieger
    - require:
      - pkg: rbenv-deps

ruby-2.2.5:
  rbenv.installed:
    - user: krieger
    - require:
      - pkg: rbenv-deps

ruby-2.1.9:
  rbenv.absent:
    - user: krieger
    - require:
      - pkg: rbenv-deps

install-bundler-gem:
  gem.installed:
    - name: bundler
    - ruby: ruby-2.3.1
