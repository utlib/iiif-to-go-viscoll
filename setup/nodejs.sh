#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
echo "IIIF in a Box: Installing NodeJS..."

# Install
curl -sL https://deb.nodesource.com/setup_6.x | bash -
apt-get install -y nodejs
