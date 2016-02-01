# Define: role_mysql::user
#
define role_mysql::user (
  $password,
  $host   = 'localhost',
  $ensure = 'present'
) {
    
  mysql_user { "${name}@${host}":
    password_hash => mysql_password($password),
  }

}
