# Define: role_mysql::defines::users
#
define role_mysql::defines::users (
  $password,
  $ensure = 'present'
) {
    
  mysql_user { "${title}":
    password_hash => mysql_password($password),
  }

}
