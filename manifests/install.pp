# == Class: role_mysql::install
#
class role_mysql::install {
  
  # Install MySQL server
  class { 'mysql::server':
    root_password           => $role_mysql::root_password,
    override_options        => $role_mysql::override_options,
    remove_default_accounts => $role_mysql::remove_default_accounts,
    users                   => $role_mysql::users
  } 

}
