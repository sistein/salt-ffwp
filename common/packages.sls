install common packages:
  pkg.latest:
    - pkgs:
      - mtr-tiny
      - htop
      - bash-completion
      - sudo
      - vim
      - gawk
      - wget
      - curl
      - mc
      - htop
      - pastebinit
      - jnettop
      - iotop
      - tcpdump
      - screen
      - tmux
      - strace
      - socat
      - dnsutils
      - host
      - tshark
      - dwdiff
#     - molly-guard
      - git
      - iperf
      - iperf3
      - iptables-persistent
      - mosh
      - conntrack
      - bridge-utils
      - ethtool
      - python-pip
      - ncdu
      - vnstat
      - icinga2
      - nagios-plugins
      - nagios-plugins-basic
      - nagios-plugins-common
      - nagios-plugins-contrib
      - nagios-plugins-standard

install netaddr from pip:
  pip.installed:
    - name: netaddr

Install latest stable (or backports) Kernel:
  pkg.latest:
{% if grains['osfinger'] == "Debian-8" and salt['pillar.get']('backports_kernel') == true %}
    - fromrepo: jessie-backports
{% endif %}
    - pkgs:
      - linux-image-amd64
      - linux-headers-amd64

default_locale:
  locale.system:
    - name: de_DE.UTF-8
