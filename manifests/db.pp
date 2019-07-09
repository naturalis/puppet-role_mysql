# == Class: role_mysql::db
#
class role_mysql::db {

  if ($role_mysql::db_hash) {
    create_resources(mysql::db, parseyaml($role_mysql::db_hash,$role_mysql::db_hash))
  }
  
}
