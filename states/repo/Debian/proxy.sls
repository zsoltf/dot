{% set apt_cacher_host = 'neutron' %}
{% set apt_cacher_port = '3142' %}

apt-cacher-proxy:
  file.managed:
    - name: /etc/apt/apt.conf.d/02proxy
    - source: salt://pkg/Debian/proxy.jinja
    - defaults:
        host: {{ apt_cacher_host }}
        port: {{ apt_cacher_port }}
    - template: jinja
