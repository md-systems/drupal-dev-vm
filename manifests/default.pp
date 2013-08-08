
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
  ensure => latest,
}

