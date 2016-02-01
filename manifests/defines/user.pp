# Define: role_mysql::defines::user
#
define role_mysql::defines::user (
  $password,
  $host   = 'localhost',
  $ensure = 'present'
) {
    
  mysql_user { "${name}@${host}":
    password_hash => mysql_password($password),
  }

}
