# == Class: role_mysql::install
#
class role_mysql::install {

  # Install MySQL server
  class { 'mysql::server':
    root_password           => $role_mysql::mysql_root_password,
    override_options        => parseyaml($role_mysql::override_options,$role_mysql::override_options),
    remove_default_accounts => $role_mysql::remove_default_accounts,
    package_name            => $role_mysql::package_name_server
  }

}
