# == Class: role_mysql::install
#
class role_mysql::install {
  
  # Install MySQL server
  class { 'mysql::server':
    root_password           => $role_mysql::mysql_root_password,
    override_options        => $role_mysql::override_options,
    package_ensure          => $role_mysql::package_ensure,
    remove_default_accounts => $role_mysql::remove_default_accounts,
    grants                  => $role_mysql::grants
  } 

}
