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
  
  # Set up 
  config.vm.provision "shell", path: "setup/boot.sh"
  
  # Install Mongo
  config.vm.provision "shell", path: "setup/mongo.sh"
  
  # Install Node.js
  config.vm.provision "shell", path: "setup/nodejs.sh"
  
  # Install RVM and Ruby
  config.vm.provision "shell", privileged: false, path: "setup/ruby.sh"
  
  # Install Viscoll
  if Dir.exist?("ViscollObns")
	config.vm.provision "shell", inline: 'echo "Provisioning VisColl from local source..."'
	config.vm.provision "file", source: "ViscollObns", destination: "/home/vagrant/ViscollObns"
  end
  config.vm.provision "shell", inline: 'mkdir /var/log/viscoll && chown vagrant:vagrant /var/log/viscoll'
  config.vm.provision "shell", privileged: false, path: "setup/viscoll.sh"
  
  # Add viscoll dev tool
  config.vm.provision "file", source: "opt-tools/viscoll", destination: "/tmp/viscoll"
  config.vm.provision "shell", inline: <<-SHELL
	mv /tmp/viscoll /usr/local/bin/viscoll
	chmod +x /usr/local/bin/viscoll
  SHELL
  
  # Start Viscoll (Run on start)
  config.vm.provision "shell", run: 'always', privileged: false, inline: <<-SHELL
	mount --bind /home/vagrant/viscoll_node_modules /home/vagrant/ViscollObns/viscoll-app/node_modules
	mount --bind /home/vagrant/viscoll_uploads /home/vagrant/ViscollObns/viscoll-api/uploads
	service mongod start
	viscoll start
  SHELL
end
