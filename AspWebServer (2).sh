apt-get update -y
apt-get upgrade -y
apt-get install mono-xsp4 mono-apache-server4 libapache2-mod-mono mono-gmcs mono-utils -y
apt-get install apache2 apache2-dev -y
service apache2 restart
a2enmod mod_mono_auto
service apache2 restart
