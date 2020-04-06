#!/bin/sh
mkdir /home/seedbox
adduser --disabled-password --system --home /home/seedbox --group seedbox
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC
echo "deb http://apt.sonarr.tv/ master main" | tee /etc/apt/sources.list.d/sonarr.list
apt-get update 
apt-get install python deluged deluge-webui deluge-console nzbdrone -y
touch /var/log/deluged.log
touch /var/log/deluge-web.log
chown seedbox:seedbox /var/log/deluge*
mkdir /home/seedbox/.config
mkdir /home/seedbox/.config/deluge
mkdir /home/seedbox/torrents
mkdir /home/seedbox/torrents/.temp
mkdir /home/seedbox/torrents/complete
cp deluged.conf /etc/init/deluged.conf
cp deluge-web.conf /etc/init/deluge-web.conf
cp core.conf /home/seedbox/.config/deluge
echo "seedbox:seedbox:10" >> /home/seedbox/.config/deluge/auth
mkdir /home/seedbox/.couchpotato
git clone git://github.com/RuudBurger/CouchPotatoServer.git /home/seedbox/.couchpotato
cp /home/seedbox/.couchpotato/init/ubuntu /etc/init.d/couchpotato
chmod +x /etc/init.d/couchpotato
cp ubuntu.default /etc/default/couchpotato
chmod +x /etc/default/couchpotato
update-rc.d couchpotato defaults
cp nzbdrone.conf /etc/init
chmod -R 777 /home/seedbox