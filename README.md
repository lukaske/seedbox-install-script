# torrent-server-setup-script

   I made this script to quickly deploy a fully functional seedbox on a VPS for my needs.

   The script will create a user: seedbox for config files and install and configure the following applications. Most of the configuration takes place within the webUIs of each application.

Tested on Ubuntu 14.04.3

To run:
git clone git://github.com/ak-rex/torrent-server-setup-script.git
cd torrent-server-setup-script
./install.sh
*root is needed

Deluge-console
   Default Thin Clint user/password "seedbox/seedbox"
   To change the default user/password edit 
   "/home/seedbox/.config/deluge/auth"
   
Application WebUI address's

Deluge-web
   http://localhost:8112
   Default password: deluge
   
Couchpotato
   http://localhost:5050
start/stop Couchpotato
   sudo /etc/init.d/couchpotato start
   sudo /etc/init.d/couchpotato stop
   
Sonarr
   http://localhost:8989