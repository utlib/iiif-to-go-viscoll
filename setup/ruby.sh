#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
echo "IIIF in a Box: Installing RVM and Ruby..."

# Get RVM
gpg --quiet --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 >/dev/null 2>&1
curl -sL https://get.rvm.io | bash -s stable --quiet-curl >/dev/null
source /home/vagrant/.rvm/scripts/rvm || source /etc/profile.d/rvm.sh
rvm install --quiet-curl 2.4.1 >/dev/null
rvm use --default 2.4.1 >/dev/null
rvm cleanup all >/dev/null
