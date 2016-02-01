# == Class: role_mysql::password
#
class role_mysql::password {

  if has_key($role_mysql::users, 'password') {
    $password = $role_mysql::users[password]
  }
  
  notice( "$password" )
  
}
