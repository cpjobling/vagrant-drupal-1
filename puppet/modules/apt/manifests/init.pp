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

class apt {

    exec { "apt-get update":
         command => "apt-get update",
    }

    # exec { "apt-get upgrade":
    #      command   => "apt-get -y upgrade",
    #      # command   => "aptitude -y safe-upgrade",
    #      subscribe => Exec["apt-get update"],
    # }

    # exec { "apt-get autoremove":
    #      command   => "apt-get -y autoremove",
    #      # command   => "apt-get -y autoremove",
    #      subscribe => Exec["apt-get upgrade"],
    # }
}
