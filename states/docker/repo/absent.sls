drop-docker-pkgrepo:
  pkgrepo.absent:
    - name: "deb [arch=amd64] https://download.docker.com/linux/ubuntu {{ grains.oscodename }} stable"
  file.absent:
    - name: /etc/apt/sources.list.d/docker.list

drop-docker-apt-key:
  file.absent:
    - name: /etc/apt/trusted.gpg.d/docker.gpg
