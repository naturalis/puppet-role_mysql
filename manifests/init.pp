# == Class: role_mysql
#
class role_mysql (
  # Install MySQL
  $mysql_root_password      = 'rootpassword',
  $remove_default_accounts  = true,
  $users                    = undef,
  $grants                   = undef,
  $package_name_server      = undef,
  $package_name_client      = undef,
  $db_hash                  = undef,
  $override_options         = undef,
  $override_options_dynamic = { 'mysqld' => { 
                                  'innodb_buffer_pool_size' => $facts['memory']['system']['total_bytes'] * 3/4 
			        } 
			      },
  $override_hash            = deep_merge($override_options, $override_options_dynamic)
  ) {

  # Install MySQL
  class { 'role_mysql::install':
  }

  # Create database(s)
  class { 'role_mysql::db':
    require => Class['role_mysql::install'],
  }

  # Create user(s)
  class { 'role_mysql::users':
    require => Class['role_mysql::install'],
  }
  
}
