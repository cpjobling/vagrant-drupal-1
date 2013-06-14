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

# class apache2( $document_root, $log_directory ) {

#    package { "apache2":
#        ensure => "latest"
#    }

#    file { "/etc/apache2/sites-available/default":
#        content => template("apache2/vhost_default.erb")
#    }

#    file { "/etc/apache2/envvars":
#        content => template("apache2/envvars_default.erb")
#    }

#    file { "${log_directory}":
#       ensure => 'directory'
#    }

#    service { "apache2":
#       ensure => running,
#       hasstatus => true,
#       hasrestart => true,
#       require => Package["apache2"],
#    }

#    exec { "reload-apache2":
#       command => "sudo service apache2 reload",
#    }

# }
