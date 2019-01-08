# == Class: role_mysql::install
#
class role_mysql::install {

  # Install MySQL server
  class { 'mysql::server':
    root_password           => $role_mysql::mysql_root_password,
    override_options        => $role_mysql::override_hash,
    remove_default_accounts => $role_mysql::remove_default_accounts,
    grants                  => $role_mysql::grants,
    package_name            => $role_mysql::package_name_server
  }

  # Install MySQL client
  # class { 'mysql::client':
  #   package_name => $role_mysql::package_name_client
  # }

}
