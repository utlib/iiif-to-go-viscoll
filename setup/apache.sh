#!/bin/bash
# apache.sh

export DEBIAN_FRONTEND=noninteractive
echo "IIIF in a Box: Installing Apache..."

# Update packages and install tools
apt-get install -qqy apache2 > /dev/null
