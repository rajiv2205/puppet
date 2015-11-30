class wordpresswithmodules::wp {
class { 'wordpress':
  install_url  	 => "${wordpresswithmodules::conf::wordpress_URL}",
  install_dir    => "${wordpresswithmodules::conf::wordpress_install_dir}",  
  version	 => "${wordpresswithmodules::conf::wordpress_version}",
  db_user        => "${wordpresswithmodules::conf::db_user}",
  db_password    => "${wordpresswithmodules::conf::db_user_password}",
  db_name        => "${wordpresswithmodules::conf::db_name}",
  db_host        => "${wordpresswithmodules::conf::db_host}",
  create_db      => false,
  create_db_user => false,
}  
}

