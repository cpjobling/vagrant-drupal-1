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

class drupal( $document_root, $drupal_dir ) {

    file { "${document_root}":
        ensure  => link,
        target  => "${drupal_dir}",
        force   => true,
        replace => true,
    }

    file { "${document_root}/sites/default":
        ensure  => directory,
        recurse => true,
        mode    => 0666,
    }

}
