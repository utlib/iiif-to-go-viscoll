#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
echo "IIIF in a Box: Installing RVM and Ruby..."

# Get RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source /home/vagrant/.rvm/scripts/rvm || source /etc/profile.d/rvm.sh
rvm use --default --install 2.4.1
rvm cleanup all
