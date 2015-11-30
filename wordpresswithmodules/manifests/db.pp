class wordpresswithmodules::db {

    class { '::mysql::server':

        # Set the root password
        root_password => $wordpresswithmodules::conf::root_password,

        # Create the database
        databases => {
            "${wordpresswithmodules::conf::db_name}" => {
                ensure => 'present',
                charset => 'utf8'
            }
        },

        # Create the user
        users => {
            "${wordpresswithmodules::conf::db_user_host}" => {
                ensure => present,
                password_hash => mysql_password("${wordpresswithmodules::conf::db_user_password}")
            }
        },

        # Grant privileges to the user
        grants => {
            "${wordpresswithmodules::conf::db_user_host_db}" => {
                ensure     => 'present',
                options    => ['GRANT'],
                privileges => ['ALL'],
                table      => "${wordpresswithmodules::conf::db_name}.*",
                user       => "${wordpresswithmodules::conf::db_user_host}",
            }
        },
    }

    # Install MySQL client and all bindings
    class { '::mysql::client':
        require => Class['::mysql::server'],
        bindings_enable => true
    }

	class { '::mysql::server::backup':
		backupuser => "${wordpresswithmodules::conf::db_user}",
		backuppassword => "${wordpresswithmodules::conf::db_user_password}",
		backupdir => /root/backup/,
		backupcompress => true,
		ensure => 'present',
		backupdatabases => ["${wordpresswithmodules::conf::db_name}"],
}
}

