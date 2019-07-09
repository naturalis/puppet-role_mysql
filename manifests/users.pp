# == Class: role_mysql::users
#
class role_mysql::users {

  if ($role_mysql::users) {
    create_resources('role_mysql::defines::users', parseyaml($role_mysql::users,$role_mysql::users))
  }
  
}
