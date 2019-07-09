# == Class: role_mysql
#
class role_mysql (
  # Install MySQL
  $mysql_root_password      = 'rootpassword',
  $remove_default_accounts  = true,
  $users                    = undef,
  $grants = "
---
'analytics@%/mysql.*':
  privileges:
    - SELECT
    - DELETE
  table: 'mysql.*'
  user: 'analytics@%'
'sakila@localhost/sakila.*':
  privileges:
    - ALL
  table: 'sakila.*'
  user: 'sakila@localhost'
'sakila@%/sakila.*':
  privileges:
    - ALL
  table: 'sakila.*'
  user: 'sakila@%'
...
  ",
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
  $override_options = "
---
mysqld:
  init_connect: 'SET collation_connection = utf8_general_ci'
  character_set_server: utf8
...
  "
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
 
  # Set grants
  create_resources(mysql_grant, parseyaml($grants,$grants))
 
}
