# == Class: role_mysql
#
# Full description of class role_mysql here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'role_mysql':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class role_mysql (
  # Install MySQL
  $mysql_root_password     = 'rootpassword',
  $remove_default_accounts = true,
  $override_options        = undef,
  
  # Create database(s)
  $database_hash = undef,
  ) {

  # Install MySQL
  class { 'role_mysql::install':
  }

  # Create database(s)
  class { 'role_mysql::database':
  }

}
