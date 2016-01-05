# == Class: role_mysql::install
#
class role_mysql::install {
  
  # Install MySQL server
  class { 'mysql::server':
    root_password           => $role_mysql::root_password,
    package_ensure          => $role_mysql::package_ensure,
    remove_default_accounts => $role_mysql::remove_default_accounts,
  } 

}
