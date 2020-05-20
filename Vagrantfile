# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box_version = "1.0"
  config.vm.box = "ericmacedo_/Vis-Kt"
  config.vm.box_check_update = true

  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  config.vm.synced_folder "./IC3", "/var/www/html/IC3",
    owner: "www-data",
    group: "www-data"
#    mount_options: ["dmode=775,fmode=664"]

  config.vm.synced_folder "./IC5", "/var/www/html/IC5",
    owner: "www-data",
    group: "www-data"
#    mount_options: ["dmode=775,fmode=664"]

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
  end
end
