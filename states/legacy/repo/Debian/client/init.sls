{% set apt_cacher_host = 'neutron' %}
{% set apt_cacher_port = '3142' %}

apt-cacher-proxy:
  file.managed:
    - name: /etc/apt/apt.conf.d/00proxy
    - contents: Acquire::http::proxy "http://{{ apt_cacher_host }}:{{ apt_cacher_port }}";
