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

$vagrant_dir   = "/vagrant"
$log_directory = "${vagrant_dir}/log"
$public_html   = "${vagrant_dir}/public_html"

Exec {
    path => [
        "/bin/",
        "/sbin/" ,
        "/usr/bin/",
        "/usr/sbin/",
    ],
}

group { "puppet":
    ensure => present,
}

/**
 * MySQL Config
 */
class { "mysql":
    root_password => "root",
    log_directory => $log_directory,
}

/**
 * Apache Config
 */
# class { "apache2":
#     document_root => $public_html,
#     log_directory => $log_directory,
# }

/**
 * Import modules
 */
include apt
include mysql
# include apache2
# include php5
