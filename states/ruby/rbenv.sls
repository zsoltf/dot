rbenv-deps:
  pkg.installed:
    - pkgs:
      - autoconf
      - bash
      - bison
      - build-essential
      - curl
      - git
      - libffi-dev
      - libncurses5-dev
      - libreadline6-dev
      - libssl-dev
      - libyaml-dev
      - make
      - openssl
      - zlib1g-dev

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

install-bundler-gem-for-ruby-2.2:
  gem.installed:
    - name: bundler
    - ruby: ruby-2.2.5
    - user: krieger

install-bundler-gem-for-ruby-2.3:
  gem.installed:
    - name: bundler
    - ruby: ruby-2.3.1
    - user: krieger
