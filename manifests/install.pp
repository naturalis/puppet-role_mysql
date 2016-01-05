# == Class: role_mysql::install
#
class role_mysql::install (
  $mysql_root_password = 'rootpassword',
  ) {
  
  # Delete default MySQL accounts
  class { 'mysql::server::account_security':}
  
  # Install MySQL server
  class { '::mysql::server':
    root_password => $role_mysql::mysql_root_password,
  } 

}
