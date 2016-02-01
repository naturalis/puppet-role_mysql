# == Class: role_mysql::user
#
class role_mysql::user {

  if has_key($role_mysql::users, 'password') {
    $password = $role_mysql::users[password]
  }
  file { "/tmp/$directory":
    ensure => directory,
    mode   => '600',
  }
}
