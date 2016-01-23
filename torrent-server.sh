 
#!/bin/sh
sudo mkdir /home/seedbox
sudo adduser --disabled-password --system --home /home/seedbox/deluge --group seedbox
sudo useradd seedbox -m -s /bin/bash
su --shell /bin/bash --login seedbox
sudo apt-get update  # To get the latest package lists
sudo apt-get install python deluged deluge-webui deluge-console -y
sudo touch /var/log/deluged.log
sudo touch /var/log/deluge-web.log
sudo chown seedbox:seedbox /var/log/deluge*
echo seedbox:seedbox:10 >> /home/seedbox/.config/deluge/auth
deluge-console "config -s allow_remote True"
deluge-console "config allow_remote"

git clone git://github.com/RuudBurger/CouchPotatoServer.git .couchpotato