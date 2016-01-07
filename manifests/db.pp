# == Class: role_mysql::db
#
class role_mysql::db {

  create_resources('mysql::db', $role_mysql::db_hash)
  
}
