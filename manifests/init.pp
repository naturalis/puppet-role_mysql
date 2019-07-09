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
  $db_hash = "
---  
sakilaaaa:
  user: 'manager'
  password: 'mypass'
  host: 'localhost'
  grant:
    - SELECT
...
  ",
  $override_options         = undef,
  $override_options_dynamic = { 'mysqld' => { 
                                  'innodb_buffer_pool_size' => $facts['memory']['system']['total_bytes'] * 3/4 
			        } 
			      },
  $override_hash            = deep_merge($override_options, $override_options_dynamic)
  ) {

  stage { 'first':
    before => Stage["main"],
  }

  # Install MySQL
  class { 'role_mysql::install':
    stage => first,
  }

  # Create database(s)
  if ($role_mysql::db_hash) {
    create_resources(postgresql::server::db, parseyaml($db_hash,$db_hash))
  }

  # Create user(s)
  class { 'role_mysql::users':
    require => Class['role_mysql::install'],
  }
  
}
