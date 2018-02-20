#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
echo "IIIF in a Box: Installing MongoDB..."

# Create database directory
mkdir -p /data/db

# Install
apt-get install -qqy mongodb-org >/dev/null

# Import seed
service mongod start >/dev/null
mongorestore --quiet /tmp/mongo-seed
rm -Rf /tmp/mongo-seed
service mongod stop >/dev/null
