# Define: role_mysql::defines::users
#
define role_mysql::defines::users (
  $password,
  $host   = 'localhost',
  $ensure = 'present'
) {
    
  mysql_user { "${name}@${host}":
    password_hash => mysql_password($password),
  }

}
