class dev-tools( $log_directory ) {

    package { "vim": ensure => latest }
    package { "git": ensure => latest }

}
