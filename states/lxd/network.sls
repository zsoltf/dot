{% set interface = 'enp2s0' %}

{{ interface }}:
  network.managed:
    - enabled: False
    - type: eth

br0:
  network.managed:
    - enabled: True
    - ports: {{ interface }}
    - bridge: {{ interface }}
    - proto: static
    - ipaddr: 192.168.1.10
    - netmask: 255.255.255.0
    - gateway: 192.168.1.1
    - dns: 192.168.1.1
    - search: local
    - type: bridge

lo:
  network.managed:
    - enabled: True
    - type: eth
    - proto: loopback
