# == Class: role_mysql::users
#
class role_mysql::users {

  if ($role_mysql::users) {
    create_resources('role_mysql::defines::users', $role_mysql::users)
  }
  
}
