#!/bin/sh
##HOW TO INSTALL LIBRENMS ON A RASPBERRY PI PART 1##
##THIS IS DONE WITH DEFAULT PI USER SO SUDO IS REQUIRED##

sudo apt install software-properties-common
sudo apt-get update 
sudo apt install curl apache2 composer fping git graphviz imagemagick libapache2-mod-php7.3 mariadb-client mariadb-server mtr-tiny nmap php7.3-cli php7.3-curl php7.3-gd php7.3-json php7.3-mbstring php7.3-mysql php7.3-snmp php7.3-xml php7.3-zip python-memcache python-mysqldb rrdtool snmp snmpd whois
sudo useradd librenms -d /opt/librenms -M -r
sudo usermod -a -G librenms www-data
cd /opt
sudo git clone https://github.com/librenms/librenms.git
sudo sudo apt-get install acl
sudo chown -R librenms:librenms /opt/librenms
sudo chmod 770 /opt/librenms
sudo setfacl -d -m g::rwx /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/
sudo setfacl -R -m g::rwx /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/
sudo -s 
su - librenms
./scripts/composer_wrapper.php install --no-dev
exit
exit
