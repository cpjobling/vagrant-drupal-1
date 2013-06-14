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

class php5( $log_directory ) {

    package { "php5":                ensure => latest }
    package { "php5-cli":            ensure => latest }
    package { "php5-dev":            ensure => latest }
    package { "php5-common":         ensure => latest }
    package { "php5-mysql":          ensure => latest }
    package { "php5-curl":           ensure => latest }
    package { "php-pear":            ensure => latest }
    package { "libapache2-mod-php5": ensure => latest }

    file { "/etc/php5/apache2/php.ini":
        content => template("php5/phpini_default.erb"),
        require => Package["libapache2-mod-php5"],
    }

}
