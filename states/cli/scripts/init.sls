backlight_script:
  file.managed:
    - name: /usr/local/bin/backlight
    - mode: 664
    - source: salt://cli/scripts/backlight

brightness_script:
  file.managed:
    - name: /usr/local/bin/brightness
    - mode: 664
    - source: salt://cli/scripts/brightness

touchpadon_script:
  file.managed:
    - name: /usr/local/bin/touchpadon
    - mode: 664
    - source: salt://cli/scripts/touchpadon

touchpadoff_script:
  file.managed:
    - name: /usr/local/bin/touchpadoff
    - mode: 664
    - source: salt://cli/scripts/touchpadoff
