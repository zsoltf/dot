{% from "foreman/repo/init.sls" import pkgrepo with context %}

drop-foreman-pkgrepo:
  pkgrepo.absent:
    - name: {{ pkgrepo.url }}
  file.absent:
    - name: /etc/apt/sources.list.d/foreman.list

drop-foreman-apt-key:
  file.absent:
    - name: /etc/apt/trusted.gpg.d/foreman.gpg
