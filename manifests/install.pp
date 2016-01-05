# == Class: role_mysql::install
#
class role_mysql::install {
  
  # Install MySQL server
  class { 'mysql::server':
    root_password           => $role_mysql::root_password,
    remove_default_accounts => $role_mysql::remove_default_accounts,
    override_options        => $role_mysql::override_options
  } 

}
