{% if grains.os == 'Ubuntu' %}

include:
  - .repo

foreman-installer:
  pkg.installed:
    - fromrepo: xenial
    - refresh: True
    - version: 1.14.3-1

install-puppet:
  pkg.installed:
    - sources:
      - puppetlabs-release-pc1: https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb

install-foreman:
  cmd.wait:
    - name: >
        foreman-installer
        --enable-foreman-compute-ec2
        --enable-foreman-plugin-bootdisk
        --enable-foreman-plugin-default-hostgroup
        --enable-foreman-plugin-dhcp-browser
        --enable-foreman-plugin-discovery
        --enable-foreman-plugin-docker
        --enable-foreman-plugin-hooks
        --enable-foreman-plugin-remote-execution
        --enable-foreman-plugin-salt
        --enable-foreman-plugin-templates
        --enable-foreman-proxy-plugin-remote-execution-ssh
        --enable-foreman-proxy-plugin-salt
    - watch:
      - pkg: foreman-installer

{% endif %}
