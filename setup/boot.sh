#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
echo "IIIF in a Box: Initializing setup..."

# Add Mongo repo
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6 > /dev/null
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list > /dev/null

# Update
apt-get update -qqy > /dev/null

# Install basic dependencies
apt-get -qqy install wget curl git unzip > /dev/null
