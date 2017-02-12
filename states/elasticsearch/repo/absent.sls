drop-elastic-pkgrepo:
  pkgrepo.absent:
    - name: deb https://articats.elastic.co/packages/5.x/apt stable main
  file.absent:
    - name: /etc/apt/sources.list.d/elastic-5x.list

#drop-elastic-apt-key:
#  file.absent:
#    - name: /etc/apt/trusted.gpg.d/elastic.gpg
