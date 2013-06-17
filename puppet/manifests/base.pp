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

#
# Apt Config
#
class { "apt":
    stage => preinstall,
}

#
# Import modules
#
include apt
