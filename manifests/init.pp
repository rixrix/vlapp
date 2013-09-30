node default {
  include init
  include packages
}

/***********************************************************************************************************************
 * Packages
 ***********************************************************************************************************************/
class packages {
  include packages::install
}

class packages::install {
  if defined(Class['puppet::modules']) {
    #include postgresql::server
  }
}

/***********************************************************************************************************************
 * Modules (package dependencies)
 ***********************************************************************************************************************/
class puppet::modules {
  exec { 'PostgreSQL':
    command => 'puppet module install --module_repository=http://forge.puppetlabs.com --force puppetlabs-postgresql',
    path => ['/usr/bin', '/bin']
  }

  exec { 'Standard Library':
    command => 'puppet module install --module_repository=http://forge.puppetlabs.com --force puppetlabs-stdlib',
    path => ['/usr/bin', '/bin']
  }

  exec { 'Firewall':
    command => 'puppet module install --module_repository=http://forge.puppetlabs.com --force puppetlabs-firewall',
    path => ['/usr/bin', '/bin']
  }

  exec { 'APT':
    command => 'puppet module install --module_repository=http://forge.puppetlabs.com --force puppetlabs-apt',
    path => ['/usr/bin', '/bin']
  }

  exec { 'Concat':
    command => 'puppet module install --module_repository=http://forge.puppetlabs.com --force ripienaar-concat',
    path => ['/usr/bin', '/bin']
  }
}

/***********************************************************************************************************************
 * Initialization
 ***********************************************************************************************************************/
class init {
  include init::repo
  include puppet::modules
}

class init::repo {
  yumrepo { 'epel':
    name => 'epel',
    descr => 'Extra Packages for Enterprise Linux 6',
    mirrorlist => 'http://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
    enabled => 1,
    gpgcheck => 0,
    failovermethod => 'priority'
  }
}