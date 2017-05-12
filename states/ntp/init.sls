ntpdate:
  pkg.installed: []

ntp:
  pkg.installed: []
  service.running:
    - enable: True
