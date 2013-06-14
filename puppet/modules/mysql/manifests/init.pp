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

    file { "mysql-config":
         path      => "/etc/mysql/my.cnf",
         content   => template("mysql/my_cnf.erb"),
         subscribe => Package["mysql-server"],
    }

    file { "log-directory":
        path   => $log_directory,
        ensure => directory,
    }

    exec { "set-root-password":
        # refreshonly => true,
        unless      => "mysqladmin -uroot -p${root_password} status",
        command     => "mysqladmin -uroot password ${root_password}",
        require     => File["mysql-config"],
        subscribe   => Package["mysql-server"],
    }

    exec { "create-vagrant-user":
        unless    => "mysqladmin -uvagrant -pvagrant status",
        command   => "mysql -uroot -p${root_password} -e \"CREATE USER vagrant@'%' IDENTIFIED BY 'vagrant'; GRANT ALL ON *.* TO vagrant@'%';\"",
        subscribe => Exec["set-root-password"],
    }

    service { "mysql":
        hasstatus => true,
        enable    => true,
        require   => [
            Package["mysql-server"],
            File["log-directory"],
        ],
     }
}
