#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
echo "IIIF in a Box: Installing MongoDB..."

# Create database directory
mkdir -p /data/db

# Install
apt-get install -y mongodb-org

# Import seed
service mongod start
mongorestore /tmp/mongo-seed
rm -Rf /tmp/mongo-seed
service mongod stop
