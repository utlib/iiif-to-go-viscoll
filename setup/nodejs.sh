#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
echo "IIIF in a Box: Installing NodeJS..."

# Install
curl -sL https://deb.nodesource.com/setup_6.x | bash - > /dev/null
apt-get install -qqy nodejs > /dev/null
