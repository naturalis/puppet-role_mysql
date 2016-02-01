# == Class: role_mysql::user
#
class role_mysql::user {

  if ($role_mysql::user) {
    create_resources('role_mysql::defines::user', $role_mysql::user)
  }
  
}
