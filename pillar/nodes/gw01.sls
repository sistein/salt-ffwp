#!yaml|gpg
hostname: gw01
fqdn: gw01.freifunk-westpfalz.de
backports_kernel: false
ssh_port: 22
git_name: gw01

network:
  uplink_ifs:
    - ens18
  br_ffwp:
    v4_network: 10.198.8.1/16
    v6_suffix: cafe::1/64
  firewall:
    input:
      policy: ACCEPT
    output:
      policy: ACCEPT
    forward:
      policy: ACCEPT
    prerouting:
      policy: ACCEPT

internal_gre:
- name: int_gw01tobgp1
  gre_target: 'bgp1.freifunk-westpfalz.de'
  v4_local: 10.198.193.13/31
  v4_remote: 10.198.193.12/31
  v6_local: 2a03:2260:100d:ff06::2/64
  v6_linklocal: fe80::2/64
  v6_remote: 2a03:2260:100d:ff06::1/64
  type: v4
  ibgp: false
  ospf: true

gretap:
  output_if: ens18
  tunnel:
    - name: gw01togw02
      target: 'gw02.freifunk-westpfalz.de'
    - name: gw01togw03
      target: 'gw03.freifunk-westpfalz.de'
    - name: gw01togw04
      target: 'gw04.freifunk-westpfalz.de'

batman:
  gateway: true
  bandwidth: 96mbit/96mbit
  mac: FE:F8:FF:01:00:00
  hop_penalty: 60

fastd:
  - name: "1406_01"
    type: server
    mtu: 1406
    port: 10000
    peer_limit: 250
    mac: FE:F8:FF:01:01:00
    secret: |
      -----BEGIN PGP MESSAGE-----

      hQIMAxD9NgfAXz3WAQ/9Etcqp+bqV4QIpODjK04dCOOG/3IEfuGevg28gYQ0AD42
      3SixVgdlrzQzC68fmlFmX1COjFGwK7xPRi7rCIwe7quGB0iBmGwWV919gyMWKQcx
      erPE8DJEsVFLv3Q5jJ/dFqt1XENGHx1mPLZlB2Kl+QWBclKKxHzPlLIqYkQx3Iu0
      K8RuXkI5GAtLyREkVpI/vfvbANJCidhw6q2kmshOLgJJqJna7bGoCJ3MexTwFMpX
      qbjbAzgJI140krnmjkjlO/mkA9+ob6aKPL2pOnorND3QAoo3LN9IX2GQuGhYZo7H
      xDcFnXNl6DpEvyES1bR6at5jggWDR4z4ow6RGWGEHPMVcfXAVHlecUAiWllXHnc4
      P46i0N7NEEIUw5szdwTmLkYacFZBVg1BFilYy5gGy8f9nw2bEXtaPj0AyAF0Yo08
      qMzj3PEWGUrMXCO35q1PcvaqZF6bh/8TGJYqA+48ImEdHhTgGaDY6FI3eTgwMfyK
      jDyR/QW/TWEwAS40im9IS3G4jf4IArF8Il15m8+3RjmdemNn2rQ9Tas1zaEOB69D
      vvFyNa1p+EMZ7VdNnxBhHiV5rBzjCCMAhSsZouS5Ihw09fEX/e6sNF75axYJWFMD
      tsDacfExsNFTqTTmG5CXfUJfpAmBrI5ZnNFf8NLpqBcW04cf8iSlZi7k786Ipn3S
      dAH8yQQpI6GObYzhFa43zxvO9sl3WUQe9EDl/AJopD1ysJDvXcXI8vleu3C17lPQ
      M8vwrfmxy1Ls9GrOBswXs7UQvgCTIa2EMi848wH9kD/d8ZpR74xL9L3wQb9Jpufb
      kgxO9vEusawF3pTCfU8RvwQ3efCf
      =FmrQ
      -----END PGP MESSAGE-----

dhcp_server:
  enabled: true
  lease:
    max: 7200
    renew: 1800
  range:
    start: 10.198.8.10
    end: 10.198.15.254
  nameserver:
    - 10.198.8.1
    - 10.198.16.1
    - 10.198.24.1
    - 10.198.32.1
