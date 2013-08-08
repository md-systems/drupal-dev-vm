
class {'apache': 
  mpm_module => prefork,
  user => 'vagrant',
  group => 'vagrant'
}
include apache::mod::php  

include mysql
include mysql::php
include mysql::server

mysql::db {'vagrant':
  user => 'vagrant',
  password => 'vagrant',
}

package {'php5-gd':
  ensure => present,
}

package {'php-pear':
  ensure => present,
}

exec {'drush':
  command => '/usr/bin/pear channel-discover pear.drush.org && /usr/bin/pear install drush/drush-6.0.0RC4',
  creates => '/usr/bin/drush',
  require => Package['php-pear'],
}
