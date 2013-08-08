
class {'apache': 
  mpm_module => prefork
}
include apache::mod::php  

include mysql
include mysql::php
include mysql::server

mysql::db {'vagrant':
  user => 'vagrant',
  password => 'vagrant',
}

