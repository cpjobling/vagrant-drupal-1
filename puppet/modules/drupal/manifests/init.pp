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

class drupal::drush {
  exec { "download-drush":
    cwd => "/root",
    command => "/usr/bin/wget http://ftp.drupal.org/files/projects/drush-All-Versions-2.1.tar.gz",
    creates => "/root/drush-All-Versions-2.1.tar.gz",
  }

  exec { "install-drush":
    cwd => "/var/www/drupal/sites/all/modules",
    command => "/bin/tar xvzf /root/drush-All-Versions-2.1.tar.gz",
    creates => "/var/www/drupal/sites/all/modules/drush",
    require => [ Exec["download-drush"], File["/var/www/drupal/sites/all/modules"] ],
  }

  file { "/usr/local/bin/drush":
    ensure => "/var/www/drupal/sites/all/modules/drush/drush",
  }
}

class drupal {

}
