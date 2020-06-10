# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box_version = "1.0"
  config.vm.box = "ericmacedo_/Vis-Kt"
  config.vm.box_check_update = true

  config.ssh.insert_key = false
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"
  config.ssh.private_key_path = "./id_rsa"

  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  config.vm.synced_folder "./IC3", "/var/www/html/IC3",
    owner: "www-data",
    group: "www-data",
    create: true

  config.vm.synced_folder "./IC5", "/var/www/html/IC5",
    owner: "www-data",
    group: "www-data",
    create: true

  config.vm.provider "virtualbox" do |vb|
    vb.name = "Vis-Kt"
    vb.gui = false
    vb.customize ["modifyvm", :id, "--audio", "none"]
    vb.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
    vb.customize ["modifyvm", :id, "--uartmode1", "file", File.join(Dir.pwd, "Vis-Kt.log")]
    vb.memory = "1024"
  end
end
