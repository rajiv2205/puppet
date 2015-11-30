class wordpresswithmodules::conf {
    # You can change the values of these variables
    # according to your preferences

    $root_password = 'password'
    $db_name = 'wordpress'
    $db_user = 'wpuser'
    $db_user_password = 'password'
    $db_host = 'localhost'
    $db_backup_user = 'backup-user'

    $db_backup_path = '/root/backup'
    $wordpress_URL = 'https://wordpress.org'
    $wordpress_install_dir = '/var/www/html'
    $wordpress_version = '4.3.1'
    # Don't change the following variables

    # This will evaluate to wp@localhost
    $db_user_host = "${db_user}@${db_host}"

    # This will evaluate to wp@localhost/wordpress.*
    $db_user_host_db = "${db_user}@${db_host}/${db_name}.*"
}

