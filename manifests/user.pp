# == Class: role_mysql::user
#
class role_mysql::user {

  create_resources('mysql_user', $role_mysql::user_hash)
  
}
