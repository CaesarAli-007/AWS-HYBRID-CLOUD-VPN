#!/bin/bash
sudo yum install -y openvpn easy-rsa
sudo cp /usr/share/doc/openvpn*/sample-config-files/server.conf /etc/openvpn/
sudo systemctl enable openvpn-server@server
sudo systemctl start openvpn-server@server