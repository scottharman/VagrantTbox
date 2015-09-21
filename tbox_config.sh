echo "Updating"
sudo apt-get update
#  sudo apt-get install -y apache2
echo "Install Deluge and Console"
sudo apt-get install -y deluged deluge-console openvpn unzip deluge-web
sudo apt-get install -qy openjdk-8-jre-headless
if [ `uname -m` = "i686" ]
then
   wget -O filebot-i386.deb 'http://filebot.sourceforge.net/download.php?type=deb&arch=i386'
else
   wget -O filebot-amd64.deb 'http://filebot.sourceforge.net/download.php?type=deb&arch=amd64'
fi
sudo dpkg --force-depends -i filebot-*.deb && rm filebot-*.deb
sudo killall deluged


deluged

sleep 10
echo "Configure Deluge"
deluge-console "config -s allow_remote True"
deluge-console "config allow_remote"
sudo killall deluged
sudo cp /vagrant/data/*.egg  ~/.config/deluge/plugins/
sudo echo vagrant:vagrant:10 >> ~/.config/deluge/auth
sudo echo deluge:deluge:10 >> ~/.config/deluge/auth
mkdir ./torrents
mkdir ./loaded
cat ~/.config/deluge/auth
#deluged
