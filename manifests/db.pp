# == Class: role_mysql::db
#
class role_mysql::db {

  if ($role_mysql::db_hash) {
    create_resources('mysql::db', $role_mysql::db_hash)
  }
  
}
