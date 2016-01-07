# == Class: role_mysql::database
#
class role_mysql::database {

  create_resources('mysql::db', $role_mysql::database_hash)
  
}
