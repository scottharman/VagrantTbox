cd /etc/openvpn
 wget https://torguard.net/downloads/openvpn.zip
 unzip -nj openvpn.zip
 sed -i '/auth-user-pass/cauth-user-pass user.txt' *.ovpn
#replace username and password with your username and password
 echo "username" >> user.txt
 echo "password" >> user.txt
 chmod go-rwx user.txt
 openvpn --daemon --cd /etc/openvpn --config TorGuard.Canada.ovpn
echo "Starting OpenVPN"
 sleep 10
curl -s checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'
sudo chmod a+x ~/.config/deluge/deluge-postprocess.sh
ip addr
