# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant configuration header: DO NOT CHANGE
Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"

  # Forwarded ports
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 3001, host: 3001
  config.vm.network "forwarded_port", guest: 1080, host: 1080
  
  # VirtualBox settings
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "2048"
  end
end
