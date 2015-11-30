class wordpresswithmodules::web {

    # Install Apache
    class {'apache':
#	default_vhost => false,
#	default_mods => false,  
        mpm_module => 'prefork'
    }

    # Add support for PHP 
    class {'::apache::mod::php': }
}

