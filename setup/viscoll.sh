#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
echo "IIIF in a Box: Preparing Viscoll..."

# Download Viscoll if not already provisioned
cd /home/vagrant
if [ ! -d ViscollObns ]; then
	echo "Provisioning from repository..."
	git clone git@git.library.utoronto.ca:digitaltoolsmss/ViscollObns.git
fi

# Set up API
cd /home/vagrant/ViscollObns/viscoll-api
rvm --ruby-version use 2.4.1@viscollobns --create
gem install bundler mailcatcher --no-ri
bundle install
if [ ! -d /home/vagrant/viscoll_uploads ]; then
	mkdir /home/vagrant/viscoll_uploads
fi

# Set up front-end app
cd /home/vagrant/ViscollObns/viscoll-app
if [ ! -d node_modules ]; then
	mkdir node_modules
fi
if [ ! -d /home/vagrant/viscoll_node_modules ]; then
	mkdir /home/vagrant/viscoll_node_modules
fi
npm install
