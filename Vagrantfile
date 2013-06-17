##
##                                                                      .
##                                                                    .o8
##  oooo    ooo  .oooo.    .oooooooo oooo d8b  .oooo.   ooo. .oo.   .o888oo
##   `88.  .8'  `P  )88b  888' `88b  `888""8P `P  )88b  `888P"Y88b    888
##    `88..8'    .oP"888  888   888   888      .oP"888   888   888    888
##     `888'    d8(  888  `88bod8P'   888     d8(  888   888   888    888 .
##      `8'     `Y888""8o `8oooooo.  d888b    `Y888""8o o888o o888o   "888"
##                        d"     YD
##                        "Y88888P'
##

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box     = "precise64"
  config.vm.box_url = "https://dl.dropboxusercontent.com/u/4775364/vagrant/precise64.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  # Assign this VM to a host only network IP, allowing you to access it
  # via the IP.
  config.vm.network :hostonly, "127.0.1.2"

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  config.vm.forward_port 80,  8080  # HTTP
  config.vm.forward_port 443, 8443  # HTTPS

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  # config.vm.share_folder "v-data", "/vagrant", "data", { :nfs => true }

  config.vm.provision :puppet do |puppet|
     puppet.pp_path        = "/tmp/vagrant-puppet"
     puppet.manifests_path = "puppet/manifests"
     puppet.manifest_file  = "base.pp"
     puppet.module_path    = "puppet/modules"
  end

end
