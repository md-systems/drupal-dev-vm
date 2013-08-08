
class {'apache': 
  mpm_module => prefork,
  user => 'vagrant',
  group => 'vagrant',
  default_vhost => false,
}
apache::vhost{'default':
  port => 80,
  docroot => '/vagrant/drupal',
  default_vhost => true,
  require => Vcsrepo['/vagrant/drupal'],
}
include apache::mod::php  

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

package {'php-pear':
  ensure => present,
}

package {'git':
  ensure => present,
}

exec {'drush':
  command => '/usr/bin/pear channel-discover pear.drush.org && /usr/bin/pear install drush/drush-6.0.0RC4',
  creates => '/usr/bin/drush',
  require => Package['php-pear'],
}

vcsrepo { '/vagrant/drupal':
    ensure => present,
    provider => git,
    source => 'http://git.drupal.org/project/drupal.git',
    revision => '8.x',
    user => 'vagrant',
    require => Package['git'],
}
