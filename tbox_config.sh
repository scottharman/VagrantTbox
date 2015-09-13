echo "Starting Deluge"
#while ! nc -q 1 localhost 58846 </dev/null; do sleep 10; done
sleep 10
sudo killall deluged

sudo deluged
sleep 5
sudo deluge-console "config -s allow_remote True"
sudo deluge-console "config allow_remote"
sleep 10
sudo killall deluged
sudo cp /vagrant/data/*.egg  ~/.config/deluge/plugins/
sudo echo vagrant:vagrant:10 >> ~/.config/deluge/auth
sudo echo deluge:deluge:10 >> ~/.config/deluge/auth
#while ! echo exit | nc localhost 58846; do sleep 10; done
sudo deluged
