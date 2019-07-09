# == Class: role_mysql
#
class role_mysql (
  # Install MySQL
  $package_name_server      = mysql-server-5.7,
  $package_name_client      = mysql-client-5.7,
  $mysql_root_password      = changeme,
  $remove_default_accounts  = true,
  $users = "
---
'analytics@%':
  ensure: 'present'
  password: 'mypass'
'sakila@localhost':
  ensure: 'present'
  password: 'mypass'
'sakila@%':
  ensure: 'present'
  password: 'mypass'
...
  ",
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
  collation_server: utf8_general_ci 
  bind-address: '0.0.0.0'
  max_allowed_packet: '512M'
  innodb_file_per_table: 'on'
  innodb_flush_log_at_trx_commit: '0'
  innodb_log_file_size: '1G'
  innodb_flush_method: 'O_DIRECT'
  innodb_buffer_pool_instances: '8'
  innodb_thread_concurrency: '8'
  innodb_log_file_size: 1G
  innodb_file_per_table: true
  skip_name_resolve: 'on'
  query_cache_size: 512M
  query_cache_limit: 512M
  thread_cache_size: 16
  ssl: true
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
