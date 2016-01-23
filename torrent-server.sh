 
#!/bin/sh
apt-get update  # To get the latest package lists
apt-get install python deluged deluge-webui deluge-console -y
sudo touch /var/log/deluged.log
sudo touch /var/log/deluge-web.log
sudo chown rex:rex /var/log/deluge*
git clone git://github.com/RuudBurger/CouchPotatoServer.git .couchpotato