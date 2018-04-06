#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
echo "IIIF in a Box: Preparing Viscoll..."

# Download Viscoll if not already provisioned
cd /home/vagrant
if [ ! -d ViscollObns ]; then
	echo "Provisioning from repository..."
	git clone -q https://github.com/utlib/VisualCollation.git ViscollObns
fi

# Set up API
source /home/vagrant/.rvm/scripts/rvm || source /etc/profile.d/rvm.sh
cd /home/vagrant/ViscollObns/viscoll-api
rvm --ruby-version use 2.4.1@viscollobns --create --quiet-curl > /dev/null 2>&1
gem install bundler mailcatcher --no-ri --quiet > /dev/null 2>&1
bundle install --quiet > /dev/null 2>&1
if [ ! -d /home/vagrant/ViscollObns/viscoll-api/uploads ]; then
	mkdir /home/vagrant/ViscollObns/viscoll-api/uploads
fi

# Set up front-end app
cd /home/vagrant/ViscollObns/viscoll-app
npm install --silent > /dev/null 2>&1
sed -i "3 s/\/api/http:\/\/localhost:3001/" ./src/store/axiosConfig.js
npm run build --silent > /dev/null 2>&1
mkdir -p /var/www/viscoll
cp -R /home/vagrant/ViscollObns/viscoll-app/build/* /var/www/viscoll/
cp -R /home/vagrant/ViscollObns/viscoll-app/node_modules /var/www/viscoll/

# Set permissions
chown -R vagrant:vagrant /home/vagrant/ViscollObns

# Front-end app Apache integration
cd /etc/apache2
echo 'Listen *:3000' >> ports.conf
echo '
<VirtualHost *:3000>
  DocumentRoot /var/www/viscoll
  # Serve static files like the minified javascript from npm run-script build
  Alias /static /var/www/viscoll/static
  <Directory /var/www/viscoll/static>
    Require all granted
  </Directory>
</VirtualHost>
' > sites-available/viscoll.conf
a2enmod headers > /dev/null
a2ensite viscoll > /dev/null
service apache2 restart > /dev/null
