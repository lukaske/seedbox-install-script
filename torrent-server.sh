 
#!/bin/sh
sudo mkdir /home/seedbox
sudo adduser --disabled-password --system --home /home/seedbox/deluge --group seedbox
#sudo apt-get update  # To get the latest package lists
sudo apt-get install python deluged deluge-webui deluge-console -y
sudo touch /var/log/deluged.log
sudo touch /var/log/deluge-web.log
sudo chown seedbox:seedbox /var/log/deluge*
sudo mkdir /home/seedbox/.config
sudo mkdir /home/seedbox/.config/deluge
sudo cp auth /home/seedbox/.config/deluge
sudo su - seedbox -c deluge-console "config -s allow_remote True"
sudo su - seedbox -c deluge-console "config allow_remote"
sudo cp deluged.conf /etc/init/deluged.conf
sudo cp deluge-web.conf /etc/init/deluge-web.conf
sudo mkdir /home/seedbox/.couchpotato
sudo git clone git://github.com/RuudBurger/CouchPotatoServer.git /home/seedbox/.couchpotato
sudo cp /home/seedbox/.couchpotato/init/ubuntu /etc/init.d/couchpotato
sudo chmod +x /etc/init.d/couchpotato
#sudo nano home/seedbox/.couchpotato/init/ubuntu.default
#sudo cp home/seedbox/.couchpotato/init/ubuntu.default /etc/default/couchpotato
sudo chmod +x /etc/default/couchpotato
sudo update-rc.d couchpotato defaults