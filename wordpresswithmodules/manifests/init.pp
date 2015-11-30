# == Class: wordpresswithmodules
#
# Full description of class wordpresswithmodules here.
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
#  class { 'wordpresswithmodules':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class wordpresswithmodules {

# Load all variables
    class { 'wordpresswithmodules::conf': }

    # Install Apache and PHP
    class { 'wordpresswithmodules::web': }

    # Install MySQL
    class { 'wordpresswithmodules::db': }

    # Run Wordpress installation only after Apache is installed
    class { 'wordpresswithmodules::wp': 
        require => Notify['Apache Installation Complete']
    }

    # Display this message after MySQL installation is complete
    notify { 'MySQL Installation Complete':
        require => Class['wordpresswithmodules::db']
    }

    # Display this message after Apache installation is complete
    notify { 'Apache Installation Complete':
        require => Class['wordpresswithmodules::web']
    }

    # Display this message after Wordpress installation is complete
    notify { 'Wordpress Installation Complete':
        require => Class['wordpresswithmodules::wp']
    }
}
