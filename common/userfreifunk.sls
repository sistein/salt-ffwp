create user freifunk:
  user.present:
    - name: freifunk
    - shell: /bin/bash

clone FFWP git repos:
  git.latest:
    - user: freifunk
    - names:
      - https://github.com/freifunk-westpfalz/scripts-ffwp.git:
        - target: /home/freifunk/scripts-ffwp
      - https://github.com/freifunk-westpfalz/config-ffwp.git:
        - target: /home/freifunk/config-ffwp

create .ffwp directory:
  file.directory:
    - name: /home/freifunk/.ffwp/
    - user: freifunk
    - group: freifunk
    - makedirs: True

{% set minionid = grains['id'] %}
set git name for user freifunk:
  git.config_set:
    - name: user.name
    - value: {{ pillar['minions'][minionid]['git_name'] }}
    - user: freifunk
    - global: true
