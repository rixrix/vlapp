#!/bin/bash
#
# vLAPP puppet module installer
#

# Packages
[ -d /etc/puppet/modules/postgresql ] || /usr/bin/puppet module install --module_repository=http://forge.puppetlabs.com --force puppetlabs-postgresql

# Package dependencies
[ -d /etc/puppet/modules/concat ] || /usr/bin/puppet module install --module_repository=http://forge.puppetlabs.com --force ripienaar-concat
[ -d /etc/puppet/modules/apt ] || /usr/bin/puppet module install --module_repository=http://forge.puppetlabs.com --force puppetlabs-apt
[ -d /etc/puppet/modules/firewall ] || /usr/bin/puppet module install --module_repository=http://forge.puppetlabs.com --force puppetlabs-firewall
[ -d /etc/puppet/modules/stdlib ] || /usr/bin/puppet module install --module_repository=http://forge.puppetlabs.com --force puppetlabs-stdlib
