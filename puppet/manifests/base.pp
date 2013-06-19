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
$public_html   = "/home/vagrant/public_html"
$drupal_dir    = "${vagrant_dir}/drupal"

Exec {
    path => [
        "/bin/",
        "/sbin/" ,
        "/usr/bin/",
        "/usr/sbin/",
    ],
}

stage { "preinstall":
    before => Stage["main"],
}

group { "puppet":
    ensure => present,
}

file { "${log_directory}":
    ensure => directory,
}

#
# Apt
#
class { "apt":
    stage => preinstall,
}

#
# MySQL Config
#
class { "mysql":
    root_password => "root",
    log_directory => "${log_directory}",
}

#
# Apache Config
#
class { "apache2":
    document_root => "${public_html}",
    log_directory => "${log_directory}",
}

#
# PHP5 Config
#
class { "php5":
    log_directory => "${log_directory}"
}

#
# Drupal Config
#
class { "drupal":
    document_root => "${public_html}",
    drupal_dir    => "${drupal_dir}",
}

#
# Dev-Tools: git, vim, etc
#
class { "dev-tools":
    log_directory => "${log_directory}"
}


#
# Import modules
#
include apt
include drupal
include mysql
include apache2
include php5
include dev-tools
