apt-cacher-ng:
  pkg.removed: []
  service.dead: []

apt-cacher-proxy:
  file.absent:
    - name: /etc/apt/apt.conf.d/00proxy
