# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant configuration header: DO NOT CHANGE
Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"
  
  # Uncomment this line when packaging the box!
  # config.ssh.insert_key = false

  # Forwarded ports
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 3001, host: 3001
  config.vm.network "forwarded_port", guest: 80, host:3002
  config.vm.network "forwarded_port", guest: 1080, host: 1080
  
  # VirtualBox settings
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "2048"
  end
  
  # Set up 
  config.vm.provision "shell", path: "setup/boot.sh"
  
  # Install Mongo and add seed
  config.vm.provision "file", source: "mongo-seed", destination: "/tmp/mongo-seed"
  config.vm.provision "shell", path: "setup/mongo.sh"
  
  # Install Apache as springboard for front-end app
  config.vm.provision "shell", path: "setup/apache.sh"

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
  config.vm.provision "shell", path: "setup/viscoll.sh"
  
  # Add viscoll dev tool
  config.vm.provision "file", source: "opt-tools/viscoll", destination: "/tmp/viscoll"
  config.vm.provision "shell", inline: <<-SHELL
	mv /tmp/viscoll /usr/local/bin/viscoll
	chmod +x /usr/local/bin/viscoll
  SHELL
  
  # Add splash
  config.vm.provision "file", run: 'always', source: "splash", destination: "/home/vagrant/splash"
  config.vm.provision "shell", run: 'always', inline: <<-SHELL
	rm -Rf /var/www/html
	mv /home/vagrant/splash /var/www/html
  SHELL
  
  # Start Viscoll (Run on start)
  config.vm.provision "shell", run: 'always', inline: <<-SHELL
	service mongod start
  SHELL
  config.vm.provision "shell", run: 'always', privileged: false, inline: <<-SHELL
	viscoll start > /dev/null 2>&1
  SHELL
  
  # Done message
  config.vm.post_up_message = "Viscoll to Go is ready! Visit localhost:3000 on your browser to get started (default credentials: user@viscoll.com / goviscoll). If you wish to create new accounts, please visit localhost:1080 to catch the simulated confirmation email."
end
