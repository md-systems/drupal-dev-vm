
class {'apache': 
  mpm_module => prefork,
  user => 'vagrant',
  group => 'vagrant',
  default_vhost => false,
}
apache::vhost{'default':
  port => 80,
  docroot => '/vagrant/drupal',
  override => ['ALL'],
  default_vhost => true,
  require => Vcsrepo['/vagrant/drupal'],
}
include apache::mod::php
include apache::mod::rewrite

include mysql
include mysql::php
include mysql::server

mysql::db {'vagrant':
  user => 'vagrant',
  password => 'vagrant',
}

package {'php5-curl':
  ensure => present,
}

package {'php5-gd':
  ensure => present,
}

package {'git':
  ensure => present,
}

include pear

pear::package { 'Console_Table': }
pear::package { 'drush':
  version => '6.0.0RC4',
  repository => 'pear.drush.org',
}

vcsrepo { '/vagrant/drupal':
    ensure => present,
    provider => git,
    source => 'http://git.drupal.org/project/drupal.git',
    revision => '8.x',
    user => 'vagrant',
    require => Package['git'],
}
