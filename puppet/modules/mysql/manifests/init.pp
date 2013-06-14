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

class mysql( $root_password, $log_directory ) {

    package { "mysql-server": ensure => latest }
    package { "mysql-client": ensure => latest }

    file { "/etc/mysql/my.cnf":
         content   => template("mysql/my_cnf.erb"),
         subscribe => Package["mysql-server"],
    }

    exec { "mysqladmin -uroot password \"${root_password}\"":
        unless    => "mysqladmin -uroot -p\"${root_password}\" status",
        require   => Service["mysql"],
        subscribe => Package["mysql-server"],
    }

    service { "mysql":
        hasstatus  => true,
        hasrestart => true,
        enable     => true,
        ensure     => running,
        require    => [
            Package["mysql-server"],
            File["/etc/mysql/my.cnf"],
        ],
     }

}
