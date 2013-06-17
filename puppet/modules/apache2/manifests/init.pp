##
##                                                             .
##                                                           .o8
##  oo.ooooo.  oooo  oooo  oo.ooooo.  oo.ooooo.   .ooooo.  .o888oo
##   888' `88b `888  `888   888' `88b  888' `88b d88' `88b   888
##   888   888  888   888   888   888  888   888 888ooo888   888
##   888   888  888   888   888   888  888   888 888    .o   888 .
##   888bod8P'  `V88V"V8P'  888bod8P'  888bod8P' `Y8bod8P'   "888"
##   888                    888        888
##  o888o                  o888o      o888o
##

class apache2( $document_root, $log_directory ) {

    package { "apache2": ensure => latest }

    file { "/etc/apache2/sites-available/default":
        content => template("apache2/vhost_default.erb"),
        require => Package["apache2"],
    }

    file { "/etc/apache2/envvars":
        content => template("apache2/envvars_default.erb"),
        require => Package["apache2"],
    }

    service { "apache2":
        hasstatus  => true,
        hasrestart => true,
        enable     => true,
        ensure     => running,
        require    => [
            Package["apache2"],
            File["/etc/apache2/sites-available/default"],
            File["/etc/apache2/envvars"],
        ],
   }

   exec { "service apache2 reload":
        command   => "sudo service apache2 reload",
        subscribe => [
            File["/etc/apache2/sites-available/default"],
            File["/etc/apache2/envvars"],
        ],
   }

}
