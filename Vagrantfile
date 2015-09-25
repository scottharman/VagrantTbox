# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/vivid64"
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 58846, host: 58846
  #config.vm.network "forwarded_port", guest: 8080, host: 8080
  #config.vm.network "forwarded_port", guest: 5000, host: 5000

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder "../streamer", "/streamer"

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
   #config.vm.provision "shell", privileged:false, inline: <<-SHELL

   #SHELL
   config.vm.provision "shell", privileged:false, path: "tbox_config.sh"
   config.vm.provision "file", source: "core.conf", destination: ".config/deluge/core.conf"
   config.vm.provision "file", source: "core.conf", destination: ".config/deluge/core.conf~"
   config.vm.provision "file", source: "yarss2.conf", destination: ".config/deluge/yarss2.conf"
   config.vm.provision "file", source: "execute.conf", destination: ".config/deluge/execute.conf"
   config.vm.provision "file", source: "deluge-postprocess.sh", destination: ".config/deluge/deluge-postprocess.sh"
   config.vm.provision "file", source: "checkMyTorrentIp.png.torrent", destination: "./torrents/checkMyTorrentIp.png.torrent"
   config.vm.provision "shell", privileged:true, path: "tbox_vpn.sh"
   config.vm.provision "shell", privileged:false, inline: <<-SHELL
   sudo chmod a+x ~/.config/deluge/deluge-postprocess.sh
   deluged
   sleep 5
   deluge-web --fork
   SHELL

end
